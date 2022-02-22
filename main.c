/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

//#define BOARD_LED2 GPIOB, GPIO_Pin_All //MAKRO DEFINITION9
//#define BOARD_LED1 GPIOD, GPIO_Pin_All //MAKRO DEFINITION9

#include "stm8l10x.h" //header file not found

void delay (int ms) //Function Definition 
{
	int i =0 ;
	int j=0;
	for (i=0; i<=ms; i++)
	{
		for (j=0; j<120; j++) // Nop = Fosc/4
		_asm("nop"); //Perform no operation //assembly code 
	}
}
 
main()
{
	/**
		* @brief  Deinitializes and initializes Port B to let LED2 blink
		*/
	while (1) 
	{	
		//prepare Port B for working
		GPIO_DeInit(GPIOB); 	
		//prepare Port C for working. to communicate with PIN 	
		GPIO_DeInit(GPIOD); 
		delay (100);
		
		//Declare GPIO_Pin_All as push pull Output pin for the onboard LED2
		GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow); 
		//Declare GPIO_Pin_All as push pull Output pin for the onboard LED1
		GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow); 
		//GPIO_Write(GPIOB, GPIO_Pin_All);
		delay (100);
	}	
	
	/**
		* @brief  Deinitializes and initializes Port B to let LED1 blink

	while (1) 
	{	
		//prepare Port C for working. to communicate with PIN 	
		GPIO_DeInit(GPIOD); 
		delay (100);
		//Declare GPIO_Pin_All as push pull Output pin for the onboard LED
		GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow); 
		//GPIO_Write(GPIOC, GPIO_Pin_All);
		delay (100);
	}			*/
}

//first main method for testing of the power LED
//
/*main()
{
	while (1);
}*/