;
; LAB_02_Interupt_int1.asm
;
; Created: 27-09-2021 14:26:22
; Author : suhas
;

#include "m8def.inc"

.org 0 
rjmp reset ; 

.org 0x0000;        
rjmp int1_ISR;

.org 0x0100;

reset:
        LDI R16,0x70 ; 
        OUT SPL,R16 ;
        LDI R16,0x00;
        OUT SPH,R16;

        LDI R16,0x01;
        OUT DDRB,R16;

        LDI R16,0x00;
        OUT DDRD,R16;

        IN R16, MCUCR;	
        ORI R16, 0x00;
        OUT MCUCR, R16;

        IN R16, GICR;		
        ORI R16, 0x80;
        OUT GICR, R16;

        LDI R16, 0x00;
        OUT PORTB, R16;

        SEI;

ind_loop:
    RJMP ind_loop;

int1_ISR:
    IN R16, SREG;
    PUSH R16;

    LDI R16, 0x0A;
    MOV R0, R16;

    c1:	 LDI R16, 0x01;
    OUT PORTB, R16

    LDI R16, 0xFF
    a1:	 LDI R17, 0xFF
    a2:	 DEC R17
    BRNE a2
    DEC R16
    BRNE a1

    LDI R16, 0x00
    OUT PORTB, R16

    LDI R16, 0xFF
    b1:	 LDI R17, 0xFF
    b2:	 DEC R17
    BRNE b2
    DEC R16
    BRNE b1

    DEC R0
    BRNE c1
    POP R16
    OUT SREG, R16

    RETI


