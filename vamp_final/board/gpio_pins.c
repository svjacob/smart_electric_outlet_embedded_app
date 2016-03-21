#include <stdint.h>
#include <stdlib.h>
#include "gpio_pins.h"
#include "pin_mux.h"
#include "fsl_interrupt_manager.h"

/* Declare LED GPIO pins */
gpio_output_pin_user_config_t output[] = {
    {
        .pinName = debugLED1,
        .config.outputLogic = 0,
        .config.slewRate = kPortFastSlewRate,
        .config.driveStrength = kPortHighDriveStrength,
    },
    {
        .pinName = plugDetectionBottom,
        .config.outputLogic = 0,
        .config.slewRate = kPortFastSlewRate,
        .config.driveStrength = kPortLowDriveStrength,
    },
	{
		.pinName = plugDetectionTop,
		.config.outputLogic = 0,
		.config.slewRate = kPortFastSlewRate,
		.config.driveStrength = kPortLowDriveStrength,
	},
    {
        .pinName = triacFire1,
        .config.outputLogic = 0,
        .config.slewRate = kPortFastSlewRate,
        .config.driveStrength = kPortHighDriveStrength,
    },
    {
        .pinName = triacFire2,
        .config.outputLogic = 0,
        .config.slewRate = kPortFastSlewRate,
        .config.driveStrength = kPortHighDriveStrength,
    },
    {
        .pinName = GPIO_PINS_OUT_OF_RANGE,
    }
};

gpio_input_pin_user_config_t input[] = {
    {
    	    .pinName = zeroCrossing1,
    	    .config.isPullEnable = true,
    	    .config.pullSelect = kPortPullUp,
    	    .config.isPassiveFilterEnabled = false,
    	    .config.interrupt = kPortIntDisabled
    },
    {
        .pinName = GPIO_PINS_OUT_OF_RANGE,
    }
};


void gpio_init(){
	configure_gpio_pins(PORTC_IDX);
	configure_gpio_pins(PORTB_IDX);
	GPIO_DRV_Init(input,output);
}

