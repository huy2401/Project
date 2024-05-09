/*
 * Keypad.h
 *
 *  Created on: Apr 24, 2021
 *      Author: Admin
 */

#ifndef KEYPAD_KEYPAD_H_
#define KEYPAD_KEYPAD_H_

#include "Delay.h"

#define  padRows  5
#define  padCols  4

char keypad_getkey(void);
void keypad_Init(void);




#endif /* KEYPAD_KEYPAD_H_ */
