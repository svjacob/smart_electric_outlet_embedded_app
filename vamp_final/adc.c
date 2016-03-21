#include "adc.h"

adc16_converter_config_t *g_adcConfig;
adc16_chn_config_t *g_chnConfig;
adc16_calibration_param_t g_adcCalibraitionParam;

/* Try this:
 *

    ADC16_DRV_ConfigHwAverage(instance, &adcAverageConfig);
 */



void adc_init(){
	configure_adc_pins(PORTB_IDX);
}

void adc_config(uint32_t instance, adc16_chn_t channel){
    g_adcConfig = (adc16_converter_config_t *)OSA_MemAlloc(sizeof(adc16_converter_config_t));
    g_chnConfig = (adc16_chn_config_t *)OSA_MemAlloc(sizeof(adc16_chn_config_t));

    ADC16_DRV_StructInitUserConfigDefault(g_adcConfig);
    ADC16_DRV_Init(instance, g_adcConfig);
    ADC16_DRV_GetAutoCalibrationParam(instance, &g_adcCalibraitionParam);
    ADC16_DRV_SetCalibrationParam(instance, &g_adcCalibraitionParam);

      const adc16_hw_average_config_t adcAverageConfig = {
         .hwAverageEnable = true,
         .hwAverageCountMode = kAdc16HwAverageCountOf32
       };

      ADC16_DRV_ConfigHwAverage(instance, &adcAverageConfig);


    //g_adcConfig->continuousConvEnable = true;
    g_adcConfig->longSampleTimeEnable = true;
    g_adcConfig->highSpeedEnable = true;
    g_adcConfig->longSampleCycleMode = kAdc16LongSampleCycleOf24;
    ADC16_DRV_Init(instance, g_adcConfig);

    g_chnConfig->chnIdx = channel;
    g_chnConfig->diffConvEnable= false;
    g_chnConfig->convCompletedIntEnable = false;
    ADC16_DRV_ConfigConvChn(instance, 0U, g_chnConfig);
}


float adc_get(uint32_t instance)
{
    uint16_t adcData;
    float voltRead;
    uint8_t voltOne;
    uint8_t voltTenth;
    uint8_t voltHundreth;

    // Get ADC input
    ADC16_DRV_WaitConvDone(instance, 0U);
    adcData = ADC16_DRV_GetConvValueSigned(instance, 0U);

    // Convert ADC value to a voltage based on 3.3V VREFH on board
    voltRead = (float)adcData * (VREF_BRD / SE_12BIT);
    // Get the first digit before decimal place
    voltOne = (uint8_t)voltRead;
    // Get the first digit after the decimal place
    voltTenth = (uint8_t)((voltRead - voltOne) * 10);
    // Get the second digit after the decimal place
    voltHundreth = (uint8_t)((((voltRead - voltOne) * 10) - voltTenth) * 10);

    return voltRead;
}


void adc_deconfig(uint32_t instance){
	ADC16_DRV_PauseConv(instance, 0U);
	ADC16_DRV_Deinit(instance);
    OSA_MemFree(g_adcConfig);
    OSA_MemFree(g_chnConfig);
}

