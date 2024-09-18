.include "macros.inc"
.file "auto_fn_8023799C_text"

# 0x8023799C - 0x802379C8
.text
.balign 4

.fn fn_8023799C, global
/* 8023799C 002331BC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802379A0 002331C0  38 00 FF FF */	li r0, -0x1
/* 802379A4 002331C4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802379A8 002331C8  3C 80 80 64 */	lis r4, lbl_80638B10@ha
/* 802379AC 002331CC  38 64 8B 10 */	addi r3, r4, lbl_80638B10@l
/* 802379B0 002331D0  90 0D A1 90 */	stw r0, lbl_8066C990@sda21(r0)
/* 802379B4 002331D4  D0 0D A1 94 */	stfs f0, lbl_8066C994@sda21(r0)
/* 802379B8 002331D8  D0 04 8B 10 */	stfs f0, lbl_80638B10@l(r4)
/* 802379BC 002331DC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802379C0 002331E0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802379C4 002331E4  4E 80 00 20 */	blr
.endfn fn_8023799C

# 0x80534DA4 - 0x80534DA8
.section .ctors, "a"
.balign 4
	.4byte fn_8023799C
