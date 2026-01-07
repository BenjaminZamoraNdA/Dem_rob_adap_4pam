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

// -----------------------------------------
// PARAMETROS MODULACION 4 SUBC × 4-PAM
// -----------------------------------------
#define NUM_SUBCARRIERS        4
#define SYMBOLS_PER_BUFFER     1
#define BITS_PER_SYMBOL        8
#define BYTES_PER_BUFFER       NUM_SUBCARRIERS
#define TOTAL_SIMBOLOS         (1 << BITS_PER_SYMBOL)

// ADC: 5 muestras por chip × 4 chips = 20 muestras por simbolo
#define ADC_MUESTRAS_POR_CHIP      4
#define ADC_MUESTRAS_POR_SIMBOLO   (NUM_SUBCARRIERS * ADC_MUESTRAS_POR_CHIP)

// Umbral para detectar "hueco" (nivel bajo)
#define ADC_UMBRAL_ZERO  800

// numero de simbolos de datos entre bloques de sync
#define PERIODO_SYNC     32

// simbolo de sync para el canal B
#define SIMBOLO_SYNC_B   0b10101010

// longitud "clasica" 0 + 3xAA (usada en TX). En RX ahora buscamos 0 + 1 alto + 4xAA
#define SYNC_BLOCK_LEN   4

// -----------------------------------------
// VARIABLES GLOBALES
// -----------------------------------------
volatile uint8_t  indiceSecuencia = 0;    // recorre simbolosSeleccionados (datos)
volatile uint16_t symbolIndex     = 0;    // indice global de simbolo (datos+sync)
volatile uint8_t  simboloActual   = 0;    // ultimo simbolo de datos elegido

__attribute__((address(0x4000), aligned(8)))
uint8_t bufferA[BYTES_PER_BUFFER];

__attribute__((address(0x4030), aligned(8)))
uint8_t bufferB[BYTES_PER_BUFFER];

__attribute__((address(0x4100), aligned(16)))
uint8_t bufferSimbolos[TOTAL_SIMBOLOS + 1][NUM_SUBCARRIERS];

__attribute__((address(0x4600), aligned(16)))
int8_t tablaChips256[TOTAL_SIMBOLOS][4];

__attribute__((address(0x8400), aligned(16)))
uint16_t bufferAdc[5000];

// buffers estaticos para no usar stack en la ISR
static uint16_t muestras_low_buf [ADC_MUESTRAS_POR_SIMBOLO];
static uint16_t muestras_high_buf[ADC_MUESTRAS_POR_SIMBOLO];

// -----------------------------------------
// MATRIZ WALSH 4x4
// -----------------------------------------
static const int8_t walsh4[4][4] =
{
    { +1, +1, +1, +1 },
    { +1, +1, -1, -1 },
    { +1, -1, -1, +1 },
    { +1, -1, +1, -1 }
};

// -----------------------------------------
// MAPEO 2 BITS -> 4-PAM (-3,-1,+1,+3)
// -----------------------------------------
static inline int8_t pam4(uint8_t b2)
{
    switch (b2 & 0x03)
    {
        case 0: return -3;
        case 1: return -1;
        case 2: return +1;
        case 3: return +3;
    }
    return 0;
}

static inline uint8_t pam4_inv(int16_t v)
{
    if (v <= -2) return 0b00;
    if (v <   0) return 0b01;
    if (v <  +2) return 0b10;
    return 0b11;
}

// -----------------------------------------
// NIVELES DE CHIP (-12..+12) y UMBRALES
// -----------------------------------------

#define NUM_NIVELES 13

static const int16_t niveles[NUM_NIVELES] =
{
    -12,-10,-8,-6,-4,-2,0,
     +2,+4,+6,+8,+10,+12
};

// Tabla base de umbrales para el rango completo 0..4095
static const uint16_t umbrales_base[NUM_NIVELES - 1] =
{
    171, 512, 853, 1195, 1536, 1877,
    2218, 2560, 2901, 3243, 3584, 3925
};

