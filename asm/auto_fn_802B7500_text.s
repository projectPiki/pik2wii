.include "macros.inc"
.file "auto_fn_802B7500_text"

# 0x802B7500 - 0x802B752C
.text
.balign 4

.fn fn_802B7500, global
/* 802B7500 002B2D20  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802B7504 002B2D24  38 00 FF FF */	li r0, -0x1
/* 802B7508 002B2D28  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802B750C 002B2D2C  3C 80 80 64 */	lis r4, lbl_80638D98@ha
/* 802B7510 002B2D30  38 64 8D 98 */	addi r3, r4, lbl_80638D98@l
/* 802B7514 002B2D34  90 0D A4 28 */	stw r0, lbl_8066CC28@sda21(r0)
/* 802B7518 002B2D38  D0 0D A4 2C */	stfs f0, lbl_8066CC2C@sda21(r0)
/* 802B751C 002B2D3C  D0 04 8D 98 */	stfs f0, lbl_80638D98@l(r4)
/* 802B7520 002B2D40  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802B7524 002B2D44  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802B7528 002B2D48  4E 80 00 20 */	blr
.endfn fn_802B7500

# 0x80534E4C - 0x80534E50
.section .ctors, "a"
.balign 4
	.4byte fn_802B7500
