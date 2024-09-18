.include "macros.inc"
.file "auto_fn_8034477C_text"

# 0x8034477C - 0x803447A8
.text
.balign 4

.fn fn_8034477C, global
/* 8034477C 0033FF9C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80344780 0033FFA0  38 00 FF FF */	li r0, -0x1
/* 80344784 0033FFA4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80344788 0033FFA8  3C 80 80 64 */	lis r4, lbl_80639178@ha
/* 8034478C 0033FFAC  38 64 91 78 */	addi r3, r4, lbl_80639178@l
/* 80344790 0033FFB0  90 0D A5 48 */	stw r0, lbl_8066CD48@sda21(r0)
/* 80344794 0033FFB4  D0 0D A5 4C */	stfs f0, lbl_8066CD4C@sda21(r0)
/* 80344798 0033FFB8  D0 04 91 78 */	stfs f0, lbl_80639178@l(r4)
/* 8034479C 0033FFBC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803447A0 0033FFC0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803447A4 0033FFC4  4E 80 00 20 */	blr
.endfn fn_8034477C

# 0x80534EB8 - 0x80534EBC
.section .ctors, "a"
.balign 4
	.4byte fn_8034477C
