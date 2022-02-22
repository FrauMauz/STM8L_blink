   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 63 void TIM2_DeInit(void)
  42                     ; 64 {
  44                     	switch	.text
  45  0000               _TIM2_DeInit:
  49                     ; 65   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  51  0000 725f5250      	clr	21072
  52                     ; 66   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  54  0004 725f5251      	clr	21073
  55                     ; 67   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  57  0008 725f5252      	clr	21074
  58                     ; 68   TIM2->ETR = TIM_ETR_RESET_VALUE;
  60  000c 725f5253      	clr	21075
  61                     ; 69   TIM2->IER = TIM_IER_RESET_VALUE;
  63  0010 725f5254      	clr	21076
  64                     ; 70   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  66  0014 725f5256      	clr	21078
  67                     ; 73   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  69  0018 725f525a      	clr	21082
  70                     ; 75   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  72  001c 35015258      	mov	21080,#1
  73                     ; 76   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  75  0020 35015259      	mov	21081,#1
  76                     ; 79   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  78  0024 725f525a      	clr	21082
  79                     ; 80   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  81  0028 725f5258      	clr	21080
  82                     ; 81   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  84  002c 725f5259      	clr	21081
  85                     ; 83   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  87  0030 725f525b      	clr	21083
  88                     ; 84   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  90  0034 725f525c      	clr	21084
  91                     ; 86   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  93  0038 725f525d      	clr	21085
  94                     ; 88   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  96  003c 35ff525e      	mov	21086,#255
  97                     ; 89   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
  99  0040 35ff525f      	mov	21087,#255
 100                     ; 91   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 102  0044 725f5260      	clr	21088
 103                     ; 92   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 105  0048 725f5261      	clr	21089
 106                     ; 93   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 108  004c 725f5262      	clr	21090
 109                     ; 94   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 111  0050 725f5263      	clr	21091
 112                     ; 96   TIM2->OISR = TIM_OISR_RESET_VALUE;
 114  0054 725f5265      	clr	21093
 115                     ; 97   TIM2->EGR = 0x01;/*TIM_EGR_UG;*/
 117  0058 35015257      	mov	21079,#1
 118                     ; 98   TIM2->BKR = TIM_BKR_RESET_VALUE;
 120  005c 725f5264      	clr	21092
 121                     ; 99   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 123  0060 725f5255      	clr	21077
 124                     ; 100 }
 127  0064 81            	ret
 289                     ; 124 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 289                     ; 125                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 289                     ; 126                        uint16_t TIM2_Period)
 289                     ; 127 {
 290                     	switch	.text
 291  0065               _TIM2_TimeBaseInit:
 293  0065 89            	pushw	x
 294       00000000      OFST:	set	0
 297                     ; 129   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 299                     ; 130   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 301                     ; 133   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 303  0066 7b05          	ld	a,(OFST+5,sp)
 304  0068 c7525e        	ld	21086,a
 305                     ; 134   TIM2->ARRL = (uint8_t)(TIM2_Period);
 307  006b 7b06          	ld	a,(OFST+6,sp)
 308  006d c7525f        	ld	21087,a
 309                     ; 137   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 311  0070 9e            	ld	a,xh
 312  0071 c7525d        	ld	21085,a
 313                     ; 140   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 315  0074 c65250        	ld	a,21072
 316  0077 a48f          	and	a,#143
 317  0079 c75250        	ld	21072,a
 318                     ; 141   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 320  007c 9f            	ld	a,xl
 321  007d ca5250        	or	a,21072
 322  0080 c75250        	ld	21072,a
 323                     ; 142 }
 326  0083 85            	popw	x
 327  0084 81            	ret
 525                     ; 169 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 525                     ; 170                   TIM2_OutputState_TypeDef TIM2_OutputState,
 525                     ; 171                   uint16_t TIM2_Pulse,
 525                     ; 172                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 525                     ; 173                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 525                     ; 174 {
 526                     	switch	.text
 527  0085               _TIM2_OC1Init:
 529  0085 89            	pushw	x
 530  0086 88            	push	a
 531       00000001      OFST:	set	1
 534                     ; 175   uint8_t tmpccmr1 = 0;
 536                     ; 178   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 538                     ; 179   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 540                     ; 180   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 542                     ; 181   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 544                     ; 183   tmpccmr1 = TIM2->CCMR1;
 546  0087 c65258        	ld	a,21080
 547  008a 6b01          	ld	(OFST+0,sp),a
 549                     ; 186   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 551  008c 7211525a      	bres	21082,#0
 552                     ; 188   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 554  0090 7b01          	ld	a,(OFST+0,sp)
 555  0092 a48f          	and	a,#143
 556  0094 6b01          	ld	(OFST+0,sp),a
 558                     ; 191   tmpccmr1 |= (uint8_t)TIM2_OCMode;
 560  0096 9e            	ld	a,xh
 561  0097 1a01          	or	a,(OFST+0,sp)
 562  0099 6b01          	ld	(OFST+0,sp),a
 564                     ; 193   TIM2->CCMR1 = tmpccmr1;
 566  009b 7b01          	ld	a,(OFST+0,sp)
 567  009d c75258        	ld	21080,a
 568                     ; 196   if (TIM2_OutputState == TIM2_OutputState_Enable)
 570  00a0 9f            	ld	a,xl
 571  00a1 a101          	cp	a,#1
 572  00a3 2606          	jrne	L722
 573                     ; 198     TIM2->CCER1 |= TIM_CCER1_CC1E;
 575  00a5 7210525a      	bset	21082,#0
 577  00a9 2004          	jra	L132
 578  00ab               L722:
 579                     ; 202     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 581  00ab 7211525a      	bres	21082,#0
 582  00af               L132:
 583                     ; 206   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 585  00af 7b08          	ld	a,(OFST+7,sp)
 586  00b1 a101          	cp	a,#1
 587  00b3 2606          	jrne	L332
 588                     ; 208     TIM2->CCER1 |= TIM_CCER1_CC1P;
 590  00b5 7212525a      	bset	21082,#1
 592  00b9 2004          	jra	L532
 593  00bb               L332:
 594                     ; 212     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 596  00bb 7213525a      	bres	21082,#1
 597  00bf               L532:
 598                     ; 216   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 600  00bf 7b09          	ld	a,(OFST+8,sp)
 601  00c1 a101          	cp	a,#1
 602  00c3 2606          	jrne	L732
 603                     ; 218     TIM2->OISR |= TIM_OISR_OIS1;
 605  00c5 72105265      	bset	21093,#0
 607  00c9 2004          	jra	L142
 608  00cb               L732:
 609                     ; 222     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 611  00cb 72115265      	bres	21093,#0
 612  00cf               L142:
 613                     ; 226   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 615  00cf 7b06          	ld	a,(OFST+5,sp)
 616  00d1 c75260        	ld	21088,a
 617                     ; 227   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 619  00d4 7b07          	ld	a,(OFST+6,sp)
 620  00d6 c75261        	ld	21089,a
 621                     ; 228 }
 624  00d9 5b03          	addw	sp,#3
 625  00db 81            	ret
 708                     ; 255 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 708                     ; 256                   TIM2_OutputState_TypeDef TIM2_OutputState,
 708                     ; 257                   uint16_t TIM2_Pulse,
 708                     ; 258                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 708                     ; 259                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 708                     ; 260 {
 709                     	switch	.text
 710  00dc               _TIM2_OC2Init:
 712  00dc 89            	pushw	x
 713  00dd 88            	push	a
 714       00000001      OFST:	set	1
 717                     ; 261   uint8_t tmpccmr2 = 0;
 719                     ; 264   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 721                     ; 265   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 723                     ; 266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 725                     ; 267   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 727                     ; 269   tmpccmr2 = TIM2->CCMR2;
 729  00de c65259        	ld	a,21081
 730  00e1 6b01          	ld	(OFST+0,sp),a
 732                     ; 272   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 734  00e3 7219525a      	bres	21082,#4
 735                     ; 275   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 737  00e7 7b01          	ld	a,(OFST+0,sp)
 738  00e9 a48f          	and	a,#143
 739  00eb 6b01          	ld	(OFST+0,sp),a
 741                     ; 278   tmpccmr2 |= (uint8_t)TIM2_OCMode;
 743  00ed 9e            	ld	a,xh
 744  00ee 1a01          	or	a,(OFST+0,sp)
 745  00f0 6b01          	ld	(OFST+0,sp),a
 747                     ; 280   TIM2->CCMR2 = tmpccmr2;
 749  00f2 7b01          	ld	a,(OFST+0,sp)
 750  00f4 c75259        	ld	21081,a
 751                     ; 283   if (TIM2_OutputState == TIM2_OutputState_Enable)
 753  00f7 9f            	ld	a,xl
 754  00f8 a101          	cp	a,#1
 755  00fa 2606          	jrne	L503
 756                     ; 285     TIM2->CCER1 |= TIM_CCER1_CC2E;
 758  00fc 7218525a      	bset	21082,#4
 760  0100 2004          	jra	L703
 761  0102               L503:
 762                     ; 289     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 764  0102 7219525a      	bres	21082,#4
 765  0106               L703:
 766                     ; 293   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 768  0106 7b08          	ld	a,(OFST+7,sp)
 769  0108 a101          	cp	a,#1
 770  010a 2606          	jrne	L113
 771                     ; 295     TIM2->CCER1 |= TIM_CCER1_CC2P;
 773  010c 721a525a      	bset	21082,#5
 775  0110 2004          	jra	L313
 776  0112               L113:
 777                     ; 299     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 779  0112 721b525a      	bres	21082,#5
 780  0116               L313:
 781                     ; 304   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 783  0116 7b09          	ld	a,(OFST+8,sp)
 784  0118 a101          	cp	a,#1
 785  011a 2606          	jrne	L513
 786                     ; 306     TIM2->OISR |= TIM_OISR_OIS2;
 788  011c 72145265      	bset	21093,#2
 790  0120 2004          	jra	L713
 791  0122               L513:
 792                     ; 310     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 794  0122 72155265      	bres	21093,#2
 795  0126               L713:
 796                     ; 314   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 798  0126 7b06          	ld	a,(OFST+5,sp)
 799  0128 c75262        	ld	21090,a
 800                     ; 315   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 802  012b 7b07          	ld	a,(OFST+6,sp)
 803  012d c75263        	ld	21091,a
 804                     ; 316 }
 807  0130 5b03          	addw	sp,#3
 808  0132 81            	ret
