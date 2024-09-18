.include "macros.inc"
.file "auto_fn_80288600_text"

# 0x80288600 - 0x8028862C
.text
.balign 4

.fn fn_80288600, global
/* 80288600 00283E20  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80288604 00283E24  38 00 FF FF */	li r0, -0x1
/* 80288608 00283E28  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8028860C 00283E2C  3C 80 80 64 */	lis r4, lbl_80638C50@ha
/* 80288610 00283E30  38 64 8C 50 */	addi r3, r4, lbl_80638C50@l
/* 80288614 00283E34  90 0D A3 38 */	stw r0, lbl_8066CB38@sda21(r0)
/* 80288618 00283E38  D0 0D A3 3C */	stfs f0, lbl_8066CB3C@sda21(r0)
/* 8028861C 00283E3C  D0 04 8C 50 */	stfs f0, lbl_80638C50@l(r4)
/* 80288620 00283E40  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80288624 00283E44  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80288628 00283E48  4E 80 00 20 */	blr
.endfn fn_80288600

# 0x80534DF8 - 0x80534DFC
.section .ctors, "a"
.balign 4
	.4byte fn_80288600
