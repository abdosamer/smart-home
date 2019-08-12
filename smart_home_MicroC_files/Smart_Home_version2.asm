
_INTERRUPT:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Smart_Home_version2.c,21 :: 		void INTERRUPT()
;Smart_Home_version2.c,23 :: 		if(INTCON.RBIF==1)
	BTFSS      INTCON+0, 0
	GOTO       L_INTERRUPT0
;Smart_Home_version2.c,27 :: 		INTCON.B0=0;
	BCF        INTCON+0, 0
;Smart_Home_version2.c,28 :: 		}
L_INTERRUPT0:
;Smart_Home_version2.c,30 :: 		if(statue==0)
	MOVLW      0
	XORWF      _statue+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__INTERRUPT46
	MOVLW      0
	XORWF      _statue+0, 0
L__INTERRUPT46:
	BTFSS      STATUS+0, 2
	GOTO       L_INTERRUPT1
;Smart_Home_version2.c,32 :: 		if(portb.b0==1)
	BTFSS      PORTB+0, 0
	GOTO       L_INTERRUPT2
;Smart_Home_version2.c,34 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_INTERRUPT3:
	DECFSZ     R13+0, 1
	GOTO       L_INTERRUPT3
	DECFSZ     R12+0, 1
	GOTO       L_INTERRUPT3
	NOP
	NOP
;Smart_Home_version2.c,36 :: 		if(portb.b0==1)
	BTFSS      PORTB+0, 0
	GOTO       L_INTERRUPT4
;Smart_Home_version2.c,38 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;Smart_Home_version2.c,39 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;Smart_Home_version2.c,40 :: 		alert_state=1;
	MOVLW      1
	MOVWF      _alert_state+0
	MOVLW      0
	MOVWF      _alert_state+1
;Smart_Home_version2.c,41 :: 		}}else
L_INTERRUPT4:
	GOTO       L_INTERRUPT5
L_INTERRUPT2:
;Smart_Home_version2.c,44 :: 		}
L_INTERRUPT5:
;Smart_Home_version2.c,45 :: 		if(portb.b1==1)
	BTFSS      PORTB+0, 1
	GOTO       L_INTERRUPT6
;Smart_Home_version2.c,46 :: 		{Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_INTERRUPT7:
	DECFSZ     R13+0, 1
	GOTO       L_INTERRUPT7
	DECFSZ     R12+0, 1
	GOTO       L_INTERRUPT7
	NOP
	NOP
;Smart_Home_version2.c,48 :: 		if(portb.b1==1)
	BTFSS      PORTB+0, 1
	GOTO       L_INTERRUPT8
;Smart_Home_version2.c,50 :: 		if(alert_state==1)
	MOVLW      0
	XORWF      _alert_state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__INTERRUPT47
	MOVLW      1
	XORWF      _alert_state+0, 0
L__INTERRUPT47:
	BTFSS      STATUS+0, 2
	GOTO       L_INTERRUPT9
;Smart_Home_version2.c,52 :: 		portb.b3=0;
	BCF        PORTB+0, 3
;Smart_Home_version2.c,53 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;Smart_Home_version2.c,54 :: 		alert_state=0;
	CLRF       _alert_state+0
	CLRF       _alert_state+1
;Smart_Home_version2.c,55 :: 		}else if (alert_state==0)
	GOTO       L_INTERRUPT10
L_INTERRUPT9:
	MOVLW      0
	XORWF      _alert_state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__INTERRUPT48
	MOVLW      0
	XORWF      _alert_state+0, 0
L__INTERRUPT48:
	BTFSS      STATUS+0, 2
	GOTO       L_INTERRUPT11
;Smart_Home_version2.c,57 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;Smart_Home_version2.c,58 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;Smart_Home_version2.c,59 :: 		alert_state=1;
	MOVLW      1
	MOVWF      _alert_state+0
	MOVLW      0
	MOVWF      _alert_state+1
;Smart_Home_version2.c,60 :: 		}
L_INTERRUPT11:
L_INTERRUPT10:
;Smart_Home_version2.c,62 :: 		}}else
L_INTERRUPT8:
	GOTO       L_INTERRUPT12
