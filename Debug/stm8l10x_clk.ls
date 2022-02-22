   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  14                     .const:	section	.text
  15  0000               _HSIDivFactor:
  16  0000 01            	dc.b	1
  17  0001 02            	dc.b	2
  18  0002 04            	dc.b	4
  19  0003 08            	dc.b	8
  48                     ; 68 void CLK_DeInit(void)
  48                     ; 69 {
  50                     	switch	.text
  51  0000               _CLK_DeInit:
  55                     ; 70   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  57  0000 350350c0      	mov	20672,#3
  58                     ; 71   CLK->PCKENR = CLK_PCKENR_RESET_VALUE;
  60  0004 725f50c3      	clr	20675
  61                     ; 72   CLK->CCOR  = CLK_CCOR_RESET_VALUE;
  63  0008 725f50c5      	clr	20677
  64                     ; 73 }
  67  000c 81            	ret
 122                     ; 80 void CLK_CCOCmd(FunctionalState NewState)
 122                     ; 81 {
 123                     	switch	.text
 124  000d               _CLK_CCOCmd:
 128                     ; 83   assert_param(IS_FUNCTIONAL_STATE(NewState));
 130                     ; 85   if (NewState != DISABLE)
 132  000d 4d            	tnz	a
 133  000e 2706          	jreq	L74
 134                     ; 88     CLK->CCOR |= CLK_CCOR_CCOEN;
 136  0010 721050c5      	bset	20677,#0
 138  0014 2004          	jra	L15
 139  0016               L74:
 140                     ; 93     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 142  0016 721150c5      	bres	20677,#0
 143  001a               L15:
 144                     ; 96 }
 147  001a 81            	ret
 252                     ; 113 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 252                     ; 114 {
 253                     	switch	.text
 254  001b               _CLK_PeripheralClockConfig:
 256  001b 89            	pushw	x
 257       00000000      OFST:	set	0
 260                     ; 116     assert_param(IS_FUNCTIONAL_STATE(NewState));
 262                     ; 117     assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
 264                     ; 119     if (NewState != DISABLE)
 266  001c 9f            	ld	a,xl
 267  001d 4d            	tnz	a
 268  001e 2709          	jreq	L711
 269                     ; 122       CLK->PCKENR |= ((uint8_t)CLK_Peripheral);
 271  0020 9e            	ld	a,xh
 272  0021 ca50c3        	or	a,20675
 273  0024 c750c3        	ld	20675,a
 275  0027 2009          	jra	L121
 276  0029               L711:
 277                     ; 127       CLK->PCKENR &= (uint8_t)(~(uint8_t)CLK_Peripheral);
 279  0029 7b01          	ld	a,(OFST+1,sp)
 280  002b 43            	cpl	a
 281  002c c450c3        	and	a,20675
 282  002f c750c3        	ld	20675,a
 283  0032               L121:
 284                     ; 129 }
 287  0032 85            	popw	x
 288  0033 81            	ret
 363                     ; 141 void CLK_MasterPrescalerConfig(CLK_MasterPrescaler_TypeDef CLK_MasterPrescaler)
 363                     ; 142 {
 364                     	switch	.text
 365  0034               _CLK_MasterPrescalerConfig:
 367  0034 88            	push	a
 368       00000000      OFST:	set	0
 371                     ; 144   assert_param(IS_CLK_MASTER_PRESCALER(CLK_MasterPrescaler));
 373                     ; 146   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 375  0035 c650c0        	ld	a,20672
 376  0038 a4fc          	and	a,#252
 377  003a c750c0        	ld	20672,a
 378                     ; 147   CLK->CKDIVR = (uint8_t)CLK_MasterPrescaler;
 380  003d 7b01          	ld	a,(OFST+1,sp)
 381  003f c750c0        	ld	20672,a
 382                     ; 148 }
 385  0042 84            	pop	a
 386  0043 81            	ret
 459                     ; 161 void CLK_CCOConfig(CLK_Output_TypeDef CLK_Output)
 459                     ; 162 {
 460                     	switch	.text
 461  0044               _CLK_CCOConfig:
 463  0044 88            	push	a
 464       00000000      OFST:	set	0
 467                     ; 164   assert_param(IS_CLK_OUTPUT(CLK_Output));
 469                     ; 167   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
 471  0045 c650c5        	ld	a,20677
 472  0048 a4f9          	and	a,#249
 473  004a c750c5        	ld	20677,a
 474                     ; 170   CLK->CCOR |= ((uint8_t)CLK_Output);
 476  004d c650c5        	ld	a,20677
 477  0050 1a01          	or	a,(OFST+1,sp)
 478  0052 c750c5        	ld	20677,a
 479                     ; 173   CLK->CCOR |= CLK_CCOR_CCOEN;
 481  0055 721050c5      	bset	20677,#0
 482                     ; 174 }
 485  0059 84            	pop	a
 486  005a 81            	ret
 539                     ; 181 uint32_t CLK_GetClockFreq(void)
 539                     ; 182 {
 540                     	switch	.text
 541  005b               _CLK_GetClockFreq:
 543  005b 5209          	subw	sp,#9
 544       00000009      OFST:	set	9
 547                     ; 183   uint32_t clockfrequency = 0;
 549                     ; 184   uint8_t tmp = 0, presc = 0;
 553                     ; 186   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 555  005d c650c0        	ld	a,20672
 556  0060 a403          	and	a,#3
 557  0062 6b09          	ld	(OFST+0,sp),a
 559                     ; 187   presc = HSIDivFactor[tmp];
 561  0064 7b09          	ld	a,(OFST+0,sp)
 562  0066 5f            	clrw	x
 563  0067 97            	ld	xl,a
 564  0068 d60000        	ld	a,(_HSIDivFactor,x)
 565  006b 6b09          	ld	(OFST+0,sp),a
 567                     ; 188   clockfrequency = HSI_VALUE / presc;
 569  006d 7b09          	ld	a,(OFST+0,sp)
 570  006f b703          	ld	c_lreg+3,a
 571  0071 3f02          	clr	c_lreg+2
 572  0073 3f01          	clr	c_lreg+1
 573  0075 3f00          	clr	c_lreg
 574  0077 96            	ldw	x,sp
 575  0078 1c0001        	addw	x,#OFST-8
 576  007b cd0000        	call	c_rtol
 579  007e ae2400        	ldw	x,#9216
 580  0081 bf02          	ldw	c_lreg+2,x
 581  0083 ae00f4        	ldw	x,#244
 582  0086 bf00          	ldw	c_lreg,x
 583  0088 96            	ldw	x,sp
 584  0089 1c0001        	addw	x,#OFST-8
 585  008c cd0000        	call	c_ludv
 587  008f 96            	ldw	x,sp
 588  0090 1c0005        	addw	x,#OFST-4
 589  0093 cd0000        	call	c_rtol
 592                     ; 190   return((uint32_t)clockfrequency);
 594  0096 96            	ldw	x,sp
 595  0097 1c0005        	addw	x,#OFST-4
 596  009a cd0000        	call	c_ltor
 600  009d 5b09          	addw	sp,#9
 601  009f 81            	ret
 626                     	xdef	_HSIDivFactor
 627                     	xdef	_CLK_GetClockFreq
 628                     	xdef	_CLK_CCOConfig
 629                     	xdef	_CLK_MasterPrescalerConfig
 630                     	xdef	_CLK_PeripheralClockConfig
 631                     	xdef	_CLK_CCOCmd
 632                     	xdef	_CLK_DeInit
 633                     	xref.b	c_lreg
 634                     	xref.b	c_x
 653                     	xref	c_ltor
 654                     	xref	c_ludv
 655                     	xref	c_rtol
 656                     	end
