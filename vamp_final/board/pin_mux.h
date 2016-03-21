#ifndef pin_mux_H_
#define pin_mux_H_

void configure_gpio_pins(uint32_t instance);

void configure_i2c_pins(uint32_t instance);

void configure_rtc_pins(uint32_t instance);

void configure_lpuart_pins(uint32_t instance);

void configure_spi_pins(uint32_t instance);

void configure_tpm_pins(uint32_t instance);

void configure_tsi_pins(uint32_t instance);

void configure_dac_pins(uint32_t instance);

void configure_adc_pins(uint32_t instance);

#endif /* #ifndef __pin_mux_H_ */

