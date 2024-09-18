.include "macros.inc"
.file "auto_fn_80385D3C_text"

# 0x80385D3C - 0x80385D60
.text
.balign 4

.fn fn_80385D3C, global
/* 80385D3C 0038155C  3C 80 80 67 */	lis r4, lbl_80669B88@ha
/* 80385D40 00381560  C0 42 DC 58 */	lfs f2, lbl_80673138@sda21(r0)
/* 80385D44 00381564  C0 22 DC 5C */	lfs f1, lbl_8067313C@sda21(r0)
/* 80385D48 00381568  38 64 9B 88 */	addi r3, r4, lbl_80669B88@l
/* 80385D4C 0038156C  C0 02 DC 60 */	lfs f0, lbl_80673140@sda21(r0)
/* 80385D50 00381570  D0 44 9B 88 */	stfs f2, lbl_80669B88@l(r4)
/* 80385D54 00381574  D0 23 00 04 */	stfs f1, 0x4(r3)
/* 80385D58 00381578  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80385D5C 0038157C  4E 80 00 20 */	blr
.endfn fn_80385D3C

# 0x80534EE8 - 0x80534EEC
.section .ctors, "a"
.balign 4
	.4byte fn_80385D3C
