.include "macros.inc"
.file "auto_fn_803E54B8_text"

# 0x803E54B8 - 0x803E54E4
.text
.balign 4

.fn fn_803E54B8, global
/* 803E54B8 003E0CD8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803E54BC 003E0CDC  38 00 FF FF */	li r0, -0x1
/* 803E54C0 003E0CE0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803E54C4 003E0CE4  3C 80 80 64 */	lis r4, lbl_80639348@ha
/* 803E54C8 003E0CE8  38 64 93 48 */	addi r3, r4, lbl_80639348@l
/* 803E54CC 003E0CEC  90 0D A6 F8 */	stw r0, lbl_8066CEF8@sda21(r0)
/* 803E54D0 003E0CF0  D0 0D A6 FC */	stfs f0, lbl_8066CEFC@sda21(r0)
/* 803E54D4 003E0CF4  D0 04 93 48 */	stfs f0, lbl_80639348@l(r4)
/* 803E54D8 003E0CF8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803E54DC 003E0CFC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803E54E0 003E0D00  4E 80 00 20 */	blr
.endfn fn_803E54B8

# 0x80534F70 - 0x80534F74
.section .ctors, "a"
.balign 4
	.4byte fn_803E54B8