1006                     ; 344 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1006                     ; 345                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1006                     ; 346                     TIM2_BreakState_TypeDef TIM2_BreakState,
1006                     ; 347                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1006                     ; 348                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1006                     ; 349 
1006                     ; 350 {
1007                     	switch	.text
1008  0133               _TIM2_BKRConfig:
1010  0133 89            	pushw	x
1011       00000000      OFST:	set	0
1014                     ; 352   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1016                     ; 353   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1018                     ; 354   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1020                     ; 355   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1022                     ; 356   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1024                     ; 361   TIM2->BKR = (uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel | \
1024                     ; 362                         (uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity | \
1024                     ; 363                         (uint8_t)TIM2_AutomaticOutput);
1026  0134 9f            	ld	a,xl
1027  0135 1a01          	or	a,(OFST+1,sp)
1028  0137 1a05          	or	a,(OFST+5,sp)
1029  0139 1a06          	or	a,(OFST+6,sp)
1030  013b 1a07          	or	a,(OFST+7,sp)
1031  013d c75264        	ld	21092,a
1032                     ; 364 }
1035  0140 85            	popw	x
1036  0141 81            	ret
1220                     ; 390 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1220                     ; 391                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1220                     ; 392                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1220                     ; 393                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1220                     ; 394                  uint8_t TIM2_ICFilter)
1220                     ; 395 {
1221                     	switch	.text
1222  0142               _TIM2_ICInit:
1224  0142 89            	pushw	x
1225       00000000      OFST:	set	0
1228                     ; 397   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1230                     ; 399   if (TIM2_Channel == TIM2_Channel_1)
1232  0143 9e            	ld	a,xh
1233  0144 4d            	tnz	a
1234  0145 2614          	jrne	L735
1235                     ; 402     TI1_Config(TIM2_ICPolarity,
1235                     ; 403                TIM2_ICSelection,
1235                     ; 404                TIM2_ICFilter);
1237  0147 7b07          	ld	a,(OFST+7,sp)
1238  0149 88            	push	a
1239  014a 7b06          	ld	a,(OFST+6,sp)
1240  014c 97            	ld	xl,a
1241  014d 7b03          	ld	a,(OFST+3,sp)
1242  014f 95            	ld	xh,a
1243  0150 cd05e4        	call	L3_TI1_Config
1245  0153 84            	pop	a
1246                     ; 407     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1248  0154 7b06          	ld	a,(OFST+6,sp)
1249  0156 cd04db        	call	_TIM2_SetIC1Prescaler
1252  0159 2012          	jra	L145
1253  015b               L735:
1254                     ; 412     TI2_Config(TIM2_ICPolarity,
1254                     ; 413                TIM2_ICSelection,
1254                     ; 414                TIM2_ICFilter);
1256  015b 7b07          	ld	a,(OFST+7,sp)
1257  015d 88            	push	a
1258  015e 7b06          	ld	a,(OFST+6,sp)
1259  0160 97            	ld	xl,a
1260  0161 7b03          	ld	a,(OFST+3,sp)
1261  0163 95            	ld	xh,a
1262  0164 cd0621        	call	L5_TI2_Config
1264  0167 84            	pop	a
1265                     ; 416     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1267  0168 7b06          	ld	a,(OFST+6,sp)
1268  016a cd04f5        	call	_TIM2_SetIC2Prescaler
1270  016d               L145:
1271                     ; 418 }
1274  016d 85            	popw	x
1275  016e 81            	ret
1371                     ; 444 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1371                     ; 445                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1371                     ; 446                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1371                     ; 447                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1371                     ; 448                      uint8_t TIM2_ICFilter)
1371                     ; 449 {
1372                     	switch	.text
1373  016f               _TIM2_PWMIConfig:
1375  016f 89            	pushw	x
1376  0170 89            	pushw	x
1377       00000002      OFST:	set	2
1380                     ; 450   uint8_t icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1382                     ; 451   uint8_t icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1384                     ; 454   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1386                     ; 457   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1388  0171 9f            	ld	a,xl
1389  0172 4d            	tnz	a
1390  0173 2606          	jrne	L116
1391                     ; 459     icpolarity = (uint8_t)TIM2_ICPolarity_Falling;
1393  0175 a601          	ld	a,#1
1394  0177 6b01          	ld	(OFST-1,sp),a
1397  0179 2002          	jra	L316
1398  017b               L116:
1399                     ; 463     icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1401  017b 0f01          	clr	(OFST-1,sp)
1403  017d               L316:
1404                     ; 467   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1406  017d 7b07          	ld	a,(OFST+5,sp)
1407  017f a101          	cp	a,#1
1408  0181 2606          	jrne	L516
1409                     ; 469     icselection = (uint8_t)TIM2_ICSelection_IndirectTI;
1411  0183 a602          	ld	a,#2
1412  0185 6b02          	ld	(OFST+0,sp),a
1415  0187 2004          	jra	L716
1416  0189               L516:
1417                     ; 473     icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1419  0189 a601          	ld	a,#1
1420  018b 6b02          	ld	(OFST+0,sp),a
1422  018d               L716:
1423                     ; 476   if (TIM2_Channel == TIM2_Channel_1)
1425  018d 0d03          	tnz	(OFST+1,sp)
1426  018f 2626          	jrne	L126
1427                     ; 479     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1427                     ; 480                TIM2_ICFilter);
1429  0191 7b09          	ld	a,(OFST+7,sp)
1430  0193 88            	push	a
1431  0194 7b08          	ld	a,(OFST+6,sp)
1432  0196 97            	ld	xl,a
1433  0197 7b05          	ld	a,(OFST+3,sp)
1434  0199 95            	ld	xh,a
1435  019a cd05e4        	call	L3_TI1_Config
1437  019d 84            	pop	a
1438                     ; 483     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1440  019e 7b08          	ld	a,(OFST+6,sp)
1441  01a0 cd04db        	call	_TIM2_SetIC1Prescaler
1443                     ; 486     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1445  01a3 7b09          	ld	a,(OFST+7,sp)
1446  01a5 88            	push	a
1447  01a6 7b03          	ld	a,(OFST+1,sp)
1448  01a8 97            	ld	xl,a
1449  01a9 7b02          	ld	a,(OFST+0,sp)
1450  01ab 95            	ld	xh,a
1451  01ac cd0621        	call	L5_TI2_Config
1453  01af 84            	pop	a
1454                     ; 489     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1456  01b0 7b08          	ld	a,(OFST+6,sp)
1457  01b2 cd04f5        	call	_TIM2_SetIC2Prescaler
1460  01b5 2024          	jra	L326
1461  01b7               L126:
1462                     ; 494     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1462                     ; 495                TIM2_ICFilter);
1464  01b7 7b09          	ld	a,(OFST+7,sp)
1465  01b9 88            	push	a
1466  01ba 7b08          	ld	a,(OFST+6,sp)
1467  01bc 97            	ld	xl,a
1468  01bd 7b05          	ld	a,(OFST+3,sp)
1469  01bf 95            	ld	xh,a
1470  01c0 cd0621        	call	L5_TI2_Config
1472  01c3 84            	pop	a
1473                     ; 498     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1475  01c4 7b08          	ld	a,(OFST+6,sp)
1476  01c6 cd04f5        	call	_TIM2_SetIC2Prescaler
1478                     ; 501     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1480  01c9 7b09          	ld	a,(OFST+7,sp)
1481  01cb 88            	push	a
1482  01cc 7b03          	ld	a,(OFST+1,sp)
1483  01ce 97            	ld	xl,a
1484  01cf 7b02          	ld	a,(OFST+0,sp)
1485  01d1 95            	ld	xh,a
1486  01d2 cd05e4        	call	L3_TI1_Config
1488  01d5 84            	pop	a
1489                     ; 504     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1491  01d6 7b08          	ld	a,(OFST+6,sp)
1492  01d8 cd04db        	call	_TIM2_SetIC1Prescaler
1494  01db               L326:
1495                     ; 506 }
1498  01db 5b04          	addw	sp,#4
1499  01dd 81            	ret
1554                     ; 514 void TIM2_Cmd(FunctionalState NewState)
1554                     ; 515 {
1555                     	switch	.text
1556  01de               _TIM2_Cmd:
1560                     ; 517   assert_param(IS_FUNCTIONAL_STATE(NewState));
1562                     ; 520   if (NewState != DISABLE)
1564  01de 4d            	tnz	a
1565  01df 2706          	jreq	L356
1566                     ; 522     TIM2->CR1 |= TIM_CR1_CEN;
1568  01e1 72105250      	bset	21072,#0
1570  01e5 2004          	jra	L556
1571  01e7               L356:
1572                     ; 526     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1574  01e7 72115250      	bres	21072,#0
1575  01eb               L556:
1576                     ; 528 }
1579  01eb 81            	ret
1615                     ; 536 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1615                     ; 537 {
1616                     	switch	.text
1617  01ec               _TIM2_CtrlPWMOutputs:
1621                     ; 539   assert_param(IS_FUNCTIONAL_STATE(NewState));
1623                     ; 543   if (NewState != DISABLE)
1625  01ec 4d            	tnz	a
1626  01ed 2706          	jreq	L576
1627                     ; 545     TIM2->BKR |= TIM_BKR_MOE ;
1629  01ef 721e5264      	bset	21092,#7
1631  01f3 2004          	jra	L776
1632  01f5               L576:
1633                     ; 549     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1635  01f5 721f5264      	bres	21092,#7
1636  01f9               L776:
1637                     ; 551 }
1640  01f9 81            	ret
1726                     ; 566 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1726                     ; 567 {
1727                     	switch	.text
1728  01fa               _TIM2_ITConfig:
1730  01fa 89            	pushw	x
1731       00000000      OFST:	set	0
1734                     ; 569   assert_param(IS_TIM2_IT(TIM2_IT));
1736                     ; 570   assert_param(IS_FUNCTIONAL_STATE(NewState));
1738                     ; 572   if (NewState != DISABLE)
1740  01fb 9f            	ld	a,xl
1741  01fc 4d            	tnz	a
1742  01fd 2709          	jreq	L147
1743                     ; 575     TIM2->IER |= (uint8_t)TIM2_IT;
1745  01ff 9e            	ld	a,xh
1746  0200 ca5254        	or	a,21076
1747  0203 c75254        	ld	21076,a
1749  0206 2009          	jra	L347
1750  0208               L147:
1751                     ; 580     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1753  0208 7b01          	ld	a,(OFST+1,sp)
1754  020a 43            	cpl	a
1755  020b c45254        	and	a,21076
1756  020e c75254        	ld	21076,a
1757  0211               L347:
1758                     ; 582 }
1761  0211 85            	popw	x
1762  0212 81            	ret
1786                     ; 589 void TIM2_InternalClockConfig(void)
1786                     ; 590 {
1787                     	switch	.text
1788  0213               _TIM2_InternalClockConfig:
1792                     ; 592   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1794  0213 c65252        	ld	a,21074
1795  0216 a4f8          	and	a,#248
1796  0218 c75252        	ld	21074,a
1797                     ; 593 }
1800  021b 81            	ret
1917                     ; 611 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
1917                     ; 612                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
1917                     ; 613                               uint8_t TIM2_ExtTRGFilter)
1917                     ; 614 {
1918                     	switch	.text
1919  021c               _TIM2_ETRClockMode1Config:
1921  021c 89            	pushw	x
1922       00000000      OFST:	set	0
1925                     ; 616   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
1927  021d 7b05          	ld	a,(OFST+5,sp)
1928  021f 88            	push	a
1929  0220 9f            	ld	a,xl
1930  0221 97            	ld	xl,a
1931  0222 7b02          	ld	a,(OFST+2,sp)
1932  0224 95            	ld	xh,a
1933  0225 ad35          	call	_TIM2_ETRConfig
1935  0227 84            	pop	a
1936                     ; 619   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1938  0228 c65252        	ld	a,21074
1939  022b a4f8          	and	a,#248
1940  022d c75252        	ld	21074,a
1941                     ; 620   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
1943  0230 c65252        	ld	a,21074
1944  0233 aa07          	or	a,#7
1945  0235 c75252        	ld	21074,a
1946                     ; 623   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1948  0238 c65252        	ld	a,21074
1949  023b a48f          	and	a,#143
1950  023d c75252        	ld	21074,a
1951                     ; 624   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
1953  0240 c65252        	ld	a,21074
1954  0243 aa70          	or	a,#112
1955  0245 c75252        	ld	21074,a
1956                     ; 625 }
1959  0248 85            	popw	x
1960  0249 81            	ret
2018                     ; 634 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2018                     ; 635                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2018                     ; 636                               uint8_t TIM2_ExtTRGFilter)
2018                     ; 637 {
2019                     	switch	.text
2020  024a               _TIM2_ETRClockMode2Config:
2022  024a 89            	pushw	x
2023       00000000      OFST:	set	0
2026                     ; 639   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
2028  024b 7b05          	ld	a,(OFST+5,sp)
2029  024d 88            	push	a
2030  024e 9f            	ld	a,xl
2031  024f 97            	ld	xl,a
2032  0250 7b02          	ld	a,(OFST+2,sp)
2033  0252 95            	ld	xh,a
2034  0253 ad07          	call	_TIM2_ETRConfig
2036  0255 84            	pop	a
2037                     ; 642   TIM2->ETR |= TIM_ETR_ECE ;
2039  0256 721c5253      	bset	21075,#6
2040                     ; 643 }
2043  025a 85            	popw	x
2044  025b 81            	ret
2100                     ; 660 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2100                     ; 661                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2100                     ; 662                     uint8_t TIM2_ExtTRGFilter)
2100                     ; 663 {
2101                     	switch	.text
2102  025c               _TIM2_ETRConfig:
2104  025c 89            	pushw	x
2105       00000000      OFST:	set	0
2108                     ; 665   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2110                     ; 666   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2112                     ; 667   assert_param(IS_TIM2_EXT_FILTER(TIM2_ExtTRGFilter));
2114                     ; 669   TIM2->ETR |= (uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity | (uint8_t)TIM2_ExtTRGFilter);
2116  025d 9f            	ld	a,xl
2117  025e 1a01          	or	a,(OFST+1,sp)
2118  0260 1a05          	or	a,(OFST+5,sp)
2119  0262 ca5253        	or	a,21075
2120  0265 c75253        	ld	21075,a
2121                     ; 670 }
2124  0268 85            	popw	x
2125  0269 81            	ret
2214                     ; 687 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2214                     ; 688                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2214                     ; 689                                  uint8_t TIM2_ICFilter)
2214                     ; 690 {
2215                     	switch	.text
2216  026a               _TIM2_TIxExternalClockConfig:
2218  026a 89            	pushw	x
2219       00000000      OFST:	set	0
2222                     ; 692   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2224                     ; 693   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2226                     ; 694   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
2228                     ; 697   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2230  026b 9e            	ld	a,xh
2231  026c a160          	cp	a,#96
2232  026e 260e          	jrne	L3411
2233                     ; 699     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2235  0270 7b05          	ld	a,(OFST+5,sp)
2236  0272 88            	push	a
2237  0273 9f            	ld	a,xl
2238  0274 ae0001        	ldw	x,#1
2239  0277 95            	ld	xh,a
2240  0278 cd0621        	call	L5_TI2_Config
2242  027b 84            	pop	a
2244  027c 200d          	jra	L5411
2245  027e               L3411:
2246                     ; 703     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2248  027e 7b05          	ld	a,(OFST+5,sp)
2249  0280 88            	push	a
2250  0281 7b03          	ld	a,(OFST+3,sp)
2251  0283 ae0001        	ldw	x,#1
2252  0286 95            	ld	xh,a
2253  0287 cd05e4        	call	L3_TI1_Config
2255  028a 84            	pop	a
2256  028b               L5411:
2257                     ; 707   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2259  028b 7b01          	ld	a,(OFST+1,sp)
2260  028d ad0a          	call	_TIM2_SelectInputTrigger
2262                     ; 710   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2264  028f c65252        	ld	a,21074
2265  0292 aa07          	or	a,#7
2266  0294 c75252        	ld	21074,a
2267                     ; 711 }
2270  0297 85            	popw	x
2271  0298 81            	ret
2371                     ; 727 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2371                     ; 728 {
2372                     	switch	.text
2373  0299               _TIM2_SelectInputTrigger:
2375  0299 88            	push	a
2376  029a 88            	push	a
2377       00000001      OFST:	set	1
2380                     ; 729   uint8_t tmpsmcr = 0;
2382                     ; 732   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2384                     ; 734   tmpsmcr = TIM2->SMCR;
2386  029b c65252        	ld	a,21074
2387  029e 6b01          	ld	(OFST+0,sp),a
2389                     ; 737   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2391  02a0 7b01          	ld	a,(OFST+0,sp)
2392  02a2 a48f          	and	a,#143
2393  02a4 6b01          	ld	(OFST+0,sp),a
2395                     ; 738   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2397  02a6 7b01          	ld	a,(OFST+0,sp)
2398  02a8 1a02          	or	a,(OFST+1,sp)
2399  02aa 6b01          	ld	(OFST+0,sp),a
2401                     ; 740   TIM2->SMCR = (uint8_t)tmpsmcr;
2403  02ac 7b01          	ld	a,(OFST+0,sp)
2404  02ae c75252        	ld	21074,a
2405                     ; 741 }
2408  02b1 85            	popw	x
2409  02b2 81            	ret
2445                     ; 749 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2445                     ; 750 {
2446                     	switch	.text
2447  02b3               _TIM2_UpdateDisableConfig:
2451                     ; 752   assert_param(IS_FUNCTIONAL_STATE(NewState));
2453                     ; 755   if (NewState != DISABLE)
2455  02b3 4d            	tnz	a
2456  02b4 2706          	jreq	L7221
2457                     ; 757     TIM2->CR1 |= TIM_CR1_UDIS;
2459  02b6 72125250      	bset	21072,#1
2461  02ba 2004          	jra	L1321
2462  02bc               L7221:
2463                     ; 761     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2465  02bc 72135250      	bres	21072,#1
2466  02c0               L1321:
2467                     ; 763 }
2470  02c0 81            	ret
2528                     ; 773 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2528                     ; 774 {
2529                     	switch	.text
2530  02c1               _TIM2_UpdateRequestConfig:
2534                     ; 776   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2536                     ; 779   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2538  02c1 a101          	cp	a,#1
2539  02c3 2606          	jrne	L1621
2540                     ; 781     TIM2->CR1 |= TIM_CR1_URS ;
2542  02c5 72145250      	bset	21072,#2
2544  02c9 2004          	jra	L3621
2545  02cb               L1621:
2546                     ; 785     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2548  02cb 72155250      	bres	21072,#2
2549  02cf               L3621:
2550                     ; 787 }
2553  02cf 81            	ret
2589                     ; 795 void TIM2_SelectHallSensor(FunctionalState NewState)
2589                     ; 796 {
2590                     	switch	.text
2591  02d0               _TIM2_SelectHallSensor:
2595                     ; 798   assert_param(IS_FUNCTIONAL_STATE(NewState));
2597                     ; 801   if (NewState != DISABLE)
2599  02d0 4d            	tnz	a
2600  02d1 2706          	jreq	L3031
2601                     ; 803     TIM2->CR2 |= TIM_CR2_TI1S;
2603  02d3 721e5251      	bset	21073,#7
2605  02d7 2004          	jra	L5031
2606  02d9               L3031:
2607                     ; 807     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2609  02d9 721f5251      	bres	21073,#7
2610  02dd               L5031:
2611                     ; 809 }
2614  02dd 81            	ret
2671                     ; 819 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2671                     ; 820 {
2672                     	switch	.text
2673  02de               _TIM2_SelectOnePulseMode:
2677                     ; 822   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2679                     ; 825   if (TIM2_OPMode == TIM2_OPMode_Single)
2681  02de a101          	cp	a,#1
2682  02e0 2606          	jrne	L5331
2683                     ; 827     TIM2->CR1 |= TIM_CR1_OPM ;
2685  02e2 72165250      	bset	21072,#3
2687  02e6 2004          	jra	L7331
2688  02e8               L5331:
2689                     ; 831     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2691  02e8 72175250      	bres	21072,#3
2692  02ec               L7331:
2693                     ; 833 }
2696  02ec 81            	ret
2795                     ; 847 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2795                     ; 848 {
2796                     	switch	.text
2797  02ed               _TIM2_SelectOutputTrigger:
2799  02ed 88            	push	a
2800  02ee 88            	push	a
2801       00000001      OFST:	set	1
2804                     ; 849   uint8_t tmpcr2 = 0;
2806                     ; 852   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2808                     ; 854   tmpcr2 = TIM2->CR2;
2810  02ef c65251        	ld	a,21073
2811  02f2 6b01          	ld	(OFST+0,sp),a
2813                     ; 857   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2815  02f4 7b01          	ld	a,(OFST+0,sp)
2816  02f6 a48f          	and	a,#143
2817  02f8 6b01          	ld	(OFST+0,sp),a
2819                     ; 860   tmpcr2 |= (uint8_t)TIM2_TRGOSource;
2821  02fa 7b01          	ld	a,(OFST+0,sp)
2822  02fc 1a02          	or	a,(OFST+1,sp)
2823  02fe 6b01          	ld	(OFST+0,sp),a
2825                     ; 862   TIM2->CR2 = tmpcr2;
2827  0300 7b01          	ld	a,(OFST+0,sp)
2828  0302 c75251        	ld	21073,a
2829                     ; 863 }
2832  0305 85            	popw	x
2833  0306 81            	ret
2916                     ; 875 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
2916                     ; 876 {
2917                     	switch	.text
2918  0307               _TIM2_SelectSlaveMode:
2920  0307 88            	push	a
2921  0308 88            	push	a
2922       00000001      OFST:	set	1
2925                     ; 877   uint8_t tmpsmcr = 0;
2927                     ; 880   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
2929                     ; 882   tmpsmcr = TIM2->SMCR;
2931  0309 c65252        	ld	a,21074
2932  030c 6b01          	ld	(OFST+0,sp),a
2934                     ; 885   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2936  030e 7b01          	ld	a,(OFST+0,sp)
2937  0310 a4f8          	and	a,#248
2938  0312 6b01          	ld	(OFST+0,sp),a
2940                     ; 888   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
2942  0314 7b01          	ld	a,(OFST+0,sp)
2943  0316 1a02          	or	a,(OFST+1,sp)
2944  0318 6b01          	ld	(OFST+0,sp),a
2946                     ; 890   TIM2->SMCR = tmpsmcr;
2948  031a 7b01          	ld	a,(OFST+0,sp)
2949  031c c75252        	ld	21074,a
2950                     ; 891 }
2953  031f 85            	popw	x
2954  0320 81            	ret
2990                     ; 899 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
2990                     ; 900 {
2991                     	switch	.text
2992  0321               _TIM2_SelectMasterSlaveMode:
2996                     ; 902   assert_param(IS_FUNCTIONAL_STATE(NewState));
2998                     ; 905   if (NewState != DISABLE)
3000  0321 4d            	tnz	a
3001  0322 2706          	jreq	L7541
3002                     ; 907     TIM2->SMCR |= TIM_SMCR_MSM;
3004  0324 721e5252      	bset	21074,#7
3006  0328 2004          	jra	L1641
3007  032a               L7541:
3008                     ; 911     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
3010  032a 721f5252      	bres	21074,#7
3011  032e               L1641:
3012                     ; 913 }
3015  032e 81            	ret
3128                     ; 932 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3128                     ; 933                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3128                     ; 934                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3128                     ; 935 {
3129                     	switch	.text
3130  032f               _TIM2_EncoderInterfaceConfig:
3132  032f 89            	pushw	x
3133  0330 5203          	subw	sp,#3
3134       00000003      OFST:	set	3
3137                     ; 936   uint8_t tmpsmcr = 0;
3139                     ; 937   uint8_t tmpccmr1 = 0;
3141                     ; 938   uint8_t tmpccmr2 = 0;
3143                     ; 941   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3145                     ; 942   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3147                     ; 943   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3149                     ; 945   tmpsmcr = TIM2->SMCR;
3151  0332 c65252        	ld	a,21074
3152  0335 6b01          	ld	(OFST-2,sp),a
3154                     ; 946   tmpccmr1 = TIM2->CCMR1;
3156  0337 c65258        	ld	a,21080
3157  033a 6b02          	ld	(OFST-1,sp),a
3159                     ; 947   tmpccmr2 = TIM2->CCMR2;
3161  033c c65259        	ld	a,21081
3162  033f 6b03          	ld	(OFST+0,sp),a
3164                     ; 950   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3166  0341 7b01          	ld	a,(OFST-2,sp)
3167  0343 a4f0          	and	a,#240
3168  0345 6b01          	ld	(OFST-2,sp),a
3170                     ; 951   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3172  0347 9e            	ld	a,xh
3173  0348 1a01          	or	a,(OFST-2,sp)
3174  034a 6b01          	ld	(OFST-2,sp),a
3176                     ; 954   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3178  034c 7b02          	ld	a,(OFST-1,sp)
3179  034e a4fc          	and	a,#252
3180  0350 6b02          	ld	(OFST-1,sp),a
3182                     ; 955   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3184  0352 7b03          	ld	a,(OFST+0,sp)
3185  0354 a4fc          	and	a,#252
3186  0356 6b03          	ld	(OFST+0,sp),a
3188                     ; 956   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3190  0358 7b02          	ld	a,(OFST-1,sp)
3191  035a aa01          	or	a,#1
3192  035c 6b02          	ld	(OFST-1,sp),a
3194                     ; 957   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3196  035e 7b03          	ld	a,(OFST+0,sp)
3197  0360 aa01          	or	a,#1
3198  0362 6b03          	ld	(OFST+0,sp),a
3200                     ; 960   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3202  0364 9f            	ld	a,xl
3203  0365 a101          	cp	a,#1
3204  0367 2606          	jrne	L7351
3205                     ; 962     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3207  0369 7212525a      	bset	21082,#1
3209  036d 2004          	jra	L1451
3210  036f               L7351:
3211                     ; 966     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3213  036f 7213525a      	bres	21082,#1
3214  0373               L1451:
3215                     ; 969   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3217  0373 7b08          	ld	a,(OFST+5,sp)
3218  0375 a101          	cp	a,#1
3219  0377 2606          	jrne	L3451
3220                     ; 971     TIM2->CCER1 |= TIM_CCER1_CC2P ;
3222  0379 721a525a      	bset	21082,#5
3224  037d 2004          	jra	L5451
3225  037f               L3451:
3226                     ; 975     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3228  037f 721b525a      	bres	21082,#5
3229  0383               L5451:
3230                     ; 978   TIM2->SMCR = tmpsmcr;
3232  0383 7b01          	ld	a,(OFST-2,sp)
3233  0385 c75252        	ld	21074,a
3234                     ; 979   TIM2->CCMR1 = tmpccmr1;
3236  0388 7b02          	ld	a,(OFST-1,sp)
3237  038a c75258        	ld	21080,a
3238                     ; 980   TIM2->CCMR2 = tmpccmr2;
3240  038d 7b03          	ld	a,(OFST+0,sp)
3241  038f c75259        	ld	21081,a
3242                     ; 981 }
3245  0392 5b05          	addw	sp,#5
3246  0394 81            	ret
3314                     ; 1001 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef TIM2_Prescaler,
3314                     ; 1002                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3314                     ; 1003 {
3315                     	switch	.text
3316  0395               _TIM2_PrescalerConfig:
3320                     ; 1005   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
3322                     ; 1006   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3324                     ; 1009   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
3326  0395 9e            	ld	a,xh
3327  0396 c7525d        	ld	21085,a
3328                     ; 1012   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3330  0399 9f            	ld	a,xl
3331  039a a101          	cp	a,#1
3332  039c 2606          	jrne	L1061
3333                     ; 1014     TIM2->EGR |= TIM_EGR_UG ;
3335  039e 72105257      	bset	21079,#0
3337  03a2 2004          	jra	L3061
3338  03a4               L1061:
3339                     ; 1018     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3341  03a4 72115257      	bres	21079,#0
3342  03a8               L3061:
3343                     ; 1020 }
3346  03a8 81            	ret
3391                     ; 1033 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3391                     ; 1034 {
3392                     	switch	.text
3393  03a9               _TIM2_CounterModeConfig:
3395  03a9 88            	push	a
3396  03aa 88            	push	a
3397       00000001      OFST:	set	1
3400                     ; 1035   uint8_t tmpcr1 = 0;
3402                     ; 1038   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3404                     ; 1040   tmpcr1 = TIM2->CR1;
3406  03ab c65250        	ld	a,21072
3407  03ae 6b01          	ld	(OFST+0,sp),a
3409                     ; 1043   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3411  03b0 7b01          	ld	a,(OFST+0,sp)
3412  03b2 a48f          	and	a,#143
3413  03b4 6b01          	ld	(OFST+0,sp),a
3415                     ; 1046   tmpcr1 |= (uint8_t)TIM2_CounterMode;
3417  03b6 7b01          	ld	a,(OFST+0,sp)
3418  03b8 1a02          	or	a,(OFST+1,sp)
3419  03ba 6b01          	ld	(OFST+0,sp),a
3421                     ; 1048   TIM2->CR1 = tmpcr1;
3423  03bc 7b01          	ld	a,(OFST+0,sp)
3424  03be c75250        	ld	21072,a
3425                     ; 1049 }
3428  03c1 85            	popw	x
3429  03c2 81            	ret
3496                     ; 1059 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3496                     ; 1060 {
3497                     	switch	.text
3498  03c3               _TIM2_ForcedOC1Config:
3500  03c3 88            	push	a
3501  03c4 88            	push	a
3502       00000001      OFST:	set	1
3505                     ; 1061   uint8_t tmpccmr1 = 0;
3507                     ; 1064   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3509                     ; 1066   tmpccmr1 = TIM2->CCMR1;
3511  03c5 c65258        	ld	a,21080
3512  03c8 6b01          	ld	(OFST+0,sp),a
3514                     ; 1069   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3516  03ca 7b01          	ld	a,(OFST+0,sp)
3517  03cc a48f          	and	a,#143
3518  03ce 6b01          	ld	(OFST+0,sp),a
3520                     ; 1072   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3522  03d0 7b01          	ld	a,(OFST+0,sp)
3523  03d2 1a02          	or	a,(OFST+1,sp)
3524  03d4 6b01          	ld	(OFST+0,sp),a
3526                     ; 1074   TIM2->CCMR1 = tmpccmr1;
3528  03d6 7b01          	ld	a,(OFST+0,sp)
3529  03d8 c75258        	ld	21080,a
3530                     ; 1075 }
3533  03db 85            	popw	x
3534  03dc 81            	ret
3579                     ; 1085 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3579                     ; 1086 {
3580                     	switch	.text
3581  03dd               _TIM2_ForcedOC2Config:
3583  03dd 88            	push	a
3584  03de 88            	push	a
3585       00000001      OFST:	set	1
3588                     ; 1087   uint8_t tmpccmr2 = 0;
3590                     ; 1090   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3592                     ; 1092   tmpccmr2 = TIM2->CCMR2;
3594  03df c65259        	ld	a,21081
3595  03e2 6b01          	ld	(OFST+0,sp),a
3597                     ; 1095   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3599  03e4 7b01          	ld	a,(OFST+0,sp)
3600  03e6 a48f          	and	a,#143
3601  03e8 6b01          	ld	(OFST+0,sp),a
3603                     ; 1098   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3605  03ea 7b01          	ld	a,(OFST+0,sp)
3606  03ec 1a02          	or	a,(OFST+1,sp)
3607  03ee 6b01          	ld	(OFST+0,sp),a
3609                     ; 1100   TIM2->CCMR2 = tmpccmr2;
3611  03f0 7b01          	ld	a,(OFST+0,sp)
3612  03f2 c75259        	ld	21081,a
3613                     ; 1101 }
3616  03f5 85            	popw	x
3617  03f6 81            	ret
3653                     ; 1109 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3653                     ; 1110 {
3654                     	switch	.text
3655  03f7               _TIM2_ARRPreloadConfig:
3659                     ; 1112   assert_param(IS_FUNCTIONAL_STATE(NewState));
3661                     ; 1115   if (NewState != DISABLE)
3663  03f7 4d            	tnz	a
3664  03f8 2706          	jreq	L1271
3665                     ; 1117     TIM2->CR1 |= TIM_CR1_ARPE;
3667  03fa 721e5250      	bset	21072,#7
3669  03fe 2004          	jra	L3271
3670  0400               L1271:
3671                     ; 1121     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3673  0400 721f5250      	bres	21072,#7
3674  0404               L3271:
3675                     ; 1123 }
3678  0404 81            	ret
3714                     ; 1131 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3714                     ; 1132 {
3715                     	switch	.text
3716  0405               _TIM2_OC1PreloadConfig:
3720                     ; 1134   assert_param(IS_FUNCTIONAL_STATE(NewState));
3722                     ; 1137   if (NewState != DISABLE)
3724  0405 4d            	tnz	a
3725  0406 2706          	jreq	L3471
3726                     ; 1139     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3728  0408 72165258      	bset	21080,#3
3730  040c 2004          	jra	L5471
3731  040e               L3471:
3732                     ; 1143     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3734  040e 72175258      	bres	21080,#3
3735  0412               L5471:
3736                     ; 1145 }
3739  0412 81            	ret
3775                     ; 1153 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3775                     ; 1154 {
3776                     	switch	.text
3777  0413               _TIM2_OC2PreloadConfig:
3781                     ; 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
3783                     ; 1159   if (NewState != DISABLE)
3785  0413 4d            	tnz	a
3786  0414 2706          	jreq	L5671
3787                     ; 1161     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3789  0416 72165259      	bset	21081,#3
3791  041a 2004          	jra	L7671
3792  041c               L5671:
3793                     ; 1165     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3795  041c 72175259      	bres	21081,#3
3796  0420               L7671:
3797                     ; 1167 }
3800  0420 81            	ret
3835                     ; 1174 void TIM2_OC1FastCmd(FunctionalState NewState)
3835                     ; 1175 {
3836                     	switch	.text
3837  0421               _TIM2_OC1FastCmd:
3841                     ; 1177   assert_param(IS_FUNCTIONAL_STATE(NewState));
3843                     ; 1180   if (NewState != DISABLE)
3845  0421 4d            	tnz	a
3846  0422 2706          	jreq	L7002
3847                     ; 1182     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3849  0424 72145258      	bset	21080,#2
3851  0428 2004          	jra	L1102
3852  042a               L7002:
3853                     ; 1186     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3855  042a 72155258      	bres	21080,#2
3856  042e               L1102:
3857                     ; 1188 }
3860  042e 81            	ret
3895                     ; 1195 void TIM2_OC2FastCmd(FunctionalState NewState)
3895                     ; 1196 {
3896                     	switch	.text
3897  042f               _TIM2_OC2FastCmd:
3901                     ; 1198   assert_param(IS_FUNCTIONAL_STATE(NewState));
3903                     ; 1201   if (NewState != DISABLE)
3905  042f 4d            	tnz	a
3906  0430 2706          	jreq	L1302
3907                     ; 1203     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
3909  0432 72145259      	bset	21081,#2
3911  0436 2004          	jra	L3302
3912  0438               L1302:
3913                     ; 1207     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3915  0438 72155259      	bres	21081,#2
3916  043c               L3302:
3917                     ; 1209 }
3920  043c 81            	ret
4001                     ; 1222 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
4001                     ; 1223 {
4002                     	switch	.text
4003  043d               _TIM2_GenerateEvent:
4007                     ; 1225   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
4009                     ; 1228   TIM2->EGR |= (uint8_t)TIM2_EventSource;
4011  043d ca5257        	or	a,21079
4012  0440 c75257        	ld	21079,a
4013                     ; 1229 }
4016  0443 81            	ret
4052                     ; 1239 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4052                     ; 1240 {
4053                     	switch	.text
4054  0444               _TIM2_OC1PolarityConfig:
4058                     ; 1242   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4060                     ; 1245   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4062  0444 a101          	cp	a,#1
4063  0446 2606          	jrne	L7012
4064                     ; 1247     TIM2->CCER1 |= TIM_CCER1_CC1P ;
4066  0448 7212525a      	bset	21082,#1
4068  044c 2004          	jra	L1112
4069  044e               L7012:
4070                     ; 1251     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4072  044e 7213525a      	bres	21082,#1
4073  0452               L1112:
4074                     ; 1253 }
4077  0452 81            	ret
4113                     ; 1263 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4113                     ; 1264 {
4114                     	switch	.text
4115  0453               _TIM2_OC2PolarityConfig:
4119                     ; 1266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4121                     ; 1269   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4123  0453 a101          	cp	a,#1
4124  0455 2606          	jrne	L1312
4125                     ; 1271     TIM2->CCER1 |= TIM_CCER1_CC2P ;
4127  0457 721a525a      	bset	21082,#5
4129  045b 2004          	jra	L3312
4130  045d               L1312:
4131                     ; 1275     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4133  045d 721b525a      	bres	21082,#5
4134  0461               L3312:
4135                     ; 1277 }
4138  0461 81            	ret
4183                     ; 1289 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4183                     ; 1290                  FunctionalState NewState)
4183                     ; 1291 {
4184                     	switch	.text
4185  0462               _TIM2_CCxCmd:
4187  0462 89            	pushw	x
4188       00000000      OFST:	set	0
4191                     ; 1293   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4193                     ; 1294   assert_param(IS_FUNCTIONAL_STATE(NewState));
4195                     ; 1296   if (TIM2_Channel == TIM2_Channel_1)
4197  0463 9e            	ld	a,xh
4198  0464 4d            	tnz	a
4199  0465 2610          	jrne	L7512
4200                     ; 1299     if (NewState != DISABLE)
4202  0467 9f            	ld	a,xl
4203  0468 4d            	tnz	a
4204  0469 2706          	jreq	L1612
4205                     ; 1301       TIM2->CCER1 |= TIM_CCER1_CC1E ;
4207  046b 7210525a      	bset	21082,#0
4209  046f 2014          	jra	L5612
4210  0471               L1612:
4211                     ; 1305       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4213  0471 7211525a      	bres	21082,#0
4214  0475 200e          	jra	L5612
4215  0477               L7512:
4216                     ; 1312     if (NewState != DISABLE)
4218  0477 0d02          	tnz	(OFST+2,sp)
4219  0479 2706          	jreq	L7612
4220                     ; 1314       TIM2->CCER1 |= TIM_CCER1_CC2E;
4222  047b 7218525a      	bset	21082,#4
4224  047f 2004          	jra	L5612
4225  0481               L7612:
4226                     ; 1318       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4228  0481 7219525a      	bres	21082,#4
4229  0485               L5612:
4230                     ; 1322 }
4233  0485 85            	popw	x
4234  0486 81            	ret
4279                     ; 1342 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4279                     ; 1343                      TIM2_OCMode_TypeDef TIM2_OCMode)
4279                     ; 1344 {
4280                     	switch	.text
4281  0487               _TIM2_SelectOCxM:
4283  0487 89            	pushw	x
4284       00000000      OFST:	set	0
4287                     ; 1346   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4289                     ; 1347   assert_param(IS_TIM2_OCM(TIM2_OCMode));
4291                     ; 1349   if (TIM2_Channel == TIM2_Channel_1)
4293  0488 9e            	ld	a,xh
4294  0489 4d            	tnz	a
4295  048a 2615          	jrne	L5122
4296                     ; 1352     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4298  048c 7211525a      	bres	21082,#0
4299                     ; 1355     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4301  0490 c65258        	ld	a,21080
4302  0493 a48f          	and	a,#143
4303  0495 c75258        	ld	21080,a
4304                     ; 1358     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4306  0498 9f            	ld	a,xl
4307  0499 ca5258        	or	a,21080
4308  049c c75258        	ld	21080,a
4310  049f 2014          	jra	L7122
4311  04a1               L5122:
4312                     ; 1363     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4314  04a1 7219525a      	bres	21082,#4
4315                     ; 1366     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4317  04a5 c65259        	ld	a,21081
4318  04a8 a48f          	and	a,#143
4319  04aa c75259        	ld	21081,a
4320                     ; 1369     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4322  04ad c65259        	ld	a,21081
4323  04b0 1a02          	or	a,(OFST+2,sp)
4324  04b2 c75259        	ld	21081,a
4325  04b5               L7122:
4326                     ; 1371 }
4329  04b5 85            	popw	x
4330  04b6 81            	ret
4364                     ; 1379 void TIM2_SetCounter(uint16_t TIM2_Counter)
4364                     ; 1380 {
4365                     	switch	.text
4366  04b7               _TIM2_SetCounter:
4370                     ; 1383   TIM2->CNTRH = (uint8_t)(TIM2_Counter >> 8);
4372  04b7 9e            	ld	a,xh
4373  04b8 c7525b        	ld	21083,a
4374                     ; 1384   TIM2->CNTRL = (uint8_t)(TIM2_Counter);
4376  04bb 9f            	ld	a,xl
4377  04bc c7525c        	ld	21084,a
4378                     ; 1385 }
4381  04bf 81            	ret
4415                     ; 1393 void TIM2_SetAutoreload(uint16_t TIM2_Autoreload)
4415                     ; 1394 {
4416                     	switch	.text
4417  04c0               _TIM2_SetAutoreload:
4421                     ; 1396   TIM2->ARRH = (uint8_t)(TIM2_Autoreload >> 8);
4423  04c0 9e            	ld	a,xh
4424  04c1 c7525e        	ld	21086,a
4425                     ; 1397   TIM2->ARRL = (uint8_t)(TIM2_Autoreload);
4427  04c4 9f            	ld	a,xl
4428  04c5 c7525f        	ld	21087,a
4429                     ; 1398 }
4432  04c8 81            	ret
4466                     ; 1406 void TIM2_SetCompare1(uint16_t TIM2_Compare)
4466                     ; 1407 {
4467                     	switch	.text
4468  04c9               _TIM2_SetCompare1:
4472                     ; 1409   TIM2->CCR1H = (uint8_t)(TIM2_Compare >> 8);
4474  04c9 9e            	ld	a,xh
4475  04ca c75260        	ld	21088,a
4476                     ; 1410   TIM2->CCR1L = (uint8_t)(TIM2_Compare);
4478  04cd 9f            	ld	a,xl
4479  04ce c75261        	ld	21089,a
4480                     ; 1411 }
4483  04d1 81            	ret
4517                     ; 1419 void TIM2_SetCompare2(uint16_t TIM2_Compare)
4517                     ; 1420 {
4518                     	switch	.text
4519  04d2               _TIM2_SetCompare2:
4523                     ; 1422   TIM2->CCR2H = (uint8_t)(TIM2_Compare >> 8);
4525  04d2 9e            	ld	a,xh
4526  04d3 c75262        	ld	21090,a
4527                     ; 1423   TIM2->CCR2L = (uint8_t)(TIM2_Compare);
4529  04d6 9f            	ld	a,xl
4530  04d7 c75263        	ld	21091,a
4531                     ; 1424 }
4534  04da 81            	ret
4579                     ; 1436 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4579                     ; 1437 {
4580                     	switch	.text
4581  04db               _TIM2_SetIC1Prescaler:
4583  04db 88            	push	a
4584  04dc 88            	push	a
4585       00000001      OFST:	set	1
4588                     ; 1438   uint8_t tmpccmr1 = 0;
4590                     ; 1441   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4592                     ; 1443   tmpccmr1 = TIM2->CCMR1;
4594  04dd c65258        	ld	a,21080
4595  04e0 6b01          	ld	(OFST+0,sp),a
4597                     ; 1446   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4599  04e2 7b01          	ld	a,(OFST+0,sp)
4600  04e4 a4f3          	and	a,#243
4601  04e6 6b01          	ld	(OFST+0,sp),a
4603                     ; 1449   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4605  04e8 7b01          	ld	a,(OFST+0,sp)
4606  04ea 1a02          	or	a,(OFST+1,sp)
4607  04ec 6b01          	ld	(OFST+0,sp),a
4609                     ; 1451   TIM2->CCMR1 = tmpccmr1;
4611  04ee 7b01          	ld	a,(OFST+0,sp)
4612  04f0 c75258        	ld	21080,a
4613                     ; 1452 }
4616  04f3 85            	popw	x
4617  04f4 81            	ret
4662                     ; 1464 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4662                     ; 1465 {
4663                     	switch	.text
4664  04f5               _TIM2_SetIC2Prescaler:
4666  04f5 88            	push	a
4667  04f6 88            	push	a
4668       00000001      OFST:	set	1
4671                     ; 1466   uint8_t tmpccmr2 = 0;
4673                     ; 1469   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4675                     ; 1471   tmpccmr2 = TIM2->CCMR2;
4677  04f7 c65259        	ld	a,21081
4678  04fa 6b01          	ld	(OFST+0,sp),a
4680                     ; 1474   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4682  04fc 7b01          	ld	a,(OFST+0,sp)
4683  04fe a4f3          	and	a,#243
4684  0500 6b01          	ld	(OFST+0,sp),a
4686                     ; 1477   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4688  0502 7b01          	ld	a,(OFST+0,sp)
4689  0504 1a02          	or	a,(OFST+1,sp)
4690  0506 6b01          	ld	(OFST+0,sp),a
4692                     ; 1479   TIM2->CCMR2 = tmpccmr2;
4694  0508 7b01          	ld	a,(OFST+0,sp)
4695  050a c75259        	ld	21081,a
4696                     ; 1480 }
4699  050d 85            	popw	x
4700  050e 81            	ret
4752                     ; 1487 uint16_t TIM2_GetCapture1(void)
4752                     ; 1488 {
4753                     	switch	.text
4754  050f               _TIM2_GetCapture1:
4756  050f 5204          	subw	sp,#4
4757       00000004      OFST:	set	4
4760                     ; 1489   uint16_t tmpccr1 = 0;
4762                     ; 1492   tmpccr1h = TIM2->CCR1H;
4764  0511 c65260        	ld	a,21088
4765  0514 6b02          	ld	(OFST-2,sp),a
4767                     ; 1493   tmpccr1l = TIM2->CCR1L;
4769  0516 c65261        	ld	a,21089
4770  0519 6b01          	ld	(OFST-3,sp),a
4772                     ; 1495   tmpccr1 = (uint16_t)(tmpccr1l);
4774  051b 7b01          	ld	a,(OFST-3,sp)
4775  051d 5f            	clrw	x
4776  051e 97            	ld	xl,a
4777  051f 1f03          	ldw	(OFST-1,sp),x
4779                     ; 1496   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4781  0521 7b02          	ld	a,(OFST-2,sp)
4782  0523 5f            	clrw	x
4783  0524 97            	ld	xl,a
4784  0525 4f            	clr	a
4785  0526 02            	rlwa	x,a
4786  0527 01            	rrwa	x,a
4787  0528 1a04          	or	a,(OFST+0,sp)
4788  052a 01            	rrwa	x,a
4789  052b 1a03          	or	a,(OFST-1,sp)
4790  052d 01            	rrwa	x,a
4791  052e 1f03          	ldw	(OFST-1,sp),x
4793                     ; 1498   return ((uint16_t)tmpccr1);
4795  0530 1e03          	ldw	x,(OFST-1,sp)
4798  0532 5b04          	addw	sp,#4
4799  0534 81            	ret
4851                     ; 1506 uint16_t TIM2_GetCapture2(void)
4851                     ; 1507 {
4852                     	switch	.text
4853  0535               _TIM2_GetCapture2:
4855  0535 5204          	subw	sp,#4
4856       00000004      OFST:	set	4
4859                     ; 1508   uint16_t tmpccr2 = 0;
4861                     ; 1511   tmpccr2h = TIM2->CCR2H;
4863  0537 c65262        	ld	a,21090
4864  053a 6b02          	ld	(OFST-2,sp),a
4866                     ; 1512   tmpccr2l = TIM2->CCR2L;
4868  053c c65263        	ld	a,21091
4869  053f 6b01          	ld	(OFST-3,sp),a
4871                     ; 1514   tmpccr2 = (uint16_t)(tmpccr2l);
4873  0541 7b01          	ld	a,(OFST-3,sp)
4874  0543 5f            	clrw	x
4875  0544 97            	ld	xl,a
4876  0545 1f03          	ldw	(OFST-1,sp),x
4878                     ; 1515   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4880  0547 7b02          	ld	a,(OFST-2,sp)
4881  0549 5f            	clrw	x
4882  054a 97            	ld	xl,a
4883  054b 4f            	clr	a
4884  054c 02            	rlwa	x,a
4885  054d 01            	rrwa	x,a
4886  054e 1a04          	or	a,(OFST+0,sp)
4887  0550 01            	rrwa	x,a
4888  0551 1a03          	or	a,(OFST-1,sp)
4889  0553 01            	rrwa	x,a
4890  0554 1f03          	ldw	(OFST-1,sp),x
4892                     ; 1517   return ((uint16_t)tmpccr2);
4894  0556 1e03          	ldw	x,(OFST-1,sp)
4897  0558 5b04          	addw	sp,#4
4898  055a 81            	ret
4950                     ; 1525 uint16_t TIM2_GetCounter(void)
4950                     ; 1526 {
4951                     	switch	.text
4952  055b               _TIM2_GetCounter:
4954  055b 5204          	subw	sp,#4
4955       00000004      OFST:	set	4
4958                     ; 1527   uint16_t tmpcnt = 0;
4960                     ; 1530   tmpcntrh = TIM2->CNTRH;
4962  055d c6525b        	ld	a,21083
4963  0560 6b02          	ld	(OFST-2,sp),a
4965                     ; 1531   tmpcntrl = TIM2->CNTRL;
4967  0562 c6525c        	ld	a,21084
4968  0565 6b01          	ld	(OFST-3,sp),a
4970                     ; 1533   tmpcnt = (uint16_t)(tmpcntrl);
4972  0567 7b01          	ld	a,(OFST-3,sp)
4973  0569 5f            	clrw	x
4974  056a 97            	ld	xl,a
4975  056b 1f03          	ldw	(OFST-1,sp),x
4977                     ; 1534   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4979  056d 7b02          	ld	a,(OFST-2,sp)
4980  056f 5f            	clrw	x
4981  0570 97            	ld	xl,a
4982  0571 4f            	clr	a
4983  0572 02            	rlwa	x,a
4984  0573 01            	rrwa	x,a
4985  0574 1a04          	or	a,(OFST+0,sp)
4986  0576 01            	rrwa	x,a
4987  0577 1a03          	or	a,(OFST-1,sp)
4988  0579 01            	rrwa	x,a
4989  057a 1f03          	ldw	(OFST-1,sp),x
4991                     ; 1536   return ((uint16_t)tmpcnt);
4993  057c 1e03          	ldw	x,(OFST-1,sp)
4996  057e 5b04          	addw	sp,#4
4997  0580 81            	ret
5021                     ; 1544 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
5021                     ; 1545 {
5022                     	switch	.text
5023  0581               _TIM2_GetPrescaler:
5027                     ; 1547   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
5029  0581 c6525d        	ld	a,21085
5032  0584 81            	ret
5171                     ; 1563 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5171                     ; 1564 {
5172                     	switch	.text
5173  0585               _TIM2_GetFlagStatus:
5175  0585 89            	pushw	x
5176  0586 89            	pushw	x
5177       00000002      OFST:	set	2
5180                     ; 1565   FlagStatus bitstatus = RESET;
5182                     ; 1569   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5184                     ; 1571   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
5186  0587 9f            	ld	a,xl
5187  0588 c45255        	and	a,21077
5188  058b 6b01          	ld	(OFST-1,sp),a
5190                     ; 1572   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
5192  058d c65256        	ld	a,21078
5193  0590 1403          	and	a,(OFST+1,sp)
5194  0592 6b02          	ld	(OFST+0,sp),a
5196                     ; 1574   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
5198  0594 7b01          	ld	a,(OFST-1,sp)
5199  0596 1a02          	or	a,(OFST+0,sp)
5200  0598 2706          	jreq	L3552
5201                     ; 1576     bitstatus = SET;
5203  059a a601          	ld	a,#1
5204  059c 6b02          	ld	(OFST+0,sp),a
5207  059e 2002          	jra	L5552
5208  05a0               L3552:
5209                     ; 1580     bitstatus = RESET;
5211  05a0 0f02          	clr	(OFST+0,sp)
5213  05a2               L5552:
5214                     ; 1582   return ((FlagStatus)bitstatus);
5216  05a2 7b02          	ld	a,(OFST+0,sp)
5219  05a4 5b04          	addw	sp,#4
5220  05a6 81            	ret
5255                     ; 1596 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5255                     ; 1597 {
5256                     	switch	.text
5257  05a7               _TIM2_ClearFlag:
5259  05a7 89            	pushw	x
5260       00000000      OFST:	set	0
5263                     ; 1599   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5265                     ; 1601   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5267  05a8 9f            	ld	a,xl
5268  05a9 43            	cpl	a
5269  05aa c75255        	ld	21077,a
5270                     ; 1602   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5272  05ad 7b01          	ld	a,(OFST+1,sp)
5273  05af 43            	cpl	a
5274  05b0 c75256        	ld	21078,a
5275                     ; 1603 }
5278  05b3 85            	popw	x
5279  05b4 81            	ret
5343                     ; 1616 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5343                     ; 1617 {
5344                     	switch	.text
5345  05b5               _TIM2_GetITStatus:
5347  05b5 88            	push	a
5348  05b6 5203          	subw	sp,#3
5349       00000003      OFST:	set	3
5352                     ; 1618   __IO ITStatus bitstatus = RESET;
5354  05b8 0f03          	clr	(OFST+0,sp)
5356                     ; 1620   __IO uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5358  05ba 0f01          	clr	(OFST-2,sp)
5362  05bc 0f02          	clr	(OFST-1,sp)
5364                     ; 1623   assert_param(IS_TIM2_GET_IT(TIM2_IT));
5366                     ; 1625   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5368  05be c45255        	and	a,21077
5369  05c1 6b01          	ld	(OFST-2,sp),a
5371                     ; 1627   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5373  05c3 c65254        	ld	a,21076
5374  05c6 1404          	and	a,(OFST+1,sp)
5375  05c8 6b02          	ld	(OFST-1,sp),a
5377                     ; 1629   if ((TIM2_itStatus != (uint8_t)RESET) && (TIM2_itEnable != (uint8_t)RESET))
5379  05ca 0d01          	tnz	(OFST-2,sp)
5380  05cc 270a          	jreq	L7262
5382  05ce 0d02          	tnz	(OFST-1,sp)
5383  05d0 2706          	jreq	L7262
5384                     ; 1631     bitstatus = (ITStatus)SET;
5386  05d2 a601          	ld	a,#1
5387  05d4 6b03          	ld	(OFST+0,sp),a
5390  05d6 2002          	jra	L1362
5391  05d8               L7262:
5392                     ; 1635     bitstatus = (ITStatus)RESET;
5394  05d8 0f03          	clr	(OFST+0,sp)
5396  05da               L1362:
5397                     ; 1637   return ((ITStatus)bitstatus);
5399  05da 7b03          	ld	a,(OFST+0,sp)
5402  05dc 5b04          	addw	sp,#4
5403  05de 81            	ret
5439                     ; 1651 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5439                     ; 1652 {
5440                     	switch	.text
5441  05df               _TIM2_ClearITPendingBit:
5445                     ; 1654   assert_param(IS_TIM2_IT(TIM2_IT));
5447                     ; 1657   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5449  05df 43            	cpl	a
5450  05e0 c75255        	ld	21077,a
5451                     ; 1658 }
5454  05e3 81            	ret
5526                     ; 1675 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5526                     ; 1676                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5526                     ; 1677                        uint8_t TIM2_ICFilter)
5526                     ; 1678 {
5527                     	switch	.text
5528  05e4               L3_TI1_Config:
5530  05e4 89            	pushw	x
5531  05e5 89            	pushw	x
5532       00000002      OFST:	set	2
5535                     ; 1679   uint8_t tmpccmr1 = 0;
5537                     ; 1680   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5539  05e6 9e            	ld	a,xh
5540  05e7 6b01          	ld	(OFST-1,sp),a
5542                     ; 1681   tmpccmr1 = TIM2->CCMR1;
5544  05e9 c65258        	ld	a,21080
5545  05ec 6b02          	ld	(OFST+0,sp),a
5547                     ; 1684   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5549                     ; 1685   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5551                     ; 1686   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5553                     ; 1689   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5555  05ee 7211525a      	bres	21082,#0
5556                     ; 1692   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5558  05f2 7b02          	ld	a,(OFST+0,sp)
5559  05f4 a40c          	and	a,#12
5560  05f6 6b02          	ld	(OFST+0,sp),a
5562                     ; 1693   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5564  05f8 7b07          	ld	a,(OFST+5,sp)
5565  05fa 97            	ld	xl,a
5566  05fb a610          	ld	a,#16
5567  05fd 42            	mul	x,a
5568  05fe 9f            	ld	a,xl
5569  05ff 1a04          	or	a,(OFST+2,sp)
5570  0601 1a02          	or	a,(OFST+0,sp)
5571  0603 6b02          	ld	(OFST+0,sp),a
5573                     ; 1695   TIM2->CCMR1 = tmpccmr1;
5575  0605 7b02          	ld	a,(OFST+0,sp)
5576  0607 c75258        	ld	21080,a
5577                     ; 1698   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5579  060a 7b01          	ld	a,(OFST-1,sp)
5580  060c a101          	cp	a,#1
5581  060e 2606          	jrne	L7072
5582                     ; 1700     TIM2->CCER1 |= TIM_CCER1_CC1P;
5584  0610 7212525a      	bset	21082,#1
5586  0614 2004          	jra	L1172
5587  0616               L7072:
5588                     ; 1704     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5590  0616 7213525a      	bres	21082,#1
5591  061a               L1172:
5592                     ; 1708   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5594  061a 7210525a      	bset	21082,#0
5595                     ; 1709 }
5598  061e 5b04          	addw	sp,#4
5599  0620 81            	ret
5671                     ; 1726 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5671                     ; 1727                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5671                     ; 1728                        uint8_t TIM2_ICFilter)
5671                     ; 1729 {
5672                     	switch	.text
5673  0621               L5_TI2_Config:
5675  0621 89            	pushw	x
5676  0622 89            	pushw	x
5677       00000002      OFST:	set	2
5680                     ; 1730   uint8_t tmpccmr2 = 0;
5682                     ; 1731   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5684  0623 9e            	ld	a,xh
5685  0624 6b01          	ld	(OFST-1,sp),a
5687                     ; 1734   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5689                     ; 1735   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5691                     ; 1736   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5693                     ; 1738   tmpccmr2 = TIM2->CCMR2;
5695  0626 c65259        	ld	a,21081
5696  0629 6b02          	ld	(OFST+0,sp),a
5698                     ; 1741   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5700  062b 7219525a      	bres	21082,#4
5701                     ; 1744   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5703  062f 7b02          	ld	a,(OFST+0,sp)
5704  0631 a40c          	and	a,#12
5705  0633 6b02          	ld	(OFST+0,sp),a
5707                     ; 1745   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5709  0635 7b07          	ld	a,(OFST+5,sp)
5710  0637 97            	ld	xl,a
5711  0638 a610          	ld	a,#16
5712  063a 42            	mul	x,a
5713  063b 9f            	ld	a,xl
5714  063c 1a04          	or	a,(OFST+2,sp)
5715  063e 1a02          	or	a,(OFST+0,sp)
5716  0640 6b02          	ld	(OFST+0,sp),a
5718                     ; 1747   TIM2->CCMR2 = tmpccmr2;
5720  0642 7b02          	ld	a,(OFST+0,sp)
5721  0644 c75259        	ld	21081,a
5722                     ; 1750   if (tmpicpolarity == (uint8_t)TIM2_ICPolarity_Falling)
5724  0647 7b01          	ld	a,(OFST-1,sp)
5725  0649 a101          	cp	a,#1
5726  064b 2606          	jrne	L1572
5727                     ; 1752     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5729  064d 721a525a      	bset	21082,#5
5731  0651 2004          	jra	L3572
5732  0653               L1572:
5733                     ; 1756     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5735  0653 721b525a      	bres	21082,#5
5736  0657               L3572:
5737                     ; 1760   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5739  0657 7218525a      	bset	21082,#4
5740                     ; 1761 }
5743  065b 5b04          	addw	sp,#4
5744  065d 81            	ret
5812                     ; 1771 uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
5812                     ; 1772 {
5813                     	switch	.text
5814  065e               _TIM2_ComputeLsiClockFreq:
5816  065e 520c          	subw	sp,#12
5817       0000000c      OFST:	set	12
5820                     ; 1777   TIM2_ICInit(TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);
5822  0660 4b00          	push	#0
5823  0662 4b0c          	push	#12
5824  0664 4b01          	push	#1
5825  0666 5f            	clrw	x
5826  0667 cd0142        	call	_TIM2_ICInit
5828  066a 5b03          	addw	sp,#3
5829                     ; 1780   TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
5831  066c ae0201        	ldw	x,#513
5832  066f cd01fa        	call	_TIM2_ITConfig
5834                     ; 1783   TIM2_Cmd(ENABLE);
5836  0672 a601          	ld	a,#1
5837  0674 cd01de        	call	_TIM2_Cmd
5839                     ; 1785   TIM2->SR1 = 0x00;
5841  0677 725f5255      	clr	21077
5842                     ; 1786   TIM2->SR2 = 0x00;
5844  067b 725f5256      	clr	21078
5845                     ; 1789   TIM2_ClearFlag(TIM2_FLAG_CC1);
5847  067f ae0002        	ldw	x,#2
5848  0682 cd05a7        	call	_TIM2_ClearFlag
5851  0685               L1103:
5852                     ; 1792   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5854  0685 c65255        	ld	a,21077
5855  0688 a402          	and	a,#2
5856  068a a102          	cp	a,#2
5857  068c 26f7          	jrne	L1103
5858                     ; 1795   ICValue1 = TIM2_GetCapture1();
5860  068e cd050f        	call	_TIM2_GetCapture1
5862  0691 1f09          	ldw	(OFST-3,sp),x
5864                     ; 1796   TIM2_ClearFlag(TIM2_FLAG_CC1);
5866  0693 ae0002        	ldw	x,#2
5867  0696 cd05a7        	call	_TIM2_ClearFlag
5870  0699               L7103:
5871                     ; 1799   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5873  0699 c65255        	ld	a,21077
5874  069c a402          	and	a,#2
5875  069e a102          	cp	a,#2
5876  06a0 26f7          	jrne	L7103
5877                     ; 1802   ICValue2 = TIM2_GetCapture1();
5879  06a2 cd050f        	call	_TIM2_GetCapture1
5881  06a5 1f0b          	ldw	(OFST-1,sp),x
5883                     ; 1803   TIM2_ClearFlag(TIM2_FLAG_CC1);
5885  06a7 ae0002        	ldw	x,#2
5886  06aa cd05a7        	call	_TIM2_ClearFlag
5888                     ; 1806   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5890  06ad 7211525a      	bres	21082,#0
5891                     ; 1808   TIM2->CCMR1 = 0x00;
5893  06b1 725f5258      	clr	21080
5894                     ; 1810   TIM2_Cmd(DISABLE);
5896  06b5 4f            	clr	a
5897  06b6 cd01de        	call	_TIM2_Cmd
5899                     ; 1813   LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
5901  06b9 1e0b          	ldw	x,(OFST-1,sp)
5902  06bb 72f009        	subw	x,(OFST-3,sp)
5903  06be cd0000        	call	c_uitolx
5905  06c1 96            	ldw	x,sp
5906  06c2 1c0001        	addw	x,#OFST-11
5907  06c5 cd0000        	call	c_rtol
5910  06c8 96            	ldw	x,sp
5911  06c9 1c000f        	addw	x,#OFST+3
5912  06cc cd0000        	call	c_ltor
5914  06cf a603          	ld	a,#3
5915  06d1 cd0000        	call	c_llsh
5917  06d4 96            	ldw	x,sp
5918  06d5 1c0001        	addw	x,#OFST-11
5919  06d8 cd0000        	call	c_ludv
5921  06db 96            	ldw	x,sp
5922  06dc 1c0005        	addw	x,#OFST-7
5923  06df cd0000        	call	c_rtol
5926                     ; 1814   return LSIClockFreq;
5928  06e2 96            	ldw	x,sp
5929  06e3 1c0005        	addw	x,#OFST-7
5930  06e6 cd0000        	call	c_ltor
5934  06e9 5b0c          	addw	sp,#12
5935  06eb 81            	ret
5959                     ; 1822 FunctionalState TIM2_GetStatus(void)
5959                     ; 1823 {
5960                     	switch	.text
5961  06ec               _TIM2_GetStatus:
5965                     ; 1824   return ((FunctionalState)(TIM2->CR1 & TIM_CR1_CEN));
5967  06ec c65250        	ld	a,21072
5968  06ef a401          	and	a,#1
5971  06f1 81            	ret
5984                     	xdef	_TIM2_GetStatus
5985                     	xdef	_TIM2_ComputeLsiClockFreq
5986                     	xdef	_TIM2_ClearITPendingBit
5987                     	xdef	_TIM2_GetITStatus
5988                     	xdef	_TIM2_ClearFlag
5989                     	xdef	_TIM2_GetFlagStatus
5990                     	xdef	_TIM2_GetPrescaler
5991                     	xdef	_TIM2_GetCounter
5992                     	xdef	_TIM2_GetCapture2
5993                     	xdef	_TIM2_GetCapture1
5994                     	xdef	_TIM2_SetIC2Prescaler
5995                     	xdef	_TIM2_SetIC1Prescaler
5996                     	xdef	_TIM2_SetCompare2
5997                     	xdef	_TIM2_SetCompare1
5998                     	xdef	_TIM2_SetAutoreload
5999                     	xdef	_TIM2_SetCounter
6000                     	xdef	_TIM2_SelectOCxM
6001                     	xdef	_TIM2_CCxCmd
6002                     	xdef	_TIM2_OC2PolarityConfig
6003                     	xdef	_TIM2_OC1PolarityConfig
6004                     	xdef	_TIM2_GenerateEvent
6005                     	xdef	_TIM2_OC2FastCmd
6006                     	xdef	_TIM2_OC1FastCmd
6007                     	xdef	_TIM2_OC2PreloadConfig
6008                     	xdef	_TIM2_OC1PreloadConfig
6009                     	xdef	_TIM2_ARRPreloadConfig
6010                     	xdef	_TIM2_ForcedOC2Config
6011                     	xdef	_TIM2_ForcedOC1Config
6012                     	xdef	_TIM2_CounterModeConfig
6013                     	xdef	_TIM2_PrescalerConfig
6014                     	xdef	_TIM2_EncoderInterfaceConfig
6015                     	xdef	_TIM2_SelectMasterSlaveMode
6016                     	xdef	_TIM2_SelectSlaveMode
6017                     	xdef	_TIM2_SelectOutputTrigger
6018                     	xdef	_TIM2_SelectOnePulseMode
6019                     	xdef	_TIM2_SelectHallSensor
6020                     	xdef	_TIM2_UpdateRequestConfig
6021                     	xdef	_TIM2_UpdateDisableConfig
6022                     	xdef	_TIM2_SelectInputTrigger
6023                     	xdef	_TIM2_TIxExternalClockConfig
6024                     	xdef	_TIM2_ETRConfig
6025                     	xdef	_TIM2_ETRClockMode2Config
6026                     	xdef	_TIM2_ETRClockMode1Config
6027                     	xdef	_TIM2_InternalClockConfig
6028                     	xdef	_TIM2_ITConfig
6029                     	xdef	_TIM2_CtrlPWMOutputs
6030                     	xdef	_TIM2_Cmd
6031                     	xdef	_TIM2_PWMIConfig
6032                     	xdef	_TIM2_ICInit
6033                     	xdef	_TIM2_BKRConfig
6034                     	xdef	_TIM2_OC2Init
6035                     	xdef	_TIM2_OC1Init
6036                     	xdef	_TIM2_TimeBaseInit
6037                     	xdef	_TIM2_DeInit
6038                     	xref.b	c_x
6057                     	xref	c_ludv
6058                     	xref	c_rtol
6059                     	xref	c_uitolx
6060                     	xref	c_llsh
6061                     	xref	c_ltor
6062                     	end
