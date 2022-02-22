   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 55 void IRTIM_DeInit(void)
  42                     ; 56 {
  44                     	switch	.text
  45  0000               _IRTIM_DeInit:
  49                     ; 57   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  51  0000 725f52ff      	clr	21247
  52                     ; 58 }
  55  0004 81            	ret
 110                     ; 66 void IRTIM_Cmd(FunctionalState NewState)
 110                     ; 67 {
 111                     	switch	.text
 112  0005               _IRTIM_Cmd:
 116                     ; 69   assert_param(IS_FUNCTIONAL_STATE(NewState));
 118                     ; 72   if (NewState ==  DISABLE)
 120  0005 4d            	tnz	a
 121  0006 2606          	jrne	L74
 122                     ; 74     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN);
 124  0008 721152ff      	bres	21247,#0
 126  000c 2004          	jra	L15
 127  000e               L74:
 128                     ; 78     IRTIM->CR |= IRTIM_CR_EN;
 130  000e 721052ff      	bset	21247,#0
 131  0012               L15:
 132                     ; 80 }
 135  0012 81            	ret
 171                     ; 87 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 171                     ; 88 {
 172                     	switch	.text
 173  0013               _IRTIM_HighSinkODCmd:
 177                     ; 90   assert_param(IS_FUNCTIONAL_STATE(NewState));
 179                     ; 93   if (NewState == DISABLE)
 181  0013 4d            	tnz	a
 182  0014 2606          	jrne	L17
 183                     ; 95     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN);
 185  0016 721352ff      	bres	21247,#1
 187  001a 2004          	jra	L37
 188  001c               L17:
 189                     ; 99     IRTIM->CR |= IRTIM_CR_HSEN;
 191  001c 721252ff      	bset	21247,#1
 192  0020               L37:
 193                     ; 101 }
 196  0020 81            	ret
 220                     ; 108 FunctionalState IRTIM_GetStatus(void)
 220                     ; 109 {
 221                     	switch	.text
 222  0021               _IRTIM_GetStatus:
 226                     ; 110   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_EN));
 228  0021 c652ff        	ld	a,21247
 229  0024 a401          	and	a,#1
 232  0026 81            	ret
 257                     ; 118 FunctionalState IRTIM_GetHighSinkODStatus(void)
 257                     ; 119 {
 258                     	switch	.text
 259  0027               _IRTIM_GetHighSinkODStatus:
 263                     ; 120   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 265  0027 c652ff        	ld	a,21247
 266  002a a402          	and	a,#2
 269  002c 81            	ret
 282                     	xdef	_IRTIM_GetHighSinkODStatus
 283                     	xdef	_IRTIM_HighSinkODCmd
 284                     	xdef	_IRTIM_GetStatus
 285                     	xdef	_IRTIM_Cmd
 286                     	xdef	_IRTIM_DeInit
 305                     	end