// Umbrales dinamicos que se recalculan a partir de adc_low y adc_high
static uint16_t umbrales_dyn[NUM_NIVELES - 1];

// Niveles medidos de bajo y alto
static uint16_t adc_low  = 0;      // media del hueco "bajo"
static uint16_t adc_high = 4095;   // media del hueco "alto"

// Reescala la tabla original umbrales_base[] al rango [adc_low, adc_high]
static void recalcular_umbrales_dinamicos(void)
{
    uint32_t rango = (uint32_t)(adc_high - adc_low);

    // Por si algo va muy mal: evitamos division rara cuando no hay rango
    if (rango == 0)
    {
        for (int i = 0; i < (NUM_NIVELES - 1); i++)
            umbrales_dyn[i] = adc_low;
        return;
    }

    // umbrales_base[] esta pensado para 0..4095
    // nuevo_umbral = adc_low + (rango * umbral_base / 4095)
    for (int i = 0; i < (NUM_NIVELES - 1); i++)
    {
        uint32_t num    = rango * (uint32_t)umbrales_base[i];
        uint32_t offset = num / 4095u;
        umbrales_dyn[i] = (uint16_t)(adc_low + offset);
    }
}

// Cuantizacion ADC -> nivel -12..+12 usando los umbrales dinamicos
static inline int16_t cuantizar_adc_a_chip(uint16_t adc)
{
    int i = 0;
    while (i < (NUM_NIVELES - 1) && adc >= umbrales_dyn[i])
        i++;

    return niveles[i];
}

// -----------------------------------------
// UART printf
// -----------------------------------------
void putch(char c) { UART1_Write(c); }

// -----------------------------------------
// PRECARGA DE TODOS LOS SIMBOLOS
// -----------------------------------------
void precargarTodosLosSimbolos(void)
{
    for (uint16_t n = 0; n < TOTAL_SIMBOLOS; n++)
    {
        int8_t pam[4];
        pam[0] = pam4((n >> 6) & 0x03);
        pam[1] = pam4((n >> 4) & 0x03);
        pam[2] = pam4((n >> 2) & 0x03);
        pam[3] = pam4((n >> 0) & 0x03);

        for (uint8_t j = 0; j < 4; j++)
        {
            int acc = 0;
            for (uint8_t i = 0; i < 4; i++)
                acc += pam[i] * walsh4[i][j];

            tablaChips256[n][j] = (int8_t)acc;   // chips ideales (-12..+12)

            int v = acc + 12;      // [-12..+12] -> [0..24]
            v = (v * 255) / 24;    // -> [0..255] DAC
            bufferSimbolos[n][j] = (uint8_t)v;
        }
    }

    // simbolo TOTAL_SIMBOLOS = "hueco": todo 0
    for (int j = 0; j < 4; j++)
        bufferSimbolos[TOTAL_SIMBOLOS][j] = 0;
}

void generarSimboloDesdeBits(uint8_t *dest, uint16_t simbolo)
{
    dest[0] = bufferSimbolos[simbolo][0];
    dest[1] = bufferSimbolos[simbolo][1];
    dest[2] = bufferSimbolos[simbolo][2];
    dest[3] = bufferSimbolos[simbolo][3];
}

// algunos simbolos de prueba
const uint8_t simbolosSeleccionados[4] =
{
    0b00110011,
    0b10001000,
    0b11001100,
    0b11101110
};

