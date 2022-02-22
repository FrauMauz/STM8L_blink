   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  14                     .const:	section	.text
  15  0000               _APR_Array:
  16  0000 00            	dc.b	0
  17  0001 08            	dc.b	8
  18  0002 10            	dc.b	16
  19  0003 20            	dc.b	32
  20  0004 3e            	dc.b	62
  21  0005 3e            	dc.b	62
  22  0006 3e            	dc.b	62
  23  0007 3e            	dc.b	62
  24  0008 3e            	dc.b	62
  25  0009 3e            	dc.b	62
  26  000a 3e            	dc.b	62
  27  000b 3e            	dc.b	62
  28  000c 3e            	dc.b	62
  29  000d 3d            	dc.b	61
  30  000e 3d            	dc.b	61
  31  000f 24            	dc.b	36
  32  0010 0e            	dc.b	14
  33  0011               _TBR_Array:
  34  0011 00            	dc.b	0
  35  0012 01            	dc.b	1
  36  0013 01            	dc.b	1
  37  0014 01            	dc.b	1
  38  0015 01            	dc.b	1
  39  0016 02            	dc.b	2
  40  0017 03            	dc.b	3
  41  0018 04            	dc.b	4
  42  0019 05            	dc.b	5
  43  001a 06            	dc.b	6
  44  001b 07            	dc.b	7
  45  001c 08            	dc.b	8
  46  001d 09            	dc.b	9
  47  001e 0a            	dc.b	10
  48  001f 0b            	dc.b	11
  49  0020 0e            	dc.b	14
  50  0021 0f            	dc.b	15
  79                     ; 73 void AWU_DeInit(void)
  79                     ; 74 {
  81                     	switch	.text
  82  0000               _AWU_DeInit:
  86                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  88  0000 725f50f0      	clr	20720
  89                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  91  0004 353f50f1      	mov	20721,#63
  92                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  94  0008 725f50f2      	clr	20722
  95                     ; 78 }
  98  000c 81            	ret
 260                     ; 86 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 260                     ; 87 {
 261                     	switch	.text
 262  000d               _AWU_Init:
 264  000d 88            	push	a
 265       00000000      OFST:	set	0
 268                     ; 89   assert_param(IS_AWU_TIMEBASE(AWU_TimeBase));
 270                     ; 92   AWU->CSR |= AWU_CSR_AWUEN;
 272  000e 721850f0      	bset	20720,#4
 273                     ; 95   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 275  0012 c650f2        	ld	a,20722
 276  0015 a4f0          	and	a,#240
 277  0017 c750f2        	ld	20722,a
 278                     ; 96   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 280  001a 7b01          	ld	a,(OFST+1,sp)
 281  001c 5f            	clrw	x
 282  001d 97            	ld	xl,a
 283  001e c650f2        	ld	a,20722
 284  0021 da0011        	or	a,(_TBR_Array,x)
 285  0024 c750f2        	ld	20722,a
 286                     ; 99   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 288  0027 c650f1        	ld	a,20721
 289  002a a4c0          	and	a,#192
 290  002c c750f1        	ld	20721,a
 291                     ; 100   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 293  002f 7b01          	ld	a,(OFST+1,sp)
 294  0031 5f            	clrw	x
 295  0032 97            	ld	xl,a
 296  0033 c650f1        	ld	a,20721
 297  0036 da0000        	or	a,(_APR_Array,x)
 298  0039 c750f1        	ld	20721,a
 299                     ; 102 }
 302  003c 84            	pop	a
 303  003d 81            	ret
 358                     ; 110 void AWU_Cmd(FunctionalState NewState)
 358                     ; 111 {
 359                     	switch	.text
 360  003e               _AWU_Cmd:
 364                     ; 112   assert_param(IS_FUNCTIONAL_STATE(NewState));
 366                     ; 114   if (NewState != DISABLE)
 368  003e 4d            	tnz	a
 369  003f 2706          	jreq	L331
 370                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 372  0041 721850f0      	bset	20720,#4
 374  0045 2004          	jra	L531
 375  0047               L331:
 376                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 378  0047 721950f0      	bres	20720,#4
 379  004b               L531:
 380                     ; 124 }
 383  004b 81            	ret
 436                     	switch	.const
 437  0022               L41:
 438  0022 000003e8      	dc.l	1000
 439                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 439                     ; 140 {
 440                     	switch	.text
 441  004c               _AWU_LSICalibrationConfig:
 443  004c 5206          	subw	sp,#6
 444       00000006      OFST:	set	6
 447                     ; 142   uint16_t lsifreqkhz = 0x0;
 449                     ; 143   uint16_t A = 0x0;
 451                     ; 146   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 453                     ; 148   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 455  004e 96            	ldw	x,sp
 456  004f 1c0009        	addw	x,#OFST+3
 457  0052 cd0000        	call	c_ltor
 459  0055 ae0022        	ldw	x,#L41
 460  0058 cd0000        	call	c_ludv
 462  005b be02          	ldw	x,c_lreg+2
 463  005d 1f03          	ldw	(OFST-3,sp),x
 465                     ; 152   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 467  005f 1e03          	ldw	x,(OFST-3,sp)
 468  0061 54            	srlw	x
 469  0062 54            	srlw	x
 470  0063 1f05          	ldw	(OFST-1,sp),x
 472                     ; 154   if ((4U * A) >= ((lsifreqkhz - (4U * A)) *(1U + (2U * A))))
 474  0065 1e05          	ldw	x,(OFST-1,sp)
 475  0067 58            	sllw	x
 476  0068 58            	sllw	x
 477  0069 1f01          	ldw	(OFST-5,sp),x
 479  006b 1e03          	ldw	x,(OFST-3,sp)
 480  006d 72f001        	subw	x,(OFST-5,sp)
 481  0070 1605          	ldw	y,(OFST-1,sp)
 482  0072 9058          	sllw	y
 483  0074 905c          	incw	y
 484  0076 cd0000        	call	c_imul
 486  0079 1605          	ldw	y,(OFST-1,sp)
 487  007b 9058          	sllw	y
 488  007d 9058          	sllw	y
 489  007f bf00          	ldw	c_x,x
 490  0081 90b300        	cpw	y,c_x
 491  0084 2509          	jrult	L561
 492                     ; 156     AWU->APR = (uint8_t)(A - 2U);
 494  0086 7b06          	ld	a,(OFST+0,sp)
 495  0088 a002          	sub	a,#2
 496  008a c750f1        	ld	20721,a
 498  008d 2006          	jra	L761
 499  008f               L561:
 500                     ; 160     AWU->APR = (uint8_t)(A - 1U);
 502  008f 7b06          	ld	a,(OFST+0,sp)
 503  0091 4a            	dec	a
 504  0092 c750f1        	ld	20721,a
 505  0095               L761:
 506                     ; 163 }
 509  0095 5b06          	addw	sp,#6
 510  0097 81            	ret
 533                     ; 170 void AWU_IdleModeEnable(void)
 533                     ; 171 {
 534                     	switch	.text
 535  0098               _AWU_IdleModeEnable:
 539                     ; 174   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 541  0098 721950f0      	bres	20720,#4
 542                     ; 177   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 544  009c 35f050f2      	mov	20722,#240
 545                     ; 179 }
 548  00a0 81            	ret
 592                     ; 186 FlagStatus AWU_GetFlagStatus(void)
 592                     ; 187 {
 593                     	switch	.text
 594  00a1               _AWU_GetFlagStatus:
 598                     ; 188   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 600  00a1 c650f0        	ld	a,20720
 601  00a4 a520          	bcp	a,#32
 602  00a6 2603          	jrne	L22
 603  00a8 4f            	clr	a
 604  00a9 2002          	jra	L42
 605  00ab               L22:
 606  00ab a601          	ld	a,#1
 607  00ad               L42:
 610  00ad 81            	ret
 645                     	xdef	_TBR_Array
 646                     	xdef	_APR_Array
 647                     	xdef	_AWU_GetFlagStatus
 648                     	xdef	_AWU_IdleModeEnable
 649                     	xdef	_AWU_LSICalibrationConfig
 650                     	xdef	_AWU_Cmd
 651                     	xdef	_AWU_Init
 652                     	xdef	_AWU_DeInit
 653                     	xref.b	c_lreg
 654                     	xref.b	c_x
 673                     	xref	c_imul
 674                     	xref	c_ludv
 675                     	xref	c_ltor
 676                     	end
