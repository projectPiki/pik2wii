.include "macros.inc"
.file "auto_fn_8034AE70_text"

# 0x8034AE70 - 0x8034AE9C
.text
.balign 4

.fn fn_8034AE70, global
/* 8034AE70 00346690  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8034AE74 00346694  38 00 FF FF */	li r0, -0x1
/* 8034AE78 00346698  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8034AE7C 0034669C  3C 80 80 64 */	lis r4, lbl_80639198@ha
/* 8034AE80 003466A0  38 64 91 98 */	addi r3, r4, lbl_80639198@l
/* 8034AE84 003466A4  90 0D A5 58 */	stw r0, lbl_8066CD58@sda21(r0)
/* 8034AE88 003466A8  D0 0D A5 5C */	stfs f0, lbl_8066CD5C@sda21(r0)
/* 8034AE8C 003466AC  D0 04 91 98 */	stfs f0, lbl_80639198@l(r4)
/* 8034AE90 003466B0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8034AE94 003466B4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8034AE98 003466B8  4E 80 00 20 */	blr
.endfn fn_8034AE70

# 0x80534EC0 - 0x80534EC4
.section .ctors, "a"
.balign 4
	.4byte fn_8034AE70
