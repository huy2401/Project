/*
 * button.c
 *
 *  Created on: Mar 14, 2024
 *      Author: HUY
 */

#include "app/framework/include/af.h"
#include "button.h"

buttonCallbackFunction btnCallbackFunc = NULL;

void buttonInit (buttonCallbackFunction callbackInit)
{
	 emberAfCorePrintln("Button Init");
	 if (callbackInit != NULL)
		 btnCallbackFunc = callbackInit;
}

void emberAfHalButtonIsrCallback(uint8_t button, uint8_t state)
{
	btnCallbackFunc(button,state);

}
