#include <xc.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include "mcc_generated_files/system/system.h"
#include "mcc_generated_files/dma/dma.h"
#include "mcc_generated_files/adc/adc1.h"
#include "mcc_generated_files/timer/sccp1.h"
#include "mcc_generated_files/timer/tmr1.h"
#include "mcc_generated_files/timer/tmr2.h"
#include "mcc_generated_files/uart/uart1.h"

#define FCY 200000000UL
#include <libpic30.h>

#define NUM_SUBCARRIERS        4
#define SYMBOLS_PER_BUFFER     1
#define BITS_PER_SYMBOL        12               // 4 subcarriers * 3 bits
#define BYTES_PER_BUFFER       (NUM_SUBCARRIERS * SYMBOLS_PER_BUFFER)
#define TOTAL_SIMBOLOS         (1 << BITS_PER_SYMBOL)   // 4096

volatile uint8_t indiceSecuencia = 0;

__attribute__((address(0x4000), aligned(8)))
uint8_t bufferA[BYTES_PER_BUFFER];

__attribute__((address(0x4030), aligned(8)))
uint8_t bufferB[BYTES_PER_BUFFER];

__attribute__((address(0x4100), aligned(16)))
uint8_t bufferSimbolos[4097][NUM_SUBCARRIERS];   // 4096 + sync

static const int8_t walsh4[NUM_SUBCARRIERS][NUM_SUBCARRIERS] =
{
    { +1, +1, +1, +1 },
    { +1, +1, -1, -1 },
    { +1, -1, -1, +1 },
    { +1, -1, +1, -1 }
};

// 3 bits -> {-7,-5,-3,-1,+1,+3,+5,+7}
static const int8_t PAM8_LUT[8] =
{ -7, -5, -3, -1, +1, +3, +5, +7 };

static inline int8_t pam8(uint8_t b3)
{
    return PAM8_LUT[b3 & 0x07];
}

const uint16_t simbolosSeleccionados[4] =
{
    0b010010010010,
    0b000101000101,
    0b100111001010,
    0b101000101000
};

void precargarTodosLosSimbolos(void)
{
    for (uint16_t n = 0; n < TOTAL_SIMBOLOS; n++)
    {
        int8_t nivel[NUM_SUBCARRIERS];

        // 1) Extraer los 4 valores PAM8 desde los 12 bits del símbolo

        // sub0 = bits [11:9]
        // sub1 = bits [ 8:6]
        // sub2 = bits [ 5:3]
        // sub3 = bits [ 2:0]
        
        for (uint8_t i = 0; i < NUM_SUBCARRIERS; i++)
        {
            uint8_t bits3 = (n >> (3 * (NUM_SUBCARRIERS - 1 - i))) & 0x07;
            nivel[i] = pam8(bits3);
        }

        // 2) Aplicar la proyección Walsh
        for (uint8_t j = 0; j < NUM_SUBCARRIERS; j++)
        {
            int acc = 0;

            for (uint8_t i = 0; i < NUM_SUBCARRIERS; i++)
            {
                acc += nivel[i] * walsh4[i][j];
            }

            // acc ? [-28, +28]
            int v = acc + 28;          // 0..56
            v = (v * 255) / 56;        // a 0..255

            if (v < 0) v = 0;
            if (v > 255) v = 255;

            bufferSimbolos[n][j] = (uint8_t)v;
        }
    }

    // 3) símbolo 4096: sincronismo = todo ceros
    for (uint8_t j = 0; j < NUM_SUBCARRIERS; j++)
        bufferSimbolos[TOTAL_SIMBOLOS][j] = 0;
}

// ===========================================================
// GENERAR BUFFER A o B (4 BYTES) EXACTAMENTE COMO ANTES
// ===========================================================

void generarSimboloDesdeBits(uint8_t *destino, uint16_t simbolo)
{
    const uint8_t *src = bufferSimbolos[simbolo];

    destino[0] = src[0];
    destino[1] = src[1];
    destino[2] = src[2];
    destino[3] = src[3];
}

// ===========================================================
// DMA INTERRUPTS ? IGUAL QUE ANTES
// ===========================================================

void __attribute__((__interrupt__, no_auto_psv)) _DMA0Interrupt(void)
{
    IFS2bits.DMA0IF = 0;
    LATCbits.LATC7 ^= 1;

    static uint16_t contador = 0;
    contador++;

    // Cada 5 símbolos ? meter símbolo de sincronismo (todo 0)
    if (contador == 100)
    {
        generarSimboloDesdeBits(bufferA, 4096);
        contador = 0;
        return;
    }

    // Enviar símbolo normal
    generarSimboloDesdeBits(bufferA, simbolosSeleccionados[indiceSecuencia]);
    indiceSecuencia = (indiceSecuencia + 1) & 0x03;  // 0..3
}

void __attribute__((__interrupt__, no_auto_psv)) _DMA1Interrupt(void)
{
    IFS2bits.DMA1IF = 0;
    LATCbits.LATC6 ^= 1;

    generarSimboloDesdeBits(bufferB, simbolosSeleccionados[indiceSecuencia]);
    indiceSecuencia = (indiceSecuencia + 1) & 0x03;
}

// ===========================================================
// MAIN
// ===========================================================

int main(void)
{
    SYSTEM_Initialize();

    precargarTodosLosSimbolos();

    ANSELC = 0x0000;
    TRISC  = 0x0000;
    LATC   = 0x0000;

    DMA_Initialize();

    DMA0CHbits.PPEN = 1;
    DMA1CHbits.PPEN = 1;
    DMA0CHbits.PCHEN = 1;
    DMA1CHbits.PCHEN = 0;
    DMA0CHbits.CHEN  = 1;
    DMA1CHbits.CHEN  = 1;

    DMA_ChannelEnable(DMA_CHANNEL_0);

    TMR1_Initialize();
    TMR2_Initialize();

    SCCP1_Timer_Start();
    TMR1_Start();
    TMR2_Start();

    printf("MODULACION 4-SUBCARRIER 8-PAM ACTIVADA\r\n");

    while (1)
    {
        if (indiceSecuencia >= 4)
            indiceSecuencia = 0;
    }
}
