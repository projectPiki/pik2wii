.include "macros.inc"
.file "auto_fn_8034118C_text"

# 0x8034118C - 0x803411B8
.text
.balign 4

.fn fn_8034118C, global
/* 8034118C 0033C9AC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80341190 0033C9B0  38 00 FF FF */	li r0, -0x1
/* 80341194 0033C9B4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80341198 0033C9B8  3C 80 80 64 */	lis r4, lbl_80639168@ha
/* 8034119C 0033C9BC  38 64 91 68 */	addi r3, r4, lbl_80639168@l
/* 803411A0 0033C9C0  90 0D A5 38 */	stw r0, lbl_8066CD38@sda21(r0)
/* 803411A4 0033C9C4  D0 0D A5 3C */	stfs f0, lbl_8066CD3C@sda21(r0)
/* 803411A8 0033C9C8  D0 04 91 68 */	stfs f0, lbl_80639168@l(r4)
/* 803411AC 0033C9CC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803411B0 0033C9D0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803411B4 0033C9D4  4E 80 00 20 */	blr
.endfn fn_8034118C

# 0x80534EB4 - 0x80534EB8
.section .ctors, "a"
.balign 4
	.4byte fn_8034118C
