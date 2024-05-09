#include "app/framework/include/af.h"
#include <stdio.h>
#include "Source/Drive/Light_sensor/Light_sensor.h"
#include "Source/Drive/TemHumi_sensor/TemHumi_sensor.h"

EmberEventControl TempHumi_LightEventControl;

/**
 * @func   emberAfMainInitCallback
 * @brief  Ham khoi chay moi khi khoi dong chuong trinh
 *         Cau hinh IADC0 de giao tiep cam bien anh sang
 *         Cau hinh I2C de giao tiep cam bien nhiet do, do am
 *         Khoi dong su kien TempHumi_LightEventControl
 * @param  void
 * @reveal void
 */

void emberAfMainInitCallback(void)
{
	emberAfCorePrintln("Main Init Callback");
	CMU_ClockEnable(cmuClock_GPIO, true);
	initI2C();
	initIADC();
	emberEventControlSetActive(TempHumi_LightEventControl);
}

EmberEventControl TempHumi_LightEventControl;

/**
 * @func   KalmanFilter
 * @brief  Bo long Kalman xu lý nhieu
 * @param  mea : gia tri do duoc
 *         so thu tu
 * @reveal Gia tri sau khi da loc nhieu
 */

static double KalmanFilter(double mea, uint8_t i)
{
    static double r[3] = {1,1,1};
    static double p[3] = {1,1,1};
    static double q[3] = {0.01, 0.01, 0.01};
    static double x[3] = {-1,-1,-1};
    static double k[3];
    if (x[i] == -1) x[i] = mea;
    else
    {
        p[i] = p[i] + q[i];
        k[i] = p[i]/(p[i] + r[i]);
        x[i] = x[i] + k[i] * (mea - x[i]);
        p[i] = (1.0 - k[i])* p[i];
    }
    return x[i];
}

/**
 * @func   TempHumi_LightEventHandler()
 * @brief  Ham su kien do, tinh toan cac gia tri nhiet do, do
 *         am, cuong do anh sang roi ghi ra man hinh
 * @param  void
 * @reveal void
 */

void TempHumi_LightEventHandler()
{
	static float temp, humi;
	static uint16_t Light;
	static char s[30];
	static uint8_t dem = 0;
	dem = (dem + 1) % 100;
	emberEventControlSetInactive(TempHumi_LightEventControl);
	emberEventControlSetDelayMS(TempHumi_LightEventControl, 100);
	temp = KalmanFilter(TempHumiSensor_getTemp(), 0);
	humi = KalmanFilter(TempHumiSensor_getHumi(), 1);
	Light = KalmanFilter(LightSensor_getLight(), 2);
	if (dem  % 100 == 0) // 10s thi ghi gia tri nhiet do, do am ra man hinh
	{
	    sprintf(s,"Temp = %.2f", temp);
	    emberAfCorePrintln(s);
	    sprintf(s,"Humi = %.2f", humi);
	    emberAfCorePrintln(s);
	}
	if (dem % 50 == 0) // 5s thi ghi gia tri cuong do anh sang ra man hinh
	{
	    sprintf(s, "Lux = %d", Light);
	    emberAfCorePrintln(s);
	}
}

