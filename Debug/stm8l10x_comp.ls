   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 57 void COMP_DeInit(void)
  42                     ; 58 {
  44                     	switch	.text
  45  0000               _COMP_DeInit:
  49                     ; 59   COMP->CR   = COMP_CR_RESET_VALUE;
  51  0000 725f5300      	clr	21248
  52                     ; 60   COMP->CSR  = COMP_CSR_RESET_VALUE;
  54  0004 35505301      	mov	21249,#80
  55                     ; 61   COMP->CCS  = COMP_CCS_RESET_VALUE;
  57  0008 725f5302      	clr	21250
  58                     ; 62 }
  61  000c 81            	ret
 195                     ; 85 void COMP_Init(COMP_Selection_TypeDef COMP_Selection,
 195                     ; 86                COMP_Reference_TypeDef COMP_Reference,
 195                     ; 87                COMP_Polarity_TypeDef COMP_Polarity)
 195                     ; 88 {
 196                     	switch	.text
 197  000d               _COMP_Init:
 199  000d 89            	pushw	x
 200       00000000      OFST:	set	0
 203                     ; 90   assert_param(IS_COMP_POLARITY(COMP_Polarity));
 205                     ; 91   assert_param(IS_COMP_REFERENCE(COMP_Reference));
 207                     ; 92   assert_param(IS_COMP_SELECTION(COMP_Selection));
 209                     ; 94   COMP->CR &= (uint8_t)(~((uint8_t)COMP_Polarity | (uint8_t)COMP_Reference | (uint8_t)COMP_Selection));
 211  000e 9f            	ld	a,xl
 212  000f 1a05          	or	a,(OFST+5,sp)
 213  0011 1a01          	or	a,(OFST+1,sp)
 214  0013 43            	cpl	a
 215  0014 c45300        	and	a,21248
 216  0017 c75300        	ld	21248,a
 217                     ; 96   COMP->CR |= (uint8_t)((uint8_t)COMP_Polarity | (uint8_t)COMP_Reference | (uint8_t)COMP_Selection);
 219  001a 7b05          	ld	a,(OFST+5,sp)
 220  001c 1a02          	or	a,(OFST+2,sp)
 221  001e 1a01          	or	a,(OFST+1,sp)
 222  0020 ca5300        	or	a,21248
 223  0023 c75300        	ld	21248,a
 224                     ; 98 }
 227  0026 85            	popw	x
 228  0027 81            	ret
 283                     ; 106 void COMP_Cmd(FunctionalState NewState)
 283                     ; 107 {
 284                     	switch	.text
 285  0028               _COMP_Cmd:
 289                     ; 109   assert_param(IS_FUNCTIONAL_STATE(NewState));
 291                     ; 111   if (NewState != DISABLE)
 293  0028 4d            	tnz	a
 294  0029 2706          	jreq	L131
 295                     ; 114     COMP->CR |= COMP_CR_BIASEN;
 297  002b 72105300      	bset	21248,#0
 299  002f 2004          	jra	L331
 300  0031               L131:
 301                     ; 118     COMP->CR &= (uint8_t)(~COMP_CR_BIASEN);
 303  0031 72115300      	bres	21248,#0
 304  0035               L331:
 305                     ; 120 }
 308  0035 81            	ret
 354                     ; 134 void COMP_SelectionConfig(COMP_Selection_TypeDef COMP_Selection,
 354                     ; 135                           FunctionalState NewState)
 354                     ; 136 {
 355                     	switch	.text
 356  0036               _COMP_SelectionConfig:
 358  0036 89            	pushw	x
 359       00000000      OFST:	set	0
 362                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 364                     ; 139   assert_param(IS_COMP_SELECTION(COMP_Selection));
 366                     ; 141   if (NewState != DISABLE)
 368  0037 9f            	ld	a,xl
 369  0038 4d            	tnz	a
 370  0039 2709          	jreq	L751
 371                     ; 143     COMP->CR |= (uint8_t)COMP_Selection;
 373  003b 9e            	ld	a,xh
 374  003c ca5300        	or	a,21248
 375  003f c75300        	ld	21248,a
 377  0042 2009          	jra	L161
 378  0044               L751:
 379                     ; 147     COMP->CR &= (uint8_t)(~(uint8_t)COMP_Selection);
 381  0044 7b01          	ld	a,(OFST+1,sp)
 382  0046 43            	cpl	a
 383  0047 c45300        	and	a,21248
 384  004a c75300        	ld	21248,a
 385  004d               L161:
 386                     ; 149 }
 389  004d 85            	popw	x
 390  004e 81            	ret
 469                     ; 162 void COMP_ITConfig(COMP_IT_TypeDef COMP_IT,
 469                     ; 163                    FunctionalState NewState)
 469                     ; 164 {
 470                     	switch	.text
 471  004f               _COMP_ITConfig:
 473  004f 89            	pushw	x
 474       00000000      OFST:	set	0
 477                     ; 166   assert_param(IS_COMP_IT(COMP_IT));
 479                     ; 167   assert_param(IS_FUNCTIONAL_STATE(NewState));
 481                     ; 169   if (NewState != DISABLE)
 483  0050 9f            	ld	a,xl
 484  0051 4d            	tnz	a
 485  0052 2709          	jreq	L122
 486                     ; 172     COMP->CSR |= (uint8_t)COMP_IT;
 488  0054 9e            	ld	a,xh
 489  0055 ca5301        	or	a,21249
 490  0058 c75301        	ld	21249,a
 492  005b 2009          	jra	L322
 493  005d               L122:
 494                     ; 177     COMP->CSR &= (uint8_t)(~(uint8_t)COMP_IT);
 496  005d 7b01          	ld	a,(OFST+1,sp)
 497  005f 43            	cpl	a
 498  0060 c45301        	and	a,21249
 499  0063 c75301        	ld	21249,a
 500  0066               L322:
 501                     ; 179 }
 504  0066 85            	popw	x
 505  0067 81            	ret
 561                     ; 189 void COMP_TIM2Config(COMP_TIM2Config_TypeDef COMP_TIM2Config)
 561                     ; 190 {
 562                     	switch	.text
 563  0068               _COMP_TIM2Config:
 567                     ; 192   assert_param(IS_COMP_TIM2CONFIG(COMP_TIM2Config));
 569                     ; 195   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_IC1BK);
 571  0068 721f5300      	bres	21248,#7
 572                     ; 198   COMP->CR |= (uint8_t)COMP_TIM2Config;
 574  006c ca5300        	or	a,21248
 575  006f c75300        	ld	21248,a
 576                     ; 199 }
 579  0072 81            	ret
 694                     ; 216 void COMP_SwitchConfig(COMP_Switch_TypeDef COMP_Switch,
 694                     ; 217                        FunctionalState NewState)
 694                     ; 218 {
 695                     	switch	.text
 696  0073               _COMP_SwitchConfig:
 698  0073 89            	pushw	x
 699       00000000      OFST:	set	0
 702                     ; 220   assert_param(IS_COMP_SWITCH(COMP_Switch));
 704                     ; 221   assert_param(IS_FUNCTIONAL_STATE(NewState));
 706                     ; 223   if (NewState != DISABLE)
 708  0074 9f            	ld	a,xl
 709  0075 4d            	tnz	a
 710  0076 2709          	jreq	L123
 711                     ; 226     COMP->CCS |= (uint8_t)COMP_Switch;
 713  0078 9e            	ld	a,xh
 714  0079 ca5302        	or	a,21250
 715  007c c75302        	ld	21250,a
 717  007f 2009          	jra	L323
 718  0081               L123:
 719                     ; 231     COMP->CCS &= (uint8_t)(~(uint8_t)COMP_Switch);
 721  0081 7b01          	ld	a,(OFST+1,sp)
 722  0083 43            	cpl	a
 723  0084 c45302        	and	a,21250
 724  0087 c75302        	ld	21250,a
 725  008a               L323:
 726                     ; 233 }
 729  008a 85            	popw	x
 730  008b 81            	ret
 806                     ; 245 void COMP_TIMConnect(COMP_TimersConnection_TypeDef COMP_TIMConnection)
 806                     ; 246 {
 807                     	switch	.text
 808  008c               _COMP_TIMConnect:
 810  008c 88            	push	a
 811       00000000      OFST:	set	0
 814                     ; 248   assert_param(IS_COMP_TIMCONNECTION(COMP_TIMConnection));
 816                     ; 251   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_CNFTIM);
 818  008d c65300        	ld	a,21248
 819  0090 a49f          	and	a,#159
 820  0092 c75300        	ld	21248,a
 821                     ; 254   COMP->CR |= (uint8_t)COMP_TIMConnection;
 823  0095 c65300        	ld	a,21248
 824  0098 1a01          	or	a,(OFST+1,sp)
 825  009a c75300        	ld	21248,a
 826                     ; 255 }
 829  009d 84            	pop	a
 830  009e 81            	ret
 866                     ; 265 void COMP_SelectPolarity(COMP_Polarity_TypeDef COMP_Polarity)
 866                     ; 266 {
 867                     	switch	.text
 868  009f               _COMP_SelectPolarity:
 872                     ; 268   assert_param(IS_COMP_POLARITY(COMP_Polarity));
 874                     ; 271   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_POL);
 876  009f 72195300      	bres	21248,#4
 877                     ; 274   COMP->CR |= (uint8_t)COMP_Polarity;
 879  00a3 ca5300        	or	a,21248
 880  00a6 c75300        	ld	21248,a
 881                     ; 275 }
 884  00a9 81            	ret
 919                     ; 285 void COMP_SetReference(COMP_Reference_TypeDef COMP_Reference)
 919                     ; 286 {
 920                     	switch	.text
 921  00aa               _COMP_SetReference:
 925                     ; 288   assert_param(IS_COMP_REFERENCE(COMP_Reference));
 927                     ; 291   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_COMPREF);
 929  00aa 72175300      	bres	21248,#3
 930                     ; 294   COMP->CR |= (uint8_t)COMP_Reference;
 932  00ae ca5300        	or	a,21248
 933  00b1 c75300        	ld	21248,a
 934                     ; 295 }
 937  00b4 81            	ret
