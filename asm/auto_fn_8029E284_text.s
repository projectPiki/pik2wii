.include "macros.inc"
.file "auto_fn_8029E284_text"

# 0x8029E284 - 0x8029E2B0
.text
.balign 4

.fn fn_8029E284, global
/* 8029E284 00299AA4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8029E288 00299AA8  38 00 FF FF */	li r0, -0x1
/* 8029E28C 00299AAC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8029E290 00299AB0  3C 80 80 64 */	lis r4, lbl_80638CE0@ha
/* 8029E294 00299AB4  38 64 8C E0 */	addi r3, r4, lbl_80638CE0@l
/* 8029E298 00299AB8  90 0D A3 98 */	stw r0, lbl_8066CB98@sda21(r0)
/* 8029E29C 00299ABC  D0 0D A3 9C */	stfs f0, lbl_8066CB9C@sda21(r0)
/* 8029E2A0 00299AC0  D0 04 8C E0 */	stfs f0, lbl_80638CE0@l(r4)
/* 8029E2A4 00299AC4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8029E2A8 00299AC8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8029E2AC 00299ACC  4E 80 00 20 */	blr
.endfn fn_8029E284

# 0x80534E1C - 0x80534E20
.section .ctors, "a"
.balign 4
	.4byte fn_8029E284
