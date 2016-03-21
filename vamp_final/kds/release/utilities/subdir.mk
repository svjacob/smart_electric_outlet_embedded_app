################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Steven/workspace.kds/vamp_final/platform/utilities/src/fsl_debug_console.c \
C:/Users/Steven/workspace.kds/vamp_final/platform/utilities/src/print_scan.c 

OBJS += \
./utilities/fsl_debug_console.o \
./utilities/print_scan.o 

C_DEPS += \
./utilities/fsl_debug_console.d \
./utilities/print_scan.d 


# Each subdirectory must supply rules for building sources it contributes
utilities/fsl_debug_console.o: C:/Users/Steven/workspace.kds/vamp_final/platform/utilities/src/fsl_debug_console.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -DNDEBUG -DCPU_MKW30Z160VHM4 -DFRDM_KW40Z -DFREEDOM -I../../platform/osa/inc -I../../platform/utilities/inc -I../../platform/CMSIS/Include -I../../platform/devices -I../../platform/devices/MKW30Z4/include -I../../platform/devices/MKW30Z4/startup -I../../platform/hal/inc -I../../platform/drivers/inc -I../../platform/system/inc -I../../ -I../../board -I../../platform/drivers/src/adc16 -I../../platform/drivers/src/cmp -I../../platform/drivers/src/dac -I../../platform/drivers/src/dma -I../../platform/drivers/src/dspi -I../../platform/drivers/src/gpio -I../../platform/drivers/src/i2c -I../../platform/drivers/src/lptmr -I../../platform/drivers/src/lpuart -I../../platform/drivers/src/pit -I../../platform/drivers/src/rtc -I../../platform/drivers/src/tpm -I../../platform/drivers/src/tsi -I../../platform/drivers/src/cop -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

utilities/print_scan.o: C:/Users/Steven/workspace.kds/vamp_final/platform/utilities/src/print_scan.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -DNDEBUG -DCPU_MKW30Z160VHM4 -DFRDM_KW40Z -DFREEDOM -I../../platform/osa/inc -I../../platform/utilities/inc -I../../platform/CMSIS/Include -I../../platform/devices -I../../platform/devices/MKW30Z4/include -I../../platform/devices/MKW30Z4/startup -I../../platform/hal/inc -I../../platform/drivers/inc -I../../platform/system/inc -I../../ -I../../board -I../../platform/drivers/src/adc16 -I../../platform/drivers/src/cmp -I../../platform/drivers/src/dac -I../../platform/drivers/src/dma -I../../platform/drivers/src/dspi -I../../platform/drivers/src/gpio -I../../platform/drivers/src/i2c -I../../platform/drivers/src/lptmr -I../../platform/drivers/src/lpuart -I../../platform/drivers/src/pit -I../../platform/drivers/src/rtc -I../../platform/drivers/src/tpm -I../../platform/drivers/src/tsi -I../../platform/drivers/src/cop -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


