.include "macros.inc"
.file "auto_fn_80106C10_text"

# 0x80006598 - 0x800065A0
.section extab, "a"
.balign 4

.obj "@etb_80006598", local
.hidden "@etb_80006598"
	.4byte 0x38080000
	.4byte 0x00000000
.endobj "@etb_80006598"

# 0x80006A04 - 0x80006A10
.section extabindex, "a"
.balign 4

.obj "@eti_80006A04", local
.hidden "@eti_80006A04"
	.4byte fn_80106C10
	.4byte 0x00000308
	.4byte "@etb_80006598"
.endobj "@eti_80006A04"

# 0x80106C10 - 0x80106F18
.text
.balign 4

.fn fn_80106C10, global
/* 80106C10 00102430  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80106C14 00102434  7C 08 02 A6 */	mflr r0
/* 80106C18 00102438  90 01 00 34 */	stw r0, 0x34(r1)
/* 80106C1C 0010243C  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 80106C20 00102440  7C 9B 23 78 */	mr r27, r4
/* 80106C24 00102444  7C DC 33 78 */	mr r28, r6
/* 80106C28 00102448  7C 7A 1B 78 */	mr r26, r3
/* 80106C2C 0010244C  7C B9 2B 78 */	mr r25, r5
/* 80106C30 00102450  38 80 00 00 */	li r4, 0x0
/* 80106C34 00102454  7F 83 E3 78 */	mr r3, r28
/* 80106C38 00102458  48 00 6A 45 */	bl fn_8010D67C
/* 80106C3C 0010245C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80106C40 00102460  40 82 00 10 */	bne .L_80106C50
/* 80106C44 00102464  7F 83 E3 78 */	mr r3, r28
/* 80106C48 00102468  38 80 FF FF */	li r4, -0x1
/* 80106C4C 0010246C  48 00 6A 31 */	bl fn_8010D67C
.L_80106C50:
/* 80106C50 00102470  7F DB C9 D7 */	mullw. r30, r27, r25
/* 80106C54 00102474  41 82 00 1C */	beq .L_80106C70
/* 80106C58 00102478  88 1C 00 0A */	lbz r0, 0xa(r28)
/* 80106C5C 0010247C  2C 00 00 00 */	cmpwi r0, 0x0
/* 80106C60 00102480  40 82 00 10 */	bne .L_80106C70
/* 80106C64 00102484  80 1C 00 04 */	lwz r0, 0x4(r28)
/* 80106C68 00102488  54 00 57 7F */	extrwi. r0, r0, 3, 7
/* 80106C6C 0010248C  40 82 00 0C */	bne .L_80106C78
.L_80106C70:
/* 80106C70 00102490  38 60 00 00 */	li r3, 0x0
/* 80106C74 00102494  48 00 02 90 */	b .L_80106F04
.L_80106C78:
/* 80106C78 00102498  28 00 00 02 */	cmplwi r0, 0x2
/* 80106C7C 0010249C  40 82 00 08 */	bne .L_80106C84
/* 80106C80 001024A0  48 00 0D 6D */	bl fn_801079EC
.L_80106C84:
/* 80106C84 001024A4  80 7C 00 04 */	lwz r3, 0x4(r28)
/* 80106C88 001024A8  3B E0 00 01 */	li r31, 0x1
/* 80106C8C 001024AC  38 80 00 00 */	li r4, 0x0
/* 80106C90 001024B0  54 60 6F FF */	extrwi. r0, r3, 1, 12
/* 80106C94 001024B4  41 82 00 10 */	beq .L_80106CA4
/* 80106C98 001024B8  54 60 3F BE */	extrwi r0, r3, 2, 5
/* 80106C9C 001024BC  28 00 00 02 */	cmplwi r0, 0x2
/* 80106CA0 001024C0  40 82 00 08 */	bne .L_80106CA8
.L_80106CA4:
/* 80106CA4 001024C4  38 80 00 01 */	li r4, 0x1
.L_80106CA8:
/* 80106CA8 001024C8  2C 04 00 00 */	cmpwi r4, 0x0
/* 80106CAC 001024CC  40 82 00 18 */	bne .L_80106CC4
/* 80106CB0 001024D0  80 1C 00 04 */	lwz r0, 0x4(r28)
/* 80106CB4 001024D4  54 00 3F BE */	extrwi r0, r0, 2, 5
/* 80106CB8 001024D8  28 00 00 01 */	cmplwi r0, 0x1
/* 80106CBC 001024DC  41 82 00 08 */	beq .L_80106CC4
/* 80106CC0 001024E0  3B E0 00 00 */	li r31, 0x0
.L_80106CC4:
/* 80106CC4 001024E4  80 1C 00 08 */	lwz r0, 0x8(r28)
/* 80106CC8 001024E8  54 00 1F 7F */	srwi. r0, r0, 29
/* 80106CCC 001024EC  40 82 00 54 */	bne .L_80106D20
/* 80106CD0 001024F0  80 7C 00 04 */	lwz r3, 0x4(r28)
/* 80106CD4 001024F4  54 60 2F BD */	rlwinm. r0, r3, 5, 30, 30
/* 80106CD8 001024F8  54 60 2F 7E */	extrwi r0, r3, 3, 2
/* 80106CDC 001024FC  41 82 00 44 */	beq .L_80106D20
/* 80106CE0 00102500  54 00 07 7B */	rlwinm. r0, r0, 0, 29, 29
/* 80106CE4 00102504  41 82 00 24 */	beq .L_80106D08
/* 80106CE8 00102508  7F 83 E3 78 */	mr r3, r28
/* 80106CEC 0010250C  38 80 00 00 */	li r4, 0x0
/* 80106CF0 00102510  38 A0 00 02 */	li r5, 0x2
/* 80106CF4 00102514  48 00 04 C1 */	bl fn_801071B4
/* 80106CF8 00102518  2C 03 00 00 */	cmpwi r3, 0x0
/* 80106CFC 0010251C  41 82 00 0C */	beq .L_80106D08
/* 80106D00 00102520  38 60 00 00 */	li r3, 0x0
/* 80106D04 00102524  48 00 02 00 */	b .L_80106F04
.L_80106D08:
/* 80106D08 00102528  80 1C 00 08 */	lwz r0, 0x8(r28)
/* 80106D0C 0010252C  38 60 00 01 */	li r3, 0x1
/* 80106D10 00102530  50 60 E8 04 */	rlwimi r0, r3, 29, 0, 2
/* 80106D14 00102534  90 1C 00 08 */	stw r0, 0x8(r28)
/* 80106D18 00102538  7F 83 E3 78 */	mr r3, r28
/* 80106D1C 0010253C  4B FF FD DD */	bl fn_80106AF8
.L_80106D20:
/* 80106D20 00102540  80 1C 00 08 */	lwz r0, 0x8(r28)
/* 80106D24 00102544  54 00 1F 7E */	srwi r0, r0, 29
/* 80106D28 00102548  28 00 00 01 */	cmplwi r0, 0x1
/* 80106D2C 0010254C  41 82 00 1C */	beq .L_80106D48
/* 80106D30 00102550  38 60 00 01 */	li r3, 0x1
/* 80106D34 00102554  38 00 00 00 */	li r0, 0x0
/* 80106D38 00102558  98 7C 00 0A */	stb r3, 0xa(r28)
/* 80106D3C 0010255C  38 60 00 00 */	li r3, 0x0
/* 80106D40 00102560  90 1C 00 28 */	stw r0, 0x28(r28)
/* 80106D44 00102564  48 00 01 C0 */	b .L_80106F04
.L_80106D48:
/* 80106D48 00102568  2C 1E 00 00 */	cmpwi r30, 0x0
/* 80106D4C 0010256C  3B A0 00 00 */	li r29, 0x0
/* 80106D50 00102570  41 82 01 28 */	beq .L_80106E78
/* 80106D54 00102574  80 7C 00 1C */	lwz r3, 0x1c(r28)
/* 80106D58 00102578  80 9C 00 24 */	lwz r4, 0x24(r28)
/* 80106D5C 0010257C  7C 04 18 40 */	cmplw r4, r3
/* 80106D60 00102580  40 82 00 0C */	bne .L_80106D6C
/* 80106D64 00102584  2C 1F 00 00 */	cmpwi r31, 0x0
/* 80106D68 00102588  41 82 01 10 */	beq .L_80106E78
.L_80106D6C:
/* 80106D6C 0010258C  80 1C 00 20 */	lwz r0, 0x20(r28)
/* 80106D70 00102590  7C 63 20 50 */	subf r3, r3, r4
/* 80106D74 00102594  7C 03 00 50 */	subf r0, r3, r0
/* 80106D78 00102598  90 1C 00 28 */	stw r0, 0x28(r28)
.L_80106D7C:
/* 80106D7C 0010259C  80 BC 00 28 */	lwz r5, 0x28(r28)
/* 80106D80 001025A0  3B 20 00 00 */	li r25, 0x0
/* 80106D84 001025A4  7C 05 F0 40 */	cmplw r5, r30
/* 80106D88 001025A8  90 A1 00 08 */	stw r5, 0x8(r1)
/* 80106D8C 001025AC  40 81 00 0C */	ble .L_80106D98
/* 80106D90 001025B0  7F C5 F3 78 */	mr r5, r30
/* 80106D94 001025B4  93 C1 00 08 */	stw r30, 0x8(r1)
.L_80106D98:
/* 80106D98 001025B8  80 1C 00 04 */	lwz r0, 0x4(r28)
/* 80106D9C 001025BC  54 00 3F BE */	extrwi r0, r0, 2, 5
/* 80106DA0 001025C0  28 00 00 01 */	cmplwi r0, 0x1
/* 80106DA4 001025C4  40 82 00 30 */	bne .L_80106DD4
/* 80106DA8 001025C8  2C 05 00 00 */	cmpwi r5, 0x0
/* 80106DAC 001025CC  41 82 00 28 */	beq .L_80106DD4
/* 80106DB0 001025D0  7F 43 D3 78 */	mr r3, r26
/* 80106DB4 001025D4  38 80 00 0A */	li r4, 0xa
/* 80106DB8 001025D8  48 00 07 F1 */	bl fn_801075A8
/* 80106DBC 001025DC  2C 03 00 00 */	cmpwi r3, 0x0
/* 80106DC0 001025E0  7C 79 1B 78 */	mr r25, r3
/* 80106DC4 001025E4  41 82 00 10 */	beq .L_80106DD4
/* 80106DC8 001025E8  38 03 00 01 */	addi r0, r3, 0x1
/* 80106DCC 001025EC  7C BA 00 50 */	subf r5, r26, r0
/* 80106DD0 001025F0  90 A1 00 08 */	stw r5, 0x8(r1)
.L_80106DD4:
/* 80106DD4 001025F4  80 A1 00 08 */	lwz r5, 0x8(r1)
/* 80106DD8 001025F8  2C 05 00 00 */	cmpwi r5, 0x0
/* 80106DDC 001025FC  41 82 00 38 */	beq .L_80106E14
/* 80106DE0 00102600  80 7C 00 24 */	lwz r3, 0x24(r28)
/* 80106DE4 00102604  7F 44 D3 78 */	mr r4, r26
/* 80106DE8 00102608  4B EF F1 CD */	bl memcpy
/* 80106DEC 0010260C  80 81 00 08 */	lwz r4, 0x8(r1)
/* 80106DF0 00102610  80 7C 00 24 */	lwz r3, 0x24(r28)
/* 80106DF4 00102614  80 1C 00 28 */	lwz r0, 0x28(r28)
/* 80106DF8 00102618  7F 5A 22 14 */	add r26, r26, r4
/* 80106DFC 0010261C  7C 63 22 14 */	add r3, r3, r4
/* 80106E00 00102620  7F C4 F0 50 */	subf r30, r4, r30
/* 80106E04 00102624  90 7C 00 24 */	stw r3, 0x24(r28)
/* 80106E08 00102628  80 61 00 08 */	lwz r3, 0x8(r1)
/* 80106E0C 0010262C  7C 03 00 50 */	subf r0, r3, r0
/* 80106E10 00102630  90 1C 00 28 */	stw r0, 0x28(r28)
.L_80106E14:
/* 80106E14 00102634  80 1C 00 28 */	lwz r0, 0x28(r28)
/* 80106E18 00102638  2C 00 00 00 */	cmpwi r0, 0x0
/* 80106E1C 0010263C  41 82 00 18 */	beq .L_80106E34
/* 80106E20 00102640  2C 19 00 00 */	cmpwi r25, 0x0
/* 80106E24 00102644  40 82 00 10 */	bne .L_80106E34
/* 80106E28 00102648  80 1C 00 04 */	lwz r0, 0x4(r28)
/* 80106E2C 0010264C  54 00 3F BF */	extrwi. r0, r0, 2, 5
/* 80106E30 00102650  40 82 00 30 */	bne .L_80106E60
.L_80106E34:
/* 80106E34 00102654  7F 83 E3 78 */	mr r3, r28
/* 80106E38 00102658  38 80 00 00 */	li r4, 0x0
/* 80106E3C 0010265C  4B FF FC E5 */	bl fn_80106B20
/* 80106E40 00102660  2C 03 00 00 */	cmpwi r3, 0x0
/* 80106E44 00102664  41 82 00 1C */	beq .L_80106E60
/* 80106E48 00102668  38 60 00 01 */	li r3, 0x1
/* 80106E4C 0010266C  38 00 00 00 */	li r0, 0x0
/* 80106E50 00102670  98 7C 00 0A */	stb r3, 0xa(r28)
/* 80106E54 00102674  3B C0 00 00 */	li r30, 0x0
/* 80106E58 00102678  90 1C 00 28 */	stw r0, 0x28(r28)
/* 80106E5C 0010267C  48 00 00 1C */	b .L_80106E78
.L_80106E60:
/* 80106E60 00102680  80 01 00 08 */	lwz r0, 0x8(r1)
/* 80106E64 00102684  2C 1E 00 00 */	cmpwi r30, 0x0
/* 80106E68 00102688  7F BD 02 14 */	add r29, r29, r0
/* 80106E6C 0010268C  41 82 00 0C */	beq .L_80106E78
/* 80106E70 00102690  2C 1F 00 00 */	cmpwi r31, 0x0
/* 80106E74 00102694  40 82 FF 08 */	bne .L_80106D7C
.L_80106E78:
/* 80106E78 00102698  2C 1E 00 00 */	cmpwi r30, 0x0
/* 80106E7C 0010269C  41 82 00 6C */	beq .L_80106EE8
/* 80106E80 001026A0  2C 1F 00 00 */	cmpwi r31, 0x0
/* 80106E84 001026A4  40 82 00 64 */	bne .L_80106EE8
/* 80106E88 001026A8  83 3C 00 1C */	lwz r25, 0x1c(r28)
/* 80106E8C 001026AC  7C 1A F2 14 */	add r0, r26, r30
/* 80106E90 001026B0  83 FC 00 20 */	lwz r31, 0x20(r28)
/* 80106E94 001026B4  7F 83 E3 78 */	mr r3, r28
/* 80106E98 001026B8  93 5C 00 1C */	stw r26, 0x1c(r28)
/* 80106E9C 001026BC  38 81 00 08 */	addi r4, r1, 0x8
/* 80106EA0 001026C0  93 DC 00 20 */	stw r30, 0x20(r28)
/* 80106EA4 001026C4  90 1C 00 24 */	stw r0, 0x24(r28)
/* 80106EA8 001026C8  4B FF FC 79 */	bl fn_80106B20
/* 80106EAC 001026CC  2C 03 00 00 */	cmpwi r3, 0x0
/* 80106EB0 001026D0  41 82 00 18 */	beq .L_80106EC8
/* 80106EB4 001026D4  38 60 00 01 */	li r3, 0x1
/* 80106EB8 001026D8  38 00 00 00 */	li r0, 0x0
/* 80106EBC 001026DC  98 7C 00 0A */	stb r3, 0xa(r28)
/* 80106EC0 001026E0  90 1C 00 28 */	stw r0, 0x28(r28)
/* 80106EC4 001026E4  48 00 00 0C */	b .L_80106ED0
.L_80106EC8:
/* 80106EC8 001026E8  80 01 00 08 */	lwz r0, 0x8(r1)
/* 80106ECC 001026EC  7F BD 02 14 */	add r29, r29, r0
.L_80106ED0:
/* 80106ED0 001026F0  93 3C 00 1C */	stw r25, 0x1c(r28)
/* 80106ED4 001026F4  7F 83 E3 78 */	mr r3, r28
/* 80106ED8 001026F8  93 FC 00 20 */	stw r31, 0x20(r28)
/* 80106EDC 001026FC  4B FF FC 1D */	bl fn_80106AF8
/* 80106EE0 00102700  38 00 00 00 */	li r0, 0x0
/* 80106EE4 00102704  90 1C 00 28 */	stw r0, 0x28(r28)
.L_80106EE8:
/* 80106EE8 00102708  80 1C 00 04 */	lwz r0, 0x4(r28)
/* 80106EEC 0010270C  54 00 3F BE */	extrwi r0, r0, 2, 5
/* 80106EF0 00102710  28 00 00 02 */	cmplwi r0, 0x2
/* 80106EF4 00102714  41 82 00 0C */	beq .L_80106F00
/* 80106EF8 00102718  38 00 00 00 */	li r0, 0x0
/* 80106EFC 0010271C  90 1C 00 28 */	stw r0, 0x28(r28)
.L_80106F00:
/* 80106F00 00102720  7C 7D DB 96 */	divwu r3, r29, r27
.L_80106F04:
/* 80106F04 00102724  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 80106F08 00102728  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80106F0C 0010272C  7C 08 03 A6 */	mtlr r0
/* 80106F10 00102730  38 21 00 30 */	addi r1, r1, 0x30
/* 80106F14 00102734  4E 80 00 20 */	blr
.endfn fn_80106C10