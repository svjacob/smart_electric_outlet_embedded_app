################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Steven/workspace.kds/vamp_final/platform/drivers/src/lpuart/fsl_lpuart_common.c \
C:/Users/Steven/workspace.kds/vamp_final/platform/drivers/src/lpuart/fsl_lpuart_dma_driver.c \
C:/Users/Steven/workspace.kds/vamp_final/platform/drivers/src/lpuart/fsl_lpuart_driver.c 

OBJS += \
./platform/lpuart/drivers/fsl_lpuart_common.o \
./platform/lpuart/drivers/fsl_lpuart_dma_driver.o \
./platform/lpuart/drivers/fsl_lpuart_driver.o 

C_DEPS += \
./platform/lpuart/drivers/fsl_lpuart_common.d \
./platform/lpuart/drivers/fsl_lpuart_dma_driver.d \
./platform/lpuart/drivers/fsl_lpuart_driver.d 


# Each subdirectory must supply rules for building sources it contributes
platform/lpuart/drivers/fsl_lpuart_common.o: C:/Users/Steven/workspace.kds/vamp_final/platform/drivers/src/lpuart/fsl_lpuart_common.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MKW30Z160VHM4 -I../../../../../platform/CMSIS/Include -I../../../../../platform/devices -I../../../../../platform/devices/MKW30Z4/include -I../../../../../platform/devices/MKW30Z4/startup -I../../../../../platform/utilities/inc -I../../../../../platform/hal/inc -I../../../../../platform/drivers/inc -I../../../../../platform/system/inc -I../../../../../platform/osa/inc -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/lpuart/drivers/fsl_lpuart_dma_driver.o: C:/Users/Steven/workspace.kds/vamp_final/platform/drivers/src/lpuart/fsl_lpuart_dma_driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MKW30Z160VHM4 -I../../../../../platform/CMSIS/Include -I../../../../../platform/devices -I../../../../../platform/devices/MKW30Z4/include -I../../../../../platform/devices/MKW30Z4/startup -I../../../../../platform/utilities/inc -I../../../../../platform/hal/inc -I../../../../../platform/drivers/inc -I../../../../../platform/system/inc -I../../../../../platform/osa/inc -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/lpuart/drivers/fsl_lpuart_driver.o: C:/Users/Steven/workspace.kds/vamp_final/platform/drivers/src/lpuart/fsl_lpuart_driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MKW30Z160VHM4 -I../../../../../platform/CMSIS/Include -I../../../../../platform/devices -I../../../../../platform/devices/MKW30Z4/include -I../../../../../platform/devices/MKW30Z4/startup -I../../../../../platform/utilities/inc -I../../../../../platform/hal/inc -I../../../../../platform/drivers/inc -I../../../../../platform/system/inc -I../../../../../platform/osa/inc -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


