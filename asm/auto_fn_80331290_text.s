.include "macros.inc"
.file "auto_fn_80331290_text"

# 0x80331290 - 0x803312BC
.text
.balign 4

.fn fn_80331290, global
/* 80331290 0032CAB0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80331294 0032CAB4  38 00 FF FF */	li r0, -0x1
/* 80331298 0032CAB8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8033129C 0032CABC  3C 80 80 64 */	lis r4, lbl_80639148@ha
/* 803312A0 0032CAC0  38 64 91 48 */	addi r3, r4, lbl_80639148@l
/* 803312A4 0032CAC4  90 0D A5 28 */	stw r0, lbl_8066CD28@sda21(r0)
/* 803312A8 0032CAC8  D0 0D A5 2C */	stfs f0, lbl_8066CD2C@sda21(r0)
/* 803312AC 0032CACC  D0 04 91 48 */	stfs f0, lbl_80639148@l(r4)
/* 803312B0 0032CAD0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803312B4 0032CAD4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803312B8 0032CAD8  4E 80 00 20 */	blr
.endfn fn_80331290

# 0x80534EAC - 0x80534EB0
.section .ctors, "a"
.balign 4
	.4byte fn_80331290
