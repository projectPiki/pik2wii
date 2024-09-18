.include "macros.inc"
.file "auto_fn_8029D4D0_text"

# 0x8029D4D0 - 0x8029D4FC
.text
.balign 4

.fn fn_8029D4D0, global
/* 8029D4D0 00298CF0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8029D4D4 00298CF4  38 00 FF FF */	li r0, -0x1
/* 8029D4D8 00298CF8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8029D4DC 00298CFC  3C 80 80 64 */	lis r4, lbl_80638CD0@ha
/* 8029D4E0 00298D00  38 64 8C D0 */	addi r3, r4, lbl_80638CD0@l
/* 8029D4E4 00298D04  90 0D A3 90 */	stw r0, lbl_8066CB90@sda21(r0)
/* 8029D4E8 00298D08  D0 0D A3 94 */	stfs f0, lbl_8066CB94@sda21(r0)
/* 8029D4EC 00298D0C  D0 04 8C D0 */	stfs f0, lbl_80638CD0@l(r4)
/* 8029D4F0 00298D10  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8029D4F4 00298D14  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8029D4F8 00298D18  4E 80 00 20 */	blr
.endfn fn_8029D4D0

# 0x80534E18 - 0x80534E1C
.section .ctors, "a"
.balign 4
	.4byte fn_8029D4D0
