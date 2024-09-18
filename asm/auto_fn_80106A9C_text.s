.include "macros.inc"
.file "auto_fn_80106A9C_text"

# 0x80006588 - 0x80006590
.section extab, "a"
.balign 4

.obj "@etb_80006588", local
.hidden "@etb_80006588"
	.4byte 0x00080000
	.4byte 0x00000000
.endobj "@etb_80006588"

# 0x800069EC - 0x800069F8
.section extabindex, "a"
.balign 4

.obj "@eti_800069EC", local
.hidden "@eti_800069EC"
	.4byte fn_80106A9C
	.4byte 0x0000005C
	.4byte "@etb_80006588"
.endobj "@eti_800069EC"

# 0x80106A9C - 0x80106AF8
.text
.balign 4

.fn fn_80106A9C, global
/* 80106A9C 001022BC  2C 03 00 00 */	cmpwi r3, 0x0
/* 80106AA0 001022C0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80106AA4 001022C4  7C 67 1B 78 */	mr r7, r3
/* 80106AA8 001022C8  38 A0 00 01 */	li r5, 0x1
/* 80106AAC 001022CC  38 C0 00 01 */	li r6, 0x1
/* 80106AB0 001022D0  40 80 00 0C */	bge .L_80106ABC
/* 80106AB4 001022D4  7C E3 00 D0 */	neg r7, r3
/* 80106AB8 001022D8  38 A0 FF FF */	li r5, -0x1
.L_80106ABC:
/* 80106ABC 001022DC  2C 04 00 00 */	cmpwi r4, 0x0
/* 80106AC0 001022E0  40 80 00 0C */	bge .L_80106ACC
/* 80106AC4 001022E4  7C 84 00 D0 */	neg r4, r4
/* 80106AC8 001022E8  38 C0 FF FF */	li r6, -0x1
.L_80106ACC:
/* 80106ACC 001022EC  7C 67 23 D6 */	divw r3, r7, r4
/* 80106AD0 001022F0  7C 05 31 D6 */	mullw r0, r5, r6
/* 80106AD4 001022F4  7C 63 01 D6 */	mullw r3, r3, r0
/* 80106AD8 001022F8  7C 06 21 D6 */	mullw r0, r6, r4
/* 80106ADC 001022FC  90 61 00 08 */	stw r3, 0x8(r1)
/* 80106AE0 00102300  7C 80 19 D6 */	mullw r4, r0, r3
/* 80106AE4 00102304  7C 07 29 D6 */	mullw r0, r7, r5
/* 80106AE8 00102308  7C 84 00 50 */	subf r4, r4, r0
/* 80106AEC 0010230C  90 81 00 0C */	stw r4, 0xc(r1)
/* 80106AF0 00102310  38 21 00 10 */	addi r1, r1, 0x10
/* 80106AF4 00102314  4E 80 00 20 */	blr
.endfn fn_80106A9C
