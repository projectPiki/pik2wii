.include "macros.inc"
.file "auto_fn_80082DCC_text"

# 0x80082DCC - 0x80082E14
.text
.balign 4

.fn fn_80082DCC, global
/* 80082DCC 0007E5EC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80082DD0 0007E5F0  7C 08 02 A6 */	mflr r0
/* 80082DD4 0007E5F4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80082DD8 0007E5F8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80082DDC 0007E5FC  3F E0 80 66 */	lis r31, lbl_8065FA5C@ha
/* 80082DE0 0007E600  38 7F FA 5C */	addi r3, r31, lbl_8065FA5C@l
/* 80082DE4 0007E604  48 00 83 95 */	bl fn_8008B178
/* 80082DE8 0007E608  3C 80 80 08 */	lis r4, fn_80082E14@ha
/* 80082DEC 0007E60C  3C A0 80 5D */	lis r5, lbl_805D5230@ha
/* 80082DF0 0007E610  38 7F FA 5C */	addi r3, r31, lbl_8065FA5C@l
/* 80082DF4 0007E614  38 84 2E 14 */	addi r4, r4, fn_80082E14@l
/* 80082DF8 0007E618  38 A5 52 30 */	addi r5, r5, lbl_805D5230@l
/* 80082DFC 0007E61C  48 08 0E 5D */	bl __register_global_object
/* 80082E00 0007E620  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80082E04 0007E624  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80082E08 0007E628  7C 08 03 A6 */	mtlr r0
/* 80082E0C 0007E62C  38 21 00 10 */	addi r1, r1, 0x10
/* 80082E10 0007E630  4E 80 00 20 */	blr
.endfn fn_80082DCC

# 0x80534D00 - 0x80534D04
.section .ctors, "a"
.balign 4
	.4byte fn_80082DCC
