.include "macros.inc"
.file "auto_fn_803A95DC_text"

# 0x803A95DC - 0x803A9608
.text
.balign 4

.fn fn_803A95DC, global
/* 803A95DC 003A4DFC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803A95E0 003A4E00  38 00 FF FF */	li r0, -0x1
/* 803A95E4 003A4E04  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803A95E8 003A4E08  3C 80 80 64 */	lis r4, lbl_806392A8@ha
/* 803A95EC 003A4E0C  38 64 92 A8 */	addi r3, r4, lbl_806392A8@l
/* 803A95F0 003A4E10  90 0D A6 28 */	stw r0, lbl_8066CE28@sda21(r0)
/* 803A95F4 003A4E14  D0 0D A6 2C */	stfs f0, lbl_8066CE2C@sda21(r0)
/* 803A95F8 003A4E18  D0 04 92 A8 */	stfs f0, lbl_806392A8@l(r4)
/* 803A95FC 003A4E1C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803A9600 003A4E20  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803A9604 003A4E24  4E 80 00 20 */	blr
.endfn fn_803A95DC

# 0x80534F40 - 0x80534F44
.section .ctors, "a"
.balign 4
	.4byte fn_803A95DC
