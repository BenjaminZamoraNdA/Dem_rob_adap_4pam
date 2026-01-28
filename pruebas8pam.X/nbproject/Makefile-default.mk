#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/pruebas8pam.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/pruebas8pam.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/adc/src/adc1.c mcc_generated_files/dma/src/dma.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/reset.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/dmt.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/timer/src/tmr1.c mcc_generated_files/timer/src/tmr2.c mcc_generated_files/timer/src/sccp1.c mcc_generated_files/uart/src/uart1.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=mcc_generated_files/adc/src/adc1.c mcc_generated_files/dma/src/dma.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/reset.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/dmt.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/timer/src/tmr1.c mcc_generated_files/timer/src/tmr2.c mcc_generated_files/timer/src/sccp1.c mcc_generated_files/uart/src/uart1.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/pruebas8pam.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33AK512MPS512
MP_LINKER_FILE_OPTION=,--script=p33AK512MPS512.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o: mcc_generated_files/adc/src/adc1.c  .generated_files/flags/default/f01b2a7e688fddee16d97c3b262b4a2b0c2d9a24 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/adc/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc/src/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/dma/src/dma.o: mcc_generated_files/dma/src/dma.c  .generated_files/flags/default/fef89ef06a9ce32572837dbbbde21e10ef59742d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/dma/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/dma/src/dma.c  -o ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/dma/src/dma.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/885b9c57b2fb7a389291d4291da9d30c58f7aa3a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/4150f4b786ee2aeaf496899e2d01638f714b56f1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/19469383bbbf01d9ca4e138922fc1e71b3e79090 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/7a82e63702c0572a4f865cdc9c09b8448b7a5ffe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/63bbb4d3e99e1dbb55642434895ea58ff7bac629 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/a29f4f468a39b69d0ced1a1ceac26ec328ce64dd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/e3ae7a361a9893ae5bef08c94b1f81156d84b24a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/f382fc38ff91530e9746cc4efa3e2ed8b0212780 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o: mcc_generated_files/timer/src/tmr1.c  .generated_files/flags/default/cfdcd8c67825e8a9c4aa746355aa23409e630a1d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o: mcc_generated_files/timer/src/tmr2.c  .generated_files/flags/default/bf9dc187e109a4f71379d8ec95d8d4db5c011ccb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/tmr2.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o: mcc_generated_files/timer/src/sccp1.c  .generated_files/flags/default/40ffad3be02c1439a8c2392e99e1bd4a5f269237 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/sccp1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o: mcc_generated_files/uart/src/uart1.c  .generated_files/flags/default/5821cc7d0de410adc5c4c9fceebb86e500dd9a94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/24dd179929f74a7d118e455ca5607af6f3da4aac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o: mcc_generated_files/adc/src/adc1.c  .generated_files/flags/default/2188dbabe48695e601e92c2111c22e6572144323 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/adc/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc/src/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/dma/src/dma.o: mcc_generated_files/dma/src/dma.c  .generated_files/flags/default/74ea96232e6db744f83924a5780604fd4215ee5e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/dma/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/dma/src/dma.c  -o ${OBJECTDIR}/mcc_generated_files/dma/src/dma.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/dma/src/dma.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/98c1eea0301d386a7ccddf8b0583807998086458 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/17875fb25ce4f68e2600c46d85211fa13b90d136 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/29f6733d75bd1579bc3139203050731184169780 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/c323bbbc4e98fa1ad3548e3e9419bbfd95b83e46 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/9ddce6cbec08fc7de0c14242c24f5a8361ebe742 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/6d45a96f446f292935a2a5d840ce93393259e6ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/f62fdda0118c0142da2ad86de9ee5ca5e109ab9b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/d525c99b2a1e309e001456e26ce6778eb833f7e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o: mcc_generated_files/timer/src/tmr1.c  .generated_files/flags/default/fa6278701507f27d728789caa1b37cefba6ae34c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o: mcc_generated_files/timer/src/tmr2.c  .generated_files/flags/default/64b0da4e75158c2c95c91e60f8e0b9d7a6bccd82 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/tmr2.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tmr2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o: mcc_generated_files/timer/src/sccp1.c  .generated_files/flags/default/ea8cea0de9ac7e2d96ac0751c554814faeb8a56c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/sccp1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o: mcc_generated_files/uart/src/uart1.c  .generated_files/flags/default/302a315296c650bfc7f7411aabc6732641bb004f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/208eba0f9a793c685ab09317a40fda07ede85979 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/be8b20fb74cd94ed7b38d36332d8739e1a278882 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/99e90a94969249d0f76cc0dab63802d818970afa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/7f09fb04d7593d15198ef7233a54510c6c272f17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/5e762200d38fd5b5844ce52f587a467452ede04c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/pruebas8pam.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/pruebas8pam.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/pruebas8pam.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/pruebas8pam.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc-dsc-bin2hex ${DISTDIR}/pruebas8pam.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
