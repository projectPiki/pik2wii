.include "macros.inc"
.file "auto_fn_8046E650_text"

# 0x8046E650 - 0x8046E67C
.text
.balign 4

.fn fn_8046E650, global
/* 8046E650 00469E70  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8046E654 00469E74  38 00 FF FF */	li r0, -0x1
/* 8046E658 00469E78  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8046E65C 00469E7C  3C 80 80 64 */	lis r4, lbl_80639438@ha
/* 8046E660 00469E80  38 64 94 38 */	addi r3, r4, lbl_80639438@l
/* 8046E664 00469E84  90 0D A9 28 */	stw r0, lbl_8066D128@sda21(r0)
/* 8046E668 00469E88  D0 0D A9 2C */	stfs f0, lbl_8066D12C@sda21(r0)
/* 8046E66C 00469E8C  D0 04 94 38 */	stfs f0, lbl_80639438@l(r4)
/* 8046E670 00469E90  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8046E674 00469E94  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8046E678 00469E98  4E 80 00 20 */	blr
.endfn fn_8046E650

# 0x80534FD4 - 0x80534FD8
.section .ctors, "a"
.balign 4
	.4byte fn_8046E650