// =========================================================
// DMA0 ? CANAL A
// =========================================================
void __attribute__((__interrupt__, no_auto_psv)) _DMA0Interrupt(void)
{
    IFS2bits.DMA0IF = 0;

    // Avanzar indice global de simbolo (datos + sync)
    symbolIndex++;
    if (symbolIndex >= (PERIODO_SYNC + SYNC_BLOCK_LEN))
        symbolIndex = 0;

    if (symbolIndex < PERIODO_SYNC)
    {
        // datos normales
        simboloActual = simbolosSeleccionados[indiceSecuencia];
        indiceSecuencia = (indiceSecuencia + 1) & 0x03;
        generarSimboloDesdeBits(bufferA, simboloActual);
    }
    else
    {
        // bloque de sincronismo A,B,B,B en A:
        // posSync=0 -> hueco
        // resto -> datos normales
        uint16_t posSync = symbolIndex - PERIODO_SYNC;   // 0..3

        if (posSync == 0)
        {
            generarSimboloDesdeBits(bufferA, 256);  // hueco
        }
        else
        {
            simboloActual = simbolosSeleccionados[indiceSecuencia];
            indiceSecuencia = (indiceSecuencia + 1) & 0x03;
            generarSimboloDesdeBits(bufferA, simboloActual);
        }
    }
}

// =========================================================
// DMA1 ? CANAL B
// =========================================================
void __attribute__((__interrupt__, no_auto_psv)) _DMA1Interrupt(void)
{
    IFS2bits.DMA1IF = 0;

    if (symbolIndex < PERIODO_SYNC)
    {
        // datos normales: B copia A
        generarSimboloDesdeBits(bufferB, simboloActual);
    }
    else
    {
        // bloque de sincronismo en B:
        // posSync=0 -> hueco
        // resto -> AA
        uint16_t posSync = symbolIndex - PERIODO_SYNC;   // 0..3

        if (posSync == 0)
        {
            generarSimboloDesdeBits(bufferB, 256);    // hueco
        }
        else
        {
            generarSimboloDesdeBits(bufferB, 170);    // 0xAA
        }
    }
}
// =========================================================
// MEDIA ROBUSTA (quita el peor valor)
// =========================================================
static uint16_t media_sin_outlier(const uint16_t *m, int n)
{
    if (n <= 2)
    {
        uint32_t sum = 0;
        for (int i = 0; i < n; i++) sum += m[i];
        return (uint16_t)(sum / (uint16_t)n);
    }

    uint32_t sum = 0;
    for (int i = 0; i < n; i++)
        sum += m[i];

    uint16_t mean = (uint16_t)(sum / (uint16_t)n);

    int peor = 0;
    uint32_t maxd = 0;

    for (int i = 0; i < n; i++)
    {
        uint32_t d = (m[i] > mean) ? (m[i] - mean) : (mean - m[i]);
        if (d > maxd) { maxd = d; peor = i; }
    }

    sum -= m[peor];
    n--;

    return (uint16_t)(sum / (uint16_t)n);
}

// =========================================================
// DEMODULACION WALSH 4-PAM
// =========================================================
uint8_t demodularWalsh4PAM(const uint16_t *adcBase)
{
    int16_t chip[4];

    // Paso 1: media robusta + cuantizacion a chip (-12..+12)
    for (int j = 0; j < 4; j++)
    {
        const uint16_t *p = &adcBase[j * ADC_MUESTRAS_POR_CHIP];
        uint16_t avg = media_sin_outlier(p, ADC_MUESTRAS_POR_CHIP);
        chip[j] = cuantizar_adc_a_chip(avg);
    }

    // Paso 2: walsh inversa
    int16_t pam_est[4];

    for (int i = 0; i < 4; i++)
    {
        int acc = 0;
        for (int j = 0; j < 4; j++)
            acc += chip[j] * walsh4[i][j];

        pam_est[i] = acc >> 2;  // divide entre 4
    }

    // Paso 3: cuantizar cada PAM a {-3,-1,+1,+3}
    uint8_t pam_bits[4];

    for (int i = 0; i < 4; i++)
        pam_bits[i] = pam4_inv(pam_est[i]);

    // Paso 4: reconstruir simbolo de 8 bits
    uint8_t simbolo =
        (pam_bits[0] << 6) |
        (pam_bits[1] << 4) |
        (pam_bits[2] << 2) |
        (pam_bits[3] << 0);

    return simbolo;
}

