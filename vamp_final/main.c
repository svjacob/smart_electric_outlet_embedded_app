//-----------------------------------------------------------------------
// Standard C/C++ Include

#include <stdio.h>
#include "math.h"
#include <stdlib.h>


//-----------------------------------------------------------------------
// KSDK Includes

#include "main.h"

//-----------------------------------------------------------------------
// Definitions

enum dutyCycle{
    percent0 = 8,
	percent13 = 7,
	percent25 = 6,
    percent37 = 5,
	percent50 = 4,
	percent63 = 3,
	percent75 = 2,
	percent88 = 1,
	percent100 = 0,
};

#define OSA_Timer_MAX 65536
//#define SAMPLE_AVERAGING 600			// sample over 10s
//#define SAMPLES_PER_SECOND 3000			// effective adc samples per second

//-----------------------------------------------------------------------
// Global Variables

//volatile float SINE_FACTOR_uS = 0.05026548245;

volatile uint8_t plugTopDimmingSetting = percent0;
volatile uint8_t plugTopPower = 0;
volatile uint8_t plugBottomDimmingSetting = percent0;
volatile uint8_t plugBottomPower = 0;
volatile uint8_t plugTopIn = 0;
volatile uint8_t plugBottomIn = 0;

//volatile float pwr = 0;
//volatile float pwr2 = 0;
//volatile float avg_pwr = 0;
//volatile float avg_pwr2 = 0;
//volatile float totalcurrent = 0;
//volatile float avgcurrent = 0;
//volatile float current = 0;
//volatile float current2 = 0;
volatile float plugTopADCSample = 0;
volatile float plugBottomADCSample = 0;

volatile uint8_t adcTopData = 0;
volatile uint8_t adcBottomData = 0;

volatile bool toFireTriac = false;
volatile uint32_t zeroCrossingTime = 0;
volatile uint32_t currentTime = 0;
volatile uint32_t timeElapsed = 0;
volatile bool toFireTriac2 = false;
volatile uint32_t currentTime2 = 0;
volatile uint32_t timeElapsed2 = 0;
volatile uint8_t random1 = 0;

//-----------------------------------------------------------------------
// Late GPIO Configuration (due to edge interrupt error)

gpio_input_pin_user_config_t inputPin[] = {
    {
        .pinName                       = zeroCrossing1,
        .config.isPullEnable           = false,
		#if FSL_FEATURE_PORT_HAS_PULL_SELECTION
		.config.pullSelect             = kPortPullUp,
		#endif
		#if FSL_FEATURE_PORT_HAS_PASSIVE_FILTER
		.config.isPassiveFilterEnabled = false,
		#endif
		#if FSL_FEATURE_PORT_HAS_DIGITAL_FILTER
		.config.isDigitalFilterEnabled = false,
		#endif
        .config.interrupt              = kPortIntEitherEdge,
    },
    {
        .pinName = GPIO_PINS_OUT_OF_RANGE,
    }
};

//-----------------------------------------------------------------------
// Global Functions

void fireTriac(){
	toFireTriac = false;
	if(plugTopIn){
	GPIO_DRV_SetPinOutput(triacFire1);
	if(plugTopDimmingSetting == percent100){
		for(int i = 0; i < 4500; i++){
			__asm("NOP");
		}
	}
	GPIO_DRV_ClearPinOutput(triacFire1);
	}
}
void fireTriac2(){
	toFireTriac2 = false;
	if(plugBottomIn){
	GPIO_DRV_SetPinOutput(triacFire2);
	if(plugBottomDimmingSetting == percent100){
		for(int i = 0; i < 4500; i++){
			__asm("NOP");
		}
	}
	GPIO_DRV_ClearPinOutput(triacFire2);
	}
}

//-----------------------------------------------------------------------
// Interrupt Handlers

void PORTB_PORTC_IRQHandler(){
	zeroCrossingTime = OSA_TimeGetMsec();
	PORT_HAL_ClearPortIntFlag(PORTC);
	while(PORT_HAL_GetPortIntFlag(PORTC) == 1){
	};
	toFireTriac = true;
	toFireTriac2 = true;
//	totalcurrent = 0;
//	pwr = 0;
//	pwr2 = 0;
}

void LPUART0_IRQHandler(){
}

double returnADCReading(int duty){
	switch(duty){
	case percent0:
		return 0;
	case percent13:
		return 0.01;
	case percent25:
		return 0.11;
	case percent37:
		return 0.3;
	case percent50:
		return 0.5;
	case percent63:
		return 0.75;
	case percent75:
		return 0.92;
	case percent88:
		return 0.99;
	case percent100:
		return 1;
	}
}

//-----------------------------------------------------------------------
// Main Function

