#ifndef __FSL_GPIO_PINS_H__
#define __FSL_GPIO_PINS_H__

#include "fsl_gpio_driver.h"

enum _gpio_pins{
   /* Debug LEDs interface */
    debugLED1 = GPIO_MAKE_PIN(GPIOC_IDX, 0),
	plugDetectionBottom = GPIO_MAKE_PIN(GPIOB_IDX, 16),
	plugDetectionTop = GPIO_MAKE_PIN(GPIOB_IDX, 17),

	/* Zero Crossing interface */
	zeroCrossing1 = GPIO_MAKE_PIN(GPIOC_IDX, 3U),

	/* Triac Firing interface */
	triacFire1 = GPIO_MAKE_PIN(GPIOC_IDX, 1),
	triacFire2 = GPIO_MAKE_PIN(GPIOC_IDX, 2),
};

//output pin configuration
extern gpio_output_pin_user_config_t output[];

//input pin configuration
extern gpio_input_pin_user_config_t input[];

#endif /* __FSL_GPIO_PINS_H__ */
