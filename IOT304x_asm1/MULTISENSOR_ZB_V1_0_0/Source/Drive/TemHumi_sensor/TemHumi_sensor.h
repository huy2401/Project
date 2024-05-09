/*
 * TemHumi_sensor.h
 *
 *  Created on: Apr 3, 2024
 *      Author: HUY
 */

#ifndef SOURCE_DRIVE_TEMHUMI_SENSOR_TEMHUMI_SENSOR_H_
#define SOURCE_DRIVE_TEMHUMI_SENSOR_TEMHUMI_SENSOR_H_

#define I2C_FOLLOWER_ADDRESS              0x40
#define TEMP_ADDRESS                      0xE0
#define HUMI_ADDRESS                      0xE5
#define TEMPHUMI_PORT                     gpioPortB
#define SCL_PIN                           (0U)
#define SDA_PIN                           (1U)

#include "em_i2c.h"
#include "em_cmu.h"
#include <math.h>

void initI2C(void);
uint16_t I2C_LeaderRead(uint16_t followerAddress, uint8_t command, uint8_t numBytes);
float TempHumiSensor_getTemp();
float TempHumiSensor_getHumi();


#endif /* SOURCE_DRIVE_TEMHUMI_SENSOR_TEMHUMI_SENSOR_H_ */
