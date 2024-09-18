.include "macros.inc"
.file "auto_fn_800F1360_text"

# 0x800F1360 - 0x800F13AC
.text
.balign 4

.fn fn_800F1360, global
/* 800F1360 000ECB80  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800F1364 000ECB84  7C 08 02 A6 */	mflr r0
/* 800F1368 000ECB88  38 80 00 00 */	li r4, 0x0
/* 800F136C 000ECB8C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800F1370 000ECB90  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800F1374 000ECB94  3F E0 80 67 */	lis r31, lbl_806683FC@ha
/* 800F1378 000ECB98  38 7F 83 FC */	addi r3, r31, lbl_806683FC@l
/* 800F137C 000ECB9C  4B F9 9D 59 */	bl fn_8008B0D4
/* 800F1380 000ECBA0  3C 80 80 0F */	lis r4, fn_800F13AC@ha
/* 800F1384 000ECBA4  3C A0 80 5D */	lis r5, lbl_805D5830@ha
/* 800F1388 000ECBA8  38 7F 83 FC */	addi r3, r31, lbl_806683FC@l
/* 800F138C 000ECBAC  38 84 13 AC */	addi r4, r4, fn_800F13AC@l
/* 800F1390 000ECBB0  38 A5 58 30 */	addi r5, r5, lbl_805D5830@l
/* 800F1394 000ECBB4  48 01 28 C5 */	bl __register_global_object
/* 800F1398 000ECBB8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800F139C 000ECBBC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800F13A0 000ECBC0  7C 08 03 A6 */	mtlr r0
/* 800F13A4 000ECBC4  38 21 00 10 */	addi r1, r1, 0x10
/* 800F13A8 000ECBC8  4E 80 00 20 */	blr
.endfn fn_800F1360

# 0x80534D30 - 0x80534D34
.section .ctors, "a"
.balign 4
	.4byte fn_800F1360
