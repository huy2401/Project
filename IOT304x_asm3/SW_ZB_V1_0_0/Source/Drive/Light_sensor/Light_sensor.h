/*
 * Light_sensor.h
 *
 *  Created on: Apr 3, 2024
 *      Author: HUY
 */

#ifndef SOURCE_DRIVE_LIGHT_SENSOR_LIGHT_SENSOR_H_
#define SOURCE_DRIVE_LIGHT_SENSOR_LIGHT_SENSOR_H_

#include "em_device.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_gpio.h"
#include "bsp.h"
#include "em_iadc.h"
#include <math.h>

#define CLK_SRC_ADC_FREQ          20000000 // CLK_SRC_ADC
#define CLK_ADC_FREQ              10000000 // CLK_ADC - 10MHz max in normal mode


#define IADC_INPUT_0_PORT_PIN     iadcPosInputPortCPin5;
#define IADC_INPUT_1_PORT_PIN     iadcNegInputGnd;

#define IADC_INPUT_0_BUS          CDBUSALLOC
#define IADC_INPUT_0_BUSALLOC     GPIO_CDBUSALLOC_CDODD0_ADC0

void initIADC(void);
double LightSensor_getLight();

#endif /* SOURCE_DRIVE_LIGHT_SENSOR_LIGHT_SENSOR_H_ */
