   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 64 void TIM3_DeInit(void)
  42                     ; 65 {
  44                     	switch	.text
  45  0000               _TIM3_DeInit:
  49                     ; 66   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  51  0000 725f5280      	clr	21120
  52                     ; 67   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  54  0004 725f5281      	clr	21121
  55                     ; 68   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  57  0008 725f5282      	clr	21122
  58                     ; 69   TIM3->ETR = TIM_ETR_RESET_VALUE;
  60  000c 725f5283      	clr	21123
  61                     ; 70   TIM3->IER = TIM_IER_RESET_VALUE;
  63  0010 725f5284      	clr	21124
  64                     ; 71   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  66  0014 725f5286      	clr	21126
  67                     ; 74   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  69  0018 725f528a      	clr	21130
  70                     ; 76   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  72  001c 35015288      	mov	21128,#1
  73                     ; 77   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  75  0020 35015289      	mov	21129,#1
  76                     ; 80   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  78  0024 725f528a      	clr	21130
  79                     ; 81   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  81  0028 725f5288      	clr	21128
  82                     ; 82   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  84  002c 725f5289      	clr	21129
  85                     ; 84   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  87  0030 725f528b      	clr	21131
  88                     ; 85   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  90  0034 725f528c      	clr	21132
  91                     ; 87   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  93  0038 725f528d      	clr	21133
  94                     ; 89   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
  96  003c 35ff528e      	mov	21134,#255
  97                     ; 90   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
  99  0040 35ff528f      	mov	21135,#255
 100                     ; 92   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 102  0044 725f5290      	clr	21136
 103                     ; 93   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 105  0048 725f5291      	clr	21137
 106                     ; 94   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 108  004c 725f5292      	clr	21138
 109                     ; 95   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 111  0050 725f5293      	clr	21139
 112                     ; 98   TIM3->OISR = TIM_OISR_RESET_VALUE;
 114  0054 725f5295      	clr	21141
 115                     ; 99   TIM3->EGR = 0x01;/*TIM_EGR_UG;*/
 117  0058 35015287      	mov	21127,#1
 118                     ; 100   TIM3->BKR = TIM_BKR_RESET_VALUE;
 120  005c 725f5294      	clr	21140
 121                     ; 101   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 123  0060 725f5285      	clr	21125
 124                     ; 102 }
 127  0064 81            	ret
 289                     ; 127 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 289                     ; 128                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 289                     ; 129                        uint16_t TIM3_Period)
 289                     ; 130 {
 290                     	switch	.text
 291  0065               _TIM3_TimeBaseInit:
 293  0065 89            	pushw	x
 294       00000000      OFST:	set	0
 297                     ; 132   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 299                     ; 133   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 301                     ; 138   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 303  0066 7b05          	ld	a,(OFST+5,sp)
 304  0068 c7528e        	ld	21134,a
 305                     ; 139   TIM3->ARRL = (uint8_t)(TIM3_Period);
 307  006b 7b06          	ld	a,(OFST+6,sp)
 308  006d c7528f        	ld	21135,a
 309                     ; 142   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 311  0070 9e            	ld	a,xh
 312  0071 c7528d        	ld	21133,a
 313                     ; 145   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 315  0074 c65280        	ld	a,21120
 316  0077 a48f          	and	a,#143
 317  0079 c75280        	ld	21120,a
 318                     ; 146   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 320  007c 9f            	ld	a,xl
 321  007d ca5280        	or	a,21120
 322  0080 c75280        	ld	21120,a
 323                     ; 147 }
 326  0083 85            	popw	x
 327  0084 81            	ret
 525                     ; 174 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 525                     ; 175                   TIM3_OutputState_TypeDef TIM3_OutputState,
 525                     ; 176                   uint16_t TIM3_Pulse,
 525                     ; 177                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 525                     ; 178                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 525                     ; 179 {
 526                     	switch	.text
 527  0085               _TIM3_OC1Init:
 529  0085 89            	pushw	x
 530  0086 88            	push	a
 531       00000001      OFST:	set	1
 534                     ; 180   uint8_t tmpccmr1 = 0;
 536                     ; 183   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 538                     ; 184   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 540                     ; 185   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 542                     ; 186   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 544                     ; 188   tmpccmr1 = TIM3->CCMR1;
 546  0087 c65288        	ld	a,21128
 547  008a 6b01          	ld	(OFST+0,sp),a
 549                     ; 191   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 551  008c 7211528a      	bres	21130,#0
 552                     ; 193   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 554  0090 7b01          	ld	a,(OFST+0,sp)
 555  0092 a48f          	and	a,#143
 556  0094 6b01          	ld	(OFST+0,sp),a
 558                     ; 196   tmpccmr1 |= (uint8_t)TIM3_OCMode;
 560  0096 9e            	ld	a,xh
 561  0097 1a01          	or	a,(OFST+0,sp)
 562  0099 6b01          	ld	(OFST+0,sp),a
 564                     ; 198   TIM3->CCMR1 = tmpccmr1;
 566  009b 7b01          	ld	a,(OFST+0,sp)
 567  009d c75288        	ld	21128,a
 568                     ; 201   if (TIM3_OutputState == TIM3_OutputState_Enable)
 570  00a0 9f            	ld	a,xl
 571  00a1 a101          	cp	a,#1
 572  00a3 2606          	jrne	L722
 573                     ; 203     TIM3->CCER1 |= TIM_CCER1_CC1E;
 575  00a5 7210528a      	bset	21130,#0
 577  00a9 2004          	jra	L132
 578  00ab               L722:
 579                     ; 207     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 581  00ab 7211528a      	bres	21130,#0
 582  00af               L132:
 583                     ; 211   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 585  00af 7b08          	ld	a,(OFST+7,sp)
 586  00b1 a101          	cp	a,#1
 587  00b3 2606          	jrne	L332
 588                     ; 213     TIM3->CCER1 |= TIM_CCER1_CC1P;
 590  00b5 7212528a      	bset	21130,#1
 592  00b9 2004          	jra	L532
 593  00bb               L332:
 594                     ; 217     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 596  00bb 7213528a      	bres	21130,#1
 597  00bf               L532:
 598                     ; 221   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 600  00bf 7b09          	ld	a,(OFST+8,sp)
 601  00c1 a101          	cp	a,#1
 602  00c3 2606          	jrne	L732
 603                     ; 223     TIM3->OISR |= TIM_OISR_OIS1;
 605  00c5 72105295      	bset	21141,#0
 607  00c9 2004          	jra	L142
 608  00cb               L732:
 609                     ; 227     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 611  00cb 72115295      	bres	21141,#0
 612  00cf               L142:
 613                     ; 231   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 615  00cf 7b06          	ld	a,(OFST+5,sp)
 616  00d1 c75290        	ld	21136,a
 617                     ; 232   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 619  00d4 7b07          	ld	a,(OFST+6,sp)
 620  00d6 c75291        	ld	21137,a
 621                     ; 233 }
 624  00d9 5b03          	addw	sp,#3
 625  00db 81            	ret
 708                     ; 260 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 708                     ; 261                   TIM3_OutputState_TypeDef TIM3_OutputState,
 708                     ; 262                   uint16_t TIM3_Pulse,
 708                     ; 263                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 708                     ; 264                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 708                     ; 265 {
 709                     	switch	.text
 710  00dc               _TIM3_OC2Init:
 712  00dc 89            	pushw	x
 713  00dd 88            	push	a
 714       00000001      OFST:	set	1
 717                     ; 266   uint8_t tmpccmr2 = 0;
 719                     ; 269   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 721                     ; 270   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 723                     ; 271   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 725                     ; 272   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 727                     ; 274   tmpccmr2 = TIM3->CCMR2;
 729  00de c65289        	ld	a,21129
 730  00e1 6b01          	ld	(OFST+0,sp),a
 732                     ; 277   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 734  00e3 7219528a      	bres	21130,#4
 735                     ; 280   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 737  00e7 7b01          	ld	a,(OFST+0,sp)
 738  00e9 a48f          	and	a,#143
 739  00eb 6b01          	ld	(OFST+0,sp),a
 741                     ; 283   tmpccmr2 |= (uint8_t)TIM3_OCMode;
 743  00ed 9e            	ld	a,xh
 744  00ee 1a01          	or	a,(OFST+0,sp)
 745  00f0 6b01          	ld	(OFST+0,sp),a
 747                     ; 285   TIM3->CCMR2 = tmpccmr2;
 749  00f2 7b01          	ld	a,(OFST+0,sp)
 750  00f4 c75289        	ld	21129,a
 751                     ; 288   if (TIM3_OutputState == TIM3_OutputState_Enable)
 753  00f7 9f            	ld	a,xl
 754  00f8 a101          	cp	a,#1
 755  00fa 2606          	jrne	L503
 756                     ; 290     TIM3->CCER1 |= TIM_CCER1_CC2E;
 758  00fc 7218528a      	bset	21130,#4
 760  0100 2004          	jra	L703
 761  0102               L503:
 762                     ; 294     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 764  0102 7219528a      	bres	21130,#4
 765  0106               L703:
 766                     ; 298   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 768  0106 7b08          	ld	a,(OFST+7,sp)
 769  0108 a101          	cp	a,#1
 770  010a 2606          	jrne	L113
 771                     ; 300     TIM3->CCER1 |= TIM_CCER1_CC2P;
 773  010c 721a528a      	bset	21130,#5
 775  0110 2004          	jra	L313
 776  0112               L113:
 777                     ; 304     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 779  0112 721b528a      	bres	21130,#5
 780  0116               L313:
 781                     ; 309   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 783  0116 7b09          	ld	a,(OFST+8,sp)
 784  0118 a101          	cp	a,#1
 785  011a 2606          	jrne	L513
 786                     ; 311     TIM3->OISR |= TIM_OISR_OIS2;
 788  011c 72145295      	bset	21141,#2
 790  0120 2004          	jra	L713
 791  0122               L513:
 792                     ; 315     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 794  0122 72155295      	bres	21141,#2
 795  0126               L713:
 796                     ; 319   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 798  0126 7b06          	ld	a,(OFST+5,sp)
 799  0128 c75292        	ld	21138,a
 800                     ; 320   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 802  012b 7b07          	ld	a,(OFST+6,sp)
 803  012d c75293        	ld	21139,a
 804                     ; 321 }
 807  0130 5b03          	addw	sp,#3
 808  0132 81            	ret
