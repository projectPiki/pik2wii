.include "macros.inc"
.file "auto_fn_801071B4_text"

# 0x800065B0 - 0x800065B8
.section extab, "a"
.balign 4

.obj "@etb_800065B0", local
.hidden "@etb_800065B0"
	.4byte 0x10080000
	.4byte 0x00000000
.endobj "@etb_800065B0"

# 0x80006A28 - 0x80006A34
.section extabindex, "a"
.balign 4

.obj "@eti_80006A28", local
.hidden "@eti_80006A28"
	.4byte fn_801071B4
	.4byte 0x000001C4
	.4byte "@etb_800065B0"
.endobj "@eti_80006A28"

# 0x801071B4 - 0x80107378
.text
.balign 4

.fn fn_801071B4, global
/* 801071B4 001029D4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801071B8 001029D8  7C 08 02 A6 */	mflr r0
/* 801071BC 001029DC  90 01 00 24 */	stw r0, 0x24(r1)
/* 801071C0 001029E0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801071C4 001029E4  7C BF 2B 78 */	mr r31, r5
/* 801071C8 001029E8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801071CC 001029EC  7C 7E 1B 78 */	mr r30, r3
/* 801071D0 001029F0  90 81 00 08 */	stw r4, 0x8(r1)
/* 801071D4 001029F4  80 03 00 04 */	lwz r0, 0x4(r3)
/* 801071D8 001029F8  54 00 57 7E */	extrwi r0, r0, 3, 7
/* 801071DC 001029FC  28 00 00 01 */	cmplwi r0, 0x1
/* 801071E0 00102A00  40 82 00 10 */	bne .L_801071F0
/* 801071E4 00102A04  88 03 00 0A */	lbz r0, 0xa(r3)
/* 801071E8 00102A08  2C 00 00 00 */	cmpwi r0, 0x0
/* 801071EC 00102A0C  41 82 00 14 */	beq .L_80107200
.L_801071F0:
/* 801071F0 00102A10  38 00 00 28 */	li r0, 0x28
/* 801071F4 00102A14  38 60 FF FF */	li r3, -0x1
/* 801071F8 00102A18  90 0D 97 58 */	stw r0, lbl_8066BF58@sda21(r0)
/* 801071FC 00102A1C  48 00 01 64 */	b .L_80107360
.L_80107200:
/* 80107200 00102A20  80 03 00 08 */	lwz r0, 0x8(r3)
/* 80107204 00102A24  54 00 1F 7E */	srwi r0, r0, 29
/* 80107208 00102A28  28 00 00 01 */	cmplwi r0, 0x1
/* 8010720C 00102A2C  40 82 00 34 */	bne .L_80107240
/* 80107210 00102A30  38 80 00 00 */	li r4, 0x0
/* 80107214 00102A34  4B FF F9 0D */	bl fn_80106B20
/* 80107218 00102A38  2C 03 00 00 */	cmpwi r3, 0x0
/* 8010721C 00102A3C  41 82 00 24 */	beq .L_80107240
/* 80107220 00102A40  38 00 00 01 */	li r0, 0x1
/* 80107224 00102A44  38 80 00 00 */	li r4, 0x0
/* 80107228 00102A48  98 1E 00 0A */	stb r0, 0xa(r30)
/* 8010722C 00102A4C  38 00 00 28 */	li r0, 0x28
/* 80107230 00102A50  38 60 FF FF */	li r3, -0x1
/* 80107234 00102A54  90 9E 00 28 */	stw r4, 0x28(r30)
/* 80107238 00102A58  90 0D 97 58 */	stw r0, lbl_8066BF58@sda21(r0)
/* 8010723C 00102A5C  48 00 01 24 */	b .L_80107360
.L_80107240:
/* 80107240 00102A60  2C 1F 00 01 */	cmpwi r31, 0x1
/* 80107244 00102A64  40 82 00 1C */	bne .L_80107260
/* 80107248 00102A68  7F C3 F3 78 */	mr r3, r30
/* 8010724C 00102A6C  3B E0 00 00 */	li r31, 0x0
/* 80107250 00102A70  4B FF FE B9 */	bl fn_80107108
/* 80107254 00102A74  80 01 00 08 */	lwz r0, 0x8(r1)
/* 80107258 00102A78  7C 00 1A 14 */	add r0, r0, r3
/* 8010725C 00102A7C  90 01 00 08 */	stw r0, 0x8(r1)
.L_80107260:
/* 80107260 00102A80  2C 1F 00 02 */	cmpwi r31, 0x2
/* 80107264 00102A84  41 82 00 80 */	beq .L_801072E4
/* 80107268 00102A88  80 1E 00 04 */	lwz r0, 0x4(r30)
/* 8010726C 00102A8C  54 00 2F 7E */	extrwi r0, r0, 3, 2
/* 80107270 00102A90  28 00 00 03 */	cmplwi r0, 0x3
/* 80107274 00102A94  41 82 00 70 */	beq .L_801072E4
/* 80107278 00102A98  80 DE 00 08 */	lwz r6, 0x8(r30)
/* 8010727C 00102A9C  54 C3 1F 7E */	srwi r3, r6, 29
/* 80107280 00102AA0  38 03 FF FE */	subi r0, r3, 0x2
/* 80107284 00102AA4  28 00 00 01 */	cmplwi r0, 0x1
/* 80107288 00102AA8  41 81 00 5C */	bgt .L_801072E4
/* 8010728C 00102AAC  80 61 00 08 */	lwz r3, 0x8(r1)
/* 80107290 00102AB0  80 BE 00 18 */	lwz r5, 0x18(r30)
/* 80107294 00102AB4  7C 03 28 40 */	cmplw r3, r5
/* 80107298 00102AB8  40 80 00 10 */	bge .L_801072A8
/* 8010729C 00102ABC  80 1E 00 34 */	lwz r0, 0x34(r30)
/* 801072A0 00102AC0  7C 03 00 40 */	cmplw r3, r0
/* 801072A4 00102AC4  40 80 00 14 */	bge .L_801072B8
.L_801072A8:
/* 801072A8 00102AC8  80 1E 00 08 */	lwz r0, 0x8(r30)
/* 801072AC 00102ACC  54 00 00 FE */	clrlwi r0, r0, 3
/* 801072B0 00102AD0  90 1E 00 08 */	stw r0, 0x8(r30)
/* 801072B4 00102AD4  48 00 00 3C */	b .L_801072F0
.L_801072B8:
/* 801072B8 00102AD8  80 9E 00 1C */	lwz r4, 0x1c(r30)
/* 801072BC 00102ADC  7C 60 18 50 */	subf r3, r0, r3
/* 801072C0 00102AE0  38 00 00 02 */	li r0, 0x2
/* 801072C4 00102AE4  7C 64 1A 14 */	add r3, r4, r3
/* 801072C8 00102AE8  90 7E 00 24 */	stw r3, 0x24(r30)
/* 801072CC 00102AEC  50 06 E8 04 */	rlwimi r6, r0, 29, 0, 2
/* 801072D0 00102AF0  80 01 00 08 */	lwz r0, 0x8(r1)
/* 801072D4 00102AF4  7C 00 28 50 */	subf r0, r0, r5
/* 801072D8 00102AF8  90 DE 00 08 */	stw r6, 0x8(r30)
/* 801072DC 00102AFC  90 1E 00 28 */	stw r0, 0x28(r30)
/* 801072E0 00102B00  48 00 00 10 */	b .L_801072F0
.L_801072E4:
/* 801072E4 00102B04  80 1E 00 08 */	lwz r0, 0x8(r30)
/* 801072E8 00102B08  54 00 00 FE */	clrlwi r0, r0, 3
/* 801072EC 00102B0C  90 1E 00 08 */	stw r0, 0x8(r30)
.L_801072F0:
/* 801072F0 00102B10  80 1E 00 08 */	lwz r0, 0x8(r30)
/* 801072F4 00102B14  54 00 1F 7F */	srwi. r0, r0, 29
/* 801072F8 00102B18  40 82 00 64 */	bne .L_8010735C
/* 801072FC 00102B1C  81 9E 00 38 */	lwz r12, 0x38(r30)
/* 80107300 00102B20  2C 0C 00 00 */	cmpwi r12, 0x0
/* 80107304 00102B24  41 82 00 44 */	beq .L_80107348
/* 80107308 00102B28  7F E5 FB 78 */	mr r5, r31
/* 8010730C 00102B2C  38 81 00 08 */	addi r4, r1, 0x8
/* 80107310 00102B30  80 7E 00 00 */	lwz r3, 0x0(r30)
/* 80107314 00102B34  80 DE 00 48 */	lwz r6, 0x48(r30)
/* 80107318 00102B38  7D 89 03 A6 */	mtctr r12
/* 8010731C 00102B3C  4E 80 04 21 */	bctrl
/* 80107320 00102B40  2C 03 00 00 */	cmpwi r3, 0x0
/* 80107324 00102B44  41 82 00 24 */	beq .L_80107348
/* 80107328 00102B48  38 00 00 01 */	li r0, 0x1
/* 8010732C 00102B4C  38 80 00 00 */	li r4, 0x0
/* 80107330 00102B50  98 1E 00 0A */	stb r0, 0xa(r30)
/* 80107334 00102B54  38 00 00 28 */	li r0, 0x28
/* 80107338 00102B58  38 60 FF FF */	li r3, -0x1
/* 8010733C 00102B5C  90 9E 00 28 */	stw r4, 0x28(r30)
/* 80107340 00102B60  90 0D 97 58 */	stw r0, lbl_8066BF58@sda21(r0)
/* 80107344 00102B64  48 00 00 1C */	b .L_80107360
.L_80107348:
/* 80107348 00102B68  38 60 00 00 */	li r3, 0x0
/* 8010734C 00102B6C  98 7E 00 09 */	stb r3, 0x9(r30)
/* 80107350 00102B70  80 01 00 08 */	lwz r0, 0x8(r1)
/* 80107354 00102B74  90 1E 00 18 */	stw r0, 0x18(r30)
/* 80107358 00102B78  90 7E 00 28 */	stw r3, 0x28(r30)
.L_8010735C:
/* 8010735C 00102B7C  38 60 00 00 */	li r3, 0x0
.L_80107360:
/* 80107360 00102B80  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80107364 00102B84  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80107368 00102B88  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8010736C 00102B8C  7C 08 03 A6 */	mtlr r0
/* 80107370 00102B90  38 21 00 20 */	addi r1, r1, 0x20
/* 80107374 00102B94  4E 80 00 20 */	blr
.endfn fn_801071B4