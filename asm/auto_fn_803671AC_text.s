.include "macros.inc"
.file "auto_fn_803671AC_text"

# 0x803671AC - 0x803671D8
.text
.balign 4

.fn fn_803671AC, global
/* 803671AC 003629CC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803671B0 003629D0  38 00 FF FF */	li r0, -0x1
/* 803671B4 003629D4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803671B8 003629D8  3C 80 80 64 */	lis r4, lbl_806391E8@ha
/* 803671BC 003629DC  38 64 91 E8 */	addi r3, r4, lbl_806391E8@l
/* 803671C0 003629E0  90 0D A5 88 */	stw r0, lbl_8066CD88@sda21(r0)
/* 803671C4 003629E4  D0 0D A5 8C */	stfs f0, lbl_8066CD8C@sda21(r0)
/* 803671C8 003629E8  D0 04 91 E8 */	stfs f0, lbl_806391E8@l(r4)
/* 803671CC 003629EC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803671D0 003629F0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803671D4 003629F4  4E 80 00 20 */	blr
.endfn fn_803671AC

# 0x80534ED4 - 0x80534ED8
.section .ctors, "a"
.balign 4
	.4byte fn_803671AC
