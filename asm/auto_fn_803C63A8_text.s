.include "macros.inc"
.file "auto_fn_803C63A8_text"

# 0x803C63A8 - 0x803C63D4
.text
.balign 4

.fn fn_803C63A8, global
/* 803C63A8 003C1BC8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803C63AC 003C1BCC  38 00 FF FF */	li r0, -0x1
/* 803C63B0 003C1BD0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803C63B4 003C1BD4  3C 80 80 64 */	lis r4, lbl_806392E8@ha
/* 803C63B8 003C1BD8  38 64 92 E8 */	addi r3, r4, lbl_806392E8@l
/* 803C63BC 003C1BDC  90 0D A6 B8 */	stw r0, lbl_8066CEB8@sda21(r0)
/* 803C63C0 003C1BE0  D0 0D A6 BC */	stfs f0, lbl_8066CEBC@sda21(r0)
/* 803C63C4 003C1BE4  D0 04 92 E8 */	stfs f0, lbl_806392E8@l(r4)
/* 803C63C8 003C1BE8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803C63CC 003C1BEC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803C63D0 003C1BF0  4E 80 00 20 */	blr
.endfn fn_803C63A8

# 0x80534F58 - 0x80534F5C
.section .ctors, "a"
.balign 4
	.4byte fn_803C63A8
