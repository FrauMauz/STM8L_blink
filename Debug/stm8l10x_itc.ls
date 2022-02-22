   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 57 uint8_t ITC_GetCPUCC(void)
  42                     ; 58 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 60   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 61   _asm("pop a");
  57  0001 84            pop a
  59                     ; 62   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 76 void ITC_DeInit(void)
  85                     ; 77 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 78   ITC->ISPR1 = ITC_SPR1_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 79   ITC->ISPR2 = ITC_SPR2_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 80   ITC->ISPR3 = ITC_SPR3_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 81   ITC->ISPR4 = ITC_SPR4_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 82   ITC->ISPR5 = ITC_SPR5_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 83   ITC->ISPR6 = ITC_SPR6_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 84   ITC->ISPR7 = ITC_SPR7_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 85   ITC->ISPR8 = ITC_SPR8_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 86 }
 118  0023 81            	ret
 143                     ; 93 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 94 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 95   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 411                     .const:	section	.text
 412  0000               L22:
 413  0000 004d          	dc.w	L14
 414  0002 0093          	dc.w	L702
 415  0004 0093          	dc.w	L702
 416  0006 0056          	dc.w	L34
 417  0008 0093          	dc.w	L702
 418  000a 0056          	dc.w	L34
 419  000c 0056          	dc.w	L34
 420  000e 005f          	dc.w	L54
 421  0010 005f          	dc.w	L54
 422  0012 005f          	dc.w	L54
 423  0014 005f          	dc.w	L54
 424  0016 0068          	dc.w	L74
 425  0018 0068          	dc.w	L74
 426  001a 0068          	dc.w	L74
 427  001c 0068          	dc.w	L74
 428  001e 0093          	dc.w	L702
 429  0020 0093          	dc.w	L702
 430  0022 0071          	dc.w	L15
 431  0024 0071          	dc.w	L15
 432  0026 007a          	dc.w	L35
 433  0028 007a          	dc.w	L35
 434  002a 007a          	dc.w	L35
 435  002c 0093          	dc.w	L702
 436  002e 0093          	dc.w	L702
 437  0030 0083          	dc.w	L55
 438  0032 0083          	dc.w	L55
 439  0034 0083          	dc.w	L55
 440  0036 008c          	dc.w	L75
 441  0038 008c          	dc.w	L75
 442                     ; 126 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 442                     ; 127 {
 443                     	switch	.text
 444  0029               _ITC_GetSoftwarePriority:
 446  0029 88            	push	a
 447  002a 89            	pushw	x
 448       00000002      OFST:	set	2
 451                     ; 128   uint8_t Value = 0;
 453  002b 0f02          	clr	(OFST+0,sp)
 455                     ; 129   uint8_t Mask = 0;
 457                     ; 132   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 459                     ; 135   Mask = (uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U));
 461  002d a403          	and	a,#3
 462  002f 48            	sll	a
 463  0030 5f            	clrw	x
 464  0031 97            	ld	xl,a
 465  0032 a603          	ld	a,#3
 466  0034 5d            	tnzw	x
 467  0035 2704          	jreq	L41
 468  0037               L61:
 469  0037 48            	sll	a
 470  0038 5a            	decw	x
 471  0039 26fc          	jrne	L61
 472  003b               L41:
 473  003b 6b01          	ld	(OFST-1,sp),a
 475                     ; 137   switch (IRQn)
 477  003d 7b03          	ld	a,(OFST+1,sp)
 479                     ; 185     default:
 479                     ; 186       break;
 480  003f 4a            	dec	a
 481  0040 a11d          	cp	a,#29
 482  0042 2407          	jruge	L02
 483  0044 5f            	clrw	x
 484  0045 97            	ld	xl,a
 485  0046 58            	sllw	x
 486  0047 de0000        	ldw	x,(L22,x)
 487  004a fc            	jp	(x)
 488  004b               L02:
 489  004b 2046          	jra	L702
 490  004d               L14:
 491                     ; 139     case FLASH_IRQn:
 491                     ; 140       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 493  004d c67f70        	ld	a,32624
 494  0050 1401          	and	a,(OFST-1,sp)
 495  0052 6b02          	ld	(OFST+0,sp),a
 497                     ; 141       break;
 499  0054 203d          	jra	L702
 500  0056               L34:
 501                     ; 143     case AWU_IRQn:
 501                     ; 144     case EXTIB_IRQn:
 501                     ; 145     case EXTID_IRQn:
 501                     ; 146       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 503  0056 c67f71        	ld	a,32625
 504  0059 1401          	and	a,(OFST-1,sp)
 505  005b 6b02          	ld	(OFST+0,sp),a
 507                     ; 147       break;
 509  005d 2034          	jra	L702
 510  005f               L54:
 511                     ; 149     case EXTI0_IRQn:
 511                     ; 150     case EXTI1_IRQn:
 511                     ; 151     case EXTI2_IRQn:
 511                     ; 152     case EXTI3_IRQn:
 511                     ; 153       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 513  005f c67f72        	ld	a,32626
 514  0062 1401          	and	a,(OFST-1,sp)
 515  0064 6b02          	ld	(OFST+0,sp),a
 517                     ; 154       break;
 519  0066 202b          	jra	L702
 520  0068               L74:
 521                     ; 156     case EXTI4_IRQn:
 521                     ; 157     case EXTI5_IRQn:
 521                     ; 158     case EXTI6_IRQn:
 521                     ; 159     case EXTI7_IRQn:
 521                     ; 160       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 523  0068 c67f73        	ld	a,32627
 524  006b 1401          	and	a,(OFST-1,sp)
 525  006d 6b02          	ld	(OFST+0,sp),a
 527                     ; 161       break;
 529  006f 2022          	jra	L702
 530  0071               L15:
 531                     ; 163     case COMP_IRQn:
 531                     ; 164     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 531                     ; 165       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 533  0071 c67f74        	ld	a,32628
 534  0074 1401          	and	a,(OFST-1,sp)
 535  0076 6b02          	ld	(OFST+0,sp),a
 537                     ; 166       break;
 539  0078 2019          	jra	L702
 540  007a               L35:
 541                     ; 168     case TIM2_CAP_IRQn:
 541                     ; 169     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 541                     ; 170     case TIM3_CAP_IRQn:
 541                     ; 171       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 543  007a c67f75        	ld	a,32629
 544  007d 1401          	and	a,(OFST-1,sp)
 545  007f 6b02          	ld	(OFST+0,sp),a
 547                     ; 172       break;
 549  0081 2010          	jra	L702
 550  0083               L55:
 551                     ; 174     case TIM4_UPD_OVF_IRQn:
 551                     ; 175     case SPI_IRQn:
 551                     ; 176     case USART_TX_IRQn:
 551                     ; 177       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 553  0083 c67f76        	ld	a,32630
 554  0086 1401          	and	a,(OFST-1,sp)
 555  0088 6b02          	ld	(OFST+0,sp),a
 557                     ; 178       break;
 559  008a 2007          	jra	L702
 560  008c               L75:
 561                     ; 180     case USART_RX_IRQn:
 561                     ; 181     case I2C_IRQn:
 561                     ; 182       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 563  008c c67f77        	ld	a,32631
 564  008f 1401          	and	a,(OFST-1,sp)
 565  0091 6b02          	ld	(OFST+0,sp),a
 567                     ; 183       break;
 569  0093               L16:
 570                     ; 185     default:
 570                     ; 186       break;
 572  0093               L702:
 573                     ; 189   Value >>= (uint8_t)(((uint8_t)IRQn % 4u) * 2u);
 575  0093 7b03          	ld	a,(OFST+1,sp)
 576  0095 a403          	and	a,#3
 577  0097 48            	sll	a
 578  0098 5f            	clrw	x
 579  0099 97            	ld	xl,a
 580  009a 7b02          	ld	a,(OFST+0,sp)
 581  009c 5d            	tnzw	x
 582  009d 2704          	jreq	L42
 583  009f               L62:
 584  009f 44            	srl	a
 585  00a0 5a            	decw	x
 586  00a1 26fc          	jrne	L62
 587  00a3               L42:
 588  00a3 6b02          	ld	(OFST+0,sp),a
 590                     ; 191   return((ITC_PriorityLevel_TypeDef)Value);
 592  00a5 7b02          	ld	a,(OFST+0,sp)
 595  00a7 5b03          	addw	sp,#3
 596  00a9 81            	ret
 660                     	switch	.const
 661  003a               L44:
 662  003a 00e2          	dc.w	L112
 663  003c 0170          	dc.w	L762
 664  003e 0170          	dc.w	L762
 665  0040 00f4          	dc.w	L312
 666  0042 0170          	dc.w	L762
 667  0044 00f4          	dc.w	L312
 668  0046 00f4          	dc.w	L312
 669  0048 0106          	dc.w	L512
 670  004a 0106          	dc.w	L512
 671  004c 0106          	dc.w	L512
 672  004e 0106          	dc.w	L512
 673  0050 0118          	dc.w	L712
 674  0052 0118          	dc.w	L712
 675  0054 0118          	dc.w	L712
 676  0056 0118          	dc.w	L712
 677  0058 0170          	dc.w	L762
 678  005a 0170          	dc.w	L762
 679  005c 012a          	dc.w	L122
 680  005e 012a          	dc.w	L122
 681  0060 013c          	dc.w	L322
 682  0062 013c          	dc.w	L322
 683  0064 013c          	dc.w	L322
 684  0066 0170          	dc.w	L762
 685  0068 0170          	dc.w	L762
 686  006a 014e          	dc.w	L522
 687  006c 014e          	dc.w	L522
 688  006e 014e          	dc.w	L522
 689  0070 0160          	dc.w	L722
 690  0072 0160          	dc.w	L722
 691                     ; 234 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 691                     ; 235 {
 692                     	switch	.text
 693  00aa               _ITC_SetSoftwarePriority:
 695  00aa 89            	pushw	x
 696  00ab 89            	pushw	x
 697       00000002      OFST:	set	2
 700                     ; 236   uint8_t Mask = 0;
 702                     ; 237   uint8_t NewPriority = 0;
 704                     ; 240   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 706                     ; 241   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 708                     ; 244   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 710                     ; 248   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U)));
 712  00ac 9e            	ld	a,xh
 713  00ad a403          	and	a,#3
 714  00af 48            	sll	a
 715  00b0 5f            	clrw	x
 716  00b1 97            	ld	xl,a
 717  00b2 a603          	ld	a,#3
 718  00b4 5d            	tnzw	x
 719  00b5 2704          	jreq	L23
 720  00b7               L43:
 721  00b7 48            	sll	a
 722  00b8 5a            	decw	x
 723  00b9 26fc          	jrne	L43
 724  00bb               L23:
 725  00bb 43            	cpl	a
 726  00bc 6b01          	ld	(OFST-1,sp),a
 728                     ; 251   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << (((uint8_t)IRQn % 4U) * 2U));
 730  00be 7b03          	ld	a,(OFST+1,sp)
 731  00c0 a403          	and	a,#3
 732  00c2 48            	sll	a
 733  00c3 5f            	clrw	x
 734  00c4 97            	ld	xl,a
 735  00c5 7b04          	ld	a,(OFST+2,sp)
 736  00c7 5d            	tnzw	x
 737  00c8 2704          	jreq	L63
 738  00ca               L04:
 739  00ca 48            	sll	a
 740  00cb 5a            	decw	x
 741  00cc 26fc          	jrne	L04
 742  00ce               L63:
 743  00ce 6b02          	ld	(OFST+0,sp),a
 745                     ; 253   switch (IRQn)
 747  00d0 7b03          	ld	a,(OFST+1,sp)
 749                     ; 309     default:
 749                     ; 310       break;
 750  00d2 4a            	dec	a
 751  00d3 a11d          	cp	a,#29
 752  00d5 2407          	jruge	L24
 753  00d7 5f            	clrw	x
 754  00d8 97            	ld	xl,a
 755  00d9 58            	sllw	x
 756  00da de003a        	ldw	x,(L44,x)
 757  00dd fc            	jp	(x)
 758  00de               L24:
 759  00de ac700170      	jpf	L762
 760  00e2               L112:
 761                     ; 255     case FLASH_IRQn:
 761                     ; 256       ITC->ISPR1 &= Mask;
 763  00e2 c67f70        	ld	a,32624
 764  00e5 1401          	and	a,(OFST-1,sp)
 765  00e7 c77f70        	ld	32624,a
 766                     ; 257       ITC->ISPR1 |= NewPriority;
 768  00ea c67f70        	ld	a,32624
 769  00ed 1a02          	or	a,(OFST+0,sp)
 770  00ef c77f70        	ld	32624,a
 771                     ; 258       break;
 773  00f2 207c          	jra	L762
 774  00f4               L312:
 775                     ; 260     case AWU_IRQn:
 775                     ; 261     case EXTIB_IRQn:
 775                     ; 262     case EXTID_IRQn:
 775                     ; 263       ITC->ISPR2 &= Mask;
 777  00f4 c67f71        	ld	a,32625
 778  00f7 1401          	and	a,(OFST-1,sp)
 779  00f9 c77f71        	ld	32625,a
 780                     ; 264       ITC->ISPR2 |= NewPriority;
 782  00fc c67f71        	ld	a,32625
 783  00ff 1a02          	or	a,(OFST+0,sp)
 784  0101 c77f71        	ld	32625,a
 785                     ; 265       break;
 787  0104 206a          	jra	L762
 788  0106               L512:
 789                     ; 267     case EXTI0_IRQn:
 789                     ; 268     case EXTI1_IRQn:
 789                     ; 269     case EXTI2_IRQn:
 789                     ; 270     case EXTI3_IRQn:
 789                     ; 271       ITC->ISPR3 &= Mask;
 791  0106 c67f72        	ld	a,32626
 792  0109 1401          	and	a,(OFST-1,sp)
 793  010b c77f72        	ld	32626,a
 794                     ; 272       ITC->ISPR3 |= NewPriority;
 796  010e c67f72        	ld	a,32626
 797  0111 1a02          	or	a,(OFST+0,sp)
 798  0113 c77f72        	ld	32626,a
 799                     ; 273       break;
 801  0116 2058          	jra	L762
 802  0118               L712:
 803                     ; 275     case EXTI4_IRQn:
 803                     ; 276     case EXTI5_IRQn:
 803                     ; 277     case EXTI6_IRQn:
 803                     ; 278     case EXTI7_IRQn:
 803                     ; 279       ITC->ISPR4 &= Mask;
 805  0118 c67f73        	ld	a,32627
 806  011b 1401          	and	a,(OFST-1,sp)
 807  011d c77f73        	ld	32627,a
 808                     ; 280       ITC->ISPR4 |= NewPriority;
 810  0120 c67f73        	ld	a,32627
 811  0123 1a02          	or	a,(OFST+0,sp)
 812  0125 c77f73        	ld	32627,a
 813                     ; 281       break;
 815  0128 2046          	jra	L762
 816  012a               L122:
 817                     ; 283     case COMP_IRQn:
 817                     ; 284     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 817                     ; 285       ITC->ISPR5 &= Mask;
 819  012a c67f74        	ld	a,32628
 820  012d 1401          	and	a,(OFST-1,sp)
 821  012f c77f74        	ld	32628,a
 822                     ; 286       ITC->ISPR5 |= NewPriority;
 824  0132 c67f74        	ld	a,32628
 825  0135 1a02          	or	a,(OFST+0,sp)
 826  0137 c77f74        	ld	32628,a
 827                     ; 287       break;
 829  013a 2034          	jra	L762
 830  013c               L322:
 831                     ; 289     case TIM2_CAP_IRQn:
 831                     ; 290     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 831                     ; 291     case TIM3_CAP_IRQn:
 831                     ; 292       ITC->ISPR6 &= Mask;
 833  013c c67f75        	ld	a,32629
 834  013f 1401          	and	a,(OFST-1,sp)
 835  0141 c77f75        	ld	32629,a
 836                     ; 293       ITC->ISPR6 |= NewPriority;
 838  0144 c67f75        	ld	a,32629
 839  0147 1a02          	or	a,(OFST+0,sp)
 840  0149 c77f75        	ld	32629,a
 841                     ; 294       break;
 843  014c 2022          	jra	L762
 844  014e               L522:
 845                     ; 296     case TIM4_UPD_OVF_IRQn:
 845                     ; 297     case SPI_IRQn:
 845                     ; 298     case USART_TX_IRQn:
 845                     ; 299       ITC->ISPR7 &= Mask;
 847  014e c67f76        	ld	a,32630
 848  0151 1401          	and	a,(OFST-1,sp)
 849  0153 c77f76        	ld	32630,a
 850                     ; 300       ITC->ISPR7 |= NewPriority;
 852  0156 c67f76        	ld	a,32630
 853  0159 1a02          	or	a,(OFST+0,sp)
 854  015b c77f76        	ld	32630,a
 855                     ; 301       break;
 857  015e 2010          	jra	L762
 858  0160               L722:
 859                     ; 303     case USART_RX_IRQn:
 859                     ; 304     case I2C_IRQn:
 859                     ; 305       ITC->ISPR8 &= Mask;
 861  0160 c67f77        	ld	a,32631
 862  0163 1401          	and	a,(OFST-1,sp)
 863  0165 c77f77        	ld	32631,a
 864                     ; 306       ITC->ISPR8 |= NewPriority;
 866  0168 c67f77        	ld	a,32631
 867  016b 1a02          	or	a,(OFST+0,sp)
 868  016d c77f77        	ld	32631,a
 869                     ; 307       break;
 871  0170               L132:
 872                     ; 309     default:
 872                     ; 310       break;
 874  0170               L762:
 875                     ; 312 }
 878  0170 5b04          	addw	sp,#4
 879  0172 81            	ret
 892                     	xdef	_ITC_SetSoftwarePriority
 893                     	xdef	_ITC_GetSoftwarePriority
 894                     	xdef	_ITC_GetSoftIntStatus
 895                     	xdef	_ITC_DeInit
 896                     	xdef	_ITC_GetCPUCC
 915                     	end
