.include "macros.inc"
.file "auto_fn_80081F6C_text"

# 0x80081F6C - 0x80081FB4
.text
.balign 4

.fn fn_80081F6C, global
/* 80081F6C 0007D78C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80081F70 0007D790  7C 08 02 A6 */	mflr r0
/* 80081F74 0007D794  90 01 00 14 */	stw r0, 0x14(r1)
/* 80081F78 0007D798  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80081F7C 0007D79C  3F E0 80 66 */	lis r31, lbl_8065FA50@ha
/* 80081F80 0007D7A0  38 7F FA 50 */	addi r3, r31, lbl_8065FA50@l
/* 80081F84 0007D7A4  48 00 91 F5 */	bl fn_8008B178
/* 80081F88 0007D7A8  3C 80 80 08 */	lis r4, fn_80081FB4@ha
/* 80081F8C 0007D7AC  3C A0 80 5D */	lis r5, lbl_805D5220@ha
/* 80081F90 0007D7B0  38 7F FA 50 */	addi r3, r31, lbl_8065FA50@l
/* 80081F94 0007D7B4  38 84 1F B4 */	addi r4, r4, fn_80081FB4@l
/* 80081F98 0007D7B8  38 A5 52 20 */	addi r5, r5, lbl_805D5220@l
/* 80081F9C 0007D7BC  48 08 1C BD */	bl __register_global_object
/* 80081FA0 0007D7C0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80081FA4 0007D7C4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80081FA8 0007D7C8  7C 08 03 A6 */	mtlr r0
/* 80081FAC 0007D7CC  38 21 00 10 */	addi r1, r1, 0x10
/* 80081FB0 0007D7D0  4E 80 00 20 */	blr
.endfn fn_80081F6C

# 0x80534CFC - 0x80534D00
.section .ctors, "a"
.balign 4
	.4byte fn_80081F6C
