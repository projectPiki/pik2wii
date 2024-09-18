.include "macros.inc"
.file "auto_fn_801099DC_text"

# 0x80006608 - 0x80006610
.section extab, "a"
.balign 4

.obj "@etb_80006608", local
.hidden "@etb_80006608"
	.4byte 0x10080000
	.4byte 0x00000000
.endobj "@etb_80006608"

# 0x80006AAC - 0x80006AB8
.section extabindex, "a"
.balign 4

.obj "@eti_80006AAC", local
.hidden "@eti_80006AAC"
	.4byte fn_801099DC
	.4byte 0x00000058
	.4byte "@etb_80006608"
.endobj "@eti_80006AAC"

# 0x801099DC - 0x80109A34
.text
.balign 4

.fn fn_801099DC, global
/* 801099DC 001051FC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801099E0 00105200  7C 08 02 A6 */	mflr r0
/* 801099E4 00105204  90 01 00 14 */	stw r0, 0x14(r1)
/* 801099E8 00105208  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801099EC 0010520C  7C BF 2B 78 */	mr r31, r5
/* 801099F0 00105210  93 C1 00 08 */	stw r30, 0x8(r1)
/* 801099F4 00105214  7C 7E 1B 78 */	mr r30, r3
/* 801099F8 00105218  7C 83 23 78 */	mr r3, r4
/* 801099FC 0010521C  38 80 00 01 */	li r4, 0x1
/* 80109A00 00105220  7F C6 F3 78 */	mr r6, r30
/* 80109A04 00105224  4B FF D2 0D */	bl fn_80106C10
/* 80109A08 00105228  7C 1F 18 40 */	cmplw r31, r3
/* 80109A0C 0010522C  40 82 00 08 */	bne .L_80109A14
/* 80109A10 00105230  48 00 00 08 */	b .L_80109A18
.L_80109A14:
/* 80109A14 00105234  3B C0 00 00 */	li r30, 0x0
.L_80109A18:
/* 80109A18 00105238  7F C3 F3 78 */	mr r3, r30
/* 80109A1C 0010523C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80109A20 00105240  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 80109A24 00105244  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80109A28 00105248  7C 08 03 A6 */	mtlr r0
/* 80109A2C 0010524C  38 21 00 10 */	addi r1, r1, 0x10
/* 80109A30 00105250  4E 80 00 20 */	blr
.endfn fn_801099DC
