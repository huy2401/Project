
// [PE1 - PE5] -> [R1 - R5]  Raws
// [PC4 - PC7] -> [C1 - C4]  Cols
#include "Keypad.h"
#include "tm4c123gh6pm.h"

unsigned int ncols = 0;
unsigned int nrows = 0;
unsigned const char symbol[padRows][padCols] = {{ '+', '-',  '*', '/'},
                                                { '1', '2',  '3', '^'},
                                                { '4', '5',  '6', '('},
                                                { '7', '8',  '9', ')'},
                                                { '.', '0',  '=', 'C'}};

void keypad_Init(void)
{
  SYSCTL_RCGCGPIO_R |= 0x14;            //enable clc for port C & E
  while ((SYSCTL_RCGCGPIO_R&0x14)==0);  //wait for clock to be enabled
  GPIO_PORTC_CR_R  |= 0xF0;             //allow changes to all the bits in port C
  GPIO_PORTE_CR_R  |= 0x3E;             //allow changes to all the bits in port E
  GPIO_PORTC_DIR_R |= 0xF0;             //set directions cols are o/ps
  GPIO_PORTE_DIR_R |= 0x00;             //set directions raws are i/ps
  GPIO_PORTE_PDR_R |= 0x3E;             //pull down resistor on Raws
  GPIO_PORTC_DEN_R |= 0xF0;             //digital enable pins in port C
  GPIO_PORTE_DEN_R |= 0x3E;             //digital enable pins in port E
}

char keypad_getkey(void)
{
  while(1)
  {
	int i;
    for(i = 0; i < 4; i++)                        //columns traverse
    {
      GPIO_PORTC_DATA_R = (1U << i+4);
      delay_us(2);
      int j;
      for(j = 0; j < 5; j++)                     //raws traverse
      {
        if((GPIO_PORTE_DATA_R & 0x3E) & (1U << j+1))
          return symbol[4-j][i];
      }
    }
  }
}
