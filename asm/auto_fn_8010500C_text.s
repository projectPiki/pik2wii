.include "macros.inc"
.file "auto_fn_8010500C_text"

# 0x80006540 - 0x80006548
.section extab, "a"
.balign 4

.obj "@etb_80006540", local
.hidden "@etb_80006540"
	.4byte 0x18080000
	.4byte 0x00000000
.endobj "@etb_80006540"

# 0x80006980 - 0x8000698C
.section extabindex, "a"
.balign 4

.obj "@eti_80006980", local
.hidden "@eti_80006980"
	.4byte fn_8010500C
	.4byte 0x000000A4
	.4byte "@etb_80006540"
.endobj "@eti_80006980"

# 0x8010500C - 0x801050B0
.text
.balign 4

.fn fn_8010500C, global
/* 8010500C 0010082C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80105010 00100830  7C 08 02 A6 */	mflr r0
/* 80105014 00100834  90 01 00 24 */	stw r0, 0x24(r1)
/* 80105018 00100838  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8010501C 0010083C  3B E0 00 00 */	li r31, 0x0
/* 80105020 00100840  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80105024 00100844  3B C0 00 03 */	li r30, 0x3
/* 80105028 00100848  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8010502C 0010084C  3F A0 80 57 */	lis r29, lbl_8056BD38@ha
/* 80105030 00100850  3B BD BD 38 */	addi r29, r29, lbl_8056BD38@l
/* 80105034 00100854  48 00 00 58 */	b .L_8010508C
.L_80105038:
/* 80105038 00100858  80 1D 00 04 */	lwz r0, 0x4(r29)
/* 8010503C 0010085C  54 00 57 7F */	extrwi. r0, r0, 3, 7
/* 80105040 00100860  41 82 00 0C */	beq .L_8010504C
/* 80105044 00100864  7F A3 EB 78 */	mr r3, r29
/* 80105048 00100868  48 00 1E D1 */	bl fn_80106F18
.L_8010504C:
/* 8010504C 0010086C  7F A3 EB 78 */	mr r3, r29
/* 80105050 00100870  83 BD 00 4C */	lwz r29, 0x4c(r29)
/* 80105054 00100874  88 03 00 0C */	lbz r0, 0xc(r3)
/* 80105058 00100878  2C 00 00 00 */	cmpwi r0, 0x0
/* 8010505C 0010087C  41 82 00 0C */	beq .L_80105068
/* 80105060 00100880  4B FF FE 7D */	bl fn_80104EDC
/* 80105064 00100884  48 00 00 28 */	b .L_8010508C
.L_80105068:
/* 80105068 00100888  80 03 00 04 */	lwz r0, 0x4(r3)
/* 8010506C 0010088C  53 C0 B1 D2 */	rlwimi r0, r30, 22, 7, 9
/* 80105070 00100890  2C 1D 00 00 */	cmpwi r29, 0x0
/* 80105074 00100894  90 03 00 04 */	stw r0, 0x4(r3)
/* 80105078 00100898  41 82 00 14 */	beq .L_8010508C
/* 8010507C 0010089C  88 1D 00 0C */	lbz r0, 0xc(r29)
/* 80105080 001008A0  2C 00 00 00 */	cmpwi r0, 0x0
/* 80105084 001008A4  41 82 00 08 */	beq .L_8010508C
/* 80105088 001008A8  93 E3 00 4C */	stw r31, 0x4c(r3)
.L_8010508C:
/* 8010508C 001008AC  2C 1D 00 00 */	cmpwi r29, 0x0
/* 80105090 001008B0  40 82 FF A8 */	bne .L_80105038
/* 80105094 001008B4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80105098 001008B8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8010509C 001008BC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801050A0 001008C0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 801050A4 001008C4  7C 08 03 A6 */	mtlr r0
/* 801050A8 001008C8  38 21 00 20 */	addi r1, r1, 0x20
/* 801050AC 001008CC  4E 80 00 20 */	blr
.endfn fn_8010500C