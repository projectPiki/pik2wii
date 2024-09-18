.include "macros.inc"
.file "auto_fn_80109B9C_text"

# 0x80006628 - 0x80006630
.section extab, "a"
.balign 4

.obj "@etb_80006628", local
.hidden "@etb_80006628"
	.4byte 0x18080000
	.4byte 0x00000000
.endobj "@etb_80006628"

# 0x80006ADC - 0x80006AE8
.section extabindex, "a"
.balign 4

.obj "@eti_80006ADC", local
.hidden "@eti_80006ADC"
	.4byte fn_80109B9C
	.4byte 0x00000080
	.4byte "@etb_80006628"
.endobj "@eti_80006ADC"

# 0x80109B9C - 0x80109C1C
.text
.balign 4

.fn fn_80109B9C, global
/* 80109B9C 001053BC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80109BA0 001053C0  7C 08 02 A6 */	mflr r0
/* 80109BA4 001053C4  7C A6 2B 78 */	mr r6, r5
/* 80109BA8 001053C8  7C 85 23 78 */	mr r5, r4
/* 80109BAC 001053CC  90 01 00 34 */	stw r0, 0x34(r1)
/* 80109BB0 001053D0  3C E0 80 11 */	lis r7, __StringWrite@ha
/* 80109BB4 001053D4  38 81 00 08 */	addi r4, r1, 0x8
/* 80109BB8 001053D8  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80109BBC 001053DC  3B E0 00 00 */	li r31, 0x0
/* 80109BC0 001053E0  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80109BC4 001053E4  3B C0 FF FF */	li r30, -0x1
/* 80109BC8 001053E8  93 A1 00 24 */	stw r29, 0x24(r1)
/* 80109BCC 001053EC  7C 7D 1B 78 */	mr r29, r3
/* 80109BD0 001053F0  90 61 00 08 */	stw r3, 0x8(r1)
/* 80109BD4 001053F4  38 67 9A 34 */	addi r3, r7, __StringWrite@l
/* 80109BD8 001053F8  93 C1 00 0C */	stw r30, 0xc(r1)
/* 80109BDC 001053FC  93 E1 00 10 */	stw r31, 0x10(r1)
/* 80109BE0 00105400  4B FF F5 A1 */	bl __pformatter_80109180
/* 80109BE4 00105404  2C 1D 00 00 */	cmpwi r29, 0x0
/* 80109BE8 00105408  41 82 00 18 */	beq .L_80109C00
/* 80109BEC 0010540C  7C 03 F0 40 */	cmplw r3, r30
/* 80109BF0 00105410  40 80 00 0C */	bge .L_80109BFC
/* 80109BF4 00105414  7F FD 19 AE */	stbx r31, r29, r3
/* 80109BF8 00105418  48 00 00 08 */	b .L_80109C00
.L_80109BFC:
/* 80109BFC 0010541C  9B FD FF FE */	stb r31, -0x2(r29)
.L_80109C00:
/* 80109C00 00105420  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80109C04 00105424  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80109C08 00105428  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80109C0C 0010542C  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80109C10 00105430  7C 08 03 A6 */	mtlr r0
/* 80109C14 00105434  38 21 00 30 */	addi r1, r1, 0x30
/* 80109C18 00105438  4E 80 00 20 */	blr
.endfn fn_80109B9C