void imprimirSimboloBits8(uint8_t s)
{
    for (int i = 7; i >= 0; i--)
        printf("%d", (s >> i) & 1);
}

// =========================================================
// TMR2 CALLBACK ? SYNC + CALIBRACION + DEMOD
// =========================================================
static void TMR2_UserCallback(void)
{
    printf("\r\n=== DEMOD 4-PAM WALSH (0(bajo) + 1(alto) + 4×AA) ===\r\n");

    const int total   = (int)(sizeof(bufferAdc) / sizeof(bufferAdc[0]));
    const int ventana = ADC_MUESTRAS_POR_SIMBOLO;

    // parametros de robustez
    const int N_CONSEC_LOW  = 4;   // consecutivas validas "bajo"
    const int M_TAKE_LOW    = 10;  // muestras para media baja
    const int M_TAKE_HIGH   = 10;  // muestras para media alta

    // ============================
    // 1) Localizar simbolo LOW (bestI)
    // ============================
    int bestI = -1;
    int bestScore = -1;

    for (int i = 0; i <= total - 6*ventana; i++)
    {
        int score = 0;
        for (int k = 0; k < ventana; k++)
            if (bufferAdc[i+k] < ADC_UMBRAL_ZERO)
                score++;

        if (score > bestScore)
        {
            bestScore = score;
            bestI = i;
        }
    }

    if (bestI < 0)
    {
        printf("NO SYNC (no LOW)\r\n");
        goto rearmar;
    }

    int idxLow  = bestI;
    int idxHigh = bestI + ventana;
    int idxAA1  = bestI + 2*ventana;
    int idxAA2  = bestI + 3*ventana;
    int idxAA3  = bestI + 4*ventana;
    int idxAA4  = bestI + 5*ventana;

    printf("SYNC LOW  = %d\r\n", idxLow);
    printf("SYNC HIGH = %d\r\n", idxHigh);

    // ============================
    // 2) Encontrar ULTIMO_BAJO real
    // ============================
    int ultimo_bajo = -1;
    int consec = 0;

    for (int k = 0; k < ventana; k++)
    {
        uint16_t v = bufferAdc[idxLow + k];
        if (v < ADC_UMBRAL_ZERO)
        {
            consec++;
            if (consec >= N_CONSEC_LOW)
                ultimo_bajo = idxLow + k;
        }
        else
            consec = 0;
    }

    if (ultimo_bajo < 0)
    {
        printf("NO SYNC (bajo inestable)\r\n");
        goto rearmar;
    }

    printf("ULTIMO_BAJO = %d\r\n", ultimo_bajo);

    // ============================
    // 3) PRIMER_ALTO = ultimo_bajo + 1 (forzamos salto de estado)
    // ============================
    int primer_alto = ultimo_bajo + 1;

    if (primer_alto < idxHigh)
        primer_alto = idxHigh;

    if (primer_alto >= idxHigh + ventana)
    {
        printf("NO SYNC (primer_alto fuera de rango)\r\n");
        goto rearmar;
    }

    printf("PRIMER_ALTO = %d\r\n", primer_alto);

    // ============================
    // 4) Calcular adc_low con media_sin_outlier
    // ============================
    uint16_t lowBuf[32];
    int nLow = 0;

    int iniL = ultimo_bajo - (M_TAKE_LOW - 1);
    if (iniL < idxLow) iniL = idxLow;

    for (int i = iniL; i <= ultimo_bajo; i++)
    {
        if (nLow < 32)
            lowBuf[nLow++] = bufferAdc[i];
    }

    if (nLow > 0)
        adc_low = media_sin_outlier(lowBuf, nLow);
    else
        adc_low = 0;

    // ============================
    // 5) Calcular adc_high con media_sin_outlier
    // ============================
    uint16_t highBuf[32];
    int nHigh = 0;

    // saltamos un par de muestras tras la transicion de subida
    int startHighMedia = primer_alto + 2;
    if (startHighMedia > idxHigh + ventana - 1)
        startHighMedia = idxHigh;

    int finH = startHighMedia + (M_TAKE_HIGH - 1);
    if (finH > idxHigh + ventana - 1)
        finH = idxHigh + ventana - 1;

    for (int i = startHighMedia; i <= finH; i++)
    {
        if (nHigh < 32)
            highBuf[nHigh++] = bufferAdc[i];
    }

    if (nHigh > 0)
        adc_high = media_sin_outlier(highBuf, nHigh);
    else
        adc_high = 4095;

    if (adc_low > adc_high)
    {
        uint16_t t = adc_low;
        adc_low = adc_high;
        adc_high = t;
    }

    recalcular_umbrales_dinamicos();

    printf("adc_low  = %u\r\n", adc_low);
    printf("adc_high = %u\r\n", adc_high);

    // ============================
    // 6) Verificar AA
    // ============================
    uint8_t aa1 = demodularWalsh4PAM(&bufferAdc[idxAA1]);
    uint8_t aa2 = demodularWalsh4PAM(&bufferAdc[idxAA2]);
    uint8_t aa3 = demodularWalsh4PAM(&bufferAdc[idxAA3]);
    uint8_t aa4 = demodularWalsh4PAM(&bufferAdc[idxAA4]);

    int ok = (aa1==SIMBOLO_SYNC_B) + (aa2==SIMBOLO_SYNC_B) +
             (aa3==SIMBOLO_SYNC_B) + (aa4==SIMBOLO_SYNC_B);

    printf("AA1=%02X AA2=%02X AA3=%02X AA4=%02X -> %d OK\r\n",
           aa1,aa2,aa3,aa4,ok);

    if (ok < 1)
    {
        printf("SYNC INVALIDO (AA)\r\n");
        goto rearmar;
    }

    // ============================
    // 7) DEMOD DATOS
    // ============================
    int idx0 = idxAA4 + ventana;
    printf("Primer dato en %d\r\n", idx0);

    for (int s=0; s<60; s++)
    {
        int idx = idx0 + s*ventana;
        if (idx+ventana > total) break;
        uint8_t sim = demodularWalsh4PAM(&bufferAdc[idx]);
        printf("%3d idx=%4d 0x%02X\r\n", s, idx, sim);
    }

rearmar:
    DMA2CHbits.CHEN = 0;
    DMA2STATbits.DONE = 0;
    DMA2STATbits.OVERRUN = 0;
    DMA2SRC = 0x820;
    DMA2DST = 0x8400;
    DMA2CNT = 2000;
    DMA2CHbits.CHEN = 1;
    IFS2bits.DMA2IF = 0;
}

