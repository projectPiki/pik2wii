.include "macros.inc"
.file "auto_fn_80244BB8_text"

# 0x80244BB8 - 0x80244BE4
.text
.balign 4

.fn fn_80244BB8, global
/* 80244BB8 002403D8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80244BBC 002403DC  38 00 FF FF */	li r0, -0x1
/* 80244BC0 002403E0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80244BC4 002403E4  3C 80 80 64 */	lis r4, lbl_80638B60@ha
/* 80244BC8 002403E8  38 64 8B 60 */	addi r3, r4, lbl_80638B60@l
/* 80244BCC 002403EC  90 0D A1 E8 */	stw r0, lbl_8066C9E8@sda21(r0)
/* 80244BD0 002403F0  D0 0D A1 EC */	stfs f0, lbl_8066C9EC@sda21(r0)
/* 80244BD4 002403F4  D0 04 8B 60 */	stfs f0, lbl_80638B60@l(r4)
/* 80244BD8 002403F8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80244BDC 002403FC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80244BE0 00240400  4E 80 00 20 */	blr
.endfn fn_80244BB8

# 0x80534DB8 - 0x80534DBC
.section .ctors, "a"
.balign 4
	.4byte fn_80244BB8
