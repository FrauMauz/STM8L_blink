   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 55 void EXTI_DeInit(void)
  42                     ; 56 {
  44                     	switch	.text
  45  0000               _EXTI_DeInit:
  49                     ; 57   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  51  0000 725f50a0      	clr	20640
  52                     ; 58   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  54  0004 725f50a1      	clr	20641
  55                     ; 59   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  57  0008 725f50a2      	clr	20642
  58                     ; 60   EXTI->SR1 = EXTI_SR1_RESET_VALUE;
  60  000c 725f50a3      	clr	20643
  61                     ; 61   EXTI->SR2 = EXTI_SR2_RESET_VALUE;
  63  0010 725f50a4      	clr	20644
  64                     ; 62   EXTI->CONF = EXTI_CONF_RESET_VALUE;
  66  0014 725f50a5      	clr	20645
  67                     ; 63 }
  70  0018 81            	ret
 174                     ; 84 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 174                     ; 85                              EXTI_Trigger_TypeDef EXTI_TriggerValue)
 174                     ; 86 {
 175                     	switch	.text
 176  0019               _EXTI_SetPortSensitivity:
 178  0019 89            	pushw	x
 179       00000000      OFST:	set	0
 182                     ; 89   assert_param(IS_EXTI_PORT(EXTI_Port));
 184                     ; 90   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 186                     ; 93   if (EXTI_Port != EXTI_Port_B)
 188  001a 9e            	ld	a,xh
 189  001b 4d            	tnz	a
 190  001c 270a          	jreq	L76
 191                     ; 95     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PDIS);
 193  001e c650a2        	ld	a,20642
 194  0021 a4f3          	and	a,#243
 195  0023 c750a2        	ld	20642,a
 197  0026 2008          	jra	L17
 198  0028               L76:
 199                     ; 99     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PBIS);
 201  0028 c650a2        	ld	a,20642
 202  002b a4fc          	and	a,#252
 203  002d c750a2        	ld	20642,a
 204  0030               L17:
 205                     ; 103   EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_Port);
 207  0030 7b01          	ld	a,(OFST+1,sp)
 208  0032 5f            	clrw	x
 209  0033 97            	ld	xl,a
 210  0034 7b02          	ld	a,(OFST+2,sp)
 211  0036 5d            	tnzw	x
 212  0037 2704          	jreq	L01
 213  0039               L21:
 214  0039 48            	sll	a
 215  003a 5a            	decw	x
 216  003b 26fc          	jrne	L21
 217  003d               L01:
 218  003d ca50a2        	or	a,20642
 219  0040 c750a2        	ld	20642,a
 220                     ; 105 }
 223  0043 85            	popw	x
 224  0044 81            	ret
 332                     ; 132 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum,
 332                     ; 133                             EXTI_Trigger_TypeDef EXTI_TriggerValue)
 332                     ; 134 {
 333                     	switch	.text
 334  0045               _EXTI_SetPinSensitivity:
 336  0045 89            	pushw	x
 337       00000000      OFST:	set	0
 340                     ; 137   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 342                     ; 138   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 344                     ; 141   switch (EXTI_PinNum)
 346  0046 9e            	ld	a,xh
 348                     ; 175     default:
 348                     ; 176       break;
 349  0047 4d            	tnz	a
 350  0048 272f          	jreq	L37
 351  004a a002          	sub	a,#2
 352  004c 274a          	jreq	L57
 353  004e a002          	sub	a,#2
 354  0050 2765          	jreq	L77
 355  0052 a002          	sub	a,#2
 356  0054 2603cc00d6    	jreq	L101
 357  0059 a00a          	sub	a,#10
 358  005b 2603          	jrne	L65
 359  005d cc00f3        	jp	L301
 360  0060               L65:
 361  0060 a002          	sub	a,#2
 362  0062 2603          	jrne	L06
 363  0064 cc0112        	jp	L501
 364  0067               L06:
 365  0067 a002          	sub	a,#2
 366  0069 2603          	jrne	L26
 367  006b cc0131        	jp	L701
 368  006e               L26:
 369  006e a002          	sub	a,#2
 370  0070 2603          	jrne	L46
 371  0072 cc0150        	jp	L111
 372  0075               L46:
 373  0075 ac6d016d      	jpf	L561
 374  0079               L37:
 375                     ; 143     case EXTI_Pin_0:
 375                     ; 144       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P0IS);
 377  0079 c650a0        	ld	a,20640
 378  007c a4fc          	and	a,#252
 379  007e c750a0        	ld	20640,a
 380                     ; 145       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 382  0081 7b01          	ld	a,(OFST+1,sp)
 383  0083 5f            	clrw	x
 384  0084 97            	ld	xl,a
 385  0085 7b02          	ld	a,(OFST+2,sp)
 386  0087 5d            	tnzw	x
 387  0088 2704          	jreq	L61
 388  008a               L02:
 389  008a 48            	sll	a
 390  008b 5a            	decw	x
 391  008c 26fc          	jrne	L02
 392  008e               L61:
 393  008e ca50a0        	or	a,20640
 394  0091 c750a0        	ld	20640,a
 395                     ; 146       break;
 397  0094 ac6d016d      	jpf	L561
 398  0098               L57:
 399                     ; 147     case EXTI_Pin_1:
 399                     ; 148       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P1IS);
 401  0098 c650a0        	ld	a,20640
 402  009b a4f3          	and	a,#243
 403  009d c750a0        	ld	20640,a
 404                     ; 149       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 406  00a0 7b01          	ld	a,(OFST+1,sp)
 407  00a2 5f            	clrw	x
 408  00a3 97            	ld	xl,a
 409  00a4 7b02          	ld	a,(OFST+2,sp)
 410  00a6 5d            	tnzw	x
 411  00a7 2704          	jreq	L22
 412  00a9               L42:
 413  00a9 48            	sll	a
 414  00aa 5a            	decw	x
 415  00ab 26fc          	jrne	L42
 416  00ad               L22:
 417  00ad ca50a0        	or	a,20640
 418  00b0 c750a0        	ld	20640,a
 419                     ; 150       break;
 421  00b3 ac6d016d      	jpf	L561
 422  00b7               L77:
 423                     ; 151     case EXTI_Pin_2:
 423                     ; 152       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P2IS);
 425  00b7 c650a0        	ld	a,20640
 426  00ba a4cf          	and	a,#207
 427  00bc c750a0        	ld	20640,a
 428                     ; 153       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 430  00bf 7b01          	ld	a,(OFST+1,sp)
 431  00c1 5f            	clrw	x
 432  00c2 97            	ld	xl,a
 433  00c3 7b02          	ld	a,(OFST+2,sp)
 434  00c5 5d            	tnzw	x
 435  00c6 2704          	jreq	L62
 436  00c8               L03:
 437  00c8 48            	sll	a
 438  00c9 5a            	decw	x
 439  00ca 26fc          	jrne	L03
 440  00cc               L62:
 441  00cc ca50a0        	or	a,20640
 442  00cf c750a0        	ld	20640,a
 443                     ; 154       break;
 445  00d2 ac6d016d      	jpf	L561
 446  00d6               L101:
 447                     ; 155     case EXTI_Pin_3:
 447                     ; 156       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P3IS);
 449  00d6 c650a0        	ld	a,20640
 450  00d9 a43f          	and	a,#63
 451  00db c750a0        	ld	20640,a
 452                     ; 157       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 454  00de 7b01          	ld	a,(OFST+1,sp)
 455  00e0 5f            	clrw	x
 456  00e1 97            	ld	xl,a
 457  00e2 7b02          	ld	a,(OFST+2,sp)
 458  00e4 5d            	tnzw	x
 459  00e5 2704          	jreq	L23
 460  00e7               L43:
 461  00e7 48            	sll	a
 462  00e8 5a            	decw	x
 463  00e9 26fc          	jrne	L43
 464  00eb               L23:
 465  00eb ca50a0        	or	a,20640
 466  00ee c750a0        	ld	20640,a
 467                     ; 158       break;
 469  00f1 207a          	jra	L561
 470  00f3               L301:
 471                     ; 159     case EXTI_Pin_4:
 471                     ; 160       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P4IS);
 473  00f3 c650a1        	ld	a,20641
 474  00f6 a4fc          	and	a,#252
 475  00f8 c750a1        	ld	20641,a
 476                     ; 161       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 478  00fb 7b01          	ld	a,(OFST+1,sp)
 479  00fd a4ef          	and	a,#239
 480  00ff 5f            	clrw	x
 481  0100 97            	ld	xl,a
 482  0101 7b02          	ld	a,(OFST+2,sp)
 483  0103 5d            	tnzw	x
 484  0104 2704          	jreq	L63
 485  0106               L04:
 486  0106 48            	sll	a
 487  0107 5a            	decw	x
 488  0108 26fc          	jrne	L04
 489  010a               L63:
 490  010a ca50a1        	or	a,20641
 491  010d c750a1        	ld	20641,a
 492                     ; 162       break;
 494  0110 205b          	jra	L561
 495  0112               L501:
 496                     ; 163     case EXTI_Pin_5:
 496                     ; 164       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P5IS);
 498  0112 c650a1        	ld	a,20641
 499  0115 a4f3          	and	a,#243
 500  0117 c750a1        	ld	20641,a
 501                     ; 165       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 503  011a 7b01          	ld	a,(OFST+1,sp)
 504  011c a4ef          	and	a,#239
 505  011e 5f            	clrw	x
 506  011f 97            	ld	xl,a
 507  0120 7b02          	ld	a,(OFST+2,sp)
 508  0122 5d            	tnzw	x
 509  0123 2704          	jreq	L24
 510  0125               L44:
 511  0125 48            	sll	a
 512  0126 5a            	decw	x
 513  0127 26fc          	jrne	L44
 514  0129               L24:
 515  0129 ca50a1        	or	a,20641
 516  012c c750a1        	ld	20641,a
 517                     ; 166       break;
 519  012f 203c          	jra	L561
 520  0131               L701:
 521                     ; 167     case EXTI_Pin_6:
 521                     ; 168       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P6IS);
 523  0131 c650a1        	ld	a,20641
 524  0134 a4cf          	and	a,#207
 525  0136 c750a1        	ld	20641,a
 526                     ; 169       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 528  0139 7b01          	ld	a,(OFST+1,sp)
 529  013b a4ef          	and	a,#239
 530  013d 5f            	clrw	x
 531  013e 97            	ld	xl,a
 532  013f 7b02          	ld	a,(OFST+2,sp)
 533  0141 5d            	tnzw	x
 534  0142 2704          	jreq	L64
 535  0144               L05:
 536  0144 48            	sll	a
 537  0145 5a            	decw	x
 538  0146 26fc          	jrne	L05
 539  0148               L64:
 540  0148 ca50a1        	or	a,20641
 541  014b c750a1        	ld	20641,a
 542                     ; 170       break;
 544  014e 201d          	jra	L561
 545  0150               L111:
 546                     ; 171     case EXTI_Pin_7:
 546                     ; 172       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P7IS);
 548  0150 c650a1        	ld	a,20641
 549  0153 a43f          	and	a,#63
 550  0155 c750a1        	ld	20641,a
 551                     ; 173       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 553  0158 7b01          	ld	a,(OFST+1,sp)
 554  015a a4ef          	and	a,#239
 555  015c 5f            	clrw	x
 556  015d 97            	ld	xl,a
 557  015e 7b02          	ld	a,(OFST+2,sp)
 558  0160 5d            	tnzw	x
 559  0161 2704          	jreq	L25
 560  0163               L45:
 561  0163 48            	sll	a
 562  0164 5a            	decw	x
 563  0165 26fc          	jrne	L45
 564  0167               L25:
 565  0167 ca50a1        	or	a,20641
 566  016a c750a1        	ld	20641,a
 567                     ; 174       break;
 569  016d               L311:
 570                     ; 175     default:
 570                     ; 176       break;
 572  016d               L561:
 573                     ; 178 }
 576  016d 85            	popw	x
 577  016e 81            	ret
 681                     ; 193 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 681                     ; 194                                FunctionalState NewState)
 681                     ; 195 {
 682                     	switch	.text
 683  016f               _EXTI_SetHalfPortSelection:
 685  016f 89            	pushw	x
 686       00000000      OFST:	set	0
 689                     ; 197   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 691                     ; 198   assert_param(IS_FUNCTIONAL_STATE(NewState));
 693                     ; 200   if (NewState != DISABLE)
 695  0170 9f            	ld	a,xl
 696  0171 4d            	tnz	a
 697  0172 2709          	jreq	L532
 698                     ; 202     EXTI->CONF |= (uint8_t)EXTI_HalfPort; /* Enable port interrupt selector */
 700  0174 9e            	ld	a,xh
 701  0175 ca50a5        	or	a,20645
 702  0178 c750a5        	ld	20645,a
 704  017b 2009          	jra	L732
 705  017d               L532:
 706                     ; 206     EXTI->CONF &= (uint8_t)(~(uint8_t)EXTI_HalfPort); /* Disable port interrupt selector */
 708  017d 7b01          	ld	a,(OFST+1,sp)
 709  017f 43            	cpl	a
 710  0180 c450a5        	and	a,20645
 711  0183 c750a5        	ld	20645,a
 712  0186               L732:
 713                     ; 208 }
 716  0186 85            	popw	x
 717  0187 81            	ret
 763                     ; 218 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
 763                     ; 219 {
 764                     	switch	.text
 765  0188               _EXTI_GetPortSensitivity:
 767  0188 88            	push	a
 768       00000001      OFST:	set	1
 771                     ; 220   uint8_t value = 0;
 773                     ; 223   assert_param(IS_EXTI_PORT(EXTI_Port));
 775                     ; 225   if (EXTI_Port != EXTI_Port_B)
 777  0189 4d            	tnz	a
 778  018a 270b          	jreq	L362
 779                     ; 227     value = (uint8_t)((EXTI->CR3 & EXTI_CR3_PDIS) >> 2);
 781  018c c650a2        	ld	a,20642
 782  018f 44            	srl	a
 783  0190 44            	srl	a
 784  0191 a403          	and	a,#3
 785  0193 6b01          	ld	(OFST+0,sp),a
 788  0195 2007          	jra	L562
 789  0197               L362:
 790                     ; 231     value = (uint8_t)(EXTI->CR3 & EXTI_CR3_PBIS);
 792  0197 c650a2        	ld	a,20642
 793  019a a403          	and	a,#3
 794  019c 6b01          	ld	(OFST+0,sp),a
 796  019e               L562:
 797                     ; 233   return((EXTI_Trigger_TypeDef)value);
 799  019e 7b01          	ld	a,(OFST+0,sp)
 802  01a0 5b01          	addw	sp,#1
 803  01a2 81            	ret
 849                     ; 250 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum)
 849                     ; 251 {
 850                     	switch	.text
 851  01a3               _EXTI_GetPinSensitivity:
 853  01a3 88            	push	a
 854       00000001      OFST:	set	1
 857                     ; 252   uint8_t value = 0;
 859  01a4 0f01          	clr	(OFST+0,sp)
 861                     ; 255   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 863                     ; 257   switch (EXTI_PinNum)
 866                     ; 283     default:
 866                     ; 284       break;
 867  01a6 4d            	tnz	a
 868  01a7 271e          	jreq	L762
 869  01a9 a002          	sub	a,#2
 870  01ab 2723          	jreq	L172
 871  01ad a002          	sub	a,#2
 872  01af 272a          	jreq	L372
 873  01b1 a002          	sub	a,#2
 874  01b3 2732          	jreq	L572
 875  01b5 a00a          	sub	a,#10
 876  01b7 273a          	jreq	L772
 877  01b9 a002          	sub	a,#2
 878  01bb 273f          	jreq	L103
 879  01bd a002          	sub	a,#2
 880  01bf 2746          	jreq	L303
 881  01c1 a002          	sub	a,#2
 882  01c3 274e          	jreq	L503
 883  01c5 2056          	jra	L533
 884  01c7               L762:
 885                     ; 259     case EXTI_Pin_0:
 885                     ; 260       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
 887  01c7 c650a0        	ld	a,20640
 888  01ca a403          	and	a,#3
 889  01cc 6b01          	ld	(OFST+0,sp),a
 891                     ; 261       break;
 893  01ce 204d          	jra	L533
 894  01d0               L172:
 895                     ; 262     case EXTI_Pin_1:
 895                     ; 263       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P1IS) >> (uint8_t)EXTI_Pin_1);
 897  01d0 c650a0        	ld	a,20640
 898  01d3 44            	srl	a
 899  01d4 44            	srl	a
 900  01d5 a403          	and	a,#3
 901  01d7 6b01          	ld	(OFST+0,sp),a
 903                     ; 264       break;
 905  01d9 2042          	jra	L533
 906  01db               L372:
 907                     ; 265     case EXTI_Pin_2:
 907                     ; 266       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P2IS) >> (uint8_t)EXTI_Pin_2);
 909  01db c650a0        	ld	a,20640
 910  01de 4e            	swap	a
 911  01df a40f          	and	a,#15
 912  01e1 a403          	and	a,#3
 913  01e3 6b01          	ld	(OFST+0,sp),a
 915                     ; 267       break;
 917  01e5 2036          	jra	L533
 918  01e7               L572:
 919                     ; 268     case EXTI_Pin_3:
 919                     ; 269       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P3IS) >> (uint8_t)EXTI_Pin_3);
 921  01e7 c650a0        	ld	a,20640
 922  01ea 4e            	swap	a
 923  01eb 44            	srl	a
 924  01ec 44            	srl	a
 925  01ed a403          	and	a,#3
 926  01ef 6b01          	ld	(OFST+0,sp),a
 928                     ; 270       break;
 930  01f1 202a          	jra	L533
 931  01f3               L772:
 932                     ; 271     case EXTI_Pin_4:
 932                     ; 272       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
 934  01f3 c650a1        	ld	a,20641
 935  01f6 a403          	and	a,#3
 936  01f8 6b01          	ld	(OFST+0,sp),a
 938                     ; 273       break;
 940  01fa 2021          	jra	L533
 941  01fc               L103:
 942                     ; 274     case EXTI_Pin_5:
 942                     ; 275       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
 944  01fc c650a1        	ld	a,20641
 945  01ff 44            	srl	a
 946  0200 44            	srl	a
 947  0201 a403          	and	a,#3
 948  0203 6b01          	ld	(OFST+0,sp),a
 950                     ; 276       break;
 952  0205 2016          	jra	L533
 953  0207               L303:
 954                     ; 277     case EXTI_Pin_6:
 954                     ; 278       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
 956  0207 c650a1        	ld	a,20641
 957  020a 4e            	swap	a
 958  020b a40f          	and	a,#15
 959  020d a403          	and	a,#3
 960  020f 6b01          	ld	(OFST+0,sp),a
 962                     ; 279       break;
 964  0211 200a          	jra	L533
 965  0213               L503:
 966                     ; 280     case EXTI_Pin_7:
 966                     ; 281       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
 968  0213 c650a1        	ld	a,20641
 969  0216 4e            	swap	a
 970  0217 44            	srl	a
 971  0218 44            	srl	a
 972  0219 a403          	and	a,#3
 973  021b 6b01          	ld	(OFST+0,sp),a
 975                     ; 282       break;
 977  021d               L703:
 978                     ; 283     default:
 978                     ; 284       break;
 980  021d               L533:
 981                     ; 286   return((EXTI_Trigger_TypeDef)value);
 983  021d 7b01          	ld	a,(OFST+0,sp)
 986  021f 5b01          	addw	sp,#1
 987  0221 81            	ret
