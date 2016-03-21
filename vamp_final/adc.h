#include "fsl_adc16_driver.h"

void adc_init(void);
void adc_deconfig(uint32_t instance);
void adc_config(uint32_t instance,adc16_chn_t channel);
float adc_get(uint32_t instance);

#define VREF_BRD  3.300
#define SE_12BIT  4096.0
