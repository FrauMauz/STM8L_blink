   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  77                     ; 157 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgramTime)
  77                     ; 158 {
  79                     	switch	.text
  80  0000               _FLASH_SetProgrammingTime:
  84                     ; 160   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgramTime));
  86                     ; 162   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  88  0000 72115050      	bres	20560,#0
  89                     ; 163   FLASH->CR1 |= (uint8_t)FLASH_ProgramTime;
  91  0004 ca5050        	or	a,20560
  92  0007 c75050        	ld	20560,a
  93                     ; 164 }
  96  000a 81            	ret
 121                     ; 171 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 121                     ; 172 {
 122                     	switch	.text
 123  000b               _FLASH_GetProgrammingTime:
 127                     ; 173   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 129  000b c65050        	ld	a,20560
 130  000e a401          	and	a,#1
 133  0010 81            	ret
 156                     ; 215 void FLASH_DeInit(void)
 156                     ; 216 {
 157                     	switch	.text
 158  0011               _FLASH_DeInit:
 162                     ; 217   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 164  0011 725f5050      	clr	20560
 165                     ; 218   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 167  0015 725f5051      	clr	20561
 168                     ; 219   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 170  0019 35405054      	mov	20564,#64
 171                     ; 220   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 173  001d c65054        	ld	a,20564
 174                     ; 221 }
 177  0020 81            	ret
 233                     ; 231 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 233                     ; 232 {
 234                     	switch	.text
 235  0021               _FLASH_Unlock:
 237  0021 88            	push	a
 238       00000000      OFST:	set	0
 241                     ; 234   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 243                     ; 237   if (FLASH_MemType == FLASH_MemType_Program)
 245  0022 a1fd          	cp	a,#253
 246  0024 2608          	jrne	L501
 247                     ; 239     FLASH->PUKR = FLASH_RASS_KEY1;
 249  0026 35565052      	mov	20562,#86
 250                     ; 240     FLASH->PUKR = FLASH_RASS_KEY2;
 252  002a 35ae5052      	mov	20562,#174
 253  002e               L501:
 254                     ; 243   if (FLASH_MemType == FLASH_MemType_Data)
 256  002e 7b01          	ld	a,(OFST+1,sp)
 257  0030 a1f7          	cp	a,#247
 258  0032 2608          	jrne	L701
 259                     ; 245     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 261  0034 35ae5053      	mov	20563,#174
 262                     ; 246     FLASH->DUKR = FLASH_RASS_KEY1;
 264  0038 35565053      	mov	20563,#86
 265  003c               L701:
 266                     ; 248 }
 269  003c 84            	pop	a
 270  003d 81            	ret
 305                     ; 258 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 305                     ; 259 {
 306                     	switch	.text
 307  003e               _FLASH_Lock:
 311                     ; 261   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 313                     ; 263   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 315  003e c45054        	and	a,20564
 316  0041 c75054        	ld	20564,a
 317                     ; 264 }
 320  0044 81            	ret
 363                     ; 272 void FLASH_ProgramByte(uint16_t Address, uint8_t Data)
 363                     ; 273 {
 364                     	switch	.text
 365  0045               _FLASH_ProgramByte:
 367  0045 89            	pushw	x
 368       00000000      OFST:	set	0
 371                     ; 275   assert_param(IS_FLASH_ADDRESS(Address));
 373                     ; 277   *(PointerAttr uint8_t*) (uint16_t)Address = Data;  
 375  0046 7b05          	ld	a,(OFST+5,sp)
 376  0048 1e01          	ldw	x,(OFST+1,sp)
 377  004a f7            	ld	(x),a
 378                     ; 278 }
 381  004b 85            	popw	x
 382  004c 81            	ret
 416                     ; 285 void FLASH_EraseByte(uint16_t Address)
 416                     ; 286 {
 417                     	switch	.text
 418  004d               _FLASH_EraseByte:
 422                     ; 288   assert_param(IS_FLASH_ADDRESS(Address));
 424                     ; 290   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 426  004d 7f            	clr	(x)
 427                     ; 291 }
 431  004e 81            	ret
 474                     ; 299 void FLASH_ProgramWord(uint16_t Address, uint32_t Data)
 474                     ; 300 {
 475                     	switch	.text
 476  004f               _FLASH_ProgramWord:
 478  004f 89            	pushw	x
 479       00000000      OFST:	set	0
 482                     ; 302   assert_param(IS_FLASH_ADDRESS(Address));
 484                     ; 305   FLASH->CR2 |= FLASH_CR2_WPRG;
 486  0050 721c5051      	bset	20561,#6
 487                     ; 308   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 489  0054 7b05          	ld	a,(OFST+5,sp)
 490  0056 1e01          	ldw	x,(OFST+1,sp)
 491  0058 f7            	ld	(x),a
 492                     ; 310   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 494  0059 7b06          	ld	a,(OFST+6,sp)
 495  005b 1e01          	ldw	x,(OFST+1,sp)
 496  005d e701          	ld	(1,x),a
 497                     ; 312   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 499  005f 7b07          	ld	a,(OFST+7,sp)
 500  0061 1e01          	ldw	x,(OFST+1,sp)
 501  0063 e702          	ld	(2,x),a
 502                     ; 314   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 504  0065 7b08          	ld	a,(OFST+8,sp)
 505  0067 1e01          	ldw	x,(OFST+1,sp)
 506  0069 e703          	ld	(3,x),a
 507                     ; 315 }
 510  006b 85            	popw	x
 511  006c 81            	ret
 545                     ; 322 uint8_t FLASH_ReadByte(uint16_t Address)
 545                     ; 323 {
 546                     	switch	.text
 547  006d               _FLASH_ReadByte:
 551                     ; 325   assert_param(IS_FLASH_ADDRESS(Address));
 553                     ; 328   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 555  006d f6            	ld	a,(x)
 558  006e 81            	ret
 615                     ; 358 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 615                     ; 359 {
 616                     	switch	.text
 617  006f               _FLASH_GetReadOutProtectionStatus:
 619  006f 88            	push	a
 620       00000001      OFST:	set	1
 623                     ; 360   FunctionalState state = DISABLE;
 625                     ; 362   if (OPT->OPT0_LOCKBYTE == FLASH_READOUTPROTECTION_KEY)
 627  0070 c64800        	ld	a,18432
 628  0073 a1aa          	cp	a,#170
 629  0075 2606          	jrne	L552
 630                     ; 365     state = ENABLE;
 632  0077 a601          	ld	a,#1
 633  0079 6b01          	ld	(OFST+0,sp),a
 636  007b 2002          	jra	L752
 637  007d               L552:
 638                     ; 370     state = DISABLE;
 640  007d 0f01          	clr	(OFST+0,sp)
 642  007f               L752:
 643                     ; 373     return state;
 645  007f 7b01          	ld	a,(OFST+0,sp)
 648  0081 5b01          	addw	sp,#1
 649  0083 81            	ret
 683                     ; 381 uint16_t FLASH_GetBootSize(void)
 683                     ; 382 {
 684                     	switch	.text
 685  0084               _FLASH_GetBootSize:
 687  0084 89            	pushw	x
 688       00000002      OFST:	set	2
 691                     ; 383   uint16_t temp = 0;
 693                     ; 386   temp = (uint16_t)(OPT->OPT2_BOOTSIZE * (uint16_t)64);
 695  0085 c64802        	ld	a,18434
 696  0088 97            	ld	xl,a
 697  0089 a640          	ld	a,#64
 698  008b 42            	mul	x,a
 699  008c 1f01          	ldw	(OFST-1,sp),x
 701                     ; 389   if (OPT->OPT2_BOOTSIZE > 0x7F)
 703  008e c64802        	ld	a,18434
 704  0091 a180          	cp	a,#128
 705  0093 2505          	jrult	L772
 706                     ; 391     temp = 8192;
 708  0095 ae2000        	ldw	x,#8192
 709  0098 1f01          	ldw	(OFST-1,sp),x
 711  009a               L772:
 712                     ; 395   return(temp);
 714  009a 1e01          	ldw	x,(OFST-1,sp)
 717  009c 5b02          	addw	sp,#2
 718  009e 81            	ret
 752                     ; 403 uint16_t FLASH_GetDataSize(void)
 752                     ; 404 {
 753                     	switch	.text
 754  009f               _FLASH_GetDataSize:
 756  009f 89            	pushw	x
 757       00000002      OFST:	set	2
 760                     ; 405   uint16_t temp = 0;
 762                     ; 408   temp = (uint16_t)((uint16_t)OPT->OPT3_DATASIZE * (uint16_t)64);
 764  00a0 c64803        	ld	a,18435
 765  00a3 5f            	clrw	x
 766  00a4 97            	ld	xl,a
 767  00a5 58            	sllw	x
 768  00a6 58            	sllw	x
 769  00a7 58            	sllw	x
 770  00a8 58            	sllw	x
 771  00a9 58            	sllw	x
 772  00aa 58            	sllw	x
 773  00ab 1f01          	ldw	(OFST-1,sp),x
 775                     ; 411   if (OPT->OPT3_DATASIZE > 0x20)
 777  00ad c64803        	ld	a,18435
 778  00b0 a121          	cp	a,#33
 779  00b2 2505          	jrult	L713
 780                     ; 413     temp = 2048;
 782  00b4 ae0800        	ldw	x,#2048
 783  00b7 1f01          	ldw	(OFST-1,sp),x
 785  00b9               L713:
 786                     ; 417   return(temp);
 788  00b9 1e01          	ldw	x,(OFST-1,sp)
 791  00bb 5b02          	addw	sp,#2
 792  00bd 81            	ret
 827                     ; 441 void FLASH_ITConfig(FunctionalState NewState)
 827                     ; 442 {
 828                     	switch	.text
 829  00be               _FLASH_ITConfig:
 833                     ; 444   assert_param(IS_FUNCTIONAL_STATE(NewState));
 835                     ; 446   if (NewState != DISABLE)
 837  00be 4d            	tnz	a
 838  00bf 2706          	jreq	L733
 839                     ; 448     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 841  00c1 72125050      	bset	20560,#1
 843  00c5 2004          	jra	L143
 844  00c7               L733:
 845                     ; 452     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 847  00c7 72135050      	bres	20560,#1
 848  00cb               L143:
 849                     ; 454 }
 852  00cb 81            	ret
 954                     ; 467 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 954                     ; 468 {
 955                     	switch	.text
 956  00cc               _FLASH_GetFlagStatus:
 958  00cc 88            	push	a
 959       00000001      OFST:	set	1
 962                     ; 469   FlagStatus status = RESET;
 964                     ; 471   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 966                     ; 474   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 968  00cd c45054        	and	a,20564
 969  00d0 2706          	jreq	L114
 970                     ; 476     status = SET; /* FLASH_FLAG is set*/
 972  00d2 a601          	ld	a,#1
 973  00d4 6b01          	ld	(OFST+0,sp),a
 976  00d6 2002          	jra	L314
 977  00d8               L114:
 978                     ; 480     status = RESET; /* FLASH_FLAG is reset*/
 980  00d8 0f01          	clr	(OFST+0,sp)
 982  00da               L314:
 983                     ; 484   return status;
 985  00da 7b01          	ld	a,(OFST+0,sp)
 988  00dc 5b01          	addw	sp,#1
 989  00de 81            	ret
1083                     ; 602 IN_RAM(void FLASH_ProgramBlock(uint8_t BlockNum, FLASH_ProgramMode_TypeDef FLASH_ProgramMode, uint8_t *Buffer))
1083                     ; 603 {
1084                     	switch	.text
1085  00df               _FLASH_ProgramBlock:
1087  00df 89            	pushw	x
1088  00e0 5204          	subw	sp,#4
1089       00000004      OFST:	set	4
1092                     ; 604   uint16_t Count = 0;
1094                     ; 605   uint16_t StartAddress = 0;
1096                     ; 608   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1098                     ; 609   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgramMode));
1100                     ; 612   if (FLASH_ProgramMode == FLASH_ProgramMode_Standard)
1102  00e2 9f            	ld	a,xl
1103  00e3 4d            	tnz	a
1104  00e4 2606          	jrne	L364
1105                     ; 615     FLASH->CR2 |= FLASH_CR2_PRG;
1107  00e6 72105051      	bset	20561,#0
1109  00ea 2004          	jra	L564
1110  00ec               L364:
1111                     ; 620     FLASH->CR2 |= FLASH_CR2_FPRG;
1113  00ec 72185051      	bset	20561,#4
1114  00f0               L564:
1115                     ; 622   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1117                     ; 624   StartAddress = StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE);
1119  00f0 7b05          	ld	a,(OFST+1,sp)
1120  00f2 5f            	clrw	x
1121  00f3 97            	ld	xl,a
1122  00f4 58            	sllw	x
1123  00f5 58            	sllw	x
1124  00f6 58            	sllw	x
1125  00f7 58            	sllw	x
1126  00f8 58            	sllw	x
1127  00f9 58            	sllw	x
1128  00fa 1c8000        	addw	x,#32768
1129  00fd 1f01          	ldw	(OFST-3,sp),x
1131                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1133  00ff 5f            	clrw	x
1134  0100 1f03          	ldw	(OFST-1,sp),x
1136  0102               L764:
1137                     ; 629     *((PointerAttr uint8_t*) (uint16_t)StartAddress + Count) = ((uint8_t)(Buffer[Count]));
1139  0102 1e09          	ldw	x,(OFST+5,sp)
1140  0104 72fb03        	addw	x,(OFST-1,sp)
1141  0107 f6            	ld	a,(x)
1142  0108 1e01          	ldw	x,(OFST-3,sp)
1143  010a 72fb03        	addw	x,(OFST-1,sp)
1144  010d f7            	ld	(x),a
1145                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1147  010e 1e03          	ldw	x,(OFST-1,sp)
1148  0110 1c0001        	addw	x,#1
1149  0113 1f03          	ldw	(OFST-1,sp),x
1153  0115 1e03          	ldw	x,(OFST-1,sp)
1154  0117 a30040        	cpw	x,#64
1155  011a 25e6          	jrult	L764
1156                     ; 631 }
1159  011c 5b06          	addw	sp,#6
1160  011e 81            	ret
1213                     ; 643 IN_RAM(void FLASH_EraseBlock(uint8_t BlockNum))
1213                     ; 644 {
1214                     	switch	.text
1215  011f               _FLASH_EraseBlock:
1217  011f 5204          	subw	sp,#4
1218       00000004      OFST:	set	4
1221                     ; 646   uint16_t StartAddress = 0;
1223                     ; 648   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1225                     ; 650   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1227                     ; 652   pwFlash = (PointerAttr uint32_t *)(uint16_t)(StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE));
1229  0121 5f            	clrw	x
1230  0122 97            	ld	xl,a
1231  0123 58            	sllw	x
1232  0124 58            	sllw	x
1233  0125 58            	sllw	x
1234  0126 58            	sllw	x
1235  0127 58            	sllw	x
1236  0128 58            	sllw	x
1237  0129 1c8000        	addw	x,#32768
1238  012c 1f01          	ldw	(OFST-3,sp),x
1240                     ; 655   FLASH->CR2 |= FLASH_CR2_ERASE;
1242  012e 721a5051      	bset	20561,#5
1243                     ; 657   *pwFlash = (uint32_t)0;
1245  0132 1e01          	ldw	x,(OFST-3,sp)
1246  0134 a600          	ld	a,#0
1247  0136 e703          	ld	(3,x),a
1248  0138 a600          	ld	a,#0
1249  013a e702          	ld	(2,x),a
1250  013c a600          	ld	a,#0
1251  013e e701          	ld	(1,x),a
1252  0140 a600          	ld	a,#0
1253  0142 f7            	ld	(x),a
1254                     ; 658 }
1257  0143 5b04          	addw	sp,#4
1258  0145 81            	ret
1333                     ; 670 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(void))
1333                     ; 671 {
1334                     	switch	.text
1335  0146               _FLASH_WaitForLastOperation:
1337  0146 5203          	subw	sp,#3
1338       00000003      OFST:	set	3
1341                     ; 672   uint16_t timeout = OPERATION_TIMEOUT;
1343  0148 ae1000        	ldw	x,#4096
1344  014b 1f01          	ldw	(OFST-2,sp),x
1346                     ; 673   uint8_t My_FlagStatus = 0x00;
1348  014d 0f03          	clr	(OFST+0,sp)
1351  014f 200e          	jra	L365
1352  0151               L755:
1353                     ; 678     My_FlagStatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1355  0151 c65054        	ld	a,20564
1356  0154 a405          	and	a,#5
1357  0156 6b03          	ld	(OFST+0,sp),a
1359                     ; 679     timeout--;
1361  0158 1e01          	ldw	x,(OFST-2,sp)
1362  015a 1d0001        	subw	x,#1
1363  015d 1f01          	ldw	(OFST-2,sp),x
1365  015f               L365:
1366                     ; 676   while ((My_FlagStatus == 0x00) && (timeout != 0x00))
1368  015f 0d03          	tnz	(OFST+0,sp)
1369  0161 2604          	jrne	L765
1371  0163 1e01          	ldw	x,(OFST-2,sp)
1372  0165 26ea          	jrne	L755
1373  0167               L765:
1374                     ; 682   if (timeout == 0x00)
1376  0167 1e01          	ldw	x,(OFST-2,sp)
1377  0169 2604          	jrne	L175
1378                     ; 684     My_FlagStatus = (uint8_t)FLASH_Status_TimeOut;
1380  016b a602          	ld	a,#2
1381  016d 6b03          	ld	(OFST+0,sp),a
1383  016f               L175:
1384                     ; 687   return((FLASH_Status_TypeDef)My_FlagStatus);
1386  016f 7b03          	ld	a,(OFST+0,sp)
1389  0171 5b03          	addw	sp,#3
1390  0173 81            	ret
1403                     	xdef	_FLASH_WaitForLastOperation
1404                     	xdef	_FLASH_EraseBlock
1405                     	xdef	_FLASH_ProgramBlock
1406                     	xdef	_FLASH_GetFlagStatus
1407                     	xdef	_FLASH_ITConfig
1408                     	xdef	_FLASH_GetReadOutProtectionStatus
1409                     	xdef	_FLASH_GetDataSize
1410                     	xdef	_FLASH_GetBootSize
1411                     	xdef	_FLASH_ReadByte
1412                     	xdef	_FLASH_ProgramWord
1413                     	xdef	_FLASH_EraseByte
1414                     	xdef	_FLASH_ProgramByte
1415                     	xdef	_FLASH_Lock
1416                     	xdef	_FLASH_Unlock
1417                     	xdef	_FLASH_DeInit
1418                     	xdef	_FLASH_SetProgrammingTime
1419                     	xdef	_FLASH_GetProgrammingTime
1438                     	end
