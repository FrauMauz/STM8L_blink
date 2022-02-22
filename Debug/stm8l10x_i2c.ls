   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 122 void I2C_DeInit(void)
  42                     ; 123 {
  44                     	switch	.text
  45  0000               _I2C_DeInit:
  49                     ; 124   I2C->CR1 = I2C_CR1_RESET_VALUE;
  51  0000 725f5210      	clr	21008
  52                     ; 125   I2C->CR2 = I2C_CR2_RESET_VALUE;
  54  0004 725f5211      	clr	21009
  55                     ; 126   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  57  0008 725f5212      	clr	21010
  58                     ; 127   I2C->OARL = I2C_OARL_RESET_VALUE;
  60  000c 725f5213      	clr	21011
  61                     ; 128   I2C->OARH = I2C_OARH_RESET_VALUE;
  63  0010 725f5214      	clr	21012
  64                     ; 129   I2C->ITR = I2C_ITR_RESET_VALUE;
  66  0014 725f521a      	clr	21018
  67                     ; 130   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  69  0018 725f521b      	clr	21019
  70                     ; 131   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  72  001c 725f521c      	clr	21020
  73                     ; 132   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  75  0020 3502521d      	mov	21021,#2
  76                     ; 133 }
  79  0024 81            	ret
 253                     .const:	section	.text
 254  0000               L01:
 255  0000 000f4240      	dc.l	1000000
 256  0004               L21:
 257  0004 000186a1      	dc.l	100001
 258  0008               L41:
 259  0008 00000004      	dc.l	4
 260                     ; 157 void I2C_Init(uint32_t OutputClockFrequency, uint16_t OwnAddress,
 260                     ; 158               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef I2C_Ack,
 260                     ; 159               I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 260                     ; 160 {
 261                     	switch	.text
 262  0025               _I2C_Init:
 264  0025 520c          	subw	sp,#12
 265       0000000c      OFST:	set	12
 268                     ; 161   uint32_t result = 0x0004;
 270                     ; 162   uint16_t tmpval = 0;
 272                     ; 163   uint8_t tmpccrh = 0;
 274  0027 0f07          	clr	(OFST-5,sp)
 276                     ; 164   uint8_t input_clock = 0;
 278                     ; 167   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 280                     ; 168   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 282                     ; 169   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 284                     ; 170   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 286                     ; 171   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 288                     ; 174   input_clock = (uint8_t)(CLK_GetClockFreq() / 1000000);
 290  0029 cd0000        	call	_CLK_GetClockFreq
 292  002c ae0000        	ldw	x,#L01
 293  002f cd0000        	call	c_ludv
 295  0032 b603          	ld	a,c_lreg+3
 296  0034 6b08          	ld	(OFST-4,sp),a
 298                     ; 178   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 300  0036 c65212        	ld	a,21010
 301  0039 a4c0          	and	a,#192
 302  003b c75212        	ld	21010,a
 303                     ; 180   I2C->FREQR |= input_clock;
 305  003e c65212        	ld	a,21010
 306  0041 1a08          	or	a,(OFST-4,sp)
 307  0043 c75212        	ld	21010,a
 308                     ; 184   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 310  0046 72115210      	bres	21008,#0
 311                     ; 187   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 313  004a c6521c        	ld	a,21020
 314  004d a430          	and	a,#48
 315  004f c7521c        	ld	21020,a
 316                     ; 188   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 318  0052 725f521b      	clr	21019
 319                     ; 191   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 321  0056 96            	ldw	x,sp
 322  0057 1c000f        	addw	x,#OFST+3
 323  005a cd0000        	call	c_ltor
 325  005d ae0004        	ldw	x,#L21
 326  0060 cd0000        	call	c_lcmp
 328  0063 2403          	jruge	L61
 329  0065 cc0102        	jp	L721
 330  0068               L61:
 331                     ; 194     tmpccrh = I2C_CCRH_FS;
 333  0068 a680          	ld	a,#128
 334  006a 6b07          	ld	(OFST-5,sp),a
 336                     ; 196     if (I2C_DutyCycle == I2C_DutyCycle_2)
 338  006c 0d15          	tnz	(OFST+9,sp)
 339  006e 2633          	jrne	L131
 340                     ; 199       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 342  0070 96            	ldw	x,sp
 343  0071 1c000f        	addw	x,#OFST+3
 344  0074 cd0000        	call	c_ltor
 346  0077 a603          	ld	a,#3
 347  0079 cd0000        	call	c_smul
 349  007c 96            	ldw	x,sp
 350  007d 1c0001        	addw	x,#OFST-11
 351  0080 cd0000        	call	c_rtol
 354  0083 7b08          	ld	a,(OFST-4,sp)
 355  0085 b703          	ld	c_lreg+3,a
 356  0087 3f02          	clr	c_lreg+2
 357  0089 3f01          	clr	c_lreg+1
 358  008b 3f00          	clr	c_lreg
 359  008d ae0000        	ldw	x,#L01
 360  0090 cd0000        	call	c_lmul
 362  0093 96            	ldw	x,sp
 363  0094 1c0001        	addw	x,#OFST-11
 364  0097 cd0000        	call	c_ludv
 366  009a 96            	ldw	x,sp
 367  009b 1c0009        	addw	x,#OFST-3
 368  009e cd0000        	call	c_rtol
 372  00a1 2037          	jra	L331
 373  00a3               L131:
 374                     ; 204       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 376  00a3 96            	ldw	x,sp
 377  00a4 1c000f        	addw	x,#OFST+3
 378  00a7 cd0000        	call	c_ltor
 380  00aa a619          	ld	a,#25
 381  00ac cd0000        	call	c_smul
 383  00af 96            	ldw	x,sp
 384  00b0 1c0001        	addw	x,#OFST-11
 385  00b3 cd0000        	call	c_rtol
 388  00b6 7b08          	ld	a,(OFST-4,sp)
 389  00b8 b703          	ld	c_lreg+3,a
 390  00ba 3f02          	clr	c_lreg+2
 391  00bc 3f01          	clr	c_lreg+1
 392  00be 3f00          	clr	c_lreg
 393  00c0 ae0000        	ldw	x,#L01
 394  00c3 cd0000        	call	c_lmul
 396  00c6 96            	ldw	x,sp
 397  00c7 1c0001        	addw	x,#OFST-11
 398  00ca cd0000        	call	c_ludv
 400  00cd 96            	ldw	x,sp
 401  00ce 1c0009        	addw	x,#OFST-3
 402  00d1 cd0000        	call	c_rtol
 405                     ; 206       tmpccrh |= I2C_CCRH_DUTY;
 407  00d4 7b07          	ld	a,(OFST-5,sp)
 408  00d6 aa40          	or	a,#64
 409  00d8 6b07          	ld	(OFST-5,sp),a
 411  00da               L331:
 412                     ; 210     if (result < (uint16_t)0x0001)
 414  00da 96            	ldw	x,sp
 415  00db 1c0009        	addw	x,#OFST-3
 416  00de cd0000        	call	c_lzmp
 418  00e1 260a          	jrne	L531
 419                     ; 213       result = (uint16_t)0x0001;
 421  00e3 ae0001        	ldw	x,#1
 422  00e6 1f0b          	ldw	(OFST-1,sp),x
 423  00e8 ae0000        	ldw	x,#0
 424  00eb 1f09          	ldw	(OFST-3,sp),x
 426  00ed               L531:
 427                     ; 219     tmpval = ((input_clock * 3) / 10) + 1;
 429  00ed 7b08          	ld	a,(OFST-4,sp)
 430  00ef 97            	ld	xl,a
 431  00f0 a603          	ld	a,#3
 432  00f2 42            	mul	x,a
 433  00f3 a60a          	ld	a,#10
 434  00f5 cd0000        	call	c_sdivx
 436  00f8 5c            	incw	x
 437  00f9 1f05          	ldw	(OFST-7,sp),x
 439                     ; 220     I2C->TRISER = (uint8_t)tmpval;
 441  00fb 7b06          	ld	a,(OFST-6,sp)
 442  00fd c7521d        	ld	21021,a
 444  0100 205b          	jra	L731
 445  0102               L721:
 446                     ; 226     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 448  0102 96            	ldw	x,sp
 449  0103 1c000f        	addw	x,#OFST+3
 450  0106 cd0000        	call	c_ltor
 452  0109 3803          	sll	c_lreg+3
 453  010b 3902          	rlc	c_lreg+2
 454  010d 3901          	rlc	c_lreg+1
 455  010f 3900          	rlc	c_lreg
 456  0111 96            	ldw	x,sp
 457  0112 1c0001        	addw	x,#OFST-11
 458  0115 cd0000        	call	c_rtol
 461  0118 7b08          	ld	a,(OFST-4,sp)
 462  011a b703          	ld	c_lreg+3,a
 463  011c 3f02          	clr	c_lreg+2
 464  011e 3f01          	clr	c_lreg+1
 465  0120 3f00          	clr	c_lreg
 466  0122 ae0000        	ldw	x,#L01
 467  0125 cd0000        	call	c_lmul
 469  0128 96            	ldw	x,sp
 470  0129 1c0001        	addw	x,#OFST-11
 471  012c cd0000        	call	c_ludv
 473  012f b602          	ld	a,c_lreg+2
 474  0131 97            	ld	xl,a
 475  0132 b603          	ld	a,c_lreg+3
 476  0134 cd0000        	call	c_uitol
 478  0137 96            	ldw	x,sp
 479  0138 1c0009        	addw	x,#OFST-3
 480  013b cd0000        	call	c_rtol
 483                     ; 229     if (result < (uint16_t)0x0004)
 485  013e 96            	ldw	x,sp
 486  013f 1c0009        	addw	x,#OFST-3
 487  0142 cd0000        	call	c_ltor
 489  0145 ae0008        	ldw	x,#L41
 490  0148 cd0000        	call	c_lcmp
 492  014b 240a          	jruge	L141
 493                     ; 232       result = (uint16_t)0x0004;
 495  014d ae0004        	ldw	x,#4
 496  0150 1f0b          	ldw	(OFST-1,sp),x
 497  0152 ae0000        	ldw	x,#0
 498  0155 1f09          	ldw	(OFST-3,sp),x
 500  0157               L141:
 501                     ; 238      I2C->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 503  0157 7b08          	ld	a,(OFST-4,sp)
 504  0159 4c            	inc	a
 505  015a c7521d        	ld	21021,a
 506  015d               L731:
 507                     ; 242   I2C->CCRL = (uint8_t)result;
 509  015d 7b0c          	ld	a,(OFST+0,sp)
 510  015f c7521b        	ld	21019,a
 511                     ; 243   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 513  0162 7b07          	ld	a,(OFST-5,sp)
 514  0164 c7521c        	ld	21020,a
 515                     ; 246     I2C->CR1 |= I2C_CR1_PE;
 517  0167 72105210      	bset	21008,#0
 518                     ; 249   I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 520  016b 72155211      	bres	21009,#2
 521                     ; 252   I2C->CR2 |= (uint8_t)I2C_Ack;
 523  016f c65211        	ld	a,21009
 524  0172 1a16          	or	a,(OFST+10,sp)
 525  0174 c75211        	ld	21009,a
 526                     ; 255     I2C->OARL = (uint8_t)(OwnAddress);
 528  0177 7b14          	ld	a,(OFST+8,sp)
 529  0179 c75213        	ld	21011,a
 530                     ; 256     I2C->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF) |
 530                     ; 257                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 532  017c 1e13          	ldw	x,(OFST+7,sp)
 533  017e 4f            	clr	a
 534  017f 01            	rrwa	x,a
 535  0180 48            	sll	a
 536  0181 59            	rlcw	x
 537  0182 01            	rrwa	x,a
 538  0183 a406          	and	a,#6
 539  0185 5f            	clrw	x
 540  0186 6b04          	ld	(OFST-8,sp),a
 542  0188 7b17          	ld	a,(OFST+11,sp)
 543  018a aa40          	or	a,#64
 544  018c 1a04          	or	a,(OFST-8,sp)
 545  018e c75214        	ld	21012,a
 546                     ; 258 }
 549  0191 5b0c          	addw	sp,#12
 550  0193 81            	ret
 605                     ; 266 void I2C_Cmd(FunctionalState NewState)
 605                     ; 267 {
 606                     	switch	.text
 607  0194               _I2C_Cmd:
 611                     ; 269   assert_param(IS_FUNCTIONAL_STATE(NewState));
 613                     ; 271   if (NewState != DISABLE)
 615  0194 4d            	tnz	a
 616  0195 2706          	jreq	L171
 617                     ; 274     I2C->CR1 |= I2C_CR1_PE;
 619  0197 72105210      	bset	21008,#0
 621  019b 2004          	jra	L371
 622  019d               L171:
 623                     ; 279     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 625  019d 72115210      	bres	21008,#0
 626  01a1               L371:
 627                     ; 281 }
 630  01a1 81            	ret
 665                     ; 289 void I2C_GeneralCallCmd(FunctionalState NewState)
 665                     ; 290 {
 666                     	switch	.text
 667  01a2               _I2C_GeneralCallCmd:
 671                     ; 292   assert_param(IS_FUNCTIONAL_STATE(NewState));
 673                     ; 294   if (NewState != DISABLE)
 675  01a2 4d            	tnz	a
 676  01a3 2706          	jreq	L312
 677                     ; 297     I2C->CR1 |= I2C_CR1_ENGC;
 679  01a5 721c5210      	bset	21008,#6
 681  01a9 2004          	jra	L512
 682  01ab               L312:
 683                     ; 302     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 685  01ab 721d5210      	bres	21008,#6
 686  01af               L512:
 687                     ; 304 }
 690  01af 81            	ret
 725                     ; 314 void I2C_GenerateSTART(FunctionalState NewState)
 725                     ; 315 {
 726                     	switch	.text
 727  01b0               _I2C_GenerateSTART:
 731                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 733                     ; 319   if (NewState != DISABLE)
 735  01b0 4d            	tnz	a
 736  01b1 2706          	jreq	L532
 737                     ; 322     I2C->CR2 |= I2C_CR2_START;
 739  01b3 72105211      	bset	21009,#0
 741  01b7 2004          	jra	L732
 742  01b9               L532:
 743                     ; 327     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 745  01b9 72115211      	bres	21009,#0
 746  01bd               L732:
 747                     ; 329 }
 750  01bd 81            	ret
 785                     ; 337 void I2C_GenerateSTOP(FunctionalState NewState)
 785                     ; 338 {
 786                     	switch	.text
 787  01be               _I2C_GenerateSTOP:
 791                     ; 340   assert_param(IS_FUNCTIONAL_STATE(NewState));
 793                     ; 342   if (NewState != DISABLE)
 795  01be 4d            	tnz	a
 796  01bf 2706          	jreq	L752
 797                     ; 345     I2C->CR2 |= I2C_CR2_STOP;
 799  01c1 72125211      	bset	21009,#1
 801  01c5 2004          	jra	L162
 802  01c7               L752:
 803                     ; 350     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 805  01c7 72135211      	bres	21009,#1
 806  01cb               L162:
 807                     ; 352 }
 810  01cb 81            	ret
 846                     ; 362 void I2C_SoftwareResetCmd(FunctionalState NewState)
 846                     ; 363 {
 847                     	switch	.text
 848  01cc               _I2C_SoftwareResetCmd:
 852                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 854                     ; 367   if (NewState != DISABLE)
 856  01cc 4d            	tnz	a
 857  01cd 2706          	jreq	L103
 858                     ; 370     I2C->CR2 |= I2C_CR2_SWRST;
 860  01cf 721e5211      	bset	21009,#7
 862  01d3 2004          	jra	L303
 863  01d5               L103:
 864                     ; 375     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 866  01d5 721f5211      	bres	21009,#7
 867  01d9               L303:
 868                     ; 377 }
 871  01d9 81            	ret
 907                     ; 385 void I2C_StretchClockCmd(FunctionalState NewState)
 907                     ; 386 {
 908                     	switch	.text
 909  01da               _I2C_StretchClockCmd:
 913                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 915                     ; 390   if (NewState != DISABLE)
 917  01da 4d            	tnz	a
 918  01db 2706          	jreq	L323
 919                     ; 393     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 921  01dd 721f5210      	bres	21008,#7
 923  01e1 2004          	jra	L523
 924  01e3               L323:
 925                     ; 398     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 927  01e3 721e5210      	bset	21008,#7
 928  01e7               L523:
 929                     ; 400 }
 932  01e7 81            	ret
 968                     ; 408 void I2C_AcknowledgeConfig(FunctionalState NewState)
 968                     ; 409 {
 969                     	switch	.text
 970  01e8               _I2C_AcknowledgeConfig:
 974                     ; 411   assert_param(IS_FUNCTIONAL_STATE(NewState));
 976                     ; 413   if (NewState != DISABLE)
 978  01e8 4d            	tnz	a
 979  01e9 2706          	jreq	L543
 980                     ; 416     I2C->CR2 |= I2C_CR2_ACK;
 982  01eb 72145211      	bset	21009,#2
 984  01ef 2004          	jra	L743
 985  01f1               L543:
 986                     ; 421     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 988  01f1 72155211      	bres	21009,#2
 989  01f5               L743:
 990                     ; 423 }
 993  01f5 81            	ret
