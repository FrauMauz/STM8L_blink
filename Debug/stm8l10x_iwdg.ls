   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  77                     ; 58 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  77                     ; 59 {
  79                     	switch	.text
  80  0000               _IWDG_WriteAccessCmd:
  84                     ; 61   assert_param(IS_IWDG_WRITEACCESS_MODE(IWDG_WriteAccess));
  86                     ; 62   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  88  0000 c750e0        	ld	20704,a
  89                     ; 63 }
  92  0003 81            	ret
 182                     ; 79 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 182                     ; 80 {
 183                     	switch	.text
 184  0004               _IWDG_SetPrescaler:
 188                     ; 82   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 190                     ; 83   IWDG->PR = (uint8_t)IWDG_Prescaler;
 192  0004 c750e1        	ld	20705,a
 193                     ; 84 }
 196  0007 81            	ret
 230                     ; 93 void IWDG_SetReload(uint8_t IWDG_Reload)
 230                     ; 94 {
 231                     	switch	.text
 232  0008               _IWDG_SetReload:
 236                     ; 95   IWDG->RLR = IWDG_Reload;
 238  0008 c750e2        	ld	20706,a
 239                     ; 96 }
 242  000b 81            	ret
 265                     ; 104 void IWDG_ReloadCounter(void)
 265                     ; 105 {
 266                     	switch	.text
 267  000c               _IWDG_ReloadCounter:
 271                     ; 106   IWDG->KR = IWDG_KEY_REFRESH;
 273  000c 35aa50e0      	mov	20704,#170
 274                     ; 107 }
 277  0010 81            	ret
 300                     ; 114 void IWDG_Enable(void)
 300                     ; 115 {
 301                     	switch	.text
 302  0011               _IWDG_Enable:
 306                     ; 116   IWDG->KR = IWDG_KEY_ENABLE;
 308  0011 35cc50e0      	mov	20704,#204
 309                     ; 117 }
 312  0015 81            	ret
 325                     	xdef	_IWDG_Enable
 326                     	xdef	_IWDG_ReloadCounter
 327                     	xdef	_IWDG_SetReload
 328                     	xdef	_IWDG_SetPrescaler
 329                     	xdef	_IWDG_WriteAccessCmd
 348                     	end
