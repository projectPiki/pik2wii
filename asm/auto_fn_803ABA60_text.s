.include "macros.inc"
.file "auto_fn_803ABA60_text"

# 0x803ABA60 - 0x803ABA8C
.text
.balign 4

.fn fn_803ABA60, global
/* 803ABA60 003A7280  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803ABA64 003A7284  38 00 FF FF */	li r0, -0x1
/* 803ABA68 003A7288  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803ABA6C 003A728C  3C 80 80 64 */	lis r4, lbl_806392C8@ha
/* 803ABA70 003A7290  38 64 92 C8 */	addi r3, r4, lbl_806392C8@l
/* 803ABA74 003A7294  90 0D A6 38 */	stw r0, lbl_8066CE38@sda21(r0)
/* 803ABA78 003A7298  D0 0D A6 3C */	stfs f0, lbl_8066CE3C@sda21(r0)
/* 803ABA7C 003A729C  D0 04 92 C8 */	stfs f0, lbl_806392C8@l(r4)
/* 803ABA80 003A72A0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803ABA84 003A72A4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803ABA88 003A72A8  4E 80 00 20 */	blr
.endfn fn_803ABA60

# 0x80534F48 - 0x80534F4C
.section .ctors, "a"
.balign 4
	.4byte fn_803ABA60