int main(void)
{
    //-----------------------------------------------------------------------
    // Initialization

    //Enable PORT Clocks, Configure Pin Muxing, Initialize GPIO Pins
    hardware_init();
    //adc_init();
    //Extra GPIO Pin Initialization (to fix interrupt edge error)
    GPIO_DRV_Init(inputPin,NULL);
    //OS Abstraction
    OSA_Init();

    //-----------------------------------------------------------------------
    // LPUART

    volatile uint8_t receiveBuff = 0;
    uint8_t txChar, rxChar = 0;
    uint32_t        lpuartSourceClock;
    LPUART_Type*    baseAddr        = BOARD_DEBUG_UART_BASEADDR;

    // Set LPUART clock source
    CLOCK_SYS_SetLpuartSrc(BOARD_DEBUG_UART_INSTANCE, BOARD_LPUART_CLOCK_SOURCE);
    // Ungate lpuart module clock
    CLOCK_SYS_EnableLpuartClock(BOARD_DEBUG_UART_INSTANCE);
    // Initialize the LPUART instance
    LPUART_HAL_Init(baseAddr);

    // LPUART clock source is either system or bus clock depending on instance
    lpuartSourceClock = CLOCK_SYS_GetLpuartFreq(BOARD_DEBUG_UART_INSTANCE);

    // Initialize the parameters of the LPUART config structure with desired data
    LPUART_HAL_SetBaudRate(baseAddr, lpuartSourceClock, BOARD_DEBUG_UART_BAUD);
    LPUART_HAL_SetBitCountPerChar(baseAddr, kLpuart8BitsPerChar);
    LPUART_HAL_SetParityMode(baseAddr, kLpuartParityDisabled);
    LPUART_HAL_SetStopBitCount(baseAddr, kLpuartOneStopBit);

    // Enable the LPUART transmitter and receiver
    LPUART_HAL_SetTransmitterCmd(baseAddr, true);
    LPUART_HAL_SetReceiverCmd(baseAddr, true);

    plugTopDimmingSetting = percent100;
    plugBottomDimmingSetting = percent100;
    plugTopPower = 1;
    plugBottomPower = 1;
    plugTopIn = 1;
    plugBottomIn = 1;

    uint16_t fiveSecCheck = 5000;

    while(1)
    {
    	//plugTopIn = GPIO_DRV_ReadPinInput(plugDetectionTop);
    	if(plugTopIn){
			currentTime = OSA_TimeGetMsec();
			if(toFireTriac){
				timeElapsed = 0;
				if(zeroCrossingTime > currentTime){
					timeElapsed = (OSA_Timer_MAX - zeroCrossingTime) + currentTime;
				}
				else{
					timeElapsed = currentTime - zeroCrossingTime;
				}
				if(plugTopPower == 1){
					if(plugTopDimmingSetting == percent100){
						fireTriac();
					}
					else if(plugTopDimmingSetting == percent0){}
					else if(timeElapsed >= plugTopDimmingSetting){
						fireTriac();
					}
				}
			}



			if(plugTopPower == 1){
				plugTopADCSample = 1000*(returnADCReading(plugTopDimmingSetting)*0.455);
		        random1 = rand() % 250;
		        plugTopADCSample += random1;
		        plugTopADCSample /= 100;
			}
			else{
				plugTopPower = 0;
			}


    	}
    	else{
    		plugTopADCSample = 0;
    	}

    	//plugBottomIn = GPIO_DRV_ReadPinInput(plugDetectionBottom);
    	if(plugBottomIn){
    		currentTime2 = OSA_TimeGetMsec();
			if(toFireTriac2){
				timeElapsed2 = 0;
				if(zeroCrossingTime > currentTime2){
					timeElapsed2 = (OSA_Timer_MAX - zeroCrossingTime) + currentTime2;
				}
				else{
					timeElapsed2 = currentTime2 - zeroCrossingTime;
				}
				if(plugBottomPower == 1){
					if(plugBottomDimmingSetting == percent100){
						fireTriac2();
					}
					else if(plugBottomDimmingSetting == percent0){}
					else if(timeElapsed2 >= plugBottomDimmingSetting){
						fireTriac2();
					}
				}
			}

			if(plugBottomPower == 1){
			plugBottomADCSample = 1000*(returnADCReading(plugBottomDimmingSetting)*4.16);
			random1 = rand() % 250;
			plugBottomADCSample += random1;
			plugBottomADCSample /= 100;
			}
			else{
				plugBottomADCSample = 0;
			}

    	}
    	else{
    		plugBottomADCSample = 0;
    	}


    	LPUART_HAL_Getchar(baseAddr,&receiveBuff);
    	if(receiveBuff){
			volatile uint8_t output[8] = {0};
			for (int i = 0; i < 8; ++i) {
			  output[i] = (receiveBuff >> i) & 1;
			}
			if(output[6] == 0){
				plugTopPower = output[5];
				if(output[0] == 0)
				plugTopDimmingSetting = percent0;
				else if(output[0] == 1)
				plugTopDimmingSetting = percent100;
			}
			else if(output[6] == 1){
				plugBottomPower = output[5];
				plugBottomDimmingSetting = (uint8_t)((output[3] << 3) + (output[2] << 2) + (output[1] << 1) + (output[0]));
			}
    	}


//    	if(OSA_TimeGetMsec() > fiveSecCheck ){
//    		adcTopData = plugTopADCSample;
//    		adcBottomData = plugBottomADCSample;
//    		adcTopData = 0 + adcTopData;
//    		adcBottomData = 128 + adcBottomData;
//			uint8_t sourceBuff[2];
//			uint8_t sourceBuff2[4];
//			snprintf(sourceBuff, 2, "%u", adcTopData);
//			snprintf(sourceBuff2, 4, "%u", adcBottomData);
//			uint32_t byteCountBuff  = 0;
//			byteCountBuff = sizeof(sourceBuff);
//			uint32_t byteCountBuff2  = 0;
//			byteCountBuff2 = sizeof(sourceBuff2);
//			if( ( (fiveSecCheck/5000) & 1 ) == 0)
//				LPUART_HAL_SendDataPolling(baseAddr,sourceBuff,byteCountBuff-1);
//			else
//				LPUART_HAL_SendDataPolling(baseAddr,sourceBuff2,byteCountBuff2-1);
//			fiveSecCheck = OSA_TimeGetMsec() + 5000;
//			// deal with overflow
//			if(fiveSecCheck > OSA_Timer_MAX){
//				fiveSecCheck = 5000;
//			}
//    	}
        __asm("NOP");
    }


}
////////////////////////////////////////////////////////////////////////////////
// EOF
////////////////////////////////////////////////////////////////////////////////
