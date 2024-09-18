.include "macros.inc"
.file "auto_fn_802B2610_text"

# 0x802B2610 - 0x802B263C
.text
.balign 4

.fn fn_802B2610, global
/* 802B2610 002ADE30  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802B2614 002ADE34  38 00 FF FF */	li r0, -0x1
/* 802B2618 002ADE38  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802B261C 002ADE3C  3C 80 80 64 */	lis r4, lbl_80638D78@ha
/* 802B2620 002ADE40  38 64 8D 78 */	addi r3, r4, lbl_80638D78@l
/* 802B2624 002ADE44  90 0D A4 08 */	stw r0, lbl_8066CC08@sda21(r0)
/* 802B2628 002ADE48  D0 0D A4 0C */	stfs f0, lbl_8066CC0C@sda21(r0)
/* 802B262C 002ADE4C  D0 04 8D 78 */	stfs f0, lbl_80638D78@l(r4)
/* 802B2630 002ADE50  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802B2634 002ADE54  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802B2638 002ADE58  4E 80 00 20 */	blr
.endfn fn_802B2610

# 0x80534E40 - 0x80534E44
.section .ctors, "a"
.balign 4
	.4byte fn_802B2610
