   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 108                     ; 57 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 108                     ; 58 {
 110                     	switch	.text
 111  0000               _GPIO_DeInit:
 115                     ; 59   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 117  0000 7f            	clr	(x)
 118                     ; 60   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 120  0001 6f02          	clr	(2,x)
 121                     ; 61   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 123  0003 6f03          	clr	(3,x)
 124                     ; 62   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 126  0005 6f04          	clr	(4,x)
 127                     ; 63 }
 130  0007 81            	ret
 286                     ; 98 void GPIO_Init(GPIO_TypeDef* GPIOx,
 286                     ; 99                uint8_t GPIO_Pin,
 286                     ; 100                GPIO_Mode_TypeDef GPIO_Mode)
 286                     ; 101 {
 287                     	switch	.text
 288  0008               _GPIO_Init:
 290  0008 89            	pushw	x
 291       00000000      OFST:	set	0
 294                     ; 106   assert_param(IS_GPIO_MODE(GPIO_Mode));
 296                     ; 107   assert_param(IS_GPIO_PIN(GPIO_Pin));
 298                     ; 113   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 300  0009 7b06          	ld	a,(OFST+6,sp)
 301  000b a580          	bcp	a,#128
 302  000d 271d          	jreq	L541
 303                     ; 115     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 305  000f 7b06          	ld	a,(OFST+6,sp)
 306  0011 a510          	bcp	a,#16
 307  0013 2706          	jreq	L741
 308                     ; 117       GPIOx->ODR |= GPIO_Pin;
 310  0015 f6            	ld	a,(x)
 311  0016 1a05          	or	a,(OFST+5,sp)
 312  0018 f7            	ld	(x),a
 314  0019 2007          	jra	L151
 315  001b               L741:
 316                     ; 120       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 318  001b 1e01          	ldw	x,(OFST+1,sp)
 319  001d 7b05          	ld	a,(OFST+5,sp)
 320  001f 43            	cpl	a
 321  0020 f4            	and	a,(x)
 322  0021 f7            	ld	(x),a
 323  0022               L151:
 324                     ; 123     GPIOx->DDR |= GPIO_Pin;
 326  0022 1e01          	ldw	x,(OFST+1,sp)
 327  0024 e602          	ld	a,(2,x)
 328  0026 1a05          	or	a,(OFST+5,sp)
 329  0028 e702          	ld	(2,x),a
 331  002a 2009          	jra	L351
 332  002c               L541:
 333                     ; 127     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 335  002c 1e01          	ldw	x,(OFST+1,sp)
 336  002e 7b05          	ld	a,(OFST+5,sp)
 337  0030 43            	cpl	a
 338  0031 e402          	and	a,(2,x)
 339  0033 e702          	ld	(2,x),a
 340  0035               L351:
 341                     ; 134   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 343  0035 7b06          	ld	a,(OFST+6,sp)
 344  0037 a540          	bcp	a,#64
 345  0039 270a          	jreq	L551
 346                     ; 136     GPIOx->CR1 |= GPIO_Pin;
 348  003b 1e01          	ldw	x,(OFST+1,sp)
 349  003d e603          	ld	a,(3,x)
 350  003f 1a05          	or	a,(OFST+5,sp)
 351  0041 e703          	ld	(3,x),a
 353  0043 2009          	jra	L751
 354  0045               L551:
 355                     ; 139     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 357  0045 1e01          	ldw	x,(OFST+1,sp)
 358  0047 7b05          	ld	a,(OFST+5,sp)
 359  0049 43            	cpl	a
 360  004a e403          	and	a,(3,x)
 361  004c e703          	ld	(3,x),a
 362  004e               L751:
 363                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 365  004e 7b06          	ld	a,(OFST+6,sp)
 366  0050 a520          	bcp	a,#32
 367  0052 270a          	jreq	L161
 368                     ; 148     GPIOx->CR2 |= GPIO_Pin;
 370  0054 1e01          	ldw	x,(OFST+1,sp)
 371  0056 e604          	ld	a,(4,x)
 372  0058 1a05          	or	a,(OFST+5,sp)
 373  005a e704          	ld	(4,x),a
 375  005c 2009          	jra	L361
 376  005e               L161:
 377                     ; 151     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 379  005e 1e01          	ldw	x,(OFST+1,sp)
 380  0060 7b05          	ld	a,(OFST+5,sp)
 381  0062 43            	cpl	a
 382  0063 e404          	and	a,(4,x)
 383  0065 e704          	ld	(4,x),a
 384  0067               L361:
 385                     ; 154 }
 388  0067 85            	popw	x
 389  0068 81            	ret
 435                     ; 163 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 435                     ; 164 {
 436                     	switch	.text
 437  0069               _GPIO_Write:
 439  0069 89            	pushw	x
 440       00000000      OFST:	set	0
 443                     ; 165   GPIOx->ODR = GPIO_PortVal;
 445  006a 7b05          	ld	a,(OFST+5,sp)
 446  006c 1e01          	ldw	x,(OFST+1,sp)
 447  006e f7            	ld	(x),a
 448                     ; 166 }
 451  006f 85            	popw	x
 452  0070 81            	ret
 612                     ; 185 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 612                     ; 186 {
 613                     	switch	.text
 614  0071               _GPIO_WriteBit:
 616  0071 89            	pushw	x
 617       00000000      OFST:	set	0
 620                     ; 188   assert_param(IS_GPIO_PIN(GPIO_Pin));
 622                     ; 189   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 624                     ; 191   if (GPIO_BitVal != RESET)
 626  0072 0d06          	tnz	(OFST+6,sp)
 627  0074 2715          	jreq	L303
 628                     ; 193     SetBit(GPIOx->ODR, GPIO_Pin);
 630  0076 7b05          	ld	a,(OFST+5,sp)
 631  0078 905f          	clrw	y
 632  007a 9097          	ld	yl,a
 633  007c a601          	ld	a,#1
 634  007e 905d          	tnzw	y
 635  0080 2705          	jreq	L41
 636  0082               L61:
 637  0082 48            	sll	a
 638  0083 905a          	decw	y
 639  0085 26fb          	jrne	L61
 640  0087               L41:
 641  0087 fa            	or	a,(x)
 642  0088 f7            	ld	(x),a
 644  0089 2017          	jra	L503
 645  008b               L303:
 646                     ; 198     ClrBit(GPIOx->ODR, GPIO_Pin);
 648  008b 1e01          	ldw	x,(OFST+1,sp)
 649  008d 7b05          	ld	a,(OFST+5,sp)
 650  008f 905f          	clrw	y
 651  0091 9097          	ld	yl,a
 652  0093 a601          	ld	a,#1
 653  0095 905d          	tnzw	y
 654  0097 2705          	jreq	L02
 655  0099               L22:
 656  0099 48            	sll	a
 657  009a 905a          	decw	y
 658  009c 26fb          	jrne	L22
 659  009e               L02:
 660  009e a8ff          	xor	a,#255
 661  00a0 f4            	and	a,(x)
 662  00a1 f7            	ld	(x),a
 663  00a2               L503:
 664                     ; 200 }
 667  00a2 85            	popw	x
 668  00a3 81            	ret
 714                     ; 218 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 714                     ; 219 {
 715                     	switch	.text
 716  00a4               _GPIO_SetBits:
 718  00a4 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 220   GPIOx->ODR |= GPIO_Pin;
 724  00a5 f6            	ld	a,(x)
 725  00a6 1a05          	or	a,(OFST+5,sp)
 726  00a8 f7            	ld	(x),a
 727                     ; 221 }
 730  00a9 85            	popw	x
 731  00aa 81            	ret
 777                     ; 239 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 777                     ; 240 {
 778                     	switch	.text
 779  00ab               _GPIO_ResetBits:
 781  00ab 89            	pushw	x
 782       00000000      OFST:	set	0
 785                     ; 241   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 787  00ac 7b05          	ld	a,(OFST+5,sp)
 788  00ae 43            	cpl	a
 789  00af f4            	and	a,(x)
 790  00b0 f7            	ld	(x),a
 791                     ; 242 }
 794  00b1 85            	popw	x
 795  00b2 81            	ret
 841                     ; 251 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 841                     ; 252 {
 842                     	switch	.text
 843  00b3               _GPIO_ToggleBits:
 845  00b3 89            	pushw	x
 846       00000000      OFST:	set	0
 849                     ; 253   GPIOx->ODR ^= GPIO_Pin;
 851  00b4 f6            	ld	a,(x)
 852  00b5 1805          	xor	a,(OFST+5,sp)
 853  00b7 f7            	ld	(x),a
 854                     ; 254 }
 857  00b8 85            	popw	x
 858  00b9 81            	ret
 895                     ; 262 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 895                     ; 263 {
 896                     	switch	.text
 897  00ba               _GPIO_ReadInputData:
 901                     ; 264   return ((uint8_t)GPIOx->IDR);
 903  00ba e601          	ld	a,(1,x)
 906  00bc 81            	ret
 944                     ; 273 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 944                     ; 274 {
 945                     	switch	.text
 946  00bd               _GPIO_ReadOutputData:
 950                     ; 275   return ((uint8_t)GPIOx->ODR);
 952  00bd f6            	ld	a,(x)
 955  00be 81            	ret
1004                     ; 294 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1004                     ; 295 {
1005                     	switch	.text
1006  00bf               _GPIO_ReadInputDataBit:
1008  00bf 89            	pushw	x
1009       00000000      OFST:	set	0
1012                     ; 296   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1014  00c0 e601          	ld	a,(1,x)
1015  00c2 1405          	and	a,(OFST+5,sp)
1018  00c4 85            	popw	x
1019  00c5 81            	ret
1068                     ; 315 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1068                     ; 316 {
1069                     	switch	.text
1070  00c6               _GPIO_ReadOutputDataBit:
1072  00c6 89            	pushw	x
1073       00000000      OFST:	set	0
1076                     ; 317   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1078  00c7 f6            	ld	a,(x)
1079  00c8 1405          	and	a,(OFST+5,sp)
1082  00ca 85            	popw	x
1083  00cb 81            	ret
1160                     ; 337 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1160                     ; 338 {
1161                     	switch	.text
1162  00cc               _GPIO_ExternalPullUpConfig:
1164  00cc 89            	pushw	x
1165       00000000      OFST:	set	0
1168                     ; 340   assert_param(IS_GPIO_PIN(GPIO_Pin));
1170                     ; 341   assert_param(IS_FUNCTIONAL_STATE(NewState));
1172                     ; 343   if (NewState != DISABLE) /* External Pull-Up Set*/
1174  00cd 0d06          	tnz	(OFST+6,sp)
1175  00cf 2708          	jreq	L355
1176                     ; 345     GPIOx->CR1 |= GPIO_Pin;
1178  00d1 e603          	ld	a,(3,x)
1179  00d3 1a05          	or	a,(OFST+5,sp)
1180  00d5 e703          	ld	(3,x),a
1182  00d7 2009          	jra	L555
1183  00d9               L355:
1184                     ; 348     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1186  00d9 1e01          	ldw	x,(OFST+1,sp)
1187  00db 7b05          	ld	a,(OFST+5,sp)
1188  00dd 43            	cpl	a
1189  00de e403          	and	a,(3,x)
1190  00e0 e703          	ld	(3,x),a
1191  00e2               L555:
1192                     ; 350 }
1195  00e2 85            	popw	x
1196  00e3 81            	ret
1209                     	xdef	_GPIO_ExternalPullUpConfig
1210                     	xdef	_GPIO_ReadOutputDataBit
1211                     	xdef	_GPIO_ReadInputDataBit
1212                     	xdef	_GPIO_ReadOutputData
1213                     	xdef	_GPIO_ReadInputData
1214                     	xdef	_GPIO_ToggleBits
1215                     	xdef	_GPIO_ResetBits
1216                     	xdef	_GPIO_SetBits
1217                     	xdef	_GPIO_WriteBit
1218                     	xdef	_GPIO_Write
1219                     	xdef	_GPIO_Init
1220                     	xdef	_GPIO_DeInit
1239                     	end