1024                     ; 305 FlagStatus COMP_GetOutputStatus(COMP_Output_TypeDef COMP_Output)
1024                     ; 306 {
1025                     	switch	.text
1026  00b5               _COMP_GetOutputStatus:
1028  00b5 88            	push	a
1029       00000001      OFST:	set	1
1032                     ; 307   FlagStatus status = RESET;
1034                     ; 310   assert_param(IS_COMP_OUTPUT(COMP_Output));
1036                     ; 312   if ((COMP->CSR & (uint8_t)COMP_Output) != 0)
1038  00b6 c45301        	and	a,21249
1039  00b9 2706          	jreq	L554
1040                     ; 314     status = SET;
1042  00bb a601          	ld	a,#1
1043  00bd 6b01          	ld	(OFST+0,sp),a
1046  00bf 2002          	jra	L754
1047  00c1               L554:
1048                     ; 318     status = RESET;
1050  00c1 0f01          	clr	(OFST+0,sp)
1052  00c3               L754:
1053                     ; 320   return status;
1055  00c3 7b01          	ld	a,(OFST+0,sp)
1058  00c5 5b01          	addw	sp,#1
1059  00c7 81            	ret
1125                     ; 331 FlagStatus COMP_GetFlagStatus(COMP_FLAG_TypeDef COMP_Flag)
1125                     ; 332 {
1126                     	switch	.text
1127  00c8               _COMP_GetFlagStatus:
1129  00c8 88            	push	a
1130       00000001      OFST:	set	1
1133                     ; 333   FlagStatus status = RESET;
1135                     ; 336   assert_param(IS_COMP_FLAG(COMP_Flag));
1137                     ; 338   if ((COMP->CSR & (uint8_t)COMP_Flag) != 0)
1139  00c9 c45301        	and	a,21249
1140  00cc 2706          	jreq	L315
1141                     ; 340     status = SET;
1143  00ce a601          	ld	a,#1
1144  00d0 6b01          	ld	(OFST+0,sp),a
1147  00d2 2002          	jra	L515
1148  00d4               L315:
1149                     ; 344     status = RESET;
1151  00d4 0f01          	clr	(OFST+0,sp)
1153  00d6               L515:
1154                     ; 346   return status;
1156  00d6 7b01          	ld	a,(OFST+0,sp)
1159  00d8 5b01          	addw	sp,#1
1160  00da 81            	ret
1195                     ; 357 void COMP_ClearFlag(COMP_FLAG_TypeDef COMP_Flag)
1195                     ; 358 {
1196                     	switch	.text
1197  00db               _COMP_ClearFlag:
1201                     ; 360   assert_param(IS_COMP_FLAG(COMP_Flag));
1203                     ; 363   COMP->CSR |= (uint8_t)COMP_Flag;
1205  00db ca5301        	or	a,21249
1206  00de c75301        	ld	21249,a
1207                     ; 364 }
1210  00e1 81            	ret
1256                     ; 374 ITStatus COMP_GetITStatus(COMP_IT_TypeDef COMP_ITPendingBit)
1256                     ; 375 {
1257                     	switch	.text
1258  00e2               _COMP_GetITStatus:
1260  00e2 88            	push	a
1261       00000001      OFST:	set	1
1264                     ; 376   ITStatus status = RESET;
1266                     ; 379   assert_param(IS_COMP_ITPENDINGBIT(COMP_ITPendingBit));
1268                     ; 381   if (COMP->CSR & (uint8_t)COMP_ITPendingBit)
1270  00e3 c45301        	and	a,21249
1271  00e6 2706          	jreq	L755
1272                     ; 383     status = SET;
1274  00e8 a601          	ld	a,#1
1275  00ea 6b01          	ld	(OFST+0,sp),a
1278  00ec 2002          	jra	L165
1279  00ee               L755:
1280                     ; 387     status = RESET;
1282  00ee 0f01          	clr	(OFST+0,sp)
1284  00f0               L165:
1285                     ; 389   return status;
1287  00f0 7b01          	ld	a,(OFST+0,sp)
1290  00f2 5b01          	addw	sp,#1
1291  00f4 81            	ret
1327                     ; 400 void COMP_ClearITPendingBit(COMP_IT_TypeDef COMP_ITPendingBit)
1327                     ; 401 {
1328                     	switch	.text
1329  00f5               _COMP_ClearITPendingBit:
1333                     ; 403   assert_param(IS_COMP_ITPENDINGBIT(COMP_ITPendingBit));
1335                     ; 406   COMP->CSR |= (uint8_t)COMP_ITPendingBit;
1337  00f5 ca5301        	or	a,21249
1338  00f8 c75301        	ld	21249,a
1339                     ; 407 }
1342  00fb 81            	ret
1355                     	xdef	_COMP_ClearITPendingBit
1356                     	xdef	_COMP_GetITStatus
1357                     	xdef	_COMP_ClearFlag
1358                     	xdef	_COMP_GetFlagStatus
1359                     	xdef	_COMP_GetOutputStatus
1360                     	xdef	_COMP_SetReference
1361                     	xdef	_COMP_SelectPolarity
1362                     	xdef	_COMP_TIMConnect
1363                     	xdef	_COMP_SwitchConfig
1364                     	xdef	_COMP_TIM2Config
1365                     	xdef	_COMP_ITConfig
1366                     	xdef	_COMP_SelectionConfig
1367                     	xdef	_COMP_Cmd
1368                     	xdef	_COMP_Init
1369                     	xdef	_COMP_DeInit
1388                     	end
