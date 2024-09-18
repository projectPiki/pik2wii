.include "macros.inc"
.file "auto_fn_8007D388_text"

# 0x8007D388 - 0x8007D3D0
.text
.balign 4

.fn fn_8007D388, global
/* 8007D388 00078BA8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8007D38C 00078BAC  7C 08 02 A6 */	mflr r0
/* 8007D390 00078BB0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8007D394 00078BB4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8007D398 00078BB8  3F E0 80 66 */	lis r31, lbl_8065F9A0@ha
/* 8007D39C 00078BBC  38 7F F9 A0 */	addi r3, r31, lbl_8065F9A0@l
/* 8007D3A0 00078BC0  48 00 DD D9 */	bl fn_8008B178
/* 8007D3A4 00078BC4  3C 80 80 08 */	lis r4, fn_8007D3D0@ha
/* 8007D3A8 00078BC8  3C A0 80 5D */	lis r5, lbl_805D51D8@ha
/* 8007D3AC 00078BCC  38 7F F9 A0 */	addi r3, r31, lbl_8065F9A0@l
/* 8007D3B0 00078BD0  38 84 D3 D0 */	addi r4, r4, fn_8007D3D0@l
/* 8007D3B4 00078BD4  38 A5 51 D8 */	addi r5, r5, lbl_805D51D8@l
/* 8007D3B8 00078BD8  48 08 68 A1 */	bl __register_global_object
/* 8007D3BC 00078BDC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8007D3C0 00078BE0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8007D3C4 00078BE4  7C 08 03 A6 */	mtlr r0
/* 8007D3C8 00078BE8  38 21 00 10 */	addi r1, r1, 0x10
/* 8007D3CC 00078BEC  4E 80 00 20 */	blr
.endfn fn_8007D388

# 0x80534CF0 - 0x80534CF4
.section .ctors, "a"
.balign 4
	.4byte fn_8007D388
