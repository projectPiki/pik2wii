.include "macros.inc"
.file "auto_fn_80202CD4_text"

# 0x80202CD4 - 0x80202D00
.text
.balign 4

.fn fn_80202CD4, global
/* 80202CD4 001FE4F4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80202CD8 001FE4F8  38 00 FF FF */	li r0, -0x1
/* 80202CDC 001FE4FC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80202CE0 001FE500  3C 80 80 64 */	lis r4, lbl_80638A90@ha
/* 80202CE4 001FE504  38 64 8A 90 */	addi r3, r4, lbl_80638A90@l
/* 80202CE8 001FE508  90 0D A1 20 */	stw r0, lbl_8066C920@sda21(r0)
/* 80202CEC 001FE50C  D0 0D A1 24 */	stfs f0, lbl_8066C924@sda21(r0)
/* 80202CF0 001FE510  D0 04 8A 90 */	stfs f0, lbl_80638A90@l(r4)
/* 80202CF4 001FE514  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80202CF8 001FE518  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80202CFC 001FE51C  4E 80 00 20 */	blr
.endfn fn_80202CD4

# 0x80534D84 - 0x80534D88
.section .ctors, "a"
.balign 4
	.4byte fn_80202CD4
