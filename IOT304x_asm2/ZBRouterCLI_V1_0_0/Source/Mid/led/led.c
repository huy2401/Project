/*
 * led.c
 *
 *  Created on: Mar 15, 2024
 *      Author: HUY
 */

#include "app/framework/include/af.h"
#include "led.h"
#include "em_cmu.h"


static ledStruct rgbArray[LED_RGB_COUNT][LED_RGB_ELEMENT] = {LED_RGB_1, LED_RGB_2};

static struct {
	ledNumber ledIndex;
	ledColor  color;
	uint8_t   toggleTime;
	uint16_t  onTimeMs;
    uint16_t  offTimeMs;
} ledAction;


void ledInit(void) // Cau hinh LED
{
	CMU_ClockEnable(cmuClock_GPIO, true);
	for (int i = 0; i < LED_RGB_COUNT; i++)
	{
		for (int j = 0; j < LED_RGB_ELEMENT; j++)
		{
			GPIO_PinModeSet(rgbArray[i][j]. port, rgbArray[i][j]. pin, gpioModePushPull, 1);
		}
	}
}

void offLed(ledNumber index) // Tat LED
{
	for (int j = 0; j < LED_RGB_ELEMENT; j++)
	{
		GPIO_PinOutSet(rgbArray[index][j]. port, rgbArray[index][j]. pin);
	}
}

void onLed(ledNumber index, ledColor color) // Bat led
{
	for (int j = 0; j < LED_RGB_ELEMENT; j++)
	if (((color >> j) & 0x01) == 1)
	{
		GPIO_PinOutClear(rgbArray[index][j]. port, rgbArray[index][j]. pin);
	}
	else GPIO_PinOutSet(rgbArray[index][j]. port, rgbArray[index][j]. pin);
}

void toggleLed(ledNumber ledIndex, ledColor color, uint8_t toggleTime, uint16_t onTimeMs,  uint16_t offTimeMs)// Nhay LED
{
	ledAction.ledIndex = ledIndex;
	ledAction.color = color;
	ledAction.offTimeMs = offTimeMs;
	ledAction.onTimeMs = onTimeMs;
	ledAction.toggleTime = toggleTime*2;
	emberEventControlSetActive(ledToggleEventControl);
}

void ledToggleEventHandler()
{
	emberEventControlSetInactive(ledToggleEventControl);
	if (ledAction.toggleTime-- > 0)
	{
		if (ledAction.toggleTime % 2 == 1)
		{
	       for (int j = 0; j < LED_RGB_ELEMENT; j++)
	           if (((ledAction.color >> j) & 0x01) == 1)
	       			GPIO_PinOutClear(rgbArray[ledAction.ledIndex][j]. port, rgbArray[ledAction.ledIndex][j]. pin);
	           else GPIO_PinOutSet(rgbArray[ledAction.ledIndex][j]. port, rgbArray[ledAction.ledIndex][j]. pin);

	       emberEventControlSetDelayMS(ledToggleEventControl, ledAction.onTimeMs);
		}
		else
		{
			for (int j = 0; j < LED_RGB_ELEMENT; j++)
				GPIO_PinOutSet(rgbArray[ledAction.ledIndex][j]. port, rgbArray[ledAction.ledIndex][j]. pin);
			emberEventControlSetDelayMS(ledToggleEventControl, ledAction.offTimeMs);

		}

	}
}