1006                     ; 350 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1006                     ; 351                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1006                     ; 352                     TIM3_BreakState_TypeDef TIM3_BreakState,
1006                     ; 353                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1006                     ; 354                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1006                     ; 355 
1006                     ; 356 {
1007                     	switch	.text
1008  0133               _TIM3_BKRConfig:
1010  0133 89            	pushw	x
1011       00000000      OFST:	set	0
1014                     ; 358   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1016                     ; 359   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1018                     ; 360   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1020                     ; 361   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1022                     ; 362   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1024                     ; 369   TIM3->BKR = (uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel | \
1024                     ; 370                         (uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity | \
1024                     ; 371                         (uint8_t)TIM3_AutomaticOutput);
1026  0134 9f            	ld	a,xl
1027  0135 1a01          	or	a,(OFST+1,sp)
1028  0137 1a05          	or	a,(OFST+5,sp)
1029  0139 1a06          	or	a,(OFST+6,sp)
1030  013b 1a07          	or	a,(OFST+7,sp)
1031  013d c75294        	ld	21140,a
1032                     ; 372 }
1035  0140 85            	popw	x
1036  0141 81            	ret
1220                     ; 398 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
1220                     ; 399                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1220                     ; 400                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
1220                     ; 401                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1220                     ; 402                  uint8_t TIM3_ICFilter)
1220                     ; 403 {
1221                     	switch	.text
1222  0142               _TIM3_ICInit:
1224  0142 89            	pushw	x
1225       00000000      OFST:	set	0
1228                     ; 405   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1230                     ; 407   if (TIM3_Channel == TIM3_Channel_1)
1232  0143 9e            	ld	a,xh
1233  0144 4d            	tnz	a
1234  0145 2614          	jrne	L735
1235                     ; 410     TI1_Config(TIM3_ICPolarity,
1235                     ; 411                TIM3_ICSelection,
1235                     ; 412                TIM3_ICFilter);
1237  0147 7b07          	ld	a,(OFST+7,sp)
1238  0149 88            	push	a
1239  014a 7b06          	ld	a,(OFST+6,sp)
1240  014c 97            	ld	xl,a
1241  014d 7b03          	ld	a,(OFST+3,sp)
1242  014f 95            	ld	xh,a
1243  0150 cd05e4        	call	L3_TI1_Config
1245  0153 84            	pop	a
1246                     ; 415     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1248  0154 7b06          	ld	a,(OFST+6,sp)
1249  0156 cd04db        	call	_TIM3_SetIC1Prescaler
1252  0159 2012          	jra	L145
1253  015b               L735:
1254                     ; 420     TI2_Config(TIM3_ICPolarity,
1254                     ; 421                TIM3_ICSelection,
1254                     ; 422                TIM3_ICFilter);
1256  015b 7b07          	ld	a,(OFST+7,sp)
1257  015d 88            	push	a
1258  015e 7b06          	ld	a,(OFST+6,sp)
1259  0160 97            	ld	xl,a
1260  0161 7b03          	ld	a,(OFST+3,sp)
1261  0163 95            	ld	xh,a
1262  0164 cd0621        	call	L5_TI2_Config
1264  0167 84            	pop	a
1265                     ; 424     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1267  0168 7b06          	ld	a,(OFST+6,sp)
1268  016a cd04f5        	call	_TIM3_SetIC2Prescaler
1270  016d               L145:
1271                     ; 426 }
1274  016d 85            	popw	x
1275  016e 81            	ret
1371                     ; 452 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1371                     ; 453                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1371                     ; 454                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1371                     ; 455                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1371                     ; 456                      uint8_t TIM3_ICFilter)
1371                     ; 457 {
1372                     	switch	.text
1373  016f               _TIM3_PWMIConfig:
1375  016f 89            	pushw	x
1376  0170 89            	pushw	x
1377       00000002      OFST:	set	2
1380                     ; 458   uint8_t icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1382                     ; 459   uint8_t icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1384                     ; 462   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1386                     ; 465   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
1388  0171 9f            	ld	a,xl
1389  0172 4d            	tnz	a
1390  0173 2606          	jrne	L116
1391                     ; 467     icpolarity = (uint8_t)TIM3_ICPolarity_Falling;
1393  0175 a601          	ld	a,#1
1394  0177 6b01          	ld	(OFST-1,sp),a
1397  0179 2002          	jra	L316
1398  017b               L116:
1399                     ; 471     icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1401  017b 0f01          	clr	(OFST-1,sp)
1403  017d               L316:
1404                     ; 475   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
1406  017d 7b07          	ld	a,(OFST+5,sp)
1407  017f a101          	cp	a,#1
1408  0181 2606          	jrne	L516
1409                     ; 477     icselection = (uint8_t)TIM3_ICSelection_IndirectTI;
1411  0183 a602          	ld	a,#2
1412  0185 6b02          	ld	(OFST+0,sp),a
1415  0187 2004          	jra	L716
1416  0189               L516:
1417                     ; 481     icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1419  0189 a601          	ld	a,#1
1420  018b 6b02          	ld	(OFST+0,sp),a
1422  018d               L716:
1423                     ; 484   if (TIM3_Channel == TIM3_Channel_1)
1425  018d 0d03          	tnz	(OFST+1,sp)
1426  018f 2626          	jrne	L126
1427                     ; 487     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
1427                     ; 488                TIM3_ICFilter);
1429  0191 7b09          	ld	a,(OFST+7,sp)
1430  0193 88            	push	a
1431  0194 7b08          	ld	a,(OFST+6,sp)
1432  0196 97            	ld	xl,a
1433  0197 7b05          	ld	a,(OFST+3,sp)
1434  0199 95            	ld	xh,a
1435  019a cd05e4        	call	L3_TI1_Config
1437  019d 84            	pop	a
1438                     ; 491     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1440  019e 7b08          	ld	a,(OFST+6,sp)
1441  01a0 cd04db        	call	_TIM3_SetIC1Prescaler
1443                     ; 494     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1445  01a3 7b09          	ld	a,(OFST+7,sp)
1446  01a5 88            	push	a
1447  01a6 7b03          	ld	a,(OFST+1,sp)
1448  01a8 97            	ld	xl,a
1449  01a9 7b02          	ld	a,(OFST+0,sp)
1450  01ab 95            	ld	xh,a
1451  01ac cd0621        	call	L5_TI2_Config
1453  01af 84            	pop	a
1454                     ; 497     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1456  01b0 7b08          	ld	a,(OFST+6,sp)
1457  01b2 cd04f5        	call	_TIM3_SetIC2Prescaler
1460  01b5 2024          	jra	L326
1461  01b7               L126:
1462                     ; 502     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
1462                     ; 503                TIM3_ICFilter);
1464  01b7 7b09          	ld	a,(OFST+7,sp)
1465  01b9 88            	push	a
1466  01ba 7b08          	ld	a,(OFST+6,sp)
1467  01bc 97            	ld	xl,a
1468  01bd 7b05          	ld	a,(OFST+3,sp)
1469  01bf 95            	ld	xh,a
1470  01c0 cd0621        	call	L5_TI2_Config
1472  01c3 84            	pop	a
1473                     ; 506     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1475  01c4 7b08          	ld	a,(OFST+6,sp)
1476  01c6 cd04f5        	call	_TIM3_SetIC2Prescaler
1478                     ; 509     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1480  01c9 7b09          	ld	a,(OFST+7,sp)
1481  01cb 88            	push	a
1482  01cc 7b03          	ld	a,(OFST+1,sp)
1483  01ce 97            	ld	xl,a
1484  01cf 7b02          	ld	a,(OFST+0,sp)
1485  01d1 95            	ld	xh,a
1486  01d2 cd05e4        	call	L3_TI1_Config
1488  01d5 84            	pop	a
1489                     ; 512     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1491  01d6 7b08          	ld	a,(OFST+6,sp)
1492  01d8 cd04db        	call	_TIM3_SetIC1Prescaler
1494  01db               L326:
1495                     ; 514 }
1498  01db 5b04          	addw	sp,#4
1499  01dd 81            	ret
1554                     ; 522 void TIM3_Cmd(FunctionalState NewState)
1554                     ; 523 {
1555                     	switch	.text
1556  01de               _TIM3_Cmd:
1560                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1562                     ; 528   if (NewState != DISABLE)
1564  01de 4d            	tnz	a
1565  01df 2706          	jreq	L356
1566                     ; 530     TIM3->CR1 |= TIM_CR1_CEN;
1568  01e1 72105280      	bset	21120,#0
1570  01e5 2004          	jra	L556
1571  01e7               L356:
1572                     ; 534     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1574  01e7 72115280      	bres	21120,#0
1575  01eb               L556:
1576                     ; 536 }
1579  01eb 81            	ret
1615                     ; 544 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1615                     ; 545 {
1616                     	switch	.text
1617  01ec               _TIM3_CtrlPWMOutputs:
1621                     ; 547   assert_param(IS_FUNCTIONAL_STATE(NewState));
1623                     ; 551   if (NewState != DISABLE)
1625  01ec 4d            	tnz	a
1626  01ed 2706          	jreq	L576
1627                     ; 553     TIM3->BKR |= TIM_BKR_MOE ;
1629  01ef 721e5294      	bset	21140,#7
1631  01f3 2004          	jra	L776
1632  01f5               L576:
1633                     ; 557     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1635  01f5 721f5294      	bres	21140,#7
1636  01f9               L776:
1637                     ; 559 }
1640  01f9 81            	ret
1726                     ; 574 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1726                     ; 575 {
1727                     	switch	.text
1728  01fa               _TIM3_ITConfig:
1730  01fa 89            	pushw	x
1731       00000000      OFST:	set	0
1734                     ; 577   assert_param(IS_TIM3_IT(TIM3_IT));
1736                     ; 578   assert_param(IS_FUNCTIONAL_STATE(NewState));
1738                     ; 580   if (NewState != DISABLE)
1740  01fb 9f            	ld	a,xl
1741  01fc 4d            	tnz	a
1742  01fd 2709          	jreq	L147
1743                     ; 583     TIM3->IER |= (uint8_t)TIM3_IT;
1745  01ff 9e            	ld	a,xh
1746  0200 ca5284        	or	a,21124
1747  0203 c75284        	ld	21124,a
1749  0206 2009          	jra	L347
1750  0208               L147:
1751                     ; 588     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
1753  0208 7b01          	ld	a,(OFST+1,sp)
1754  020a 43            	cpl	a
1755  020b c45284        	and	a,21124
1756  020e c75284        	ld	21124,a
1757  0211               L347:
1758                     ; 590 }
1761  0211 85            	popw	x
1762  0212 81            	ret
1786                     ; 597 void TIM3_InternalClockConfig(void)
1786                     ; 598 {
1787                     	switch	.text
1788  0213               _TIM3_InternalClockConfig:
1792                     ; 600   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1794  0213 c65282        	ld	a,21122
1795  0216 a4f8          	and	a,#248
1796  0218 c75282        	ld	21122,a
1797                     ; 601 }
1800  021b 81            	ret
1917                     ; 619 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1917                     ; 620                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1917                     ; 621                               uint8_t TIM3_ExtTRGFilter)
1917                     ; 622 {
1918                     	switch	.text
1919  021c               _TIM3_ETRClockMode1Config:
1921  021c 89            	pushw	x
1922       00000000      OFST:	set	0
1925                     ; 624   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
1927  021d 7b05          	ld	a,(OFST+5,sp)
1928  021f 88            	push	a
1929  0220 9f            	ld	a,xl
1930  0221 97            	ld	xl,a
1931  0222 7b02          	ld	a,(OFST+2,sp)
1932  0224 95            	ld	xh,a
1933  0225 ad35          	call	_TIM3_ETRConfig
1935  0227 84            	pop	a
1936                     ; 627   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1938  0228 c65282        	ld	a,21122
1939  022b a4f8          	and	a,#248
1940  022d c75282        	ld	21122,a
1941                     ; 628   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1943  0230 c65282        	ld	a,21122
1944  0233 aa07          	or	a,#7
1945  0235 c75282        	ld	21122,a
1946                     ; 631   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1948  0238 c65282        	ld	a,21122
1949  023b a48f          	and	a,#143
1950  023d c75282        	ld	21122,a
1951                     ; 632   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
1953  0240 c65282        	ld	a,21122
1954  0243 aa70          	or	a,#112
1955  0245 c75282        	ld	21122,a
1956                     ; 633 }
1959  0248 85            	popw	x
1960  0249 81            	ret
2018                     ; 651 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2018                     ; 652                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2018                     ; 653                               uint8_t TIM3_ExtTRGFilter)
2018                     ; 654 {
2019                     	switch	.text
2020  024a               _TIM3_ETRClockMode2Config:
2022  024a 89            	pushw	x
2023       00000000      OFST:	set	0
2026                     ; 656   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
2028  024b 7b05          	ld	a,(OFST+5,sp)
2029  024d 88            	push	a
2030  024e 9f            	ld	a,xl
2031  024f 97            	ld	xl,a
2032  0250 7b02          	ld	a,(OFST+2,sp)
2033  0252 95            	ld	xh,a
2034  0253 ad07          	call	_TIM3_ETRConfig
2036  0255 84            	pop	a
2037                     ; 659   TIM3->ETR |= TIM_ETR_ECE ;
2039  0256 721c5283      	bset	21123,#6
2040                     ; 660 }
2043  025a 85            	popw	x
2044  025b 81            	ret
2100                     ; 678 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2100                     ; 679                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2100                     ; 680                     uint8_t TIM3_ExtTRGFilter)
2100                     ; 681 {
2101                     	switch	.text
2102  025c               _TIM3_ETRConfig:
2104  025c 89            	pushw	x
2105       00000000      OFST:	set	0
2108                     ; 683   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
2110                     ; 684   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
2112                     ; 685   assert_param(IS_TIM3_EXT_FILTER(TIM3_ExtTRGFilter));
2114                     ; 687   TIM3->ETR |= (uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity | (uint8_t)TIM3_ExtTRGFilter);
2116  025d 9f            	ld	a,xl
2117  025e 1a01          	or	a,(OFST+1,sp)
2118  0260 1a05          	or	a,(OFST+5,sp)
2119  0262 ca5283        	or	a,21123
2120  0265 c75283        	ld	21123,a
2121                     ; 688 }
2124  0268 85            	popw	x
2125  0269 81            	ret
2214                     ; 705 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
2214                     ; 706                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2214                     ; 707                                  uint8_t TIM3_ICFilter)
2214                     ; 708 {
2215                     	switch	.text
2216  026a               _TIM3_TIxExternalClockConfig:
2218  026a 89            	pushw	x
2219       00000000      OFST:	set	0
2222                     ; 710   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
2224                     ; 711   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
2226                     ; 712   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
2228                     ; 715   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
2230  026b 9e            	ld	a,xh
2231  026c a160          	cp	a,#96
2232  026e 260e          	jrne	L3411
2233                     ; 717     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2235  0270 7b05          	ld	a,(OFST+5,sp)
2236  0272 88            	push	a
2237  0273 9f            	ld	a,xl
2238  0274 ae0001        	ldw	x,#1
2239  0277 95            	ld	xh,a
2240  0278 cd0621        	call	L5_TI2_Config
2242  027b 84            	pop	a
2244  027c 200d          	jra	L5411
2245  027e               L3411:
2246                     ; 721     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2248  027e 7b05          	ld	a,(OFST+5,sp)
2249  0280 88            	push	a
2250  0281 7b03          	ld	a,(OFST+3,sp)
2251  0283 ae0001        	ldw	x,#1
2252  0286 95            	ld	xh,a
2253  0287 cd05e4        	call	L3_TI1_Config
2255  028a 84            	pop	a
2256  028b               L5411:
2257                     ; 725   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
2259  028b 7b01          	ld	a,(OFST+1,sp)
2260  028d ad0a          	call	_TIM3_SelectInputTrigger
2262                     ; 728   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2264  028f c65282        	ld	a,21122
2265  0292 aa07          	or	a,#7
2266  0294 c75282        	ld	21122,a
2267                     ; 729 }
2270  0297 85            	popw	x
2271  0298 81            	ret
2371                     ; 745 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
2371                     ; 746 {
2372                     	switch	.text
2373  0299               _TIM3_SelectInputTrigger:
2375  0299 88            	push	a
2376  029a 88            	push	a
2377       00000001      OFST:	set	1
2380                     ; 747   uint8_t tmpsmcr = 0;
2382                     ; 750   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
2384                     ; 752   tmpsmcr = TIM3->SMCR;
2386  029b c65282        	ld	a,21122
2387  029e 6b01          	ld	(OFST+0,sp),a
2389                     ; 755   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2391  02a0 7b01          	ld	a,(OFST+0,sp)
2392  02a2 a48f          	and	a,#143
2393  02a4 6b01          	ld	(OFST+0,sp),a
2395                     ; 756   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
2397  02a6 7b01          	ld	a,(OFST+0,sp)
2398  02a8 1a02          	or	a,(OFST+1,sp)
2399  02aa 6b01          	ld	(OFST+0,sp),a
2401                     ; 758   TIM3->SMCR = (uint8_t)tmpsmcr;
2403  02ac 7b01          	ld	a,(OFST+0,sp)
2404  02ae c75282        	ld	21122,a
2405                     ; 759 }
2408  02b1 85            	popw	x
2409  02b2 81            	ret
2445                     ; 767 void TIM3_UpdateDisableConfig(FunctionalState NewState)
2445                     ; 768 {
2446                     	switch	.text
2447  02b3               _TIM3_UpdateDisableConfig:
2451                     ; 770   assert_param(IS_FUNCTIONAL_STATE(NewState));
2453                     ; 773   if (NewState != DISABLE)
2455  02b3 4d            	tnz	a
2456  02b4 2706          	jreq	L7221
2457                     ; 775     TIM3->CR1 |= TIM_CR1_UDIS;
2459  02b6 72125280      	bset	21120,#1
2461  02ba 2004          	jra	L1321
2462  02bc               L7221:
2463                     ; 779     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2465  02bc 72135280      	bres	21120,#1
2466  02c0               L1321:
2467                     ; 781 }
2470  02c0 81            	ret
2528                     ; 791 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
2528                     ; 792 {
2529                     	switch	.text
2530  02c1               _TIM3_UpdateRequestConfig:
2534                     ; 794   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
2536                     ; 797   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
2538  02c1 a101          	cp	a,#1
2539  02c3 2606          	jrne	L1621
2540                     ; 799     TIM3->CR1 |= TIM_CR1_URS ;
2542  02c5 72145280      	bset	21120,#2
2544  02c9 2004          	jra	L3621
2545  02cb               L1621:
2546                     ; 803     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
2548  02cb 72155280      	bres	21120,#2
2549  02cf               L3621:
2550                     ; 805 }
2553  02cf 81            	ret
2589                     ; 813 void TIM3_SelectHallSensor(FunctionalState NewState)
2589                     ; 814 {
2590                     	switch	.text
2591  02d0               _TIM3_SelectHallSensor:
2595                     ; 816   assert_param(IS_FUNCTIONAL_STATE(NewState));
2597                     ; 819   if (NewState != DISABLE)
2599  02d0 4d            	tnz	a
2600  02d1 2706          	jreq	L3031
2601                     ; 821     TIM3->CR2 |= TIM_CR2_TI1S;
2603  02d3 721e5281      	bset	21121,#7
2605  02d7 2004          	jra	L5031
2606  02d9               L3031:
2607                     ; 825     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2609  02d9 721f5281      	bres	21121,#7
2610  02dd               L5031:
2611                     ; 827 }
2614  02dd 81            	ret
2671                     ; 837 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
2671                     ; 838 {
2672                     	switch	.text
2673  02de               _TIM3_SelectOnePulseMode:
2677                     ; 840   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
2679                     ; 843   if (TIM3_OPMode == TIM3_OPMode_Single)
2681  02de a101          	cp	a,#1
2682  02e0 2606          	jrne	L5331
2683                     ; 845     TIM3->CR1 |= TIM_CR1_OPM ;
2685  02e2 72165280      	bset	21120,#3
2687  02e6 2004          	jra	L7331
2688  02e8               L5331:
2689                     ; 849     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2691  02e8 72175280      	bres	21120,#3
2692  02ec               L7331:
2693                     ; 851 }
2696  02ec 81            	ret
2795                     ; 865 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
2795                     ; 866 {
2796                     	switch	.text
2797  02ed               _TIM3_SelectOutputTrigger:
2799  02ed 88            	push	a
2800  02ee 88            	push	a
2801       00000001      OFST:	set	1
2804                     ; 867   uint8_t tmpcr2 = 0;
2806                     ; 870   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
2808                     ; 872   tmpcr2 = TIM3->CR2;
2810  02ef c65281        	ld	a,21121
2811  02f2 6b01          	ld	(OFST+0,sp),a
2813                     ; 875   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2815  02f4 7b01          	ld	a,(OFST+0,sp)
2816  02f6 a48f          	and	a,#143
2817  02f8 6b01          	ld	(OFST+0,sp),a
2819                     ; 878   tmpcr2 |= (uint8_t)TIM3_TRGOSource;
2821  02fa 7b01          	ld	a,(OFST+0,sp)
2822  02fc 1a02          	or	a,(OFST+1,sp)
2823  02fe 6b01          	ld	(OFST+0,sp),a
2825                     ; 880   TIM3->CR2 = tmpcr2;
2827  0300 7b01          	ld	a,(OFST+0,sp)
2828  0302 c75281        	ld	21121,a
2829                     ; 881 }
2832  0305 85            	popw	x
2833  0306 81            	ret
2916                     ; 893 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
2916                     ; 894 {
2917                     	switch	.text
2918  0307               _TIM3_SelectSlaveMode:
2920  0307 88            	push	a
2921  0308 88            	push	a
2922       00000001      OFST:	set	1
2925                     ; 895   uint8_t tmpsmcr = 0;
2927                     ; 898   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
2929                     ; 900   tmpsmcr = TIM3->SMCR;
2931  0309 c65282        	ld	a,21122
2932  030c 6b01          	ld	(OFST+0,sp),a
2934                     ; 903   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2936  030e 7b01          	ld	a,(OFST+0,sp)
2937  0310 a4f8          	and	a,#248
2938  0312 6b01          	ld	(OFST+0,sp),a
2940                     ; 906   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
2942  0314 7b01          	ld	a,(OFST+0,sp)
2943  0316 1a02          	or	a,(OFST+1,sp)
2944  0318 6b01          	ld	(OFST+0,sp),a
2946                     ; 908   TIM3->SMCR = tmpsmcr;
2948  031a 7b01          	ld	a,(OFST+0,sp)
2949  031c c75282        	ld	21122,a
2950                     ; 909 }
2953  031f 85            	popw	x
2954  0320 81            	ret
2990                     ; 917 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
2990                     ; 918 {
2991                     	switch	.text
2992  0321               _TIM3_SelectMasterSlaveMode:
2996                     ; 920   assert_param(IS_FUNCTIONAL_STATE(NewState));
2998                     ; 923   if (NewState != DISABLE)
3000  0321 4d            	tnz	a
3001  0322 2706          	jreq	L7541
3002                     ; 925     TIM3->SMCR |= TIM_SMCR_MSM;
3004  0324 721e5282      	bset	21122,#7
3006  0328 2004          	jra	L1641
3007  032a               L7541:
3008                     ; 929     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
3010  032a 721f5282      	bres	21122,#7
3011  032e               L1641:
3012                     ; 931 }
3015  032e 81            	ret
3128                     ; 950 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
3128                     ; 951                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
3128                     ; 952                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
3128                     ; 953 {
3129                     	switch	.text
3130  032f               _TIM3_EncoderInterfaceConfig:
3132  032f 89            	pushw	x
3133  0330 5203          	subw	sp,#3
3134       00000003      OFST:	set	3
3137                     ; 954   uint8_t tmpsmcr = 0;
3139                     ; 955   uint8_t tmpccmr1 = 0;
3141                     ; 956   uint8_t tmpccmr2 = 0;
3143                     ; 959   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
3145                     ; 960   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
3147                     ; 961   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
3149                     ; 963   tmpsmcr = TIM3->SMCR;
3151  0332 c65282        	ld	a,21122
3152  0335 6b01          	ld	(OFST-2,sp),a
3154                     ; 964   tmpccmr1 = TIM3->CCMR1;
3156  0337 c65288        	ld	a,21128
3157  033a 6b02          	ld	(OFST-1,sp),a
3159                     ; 965   tmpccmr2 = TIM3->CCMR2;
3161  033c c65289        	ld	a,21129
3162  033f 6b03          	ld	(OFST+0,sp),a
3164                     ; 968   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3166  0341 7b01          	ld	a,(OFST-2,sp)
3167  0343 a4f0          	and	a,#240
3168  0345 6b01          	ld	(OFST-2,sp),a
3170                     ; 969   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
3172  0347 9e            	ld	a,xh
3173  0348 1a01          	or	a,(OFST-2,sp)
3174  034a 6b01          	ld	(OFST-2,sp),a
3176                     ; 972   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3178  034c 7b02          	ld	a,(OFST-1,sp)
3179  034e a4fc          	and	a,#252
3180  0350 6b02          	ld	(OFST-1,sp),a
3182                     ; 973   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3184  0352 7b03          	ld	a,(OFST+0,sp)
3185  0354 a4fc          	and	a,#252
3186  0356 6b03          	ld	(OFST+0,sp),a
3188                     ; 974   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3190  0358 7b02          	ld	a,(OFST-1,sp)
3191  035a aa01          	or	a,#1
3192  035c 6b02          	ld	(OFST-1,sp),a
3194                     ; 975   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3196  035e 7b03          	ld	a,(OFST+0,sp)
3197  0360 aa01          	or	a,#1
3198  0362 6b03          	ld	(OFST+0,sp),a
3200                     ; 978   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
3202  0364 9f            	ld	a,xl
3203  0365 a101          	cp	a,#1
3204  0367 2606          	jrne	L7351
3205                     ; 980     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3207  0369 7212528a      	bset	21130,#1
3209  036d 2004          	jra	L1451
3210  036f               L7351:
3211                     ; 984     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3213  036f 7213528a      	bres	21130,#1
3214  0373               L1451:
3215                     ; 987   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
3217  0373 7b08          	ld	a,(OFST+5,sp)
3218  0375 a101          	cp	a,#1
3219  0377 2606          	jrne	L3451
3220                     ; 989     TIM3->CCER1 |= TIM_CCER1_CC2P ;
3222  0379 721a528a      	bset	21130,#5
3224  037d 2004          	jra	L5451
3225  037f               L3451:
3226                     ; 993     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3228  037f 721b528a      	bres	21130,#5
3229  0383               L5451:
3230                     ; 996   TIM3->SMCR = tmpsmcr;
3232  0383 7b01          	ld	a,(OFST-2,sp)
3233  0385 c75282        	ld	21122,a
3234                     ; 997   TIM3->CCMR1 = tmpccmr1;
3236  0388 7b02          	ld	a,(OFST-1,sp)
3237  038a c75288        	ld	21128,a
3238                     ; 998   TIM3->CCMR2 = tmpccmr2;
3240  038d 7b03          	ld	a,(OFST+0,sp)
3241  038f c75289        	ld	21129,a
3242                     ; 999 }
3245  0392 5b05          	addw	sp,#5
3246  0394 81            	ret
3314                     ; 1019 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef TIM3_Prescaler,
3314                     ; 1020                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
3314                     ; 1021 {
3315                     	switch	.text
3316  0395               _TIM3_PrescalerConfig:
3320                     ; 1023   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
3322                     ; 1024   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
3324                     ; 1027   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
3326  0395 9e            	ld	a,xh
3327  0396 c7528d        	ld	21133,a
3328                     ; 1031   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
3330  0399 9f            	ld	a,xl
3331  039a a101          	cp	a,#1
3332  039c 2606          	jrne	L1061
3333                     ; 1033     TIM3->EGR |= TIM_EGR_UG ;
3335  039e 72105287      	bset	21127,#0
3337  03a2 2004          	jra	L3061
3338  03a4               L1061:
3339                     ; 1037     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3341  03a4 72115287      	bres	21127,#0
3342  03a8               L3061:
3343                     ; 1039 }
3346  03a8 81            	ret
3391                     ; 1052 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
3391                     ; 1053 {
3392                     	switch	.text
3393  03a9               _TIM3_CounterModeConfig:
3395  03a9 88            	push	a
3396  03aa 88            	push	a
3397       00000001      OFST:	set	1
3400                     ; 1054   uint8_t tmpcr1 = 0;
3402                     ; 1057   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
3404                     ; 1059   tmpcr1 = TIM3->CR1;
3406  03ab c65280        	ld	a,21120
3407  03ae 6b01          	ld	(OFST+0,sp),a
3409                     ; 1062   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3411  03b0 7b01          	ld	a,(OFST+0,sp)
3412  03b2 a48f          	and	a,#143
3413  03b4 6b01          	ld	(OFST+0,sp),a
3415                     ; 1065   tmpcr1 |= (uint8_t)TIM3_CounterMode;
3417  03b6 7b01          	ld	a,(OFST+0,sp)
3418  03b8 1a02          	or	a,(OFST+1,sp)
3419  03ba 6b01          	ld	(OFST+0,sp),a
3421                     ; 1067   TIM3->CR1 = tmpcr1;
3423  03bc 7b01          	ld	a,(OFST+0,sp)
3424  03be c75280        	ld	21120,a
3425                     ; 1068 }
3428  03c1 85            	popw	x
3429  03c2 81            	ret
3496                     ; 1078 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3496                     ; 1079 {
3497                     	switch	.text
3498  03c3               _TIM3_ForcedOC1Config:
3500  03c3 88            	push	a
3501  03c4 88            	push	a
3502       00000001      OFST:	set	1
3505                     ; 1080   uint8_t tmpccmr1 = 0;
3507                     ; 1083   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3509                     ; 1085   tmpccmr1 = TIM3->CCMR1;
3511  03c5 c65288        	ld	a,21128
3512  03c8 6b01          	ld	(OFST+0,sp),a
3514                     ; 1088   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3516  03ca 7b01          	ld	a,(OFST+0,sp)
3517  03cc a48f          	and	a,#143
3518  03ce 6b01          	ld	(OFST+0,sp),a
3520                     ; 1091   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
3522  03d0 7b01          	ld	a,(OFST+0,sp)
3523  03d2 1a02          	or	a,(OFST+1,sp)
3524  03d4 6b01          	ld	(OFST+0,sp),a
3526                     ; 1093   TIM3->CCMR1 = tmpccmr1;
3528  03d6 7b01          	ld	a,(OFST+0,sp)
3529  03d8 c75288        	ld	21128,a
3530                     ; 1094 }
3533  03db 85            	popw	x
3534  03dc 81            	ret
3579                     ; 1104 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3579                     ; 1105 {
3580                     	switch	.text
3581  03dd               _TIM3_ForcedOC2Config:
3583  03dd 88            	push	a
3584  03de 88            	push	a
3585       00000001      OFST:	set	1
3588                     ; 1106   uint8_t tmpccmr2 = 0;
3590                     ; 1109   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3592                     ; 1111   tmpccmr2 = TIM3->CCMR2;
3594  03df c65289        	ld	a,21129
3595  03e2 6b01          	ld	(OFST+0,sp),a
3597                     ; 1114   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3599  03e4 7b01          	ld	a,(OFST+0,sp)
3600  03e6 a48f          	and	a,#143
3601  03e8 6b01          	ld	(OFST+0,sp),a
3603                     ; 1117   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
3605  03ea 7b01          	ld	a,(OFST+0,sp)
3606  03ec 1a02          	or	a,(OFST+1,sp)
3607  03ee 6b01          	ld	(OFST+0,sp),a
3609                     ; 1119   TIM3->CCMR2 = tmpccmr2;
3611  03f0 7b01          	ld	a,(OFST+0,sp)
3612  03f2 c75289        	ld	21129,a
3613                     ; 1120 }
3616  03f5 85            	popw	x
3617  03f6 81            	ret
3653                     ; 1128 void TIM3_ARRPreloadConfig(FunctionalState NewState)
3653                     ; 1129 {
3654                     	switch	.text
3655  03f7               _TIM3_ARRPreloadConfig:
3659                     ; 1131   assert_param(IS_FUNCTIONAL_STATE(NewState));
3661                     ; 1134   if (NewState != DISABLE)
3663  03f7 4d            	tnz	a
3664  03f8 2706          	jreq	L1271
3665                     ; 1136     TIM3->CR1 |= TIM_CR1_ARPE;
3667  03fa 721e5280      	bset	21120,#7
3669  03fe 2004          	jra	L3271
3670  0400               L1271:
3671                     ; 1140     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3673  0400 721f5280      	bres	21120,#7
3674  0404               L3271:
3675                     ; 1142 }
3678  0404 81            	ret
3714                     ; 1150 void TIM3_OC1PreloadConfig(FunctionalState NewState)
3714                     ; 1151 {
3715                     	switch	.text
3716  0405               _TIM3_OC1PreloadConfig:
3720                     ; 1153   assert_param(IS_FUNCTIONAL_STATE(NewState));
3722                     ; 1156   if (NewState != DISABLE)
3724  0405 4d            	tnz	a
3725  0406 2706          	jreq	L3471
3726                     ; 1158     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
3728  0408 72165288      	bset	21128,#3
3730  040c 2004          	jra	L5471
3731  040e               L3471:
3732                     ; 1162     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3734  040e 72175288      	bres	21128,#3
3735  0412               L5471:
3736                     ; 1164 }
3739  0412 81            	ret
3775                     ; 1172 void TIM3_OC2PreloadConfig(FunctionalState NewState)
3775                     ; 1173 {
3776                     	switch	.text
3777  0413               _TIM3_OC2PreloadConfig:
3781                     ; 1175   assert_param(IS_FUNCTIONAL_STATE(NewState));
3783                     ; 1178   if (NewState != DISABLE)
3785  0413 4d            	tnz	a
3786  0414 2706          	jreq	L5671
3787                     ; 1180     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
3789  0416 72165289      	bset	21129,#3
3791  041a 2004          	jra	L7671
3792  041c               L5671:
3793                     ; 1184     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3795  041c 72175289      	bres	21129,#3
3796  0420               L7671:
3797                     ; 1186 }
3800  0420 81            	ret
3835                     ; 1194 void TIM3_OC1FastCmd(FunctionalState NewState)
3835                     ; 1195 {
3836                     	switch	.text
3837  0421               _TIM3_OC1FastCmd:
3841                     ; 1197   assert_param(IS_FUNCTIONAL_STATE(NewState));
3843                     ; 1200   if (NewState != DISABLE)
3845  0421 4d            	tnz	a
3846  0422 2706          	jreq	L7002
3847                     ; 1202     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
3849  0424 72145288      	bset	21128,#2
3851  0428 2004          	jra	L1102
3852  042a               L7002:
3853                     ; 1206     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3855  042a 72155288      	bres	21128,#2
3856  042e               L1102:
3857                     ; 1208 }
3860  042e 81            	ret
3895                     ; 1216 void TIM3_OC2FastCmd(FunctionalState NewState)
3895                     ; 1217 {
3896                     	switch	.text
3897  042f               _TIM3_OC2FastCmd:
3901                     ; 1219   assert_param(IS_FUNCTIONAL_STATE(NewState));
3903                     ; 1222   if (NewState != DISABLE)
3905  042f 4d            	tnz	a
3906  0430 2706          	jreq	L1302
3907                     ; 1224     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
3909  0432 72145289      	bset	21129,#2
3911  0436 2004          	jra	L3302
3912  0438               L1302:
3913                     ; 1228     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3915  0438 72155289      	bres	21129,#2
3916  043c               L3302:
3917                     ; 1230 }
3920  043c 81            	ret
4001                     ; 1243 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
4001                     ; 1244 {
4002                     	switch	.text
4003  043d               _TIM3_GenerateEvent:
4007                     ; 1246   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
4009                     ; 1249   TIM3->EGR |= (uint8_t)TIM3_EventSource;
4011  043d ca5287        	or	a,21127
4012  0440 c75287        	ld	21127,a
4013                     ; 1250 }
4016  0443 81            	ret
4052                     ; 1260 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4052                     ; 1261 {
4053                     	switch	.text
4054  0444               _TIM3_OC1PolarityConfig:
4058                     ; 1263   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4060                     ; 1266   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4062  0444 a101          	cp	a,#1
4063  0446 2606          	jrne	L7012
4064                     ; 1268     TIM3->CCER1 |= TIM_CCER1_CC1P ;
4066  0448 7212528a      	bset	21130,#1
4068  044c 2004          	jra	L1112
4069  044e               L7012:
4070                     ; 1272     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4072  044e 7213528a      	bres	21130,#1
4073  0452               L1112:
4074                     ; 1274 }
4077  0452 81            	ret
4113                     ; 1284 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4113                     ; 1285 {
4114                     	switch	.text
4115  0453               _TIM3_OC2PolarityConfig:
4119                     ; 1287   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4121                     ; 1290   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4123  0453 a101          	cp	a,#1
4124  0455 2606          	jrne	L1312
4125                     ; 1292     TIM3->CCER1 |= TIM_CCER1_CC2P ;
4127  0457 721a528a      	bset	21130,#5
4129  045b 2004          	jra	L3312
4130  045d               L1312:
4131                     ; 1296     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4133  045d 721b528a      	bres	21130,#5
4134  0461               L3312:
4135                     ; 1298 }
4138  0461 81            	ret
4183                     ; 1310 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
4183                     ; 1311                  FunctionalState NewState)
4183                     ; 1312 {
4184                     	switch	.text
4185  0462               _TIM3_CCxCmd:
4187  0462 89            	pushw	x
4188       00000000      OFST:	set	0
4191                     ; 1314   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4193                     ; 1315   assert_param(IS_FUNCTIONAL_STATE(NewState));
4195                     ; 1317   if (TIM3_Channel == TIM3_Channel_1)
4197  0463 9e            	ld	a,xh
4198  0464 4d            	tnz	a
4199  0465 2610          	jrne	L7512
4200                     ; 1320     if (NewState != DISABLE)
4202  0467 9f            	ld	a,xl
4203  0468 4d            	tnz	a
4204  0469 2706          	jreq	L1612
4205                     ; 1322       TIM3->CCER1 |= TIM_CCER1_CC1E ;
4207  046b 7210528a      	bset	21130,#0
4209  046f 2014          	jra	L5612
4210  0471               L1612:
4211                     ; 1326       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4213  0471 7211528a      	bres	21130,#0
4214  0475 200e          	jra	L5612
4215  0477               L7512:
4216                     ; 1333     if (NewState != DISABLE)
4218  0477 0d02          	tnz	(OFST+2,sp)
4219  0479 2706          	jreq	L7612
4220                     ; 1335       TIM3->CCER1 |= TIM_CCER1_CC2E;
4222  047b 7218528a      	bset	21130,#4
4224  047f 2004          	jra	L5612
4225  0481               L7612:
4226                     ; 1339       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4228  0481 7219528a      	bres	21130,#4
4229  0485               L5612:
4230                     ; 1343 }
4233  0485 85            	popw	x
4234  0486 81            	ret
4279                     ; 1362 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
4279                     ; 1363                      TIM3_OCMode_TypeDef TIM3_OCMode)
4279                     ; 1364 {
4280                     	switch	.text
4281  0487               _TIM3_SelectOCxM:
4283  0487 89            	pushw	x
4284       00000000      OFST:	set	0
4287                     ; 1366   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4289                     ; 1367   assert_param(IS_TIM3_OCM(TIM3_OCMode));
4291                     ; 1369   if (TIM3_Channel == TIM3_Channel_1)
4293  0488 9e            	ld	a,xh
4294  0489 4d            	tnz	a
4295  048a 2615          	jrne	L5122
4296                     ; 1372     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4298  048c 7211528a      	bres	21130,#0
4299                     ; 1375     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4301  0490 c65288        	ld	a,21128
4302  0493 a48f          	and	a,#143
4303  0495 c75288        	ld	21128,a
4304                     ; 1378     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
4306  0498 9f            	ld	a,xl
4307  0499 ca5288        	or	a,21128
4308  049c c75288        	ld	21128,a
4310  049f 2014          	jra	L7122
4311  04a1               L5122:
4312                     ; 1383     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4314  04a1 7219528a      	bres	21130,#4
4315                     ; 1386     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4317  04a5 c65289        	ld	a,21129
4318  04a8 a48f          	and	a,#143
4319  04aa c75289        	ld	21129,a
4320                     ; 1389     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
4322  04ad c65289        	ld	a,21129
4323  04b0 1a02          	or	a,(OFST+2,sp)
4324  04b2 c75289        	ld	21129,a
4325  04b5               L7122:
4326                     ; 1391 }
4329  04b5 85            	popw	x
4330  04b6 81            	ret
4364                     ; 1399 void TIM3_SetCounter(uint16_t TIM3_Counter)
4364                     ; 1400 {
4365                     	switch	.text
4366  04b7               _TIM3_SetCounter:
4370                     ; 1403   TIM3->CNTRH = (uint8_t)(TIM3_Counter >> 8);
4372  04b7 9e            	ld	a,xh
4373  04b8 c7528b        	ld	21131,a
4374                     ; 1404   TIM3->CNTRL = (uint8_t)(TIM3_Counter);
4376  04bb 9f            	ld	a,xl
4377  04bc c7528c        	ld	21132,a
4378                     ; 1405 }
4381  04bf 81            	ret
4415                     ; 1413 void TIM3_SetAutoreload(uint16_t TIM3_Autoreload)
4415                     ; 1414 {
4416                     	switch	.text
4417  04c0               _TIM3_SetAutoreload:
4421                     ; 1416   TIM3->ARRH = (uint8_t)(TIM3_Autoreload >> 8);
4423  04c0 9e            	ld	a,xh
4424  04c1 c7528e        	ld	21134,a
4425                     ; 1417   TIM3->ARRL = (uint8_t)(TIM3_Autoreload);
4427  04c4 9f            	ld	a,xl
4428  04c5 c7528f        	ld	21135,a
4429                     ; 1418 }
4432  04c8 81            	ret
4466                     ; 1426 void TIM3_SetCompare1(uint16_t TIM3_Compare)
4466                     ; 1427 {
4467                     	switch	.text
4468  04c9               _TIM3_SetCompare1:
4472                     ; 1429   TIM3->CCR1H = (uint8_t)(TIM3_Compare >> 8);
4474  04c9 9e            	ld	a,xh
4475  04ca c75290        	ld	21136,a
4476                     ; 1430   TIM3->CCR1L = (uint8_t)(TIM3_Compare);
4478  04cd 9f            	ld	a,xl
4479  04ce c75291        	ld	21137,a
4480                     ; 1431 }
4483  04d1 81            	ret
4517                     ; 1439 void TIM3_SetCompare2(uint16_t TIM3_Compare)
4517                     ; 1440 {
4518                     	switch	.text
4519  04d2               _TIM3_SetCompare2:
4523                     ; 1442   TIM3->CCR2H = (uint8_t)(TIM3_Compare >> 8);
4525  04d2 9e            	ld	a,xh
4526  04d3 c75292        	ld	21138,a
4527                     ; 1443   TIM3->CCR2L = (uint8_t)(TIM3_Compare);
4529  04d6 9f            	ld	a,xl
4530  04d7 c75293        	ld	21139,a
4531                     ; 1444 }
4534  04da 81            	ret
4579                     ; 1456 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
4579                     ; 1457 {
4580                     	switch	.text
4581  04db               _TIM3_SetIC1Prescaler:
4583  04db 88            	push	a
4584  04dc 88            	push	a
4585       00000001      OFST:	set	1
4588                     ; 1458   uint8_t tmpccmr1 = 0;
4590                     ; 1461   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
4592                     ; 1463   tmpccmr1 = TIM3->CCMR1;
4594  04dd c65288        	ld	a,21128
4595  04e0 6b01          	ld	(OFST+0,sp),a
4597                     ; 1466   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4599  04e2 7b01          	ld	a,(OFST+0,sp)
4600  04e4 a4f3          	and	a,#243
4601  04e6 6b01          	ld	(OFST+0,sp),a
4603                     ; 1469   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
4605  04e8 7b01          	ld	a,(OFST+0,sp)
4606  04ea 1a02          	or	a,(OFST+1,sp)
4607  04ec 6b01          	ld	(OFST+0,sp),a
4609                     ; 1471   TIM3->CCMR1 = tmpccmr1;
4611  04ee 7b01          	ld	a,(OFST+0,sp)
4612  04f0 c75288        	ld	21128,a
4613                     ; 1472 }
4616  04f3 85            	popw	x
4617  04f4 81            	ret
4662                     ; 1484 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
4662                     ; 1485 {
4663                     	switch	.text
4664  04f5               _TIM3_SetIC2Prescaler:
4666  04f5 88            	push	a
4667  04f6 88            	push	a
4668       00000001      OFST:	set	1
4671                     ; 1486   uint8_t tmpccmr2 = 0;
4673                     ; 1489   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
4675                     ; 1491   tmpccmr2 = TIM3->CCMR2;
4677  04f7 c65289        	ld	a,21129
4678  04fa 6b01          	ld	(OFST+0,sp),a
4680                     ; 1494   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4682  04fc 7b01          	ld	a,(OFST+0,sp)
4683  04fe a4f3          	and	a,#243
4684  0500 6b01          	ld	(OFST+0,sp),a
4686                     ; 1497   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
4688  0502 7b01          	ld	a,(OFST+0,sp)
4689  0504 1a02          	or	a,(OFST+1,sp)
4690  0506 6b01          	ld	(OFST+0,sp),a
4692                     ; 1499   TIM3->CCMR2 = tmpccmr2;
4694  0508 7b01          	ld	a,(OFST+0,sp)
4695  050a c75289        	ld	21129,a
4696                     ; 1500 }
4699  050d 85            	popw	x
4700  050e 81            	ret
4752                     ; 1507 uint16_t TIM3_GetCapture1(void)
4752                     ; 1508 {
4753                     	switch	.text
4754  050f               _TIM3_GetCapture1:
4756  050f 5204          	subw	sp,#4
4757       00000004      OFST:	set	4
4760                     ; 1509   uint16_t tmpccr1 = 0;
4762                     ; 1512   tmpccr1h = TIM3->CCR1H;
4764  0511 c65290        	ld	a,21136
4765  0514 6b02          	ld	(OFST-2,sp),a
4767                     ; 1513   tmpccr1l = TIM3->CCR1L;
4769  0516 c65291        	ld	a,21137
4770  0519 6b01          	ld	(OFST-3,sp),a
4772                     ; 1515   tmpccr1 = (uint16_t)(tmpccr1l);
4774  051b 7b01          	ld	a,(OFST-3,sp)
4775  051d 5f            	clrw	x
4776  051e 97            	ld	xl,a
4777  051f 1f03          	ldw	(OFST-1,sp),x
4779                     ; 1516   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
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
4793                     ; 1518   return ((uint16_t)tmpccr1);
4795  0530 1e03          	ldw	x,(OFST-1,sp)
4798  0532 5b04          	addw	sp,#4
4799  0534 81            	ret
4851                     ; 1526 uint16_t TIM3_GetCapture2(void)
4851                     ; 1527 {
4852                     	switch	.text
4853  0535               _TIM3_GetCapture2:
4855  0535 5204          	subw	sp,#4
4856       00000004      OFST:	set	4
4859                     ; 1528   uint16_t tmpccr2 = 0;
4861                     ; 1531   tmpccr2h = TIM3->CCR2H;
4863  0537 c65292        	ld	a,21138
4864  053a 6b02          	ld	(OFST-2,sp),a
4866                     ; 1532   tmpccr2l = TIM3->CCR2L;
4868  053c c65293        	ld	a,21139
4869  053f 6b01          	ld	(OFST-3,sp),a
4871                     ; 1534   tmpccr2 = (uint16_t)(tmpccr2l);
4873  0541 7b01          	ld	a,(OFST-3,sp)
4874  0543 5f            	clrw	x
4875  0544 97            	ld	xl,a
4876  0545 1f03          	ldw	(OFST-1,sp),x
4878                     ; 1535   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
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
4892                     ; 1537   return ((uint16_t)tmpccr2);
4894  0556 1e03          	ldw	x,(OFST-1,sp)
4897  0558 5b04          	addw	sp,#4
4898  055a 81            	ret
4950                     ; 1545 uint16_t TIM3_GetCounter(void)
4950                     ; 1546 {
4951                     	switch	.text
4952  055b               _TIM3_GetCounter:
4954  055b 5204          	subw	sp,#4
4955       00000004      OFST:	set	4
4958                     ; 1547   uint16_t tmpcnt = 0;
4960                     ; 1550   tmpcntrh = TIM3->CNTRH;
4962  055d c6528b        	ld	a,21131
4963  0560 6b02          	ld	(OFST-2,sp),a
4965                     ; 1551   tmpcntrl = TIM3->CNTRL;
4967  0562 c6528c        	ld	a,21132
4968  0565 6b01          	ld	(OFST-3,sp),a
4970                     ; 1553   tmpcnt = (uint16_t)(tmpcntrl);
4972  0567 7b01          	ld	a,(OFST-3,sp)
4973  0569 5f            	clrw	x
4974  056a 97            	ld	xl,a
4975  056b 1f03          	ldw	(OFST-1,sp),x
4977                     ; 1554   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
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
4991                     ; 1556   return ((uint16_t)tmpcnt);
4993  057c 1e03          	ldw	x,(OFST-1,sp)
4996  057e 5b04          	addw	sp,#4
4997  0580 81            	ret
5021                     ; 1572 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
5021                     ; 1573 {
5022                     	switch	.text
5023  0581               _TIM3_GetPrescaler:
5027                     ; 1575   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
5029  0581 c6528d        	ld	a,21133
5032  0584 81            	ret
5171                     ; 1591 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
5171                     ; 1592 {
5172                     	switch	.text
5173  0585               _TIM3_GetFlagStatus:
5175  0585 89            	pushw	x
5176  0586 89            	pushw	x
5177       00000002      OFST:	set	2
5180                     ; 1593   FlagStatus bitstatus = RESET;
5182                     ; 1597   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
5184                     ; 1599   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
5186  0587 9f            	ld	a,xl
5187  0588 c45285        	and	a,21125
5188  058b 6b01          	ld	(OFST-1,sp),a
5190                     ; 1600   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
5192  058d c65286        	ld	a,21126
5193  0590 1403          	and	a,(OFST+1,sp)
5194  0592 6b02          	ld	(OFST+0,sp),a
5196                     ; 1602   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
5198  0594 7b01          	ld	a,(OFST-1,sp)
5199  0596 1a02          	or	a,(OFST+0,sp)
5200  0598 2706          	jreq	L3552
5201                     ; 1604     bitstatus = SET;
5203  059a a601          	ld	a,#1
5204  059c 6b02          	ld	(OFST+0,sp),a
5207  059e 2002          	jra	L5552
5208  05a0               L3552:
5209                     ; 1608     bitstatus = RESET;
5211  05a0 0f02          	clr	(OFST+0,sp)
5213  05a2               L5552:
5214                     ; 1610   return ((FlagStatus)bitstatus);
5216  05a2 7b02          	ld	a,(OFST+0,sp)
5219  05a4 5b04          	addw	sp,#4
5220  05a6 81            	ret
5255                     ; 1624 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
5255                     ; 1625 {
5256                     	switch	.text
5257  05a7               _TIM3_ClearFlag:
5259  05a7 89            	pushw	x
5260       00000000      OFST:	set	0
5263                     ; 1627   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
5265                     ; 1629   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
5267  05a8 9f            	ld	a,xl
5268  05a9 43            	cpl	a
5269  05aa c75285        	ld	21125,a
5270                     ; 1630   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
5272  05ad 7b01          	ld	a,(OFST+1,sp)
5273  05af 43            	cpl	a
5274  05b0 c75286        	ld	21126,a
5275                     ; 1631 }
5278  05b3 85            	popw	x
5279  05b4 81            	ret
5343                     ; 1644 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
5343                     ; 1645 {
5344                     	switch	.text
5345  05b5               _TIM3_GetITStatus:
5347  05b5 88            	push	a
5348  05b6 5203          	subw	sp,#3
5349       00000003      OFST:	set	3
5352                     ; 1646   __IO ITStatus bitstatus = RESET;
5354  05b8 0f03          	clr	(OFST+0,sp)
5356                     ; 1648   __IO uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
5358  05ba 0f01          	clr	(OFST-2,sp)
5362  05bc 0f02          	clr	(OFST-1,sp)
5364                     ; 1651   assert_param(IS_TIM3_GET_IT(TIM3_IT));
5366                     ; 1653   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
5368  05be c45285        	and	a,21125
5369  05c1 6b01          	ld	(OFST-2,sp),a
5371                     ; 1655   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
5373  05c3 c65284        	ld	a,21124
5374  05c6 1404          	and	a,(OFST+1,sp)
5375  05c8 6b02          	ld	(OFST-1,sp),a
5377                     ; 1657   if ((TIM3_itStatus != (uint8_t)RESET) && (TIM3_itEnable != (uint8_t)RESET))
5379  05ca 0d01          	tnz	(OFST-2,sp)
5380  05cc 270a          	jreq	L7262
5382  05ce 0d02          	tnz	(OFST-1,sp)
5383  05d0 2706          	jreq	L7262
5384                     ; 1659     bitstatus = (ITStatus)SET;
5386  05d2 a601          	ld	a,#1
5387  05d4 6b03          	ld	(OFST+0,sp),a
5390  05d6 2002          	jra	L1362
5391  05d8               L7262:
5392                     ; 1663     bitstatus = (ITStatus)RESET;
5394  05d8 0f03          	clr	(OFST+0,sp)
5396  05da               L1362:
5397                     ; 1665   return ((ITStatus)bitstatus);
5399  05da 7b03          	ld	a,(OFST+0,sp)
5402  05dc 5b04          	addw	sp,#4
5403  05de 81            	ret
5439                     ; 1679 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
5439                     ; 1680 {
5440                     	switch	.text
5441  05df               _TIM3_ClearITPendingBit:
5445                     ; 1682   assert_param(IS_TIM3_IT(TIM3_IT));
5447                     ; 1685   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
5449  05df 43            	cpl	a
5450  05e0 c75285        	ld	21125,a
5451                     ; 1686 }
5454  05e3 81            	ret
5526                     ; 1703 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5526                     ; 1704                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5526                     ; 1705                        uint8_t TIM3_ICFilter)
5526                     ; 1706 {
5527                     	switch	.text
5528  05e4               L3_TI1_Config:
5530  05e4 89            	pushw	x
5531  05e5 89            	pushw	x
5532       00000002      OFST:	set	2
5535                     ; 1707   uint8_t tmpccmr1 = 0;
5537                     ; 1708   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5539  05e6 9e            	ld	a,xh
5540  05e7 6b01          	ld	(OFST-1,sp),a
5542                     ; 1709   tmpccmr1 = TIM3->CCMR1;
5544  05e9 c65288        	ld	a,21128
5545  05ec 6b02          	ld	(OFST+0,sp),a
5547                     ; 1712   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5549                     ; 1713   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5551                     ; 1714   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5553                     ; 1717   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5555  05ee 7211528a      	bres	21130,#0
5556                     ; 1720   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5558  05f2 7b02          	ld	a,(OFST+0,sp)
5559  05f4 a40c          	and	a,#12
5560  05f6 6b02          	ld	(OFST+0,sp),a
5562                     ; 1721   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5564  05f8 7b07          	ld	a,(OFST+5,sp)
5565  05fa 97            	ld	xl,a
5566  05fb a610          	ld	a,#16
5567  05fd 42            	mul	x,a
5568  05fe 9f            	ld	a,xl
5569  05ff 1a04          	or	a,(OFST+2,sp)
5570  0601 1a02          	or	a,(OFST+0,sp)
5571  0603 6b02          	ld	(OFST+0,sp),a
5573                     ; 1723   TIM3->CCMR1 = tmpccmr1;
5575  0605 7b02          	ld	a,(OFST+0,sp)
5576  0607 c75288        	ld	21128,a
5577                     ; 1726   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5579  060a 7b01          	ld	a,(OFST-1,sp)
5580  060c a101          	cp	a,#1
5581  060e 2606          	jrne	L7072
5582                     ; 1728     TIM3->CCER1 |= TIM_CCER1_CC1P;
5584  0610 7212528a      	bset	21130,#1
5586  0614 2004          	jra	L1172
5587  0616               L7072:
5588                     ; 1732     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5590  0616 7213528a      	bres	21130,#1
5591  061a               L1172:
5592                     ; 1736   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5594  061a 7210528a      	bset	21130,#0
5595                     ; 1737 }
5598  061e 5b04          	addw	sp,#4
5599  0620 81            	ret
5671                     ; 1754 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5671                     ; 1755                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5671                     ; 1756                        uint8_t TIM3_ICFilter)
5671                     ; 1757 {
5672                     	switch	.text
5673  0621               L5_TI2_Config:
5675  0621 89            	pushw	x
5676  0622 89            	pushw	x
5677       00000002      OFST:	set	2
5680                     ; 1758   uint8_t tmpccmr2 = 0;
5682                     ; 1759   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5684  0623 9e            	ld	a,xh
5685  0624 6b01          	ld	(OFST-1,sp),a
5687                     ; 1762   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5689                     ; 1763   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5691                     ; 1764   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5693                     ; 1766   tmpccmr2 = TIM3->CCMR2;
5695  0626 c65289        	ld	a,21129
5696  0629 6b02          	ld	(OFST+0,sp),a
5698                     ; 1769   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5700  062b 7219528a      	bres	21130,#4
5701                     ; 1772   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5703  062f 7b02          	ld	a,(OFST+0,sp)
5704  0631 a40c          	and	a,#12
5705  0633 6b02          	ld	(OFST+0,sp),a
5707                     ; 1773   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5709  0635 7b07          	ld	a,(OFST+5,sp)
5710  0637 97            	ld	xl,a
5711  0638 a610          	ld	a,#16
5712  063a 42            	mul	x,a
5713  063b 9f            	ld	a,xl
5714  063c 1a04          	or	a,(OFST+2,sp)
5715  063e 1a02          	or	a,(OFST+0,sp)
5716  0640 6b02          	ld	(OFST+0,sp),a
5718                     ; 1775   TIM3->CCMR2 = tmpccmr2;
5720  0642 7b02          	ld	a,(OFST+0,sp)
5721  0644 c75289        	ld	21129,a
5722                     ; 1778   if (tmpicpolarity == (uint8_t)TIM3_ICPolarity_Falling)
5724  0647 7b01          	ld	a,(OFST-1,sp)
5725  0649 a101          	cp	a,#1
5726  064b 2606          	jrne	L1572
5727                     ; 1780     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5729  064d 721a528a      	bset	21130,#5
5731  0651 2004          	jra	L3572
5732  0653               L1572:
5733                     ; 1784     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5735  0653 721b528a      	bres	21130,#5
5736  0657               L3572:
5737                     ; 1788   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5739  0657 7218528a      	bset	21130,#4
5740                     ; 1789 }
5743  065b 5b04          	addw	sp,#4
5744  065d 81            	ret
5768                     ; 1797 FunctionalState TIM3_GetStatus(void)
5768                     ; 1798 {
5769                     	switch	.text
5770  065e               _TIM3_GetStatus:
5774                     ; 1799   return ((FunctionalState)(TIM3->CR1 & TIM_CR1_CEN));
5776  065e c65280        	ld	a,21120
5777  0661 a401          	and	a,#1
5780  0663 81            	ret
5793                     	xdef	_TIM3_ClearITPendingBit
5794                     	xdef	_TIM3_GetITStatus
5795                     	xdef	_TIM3_ClearFlag
5796                     	xdef	_TIM3_GetFlagStatus
5797                     	xdef	_TIM3_GetPrescaler
5798                     	xdef	_TIM3_GetCounter
5799                     	xdef	_TIM3_GetCapture2
5800                     	xdef	_TIM3_GetCapture1
5801                     	xdef	_TIM3_SetIC2Prescaler
5802                     	xdef	_TIM3_SetIC1Prescaler
5803                     	xdef	_TIM3_SetCompare2
5804                     	xdef	_TIM3_SetCompare1
5805                     	xdef	_TIM3_SetAutoreload
5806                     	xdef	_TIM3_SetCounter
5807                     	xdef	_TIM3_SelectOCxM
5808                     	xdef	_TIM3_CCxCmd
5809                     	xdef	_TIM3_OC2PolarityConfig
5810                     	xdef	_TIM3_OC1PolarityConfig
5811                     	xdef	_TIM3_GenerateEvent
5812                     	xdef	_TIM3_OC2FastCmd
5813                     	xdef	_TIM3_OC1FastCmd
5814                     	xdef	_TIM3_OC2PreloadConfig
5815                     	xdef	_TIM3_OC1PreloadConfig
5816                     	xdef	_TIM3_ARRPreloadConfig
5817                     	xdef	_TIM3_ForcedOC2Config
5818                     	xdef	_TIM3_ForcedOC1Config
5819                     	xdef	_TIM3_CounterModeConfig
5820                     	xdef	_TIM3_PrescalerConfig
5821                     	xdef	_TIM3_EncoderInterfaceConfig
5822                     	xdef	_TIM3_SelectMasterSlaveMode
5823                     	xdef	_TIM3_SelectSlaveMode
5824                     	xdef	_TIM3_SelectOutputTrigger
5825                     	xdef	_TIM3_SelectOnePulseMode
5826                     	xdef	_TIM3_SelectHallSensor
5827                     	xdef	_TIM3_UpdateRequestConfig
5828                     	xdef	_TIM3_UpdateDisableConfig
5829                     	xdef	_TIM3_SelectInputTrigger
5830                     	xdef	_TIM3_TIxExternalClockConfig
5831                     	xdef	_TIM3_ETRConfig
5832                     	xdef	_TIM3_ETRClockMode2Config
5833                     	xdef	_TIM3_ETRClockMode1Config
5834                     	xdef	_TIM3_InternalClockConfig
5835                     	xdef	_TIM3_ITConfig
5836                     	xdef	_TIM3_CtrlPWMOutputs
5837                     	xdef	_TIM3_GetStatus
5838                     	xdef	_TIM3_Cmd
5839                     	xdef	_TIM3_PWMIConfig
5840                     	xdef	_TIM3_ICInit
5841                     	xdef	_TIM3_BKRConfig
5842                     	xdef	_TIM3_OC2Init
5843                     	xdef	_TIM3_OC1Init
5844                     	xdef	_TIM3_TimeBaseInit
5845                     	xdef	_TIM3_DeInit
5864                     	end
