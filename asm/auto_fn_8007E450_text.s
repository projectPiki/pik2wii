.include "macros.inc"
.file "auto_fn_8007E450_text"

# 0x8007E450 - 0x8007E498
.text
.balign 4

.fn fn_8007E450, global
/* 8007E450 00079C70  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8007E454 00079C74  7C 08 02 A6 */	mflr r0
/* 8007E458 00079C78  90 01 00 14 */	stw r0, 0x14(r1)
/* 8007E45C 00079C7C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8007E460 00079C80  3F E0 80 66 */	lis r31, lbl_8065F9AC@ha
/* 8007E464 00079C84  38 7F F9 AC */	addi r3, r31, lbl_8065F9AC@l
/* 8007E468 00079C88  48 00 CD 11 */	bl fn_8008B178
/* 8007E46C 00079C8C  3C 80 80 08 */	lis r4, fn_8007E498@ha
/* 8007E470 00079C90  3C A0 80 5D */	lis r5, lbl_805D5200@ha
/* 8007E474 00079C94  38 7F F9 AC */	addi r3, r31, lbl_8065F9AC@l
/* 8007E478 00079C98  38 84 E4 98 */	addi r4, r4, fn_8007E498@l
/* 8007E47C 00079C9C  38 A5 52 00 */	addi r5, r5, lbl_805D5200@l
/* 8007E480 00079CA0  48 08 57 D9 */	bl __register_global_object
/* 8007E484 00079CA4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8007E488 00079CA8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8007E48C 00079CAC  7C 08 03 A6 */	mtlr r0
/* 8007E490 00079CB0  38 21 00 10 */	addi r1, r1, 0x10
/* 8007E494 00079CB4  4E 80 00 20 */	blr
.endfn fn_8007E450

# 0x80534CF4 - 0x80534CF8
.section .ctors, "a"
.balign 4
	.4byte fn_8007E450
