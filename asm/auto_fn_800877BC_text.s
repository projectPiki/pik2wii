.include "macros.inc"
.file "auto_fn_800877BC_text"

# 0x800877BC - 0x80087804
.text
.balign 4

.fn fn_800877BC, global
/* 800877BC 00082FDC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800877C0 00082FE0  7C 08 02 A6 */	mflr r0
/* 800877C4 00082FE4  90 01 00 14 */	stw r0, 0x14(r1)
/* 800877C8 00082FE8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800877CC 00082FEC  3F E0 80 66 */	lis r31, lbl_8065FA74@ha
/* 800877D0 00082FF0  38 7F FA 74 */	addi r3, r31, lbl_8065FA74@l
/* 800877D4 00082FF4  48 00 39 A5 */	bl fn_8008B178
/* 800877D8 00082FF8  3C 80 80 08 */	lis r4, fn_80087804@ha
/* 800877DC 00082FFC  3C A0 80 5D */	lis r5, lbl_805D5280@ha
/* 800877E0 00083000  38 7F FA 74 */	addi r3, r31, lbl_8065FA74@l
/* 800877E4 00083004  38 84 78 04 */	addi r4, r4, fn_80087804@l
/* 800877E8 00083008  38 A5 52 80 */	addi r5, r5, lbl_805D5280@l
/* 800877EC 0008300C  48 07 C4 6D */	bl __register_global_object
/* 800877F0 00083010  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800877F4 00083014  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800877F8 00083018  7C 08 03 A6 */	mtlr r0
/* 800877FC 0008301C  38 21 00 10 */	addi r1, r1, 0x10
/* 80087800 00083020  4E 80 00 20 */	blr
.endfn fn_800877BC

# 0x80534D08 - 0x80534D0C
.section .ctors, "a"
.balign 4
	.4byte fn_800877BC
