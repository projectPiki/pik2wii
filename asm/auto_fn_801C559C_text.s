.include "macros.inc"
.file "auto_fn_801C559C_text"

# 0x801C559C - 0x801C55C8
.text
.balign 4

.fn fn_801C559C, global
/* 801C559C 001C0DBC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801C55A0 001C0DC0  38 00 FF FF */	li r0, -0x1
/* 801C55A4 001C0DC4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801C55A8 001C0DC8  3C 80 80 64 */	lis r4, lbl_806389E0@ha
/* 801C55AC 001C0DCC  38 64 89 E0 */	addi r3, r4, lbl_806389E0@l
/* 801C55B0 001C0DD0  90 0D A0 48 */	stw r0, lbl_8066C848@sda21(r0)
/* 801C55B4 001C0DD4  D0 0D A0 4C */	stfs f0, lbl_8066C84C@sda21(r0)
/* 801C55B8 001C0DD8  D0 04 89 E0 */	stfs f0, lbl_806389E0@l(r4)
/* 801C55BC 001C0DDC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801C55C0 001C0DE0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801C55C4 001C0DE4  4E 80 00 20 */	blr
.endfn fn_801C559C

# 0x80534D58 - 0x80534D5C
.section .ctors, "a"
.balign 4
	.4byte fn_801C559C
