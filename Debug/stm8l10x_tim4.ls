   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 56 void TIM4_DeInit(void)
  42                     ; 57 {
  44                     	switch	.text
  45  0000               _TIM4_DeInit:
  49                     ; 58   TIM4->CR1  = TIM4_CR1_RESET_VALUE;
  51  0000 725f52e0      	clr	21216
  52                     ; 59   TIM4->CR2  = TIM4_CR2_RESET_VALUE;
  54  0004 725f52e1      	clr	21217
  55                     ; 60   TIM4->SMCR  = TIM4_SMCR_RESET_VALUE;
  57  0008 725f52e2      	clr	21218
  58                     ; 61   TIM4->IER  = TIM4_IER_RESET_VALUE;
  60  000c 725f52e3      	clr	21219
  61                     ; 62   TIM4->CNTR  = TIM4_CNTR_RESET_VALUE;
  63  0010 725f52e6      	clr	21222
  64                     ; 63   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  66  0014 725f52e7      	clr	21223
  67                     ; 64   TIM4->ARR  = TIM4_ARR_RESET_VALUE;
  69  0018 35ff52e8      	mov	21224,#255
  70                     ; 65   TIM4->SR1  = TIM4_SR1_RESET_VALUE;
  72  001c 725f52e4      	clr	21220
  73                     ; 66 }
  76  0020 81            	ret
 244                     ; 91 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 244                     ; 92                        uint8_t TIM4_Period)
 244                     ; 93 {
 245                     	switch	.text
 246  0021               _TIM4_TimeBaseInit:
 250                     ; 95   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
 252                     ; 97   TIM4->ARR = (uint8_t)(TIM4_Period);
 254  0021 9f            	ld	a,xl
 255  0022 c752e8        	ld	21224,a
 256                     ; 99   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 258  0025 9e            	ld	a,xh
 259  0026 c752e7        	ld	21223,a
 260                     ; 100 }
 263  0029 81            	ret
 318                     ; 108 void TIM4_Cmd(FunctionalState NewState)
 318                     ; 109 {
 319                     	switch	.text
 320  002a               _TIM4_Cmd:
 324                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 326                     ; 114   if (NewState != DISABLE)
 328  002a 4d            	tnz	a
 329  002b 2706          	jreq	L531
 330                     ; 116     TIM4->CR1 |= TIM4_CR1_CEN ;
 332  002d 721052e0      	bset	21216,#0
 334  0031 2004          	jra	L731
 335  0033               L531:
 336                     ; 120     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 338  0033 721152e0      	bres	21216,#0
 339  0037               L731:
 340                     ; 122 }
 343  0037 81            	ret
 408                     ; 134 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 408                     ; 135 {
 409                     	switch	.text
 410  0038               _TIM4_ITConfig:
 412  0038 89            	pushw	x
 413       00000000      OFST:	set	0
 416                     ; 137   assert_param(IS_TIM4_IT(TIM4_IT));
 418                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 420                     ; 140   if (NewState != DISABLE)
 422  0039 9f            	ld	a,xl
 423  003a 4d            	tnz	a
 424  003b 2709          	jreq	L371
 425                     ; 143     TIM4->IER |= (uint8_t)TIM4_IT;
 427  003d 9e            	ld	a,xh
 428  003e ca52e3        	or	a,21219
 429  0041 c752e3        	ld	21219,a
 431  0044 2009          	jra	L571
 432  0046               L371:
 433                     ; 148     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 435  0046 7b01          	ld	a,(OFST+1,sp)
 436  0048 43            	cpl	a
 437  0049 c452e3        	and	a,21219
 438  004c c752e3        	ld	21219,a
 439  004f               L571:
 440                     ; 150 }
 443  004f 85            	popw	x
 444  0050 81            	ret
 468                     ; 157 void TIM4_InternalClockConfig(void)
 468                     ; 158 {
 469                     	switch	.text
 470  0051               _TIM4_InternalClockConfig:
 474                     ; 160   TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_SMS);
 476  0051 c652e2        	ld	a,21218
 477  0054 a4f8          	and	a,#248
 478  0056 c752e2        	ld	21218,a
 479                     ; 161 }
 482  0059 81            	ret
 550                     ; 171 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 550                     ; 172 {
 551                     	switch	.text
 552  005a               _TIM4_SelectInputTrigger:
 554  005a 88            	push	a
 555  005b 88            	push	a
 556       00000001      OFST:	set	1
 559                     ; 173   uint8_t tmpsmcr = 0;
 561                     ; 176   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 563                     ; 178   tmpsmcr = TIM4->SMCR;
 565  005c c652e2        	ld	a,21218
 566  005f 6b01          	ld	(OFST+0,sp),a
 568                     ; 181   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 570  0061 7b01          	ld	a,(OFST+0,sp)
 571  0063 a48f          	and	a,#143
 572  0065 6b01          	ld	(OFST+0,sp),a
 574                     ; 182   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 576  0067 7b01          	ld	a,(OFST+0,sp)
 577  0069 1a02          	or	a,(OFST+1,sp)
 578  006b 6b01          	ld	(OFST+0,sp),a
 580                     ; 184   TIM4->SMCR = (uint8_t)tmpsmcr;
 582  006d 7b01          	ld	a,(OFST+0,sp)
 583  006f c752e2        	ld	21218,a
 584                     ; 185 }
 587  0072 85            	popw	x
 588  0073 81            	ret
 624                     ; 193 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 624                     ; 194 {
 625                     	switch	.text
 626  0074               _TIM4_UpdateDisableConfig:
 630                     ; 196   assert_param(IS_FUNCTIONAL_STATE(NewState));
 632                     ; 199   if (NewState != DISABLE)
 634  0074 4d            	tnz	a
 635  0075 2706          	jreq	L752
 636                     ; 201     TIM4->CR1 |= TIM4_CR1_UDIS ;
 638  0077 721252e0      	bset	21216,#1
 640  007b 2004          	jra	L162
 641  007d               L752:
 642                     ; 205     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 644  007d 721352e0      	bres	21216,#1
 645  0081               L162:
 646                     ; 207 }
 649  0081 81            	ret
 707                     ; 217 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 707                     ; 218 {
 708                     	switch	.text
 709  0082               _TIM4_UpdateRequestConfig:
 713                     ; 220   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 715                     ; 223   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 717  0082 a101          	cp	a,#1
 718  0084 2606          	jrne	L113
 719                     ; 225     TIM4->CR1 |= TIM4_CR1_URS ;
 721  0086 721452e0      	bset	21216,#2
 723  008a 2004          	jra	L313
 724  008c               L113:
 725                     ; 229     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 727  008c 721552e0      	bres	21216,#2
 728  0090               L313:
 729                     ; 231 }
 732  0090 81            	ret
 789                     ; 241 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 789                     ; 242 {
 790                     	switch	.text
 791  0091               _TIM4_SelectOnePulseMode:
 795                     ; 244   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 797                     ; 247   if (TIM4_OPMode == TIM4_OPMode_Single)
 799  0091 a101          	cp	a,#1
 800  0093 2606          	jrne	L343
 801                     ; 249     TIM4->CR1 |= TIM4_CR1_OPM ;
 803  0095 721652e0      	bset	21216,#3
 805  0099 2004          	jra	L543
 806  009b               L343:
 807                     ; 253     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 809  009b 721752e0      	bres	21216,#3
 810  009f               L543:
 811                     ; 256 }
 814  009f 81            	ret
 889                     ; 267 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 889                     ; 268 {
 890                     	switch	.text
 891  00a0               _TIM4_SelectOutputTrigger:
 893  00a0 88            	push	a
 894  00a1 88            	push	a
 895       00000001      OFST:	set	1
 898                     ; 269   uint8_t tmpcr2 = 0;
 900                     ; 272   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 902                     ; 274   tmpcr2 = TIM4->CR2;
 904  00a2 c652e1        	ld	a,21217
 905  00a5 6b01          	ld	(OFST+0,sp),a
 907                     ; 277   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 909  00a7 7b01          	ld	a,(OFST+0,sp)
 910  00a9 a48f          	and	a,#143
 911  00ab 6b01          	ld	(OFST+0,sp),a
 913                     ; 280   tmpcr2 |= (uint8_t)TIM4_TRGOSource;
 915  00ad 7b01          	ld	a,(OFST+0,sp)
 916  00af 1a02          	or	a,(OFST+1,sp)
 917  00b1 6b01          	ld	(OFST+0,sp),a
 919                     ; 282   TIM4->CR2 = tmpcr2;
 921  00b3 7b01          	ld	a,(OFST+0,sp)
 922  00b5 c752e1        	ld	21217,a
 923                     ; 283 }
 926  00b8 85            	popw	x
 927  00b9 81            	ret
