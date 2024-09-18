.include "macros.inc"
.file "auto_fn_803A2D1C_text"

# 0x803A2D1C - 0x803A2D48
.text
.balign 4

.fn fn_803A2D1C, global
/* 803A2D1C 0039E53C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803A2D20 0039E540  38 00 FF FF */	li r0, -0x1
/* 803A2D24 0039E544  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803A2D28 0039E548  3C 80 80 64 */	lis r4, lbl_80639288@ha
/* 803A2D2C 0039E54C  38 64 92 88 */	addi r3, r4, lbl_80639288@l
/* 803A2D30 0039E550  90 0D A6 18 */	stw r0, lbl_8066CE18@sda21(r0)
/* 803A2D34 0039E554  D0 0D A6 1C */	stfs f0, lbl_8066CE1C@sda21(r0)
/* 803A2D38 0039E558  D0 04 92 88 */	stfs f0, lbl_80639288@l(r4)
/* 803A2D3C 0039E55C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803A2D40 0039E560  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803A2D44 0039E564  4E 80 00 20 */	blr
.endfn fn_803A2D1C

# 0x80534F30 - 0x80534F34
.section .ctors, "a"
.balign 4
	.4byte fn_803A2D1C
