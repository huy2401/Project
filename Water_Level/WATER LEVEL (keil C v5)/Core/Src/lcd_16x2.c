/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *                                                                                 *
 *                                  lcd_bvh.c                                      *
 *                                                                                 *
 *                        writed by BUI VAN HUY 16/10/2019                         *
 *                                 16ETE - DUT                                     *
 *                                                                                 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#include "lcd_16x2.h"

/************************************** Static declarations **************************************/
static    void    lcd_write_data( uint8_t data);
static    void    lcd_write_command(uint8_t command);
static    void    lcd_write( uint8_t data, uint8_t LENG);
static    void    Lcd_configure(void);
//static    void    Lcd_write_int(int x);

 Lcd_PortType ports[4]    =    { D4_GPIO_Port, D5_GPIO_Port, D6_GPIO_Port, D7_GPIO_Port};
 Lcd_PinType  pins[4]     =    {D4_Pin, D5_Pin, D6_Pin, D7_Pin};
 

 /********************************************************************************************
 ******                            Public Function                                      ******
 ********************************************************************************************/
 /**/
 
 /**
 ** Initialization LCD 16x2
 **/
void Lcd_Init(void) 
{  
	    Lcd_configure();
			lcd_write_command(0x33);
			lcd_write_command(0x32);
			lcd_write_command(FUNCTION_SET | OPT_N);				// 4-bit mode
	    lcd_write_command(CLEAR_DISPLAY);						          // Clear screen
	    lcd_write_command(DISPLAY_ON_OFF_CONTROL | OPT_D);		// Lcd-on, cursor-off, no-blink
    	lcd_write_command(ENTRY_MODE_SET | OPT_INC);			    // Increment cursor
}
/**/
//_____________________________________________________________________________________________________

/**
 * Write a interger variable on the LCD
 */

/**/
//_____________________________________________________________________________________________________


/**
 * Write a string on the LCD
 */
void Lcd_write_string(char * string)
{
	for(uint8_t i = 0; i < strlen(string); i++)
	{
		lcd_write_data( string[i]);
	}
}
/**/
//_____________________________________________________________________________________________________



/**
 * Clear the screen
 */
void Lcd_clear_display(void)
{
	lcd_write_command(CLEAR_DISPLAY);
}
/**/
//_____________________________________________________________________________________________________





/*****
 **go to x,y
 *****/

void Lcd_gotoxy( uint8_t x, uint8_t y)
{
#if LINES == 1 
	lcdwrite_command(LCDSET_DDRAM_ADDRESS |
		(START_LINE_1 + x));
#elif LINES == 2
	if (y == 0)
		lcd_write_command( SET_DDRAM_ADDRESS | (START_LINE_1 + x));
	else
		lcd_write_command( SET_DDRAM_ADDRESS | (START_LINE_2 + x));
#endif
}
/**/
//_____________________________________________________________________________________________________


/**/
//_____________________________________________________________________________________________________





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * *                                  Static function definition                                * * *
* * *                                           NO USE                                           * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

 void Lcd_configure(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	// GPIO clock for control and data lines
	
  __HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();
	
	// Configure RS_PIN
	GPIO_InitStruct.Pin = RS_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(RS_GPIO_Port, &GPIO_InitStruct);
	
		// Configure EN_PIN
	GPIO_InitStruct.Pin = EN_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(EN_GPIO_Port, &GPIO_InitStruct);
	
	
	 //Configure RW_PIN
	
	GPIO_InitStruct.Pin = RW_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(RW_GPIO_Port, &GPIO_InitStruct);
	
	HAL_GPIO_WritePin(RW_GPIO_Port,RW_Pin,GPIO_PIN_RESET);
 
 
	// Configure D4_PIN
	GPIO_InitStruct.Pin = D4_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(D4_GPIO_Port, &GPIO_InitStruct);
	
	// Configure D5_PIN
	GPIO_InitStruct.Pin = D5_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(D5_GPIO_Port, &GPIO_InitStruct);
	
	// Configure D6_PIN
	GPIO_InitStruct.Pin = D6_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(D6_GPIO_Port, &GPIO_InitStruct);
	
	// Configure D7_PIN
	GPIO_InitStruct.Pin = D7_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(D7_GPIO_Port, &GPIO_InitStruct);
	
}


void lcd_write_command(uint8_t command)
{
	HAL_GPIO_WritePin(RS_GPIO_Port, RS_Pin, LCD_COMMAND_REG);		// Write to command register

		lcd_write((command >> 4), LCD_NIB);
		lcd_write(command & 0x0F, LCD_NIB);
}


void lcd_write_data( uint8_t data)
{
	  HAL_GPIO_WritePin(RS_GPIO_Port, RS_Pin, LCD_DATA_REG);			// Write to data register
		
	  lcd_write(data >> 4, LCD_NIB);
		lcd_write(data & 0x0F, LCD_NIB);
}


void lcd_write( uint8_t data, uint8_t LENG)
{
	for(uint8_t i = 0; i < LENG; i++)
	{
		if( ((data >> i) & 0x01) == 0)
	   	HAL_GPIO_WritePin(ports[i], pins[i], GPIO_PIN_RESET);
		else
			HAL_GPIO_WritePin(ports[i], pins[i], GPIO_PIN_SET);	
	}

	HAL_GPIO_WritePin(EN_GPIO_Port, EN_Pin, GPIO_PIN_SET);
	HAL_Delay(1);
	HAL_GPIO_WritePin(EN_GPIO_Port, EN_Pin, GPIO_PIN_RESET); 		// Data receive on falling edge
}

void Lcd_write_char(char ch)
{
	  lcd_write_data(ch);
}

void Lcd_write_int(long int x)
{
    int so,kytu=0;
    double t=10;
    char s[16];
    if (x<0)
        {
               s[kytu++]='-';
               x=-x;
        }
    while (t<=x) t*=10;
    do
    {
     t/=10;
     so=x/t;
     x=x -so*t;
     s[kytu++]=so+48;
    }
		while (t>1);
    for (so = 0;so < kytu; so++) Lcd_write_char(s[so]);
}

