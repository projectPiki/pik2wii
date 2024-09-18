.include "macros.inc"
.file "auto_fn_80090BB4_text"

# 0x80090BB4 - 0x80090C00
.text
.balign 4

.fn fn_80090BB4, global
/* 80090BB4 0008C3D4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80090BB8 0008C3D8  7C 08 02 A6 */	mflr r0
/* 80090BBC 0008C3DC  38 80 00 00 */	li r4, 0x0
/* 80090BC0 0008C3E0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80090BC4 0008C3E4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80090BC8 0008C3E8  3F E0 80 66 */	lis r31, lbl_8065FAB8@ha
/* 80090BCC 0008C3EC  38 7F FA B8 */	addi r3, r31, lbl_8065FAB8@l
/* 80090BD0 0008C3F0  4B FF A5 05 */	bl fn_8008B0D4
/* 80090BD4 0008C3F4  3C 80 80 09 */	lis r4, fn_80090C00@ha
/* 80090BD8 0008C3F8  3C A0 80 5D */	lis r5, lbl_805D53FC@ha
/* 80090BDC 0008C3FC  38 7F FA B8 */	addi r3, r31, lbl_8065FAB8@l
/* 80090BE0 0008C400  38 84 0C 00 */	addi r4, r4, fn_80090C00@l
/* 80090BE4 0008C404  38 A5 53 FC */	addi r5, r5, lbl_805D53FC@l
/* 80090BE8 0008C408  48 07 30 71 */	bl __register_global_object
/* 80090BEC 0008C40C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80090BF0 0008C410  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80090BF4 0008C414  7C 08 03 A6 */	mtlr r0
/* 80090BF8 0008C418  38 21 00 10 */	addi r1, r1, 0x10
/* 80090BFC 0008C41C  4E 80 00 20 */	blr
.endfn fn_80090BB4

# 0x80534D14 - 0x80534D18
.section .ctors, "a"
.balign 4
	.4byte fn_80090BB4
