   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 109                     ; 64 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 109                     ; 65 {
 111                     	switch	.text
 112  0000               _RST_GetFlagStatus:
 116                     ; 67   assert_param(IS_RST_FLAG(RST_Flag));
 118                     ; 71   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 120  0000 c450b1        	and	a,20657
 121  0003 2603          	jrne	L6
 122  0005 4f            	clr	a
 123  0006 2002          	jra	L01
 124  0008               L6:
 125  0008 a601          	ld	a,#1
 126  000a               L01:
 129  000a 81            	ret
 164                     ; 85 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 164                     ; 86 {
 165                     	switch	.text
 166  000b               _RST_ClearFlag:
 170                     ; 88   assert_param(IS_RST_FLAG(RST_Flag));
 172                     ; 90   RST->SR = (uint8_t)RST_Flag;
 174  000b c750b1        	ld	20657,a
 175                     ; 91 }
 178  000e 81            	ret
 201                     ; 98 void RST_GPOutputEnable(void)
 201                     ; 99 {
 202                     	switch	.text
 203  000f               _RST_GPOutputEnable:
 207                     ; 101   RST->CR = RST_CR_MASK;
 209  000f 35d050b0      	mov	20656,#208
 210                     ; 102 }
 213  0013 81            	ret
 226                     	xdef	_RST_GPOutputEnable
 227                     	xdef	_RST_ClearFlag
 228                     	xdef	_RST_GetFlagStatus
 247                     	end
