/*
 * button.h
 *
 *  Created on: Mar 14, 2024
 *      Author: HUY
 */

#ifndef SOURCE_MID_BUTTON_H_
#define SOURCE_MID_BUTTON_H_

typedef enum
{
	press_0,
	press_1,
	press_2,
	press_3,
} btnState_e;

typedef void (*buttonCallbackFunction) (uint8_t, btnState_e);
void buttonInit (buttonCallbackFunction);


#endif /* SOURCE_MID_BUTTON_H_ */
