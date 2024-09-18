.include "macros.inc"
.file "auto_fn_802BFF90_text"

# 0x802BFF90 - 0x802BFFBC
.text
.balign 4

.fn fn_802BFF90, global
/* 802BFF90 002BB7B0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802BFF94 002BB7B4  38 00 FF FF */	li r0, -0x1
/* 802BFF98 002BB7B8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802BFF9C 002BB7BC  3C 80 80 64 */	lis r4, lbl_80638DD8@ha
/* 802BFFA0 002BB7C0  38 64 8D D8 */	addi r3, r4, lbl_80638DD8@l
/* 802BFFA4 002BB7C4  90 0D A4 48 */	stw r0, lbl_8066CC48@sda21(r0)
/* 802BFFA8 002BB7C8  D0 0D A4 4C */	stfs f0, lbl_8066CC4C@sda21(r0)
/* 802BFFAC 002BB7CC  D0 04 8D D8 */	stfs f0, lbl_80638DD8@l(r4)
/* 802BFFB0 002BB7D0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802BFFB4 002BB7D4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802BFFB8 002BB7D8  4E 80 00 20 */	blr
.endfn fn_802BFF90

# 0x80534E5C - 0x80534E60
.section .ctors, "a"
.balign 4
	.4byte fn_802BFF90
