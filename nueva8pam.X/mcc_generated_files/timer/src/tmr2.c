/**
 * TMR2 Generated Driver Source File 
 * 
 * @file      tmr2.c
 * 
 * @ingroup   timerdriver
 * 
 * @brief     This is the generated driver source file for TMR2 driver
 *
 * @version   PLIB Version 1.0.2
 *
 * @skipline  Device : dsPIC33AK512MPS512
*/

/*
© [2026] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.? 
    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,  
    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S 
    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
    THIS SOFTWARE.
*/

// Section: Included Files
#include "../tmr2.h"
#include "../timer_interface.h"

// Section: File specific functions

static void (*TMR2_TimeoutHandler)(void) = NULL;

// Section: Driver Interface

const struct TIMER_INTERFACE Timer2 = {
    .Initialize            = &TMR2_Initialize,
    .Deinitialize          = &TMR2_Deinitialize,
    .Start                 = &TMR2_Start,
    .Stop                  = &TMR2_Stop,
    .PeriodSet             = &TMR2_PeriodSet,
    .PeriodGet             = &TMR2_PeriodGet,
    .CounterGet            = &TMR2_CounterGet,
    .InterruptPrioritySet  = &TMR2_InterruptPrioritySet,
    .TimeoutCallbackRegister = &TMR2_TimeoutCallbackRegister,
    .Tasks          = NULL
};

// Section: TMR2 Module APIs

void TMR2_Initialize (void)
{
    //TCS Standard Speed Peripheral Clock; TSYNC disabled; TCKPS 1:1; TGATE disabled; TECS Standard Speed Peripheral Clock; PRWIP Write complete; TMWIP Write complete; TMWDIS disabled; SIDL disabled; ON disabled; 
    T2CON = 0x0UL;
    //TMR 0x0; 
    TMR2 = 0x0UL;
    //Period 2,000 ms; Frequency 100,000,000 Hz; PR 199999999; 
    PR2 = 0xBEBC1FFUL;
    
    TMR2_TimeoutCallbackRegister(&TMR2_TimeoutCallback);

    //Clear interrupt flag
    IFS1bits.T2IF = 0;
    //Enable the interrupt
    IEC1bits.T2IE = 1;
    
    TMR2_Start();
}

void TMR2_Deinitialize (void)
{
    TMR2_Stop();
    
    //Disable the interrupt
    IEC1bits.T2IE = 0;
    
    T2CON = 0x0UL;
    TMR2 = 0x0UL;
    PR2 = 0xFFFFFFFFUL;
}

void TMR2_Start( void )
{
    // Start the Timer 
    T2CONbits.ON = 1;
}

void TMR2_Stop( void )
{
    // Stop the Timer 
    T2CONbits.ON = 0;
}

void TMR2_PeriodSet(uint32_t count)
{
    PR2 = count;
}

void TMR2_InterruptPrioritySet(enum INTERRUPT_PRIORITY priority)
{
    IPC6bits.T2IP = priority;
}

void TMR2_TimeoutCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        TMR2_TimeoutHandler = handler;
    }
}

void __attribute__ ((weak)) TMR2_TimeoutCallback( void )
{ 

} 

/* cppcheck-suppress misra-c2012-8.4
*
* (Rule 8.4) REQUIRED: A compatible declaration shall be visible when an object or 
* function with external linkage is defined
*
* Reasoning: Interrupt declaration are provided by compiler and are available
* outside the driver folder
*/
void __attribute__ ((interrupt, no_auto_psv)) _T2Interrupt(void)
{
    (*TMR2_TimeoutHandler)();
    IFS1bits.T2IF = 0;
}

/**
 End of File
*/
