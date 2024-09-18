.include "macros.inc"
.file "auto_fn_801B4B1C_text"

# 0x801B4B1C - 0x801B4B48
.text
.balign 4

.fn fn_801B4B1C, global
/* 801B4B1C 001B033C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801B4B20 001B0340  38 00 FF FF */	li r0, -0x1
/* 801B4B24 001B0344  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801B4B28 001B0348  3C 80 80 64 */	lis r4, lbl_806389B0@ha
/* 801B4B2C 001B034C  38 64 89 B0 */	addi r3, r4, lbl_806389B0@l
/* 801B4B30 001B0350  90 0D A0 18 */	stw r0, lbl_8066C818@sda21(r0)
/* 801B4B34 001B0354  D0 0D A0 1C */	stfs f0, lbl_8066C81C@sda21(r0)
/* 801B4B38 001B0358  D0 04 89 B0 */	stfs f0, lbl_806389B0@l(r4)
/* 801B4B3C 001B035C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801B4B40 001B0360  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801B4B44 001B0364  4E 80 00 20 */	blr
.endfn fn_801B4B1C

# 0x80534D48 - 0x80534D4C
.section .ctors, "a"
.balign 4
	.4byte fn_801B4B1C
