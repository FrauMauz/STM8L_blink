   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 92 void BEEP_DeInit(void)
  42                     ; 93 {
  44                     	switch	.text
  45  0000               _BEEP_DeInit:
  49                     ; 94   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  51  0000 351f50f3      	mov	20723,#31
  52                     ; 95 }
  55  0004 81            	ret
 120                     ; 104 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 120                     ; 105 {
 121                     	switch	.text
 122  0005               _BEEP_Init:
 124  0005 88            	push	a
 125       00000000      OFST:	set	0
 128                     ; 108   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 130                     ; 111   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 132  0006 c650f3        	ld	a,20723
 133  0009 a41f          	and	a,#31
 134  000b a11f          	cp	a,#31
 135  000d 260c          	jrne	L15
 136                     ; 113     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 138  000f c650f3        	ld	a,20723
 139  0012 a4e0          	and	a,#224
 140  0014 c750f3        	ld	20723,a
 141                     ; 114     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 143  0017 721050f3      	bset	20723,#0
 144  001b               L15:
 145                     ; 118   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 147  001b c650f3        	ld	a,20723
 148  001e a43f          	and	a,#63
 149  0020 c750f3        	ld	20723,a
 150                     ; 119   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 152  0023 c650f3        	ld	a,20723
 153  0026 1a01          	or	a,(OFST+1,sp)
 154  0028 c750f3        	ld	20723,a
 155                     ; 121 }
 158  002b 84            	pop	a
 159  002c 81            	ret
 214                     ; 129 void BEEP_Cmd(FunctionalState NewState)
 214                     ; 130 {
 215                     	switch	.text
 216  002d               _BEEP_Cmd:
 220                     ; 132   assert_param(IS_FUNCTIONAL_STATE(NewState));
 222                     ; 134   if (NewState != DISABLE)
 224  002d 4d            	tnz	a
 225  002e 2706          	jreq	L101
 226                     ; 137     BEEP->CSR |= BEEP_CSR_BEEPEN;
 228  0030 721a50f3      	bset	20723,#5
 230  0034 2004          	jra	L301
 231  0036               L101:
 232                     ; 142     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 234  0036 721b50f3      	bres	20723,#5
 235  003a               L301:
 236                     ; 144 }
 239  003a 81            	ret
 292                     .const:	section	.text
 293  0000               L41:
 294  0000 000003e8      	dc.l	1000
 295                     ; 185 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 295                     ; 186 {
 296                     	switch	.text
 297  003b               _BEEP_LSICalibrationConfig:
 299  003b 5206          	subw	sp,#6
 300       00000006      OFST:	set	6
 303                     ; 192   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 305                     ; 194   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 307  003d 96            	ldw	x,sp
 308  003e 1c0009        	addw	x,#OFST+3
 309  0041 cd0000        	call	c_ltor
 311  0044 ae0000        	ldw	x,#L41
 312  0047 cd0000        	call	c_ludv
 314  004a be02          	ldw	x,c_lreg+2
 315  004c 1f03          	ldw	(OFST-3,sp),x
 317                     ; 198   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 319  004e c650f3        	ld	a,20723
 320  0051 a4e0          	and	a,#224
 321  0053 c750f3        	ld	20723,a
 322                     ; 200   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 324  0056 1e03          	ldw	x,(OFST-3,sp)
 325  0058 54            	srlw	x
 326  0059 54            	srlw	x
 327  005a 54            	srlw	x
 328  005b 1f05          	ldw	(OFST-1,sp),x
 330                     ; 202   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 332  005d 1e05          	ldw	x,(OFST-1,sp)
 333  005f 58            	sllw	x
 334  0060 58            	sllw	x
 335  0061 58            	sllw	x
 336  0062 1f01          	ldw	(OFST-5,sp),x
 338  0064 1e03          	ldw	x,(OFST-3,sp)
 339  0066 72f001        	subw	x,(OFST-5,sp)
 340  0069 1605          	ldw	y,(OFST-1,sp)
 341  006b 9058          	sllw	y
 342  006d 905c          	incw	y
 343  006f cd0000        	call	c_imul
 345  0072 1605          	ldw	y,(OFST-1,sp)
 346  0074 9058          	sllw	y
 347  0076 9058          	sllw	y
 348  0078 9058          	sllw	y
 349  007a bf00          	ldw	c_x,x
 350  007c 90b300        	cpw	y,c_x
 351  007f 250c          	jrult	L331
 352                     ; 204     BEEP->CSR |= (uint8_t)(A - 2U);
 354  0081 7b06          	ld	a,(OFST+0,sp)
 355  0083 a002          	sub	a,#2
 356  0085 ca50f3        	or	a,20723
 357  0088 c750f3        	ld	20723,a
 359  008b 2009          	jra	L531
 360  008d               L331:
 361                     ; 208     BEEP->CSR |= (uint8_t)(A - 1U);
 363  008d 7b06          	ld	a,(OFST+0,sp)
 364  008f 4a            	dec	a
 365  0090 ca50f3        	or	a,20723
 366  0093 c750f3        	ld	20723,a
 367  0096               L531:
 368                     ; 211 }
 371  0096 5b06          	addw	sp,#6
 372  0098 81            	ret
 385                     	xdef	_BEEP_LSICalibrationConfig
 386                     	xdef	_BEEP_Cmd
 387                     	xdef	_BEEP_Init
 388                     	xdef	_BEEP_DeInit
 389                     	xref.b	c_lreg
 390                     	xref.b	c_x
 409                     	xref	c_imul
 410                     	xref	c_ludv
 411                     	xref	c_ltor
 412                     	end
