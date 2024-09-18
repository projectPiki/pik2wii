.include "macros.inc"
.file "auto_fn_802C42C0_text"

# 0x802C42C0 - 0x802C42EC
.text
.balign 4

.fn fn_802C42C0, global
/* 802C42C0 002BFAE0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802C42C4 002BFAE4  38 00 FF FF */	li r0, -0x1
/* 802C42C8 002BFAE8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802C42CC 002BFAEC  3C 80 80 64 */	lis r4, lbl_80638E18@ha
/* 802C42D0 002BFAF0  38 64 8E 18 */	addi r3, r4, lbl_80638E18@l
/* 802C42D4 002BFAF4  90 0D A4 88 */	stw r0, lbl_8066CC88@sda21(r0)
/* 802C42D8 002BFAF8  D0 0D A4 8C */	stfs f0, lbl_8066CC8C@sda21(r0)
/* 802C42DC 002BFAFC  D0 04 8E 18 */	stfs f0, lbl_80638E18@l(r4)
/* 802C42E0 002BFB00  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802C42E4 002BFB04  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802C42E8 002BFB08  4E 80 00 20 */	blr
.endfn fn_802C42C0

# 0x80534E70 - 0x80534E74
.section .ctors, "a"
.balign 4
	.4byte fn_802C42C0
