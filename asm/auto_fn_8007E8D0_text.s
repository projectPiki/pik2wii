.include "macros.inc"
.file "auto_fn_8007E8D0_text"

# 0x8007E8D0 - 0x8007E918
.text
.balign 4

.fn fn_8007E8D0, global
/* 8007E8D0 0007A0F0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8007E8D4 0007A0F4  7C 08 02 A6 */	mflr r0
/* 8007E8D8 0007A0F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8007E8DC 0007A0FC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8007E8E0 0007A100  3F E0 80 66 */	lis r31, lbl_8065F9B8@ha
/* 8007E8E4 0007A104  38 7F F9 B8 */	addi r3, r31, lbl_8065F9B8@l
/* 8007E8E8 0007A108  48 00 C8 91 */	bl fn_8008B178
/* 8007E8EC 0007A10C  3C 80 80 08 */	lis r4, fn_8007D3D0@ha
/* 8007E8F0 0007A110  3C A0 80 5D */	lis r5, lbl_805D5210@ha
/* 8007E8F4 0007A114  38 7F F9 B8 */	addi r3, r31, lbl_8065F9B8@l
/* 8007E8F8 0007A118  38 84 D3 D0 */	addi r4, r4, fn_8007D3D0@l
/* 8007E8FC 0007A11C  38 A5 52 10 */	addi r5, r5, lbl_805D5210@l
/* 8007E900 0007A120  48 08 53 59 */	bl __register_global_object
/* 8007E904 0007A124  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8007E908 0007A128  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8007E90C 0007A12C  7C 08 03 A6 */	mtlr r0
/* 8007E910 0007A130  38 21 00 10 */	addi r1, r1, 0x10
/* 8007E914 0007A134  4E 80 00 20 */	blr
.endfn fn_8007E8D0

# 0x80534CF8 - 0x80534CFC
.section .ctors, "a"
.balign 4
	.4byte fn_8007E8D0
