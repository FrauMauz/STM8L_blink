   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 59 void USART_DeInit(void)
  42                     ; 60 {
  44                     	switch	.text
  45  0000               _USART_DeInit:
  49                     ; 63   (void)USART->SR;
  51  0000 c65230        	ld	a,21040
  52                     ; 64   (void)USART->DR;
  54  0003 c65231        	ld	a,21041
  55                     ; 66   USART->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  57  0006 725f5233      	clr	21043
  58                     ; 67   USART->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  60  000a 725f5232      	clr	21042
  61                     ; 69   USART->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  63  000e 725f5234      	clr	21044
  64                     ; 70   USART->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  66  0012 725f5235      	clr	21045
  67                     ; 71   USART->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  69  0016 725f5236      	clr	21046
  70                     ; 72   USART->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  72  001a 725f5237      	clr	21047
  73                     ; 73 }
  76  001e 81            	ret
 249                     ; 100 void USART_Init(uint32_t BaudRate, USART_WordLength_TypeDef USART_WordLength,
 249                     ; 101                 USART_StopBits_TypeDef USART_StopBits, USART_Parity_TypeDef
 249                     ; 102                 USART_Parity, USART_Mode_TypeDef USART_Mode)
 249                     ; 103 {
 250                     	switch	.text
 251  001f               _USART_Init:
 253  001f 5204          	subw	sp,#4
 254       00000004      OFST:	set	4
 257                     ; 104   uint32_t BaudRate_Mantissa = 0;
 259                     ; 107   assert_param(IS_USART_BAUDRATE(BaudRate));
 261                     ; 109   assert_param(IS_USART_WordLength(USART_WordLength));
 263                     ; 111   assert_param(IS_USART_STOPBITS(USART_StopBits));
 265                     ; 113   assert_param(IS_USART_PARITY(USART_Parity));
 267                     ; 115   assert_param(IS_USART_MODE(USART_Mode));
 269                     ; 118   USART->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 271  0021 c65234        	ld	a,21044
 272  0024 a4e9          	and	a,#233
 273  0026 c75234        	ld	21044,a
 274                     ; 121   USART->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 276  0029 7b0b          	ld	a,(OFST+7,sp)
 277  002b 1a0d          	or	a,(OFST+9,sp)
 278  002d ca5234        	or	a,21044
 279  0030 c75234        	ld	21044,a
 280                     ; 124   USART->CR3 &= (uint8_t)(~USART_CR3_STOP);
 282  0033 c65236        	ld	a,21046
 283  0036 a4cf          	and	a,#207
 284  0038 c75236        	ld	21046,a
 285                     ; 126   USART->CR3 |= (uint8_t)USART_StopBits;
 287  003b c65236        	ld	a,21046
 288  003e 1a0c          	or	a,(OFST+8,sp)
 289  0040 c75236        	ld	21046,a
 290                     ; 129   USART->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 292  0043 725f5232      	clr	21042
 293                     ; 131   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 295  0047 c65233        	ld	a,21043
 296  004a a40f          	and	a,#15
 297  004c c75233        	ld	21043,a
 298                     ; 133   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 300  004f c65233        	ld	a,21043
 301  0052 a4f0          	and	a,#240
 302  0054 c75233        	ld	21043,a
 303                     ; 135   BaudRate_Mantissa  = ((uint32_t)CLK_GetClockFreq() / BaudRate);
 305  0057 cd0000        	call	_CLK_GetClockFreq
 307  005a 96            	ldw	x,sp
 308  005b 1c0007        	addw	x,#OFST+3
 309  005e cd0000        	call	c_ludv
 311  0061 96            	ldw	x,sp
 312  0062 1c0001        	addw	x,#OFST-3
 313  0065 cd0000        	call	c_rtol
 316                     ; 137   USART->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 318  0068 7b03          	ld	a,(OFST-1,sp)
 319  006a a4f0          	and	a,#240
 320  006c c75233        	ld	21043,a
 321                     ; 139   USART->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 323  006f 7b04          	ld	a,(OFST+0,sp)
 324  0071 a40f          	and	a,#15
 325  0073 ca5233        	or	a,21043
 326  0076 c75233        	ld	21043,a
 327                     ; 141   USART->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 329  0079 96            	ldw	x,sp
 330  007a 1c0001        	addw	x,#OFST-3
 331  007d cd0000        	call	c_ltor
 333  0080 a604          	ld	a,#4
 334  0082 cd0000        	call	c_lursh
 336  0085 b603          	ld	a,c_lreg+3
 337  0087 c75232        	ld	21042,a
 338                     ; 144   USART->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 340  008a c65235        	ld	a,21045
 341  008d a4f3          	and	a,#243
 342  008f c75235        	ld	21045,a
 343                     ; 146   USART->CR2 |= (uint8_t)USART_Mode;
 345  0092 c65235        	ld	a,21045
 346  0095 1a0e          	or	a,(OFST+10,sp)
 347  0097 c75235        	ld	21045,a
 348                     ; 147 }
 351  009a 5b04          	addw	sp,#4
 352  009c 81            	ret
 500                     ; 171 void USART_ClockInit(USART_Clock_TypeDef USART_Clock, USART_CPOL_TypeDef USART_CPOL,
 500                     ; 172                      USART_CPHA_TypeDef USART_CPHA, USART_LastBit_TypeDef USART_LastBit)
 500                     ; 173 {
 501                     	switch	.text
 502  009d               _USART_ClockInit:
 504  009d 89            	pushw	x
 505       00000000      OFST:	set	0
 508                     ; 175   assert_param(IS_USART_CLOCK(USART_Clock));
 510                     ; 176   assert_param(IS_USART_CPOL(USART_CPOL));
 512                     ; 177   assert_param(IS_USART_CPHA(USART_CPHA));
 514                     ; 178   assert_param(IS_USART_LASTBIT(USART_LastBit));
 516                     ; 181   USART->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 518  009e c65236        	ld	a,21046
 519  00a1 a4f8          	and	a,#248
 520  00a3 c75236        	ld	21046,a
 521                     ; 183   USART->CR3 |= (uint8_t)((uint8_t)USART_CPOL | (uint8_t)USART_CPHA | (uint8_t)USART_LastBit);
 523  00a6 9f            	ld	a,xl
 524  00a7 1a05          	or	a,(OFST+5,sp)
 525  00a9 1a06          	or	a,(OFST+6,sp)
 526  00ab ca5236        	or	a,21046
 527  00ae c75236        	ld	21046,a
 528                     ; 185   if (USART_Clock != USART_Clock_Disable)
 530  00b1 0d01          	tnz	(OFST+1,sp)
 531  00b3 2706          	jreq	L712
 532                     ; 187     USART->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 534  00b5 72165236      	bset	21046,#3
 536  00b9 2004          	jra	L122
 537  00bb               L712:
 538                     ; 191     USART->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 540  00bb 72175236      	bres	21046,#3
 541  00bf               L122:
 542                     ; 193 }
 545  00bf 85            	popw	x
 546  00c0 81            	ret
 601                     ; 201 void USART_Cmd(FunctionalState NewState)
 601                     ; 202 {
 602                     	switch	.text
 603  00c1               _USART_Cmd:
 607                     ; 203   assert_param(IS_FUNCTIONAL_STATE(NewState));
 609                     ; 205   if (NewState != DISABLE)
 611  00c1 4d            	tnz	a
 612  00c2 2706          	jreq	L152
 613                     ; 207     USART->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 615  00c4 721b5234      	bres	21044,#5
 617  00c8 2004          	jra	L352
 618  00ca               L152:
 619                     ; 211     USART->CR1 |= USART_CR1_USARTD;  /**< USART Disable */
 621  00ca 721a5234      	bset	21044,#5
 622  00ce               L352:
 623                     ; 213 }
 626  00ce 81            	ret
 737                     ; 229 void USART_ITConfig(USART_IT_TypeDef USART_IT, FunctionalState NewState)
 737                     ; 230 {
 738                     	switch	.text
 739  00cf               _USART_ITConfig:
 741  00cf 89            	pushw	x
 742  00d0 89            	pushw	x
 743       00000002      OFST:	set	2
 746                     ; 231   uint8_t uartreg, itpos = 0x00;
 748                     ; 232   assert_param(IS_USART_CONFIG_IT(USART_IT));
 750                     ; 233   assert_param(IS_FUNCTIONAL_STATE(NewState));
 752                     ; 236   uartreg = (uint8_t)((uint16_t)USART_IT >> (uint8_t)0x08);
 754  00d1 9e            	ld	a,xh
 755  00d2 6b01          	ld	(OFST-1,sp),a
 757                     ; 238   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 759  00d4 9f            	ld	a,xl
 760  00d5 a40f          	and	a,#15
 761  00d7 5f            	clrw	x
 762  00d8 97            	ld	xl,a
 763  00d9 a601          	ld	a,#1
 764  00db 5d            	tnzw	x
 765  00dc 2704          	jreq	L61
 766  00de               L02:
 767  00de 48            	sll	a
 768  00df 5a            	decw	x
 769  00e0 26fc          	jrne	L02
 770  00e2               L61:
 771  00e2 6b02          	ld	(OFST+0,sp),a
 773                     ; 240   if (NewState != DISABLE)
 775  00e4 0d07          	tnz	(OFST+5,sp)
 776  00e6 271a          	jreq	L723
 777                     ; 243     if (uartreg == 0x01)
 779  00e8 7b01          	ld	a,(OFST-1,sp)
 780  00ea a101          	cp	a,#1
 781  00ec 260a          	jrne	L133
 782                     ; 245       USART->CR1 |= itpos;
 784  00ee c65234        	ld	a,21044
 785  00f1 1a02          	or	a,(OFST+0,sp)
 786  00f3 c75234        	ld	21044,a
 788  00f6 2024          	jra	L533
 789  00f8               L133:
 790                     ; 250       USART->CR2 |= itpos;
 792  00f8 c65235        	ld	a,21045
 793  00fb 1a02          	or	a,(OFST+0,sp)
 794  00fd c75235        	ld	21045,a
 795  0100 201a          	jra	L533
 796  0102               L723:
 797                     ; 256     if (uartreg == 0x01)
 799  0102 7b01          	ld	a,(OFST-1,sp)
 800  0104 a101          	cp	a,#1
 801  0106 260b          	jrne	L733
 802                     ; 258       USART->CR1 &= (uint8_t)(~itpos);
 804  0108 7b02          	ld	a,(OFST+0,sp)
 805  010a 43            	cpl	a
 806  010b c45234        	and	a,21044
 807  010e c75234        	ld	21044,a
 809  0111 2009          	jra	L533
 810  0113               L733:
 811                     ; 263       USART->CR2 &= (uint8_t)(~itpos);
 813  0113 7b02          	ld	a,(OFST+0,sp)
 814  0115 43            	cpl	a
 815  0116 c45235        	and	a,21045
 816  0119 c75235        	ld	21045,a
 817  011c               L533:
 818                     ; 267 }
 821  011c 5b04          	addw	sp,#4
 822  011e 81            	ret
 845                     ; 275 uint8_t USART_ReceiveData8(void)
 845                     ; 276 {
 846                     	switch	.text
 847  011f               _USART_ReceiveData8:
 851                     ; 277   return USART->DR;
 853  011f c65231        	ld	a,21041
 856  0122 81            	ret
 890                     ; 287 uint16_t USART_ReceiveData9(void)
 890                     ; 288 {
 891                     	switch	.text
 892  0123               _USART_ReceiveData9:
 894  0123 89            	pushw	x
 895       00000002      OFST:	set	2
 898                     ; 289   uint16_t temp = 0;
 900                     ; 291   temp = ((uint16_t)(((uint16_t)((uint16_t)USART->CR1 & (uint16_t)USART_CR1_R8)) << 1));
 902  0124 c65234        	ld	a,21044
 903  0127 5f            	clrw	x
 904  0128 a480          	and	a,#128
 905  012a 5f            	clrw	x
 906  012b 02            	rlwa	x,a
 907  012c 58            	sllw	x
 908  012d 1f01          	ldw	(OFST-1,sp),x
 910                     ; 292   return (uint16_t)( ((uint16_t)((uint16_t)USART->DR) | temp) & ((uint16_t)0x01FF));
 912  012f c65231        	ld	a,21041
 913  0132 5f            	clrw	x
 914  0133 97            	ld	xl,a
 915  0134 01            	rrwa	x,a
 916  0135 1a02          	or	a,(OFST+0,sp)
 917  0137 01            	rrwa	x,a
 918  0138 1a01          	or	a,(OFST-1,sp)
 919  013a 01            	rrwa	x,a
 920  013b 01            	rrwa	x,a
 921  013c a4ff          	and	a,#255
 922  013e 01            	rrwa	x,a
 923  013f a401          	and	a,#1
 924  0141 01            	rrwa	x,a
 927  0142 5b02          	addw	sp,#2
 928  0144 81            	ret
 964                     ; 301 void USART_ReceiverWakeUpCmd(FunctionalState NewState)
 964                     ; 302 {
 965                     	switch	.text
 966  0145               _USART_ReceiverWakeUpCmd:
 970                     ; 303   assert_param(IS_FUNCTIONAL_STATE(NewState));
 972                     ; 305   if (NewState != DISABLE)
 974  0145 4d            	tnz	a
 975  0146 2706          	jreq	L704
 976                     ; 308     USART->CR2 |= USART_CR2_RWU;
 978  0148 72125235      	bset	21045,#1
 980  014c 2004          	jra	L114
 981  014e               L704:
 982                     ; 313     USART->CR2 &= ((uint8_t)~USART_CR2_RWU);
 984  014e 72135235      	bres	21045,#1
 985  0152               L114:
 986                     ; 315 }
 989  0152 81            	ret
1012                     ; 322 void USART_SendBreak(void)
1012                     ; 323 {
1013                     	switch	.text
1014  0153               _USART_SendBreak:
1018                     ; 324   USART->CR2 |= USART_CR2_SBK;
1020  0153 72105235      	bset	21045,#0
1021                     ; 325 }
1024  0157 81            	ret
1058                     ; 332 void USART_SendData8(uint8_t Data)
1058                     ; 333 {
1059                     	switch	.text
1060  0158               _USART_SendData8:
1064                     ; 335   USART->DR = Data;
1066  0158 c75231        	ld	21041,a
1067                     ; 336 }
1070  015b 81            	ret
1104                     ; 344 void USART_SendData9(uint16_t Data)
1104                     ; 345 {
1105                     	switch	.text
1106  015c               _USART_SendData9:
1108  015c 89            	pushw	x
1109       00000000      OFST:	set	0
1112                     ; 346   assert_param(IS_USART_DATA_9BITS(Data));
1114                     ; 348   USART->CR1 &= ((uint8_t)~USART_CR1_T8);                    /* Clear the transmit data bit 8     */
1116  015d 721d5234      	bres	21044,#6
1117                     ; 349   USART->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8); /* Write the transmit data bit [8]   */
1119  0161 54            	srlw	x
1120  0162 54            	srlw	x
1121  0163 9f            	ld	a,xl
1122  0164 a440          	and	a,#64
1123  0166 ca5234        	or	a,21044
1124  0169 c75234        	ld	21044,a
1125                     ; 350   USART->DR   = (uint8_t)(Data);                             /* Write the transmit data bit [0:7] */
1127  016c 7b02          	ld	a,(OFST+2,sp)
1128  016e c75231        	ld	21041,a
1129                     ; 352 }
1132  0171 85            	popw	x
1133  0172 81            	ret
1167                     ; 360 void USART_SetAddress(uint8_t Address)
1167                     ; 361 {
1168                     	switch	.text
1169  0173               _USART_SetAddress:
1171  0173 88            	push	a
1172       00000000      OFST:	set	0
1175                     ; 363   assert_param(IS_USART_ADDRESS(Address));
1177                     ; 366   USART->CR4 &= ((uint8_t)~USART_CR4_ADD);
1179  0174 c65237        	ld	a,21047
1180  0177 a4f0          	and	a,#240
1181  0179 c75237        	ld	21047,a
1182                     ; 368   USART->CR4 |= Address;
1184  017c c65237        	ld	a,21047
1185  017f 1a01          	or	a,(OFST+1,sp)
1186  0181 c75237        	ld	21047,a
1187                     ; 369 }
1190  0184 84            	pop	a
1191  0185 81            	ret
1248                     ; 379 void USART_WakeUpConfig(USART_WakeUp_TypeDef USART_WakeUp)
1248                     ; 380 {
1249                     	switch	.text
1250  0186               _USART_WakeUpConfig:
1254                     ; 381   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1256                     ; 383   USART->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1258  0186 72175234      	bres	21044,#3
1259                     ; 384   USART->CR1 |= (uint8_t)USART_WakeUp;
1261  018a ca5234        	or	a,21044
1262  018d c75234        	ld	21044,a
1263                     ; 385 }
1266  0190 81            	ret
1402                     ; 400 FlagStatus USART_GetFlagStatus(USART_FLAG_TypeDef USART_FLAG)
1402                     ; 401 {
1403                     	switch	.text
1404  0191               _USART_GetFlagStatus:
1406  0191 89            	pushw	x
1407  0192 88            	push	a
1408       00000001      OFST:	set	1
1411                     ; 402   FlagStatus status = RESET;
1413                     ; 405   assert_param(IS_USART_FLAG(USART_FLAG));
1415                     ; 407   if (USART_FLAG == USART_FLAG_SBK)
1417  0193 a30101        	cpw	x,#257
1418  0196 2610          	jrne	L306
1419                     ; 409     if ((USART->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1421  0198 9f            	ld	a,xl
1422  0199 c45235        	and	a,21045
1423  019c 2706          	jreq	L506
1424                     ; 412       status = SET;
1426  019e a601          	ld	a,#1
1427  01a0 6b01          	ld	(OFST+0,sp),a
1430  01a2 2013          	jra	L116
1431  01a4               L506:
1432                     ; 417       status = RESET;
1434  01a4 0f01          	clr	(OFST+0,sp)
1436  01a6 200f          	jra	L116
1437  01a8               L306:
1438                     ; 422     if ((USART->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1440  01a8 c65230        	ld	a,21040
1441  01ab 1503          	bcp	a,(OFST+2,sp)
1442  01ad 2706          	jreq	L316
1443                     ; 425       status = SET;
1445  01af a601          	ld	a,#1
1446  01b1 6b01          	ld	(OFST+0,sp),a
1449  01b3 2002          	jra	L116
1450  01b5               L316:
1451                     ; 430       status = RESET;
1453  01b5 0f01          	clr	(OFST+0,sp)
1455  01b7               L116:
1456                     ; 434   return status;
1458  01b7 7b01          	ld	a,(OFST+0,sp)
1461  01b9 5b03          	addw	sp,#3
1462  01bb 81            	ret
1485                     ; 454 void USART_ClearFlag(void)
1485                     ; 455 {
1486                     	switch	.text
1487  01bc               _USART_ClearFlag:
1491                     ; 457   USART->SR = (uint8_t)~(USART_SR_RXNE);
1493  01bc 35df5230      	mov	21040,#223
1494                     ; 458 }
1497  01c0 81            	ret
1579                     ; 472 ITStatus USART_GetITStatus(USART_IT_TypeDef USART_IT)
1579                     ; 473 {
1580                     	switch	.text
1581  01c1               _USART_GetITStatus:
1583  01c1 89            	pushw	x
1584  01c2 89            	pushw	x
1585       00000002      OFST:	set	2
1588                     ; 474   ITStatus pendingbitstatus = RESET;
1590                     ; 475   uint8_t itpos = 0;
1592                     ; 476   uint8_t itmask1 = 0;
1594                     ; 477   uint8_t itmask2 = 0;
1596                     ; 478   uint8_t enablestatus = 0;
1598                     ; 481   assert_param(IS_USART_GET_IT(USART_IT));
1600                     ; 484   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
1602  01c3 9f            	ld	a,xl
1603  01c4 a40f          	and	a,#15
1604  01c6 5f            	clrw	x
1605  01c7 97            	ld	xl,a
1606  01c8 a601          	ld	a,#1
1607  01ca 5d            	tnzw	x
1608  01cb 2704          	jreq	L05
1609  01cd               L25:
1610  01cd 48            	sll	a
1611  01ce 5a            	decw	x
1612  01cf 26fc          	jrne	L25
1613  01d1               L05:
1614  01d1 6b01          	ld	(OFST-1,sp),a
1616                     ; 486   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
1618  01d3 7b04          	ld	a,(OFST+2,sp)
1619  01d5 4e            	swap	a
1620  01d6 a40f          	and	a,#15
1621  01d8 6b02          	ld	(OFST+0,sp),a
1623                     ; 488   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1625  01da 7b02          	ld	a,(OFST+0,sp)
1626  01dc 5f            	clrw	x
1627  01dd 97            	ld	xl,a
1628  01de a601          	ld	a,#1
1629  01e0 5d            	tnzw	x
1630  01e1 2704          	jreq	L45
1631  01e3               L65:
1632  01e3 48            	sll	a
1633  01e4 5a            	decw	x
1634  01e5 26fc          	jrne	L65
1635  01e7               L45:
1636  01e7 6b02          	ld	(OFST+0,sp),a
1638                     ; 492   if (USART_IT == USART_IT_PE)
1640  01e9 1e03          	ldw	x,(OFST+1,sp)
1641  01eb a30100        	cpw	x,#256
1642  01ee 261c          	jrne	L176
1643                     ; 495     enablestatus = (uint8_t)((uint8_t)USART->CR1 & itmask2);
1645  01f0 c65234        	ld	a,21044
1646  01f3 1402          	and	a,(OFST+0,sp)
1647  01f5 6b02          	ld	(OFST+0,sp),a
1649                     ; 498     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1651  01f7 c65230        	ld	a,21040
1652  01fa 1501          	bcp	a,(OFST-1,sp)
1653  01fc 270a          	jreq	L376
1655  01fe 0d02          	tnz	(OFST+0,sp)
1656  0200 2706          	jreq	L376
1657                     ; 501       pendingbitstatus = SET;
1659  0202 a601          	ld	a,#1
1660  0204 6b02          	ld	(OFST+0,sp),a
1663  0206 201e          	jra	L776
1664  0208               L376:
1665                     ; 506       pendingbitstatus = RESET;
1667  0208 0f02          	clr	(OFST+0,sp)
1669  020a 201a          	jra	L776
1670  020c               L176:
1671                     ; 512     enablestatus = (uint8_t)((uint8_t)USART->CR2 & itmask2);
1673  020c c65235        	ld	a,21045
1674  020f 1402          	and	a,(OFST+0,sp)
1675  0211 6b02          	ld	(OFST+0,sp),a
1677                     ; 514     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1679  0213 c65230        	ld	a,21040
1680  0216 1501          	bcp	a,(OFST-1,sp)
1681  0218 270a          	jreq	L107
1683  021a 0d02          	tnz	(OFST+0,sp)
1684  021c 2706          	jreq	L107
1685                     ; 517       pendingbitstatus = SET;
1687  021e a601          	ld	a,#1
1688  0220 6b02          	ld	(OFST+0,sp),a
1691  0222 2002          	jra	L776
1692  0224               L107:
1693                     ; 522       pendingbitstatus = RESET;
1695  0224 0f02          	clr	(OFST+0,sp)
1697  0226               L776:
1698                     ; 527   return  pendingbitstatus;
1700  0226 7b02          	ld	a,(OFST+0,sp)
1703  0228 5b04          	addw	sp,#4
1704  022a 81            	ret
1728                     ; 546 void USART_ClearITPendingBit(void)
1728                     ; 547 {
1729                     	switch	.text
1730  022b               _USART_ClearITPendingBit:
1734                     ; 549   USART->SR = (uint8_t)~(USART_SR_RXNE);
1736  022b 35df5230      	mov	21040,#223
1737                     ; 550 }
1740  022f 81            	ret
1753                     	xdef	_USART_ClearITPendingBit
1754                     	xdef	_USART_GetITStatus
1755                     	xdef	_USART_ClearFlag
1756                     	xdef	_USART_GetFlagStatus
1757                     	xdef	_USART_WakeUpConfig
1758                     	xdef	_USART_SetAddress
1759                     	xdef	_USART_SendData9
1760                     	xdef	_USART_SendData8
1761                     	xdef	_USART_SendBreak
1762                     	xdef	_USART_ReceiverWakeUpCmd
1763                     	xdef	_USART_ReceiveData9
1764                     	xdef	_USART_ReceiveData8
1765                     	xdef	_USART_ITConfig
1766                     	xdef	_USART_Cmd
1767                     	xdef	_USART_ClockInit
1768                     	xdef	_USART_Init
1769                     	xdef	_USART_DeInit
1770                     	xref	_CLK_GetClockFreq
1771                     	xref.b	c_lreg
1772                     	xref.b	c_x
1791                     	xref	c_lursh
1792                     	xref	c_ltor
1793                     	xref	c_rtol
1794                     	xref	c_ludv
1795                     	end
