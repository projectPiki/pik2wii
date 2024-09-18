.include "macros.inc"
.file "auto_fn_8019CD04_text"

# 0x8019CD04 - 0x8019CD30
.text
.balign 4

.fn fn_8019CD04, global
/* 8019CD04 00198524  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8019CD08 00198528  38 00 FF FF */	li r0, -0x1
/* 8019CD0C 0019852C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8019CD10 00198530  3C 80 80 64 */	lis r4, lbl_80638960@ha
/* 8019CD14 00198534  38 64 89 60 */	addi r3, r4, lbl_80638960@l
/* 8019CD18 00198538  90 0D 9F C0 */	stw r0, lbl_8066C7C0@sda21(r0)
/* 8019CD1C 0019853C  D0 0D 9F C4 */	stfs f0, lbl_8066C7C4@sda21(r0)
/* 8019CD20 00198540  D0 04 89 60 */	stfs f0, lbl_80638960@l(r4)
/* 8019CD24 00198544  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8019CD28 00198548  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8019CD2C 0019854C  4E 80 00 20 */	blr
.endfn fn_8019CD04

# 0x80534D34 - 0x80534D38
.section .ctors, "a"
.balign 4
	.4byte fn_8019CD04