1051                     ; 434 void I2C_AckPositionConfig(I2C_AckPosition_TypeDef I2C_AckPosition)
1051                     ; 435 {
1052                     	switch	.text
1053  01f6               _I2C_AckPositionConfig:
1057                     ; 437   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1059                     ; 440   I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1061  01f6 72175211      	bres	21009,#3
1062                     ; 443   I2C->CR2 |= (uint8_t)I2C_AckPosition;
1064  01fa ca5211        	or	a,21009
1065  01fd c75211        	ld	21009,a
1066                     ; 444 }
1069  0200 81            	ret
1105                     ; 454 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1105                     ; 455 {
1106                     	switch	.text
1107  0201               _I2C_FastModeDutyCycleConfig:
1111                     ; 457   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1113                     ; 459   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1115  0201 a140          	cp	a,#64
1116  0203 2606          	jrne	L514
1117                     ; 462     I2C->CCRH |= I2C_CCRH_DUTY;
1119  0205 721c521c      	bset	21020,#6
1121  0209 2004          	jra	L714
1122  020b               L514:
1123                     ; 467     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1125  020b 721d521c      	bres	21020,#6
1126  020f               L714:
1127                     ; 469 }
1130  020f 81            	ret
1197                     ; 481 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1197                     ; 482 {
1198                     	switch	.text
1199  0210               _I2C_Send7bitAddress:
1201  0210 89            	pushw	x
1202       00000000      OFST:	set	0
1205                     ; 484   assert_param(IS_I2C_ADDRESS(Address));
1207                     ; 485   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1209                     ; 488   if (I2C_Direction != I2C_Direction_Transmitter)
1211  0211 9f            	ld	a,xl
1212  0212 4d            	tnz	a
1213  0213 2708          	jreq	L354
1214                     ; 491     Address |= OAR1_ADD0_Set;
1216  0215 7b01          	ld	a,(OFST+1,sp)
1217  0217 aa01          	or	a,#1
1218  0219 6b01          	ld	(OFST+1,sp),a
1220  021b 2006          	jra	L554
1221  021d               L354:
1222                     ; 496     Address &= OAR1_ADD0_Reset;
1224  021d 7b01          	ld	a,(OFST+1,sp)
1225  021f a4fe          	and	a,#254
1226  0221 6b01          	ld	(OFST+1,sp),a
1227  0223               L554:
1228                     ; 499   I2C->DR = Address;
1230  0223 7b01          	ld	a,(OFST+1,sp)
1231  0225 c75216        	ld	21014,a
1232                     ; 500 }
1235  0228 85            	popw	x
1236  0229 81            	ret
1270                     ; 523 void I2C_SendData(uint8_t Data)
1270                     ; 524 {
1271                     	switch	.text
1272  022a               _I2C_SendData:
1276                     ; 526   I2C->DR = Data;
1278  022a c75216        	ld	21014,a
1279                     ; 527 }
1282  022d 81            	ret
1305                     ; 534 uint8_t I2C_ReceiveData(void)
1305                     ; 535 {
1306                     	switch	.text
1307  022e               _I2C_ReceiveData:
1311                     ; 537   return ((uint8_t)I2C->DR);
1313  022e c65216        	ld	a,21014
1316  0231 81            	ret
1472                     ; 648 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1472                     ; 649 {
1473                     	switch	.text
1474  0232               _I2C_ITConfig:
1476  0232 89            	pushw	x
1477       00000000      OFST:	set	0
1480                     ; 651   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
1482                     ; 652   assert_param(IS_FUNCTIONAL_STATE(NewState));
1484                     ; 654   if (NewState != DISABLE)
1486  0233 0d05          	tnz	(OFST+5,sp)
1487  0235 2709          	jreq	L175
1488                     ; 657     I2C->ITR |= (uint8_t)I2C_IT;
1490  0237 9f            	ld	a,xl
1491  0238 ca521a        	or	a,21018
1492  023b c7521a        	ld	21018,a
1494  023e 2009          	jra	L375
1495  0240               L175:
1496                     ; 662     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1498  0240 7b02          	ld	a,(OFST+2,sp)
1499  0242 43            	cpl	a
1500  0243 c4521a        	and	a,21018
1501  0246 c7521a        	ld	21018,a
1502  0249               L375:
1503                     ; 664 }
1506  0249 85            	popw	x
1507  024a 81            	ret
1731                     ; 700 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1731                     ; 701 {
1732                     	switch	.text
1733  024b               _I2C_CheckEvent:
1735  024b 89            	pushw	x
1736  024c 5206          	subw	sp,#6
1737       00000006      OFST:	set	6
1740                     ; 702   uint16_t lastevent = 0;
1742                     ; 703   uint8_t flag1= 0;
1744                     ; 704   uint8_t flag2= 0;
1746                     ; 705   ErrorStatus status = ERROR;
1748                     ; 708   assert_param(IS_I2C_EVENT(I2C_Event));
1750                     ; 710   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1752  024e a30004        	cpw	x,#4
1753  0251 260d          	jrne	L507
1754                     ; 713       lastevent = (uint16_t)(I2C->SR2& I2C_SR2_AF);
1756  0253 c65218        	ld	a,21016
1757  0256 5f            	clrw	x
1758  0257 a404          	and	a,#4
1759  0259 5f            	clrw	x
1760  025a 02            	rlwa	x,a
1761  025b 1f04          	ldw	(OFST-2,sp),x
1762  025d 01            	rrwa	x,a
1765  025e 201f          	jra	L707
1766  0260               L507:
1767                     ; 718     flag1 = I2C->SR1;
1769  0260 c65217        	ld	a,21015
1770  0263 6b03          	ld	(OFST-3,sp),a
1772                     ; 719     flag2 = I2C->SR3;
1774  0265 c65219        	ld	a,21017
1775  0268 6b06          	ld	(OFST+0,sp),a
1777                     ; 720     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1779  026a 7b03          	ld	a,(OFST-3,sp)
1780  026c 5f            	clrw	x
1781  026d 97            	ld	xl,a
1782  026e 1f01          	ldw	(OFST-5,sp),x
1784  0270 7b06          	ld	a,(OFST+0,sp)
1785  0272 5f            	clrw	x
1786  0273 97            	ld	xl,a
1787  0274 4f            	clr	a
1788  0275 02            	rlwa	x,a
1789  0276 01            	rrwa	x,a
1790  0277 1a02          	or	a,(OFST-4,sp)
1791  0279 01            	rrwa	x,a
1792  027a 1a01          	or	a,(OFST-5,sp)
1793  027c 01            	rrwa	x,a
1794  027d 1f04          	ldw	(OFST-2,sp),x
1796  027f               L707:
1797                     ; 724   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1799  027f 1e04          	ldw	x,(OFST-2,sp)
1800  0281 01            	rrwa	x,a
1801  0282 1408          	and	a,(OFST+2,sp)
1802  0284 01            	rrwa	x,a
1803  0285 1407          	and	a,(OFST+1,sp)
1804  0287 01            	rrwa	x,a
1805  0288 1307          	cpw	x,(OFST+1,sp)
1806  028a 2606          	jrne	L117
1807                     ; 727     status = SUCCESS;
1809  028c a601          	ld	a,#1
1810  028e 6b06          	ld	(OFST+0,sp),a
1813  0290 2002          	jra	L317
1814  0292               L117:
1815                     ; 732     status = ERROR;
1817  0292 0f06          	clr	(OFST+0,sp)
1819  0294               L317:
1820                     ; 736   return status;
1822  0294 7b06          	ld	a,(OFST+0,sp)
1825  0296 5b08          	addw	sp,#8
1826  0298 81            	ret
1879                     ; 754 I2C_Event_TypeDef I2C_GetLastEvent(void)
1879                     ; 755 {
1880                     	switch	.text
1881  0299               _I2C_GetLastEvent:
1883  0299 5206          	subw	sp,#6
1884       00000006      OFST:	set	6
1887                     ; 756   __IO uint16_t lastevent = 0;
1889  029b 5f            	clrw	x
1890  029c 1f05          	ldw	(OFST-1,sp),x
1892                     ; 757   uint16_t flag1 = 0;
1894                     ; 758   uint16_t flag2 = 0;
1896                     ; 760   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1898  029e c65218        	ld	a,21016
1899  02a1 a504          	bcp	a,#4
1900  02a3 2707          	jreq	L347
1901                     ; 762     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1903  02a5 ae0004        	ldw	x,#4
1904  02a8 1f05          	ldw	(OFST-1,sp),x
1907  02aa 201b          	jra	L547
1908  02ac               L347:
1909                     ; 767     flag1 = I2C->SR1;
1911  02ac c65217        	ld	a,21015
1912  02af 5f            	clrw	x
1913  02b0 97            	ld	xl,a
1914  02b1 1f01          	ldw	(OFST-5,sp),x
1916                     ; 768     flag2 = I2C->SR3;
1918  02b3 c65219        	ld	a,21017
1919  02b6 5f            	clrw	x
1920  02b7 97            	ld	xl,a
1921  02b8 1f03          	ldw	(OFST-3,sp),x
1923                     ; 771     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1925  02ba 1e03          	ldw	x,(OFST-3,sp)
1926  02bc 4f            	clr	a
1927  02bd 02            	rlwa	x,a
1928  02be 01            	rrwa	x,a
1929  02bf 1a02          	or	a,(OFST-4,sp)
1930  02c1 01            	rrwa	x,a
1931  02c2 1a01          	or	a,(OFST-5,sp)
1932  02c4 01            	rrwa	x,a
1933  02c5 1f05          	ldw	(OFST-1,sp),x
1935  02c7               L547:
1936                     ; 774   return (I2C_Event_TypeDef)lastevent;
1938  02c7 1e05          	ldw	x,(OFST-1,sp)
1941  02c9 5b06          	addw	sp,#6
1942  02cb 81            	ret
2144                     ; 805 FlagStatus I2C_GetFlagStatus(I2C_FLAG_TypeDef I2C_FLAG)
2144                     ; 806 {
2145                     	switch	.text
2146  02cc               _I2C_GetFlagStatus:
2148  02cc 89            	pushw	x
2149  02cd 89            	pushw	x
2150       00000002      OFST:	set	2
2153                     ; 807   uint8_t tempreg = 0;
2155  02ce 0f02          	clr	(OFST+0,sp)
2157                     ; 808   uint8_t regindex = 0;
2159                     ; 809   FlagStatus bitstatus = RESET;
2161                     ; 812   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
2163                     ; 815   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
2165  02d0 9e            	ld	a,xh
2166  02d1 6b01          	ld	(OFST-1,sp),a
2168                     ; 818   switch (regindex)
2170  02d3 7b01          	ld	a,(OFST-1,sp)
2172                     ; 834     default:
2172                     ; 835       break;
2173  02d5 4a            	dec	a
2174  02d6 2708          	jreq	L747
2175  02d8 4a            	dec	a
2176  02d9 270c          	jreq	L157
2177  02db 4a            	dec	a
2178  02dc 2710          	jreq	L357
2179  02de 2013          	jra	L7601
2180  02e0               L747:
2181                     ; 821     case 0x01:
2181                     ; 822       tempreg = (uint8_t)I2C->SR1;
2183  02e0 c65217        	ld	a,21015
2184  02e3 6b02          	ld	(OFST+0,sp),a
2186                     ; 823       break;
2188  02e5 200c          	jra	L7601
2189  02e7               L157:
2190                     ; 826     case 0x02:
2190                     ; 827       tempreg = (uint8_t)I2C->SR2;
2192  02e7 c65218        	ld	a,21016
2193  02ea 6b02          	ld	(OFST+0,sp),a
2195                     ; 828       break;
2197  02ec 2005          	jra	L7601
2198  02ee               L357:
2199                     ; 831     case 0x03:
2199                     ; 832       tempreg = (uint8_t)I2C->SR3;
2201  02ee c65219        	ld	a,21017
2202  02f1 6b02          	ld	(OFST+0,sp),a
2204                     ; 833       break;
2206  02f3               L557:
2207                     ; 834     default:
2207                     ; 835       break;
2209  02f3               L7601:
2210                     ; 839   if ((tempreg & (uint8_t)I2C_FLAG) != 0)
2212  02f3 7b04          	ld	a,(OFST+2,sp)
2213  02f5 1502          	bcp	a,(OFST+0,sp)
2214  02f7 2706          	jreq	L1701
2215                     ; 842     bitstatus = SET;
2217  02f9 a601          	ld	a,#1
2218  02fb 6b02          	ld	(OFST+0,sp),a
2221  02fd 2002          	jra	L3701
2222  02ff               L1701:
2223                     ; 847     bitstatus = RESET;
2225  02ff 0f02          	clr	(OFST+0,sp)
2227  0301               L3701:
2228                     ; 850   return bitstatus;
2230  0301 7b02          	ld	a,(OFST+0,sp)
2233  0303 5b04          	addw	sp,#4
2234  0305 81            	ret
2278                     ; 879 void I2C_ClearFlag(I2C_FLAG_TypeDef I2C_FLAG)
2278                     ; 880 {
2279                     	switch	.text
2280  0306               _I2C_ClearFlag:
2282  0306 89            	pushw	x
2283       00000002      OFST:	set	2
2286                     ; 881   uint16_t flagpos = 0;
2288                     ; 883   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
2290                     ; 886   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2292  0307 01            	rrwa	x,a
2293  0308 a4ff          	and	a,#255
2294  030a 5f            	clrw	x
2295  030b 02            	rlwa	x,a
2296  030c 1f01          	ldw	(OFST-1,sp),x
2297  030e 01            	rrwa	x,a
2299                     ; 888   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2301  030f 7b02          	ld	a,(OFST+0,sp)
2302  0311 43            	cpl	a
2303  0312 c75218        	ld	21016,a
2304                     ; 889 }
2307  0315 85            	popw	x
2308  0316 81            	ret
2372                     ; 910 ITStatus I2C_GetITStatus(I2C_IT_TypeDef I2C_IT)
2372                     ; 911 {
2373                     	switch	.text
2374  0317               _I2C_GetITStatus:
2376  0317 89            	pushw	x
2377  0318 5204          	subw	sp,#4
2378       00000004      OFST:	set	4
2381                     ; 912   ITStatus bitstatus = RESET;
2383                     ; 913   __IO uint8_t enablestatus = 0;
2385  031a 0f03          	clr	(OFST-1,sp)
2387                     ; 914   uint16_t tempregister = 0;
2389                     ; 917   assert_param(IS_I2C_GET_IT(I2C_IT));
2391                     ; 919   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
2393  031c 9e            	ld	a,xh
2394  031d a407          	and	a,#7
2395  031f 5f            	clrw	x
2396  0320 97            	ld	xl,a
2397  0321 1f01          	ldw	(OFST-3,sp),x
2399                     ; 922   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2401  0323 c6521a        	ld	a,21018
2402  0326 1402          	and	a,(OFST-2,sp)
2403  0328 6b03          	ld	(OFST-1,sp),a
2405                     ; 924   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
2407  032a 7b05          	ld	a,(OFST+1,sp)
2408  032c 97            	ld	xl,a
2409  032d 7b06          	ld	a,(OFST+2,sp)
2410  032f 9f            	ld	a,xl
2411  0330 a430          	and	a,#48
2412  0332 97            	ld	xl,a
2413  0333 4f            	clr	a
2414  0334 02            	rlwa	x,a
2415  0335 a30100        	cpw	x,#256
2416  0338 2615          	jrne	L1511
2417                     ; 927     if (((I2C->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2419  033a c65217        	ld	a,21015
2420  033d 1506          	bcp	a,(OFST+2,sp)
2421  033f 270a          	jreq	L3511
2423  0341 0d03          	tnz	(OFST-1,sp)
2424  0343 2706          	jreq	L3511
2425                     ; 930       bitstatus = SET;
2427  0345 a601          	ld	a,#1
2428  0347 6b04          	ld	(OFST+0,sp),a
2431  0349 2017          	jra	L7511
2432  034b               L3511:
2433                     ; 935       bitstatus = RESET;
2435  034b 0f04          	clr	(OFST+0,sp)
2437  034d 2013          	jra	L7511
2438  034f               L1511:
2439                     ; 941     if (((I2C->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2441  034f c65218        	ld	a,21016
2442  0352 1506          	bcp	a,(OFST+2,sp)
2443  0354 270a          	jreq	L1611
2445  0356 0d03          	tnz	(OFST-1,sp)
2446  0358 2706          	jreq	L1611
2447                     ; 944       bitstatus = SET;
2449  035a a601          	ld	a,#1
2450  035c 6b04          	ld	(OFST+0,sp),a
2453  035e 2002          	jra	L7511
2454  0360               L1611:
2455                     ; 949       bitstatus = RESET;
2457  0360 0f04          	clr	(OFST+0,sp)
2459  0362               L7511:
2460                     ; 953   return  bitstatus;
2462  0362 7b04          	ld	a,(OFST+0,sp)
2465  0364 5b06          	addw	sp,#6
2466  0366 81            	ret
2511                     ; 982 void I2C_ClearITPendingBit(I2C_IT_TypeDef I2C_IT)
2511                     ; 983 {
2512                     	switch	.text
2513  0367               _I2C_ClearITPendingBit:
2515  0367 89            	pushw	x
2516       00000002      OFST:	set	2
2519                     ; 984   uint16_t flagpos = 0;
2521                     ; 987   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
2523                     ; 990   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
2525  0368 01            	rrwa	x,a
2526  0369 a4ff          	and	a,#255
2527  036b 5f            	clrw	x
2528  036c 02            	rlwa	x,a
2529  036d 1f01          	ldw	(OFST-1,sp),x
2530  036f 01            	rrwa	x,a
2532                     ; 993   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2534  0370 7b02          	ld	a,(OFST+0,sp)
2535  0372 43            	cpl	a
2536  0373 c75218        	ld	21016,a
2537                     ; 994 }
2540  0376 85            	popw	x
2541  0377 81            	ret
2554                     	xdef	_I2C_ClearITPendingBit
2555                     	xdef	_I2C_GetITStatus
2556                     	xdef	_I2C_ClearFlag
2557                     	xdef	_I2C_GetFlagStatus
2558                     	xdef	_I2C_GetLastEvent
2559                     	xdef	_I2C_CheckEvent
2560                     	xdef	_I2C_ITConfig
2561                     	xdef	_I2C_ReceiveData
2562                     	xdef	_I2C_SendData
2563                     	xdef	_I2C_Send7bitAddress
2564                     	xdef	_I2C_FastModeDutyCycleConfig
2565                     	xdef	_I2C_AckPositionConfig
2566                     	xdef	_I2C_AcknowledgeConfig
2567                     	xdef	_I2C_GenerateSTOP
2568                     	xdef	_I2C_GenerateSTART
2569                     	xdef	_I2C_StretchClockCmd
2570                     	xdef	_I2C_SoftwareResetCmd
2571                     	xdef	_I2C_GeneralCallCmd
2572                     	xdef	_I2C_Cmd
2573                     	xdef	_I2C_Init
2574                     	xdef	_I2C_DeInit
2575                     	xref	_CLK_GetClockFreq
2576                     	xref.b	c_lreg
2577                     	xref.b	c_x
2596                     	xref	c_uitol
2597                     	xref	c_sdivx
2598                     	xref	c_lzmp
2599                     	xref	c_rtol
2600                     	xref	c_smul
2601                     	xref	c_lmul
2602                     	xref	c_lcmp
2603                     	xref	c_ltor
2604                     	xref	c_ludv
2605                     	end
