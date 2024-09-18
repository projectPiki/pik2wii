.include "macros.inc"
.file "auto_fn_8046FB48_text"

# 0x8046FB48 - 0x8046FB74
.text
.balign 4

.fn fn_8046FB48, global
/* 8046FB48 0046B368  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8046FB4C 0046B36C  38 00 FF FF */	li r0, -0x1
/* 8046FB50 0046B370  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8046FB54 0046B374  3C 80 80 64 */	lis r4, lbl_80639458@ha
/* 8046FB58 0046B378  38 64 94 58 */	addi r3, r4, lbl_80639458@l
/* 8046FB5C 0046B37C  90 0D A9 38 */	stw r0, lbl_8066D138@sda21(r0)
/* 8046FB60 0046B380  D0 0D A9 3C */	stfs f0, lbl_8066D13C@sda21(r0)
/* 8046FB64 0046B384  D0 04 94 58 */	stfs f0, lbl_80639458@l(r4)
/* 8046FB68 0046B388  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8046FB6C 0046B38C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8046FB70 0046B390  4E 80 00 20 */	blr
.endfn fn_8046FB48

# 0x80534FDC - 0x80534FE0
.section .ctors, "a"
.balign 4
	.4byte fn_8046FB48
