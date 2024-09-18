.include "macros.inc"
.file "auto_03_801079EC_text"

# 0x801079EC - 0x801079FC
.text
.balign 4

.fn fn_801079EC, global
/* 801079EC 0010320C  3C 60 80 10 */	lis r3, fn_8010500C@ha
/* 801079F0 00103210  38 63 50 0C */	addi r3, r3, fn_8010500C@l
/* 801079F4 00103214  90 6D 97 68 */	stw r3, lbl_8066BF68@sda21(r0)
/* 801079F8 00103218  4E 80 00 20 */	blr
.endfn fn_801079EC
