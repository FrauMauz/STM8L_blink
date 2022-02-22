   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 55 void SPI_DeInit(void)
  42                     ; 56 {
  44                     	switch	.text
  45  0000               _SPI_DeInit:
  49                     ; 57   SPI->CR1 = SPI_CR1_RESET_VALUE;
  51  0000 725f5200      	clr	20992
  52                     ; 58   SPI->CR2 = SPI_CR2_RESET_VALUE;
  54  0004 725f5201      	clr	20993
  55                     ; 59   SPI->ICR = SPI_ICR_RESET_VALUE;
  57  0008 725f5202      	clr	20994
  58                     ; 60   SPI->SR = SPI_SR_RESET_VALUE;
  60  000c 35025203      	mov	20995,#2
  61                     ; 61 }
  64  0010 81            	ret
 368                     ; 103 void SPI_Init(SPI_FirstBit_TypeDef SPI_FirstBit, SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 368                     ; 104               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL, SPI_CPHA_TypeDef SPI_CPHA,
 368                     ; 105               SPI_DirectionMode_TypeDef SPI_DirectionMode, SPI_NSS_TypeDef SPI_NSS)
 368                     ; 106 {
 369                     	switch	.text
 370  0011               _SPI_Init:
 372  0011 89            	pushw	x
 373       00000000      OFST:	set	0
 376                     ; 109   assert_param(IS_SPI_FIRST_BIT(SPI_FirstBit));
 378                     ; 110   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 380                     ; 111   assert_param(IS_SPI_MODE(SPI_Mode));
 382                     ; 112   assert_param(IS_SPI_CPOL(SPI_CPOL));
 384                     ; 113   assert_param(IS_SPI_CPHA(SPI_CPHA));
 386                     ; 114   assert_param(IS_SPI_DIRECTION_MODE(SPI_DirectionMode));
 388                     ; 115   assert_param(IS_SPI_NSS(SPI_NSS));
 390                     ; 118   SPI->CR1 = (uint8_t)((uint8_t)(SPI_FirstBit) |
 390                     ; 119                        (uint8_t)(SPI_BaudRatePrescaler) |
 390                     ; 120                        (uint8_t)(SPI_CPOL) |
 390                     ; 121                        (uint8_t)(SPI_CPHA));
 392  0012 9f            	ld	a,xl
 393  0013 1a01          	or	a,(OFST+1,sp)
 394  0015 1a06          	or	a,(OFST+6,sp)
 395  0017 1a07          	or	a,(OFST+7,sp)
 396  0019 c75200        	ld	20992,a
 397                     ; 124   SPI->CR2 = (uint8_t)((uint8_t)(SPI_DirectionMode) | (uint8_t)(SPI_NSS));
 399  001c 7b08          	ld	a,(OFST+8,sp)
 400  001e 1a09          	or	a,(OFST+9,sp)
 401  0020 c75201        	ld	20993,a
 402                     ; 126   if (SPI_Mode == SPI_Mode_Master)
 404  0023 7b05          	ld	a,(OFST+5,sp)
 405  0025 a104          	cp	a,#4
 406  0027 2606          	jrne	L771
 407                     ; 128     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 409  0029 72105201      	bset	20993,#0
 411  002d 2004          	jra	L102
 412  002f               L771:
 413                     ; 132     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 415  002f 72115201      	bres	20993,#0
 416  0033               L102:
 417                     ; 136   SPI->CR1 |= (uint8_t)(SPI_Mode);
 419  0033 c65200        	ld	a,20992
 420  0036 1a05          	or	a,(OFST+5,sp)
 421  0038 c75200        	ld	20992,a
 422                     ; 137 }
 425  003b 85            	popw	x
 426  003c 81            	ret
 481                     ; 145 void SPI_Cmd(FunctionalState NewState)
 481                     ; 146 {
 482                     	switch	.text
 483  003d               _SPI_Cmd:
 487                     ; 149   assert_param(IS_FUNCTIONAL_STATE(NewState));
 489                     ; 151   if (NewState != DISABLE)
 491  003d 4d            	tnz	a
 492  003e 2706          	jreq	L132
 493                     ; 153     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral */
 495  0040 721c5200      	bset	20992,#6
 497  0044 2004          	jra	L332
 498  0046               L132:
 499                     ; 157     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral */
 501  0046 721d5200      	bres	20992,#6
 502  004a               L332:
 503                     ; 160 }
 506  004a 81            	ret
 608                     ; 174 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 608                     ; 175 {
 609                     	switch	.text
 610  004b               _SPI_ITConfig:
 612  004b 89            	pushw	x
 613  004c 88            	push	a
 614       00000001      OFST:	set	1
 617                     ; 176   uint8_t itpos = 0;
 619                     ; 178   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
 621                     ; 179   assert_param(IS_FUNCTIONAL_STATE(NewState));
 623                     ; 182   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 625  004d 9e            	ld	a,xh
 626  004e a40f          	and	a,#15
 627  0050 5f            	clrw	x
 628  0051 97            	ld	xl,a
 629  0052 a601          	ld	a,#1
 630  0054 5d            	tnzw	x
 631  0055 2704          	jreq	L41
 632  0057               L61:
 633  0057 48            	sll	a
 634  0058 5a            	decw	x
 635  0059 26fc          	jrne	L61
 636  005b               L41:
 637  005b 6b01          	ld	(OFST+0,sp),a
 639                     ; 184   if (NewState != DISABLE)
 641  005d 0d03          	tnz	(OFST+2,sp)
 642  005f 270a          	jreq	L303
 643                     ; 186     SPI->ICR |= itpos; /* Enable interrupt*/
 645  0061 c65202        	ld	a,20994
 646  0064 1a01          	or	a,(OFST+0,sp)
 647  0066 c75202        	ld	20994,a
 649  0069 2009          	jra	L503
 650  006b               L303:
 651                     ; 190     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 653  006b 7b01          	ld	a,(OFST+0,sp)
 654  006d 43            	cpl	a
 655  006e c45202        	and	a,20994
 656  0071 c75202        	ld	20994,a
 657  0074               L503:
 658                     ; 192 }
 661  0074 5b03          	addw	sp,#3
 662  0076 81            	ret
 696                     ; 199 void SPI_SendData(uint8_t Data)
 696                     ; 200 {
 697                     	switch	.text
 698  0077               _SPI_SendData:
 702                     ; 201   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 704  0077 c75204        	ld	20996,a
 705                     ; 202 }
 708  007a 81            	ret
 731                     ; 209 uint8_t SPI_ReceiveData(void)
 731                     ; 210 {
 732                     	switch	.text
 733  007b               _SPI_ReceiveData:
 737                     ; 211   return ((uint8_t)SPI->DR); /* Return the data in the DR register */
 739  007b c65204        	ld	a,20996
 742  007e 81            	ret
 778                     ; 221 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 778                     ; 222 {
 779                     	switch	.text
 780  007f               _SPI_NSSInternalSoftwareCmd:
 784                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 786                     ; 227   if (NewState != DISABLE)
 788  007f 4d            	tnz	a
 789  0080 2706          	jreq	L353
 790                     ; 229     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software */
 792  0082 72105201      	bset	20993,#0
 794  0086 2004          	jra	L553
 795  0088               L353:
 796                     ; 233     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software */
 798  0088 72115201      	bres	20993,#0
 799  008c               L553:
 800                     ; 236 }
 803  008c 81            	ret
 859                     ; 246 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
 859                     ; 247 {
 860                     	switch	.text
 861  008d               _SPI_BiDirectionalLineConfig:
 865                     ; 250   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 867                     ; 251   if (SPI_Direction != SPI_Direction_Rx)
 869  008d 4d            	tnz	a
 870  008e 2706          	jreq	L504
 871                     ; 253     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 873  0090 721c5201      	bset	20993,#6
 875  0094 2004          	jra	L704
 876  0096               L504:
 877                     ; 257     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 879  0096 721d5201      	bres	20993,#6
 880  009a               L704:
 881                     ; 259 }
 884  009a 81            	ret
 998                     ; 275 FlagStatus SPI_GetFlagStatus(SPI_FLAG_TypeDef SPI_FLAG)
 998                     ; 276 {
 999                     	switch	.text
1000  009b               _SPI_GetFlagStatus:
1002  009b 88            	push	a
1003       00000001      OFST:	set	1
1006                     ; 277   FlagStatus status = RESET;
1008                     ; 279   assert_param(IS_SPI_FLAG(SPI_FLAG));
1010                     ; 282   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1012  009c c45203        	and	a,20995
1013  009f 2706          	jreq	L364
1014                     ; 284     status = SET; /* SPI_FLAG is set */
1016  00a1 a601          	ld	a,#1
1017  00a3 6b01          	ld	(OFST+0,sp),a
1020  00a5 2002          	jra	L564
1021  00a7               L364:
1022                     ; 288     status = RESET; /* SPI_FLAG is reset*/
1024  00a7 0f01          	clr	(OFST+0,sp)
1026  00a9               L564:
1027                     ; 292   return status;
1029  00a9 7b01          	ld	a,(OFST+0,sp)
1032  00ab 5b01          	addw	sp,#1
1033  00ad 81            	ret
1056                     ; 306 void SPI_ClearFlag(void)
1056                     ; 307 {
1057                     	switch	.text
1058  00ae               _SPI_ClearFlag:
1062                     ; 309   SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1064  00ae 35f75203      	mov	20995,#247
1065                     ; 310 }
1068  00b2 81            	ret
1150                     ; 323 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1150                     ; 324 {
1151                     	switch	.text
1152  00b3               _SPI_GetITStatus:
1154  00b3 88            	push	a
1155  00b4 89            	pushw	x
1156       00000002      OFST:	set	2
1159                     ; 325   ITStatus pendingbitstatus = RESET;
1161                     ; 326   uint8_t itpos = 0;
1163                     ; 327   uint8_t itmask1 = 0;
1165                     ; 328   uint8_t itmask2 = 0;
1167                     ; 329   uint8_t enablestatus = 0;
1169                     ; 330   assert_param(IS_SPI_GET_IT(SPI_IT));
1171                     ; 332   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1173  00b5 a40f          	and	a,#15
1174  00b7 5f            	clrw	x
1175  00b8 97            	ld	xl,a
1176  00b9 a601          	ld	a,#1
1177  00bb 5d            	tnzw	x
1178  00bc 2704          	jreq	L63
1179  00be               L04:
1180  00be 48            	sll	a
1181  00bf 5a            	decw	x
1182  00c0 26fc          	jrne	L04
1183  00c2               L63:
1184  00c2 6b01          	ld	(OFST-1,sp),a
1186                     ; 335   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1188  00c4 7b03          	ld	a,(OFST+1,sp)
1189  00c6 4e            	swap	a
1190  00c7 a40f          	and	a,#15
1191  00c9 6b02          	ld	(OFST+0,sp),a
1193                     ; 337   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1195  00cb 7b02          	ld	a,(OFST+0,sp)
1196  00cd 5f            	clrw	x
1197  00ce 97            	ld	xl,a
1198  00cf a601          	ld	a,#1
1199  00d1 5d            	tnzw	x
1200  00d2 2704          	jreq	L24
1201  00d4               L44:
1202  00d4 48            	sll	a
1203  00d5 5a            	decw	x
1204  00d6 26fc          	jrne	L44
1205  00d8               L24:
1206  00d8 6b02          	ld	(OFST+0,sp),a
1208                     ; 339   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1210  00da c65203        	ld	a,20995
1211  00dd 1402          	and	a,(OFST+0,sp)
1212  00df 6b02          	ld	(OFST+0,sp),a
1214                     ; 341   if (((SPI->ICR & itpos) != (uint8_t)RESET) && enablestatus)
1216  00e1 c65202        	ld	a,20994
1217  00e4 1501          	bcp	a,(OFST-1,sp)
1218  00e6 270a          	jreq	L145
1220  00e8 0d02          	tnz	(OFST+0,sp)
1221  00ea 2706          	jreq	L145
1222                     ; 344     pendingbitstatus = SET;
1224  00ec a601          	ld	a,#1
1225  00ee 6b02          	ld	(OFST+0,sp),a
1228  00f0 2002          	jra	L345
1229  00f2               L145:
1230                     ; 349     pendingbitstatus = RESET;
1232  00f2 0f02          	clr	(OFST+0,sp)
1234  00f4               L345:
1235                     ; 352   return  pendingbitstatus;
1237  00f4 7b02          	ld	a,(OFST+0,sp)
1240  00f6 5b03          	addw	sp,#3
1241  00f8 81            	ret
1265                     ; 367 void SPI_ClearITPendingBit(void)
1265                     ; 368 {
1266                     	switch	.text
1267  00f9               _SPI_ClearITPendingBit:
1271                     ; 370   SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1273  00f9 35f75203      	mov	20995,#247
1274                     ; 371 }
1277  00fd 81            	ret
1290                     	xdef	_SPI_ClearITPendingBit
1291                     	xdef	_SPI_ClearFlag
1292                     	xdef	_SPI_GetITStatus
1293                     	xdef	_SPI_GetFlagStatus
1294                     	xdef	_SPI_ReceiveData
1295                     	xdef	_SPI_SendData
1296                     	xdef	_SPI_BiDirectionalLineConfig
1297                     	xdef	_SPI_NSSInternalSoftwareCmd
1298                     	xdef	_SPI_ITConfig
1299                     	xdef	_SPI_Cmd
1300                     	xdef	_SPI_Init
1301                     	xdef	_SPI_DeInit
1320                     	end
