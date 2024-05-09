/*
 * led.c
 *
 *  Created on: Mar 15, 2024
 *      Author: HUY
 */

#include "app/framework/include/af.h"
#include "led.h"
#include "em_timer.h"
#include "em_cmu.h"
#include "em_device.h"
#include "em_emu.h"
#include "em_chip.h"
#include "em_gpio.h"
#define PWM_FREQ            1000

TIMER_Init_TypeDef timerInit = TIMER_INIT_DEFAULT;


static ledStruct rgbArray[LED_RGB_COUNT][LED_RGB_ELEMENT] = {LED_RGB_1, LED_RGB_2};

static struct {
	ledNumber ledIndex;
	ledColor  color;
	uint8_t   toggleTime;
	uint16_t  onTimeMs;
    uint16_t  offTimeMs;
} ledAction;


void ledInit(void)
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

void offLed(ledNumber index)
{
	for (int j = 0; j < LED_RGB_ELEMENT; j++)
	{
		GPIO_PinOutSet(rgbArray[index][j]. port, rgbArray[index][j]. pin);
	}
}

void onLed(ledNumber index, ledColor color)
{
	for (int j = 0; j < LED_RGB_ELEMENT; j++)
	if (((color >> j) & 0x01) == 1)
	{
		GPIO_PinOutClear(rgbArray[index][j]. port, rgbArray[index][j]. pin);
	}
	else GPIO_PinOutSet(rgbArray[index][j]. port, rgbArray[index][j]. pin);
}

void toggleLed(ledNumber ledIndex, ledColor color, uint8_t toggleTime, uint16_t onTimeMs,  uint16_t offTimeMs)
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

void initTIMER_PWM(void)
{
  TIMER_Init_TypeDef timerInit = TIMER_INIT_DEFAULT;
  TIMER_InitCC_TypeDef timerCCInit = TIMER_INITCC_DEFAULT;

  // Don't start counter on initialization
  timerInit.enable = false;

  // PWM mode sets/clears the output on compare/overflow events
  timerCCInit.mode = timerCCModePWM;

  TIMER_Init(TIMER0, &timerInit);

  // Route CC0 output to PA6
  GPIO->TIMERROUTE[0].ROUTEEN  = GPIO_TIMER_ROUTEEN_CC0PEN;
  GPIO->TIMERROUTE[0].CC0ROUTE = (gpioPortA << _GPIO_TIMER_CC0ROUTE_PORT_SHIFT)
                    | (4 << _GPIO_TIMER_CC0ROUTE_PIN_SHIFT);

  TIMER_InitCC(TIMER0, 0, &timerCCInit);

}
void dimLed(uint8_t duty_cycle)
{
   uint32_t timerFreq, topValue, dutyCount;

   duty_cycle = 100 - duty_cycle;
   timerFreq = CMU_ClockFreqGet(cmuClock_TIMER0) / (timerInit.prescale + 1);
   topValue = (timerFreq / PWM_FREQ);
   TIMER_TopSet(TIMER0, topValue);
   dutyCount = (topValue * duty_cycle) / 100;
   TIMER_CompareSet(TIMER0, 0, dutyCount);
   // Now start the TIMER
   TIMER_Enable(TIMER0, true);
}
