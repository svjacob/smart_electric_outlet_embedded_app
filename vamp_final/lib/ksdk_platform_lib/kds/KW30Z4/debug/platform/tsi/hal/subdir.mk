################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Steven/workspace.kds/vamp_final/platform/hal/src/tsi/fsl_tsi_hal.c \
C:/Users/Steven/workspace.kds/vamp_final/platform/hal/src/tsi/fsl_tsi_v4_hal_specific.c 

OBJS += \
./platform/tsi/hal/fsl_tsi_hal.o \
./platform/tsi/hal/fsl_tsi_v4_hal_specific.o 

C_DEPS += \
./platform/tsi/hal/fsl_tsi_hal.d \
./platform/tsi/hal/fsl_tsi_v4_hal_specific.d 


# Each subdirectory must supply rules for building sources it contributes
platform/tsi/hal/fsl_tsi_hal.o: C:/Users/Steven/workspace.kds/vamp_final/platform/hal/src/tsi/fsl_tsi_hal.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MKW30Z160VHM4 -I../../../../../platform/CMSIS/Include -I../../../../../platform/devices -I../../../../../platform/devices/MKW30Z4/include -I../../../../../platform/devices/MKW30Z4/startup -I../../../../../platform/utilities/inc -I../../../../../platform/hal/inc -I../../../../../platform/drivers/inc -I../../../../../platform/system/inc -I../../../../../platform/osa/inc -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/tsi/hal/fsl_tsi_v4_hal_specific.o: C:/Users/Steven/workspace.kds/vamp_final/platform/hal/src/tsi/fsl_tsi_v4_hal_specific.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MKW30Z160VHM4 -I../../../../../platform/CMSIS/Include -I../../../../../platform/devices -I../../../../../platform/devices/MKW30Z4/include -I../../../../../platform/devices/MKW30Z4/startup -I../../../../../platform/utilities/inc -I../../../../../platform/hal/inc -I../../../../../platform/drivers/inc -I../../../../../platform/system/inc -I../../../../../platform/osa/inc -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


