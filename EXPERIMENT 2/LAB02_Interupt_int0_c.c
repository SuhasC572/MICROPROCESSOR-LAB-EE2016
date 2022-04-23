/*
 * LAB02_Interupt_int0_c.c
 *
 * Created: 27-09-2021 14:33:33
 * Author : suhas
 */ 
#define F_CPU 1000000

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

ISR (INT0_vect)
{

	for(int i=0; i<10; i=i+1)
	{
		//PortB is set to 1 for 1 sec (ON State)
		PORTB = 0x01;
		_delay_ms(1000);
		//PortB is set to 0 for 1 sec (ON State)
		PORTB = 0x00;
		_delay_ms(1000);
	}
}

int main (void)
{
	
	DDRD = 0x00;
	DDRB = 0x01;
	MCUCR = 0x00;
	GICR = 0x40;
	PORTB = 0x00;

	
	sei();

	while (1)
	{
		//program running forever.
	}
}
