/*
 * Light_sensor.c
 *
 *  Created on: Apr 3, 2024
 *      Author: HUY
 */

#include "Light_sensor.h"

void initIADC (void)
{
  // Declare init structs
  IADC_Init_t init = IADC_INIT_DEFAULT;
  IADC_AllConfigs_t initAllConfigs = IADC_ALLCONFIGS_DEFAULT;
  IADC_InitSingle_t initSingle = IADC_INITSINGLE_DEFAULT;
  IADC_SingleInput_t initSingleInput = IADC_SINGLEINPUT_DEFAULT;

  // Enable IADC0 and GPIO clock branches

  CMU_ClockEnable(cmuClock_IADC0, true);

  // Reset IADC to reset configuration in case it has been modified by
  IADC_reset(IADC0);

  // Select clock for IADC
  CMU_ClockSelectSet(cmuClock_IADCCLK, cmuSelect_FSRCO);  // FSRCO - 20MHz

  // Modify init structs and initialize
  init.warmup = iadcWarmupKeepWarm;

  // Set the HFSCLK prescale value here
  init.srcClkPrescale = IADC_calcSrcClkPrescale(IADC0, CLK_SRC_ADC_FREQ, 0);

  // Configuration 0 is used by both scan and single conversions by default
  // Use internal bandgap (supply voltage in mV) as reference
  initAllConfigs.configs[0].reference = iadcCfgReferenceVddx;
  initAllConfigs.configs[0].vRef = 1650;
  initAllConfigs.configs[0].analogGain = iadcCfgAnalogGain1x;

  // Divides CLK_SRC_ADC to set the CLK_ADC frequency
  initAllConfigs.configs[0].adcClkPrescale
  = IADC_calcAdcClkPrescale(IADC0,CLK_ADC_FREQ,0, iadcCfgModeNormal,init.srcClkPrescale);

  // Assign pins to positive and negative inputs in differential mode
  initSingleInput.posInput   = IADC_INPUT_0_PORT_PIN;
  initSingleInput.negInput   = IADC_INPUT_1_PORT_PIN;

  // Initialize the IADC
  IADC_init(IADC0, &init, &initAllConfigs);

  // Initialize the Single conversion inputs
  IADC_initSingle(IADC0, &initSingle, &initSingleInput);

  // Allocate the analog bus for ADC0 inputs
  GPIO->IADC_INPUT_0_BUS |= IADC_INPUT_0_BUSALLOC;
}

double LightSensor_getLight()
{
	static double RLDR, Lux;
	static long VLDR;
    IADC_command(IADC0, iadcCmdStartSingle);

	// Wait for conversion to be complete
	while((IADC0->STATUS & (_IADC_STATUS_CONVERTING_MASK
				                | _IADC_STATUS_SINGLEFIFODV_MASK)) != IADC_STATUS_SINGLEFIFODV); //while combined status bits 8 & 6 don't equal 1 and 0 respectively

				    // Get ADC result
	VLDR = IADC_pullSingleFifoResult(IADC0).data;
	RLDR =  10.0 * (4096 - VLDR) / VLDR ;
	Lux  =  log10(RLDR) * -5 / 3 + 3.3299;
	Lux  =  pow(10, Lux);
	return Lux;
}

