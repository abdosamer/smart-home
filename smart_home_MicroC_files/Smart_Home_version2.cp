#line 1 "E:/the collega/comunication 2 term 2/microcontroler/HomeAutomation/final/smart_home_version2/Smart_Home_version2.c"
char deto;
int statue=0;
int alert_state=0;

sbit LCD_RS at RC4_bit;
sbit LCD_EN at RC5_bit;
sbit LCD_D7 at RC3_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D4 at RC0_bit;


sbit LCD_RS_Direction at TRISC4_bit;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D7_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC0_bit;


 void INTERRUPT()
 {
 if(INTCON.RBIF==1)
 {


 INTCON.B0=0;
 }

 if(statue==0)
 {
 if(portb.b0==1)
 {
 Delay_ms(20);

 if(portb.b0==1)
 {
 portb.b3=1;
 portb.b4=1;
 alert_state=1;
 }}else
 {

 }
 if(portb.b1==1)
 {Delay_ms(20);

 if(portb.b1==1)
 {
 if(alert_state==1)
 {
 portb.b3=0;
 portb.b4=0;
 alert_state=0;
 }else if (alert_state==0)
 {
 portb.b3=1;
 portb.b4=1;
 alert_state=1;
 }

 }}else
 {

 }
 statue=1;
 }else
 {
 statue=0;
 }





 }


void main() {


 UART1_Init(9600);
 lcd_Init();
 option_reg=0b10000000;
 INTCON=0b10001000;

TRISB=0b11000011;
 portb.b1=0;
 portb.b2=0;

 portb=0x00;
 TRISD=0;
 portd=0x00;
 portd.b4=0;
 portd.b5=1;
 portd.b6=0;
 portd.b7=1;

 Lcd_Cmd(_LCD_CURSOR_OFF);
 while(1)
 {

 if (UART1_Data_Ready() == 1)
 {

 lcd_out(1,1,"good");
 deto = UART1_Read();
 if(deto =='1')
 {
 if(portd.b0==0)
 {portd.b0=1;
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"good");
 lcd_out(2,1,"room 1 on");}
 else
 {Lcd_Cmd(_LCD_CLEAR);
 portd.b0=0;
 lcd_out(1,1,"good");
 lcd_out(2,1,"room 1 off");}


 }else if(deto == '2')
 {
 if(portd.b1==0)
 {portd.b1=1;
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"good");
 lcd_out(2,1,"room 2 on");}
 else
 {Lcd_Cmd(_LCD_CLEAR);
 portd.b1=0;
 lcd_out(1,1,"good");
 lcd_out(2,1,"room 2 off");}

 }else if(deto == '3')
 {
 if(portd.b2==0)
 {portd.b2=1;
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"good");
 lcd_out(2,1,"room 3 on");}
 else
 {Lcd_Cmd(_LCD_CLEAR);
 portd.b2=0;
 lcd_out(1,1,"good");
 lcd_out(2,1,"room 3 off");}

 }else if(deto == '4')
 {
 if(portd.b3==0)
 {portd.b3=1;
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"good");
 lcd_out(2,1,"room 4 on");}
 else
 {Lcd_Cmd(_LCD_CLEAR);
 portd.b3=0;
 lcd_out(1,1,"good");
 lcd_out(2,1,"room 4 off");}

 }else if(deto == '6')
 {
 if(portd.b6==0)
 {portd.b6=1;
 portd.b7=0;
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"garage Opened");}
 else
 {Lcd_Cmd(_LCD_CLEAR);
 portd.b6=0;
 portd.b7=1;
 lcd_out(1,1,"garage Closed");}

 }else if(deto == '5')
 {
 if(portd.b4==0)
 {portd.b4=1;
 portd.b5=0;
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"good");
 lcd_out(2,1,"mainDoor Opened");}
 else
 {Lcd_Cmd(_LCD_CLEAR);
 portd.b4=0;
 portd.b5=1;
 lcd_out(1,1,"good");
 lcd_out(2,1,"mainDoor Closed");}

 }else if (deto=='7')
 {
 portd=0x00;
 portb.b3=0;
 portb.b4=0;
 portd.b5=1;
 portd.b7=1;
 portd.b3=0;
 portd.b4=0;
 Lcd_Cmd(_LCD_CLEAR);

 lcd_out(2,1,"System restarted");
 }
 }else if (UART1_Data_Ready() == 0)
 {

 }




 }
}
