.include "macros.inc"
.file "auto_fn_802675A0_text"

# 0x802675A0 - 0x802675CC
.text
.balign 4

.fn fn_802675A0, global
/* 802675A0 00262DC0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802675A4 00262DC4  38 00 FF FF */	li r0, -0x1
/* 802675A8 00262DC8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802675AC 00262DCC  3C 80 80 64 */	lis r4, lbl_80638BC0@ha
/* 802675B0 00262DD0  38 64 8B C0 */	addi r3, r4, lbl_80638BC0@l
/* 802675B4 00262DD4  90 0D A2 70 */	stw r0, lbl_8066CA70@sda21(r0)
/* 802675B8 00262DD8  D0 0D A2 74 */	stfs f0, lbl_8066CA74@sda21(r0)
/* 802675BC 00262DDC  D0 04 8B C0 */	stfs f0, lbl_80638BC0@l(r4)
/* 802675C0 00262DE0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802675C4 00262DE4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802675C8 00262DE8  4E 80 00 20 */	blr
.endfn fn_802675A0

# 0x80534DD4 - 0x80534DD8
.section .ctors, "a"
.balign 4
	.4byte fn_802675A0
