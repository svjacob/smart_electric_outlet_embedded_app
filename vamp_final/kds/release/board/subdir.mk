################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Steven/workspace.kds/vamp_final/adc.c \
C:/Users/Steven/workspace.kds/vamp_final/board/board.c \
C:/Users/Steven/workspace.kds/vamp_final/board/gpio_pins.c \
C:/Users/Steven/workspace.kds/vamp_final/hardware_init.c \
C:/Users/Steven/workspace.kds/vamp_final/board/pin_mux.c \
C:/Users/Steven/workspace.kds/vamp_final/uart.c 

OBJS += \
./board/adc.o \
./board/board.o \
./board/gpio_pins.o \
./board/hardware_init.o \
./board/pin_mux.o \
./board/uart.o 

C_DEPS += \
./board/adc.d \
./board/board.d \
./board/gpio_pins.d \
./board/hardware_init.d \
./board/pin_mux.d \
./board/uart.d 


# Each subdirectory must supply rules for building sources it contributes
board/adc.o: C:/Users/Steven/workspace.kds/vamp_final/adc.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -DNDEBUG -DCPU_MKW30Z160VHM4 -DFRDM_KW40Z -DFREEDOM -I../../platform/osa/inc -I../../platform/utilities/inc -I../../platform/CMSIS/Include -I../../platform/devices -I../../platform/devices/MKW30Z4/include -I../../platform/devices/MKW30Z4/startup -I../../platform/hal/inc -I../../platform/drivers/inc -I../../platform/system/inc -I../../ -I../../board -I../../platform/drivers/src/adc16 -I../../platform/drivers/src/cmp -I../../platform/drivers/src/dac -I../../platform/drivers/src/dma -I../../platform/drivers/src/dspi -I../../platform/drivers/src/gpio -I../../platform/drivers/src/i2c -I../../platform/drivers/src/lptmr -I../../platform/drivers/src/lpuart -I../../platform/drivers/src/pit -I../../platform/drivers/src/rtc -I../../platform/drivers/src/tpm -I../../platform/drivers/src/tsi -I../../platform/drivers/src/cop -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

board/board.o: C:/Users/Steven/workspace.kds/vamp_final/board/board.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -DNDEBUG -DCPU_MKW30Z160VHM4 -DFRDM_KW40Z -DFREEDOM -I../../platform/osa/inc -I../../platform/utilities/inc -I../../platform/CMSIS/Include -I../../platform/devices -I../../platform/devices/MKW30Z4/include -I../../platform/devices/MKW30Z4/startup -I../../platform/hal/inc -I../../platform/drivers/inc -I../../platform/system/inc -I../../ -I../../board -I../../platform/drivers/src/adc16 -I../../platform/drivers/src/cmp -I../../platform/drivers/src/dac -I../../platform/drivers/src/dma -I../../platform/drivers/src/dspi -I../../platform/drivers/src/gpio -I../../platform/drivers/src/i2c -I../../platform/drivers/src/lptmr -I../../platform/drivers/src/lpuart -I../../platform/drivers/src/pit -I../../platform/drivers/src/rtc -I../../platform/drivers/src/tpm -I../../platform/drivers/src/tsi -I../../platform/drivers/src/cop -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

board/gpio_pins.o: C:/Users/Steven/workspace.kds/vamp_final/board/gpio_pins.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -DNDEBUG -DCPU_MKW30Z160VHM4 -DFRDM_KW40Z -DFREEDOM -I../../platform/osa/inc -I../../platform/utilities/inc -I../../platform/CMSIS/Include -I../../platform/devices -I../../platform/devices/MKW30Z4/include -I../../platform/devices/MKW30Z4/startup -I../../platform/hal/inc -I../../platform/drivers/inc -I../../platform/system/inc -I../../ -I../../board -I../../platform/drivers/src/adc16 -I../../platform/drivers/src/cmp -I../../platform/drivers/src/dac -I../../platform/drivers/src/dma -I../../platform/drivers/src/dspi -I../../platform/drivers/src/gpio -I../../platform/drivers/src/i2c -I../../platform/drivers/src/lptmr -I../../platform/drivers/src/lpuart -I../../platform/drivers/src/pit -I../../platform/drivers/src/rtc -I../../platform/drivers/src/tpm -I../../platform/drivers/src/tsi -I../../platform/drivers/src/cop -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

board/hardware_init.o: C:/Users/Steven/workspace.kds/vamp_final/hardware_init.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -DNDEBUG -DCPU_MKW30Z160VHM4 -DFRDM_KW40Z -DFREEDOM -I../../platform/osa/inc -I../../platform/utilities/inc -I../../platform/CMSIS/Include -I../../platform/devices -I../../platform/devices/MKW30Z4/include -I../../platform/devices/MKW30Z4/startup -I../../platform/hal/inc -I../../platform/drivers/inc -I../../platform/system/inc -I../../ -I../../board -I../../platform/drivers/src/adc16 -I../../platform/drivers/src/cmp -I../../platform/drivers/src/dac -I../../platform/drivers/src/dma -I../../platform/drivers/src/dspi -I../../platform/drivers/src/gpio -I../../platform/drivers/src/i2c -I../../platform/drivers/src/lptmr -I../../platform/drivers/src/lpuart -I../../platform/drivers/src/pit -I../../platform/drivers/src/rtc -I../../platform/drivers/src/tpm -I../../platform/drivers/src/tsi -I../../platform/drivers/src/cop -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

board/pin_mux.o: C:/Users/Steven/workspace.kds/vamp_final/board/pin_mux.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -DNDEBUG -DCPU_MKW30Z160VHM4 -DFRDM_KW40Z -DFREEDOM -I../../platform/osa/inc -I../../platform/utilities/inc -I../../platform/CMSIS/Include -I../../platform/devices -I../../platform/devices/MKW30Z4/include -I../../platform/devices/MKW30Z4/startup -I../../platform/hal/inc -I../../platform/drivers/inc -I../../platform/system/inc -I../../ -I../../board -I../../platform/drivers/src/adc16 -I../../platform/drivers/src/cmp -I../../platform/drivers/src/dac -I../../platform/drivers/src/dma -I../../platform/drivers/src/dspi -I../../platform/drivers/src/gpio -I../../platform/drivers/src/i2c -I../../platform/drivers/src/lptmr -I../../platform/drivers/src/lpuart -I../../platform/drivers/src/pit -I../../platform/drivers/src/rtc -I../../platform/drivers/src/tpm -I../../platform/drivers/src/tsi -I../../platform/drivers/src/cop -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

board/uart.o: C:/Users/Steven/workspace.kds/vamp_final/uart.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -DNDEBUG -DCPU_MKW30Z160VHM4 -DFRDM_KW40Z -DFREEDOM -I../../platform/osa/inc -I../../platform/utilities/inc -I../../platform/CMSIS/Include -I../../platform/devices -I../../platform/devices/MKW30Z4/include -I../../platform/devices/MKW30Z4/startup -I../../platform/hal/inc -I../../platform/drivers/inc -I../../platform/system/inc -I../../ -I../../board -I../../platform/drivers/src/adc16 -I../../platform/drivers/src/cmp -I../../platform/drivers/src/dac -I../../platform/drivers/src/dma -I../../platform/drivers/src/dspi -I../../platform/drivers/src/gpio -I../../platform/drivers/src/i2c -I../../platform/drivers/src/lptmr -I../../platform/drivers/src/lpuart -I../../platform/drivers/src/pit -I../../platform/drivers/src/rtc -I../../platform/drivers/src/tpm -I../../platform/drivers/src/tsi -I../../platform/drivers/src/cop -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


