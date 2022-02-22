   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  72                     ; 11 void delay (int ms) //Function Definition 
  72                     ; 12 {
  74                     	switch	.text
  75  0000               _delay:
  77  0000 89            	pushw	x
  78  0001 5204          	subw	sp,#4
  79       00000004      OFST:	set	4
  82                     ; 13 	int i =0 ;
  84                     ; 14 	int j=0;
  86                     ; 15 	for (i=0; i<=ms; i++)
  88  0003 5f            	clrw	x
  89  0004 1f01          	ldw	(OFST-3,sp),x
  92  0006 201a          	jra	L34
  93  0008               L73:
  94                     ; 17 		for (j=0; j<120; j++) // Nop = Fosc/4
  96  0008 5f            	clrw	x
  97  0009 1f03          	ldw	(OFST-1,sp),x
  99  000b               L74:
 100                     ; 18 		_asm("nop"); //Perform no operation //assembly code 
 103  000b 9d            nop
 105                     ; 17 		for (j=0; j<120; j++) // Nop = Fosc/4
 107  000c 1e03          	ldw	x,(OFST-1,sp)
 108  000e 1c0001        	addw	x,#1
 109  0011 1f03          	ldw	(OFST-1,sp),x
 113  0013 9c            	rvf
 114  0014 1e03          	ldw	x,(OFST-1,sp)
 115  0016 a30078        	cpw	x,#120
 116  0019 2ff0          	jrslt	L74
 117                     ; 15 	for (i=0; i<=ms; i++)
 119  001b 1e01          	ldw	x,(OFST-3,sp)
 120  001d 1c0001        	addw	x,#1
 121  0020 1f01          	ldw	(OFST-3,sp),x
 123  0022               L34:
 126  0022 9c            	rvf
 127  0023 1e01          	ldw	x,(OFST-3,sp)
 128  0025 1305          	cpw	x,(OFST+1,sp)
 129  0027 2ddf          	jrsle	L73
 130                     ; 20 }
 133  0029 5b06          	addw	sp,#6
 134  002b 81            	ret
 160                     ; 22 main()
 160                     ; 23 {
 161                     	switch	.text
 162  002c               _main:
 166  002c               L56:
 167                     ; 30 		GPIO_DeInit(GPIOB); 	
 169  002c ae5005        	ldw	x,#20485
 170  002f cd0000        	call	_GPIO_DeInit
 172                     ; 32 		GPIO_DeInit(GPIOD); 
 174  0032 ae500f        	ldw	x,#20495
 175  0035 cd0000        	call	_GPIO_DeInit
 177                     ; 33 		delay (100);
 179  0038 ae0064        	ldw	x,#100
 180  003b adc3          	call	_delay
 182                     ; 36 		GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow); 
 184  003d 4bd0          	push	#208
 185  003f 4bff          	push	#255
 186  0041 ae5005        	ldw	x,#20485
 187  0044 cd0000        	call	_GPIO_Init
 189  0047 85            	popw	x
 190                     ; 38 		GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow); 
 192  0048 4bd0          	push	#208
 193  004a 4bff          	push	#255
 194  004c ae500f        	ldw	x,#20495
 195  004f cd0000        	call	_GPIO_Init
 197  0052 85            	popw	x
 198                     ; 40 		delay (100);
 200  0053 ae0064        	ldw	x,#100
 201  0056 ada8          	call	_delay
 204  0058 20d2          	jra	L56
 217                     	xdef	_main
 218                     	xdef	_delay
 219                     	xref	_GPIO_Init
 220                     	xref	_GPIO_DeInit
 239                     	end
