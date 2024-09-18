.include "macros.inc"
.file "auto_fn_8036ABC4_text"

# 0x8036ABC4 - 0x8036ABF0
.text
.balign 4

.fn fn_8036ABC4, global
/* 8036ABC4 003663E4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8036ABC8 003663E8  38 00 FF FF */	li r0, -0x1
/* 8036ABCC 003663EC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8036ABD0 003663F0  3C 80 80 64 */	lis r4, lbl_806391F8@ha
/* 8036ABD4 003663F4  38 64 91 F8 */	addi r3, r4, lbl_806391F8@l
/* 8036ABD8 003663F8  90 0D A5 90 */	stw r0, lbl_8066CD90@sda21(r0)
/* 8036ABDC 003663FC  D0 0D A5 94 */	stfs f0, lbl_8066CD94@sda21(r0)
/* 8036ABE0 00366400  D0 04 91 F8 */	stfs f0, lbl_806391F8@l(r4)
/* 8036ABE4 00366404  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8036ABE8 00366408  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8036ABEC 0036640C  4E 80 00 20 */	blr
.endfn fn_8036ABC4

# 0x80534ED8 - 0x80534EDC
.section .ctors, "a"
.balign 4
	.4byte fn_8036ABC4
