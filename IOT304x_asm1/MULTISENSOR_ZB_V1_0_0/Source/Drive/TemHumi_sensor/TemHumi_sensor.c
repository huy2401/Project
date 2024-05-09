/*
 * TemHumi_Sensor.c
 *
 *  Created on: Apr 3, 2024
 *      Author: HUY
 */
#include "TemHumi_sensor.h"


void initI2C(void)
{
  // Use default settings
  I2C_Init_TypeDef i2cInit = I2C_INIT_DEFAULT;

  // Using PB0 (SCL) and PB1 (SDA)
  GPIO_PinModeSet(TEMPHUMI_PORT, SCL_PIN, gpioModeWiredAndPullUpFilter, 1);
  GPIO_PinModeSet(TEMPHUMI_PORT, SDA_PIN, gpioModeWiredAndPullUpFilter, 1);

  // Route I2C pins to GPIO
  GPIO->I2CROUTE[0].SDAROUTE = (GPIO->I2CROUTE[0].SDAROUTE & ~_GPIO_I2C_SDAROUTE_MASK)
                        | (TEMPHUMI_PORT << _GPIO_I2C_SDAROUTE_PORT_SHIFT
                        | (SDA_PIN << _GPIO_I2C_SDAROUTE_PIN_SHIFT));
  GPIO->I2CROUTE[0].SCLROUTE = (GPIO->I2CROUTE[0].SCLROUTE & ~_GPIO_I2C_SCLROUTE_MASK)
                        | (TEMPHUMI_PORT << _GPIO_I2C_SCLROUTE_PORT_SHIFT
                        | (SCL_PIN << _GPIO_I2C_SCLROUTE_PIN_SHIFT));
  GPIO->I2CROUTE[0].ROUTEEN = GPIO_I2C_ROUTEEN_SDAPEN | GPIO_I2C_ROUTEEN_SCLPEN;

  // Initialize the I2C
  I2C_Init(I2C0, &i2cInit);

  // Enable automatic STOP on NACK
  I2C0->CTRL = I2C_CTRL_AUTOSN;
  CMU_ClockEnable(cmuClock_I2C0, true);
  I2C_Enable(I2C0, true);
}

uint16_t I2C_LeaderRead(uint16_t followerAddress, uint8_t command, uint8_t numBytes)
{
  // Transfer structure
  I2C_TransferSeq_TypeDef i2cTransfer;
  I2C_TransferReturn_TypeDef result;

  uint8_t  i2c_write_data[1];
  uint8_t  i2c_read_data[2];
  uint16_t rxBuff;

  // Initialize I2C transfer
  i2cTransfer.addr          = followerAddress << 1;
  i2cTransfer.flags         = I2C_FLAG_WRITE_READ; // must write target address before reading

  i2c_write_data[0] = command;
  i2cTransfer.buf[0].data   = i2c_write_data;
  i2cTransfer.buf[0].len    = 1;


  i2cTransfer.buf[1].data   = i2c_read_data;
  i2cTransfer.buf[1].len    = 2;

  result = I2C_TransferInit(I2C0, &i2cTransfer);

  // Send data
  while (result == i2cTransferInProgress) {
     result = I2C_Transfer(I2C0);
   }

  rxBuff = i2c_read_data[0];
  rxBuff = (rxBuff << 8) + i2c_read_data[1];
  return rxBuff;
}

float TempHumiSensor_getTemp()
{
	double temp;
	temp = (double)I2C_LeaderRead(I2C_FOLLOWER_ADDRESS, TEMP_ADDRESS , 2);
	temp = 175.72 * (temp / 65536.0) - 46.85;
	return temp;
}

float TempHumiSensor_getHumi()
{
	double humi;
	humi = (double)I2C_LeaderRead(I2C_FOLLOWER_ADDRESS, HUMI_ADDRESS, 2);
	humi = 125.0 * (humi / 65536.0) - 6.0;
	return humi;
}
