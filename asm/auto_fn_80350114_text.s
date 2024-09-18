.include "macros.inc"
.file "auto_fn_80350114_text"

# 0x80350114 - 0x80350140
.text
.balign 4

.fn fn_80350114, global
/* 80350114 0034B934  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80350118 0034B938  38 00 FF FF */	li r0, -0x1
/* 8035011C 0034B93C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80350120 0034B940  3C 80 80 64 */	lis r4, lbl_806391A8@ha
/* 80350124 0034B944  38 64 91 A8 */	addi r3, r4, lbl_806391A8@l
/* 80350128 0034B948  90 0D A5 68 */	stw r0, lbl_8066CD68@sda21(r0)
/* 8035012C 0034B94C  D0 0D A5 6C */	stfs f0, lbl_8066CD6C@sda21(r0)
/* 80350130 0034B950  D0 04 91 A8 */	stfs f0, lbl_806391A8@l(r4)
/* 80350134 0034B954  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80350138 0034B958  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8035013C 0034B95C  4E 80 00 20 */	blr
.endfn fn_80350114

# 0x80534EC4 - 0x80534EC8
.section .ctors, "a"
.balign 4
	.4byte fn_80350114
