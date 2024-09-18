.include "macros.inc"
.file "auto_fn_802C2644_text"

# 0x802C2644 - 0x802C2670
.text
.balign 4

.fn fn_802C2644, global
/* 802C2644 002BDE64  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802C2648 002BDE68  38 00 FF FF */	li r0, -0x1
/* 802C264C 002BDE6C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802C2650 002BDE70  3C 80 80 64 */	lis r4, lbl_80638E08@ha
/* 802C2654 002BDE74  38 64 8E 08 */	addi r3, r4, lbl_80638E08@l
/* 802C2658 002BDE78  90 0D A4 80 */	stw r0, lbl_8066CC80@sda21(r0)
/* 802C265C 002BDE7C  D0 0D A4 84 */	stfs f0, lbl_8066CC84@sda21(r0)
/* 802C2660 002BDE80  D0 04 8E 08 */	stfs f0, lbl_80638E08@l(r4)
/* 802C2664 002BDE84  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802C2668 002BDE88  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802C266C 002BDE8C  4E 80 00 20 */	blr
.endfn fn_802C2644

# 0x80534E6C - 0x80534E70
.section .ctors, "a"
.balign 4
	.4byte fn_802C2644