// =========================================================
// MAIN
// =========================================================
int main(void)
{
    SYSTEM_Initialize();
    precargarTodosLosSimbolos();

    // inicializar umbrales dinamicos de forma generica
    adc_low  = 0;
    adc_high = 4095;
    recalcular_umbrales_dinamicos();

    ANSELC = 0x0000;
    TRISC  = 0x0000;
    LATC   = 0x0000;

    DMA_Initialize();

    DMA0CHbits.PPEN  = 1;
    DMA1CHbits.PPEN  = 1;
    DMA0CHbits.PCHEN = 1;
    DMA1CHbits.PCHEN = 0;
    DMA0CHbits.CHEN  = 1;
    DMA1CHbits.CHEN  = 1;

    DMA_ChannelEnable(DMA_CHANNEL_0);
    DMA_ChannelEnable(DMA_CHANNEL_1);

    TMR1_Initialize();
    TMR2_Initialize();
    SCCP1_Timer_Initialize();
    TMR2_TimeoutCallbackRegister(TMR2_UserCallback);
    SCCP1_Timer_Start();
    TMR1_Start();
    TMR2_Start();

    printf("MODULACION 4-SUBCARRIER 4-PAM ACTIVADA\r\n");

    while (1)
    {
        if (indiceSecuencia >= 4)
            indiceSecuencia = 0;
    }
}