1018                     ; 297 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1018                     ; 298 {
1019                     	switch	.text
1020  00ba               _TIM4_SelectSlaveMode:
1022  00ba 88            	push	a
1023  00bb 88            	push	a
1024       00000001      OFST:	set	1
1027                     ; 299   uint8_t tmpsmcr = 0;
1029                     ; 302   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1031                     ; 304   tmpsmcr = TIM4->SMCR;
1033  00bc c652e2        	ld	a,21218
1034  00bf 6b01          	ld	(OFST+0,sp),a
1036                     ; 307   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1038  00c1 7b01          	ld	a,(OFST+0,sp)
1039  00c3 a4f8          	and	a,#248
1040  00c5 6b01          	ld	(OFST+0,sp),a
1042                     ; 310   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1044  00c7 7b01          	ld	a,(OFST+0,sp)
1045  00c9 1a02          	or	a,(OFST+1,sp)
1046  00cb 6b01          	ld	(OFST+0,sp),a
1048                     ; 312   TIM4->SMCR = tmpsmcr;
1050  00cd 7b01          	ld	a,(OFST+0,sp)
1051  00cf c752e2        	ld	21218,a
1052                     ; 313 }
1055  00d2 85            	popw	x
1056  00d3 81            	ret
1092                     ; 321 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1092                     ; 322 {
1093                     	switch	.text
1094  00d4               _TIM4_SelectMasterSlaveMode:
1098                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1100                     ; 327   if (NewState != DISABLE)
1102  00d4 4d            	tnz	a
1103  00d5 2706          	jreq	L164
1104                     ; 329     TIM4->SMCR |= TIM4_SMCR_MSM;
1106  00d7 721e52e2      	bset	21218,#7
1108  00db 2004          	jra	L364
1109  00dd               L164:
1110                     ; 333     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1112  00dd 721f52e2      	bres	21218,#7
1113  00e1               L364:
1114                     ; 335 }
1117  00e1 81            	ret
1185                     ; 363 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef TIM4_Prescaler,
1185                     ; 364                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
1185                     ; 365 {
1186                     	switch	.text
1187  00e2               _TIM4_PrescalerConfig:
1191                     ; 367   assert_param(IS_TIM4_PRESCALER_RELOAD(TIM4_PSCReloadMode));
1193                     ; 368   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
1195                     ; 371   TIM4->PSCR = (uint8_t)TIM4_Prescaler;
1197  00e2 9e            	ld	a,xh
1198  00e3 c752e7        	ld	21223,a
1199                     ; 374   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
1201  00e6 9f            	ld	a,xl
1202  00e7 a101          	cp	a,#1
1203  00e9 2606          	jrne	L715
1204                     ; 376     TIM4->EGR |= TIM4_EGR_UG ;
1206  00eb 721052e5      	bset	21221,#0
1208  00ef 2004          	jra	L125
1209  00f1               L715:
1210                     ; 380     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
1212  00f1 721152e5      	bres	21221,#0
1213  00f5               L125:
1214                     ; 382 }
1217  00f5 81            	ret
1253                     ; 390 void TIM4_ARRPreloadConfig(FunctionalState NewState)
1253                     ; 391 {
1254                     	switch	.text
1255  00f6               _TIM4_ARRPreloadConfig:
1259                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
1261                     ; 396   if (NewState != DISABLE)
1263  00f6 4d            	tnz	a
1264  00f7 2706          	jreq	L145
1265                     ; 398     TIM4->CR1 |= TIM4_CR1_ARPE ;
1267  00f9 721e52e0      	bset	21216,#7
1269  00fd 2004          	jra	L345
1270  00ff               L145:
1271                     ; 402     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
1273  00ff 721f52e0      	bres	21216,#7
1274  0103               L345:
1275                     ; 404 }
1278  0103 81            	ret
1335                     ; 414 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1335                     ; 415 {
1336                     	switch	.text
1337  0104               _TIM4_GenerateEvent:
1341                     ; 417   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1343                     ; 420   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1345  0104 ca52e5        	or	a,21221
1346  0107 c752e5        	ld	21221,a
1347                     ; 421 }
1350  010a 81            	ret
1384                     ; 429 void TIM4_SetCounter(uint8_t TIM4_Counter)
1384                     ; 430 {
1385                     	switch	.text
1386  010b               _TIM4_SetCounter:
1390                     ; 432   TIM4->CNTR = (uint8_t)(TIM4_Counter);
1392  010b c752e6        	ld	21222,a
1393                     ; 433 }
1396  010e 81            	ret
1430                     ; 441 void TIM4_SetAutoreload(uint8_t TIM4_Autoreload)
1430                     ; 442 {
1431                     	switch	.text
1432  010f               _TIM4_SetAutoreload:
1436                     ; 445   TIM4->ARR = (uint8_t)(TIM4_Autoreload);
1438  010f c752e8        	ld	21224,a
1439                     ; 446 }
1442  0112 81            	ret
1476                     ; 453 uint8_t TIM4_GetCounter(void)
1476                     ; 454 {
1477                     	switch	.text
1478  0113               _TIM4_GetCounter:
1480  0113 88            	push	a
1481       00000001      OFST:	set	1
1484                     ; 455   uint8_t tmpcntr = 0;
1486                     ; 456   tmpcntr = TIM4->CNTR;
1488  0114 c652e6        	ld	a,21222
1489  0117 6b01          	ld	(OFST+0,sp),a
1491                     ; 458   return ((uint8_t)tmpcntr);
1493  0119 7b01          	ld	a,(OFST+0,sp)
1496  011b 5b01          	addw	sp,#1
1497  011d 81            	ret
1521                     ; 482 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1521                     ; 483 {
1522                     	switch	.text
1523  011e               _TIM4_GetPrescaler:
1527                     ; 485   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
1529  011e c652e7        	ld	a,21223
1532  0121 81            	ret
1556                     ; 493 FunctionalState TIM4_GetStatus(void)
1556                     ; 494 {
1557                     	switch	.text
1558  0122               _TIM4_GetStatus:
1562                     ; 495   return ((FunctionalState)(TIM4->CR1 & TIM4_CR1_CEN));
1564  0122 c652e0        	ld	a,21216
1565  0125 a401          	and	a,#1
1568  0127 81            	ret
1654                     ; 507 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1654                     ; 508 {
1655                     	switch	.text
1656  0128               _TIM4_GetFlagStatus:
1658  0128 88            	push	a
1659       00000001      OFST:	set	1
1662                     ; 509   __IO FlagStatus bitstatus = RESET;
1664  0129 0f01          	clr	(OFST+0,sp)
1666                     ; 512   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1668                     ; 514   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1670  012b c452e4        	and	a,21220
1671  012e 2706          	jreq	L727
1672                     ; 516     bitstatus = SET;
1674  0130 a601          	ld	a,#1
1675  0132 6b01          	ld	(OFST+0,sp),a
1678  0134 2002          	jra	L137
1679  0136               L727:
1680                     ; 520     bitstatus = RESET;
1682  0136 0f01          	clr	(OFST+0,sp)
1684  0138               L137:
1685                     ; 522   return ((FlagStatus)bitstatus);
1687  0138 7b01          	ld	a,(OFST+0,sp)
1690  013a 5b01          	addw	sp,#1
1691  013c 81            	ret
1726                     ; 533 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1726                     ; 534 {
1727                     	switch	.text
1728  013d               _TIM4_ClearFlag:
1732                     ; 536   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1734                     ; 538   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1736  013d 43            	cpl	a
1737  013e c752e4        	ld	21220,a
1738                     ; 539 }
1741  0141 81            	ret
1805                     ; 550 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1805                     ; 551 {
1806                     	switch	.text
1807  0142               _TIM4_GetITStatus:
1809  0142 88            	push	a
1810  0143 5203          	subw	sp,#3
1811       00000003      OFST:	set	3
1814                     ; 552   __IO ITStatus bitstatus = RESET;
1816  0145 0f03          	clr	(OFST+0,sp)
1818                     ; 554   __IO uint8_t itStatus = 0x0, itEnable = 0x0;
1820  0147 0f01          	clr	(OFST-2,sp)
1824  0149 0f02          	clr	(OFST-1,sp)
1826                     ; 557   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1828                     ; 559   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1830  014b c452e4        	and	a,21220
1831  014e 6b01          	ld	(OFST-2,sp),a
1833                     ; 561   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1835  0150 c652e3        	ld	a,21219
1836  0153 1404          	and	a,(OFST+1,sp)
1837  0155 6b02          	ld	(OFST-1,sp),a
1839                     ; 563   if ((itStatus != (uint8_t)RESET) && (itEnable != (uint8_t)RESET))
1841  0157 0d01          	tnz	(OFST-2,sp)
1842  0159 270a          	jreq	L3001
1844  015b 0d02          	tnz	(OFST-1,sp)
1845  015d 2706          	jreq	L3001
1846                     ; 565     bitstatus = (ITStatus)SET;
1848  015f a601          	ld	a,#1
1849  0161 6b03          	ld	(OFST+0,sp),a
1852  0163 2002          	jra	L5001
1853  0165               L3001:
1854                     ; 569     bitstatus = (ITStatus)RESET;
1856  0165 0f03          	clr	(OFST+0,sp)
1858  0167               L5001:
1859                     ; 571   return ((ITStatus)bitstatus);
1861  0167 7b03          	ld	a,(OFST+0,sp)
1864  0169 5b04          	addw	sp,#4
1865  016b 81            	ret
1901                     ; 582 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1901                     ; 583 {
1902                     	switch	.text
1903  016c               _TIM4_ClearITPendingBit:
1907                     ; 585   assert_param(IS_TIM4_IT(TIM4_IT));
1909                     ; 588   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1911  016c 43            	cpl	a
1912  016d c752e4        	ld	21220,a
1913                     ; 589 }
1916  0170 81            	ret
1929                     	xdef	_TIM4_ClearITPendingBit
1930                     	xdef	_TIM4_GetITStatus
1931                     	xdef	_TIM4_ClearFlag
1932                     	xdef	_TIM4_GetFlagStatus
1933                     	xdef	_TIM4_GetStatus
1934                     	xdef	_TIM4_GetPrescaler
1935                     	xdef	_TIM4_GetCounter
1936                     	xdef	_TIM4_SetAutoreload
1937                     	xdef	_TIM4_SetCounter
1938                     	xdef	_TIM4_GenerateEvent
1939                     	xdef	_TIM4_ARRPreloadConfig
1940                     	xdef	_TIM4_PrescalerConfig
1941                     	xdef	_TIM4_SelectMasterSlaveMode
1942                     	xdef	_TIM4_SelectSlaveMode
1943                     	xdef	_TIM4_SelectOutputTrigger
1944                     	xdef	_TIM4_SelectOnePulseMode
1945                     	xdef	_TIM4_UpdateRequestConfig
1946                     	xdef	_TIM4_UpdateDisableConfig
1947                     	xdef	_TIM4_SelectInputTrigger
1948                     	xdef	_TIM4_InternalClockConfig
1949                     	xdef	_TIM4_ITConfig
1950                     	xdef	_TIM4_Cmd
1951                     	xdef	_TIM4_TimeBaseInit
1952                     	xdef	_TIM4_DeInit
1971                     	end
