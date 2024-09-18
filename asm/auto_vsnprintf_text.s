.include "macros.inc"
.file "auto_vsnprintf_text"

# 0x80006620 - 0x80006628
.section extab, "a"
.balign 4

.obj "@etb_80006620", local
.hidden "@etb_80006620"
	.4byte 0x18080000
	.4byte 0x00000000
.endobj "@etb_80006620"

# 0x80006AD0 - 0x80006ADC
.section extabindex, "a"
.balign 4

.obj "@eti_80006AD0", local
.hidden "@eti_80006AD0"
	.4byte vsnprintf
	.4byte 0x00000084
	.4byte "@etb_80006620"
.endobj "@eti_80006AD0"

# 0x80109B18 - 0x80109B9C
.text
.balign 4

.fn vsnprintf, global
/* 80109B18 00105338  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80109B1C 0010533C  7C 08 02 A6 */	mflr r0
/* 80109B20 00105340  3C E0 80 11 */	lis r7, __StringWrite@ha
/* 80109B24 00105344  90 01 00 34 */	stw r0, 0x34(r1)
/* 80109B28 00105348  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80109B2C 0010534C  3B E0 00 00 */	li r31, 0x0
/* 80109B30 00105350  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80109B34 00105354  7C 9E 23 78 */	mr r30, r4
/* 80109B38 00105358  93 A1 00 24 */	stw r29, 0x24(r1)
/* 80109B3C 0010535C  7C 7D 1B 78 */	mr r29, r3
/* 80109B40 00105360  90 61 00 08 */	stw r3, 0x8(r1)
/* 80109B44 00105364  38 67 9A 34 */	addi r3, r7, __StringWrite@l
/* 80109B48 00105368  90 81 00 0C */	stw r4, 0xc(r1)
/* 80109B4C 0010536C  38 81 00 08 */	addi r4, r1, 0x8
/* 80109B50 00105370  93 E1 00 10 */	stw r31, 0x10(r1)
/* 80109B54 00105374  4B FF F6 2D */	bl __pformatter_80109180
/* 80109B58 00105378  2C 1D 00 00 */	cmpwi r29, 0x0
/* 80109B5C 0010537C  41 82 00 24 */	beq .L_80109B80
/* 80109B60 00105380  7C 03 F0 40 */	cmplw r3, r30
/* 80109B64 00105384  40 80 00 0C */	bge .L_80109B70
/* 80109B68 00105388  7F FD 19 AE */	stbx r31, r29, r3
/* 80109B6C 0010538C  48 00 00 14 */	b .L_80109B80
.L_80109B70:
/* 80109B70 00105390  2C 1E 00 00 */	cmpwi r30, 0x0
/* 80109B74 00105394  41 82 00 0C */	beq .L_80109B80
/* 80109B78 00105398  7C 9D F2 14 */	add r4, r29, r30
/* 80109B7C 0010539C  9B E4 FF FF */	stb r31, -0x1(r4)
.L_80109B80:
/* 80109B80 001053A0  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80109B84 001053A4  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80109B88 001053A8  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80109B8C 001053AC  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80109B90 001053B0  7C 08 03 A6 */	mtlr r0
/* 80109B94 001053B4  38 21 00 30 */	addi r1, r1, 0x30
/* 80109B98 001053B8  4E 80 00 20 */	blr
.endfn vsnprintf
