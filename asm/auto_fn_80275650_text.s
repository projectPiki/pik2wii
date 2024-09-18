.include "macros.inc"
.file "auto_fn_80275650_text"

# 0x80275650 - 0x8027567C
.text
.balign 4

.fn fn_80275650, global
/* 80275650 00270E70  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80275654 00270E74  38 00 FF FF */	li r0, -0x1
/* 80275658 00270E78  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8027565C 00270E7C  3C 80 80 64 */	lis r4, lbl_80638BE0@ha
/* 80275660 00270E80  38 64 8B E0 */	addi r3, r4, lbl_80638BE0@l
/* 80275664 00270E84  90 0D A2 A0 */	stw r0, lbl_8066CAA0@sda21(r0)
/* 80275668 00270E88  D0 0D A2 A4 */	stfs f0, lbl_8066CAA4@sda21(r0)
/* 8027566C 00270E8C  D0 04 8B E0 */	stfs f0, lbl_80638BE0@l(r4)
/* 80275670 00270E90  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80275674 00270E94  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80275678 00270E98  4E 80 00 20 */	blr
.endfn fn_80275650

# 0x80534DDC - 0x80534DE0
.section .ctors, "a"
.balign 4
	.4byte fn_80275650
