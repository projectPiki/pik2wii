.include "macros.inc"
.file "auto_fn_80084648_text"

# 0x80084648 - 0x80084690
.text
.balign 4

.fn fn_80084648, global
/* 80084648 0007FE68  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8008464C 0007FE6C  7C 08 02 A6 */	mflr r0
/* 80084650 0007FE70  90 01 00 14 */	stw r0, 0x14(r1)
/* 80084654 0007FE74  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80084658 0007FE78  3F E0 80 66 */	lis r31, lbl_8065FA68@ha
/* 8008465C 0007FE7C  38 7F FA 68 */	addi r3, r31, lbl_8065FA68@l
/* 80084660 0007FE80  48 00 6B 19 */	bl fn_8008B178
/* 80084664 0007FE84  3C 80 80 08 */	lis r4, fn_80084690@ha
/* 80084668 0007FE88  3C A0 80 5D */	lis r5, lbl_805D5258@ha
/* 8008466C 0007FE8C  38 7F FA 68 */	addi r3, r31, lbl_8065FA68@l
/* 80084670 0007FE90  38 84 46 90 */	addi r4, r4, fn_80084690@l
/* 80084674 0007FE94  38 A5 52 58 */	addi r5, r5, lbl_805D5258@l
/* 80084678 0007FE98  48 07 F5 E1 */	bl __register_global_object
/* 8008467C 0007FE9C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80084680 0007FEA0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80084684 0007FEA4  7C 08 03 A6 */	mtlr r0
/* 80084688 0007FEA8  38 21 00 10 */	addi r1, r1, 0x10
/* 8008468C 0007FEAC  4E 80 00 20 */	blr
.endfn fn_80084648

# 0x80534D04 - 0x80534D08
.section .ctors, "a"
.balign 4
	.4byte fn_80084648
