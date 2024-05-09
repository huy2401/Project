/*
 * led.h
 *
 *  Created on: Mar 15, 2024
 *      Author: HUY
 */

#ifndef SOURCE_MID_LED_LED_H_
#define SOURCE_MID_LED_LED_H_

#define LED_RGB_COUNT             2
#define LED_RGB_ELEMENT           3

#define LED_PORT_1                gpioPortA
#define LED_BLUE_PIN_1            0U
#define LED_GREEN_PIN_1           3U
#define LED_RED_PIN_1             4U

#define LED_PORT_2                gpioPortD
#define LED_BLUE_PIN_2            2U
#define LED_GREEN_PIN_2           1U
#define LED_RED_PIN_2             0U

#define LED_RGB_1                 {{LED_PORT_1, LED_BLUE_PIN_1},{LED_PORT_1, LED_GREEN_PIN_1},{LED_PORT_1, LED_RED_PIN_1}}
#define LED_RGB_2                 {{LED_PORT_2, LED_BLUE_PIN_2},{LED_PORT_2, LED_GREEN_PIN_2},{LED_PORT_2, LED_RED_PIN_2}}

typedef struct
{
    GPIO_Port_TypeDef   port;
    unsigned int        pin;
} ledStruct;

typedef enum {
	ledoff = 0x000,
	ledBlue  =  BIT(0),
	ledGreen =  BIT(1),
	ledRed   =  BIT(2),
	ledPink  =  BIT(2) | BIT (0),
	ledYellow = BIT(2) | BIT (1)
}ledColor;

typedef enum {
	red,
	green,
	blue,
	off
} RGB_state;

typedef enum
{
	LED_1,
	LED_2
}ledNumber;

EmberEventControl ledToggleEventControl;

void ledInit(void);
void offLed(ledNumber index);
void onLed (ledNumber index, ledColor color);
void toggleLed(ledNumber index, ledColor color, uint8_t toggleTime, uint16_t onTimeMS, uint16_t offTimeMS);
void initTIMER_PWM();
void dimLed(uint8_t duty_cycle);
#endif /* SOURCE_MID_LED_LED_H_ */
