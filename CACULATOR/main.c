#include "include.h"
#include "LCD/LCD.h"
#include "KEYPAD/Keypad.h"
#include "KEYPAD/Delay.h"
#include "Tinh/Tinh.h"

const double max=999999999999999,min=0.00000000000001;

char charc[100];
int i;

void clear()
{
    int a;
    Lcd_Temizle();
    for(a=0; a<100; a++)
    {
        charc[a]=0;
    }
    Lcd_Goto(1,1);
    i=0;
}
void print(double x)
{
    int so,kytu=0;
    double t=10;
    char s[100];
    if (x<0)
        {
               s[kytu++]='-';
               x=-x;
        }
    while (t<=x) t*=10;
    do
    {
     t/=10;
     so=(int)floor(x/t+min);
     x= x -so*t;
     s[kytu++]=so+48;
    }
    while (t>1);
    if ( x>0 && kytu<15 )
    {
      s[kytu++]='.';
      while ( x>0 && kytu<16)
       {
            x *=10;
            so =(int) floor(x+min);
            s[kytu++]=so+48;
            x=x-so;
       }
     }
     for (so = 0;so < kytu; so++) Lcd_Putch(s[so],1);

}

void cclear(void)
{
     delay_ms(500);
     keypad_getkey();
     clear();
}

void calculate(void)
{
	    Lcd_Goto(2,1);
	    int kt = error(charc);
	    if (kt) Lcd_Puts("Symtax Error");
	    else
	    {
	        double Kq = xuly(charc);
	        if (Kq>max) Lcd_Puts("Math Error");
	        else print(Kq);
	    }
	    cclear();

}


void main(void)
    {
    SysCtlClockSet(SYSCTL_SYSDIV_4 | SYSCTL_USE_PLL | SYSCTL_OSC_MAIN | SYSCTL_XTAL_16MHZ);
    Lcd_init();
    keypad_Init();
    while(1)
    {
        int j;
        for(i = 1; i<100; i++)
        {
            if(i<=16)
            {
                Lcd_Goto(1,i);
                charc[i-1] = keypad_getkey();
                Lcd_Putch(charc[i-1], 1);
                if(charc[i-1] == '=')
                {
                    calculate();
                }
                if(charc[i-1] == 'C')
                {
                    clear();
                }
                delay_ms(500);
            }
            else
            {
                Lcd_Goto(1,16);
                charc[i-1] = keypad_getkey();
                Lcd_Goto(1,1);
                Lcd_Temizle();
                for(j = i-15; j <= i; j++)
                {
                    Lcd_Putch(charc[j-1], 1);
                }
                if(charc[i-1] == '=')
                {
                    calculate();
                }
                if(charc[i-1] == 'C')
                {
                    clear();
                }
                delay_ms(500);
            }
        }
    }
}
