.include "macros.inc"
.file "auto_fn_801B6CE8_text"

# 0x801B6CE8 - 0x801B6D14
.text
.balign 4

.fn fn_801B6CE8, global
/* 801B6CE8 001B2508  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801B6CEC 001B250C  38 00 FF FF */	li r0, -0x1
/* 801B6CF0 001B2510  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801B6CF4 001B2514  3C 80 80 64 */	lis r4, lbl_806389C0@ha
/* 801B6CF8 001B2518  38 64 89 C0 */	addi r3, r4, lbl_806389C0@l
/* 801B6CFC 001B251C  90 0D A0 20 */	stw r0, lbl_8066C820@sda21(r0)
/* 801B6D00 001B2520  D0 0D A0 24 */	stfs f0, lbl_8066C824@sda21(r0)
/* 801B6D04 001B2524  D0 04 89 C0 */	stfs f0, lbl_806389C0@l(r4)
/* 801B6D08 001B2528  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801B6D0C 001B252C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801B6D10 001B2530  4E 80 00 20 */	blr
.endfn fn_801B6CE8

# 0x80534D4C - 0x80534D50
.section .ctors, "a"
.balign 4
	.4byte fn_801B6CE8
