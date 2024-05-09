/*
 * LCD.h
 *
 *  Created on: Apr 23, 2021
 *      Author: Admin
 */

#ifndef LCD_LCD_H_
#define LCD_LCD_H_


#define LCD_PORT                         GPIO_PORTB_BASE
#define LCD_PORT_ENABLE                  SYSCTL_PERIPH_GPIOB
#define RS                               GPIO_PIN_0
#define E                                GPIO_PIN_1
#define D4                               GPIO_PIN_4
#define D5                               GPIO_PIN_5
#define D6                               GPIO_PIN_6
#define D7                               GPIO_PIN_7

void Lcd_Temizle(void);
void Lcd_Puts(char*);
void Lcd_Goto(char,char);
void Lcd_init(void);
void Lcd_Putch(unsigned char,int type);


#endif /* LCD_LCD_H_ */
