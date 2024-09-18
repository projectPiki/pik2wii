.include "macros.inc"
.file "auto_fn_803C7EAC_text"

# 0x803C7EAC - 0x803C7ED8
.text
.balign 4

.fn fn_803C7EAC, global
/* 803C7EAC 003C36CC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803C7EB0 003C36D0  38 00 FF FF */	li r0, -0x1
/* 803C7EB4 003C36D4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803C7EB8 003C36D8  3C 80 80 64 */	lis r4, lbl_806392F8@ha
/* 803C7EBC 003C36DC  38 64 92 F8 */	addi r3, r4, lbl_806392F8@l
/* 803C7EC0 003C36E0  90 0D A6 C8 */	stw r0, lbl_8066CEC8@sda21(r0)
/* 803C7EC4 003C36E4  D0 0D A6 CC */	stfs f0, lbl_8066CECC@sda21(r0)
/* 803C7EC8 003C36E8  D0 04 92 F8 */	stfs f0, lbl_806392F8@l(r4)
/* 803C7ECC 003C36EC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803C7ED0 003C36F0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803C7ED4 003C36F4  4E 80 00 20 */	blr
.endfn fn_803C7EAC

# 0x80534F5C - 0x80534F60
.section .ctors, "a"
.balign 4
	.4byte fn_803C7EAC