L_INTERRUPT6:
;Smart_Home_version2.c,65 :: 		}
L_INTERRUPT12:
;Smart_Home_version2.c,66 :: 		statue=1;
	MOVLW      1
	MOVWF      _statue+0
	MOVLW      0
	MOVWF      _statue+1
;Smart_Home_version2.c,67 :: 		}else
	GOTO       L_INTERRUPT13
L_INTERRUPT1:
;Smart_Home_version2.c,69 :: 		statue=0;
	CLRF       _statue+0
	CLRF       _statue+1
;Smart_Home_version2.c,70 :: 		}
L_INTERRUPT13:
;Smart_Home_version2.c,76 :: 		}
L_end_INTERRUPT:
L__INTERRUPT45:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _INTERRUPT

_main:

;Smart_Home_version2.c,79 :: 		void main() {
;Smart_Home_version2.c,82 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Smart_Home_version2.c,83 :: 		lcd_Init();
	CALL       _Lcd_Init+0
;Smart_Home_version2.c,84 :: 		option_reg=0b10000000;
	MOVLW      128
	MOVWF      OPTION_REG+0
;Smart_Home_version2.c,85 :: 		INTCON=0b10001000;
	MOVLW      136
	MOVWF      INTCON+0
;Smart_Home_version2.c,87 :: 		TRISB=0b11000011;
	MOVLW      195
	MOVWF      TRISB+0
;Smart_Home_version2.c,88 :: 		portb.b1=0;
	BCF        PORTB+0, 1
;Smart_Home_version2.c,89 :: 		portb.b2=0;
	BCF        PORTB+0, 2
;Smart_Home_version2.c,91 :: 		portb=0x00;
	CLRF       PORTB+0
;Smart_Home_version2.c,92 :: 		TRISD=0;
	CLRF       TRISD+0
;Smart_Home_version2.c,93 :: 		portd=0x00;
	CLRF       PORTD+0
;Smart_Home_version2.c,94 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;Smart_Home_version2.c,95 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;Smart_Home_version2.c,96 :: 		portd.b6=0;
	BCF        PORTD+0, 6
;Smart_Home_version2.c,97 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;Smart_Home_version2.c,99 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,100 :: 		while(1)
L_main14:
;Smart_Home_version2.c,103 :: 		if (UART1_Data_Ready() == 1)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;Smart_Home_version2.c,106 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,107 :: 		deto = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _deto+0
;Smart_Home_version2.c,108 :: 		if(deto =='1')
	MOVF       R0+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Smart_Home_version2.c,110 :: 		if(portd.b0==0)
	BTFSC      PORTD+0, 0
	GOTO       L_main18
;Smart_Home_version2.c,111 :: 		{portd.b0=1;
	BSF        PORTD+0, 0
;Smart_Home_version2.c,112 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,113 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,114 :: 		lcd_out(2,1,"room 1 on");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main19
L_main18:
;Smart_Home_version2.c,116 :: 		{Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,117 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;Smart_Home_version2.c,118 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,119 :: 		lcd_out(2,1,"room 1 off");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main19:
;Smart_Home_version2.c,122 :: 		}else if(deto == '2')
	GOTO       L_main20
L_main17:
	MOVF       _deto+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;Smart_Home_version2.c,124 :: 		if(portd.b1==0)
	BTFSC      PORTD+0, 1
	GOTO       L_main22
;Smart_Home_version2.c,125 :: 		{portd.b1=1;
	BSF        PORTD+0, 1
;Smart_Home_version2.c,126 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,127 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,128 :: 		lcd_out(2,1,"room 2 on");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main23
L_main22:
;Smart_Home_version2.c,130 :: 		{Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,131 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;Smart_Home_version2.c,132 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,133 :: 		lcd_out(2,1,"room 2 off");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main23:
;Smart_Home_version2.c,135 :: 		}else if(deto == '3')
	GOTO       L_main24
L_main21:
	MOVF       _deto+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_main25
;Smart_Home_version2.c,137 :: 		if(portd.b2==0)
	BTFSC      PORTD+0, 2
	GOTO       L_main26
;Smart_Home_version2.c,138 :: 		{portd.b2=1;
	BSF        PORTD+0, 2
;Smart_Home_version2.c,139 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,140 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,141 :: 		lcd_out(2,1,"room 3 on");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main27
L_main26:
;Smart_Home_version2.c,143 :: 		{Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,144 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;Smart_Home_version2.c,145 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,146 :: 		lcd_out(2,1,"room 3 off");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main27:
;Smart_Home_version2.c,148 :: 		}else if(deto == '4')
	GOTO       L_main28
L_main25:
	MOVF       _deto+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_main29
;Smart_Home_version2.c,150 :: 		if(portd.b3==0)
	BTFSC      PORTD+0, 3
	GOTO       L_main30
;Smart_Home_version2.c,151 :: 		{portd.b3=1;
	BSF        PORTD+0, 3
;Smart_Home_version2.c,152 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,153 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,154 :: 		lcd_out(2,1,"room 4 on");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main31
L_main30:
;Smart_Home_version2.c,156 :: 		{Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,157 :: 		portd.b3=0;
	BCF        PORTD+0, 3
;Smart_Home_version2.c,158 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,159 :: 		lcd_out(2,1,"room 4 off");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main31:
;Smart_Home_version2.c,161 :: 		}else if(deto == '6')
	GOTO       L_main32
L_main29:
	MOVF       _deto+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L_main33
;Smart_Home_version2.c,163 :: 		if(portd.b6==0)
	BTFSC      PORTD+0, 6
	GOTO       L_main34
;Smart_Home_version2.c,164 :: 		{portd.b6=1;
	BSF        PORTD+0, 6
;Smart_Home_version2.c,165 :: 		portd.b7=0;
	BCF        PORTD+0, 7
;Smart_Home_version2.c,166 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,167 :: 		lcd_out(1,1,"garage Opened");}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main35
L_main34:
;Smart_Home_version2.c,169 :: 		{Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,170 :: 		portd.b6=0;
	BCF        PORTD+0, 6
;Smart_Home_version2.c,171 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;Smart_Home_version2.c,172 :: 		lcd_out(1,1,"garage Closed");}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main35:
;Smart_Home_version2.c,174 :: 		}else if(deto == '5')
	GOTO       L_main36
L_main33:
	MOVF       _deto+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main37
;Smart_Home_version2.c,176 :: 		if(portd.b4==0)
	BTFSC      PORTD+0, 4
	GOTO       L_main38
;Smart_Home_version2.c,177 :: 		{portd.b4=1;
	BSF        PORTD+0, 4
;Smart_Home_version2.c,178 :: 		portd.b5=0;
	BCF        PORTD+0, 5
;Smart_Home_version2.c,179 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,180 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,181 :: 		lcd_out(2,1,"mainDoor Opened");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main39
L_main38:
;Smart_Home_version2.c,183 :: 		{Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,184 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;Smart_Home_version2.c,185 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;Smart_Home_version2.c,186 :: 		lcd_out(1,1,"good");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr22_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,187 :: 		lcd_out(2,1,"mainDoor Closed");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr23_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main39:
;Smart_Home_version2.c,189 :: 		}else if (deto=='7')
	GOTO       L_main40
L_main37:
	MOVF       _deto+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L_main41
;Smart_Home_version2.c,191 :: 		portd=0x00;
	CLRF       PORTD+0
;Smart_Home_version2.c,192 :: 		portb.b3=0;
	BCF        PORTB+0, 3
;Smart_Home_version2.c,193 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;Smart_Home_version2.c,194 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;Smart_Home_version2.c,195 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;Smart_Home_version2.c,196 :: 		portd.b3=0;
	BCF        PORTD+0, 3
;Smart_Home_version2.c,197 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;Smart_Home_version2.c,198 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Smart_Home_version2.c,200 :: 		lcd_out(2,1,"System restarted");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr24_Smart_Home_version2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Smart_Home_version2.c,201 :: 		}
L_main41:
L_main40:
L_main36:
L_main32:
L_main28:
L_main24:
L_main20:
;Smart_Home_version2.c,202 :: 		}else if (UART1_Data_Ready() == 0)
	GOTO       L_main42
L_main16:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main43
;Smart_Home_version2.c,205 :: 		}
L_main43:
L_main42:
;Smart_Home_version2.c,210 :: 		}
	GOTO       L_main14
;Smart_Home_version2.c,211 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