1034                     ; 299 FunctionalState EXTI_GetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort)
1034                     ; 300 {
1035                     	switch	.text
1036  0222               _EXTI_GetHalfPortSelection:
1038  0222 88            	push	a
1039       00000001      OFST:	set	1
1042                     ; 301   FunctionalState value = DISABLE;
1044                     ; 303   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
1046                     ; 304   if ((EXTI->CONF & (uint8_t)EXTI_HalfPort) != (uint8_t)DISABLE)
1048  0223 c450a5        	and	a,20645
1049  0226 2706          	jreq	L163
1050                     ; 306     value = ENABLE;
1052  0228 a601          	ld	a,#1
1053  022a 6b01          	ld	(OFST+0,sp),a
1056  022c 2002          	jra	L363
1057  022e               L163:
1058                     ; 310     value = DISABLE;
1060  022e 0f01          	clr	(OFST+0,sp)
1062  0230               L363:
1063                     ; 313   return(value);
1065  0230 7b01          	ld	a,(OFST+0,sp)
1068  0232 5b01          	addw	sp,#1
1069  0234 81            	ret
1211                     ; 332 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1211                     ; 333 {
1212                     	switch	.text
1213  0235               _EXTI_GetITStatus:
1215  0235 88            	push	a
1216  0236 88            	push	a
1217       00000001      OFST:	set	1
1220                     ; 334   ITStatus status = RESET;
1222                     ; 336   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1224                     ; 338   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1226  0237 a4f0          	and	a,#240
1227  0239 a1f0          	cp	a,#240
1228  023b 260b          	jrne	L744
1229                     ; 340     status = (ITStatus)(EXTI->SR2 & ((uint8_t)EXTI_IT & (uint8_t)0x0F));
1231  023d 7b02          	ld	a,(OFST+1,sp)
1232  023f a40f          	and	a,#15
1233  0241 c450a4        	and	a,20644
1234  0244 6b01          	ld	(OFST+0,sp),a
1237  0246 2007          	jra	L154
1238  0248               L744:
1239                     ; 344     status = (ITStatus)(EXTI->SR1 & (uint8_t)EXTI_IT);
1241  0248 c650a3        	ld	a,20643
1242  024b 1402          	and	a,(OFST+1,sp)
1243  024d 6b01          	ld	(OFST+0,sp),a
1245  024f               L154:
1246                     ; 346   return((ITStatus)status);
1248  024f 7b01          	ld	a,(OFST+0,sp)
1251  0251 85            	popw	x
1252  0252 81            	ret
1288                     ; 365 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1288                     ; 366 {
1289                     	switch	.text
1290  0253               _EXTI_ClearITPendingBit:
1292  0253 88            	push	a
1293       00000000      OFST:	set	0
1296                     ; 368   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1298                     ; 370   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1300  0254 a4f0          	and	a,#240
1301  0256 a1f0          	cp	a,#240
1302  0258 2609          	jrne	L174
1303                     ; 372     EXTI->SR2 = (uint8_t)((uint8_t)EXTI_IT & (uint8_t)0x0F);
1305  025a 7b01          	ld	a,(OFST+1,sp)
1306  025c a40f          	and	a,#15
1307  025e c750a4        	ld	20644,a
1309  0261 2005          	jra	L374
1310  0263               L174:
1311                     ; 376     EXTI->SR1 = (uint8_t)EXTI_IT;
1313  0263 7b01          	ld	a,(OFST+1,sp)
1314  0265 c750a3        	ld	20643,a
1315  0268               L374:
1316                     ; 378 }
1319  0268 84            	pop	a
1320  0269 81            	ret
1333                     	xdef	_EXTI_ClearITPendingBit
1334                     	xdef	_EXTI_GetITStatus
1335                     	xdef	_EXTI_GetHalfPortSelection
1336                     	xdef	_EXTI_GetPinSensitivity
1337                     	xdef	_EXTI_GetPortSensitivity
1338                     	xdef	_EXTI_SetHalfPortSelection
1339                     	xdef	_EXTI_SetPinSensitivity
1340                     	xdef	_EXTI_SetPortSensitivity
1341                     	xdef	_EXTI_DeInit
1360                     	end
