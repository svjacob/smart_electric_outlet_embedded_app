################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Steven/workspace.kds/vamp_final/platform/hal/src/dmamux/fsl_dmamux_hal.c 

OBJS += \
./platform/dmamux/hal/fsl_dmamux_hal.o 

C_DEPS += \
./platform/dmamux/hal/fsl_dmamux_hal.d 


# Each subdirectory must supply rules for building sources it contributes
platform/dmamux/hal/fsl_dmamux_hal.o: C:/Users/Steven/workspace.kds/vamp_final/platform/hal/src/dmamux/fsl_dmamux_hal.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MKW30Z160VHM4 -I../../../../../platform/CMSIS/Include -I../../../../../platform/devices -I../../../../../platform/devices/MKW30Z4/include -I../../../../../platform/devices/MKW30Z4/startup -I../../../../../platform/utilities/inc -I../../../../../platform/hal/inc -I../../../../../platform/drivers/inc -I../../../../../platform/system/inc -I../../../../../platform/osa/inc -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


