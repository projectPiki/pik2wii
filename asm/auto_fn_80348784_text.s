.include "macros.inc"
.file "auto_fn_80348784_text"

# 0x80348784 - 0x803487B0
.text
.balign 4

.fn fn_80348784, global
/* 80348784 00343FA4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80348788 00343FA8  38 00 FF FF */	li r0, -0x1
/* 8034878C 00343FAC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80348790 00343FB0  3C 80 80 64 */	lis r4, lbl_80639188@ha
/* 80348794 00343FB4  38 64 91 88 */	addi r3, r4, lbl_80639188@l
/* 80348798 00343FB8  90 0D A5 50 */	stw r0, lbl_8066CD50@sda21(r0)
/* 8034879C 00343FBC  D0 0D A5 54 */	stfs f0, lbl_8066CD54@sda21(r0)
/* 803487A0 00343FC0  D0 04 91 88 */	stfs f0, lbl_80639188@l(r4)
/* 803487A4 00343FC4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803487A8 00343FC8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803487AC 00343FCC  4E 80 00 20 */	blr
.endfn fn_80348784

# 0x80534EBC - 0x80534EC0
.section .ctors, "a"
.balign 4
	.4byte fn_80348784
