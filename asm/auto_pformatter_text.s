.include "macros.inc"
.file "auto_pformatter_text"

# 0x80006600 - 0x80006608
.section extab, "a"
.balign 4

.obj "@etb_80006600", local
.hidden "@etb_80006600"
	.4byte fn_8007FF54+0xAC
	.4byte 0x00000000
.endobj "@etb_80006600"

# 0x80006AA0 - 0x80006AAC
.section extabindex, "a"
.balign 4

.obj "@eti_80006AA0", local
.hidden "@eti_80006AA0"
	.4byte __pformatter_80109180
	.4byte 0x0000085C
	.4byte "@etb_80006600"
.endobj "@eti_80006AA0"

# 0x80109180 - 0x801099DC
.text
.balign 4

.fn __pformatter_80109180, global
/* 80109180 001049A0  94 21 FD 40 */	stwu r1, -0x2c0(r1)
/* 80109184 001049A4  7C 08 02 A6 */	mflr r0
/* 80109188 001049A8  90 01 02 C4 */	stw r0, 0x2c4(r1)
/* 8010918C 001049AC  BE 01 02 80 */	stmw r16, 0x280(r1)
/* 80109190 001049B0  3A 00 00 20 */	li r16, 0x20
/* 80109194 001049B4  3F A0 80 54 */	lis r29, "@stringBase0_8053F8B0"@ha
/* 80109198 001049B8  7C 71 1B 78 */	mr r17, r3
/* 8010919C 001049BC  7C 92 23 78 */	mr r18, r4
/* 801091A0 001049C0  7C B7 2B 78 */	mr r23, r5
/* 801091A4 001049C4  7C D3 33 78 */	mr r19, r6
/* 801091A8 001049C8  3B BD F8 B0 */	addi r29, r29, "@stringBase0_8053F8B0"@l
/* 801091AC 001049CC  3B 81 02 7F */	addi r28, r1, 0x27f
/* 801091B0 001049D0  3B 20 00 00 */	li r25, 0x0
/* 801091B4 001049D4  3B E0 00 25 */	li r31, 0x25
/* 801091B8 001049D8  3F C0 80 57 */	lis r30, "@2720_8056C404"@ha
/* 801091BC 001049DC  9A 01 00 09 */	stb r16, 0x9(r1)
/* 801091C0 001049E0  48 00 07 F8 */	b .L_801099B8
.L_801091C4:
/* 801091C4 001049E4  7E E3 BB 78 */	mr r3, r23
/* 801091C8 001049E8  38 80 00 25 */	li r4, 0x25
/* 801091CC 001049EC  48 00 24 65 */	bl strchr
/* 801091D0 001049F0  2C 03 00 00 */	cmpwi r3, 0x0
/* 801091D4 001049F4  7C 78 1B 78 */	mr r24, r3
/* 801091D8 001049F8  40 82 00 40 */	bne .L_80109218
/* 801091DC 001049FC  7E E3 BB 78 */	mr r3, r23
/* 801091E0 00104A00  4B FF A9 95 */	bl strlen
/* 801091E4 00104A04  2C 03 00 00 */	cmpwi r3, 0x0
/* 801091E8 00104A08  7C 65 1B 78 */	mr r5, r3
/* 801091EC 00104A0C  7F 39 1A 14 */	add r25, r25, r3
/* 801091F0 00104A10  41 82 07 D4 */	beq .L_801099C4
/* 801091F4 00104A14  7E 2C 8B 78 */	mr r12, r17
/* 801091F8 00104A18  7E 43 93 78 */	mr r3, r18
/* 801091FC 00104A1C  7E E4 BB 78 */	mr r4, r23
/* 80109200 00104A20  7D 89 03 A6 */	mtctr r12
/* 80109204 00104A24  4E 80 04 21 */	bctrl
/* 80109208 00104A28  2C 03 00 00 */	cmpwi r3, 0x0
/* 8010920C 00104A2C  40 82 07 B8 */	bne .L_801099C4
/* 80109210 00104A30  38 60 FF FF */	li r3, -0x1
/* 80109214 00104A34  48 00 07 B4 */	b .L_801099C8
.L_80109218:
/* 80109218 00104A38  7C B7 18 51 */	subf. r5, r23, r3
/* 8010921C 00104A3C  7F 39 2A 14 */	add r25, r25, r5
/* 80109220 00104A40  41 82 00 28 */	beq .L_80109248
/* 80109224 00104A44  7E 2C 8B 78 */	mr r12, r17
/* 80109228 00104A48  7E 43 93 78 */	mr r3, r18
/* 8010922C 00104A4C  7E E4 BB 78 */	mr r4, r23
/* 80109230 00104A50  7D 89 03 A6 */	mtctr r12
/* 80109234 00104A54  4E 80 04 21 */	bctrl
/* 80109238 00104A58  2C 03 00 00 */	cmpwi r3, 0x0
/* 8010923C 00104A5C  40 82 00 0C */	bne .L_80109248
/* 80109240 00104A60  38 60 FF FF */	li r3, -0x1
/* 80109244 00104A64  48 00 07 84 */	b .L_801099C8
.L_80109248:
/* 80109248 00104A68  7F 03 C3 78 */	mr r3, r24
/* 8010924C 00104A6C  7E 64 9B 78 */	mr r4, r19
/* 80109250 00104A70  38 A1 00 70 */	addi r5, r1, 0x70
/* 80109254 00104A74  4B FF E7 A9 */	bl parse_format_801079FC
/* 80109258 00104A78  88 01 00 75 */	lbz r0, 0x75(r1)
/* 8010925C 00104A7C  7C 77 1B 78 */	mr r23, r3
/* 80109260 00104A80  2C 00 00 68 */	cmpwi r0, 0x68
/* 80109264 00104A84  41 82 05 D4 */	beq .L_80109838
/* 80109268 00104A88  40 80 00 60 */	bge .L_801092C8
/* 8010926C 00104A8C  2C 00 00 58 */	cmpwi r0, 0x58
/* 80109270 00104A90  41 82 02 10 */	beq .L_80109480
/* 80109274 00104A94  40 80 00 30 */	bge .L_801092A4
/* 80109278 00104A98  2C 00 00 41 */	cmpwi r0, 0x41
/* 8010927C 00104A9C  41 82 03 D0 */	beq .L_8010964C
/* 80109280 00104AA0  40 80 00 10 */	bge .L_80109290
/* 80109284 00104AA4  2C 00 00 25 */	cmpwi r0, 0x25
/* 80109288 00104AA8  41 82 05 A0 */	beq .L_80109828
/* 8010928C 00104AAC  48 00 05 AC */	b .L_80109838
.L_80109290:
/* 80109290 00104AB0  2C 00 00 48 */	cmpwi r0, 0x48
/* 80109294 00104AB4  40 80 05 A4 */	bge .L_80109838
/* 80109298 00104AB8  2C 00 00 45 */	cmpwi r0, 0x45
/* 8010929C 00104ABC  40 80 03 40 */	bge .L_801095DC
/* 801092A0 00104AC0  48 00 05 98 */	b .L_80109838
.L_801092A4:
/* 801092A4 00104AC4  2C 00 00 63 */	cmpwi r0, 0x63
/* 801092A8 00104AC8  41 82 05 60 */	beq .L_80109808
/* 801092AC 00104ACC  40 80 00 10 */	bge .L_801092BC
/* 801092B0 00104AD0  2C 00 00 61 */	cmpwi r0, 0x61
/* 801092B4 00104AD4  41 82 03 98 */	beq .L_8010964C
/* 801092B8 00104AD8  48 00 05 80 */	b .L_80109838
.L_801092BC:
/* 801092BC 00104ADC  2C 00 00 65 */	cmpwi r0, 0x65
/* 801092C0 00104AE0  40 80 03 1C */	bge .L_801095DC
/* 801092C4 00104AE4  48 00 00 60 */	b .L_80109324
.L_801092C8:
/* 801092C8 00104AE8  2C 00 00 74 */	cmpwi r0, 0x74
/* 801092CC 00104AEC  41 82 05 6C */	beq .L_80109838
/* 801092D0 00104AF0  40 80 00 30 */	bge .L_80109300
/* 801092D4 00104AF4  2C 00 00 6F */	cmpwi r0, 0x6f
/* 801092D8 00104AF8  41 82 01 A8 */	beq .L_80109480
/* 801092DC 00104AFC  40 80 00 18 */	bge .L_801092F4
/* 801092E0 00104B00  2C 00 00 6E */	cmpwi r0, 0x6e
/* 801092E4 00104B04  40 80 04 AC */	bge .L_80109790
/* 801092E8 00104B08  2C 00 00 6A */	cmpwi r0, 0x6a
/* 801092EC 00104B0C  40 80 05 4C */	bge .L_80109838
/* 801092F0 00104B10  48 00 00 34 */	b .L_80109324
.L_801092F4:
/* 801092F4 00104B14  2C 00 00 73 */	cmpwi r0, 0x73
/* 801092F8 00104B18  40 80 03 C4 */	bge .L_801096BC
/* 801092FC 00104B1C  48 00 05 3C */	b .L_80109838
.L_80109300:
/* 80109300 00104B20  2C 00 00 78 */	cmpwi r0, 0x78
/* 80109304 00104B24  41 82 01 7C */	beq .L_80109480
/* 80109308 00104B28  40 80 00 10 */	bge .L_80109318
/* 8010930C 00104B2C  2C 00 00 76 */	cmpwi r0, 0x76
/* 80109310 00104B30  40 80 05 28 */	bge .L_80109838
/* 80109314 00104B34  48 00 01 6C */	b .L_80109480
.L_80109318:
/* 80109318 00104B38  2C 00 00 FF */	cmpwi r0, 0xff
/* 8010931C 00104B3C  41 82 05 1C */	beq .L_80109838
/* 80109320 00104B40  48 00 05 18 */	b .L_80109838
.L_80109324:
/* 80109324 00104B44  88 01 00 74 */	lbz r0, 0x74(r1)
/* 80109328 00104B48  28 00 00 03 */	cmplwi r0, 0x3
/* 8010932C 00104B4C  40 82 00 18 */	bne .L_80109344
/* 80109330 00104B50  7E 63 9B 78 */	mr r3, r19
/* 80109334 00104B54  38 80 00 01 */	li r4, 0x1
/* 80109338 00104B58  4B FF A8 59 */	bl __va_arg
/* 8010933C 00104B5C  82 C3 00 00 */	lwz r22, 0x0(r3)
/* 80109340 00104B60  48 00 00 8C */	b .L_801093CC
.L_80109344:
/* 80109344 00104B64  28 00 00 04 */	cmplwi r0, 0x4
/* 80109348 00104B68  40 82 00 1C */	bne .L_80109364
/* 8010934C 00104B6C  7E 63 9B 78 */	mr r3, r19
/* 80109350 00104B70  38 80 00 02 */	li r4, 0x2
/* 80109354 00104B74  4B FF A8 3D */	bl __va_arg
/* 80109358 00104B78  82 A3 00 00 */	lwz r21, 0x0(r3)
/* 8010935C 00104B7C  82 83 00 04 */	lwz r20, 0x4(r3)
/* 80109360 00104B80  48 00 00 6C */	b .L_801093CC
.L_80109364:
/* 80109364 00104B84  28 00 00 06 */	cmplwi r0, 0x6
/* 80109368 00104B88  40 82 00 1C */	bne .L_80109384
/* 8010936C 00104B8C  7E 63 9B 78 */	mr r3, r19
/* 80109370 00104B90  38 80 00 02 */	li r4, 0x2
/* 80109374 00104B94  4B FF A8 1D */	bl __va_arg
/* 80109378 00104B98  82 A3 00 00 */	lwz r21, 0x0(r3)
/* 8010937C 00104B9C  82 83 00 04 */	lwz r20, 0x4(r3)
/* 80109380 00104BA0  48 00 00 4C */	b .L_801093CC
.L_80109384:
/* 80109384 00104BA4  28 00 00 07 */	cmplwi r0, 0x7
/* 80109388 00104BA8  40 82 00 18 */	bne .L_801093A0
/* 8010938C 00104BAC  7E 63 9B 78 */	mr r3, r19
/* 80109390 00104BB0  38 80 00 01 */	li r4, 0x1
/* 80109394 00104BB4  4B FF A7 FD */	bl __va_arg
/* 80109398 00104BB8  82 C3 00 00 */	lwz r22, 0x0(r3)
/* 8010939C 00104BBC  48 00 00 30 */	b .L_801093CC
.L_801093A0:
/* 801093A0 00104BC0  28 00 00 08 */	cmplwi r0, 0x8
/* 801093A4 00104BC4  40 82 00 18 */	bne .L_801093BC
/* 801093A8 00104BC8  7E 63 9B 78 */	mr r3, r19
/* 801093AC 00104BCC  38 80 00 01 */	li r4, 0x1
/* 801093B0 00104BD0  4B FF A7 E1 */	bl __va_arg
/* 801093B4 00104BD4  82 C3 00 00 */	lwz r22, 0x0(r3)
/* 801093B8 00104BD8  48 00 00 14 */	b .L_801093CC
.L_801093BC:
/* 801093BC 00104BDC  7E 63 9B 78 */	mr r3, r19
/* 801093C0 00104BE0  38 80 00 01 */	li r4, 0x1
/* 801093C4 00104BE4  4B FF A7 CD */	bl __va_arg
/* 801093C8 00104BE8  82 C3 00 00 */	lwz r22, 0x0(r3)
.L_801093CC:
/* 801093CC 00104BEC  88 01 00 74 */	lbz r0, 0x74(r1)
/* 801093D0 00104BF0  28 00 00 02 */	cmplwi r0, 0x2
/* 801093D4 00104BF4  40 82 00 08 */	bne .L_801093DC
/* 801093D8 00104BF8  7E D6 07 34 */	extsh r22, r22
.L_801093DC:
/* 801093DC 00104BFC  28 00 00 01 */	cmplwi r0, 0x1
/* 801093E0 00104C00  40 82 00 08 */	bne .L_801093E8
/* 801093E4 00104C04  7E D6 07 74 */	extsb r22, r22
.L_801093E8:
/* 801093E8 00104C08  28 00 00 04 */	cmplwi r0, 0x4
/* 801093EC 00104C0C  41 82 00 0C */	beq .L_801093F8
/* 801093F0 00104C10  28 00 00 06 */	cmplwi r0, 0x6
/* 801093F4 00104C14  40 82 00 48 */	bne .L_8010943C
.L_801093F8:
/* 801093F8 00104C18  81 21 00 70 */	lwz r9, 0x70(r1)
/* 801093FC 00104C1C  7E 84 A3 78 */	mr r4, r20
/* 80109400 00104C20  81 01 00 74 */	lwz r8, 0x74(r1)
/* 80109404 00104C24  7E A3 AB 78 */	mr r3, r21
/* 80109408 00104C28  80 E1 00 78 */	lwz r7, 0x78(r1)
/* 8010940C 00104C2C  38 A1 02 80 */	addi r5, r1, 0x280
/* 80109410 00104C30  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 80109414 00104C34  38 C1 00 60 */	addi r6, r1, 0x60
/* 80109418 00104C38  91 21 00 60 */	stw r9, 0x60(r1)
/* 8010941C 00104C3C  91 01 00 64 */	stw r8, 0x64(r1)
/* 80109420 00104C40  90 E1 00 68 */	stw r7, 0x68(r1)
/* 80109424 00104C44  90 01 00 6C */	stw r0, 0x6c(r1)
/* 80109428 00104C48  4B FF ED F9 */	bl longlong2str_80108220
/* 8010942C 00104C4C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80109430 00104C50  7C 7A 1B 78 */	mr r26, r3
/* 80109434 00104C54  41 82 04 04 */	beq .L_80109838
/* 80109438 00104C58  48 00 00 40 */	b .L_80109478
.L_8010943C:
/* 8010943C 00104C5C  81 01 00 70 */	lwz r8, 0x70(r1)
/* 80109440 00104C60  7E C3 B3 78 */	mr r3, r22
/* 80109444 00104C64  80 E1 00 74 */	lwz r7, 0x74(r1)
/* 80109448 00104C68  38 81 02 80 */	addi r4, r1, 0x280
/* 8010944C 00104C6C  80 C1 00 78 */	lwz r6, 0x78(r1)
/* 80109450 00104C70  38 A1 00 50 */	addi r5, r1, 0x50
/* 80109454 00104C74  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 80109458 00104C78  91 01 00 50 */	stw r8, 0x50(r1)
/* 8010945C 00104C7C  90 E1 00 54 */	stw r7, 0x54(r1)
/* 80109460 00104C80  90 C1 00 58 */	stw r6, 0x58(r1)
/* 80109464 00104C84  90 01 00 5C */	stw r0, 0x5c(r1)
/* 80109468 00104C88  4B FF EB 91 */	bl long2str_80107FF8
/* 8010946C 00104C8C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80109470 00104C90  7C 7A 1B 78 */	mr r26, r3
/* 80109474 00104C94  41 82 03 C4 */	beq .L_80109838
.L_80109478:
/* 80109478 00104C98  7F 7A E0 50 */	subf r27, r26, r28
/* 8010947C 00104C9C  48 00 04 00 */	b .L_8010987C
.L_80109480:
/* 80109480 00104CA0  88 01 00 74 */	lbz r0, 0x74(r1)
/* 80109484 00104CA4  28 00 00 03 */	cmplwi r0, 0x3
/* 80109488 00104CA8  40 82 00 18 */	bne .L_801094A0
/* 8010948C 00104CAC  7E 63 9B 78 */	mr r3, r19
/* 80109490 00104CB0  38 80 00 01 */	li r4, 0x1
/* 80109494 00104CB4  4B FF A6 FD */	bl __va_arg
/* 80109498 00104CB8  82 C3 00 00 */	lwz r22, 0x0(r3)
/* 8010949C 00104CBC  48 00 00 8C */	b .L_80109528
.L_801094A0:
/* 801094A0 00104CC0  28 00 00 04 */	cmplwi r0, 0x4
/* 801094A4 00104CC4  40 82 00 1C */	bne .L_801094C0
/* 801094A8 00104CC8  7E 63 9B 78 */	mr r3, r19
/* 801094AC 00104CCC  38 80 00 02 */	li r4, 0x2
/* 801094B0 00104CD0  4B FF A6 E1 */	bl __va_arg
/* 801094B4 00104CD4  82 A3 00 00 */	lwz r21, 0x0(r3)
/* 801094B8 00104CD8  82 83 00 04 */	lwz r20, 0x4(r3)
/* 801094BC 00104CDC  48 00 00 6C */	b .L_80109528
.L_801094C0:
/* 801094C0 00104CE0  28 00 00 06 */	cmplwi r0, 0x6
/* 801094C4 00104CE4  40 82 00 1C */	bne .L_801094E0
/* 801094C8 00104CE8  7E 63 9B 78 */	mr r3, r19
/* 801094CC 00104CEC  38 80 00 02 */	li r4, 0x2
/* 801094D0 00104CF0  4B FF A6 C1 */	bl __va_arg
/* 801094D4 00104CF4  82 A3 00 00 */	lwz r21, 0x0(r3)
/* 801094D8 00104CF8  82 83 00 04 */	lwz r20, 0x4(r3)
/* 801094DC 00104CFC  48 00 00 4C */	b .L_80109528
.L_801094E0:
/* 801094E0 00104D00  28 00 00 07 */	cmplwi r0, 0x7
/* 801094E4 00104D04  40 82 00 18 */	bne .L_801094FC
/* 801094E8 00104D08  7E 63 9B 78 */	mr r3, r19
/* 801094EC 00104D0C  38 80 00 01 */	li r4, 0x1
/* 801094F0 00104D10  4B FF A6 A1 */	bl __va_arg
/* 801094F4 00104D14  82 C3 00 00 */	lwz r22, 0x0(r3)
/* 801094F8 00104D18  48 00 00 30 */	b .L_80109528
.L_801094FC:
/* 801094FC 00104D1C  28 00 00 08 */	cmplwi r0, 0x8
/* 80109500 00104D20  40 82 00 18 */	bne .L_80109518
/* 80109504 00104D24  7E 63 9B 78 */	mr r3, r19
/* 80109508 00104D28  38 80 00 01 */	li r4, 0x1
/* 8010950C 00104D2C  4B FF A6 85 */	bl __va_arg
/* 80109510 00104D30  82 C3 00 00 */	lwz r22, 0x0(r3)
/* 80109514 00104D34  48 00 00 14 */	b .L_80109528
.L_80109518:
/* 80109518 00104D38  7E 63 9B 78 */	mr r3, r19
/* 8010951C 00104D3C  38 80 00 01 */	li r4, 0x1
/* 80109520 00104D40  4B FF A6 71 */	bl __va_arg
/* 80109524 00104D44  82 C3 00 00 */	lwz r22, 0x0(r3)
.L_80109528:
/* 80109528 00104D48  88 01 00 74 */	lbz r0, 0x74(r1)
/* 8010952C 00104D4C  28 00 00 02 */	cmplwi r0, 0x2
/* 80109530 00104D50  40 82 00 08 */	bne .L_80109538
/* 80109534 00104D54  56 D6 04 3E */	clrlwi r22, r22, 16
.L_80109538:
/* 80109538 00104D58  28 00 00 01 */	cmplwi r0, 0x1
/* 8010953C 00104D5C  40 82 00 08 */	bne .L_80109544
/* 80109540 00104D60  56 D6 06 3E */	clrlwi r22, r22, 24
.L_80109544:
/* 80109544 00104D64  28 00 00 04 */	cmplwi r0, 0x4
/* 80109548 00104D68  41 82 00 0C */	beq .L_80109554
/* 8010954C 00104D6C  28 00 00 06 */	cmplwi r0, 0x6
/* 80109550 00104D70  40 82 00 48 */	bne .L_80109598
.L_80109554:
/* 80109554 00104D74  81 21 00 70 */	lwz r9, 0x70(r1)
/* 80109558 00104D78  7E 84 A3 78 */	mr r4, r20
/* 8010955C 00104D7C  81 01 00 74 */	lwz r8, 0x74(r1)
/* 80109560 00104D80  7E A3 AB 78 */	mr r3, r21
/* 80109564 00104D84  80 E1 00 78 */	lwz r7, 0x78(r1)
/* 80109568 00104D88  38 A1 02 80 */	addi r5, r1, 0x280
/* 8010956C 00104D8C  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 80109570 00104D90  38 C1 00 40 */	addi r6, r1, 0x40
/* 80109574 00104D94  91 21 00 40 */	stw r9, 0x40(r1)
/* 80109578 00104D98  91 01 00 44 */	stw r8, 0x44(r1)
/* 8010957C 00104D9C  90 E1 00 48 */	stw r7, 0x48(r1)
/* 80109580 00104DA0  90 01 00 4C */	stw r0, 0x4c(r1)
/* 80109584 00104DA4  4B FF EC 9D */	bl longlong2str_80108220
/* 80109588 00104DA8  2C 03 00 00 */	cmpwi r3, 0x0
/* 8010958C 00104DAC  7C 7A 1B 78 */	mr r26, r3
/* 80109590 00104DB0  41 82 02 A8 */	beq .L_80109838
/* 80109594 00104DB4  48 00 00 40 */	b .L_801095D4
.L_80109598:
/* 80109598 00104DB8  81 01 00 70 */	lwz r8, 0x70(r1)
/* 8010959C 00104DBC  7E C3 B3 78 */	mr r3, r22
/* 801095A0 00104DC0  80 E1 00 74 */	lwz r7, 0x74(r1)
/* 801095A4 00104DC4  38 81 02 80 */	addi r4, r1, 0x280
/* 801095A8 00104DC8  80 C1 00 78 */	lwz r6, 0x78(r1)
/* 801095AC 00104DCC  38 A1 00 30 */	addi r5, r1, 0x30
/* 801095B0 00104DD0  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 801095B4 00104DD4  91 01 00 30 */	stw r8, 0x30(r1)
/* 801095B8 00104DD8  90 E1 00 34 */	stw r7, 0x34(r1)
/* 801095BC 00104DDC  90 C1 00 38 */	stw r6, 0x38(r1)
/* 801095C0 00104DE0  90 01 00 3C */	stw r0, 0x3c(r1)
/* 801095C4 00104DE4  4B FF EA 35 */	bl long2str_80107FF8
/* 801095C8 00104DE8  2C 03 00 00 */	cmpwi r3, 0x0
/* 801095CC 00104DEC  7C 7A 1B 78 */	mr r26, r3
/* 801095D0 00104DF0  41 82 02 68 */	beq .L_80109838
.L_801095D4:
/* 801095D4 00104DF4  7F 7A E0 50 */	subf r27, r26, r28
/* 801095D8 00104DF8  48 00 02 A4 */	b .L_8010987C
.L_801095DC:
/* 801095DC 00104DFC  88 01 00 74 */	lbz r0, 0x74(r1)
/* 801095E0 00104E00  28 00 00 09 */	cmplwi r0, 0x9
/* 801095E4 00104E04  40 82 00 18 */	bne .L_801095FC
/* 801095E8 00104E08  7E 63 9B 78 */	mr r3, r19
/* 801095EC 00104E0C  38 80 00 03 */	li r4, 0x3
/* 801095F0 00104E10  4B FF A5 A1 */	bl __va_arg
/* 801095F4 00104E14  C8 23 00 00 */	lfd f1, 0x0(r3)
/* 801095F8 00104E18  48 00 00 14 */	b .L_8010960C
.L_801095FC:
/* 801095FC 00104E1C  7E 63 9B 78 */	mr r3, r19
/* 80109600 00104E20  38 80 00 03 */	li r4, 0x3
/* 80109604 00104E24  4B FF A5 8D */	bl __va_arg
/* 80109608 00104E28  C8 23 00 00 */	lfd f1, 0x0(r3)
.L_8010960C:
/* 8010960C 00104E2C  80 E1 00 70 */	lwz r7, 0x70(r1)
/* 80109610 00104E30  38 61 02 80 */	addi r3, r1, 0x280
/* 80109614 00104E34  80 C1 00 74 */	lwz r6, 0x74(r1)
/* 80109618 00104E38  38 81 00 20 */	addi r4, r1, 0x20
/* 8010961C 00104E3C  80 A1 00 78 */	lwz r5, 0x78(r1)
/* 80109620 00104E40  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 80109624 00104E44  90 E1 00 20 */	stw r7, 0x20(r1)
/* 80109628 00104E48  90 C1 00 24 */	stw r6, 0x24(r1)
/* 8010962C 00104E4C  90 A1 00 28 */	stw r5, 0x28(r1)
/* 80109630 00104E50  90 01 00 2C */	stw r0, 0x2c(r1)
/* 80109634 00104E54  4B FF F3 7D */	bl float2str_801089B0
/* 80109638 00104E58  2C 03 00 00 */	cmpwi r3, 0x0
/* 8010963C 00104E5C  7C 7A 1B 78 */	mr r26, r3
/* 80109640 00104E60  41 82 01 F8 */	beq .L_80109838
/* 80109644 00104E64  7F 63 E0 50 */	subf r27, r3, r28
/* 80109648 00104E68  48 00 02 34 */	b .L_8010987C
.L_8010964C:
/* 8010964C 00104E6C  88 01 00 74 */	lbz r0, 0x74(r1)
/* 80109650 00104E70  28 00 00 09 */	cmplwi r0, 0x9
/* 80109654 00104E74  40 82 00 18 */	bne .L_8010966C
/* 80109658 00104E78  7E 63 9B 78 */	mr r3, r19
/* 8010965C 00104E7C  38 80 00 03 */	li r4, 0x3
/* 80109660 00104E80  4B FF A5 31 */	bl __va_arg
/* 80109664 00104E84  C8 23 00 00 */	lfd f1, 0x0(r3)
/* 80109668 00104E88  48 00 00 14 */	b .L_8010967C
.L_8010966C:
/* 8010966C 00104E8C  7E 63 9B 78 */	mr r3, r19
/* 80109670 00104E90  38 80 00 03 */	li r4, 0x3
/* 80109674 00104E94  4B FF A5 1D */	bl __va_arg
/* 80109678 00104E98  C8 23 00 00 */	lfd f1, 0x0(r3)
.L_8010967C:
/* 8010967C 00104E9C  80 E1 00 70 */	lwz r7, 0x70(r1)
/* 80109680 00104EA0  38 61 02 80 */	addi r3, r1, 0x280
/* 80109684 00104EA4  80 C1 00 74 */	lwz r6, 0x74(r1)
/* 80109688 00104EA8  38 81 00 10 */	addi r4, r1, 0x10
/* 8010968C 00104EAC  80 A1 00 78 */	lwz r5, 0x78(r1)
/* 80109690 00104EB0  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 80109694 00104EB4  90 E1 00 10 */	stw r7, 0x10(r1)
/* 80109698 00104EB8  90 C1 00 14 */	stw r6, 0x14(r1)
/* 8010969C 00104EBC  90 A1 00 18 */	stw r5, 0x18(r1)
/* 801096A0 00104EC0  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801096A4 00104EC4  4B FF EE 1D */	bl double2hex_801084C0
/* 801096A8 00104EC8  2C 03 00 00 */	cmpwi r3, 0x0
/* 801096AC 00104ECC  7C 7A 1B 78 */	mr r26, r3
/* 801096B0 00104ED0  41 82 01 88 */	beq .L_80109838
/* 801096B4 00104ED4  7F 63 E0 50 */	subf r27, r3, r28
/* 801096B8 00104ED8  48 00 01 C4 */	b .L_8010987C
.L_801096BC:
/* 801096BC 00104EDC  88 01 00 74 */	lbz r0, 0x74(r1)
/* 801096C0 00104EE0  28 00 00 05 */	cmplwi r0, 0x5
/* 801096C4 00104EE4  40 82 00 3C */	bne .L_80109700
/* 801096C8 00104EE8  7E 63 9B 78 */	mr r3, r19
/* 801096CC 00104EEC  38 80 00 01 */	li r4, 0x1
/* 801096D0 00104EF0  4B FF A4 C1 */	bl __va_arg
/* 801096D4 00104EF4  80 83 00 00 */	lwz r4, 0x0(r3)
/* 801096D8 00104EF8  2C 04 00 00 */	cmpwi r4, 0x0
/* 801096DC 00104EFC  40 82 00 08 */	bne .L_801096E4
/* 801096E0 00104F00  38 8D 82 98 */	li r4, "@wstringBase0_8066AA98"@sda21
.L_801096E4:
/* 801096E4 00104F04  38 61 00 80 */	addi r3, r1, 0x80
/* 801096E8 00104F08  38 A0 02 00 */	li r5, 0x200
/* 801096EC 00104F0C  4B FF DD 0D */	bl wcstombs
/* 801096F0 00104F10  2C 03 00 00 */	cmpwi r3, 0x0
/* 801096F4 00104F14  41 80 01 44 */	blt .L_80109838
/* 801096F8 00104F18  3B 41 00 80 */	addi r26, r1, 0x80
/* 801096FC 00104F1C  48 00 00 14 */	b .L_80109710
.L_80109700:
/* 80109700 00104F20  7E 63 9B 78 */	mr r3, r19
/* 80109704 00104F24  38 80 00 01 */	li r4, 0x1
/* 80109708 00104F28  4B FF A4 89 */	bl __va_arg
/* 8010970C 00104F2C  83 43 00 00 */	lwz r26, 0x0(r3)
.L_80109710:
/* 80109710 00104F30  2C 1A 00 00 */	cmpwi r26, 0x0
/* 80109714 00104F34  40 82 00 08 */	bne .L_8010971C
/* 80109718 00104F38  3B 5D 00 2A */	addi r26, r29, 0x2a
.L_8010971C:
/* 8010971C 00104F3C  88 01 00 73 */	lbz r0, 0x73(r1)
/* 80109720 00104F40  2C 00 00 00 */	cmpwi r0, 0x0
/* 80109724 00104F44  41 82 00 2C */	beq .L_80109750
/* 80109728 00104F48  88 01 00 72 */	lbz r0, 0x72(r1)
/* 8010972C 00104F4C  8B 7A 00 00 */	lbz r27, 0x0(r26)
/* 80109730 00104F50  3B 5A 00 01 */	addi r26, r26, 0x1
/* 80109734 00104F54  2C 00 00 00 */	cmpwi r0, 0x0
/* 80109738 00104F58  41 82 01 44 */	beq .L_8010987C
/* 8010973C 00104F5C  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 80109740 00104F60  7C 1B 00 00 */	cmpw r27, r0
/* 80109744 00104F64  40 81 01 38 */	ble .L_8010987C
/* 80109748 00104F68  7C 1B 03 78 */	mr r27, r0
/* 8010974C 00104F6C  48 00 01 30 */	b .L_8010987C
.L_80109750:
/* 80109750 00104F70  88 01 00 72 */	lbz r0, 0x72(r1)
/* 80109754 00104F74  2C 00 00 00 */	cmpwi r0, 0x0
/* 80109758 00104F78  41 82 00 28 */	beq .L_80109780
/* 8010975C 00104F7C  83 61 00 7C */	lwz r27, 0x7c(r1)
/* 80109760 00104F80  7F 43 D3 78 */	mr r3, r26
/* 80109764 00104F84  38 80 00 00 */	li r4, 0x0
/* 80109768 00104F88  7F 65 DB 78 */	mr r5, r27
/* 8010976C 00104F8C  4B FF DE 11 */	bl memchr
/* 80109770 00104F90  2C 03 00 00 */	cmpwi r3, 0x0
/* 80109774 00104F94  41 82 01 08 */	beq .L_8010987C
/* 80109778 00104F98  7F 7A 18 50 */	subf r27, r26, r3
/* 8010977C 00104F9C  48 00 01 00 */	b .L_8010987C
.L_80109780:
/* 80109780 00104FA0  7F 43 D3 78 */	mr r3, r26
/* 80109784 00104FA4  4B FF A3 F1 */	bl strlen
/* 80109788 00104FA8  7C 7B 1B 78 */	mr r27, r3
/* 8010978C 00104FAC  48 00 00 F0 */	b .L_8010987C
.L_80109790:
/* 80109790 00104FB0  7E 63 9B 78 */	mr r3, r19
/* 80109794 00104FB4  38 80 00 01 */	li r4, 0x1
/* 80109798 00104FB8  4B FF A3 F9 */	bl __va_arg
/* 8010979C 00104FBC  88 01 00 74 */	lbz r0, 0x74(r1)
/* 801097A0 00104FC0  80 83 00 00 */	lwz r4, 0x0(r3)
/* 801097A4 00104FC4  28 00 00 08 */	cmplwi r0, 0x8
/* 801097A8 00104FC8  41 81 02 10 */	bgt .L_801099B8
/* 801097AC 00104FCC  38 7E C4 04 */	addi r3, r30, "@2720_8056C404"@l
/* 801097B0 00104FD0  54 00 10 3A */	slwi r0, r0, 2
/* 801097B4 00104FD4  7C 63 00 2E */	lwzx r3, r3, r0
/* 801097B8 00104FD8  7C 69 03 A6 */	mtctr r3
/* 801097BC 00104FDC  4E 80 04 20 */	bctr
/* 801097C0 00104FE0  93 24 00 00 */	stw r25, 0x0(r4)
/* 801097C4 00104FE4  48 00 01 F4 */	b .L_801099B8
/* 801097C8 00104FE8  B3 24 00 00 */	sth r25, 0x0(r4)
/* 801097CC 00104FEC  48 00 01 EC */	b .L_801099B8
/* 801097D0 00104FF0  93 24 00 00 */	stw r25, 0x0(r4)
/* 801097D4 00104FF4  48 00 01 E4 */	b .L_801099B8
/* 801097D8 00104FF8  93 24 00 04 */	stw r25, 0x4(r4)
/* 801097DC 00104FFC  7F 20 FE 70 */	srawi r0, r25, 31
/* 801097E0 00105000  90 04 00 00 */	stw r0, 0x0(r4)
/* 801097E4 00105004  48 00 01 D4 */	b .L_801099B8
/* 801097E8 00105008  93 24 00 00 */	stw r25, 0x0(r4)
/* 801097EC 0010500C  48 00 01 CC */	b .L_801099B8
/* 801097F0 00105010  93 24 00 00 */	stw r25, 0x0(r4)
/* 801097F4 00105014  48 00 01 C4 */	b .L_801099B8
/* 801097F8 00105018  93 24 00 04 */	stw r25, 0x4(r4)
/* 801097FC 0010501C  7F 20 FE 70 */	srawi r0, r25, 31
/* 80109800 00105020  90 04 00 00 */	stw r0, 0x0(r4)
/* 80109804 00105024  48 00 01 B4 */	b .L_801099B8
.L_80109808:
/* 80109808 00105028  7E 63 9B 78 */	mr r3, r19
/* 8010980C 0010502C  3B 41 00 80 */	addi r26, r1, 0x80
/* 80109810 00105030  38 80 00 01 */	li r4, 0x1
/* 80109814 00105034  4B FF A3 7D */	bl __va_arg
/* 80109818 00105038  80 03 00 00 */	lwz r0, 0x0(r3)
/* 8010981C 0010503C  3B 60 00 01 */	li r27, 0x1
/* 80109820 00105040  98 01 00 80 */	stb r0, 0x80(r1)
/* 80109824 00105044  48 00 00 58 */	b .L_8010987C
.L_80109828:
/* 80109828 00105048  9B E1 00 80 */	stb r31, 0x80(r1)
/* 8010982C 0010504C  3B 41 00 80 */	addi r26, r1, 0x80
/* 80109830 00105050  3B 60 00 01 */	li r27, 0x1
/* 80109834 00105054  48 00 00 48 */	b .L_8010987C
.L_80109838:
/* 80109838 00105058  7F 03 C3 78 */	mr r3, r24
/* 8010983C 0010505C  4B FF A3 39 */	bl strlen
/* 80109840 00105060  2C 03 00 00 */	cmpwi r3, 0x0
/* 80109844 00105064  7C 65 1B 78 */	mr r5, r3
/* 80109848 00105068  7F 39 1A 14 */	add r25, r25, r3
/* 8010984C 0010506C  41 82 00 28 */	beq .L_80109874
/* 80109850 00105070  7E 2C 8B 78 */	mr r12, r17
/* 80109854 00105074  7E 43 93 78 */	mr r3, r18
/* 80109858 00105078  7F 04 C3 78 */	mr r4, r24
/* 8010985C 0010507C  7D 89 03 A6 */	mtctr r12
/* 80109860 00105080  4E 80 04 21 */	bctrl
/* 80109864 00105084  2C 03 00 00 */	cmpwi r3, 0x0
/* 80109868 00105088  40 82 00 0C */	bne .L_80109874
/* 8010986C 0010508C  38 60 FF FF */	li r3, -0x1
/* 80109870 00105090  48 00 01 58 */	b .L_801099C8
.L_80109874:
/* 80109874 00105094  7F 23 CB 78 */	mr r3, r25
/* 80109878 00105098  48 00 01 50 */	b .L_801099C8
.L_8010987C:
/* 8010987C 0010509C  88 01 00 70 */	lbz r0, 0x70(r1)
/* 80109880 001050A0  7F 78 DB 78 */	mr r24, r27
/* 80109884 001050A4  2C 00 00 00 */	cmpwi r0, 0x0
/* 80109888 001050A8  41 82 00 B0 */	beq .L_80109938
/* 8010988C 001050AC  28 00 00 02 */	cmplwi r0, 0x2
/* 80109890 001050B0  38 60 00 20 */	li r3, 0x20
/* 80109894 001050B4  40 82 00 08 */	bne .L_8010989C
/* 80109898 001050B8  38 60 00 30 */	li r3, 0x30
.L_8010989C:
/* 8010989C 001050BC  98 61 00 09 */	stb r3, 0x9(r1)
/* 801098A0 001050C0  88 1A 00 00 */	lbz r0, 0x0(r26)
/* 801098A4 001050C4  7C 00 07 74 */	extsb r0, r0
/* 801098A8 001050C8  2C 00 00 2B */	cmpwi r0, 0x2b
/* 801098AC 001050CC  41 82 00 14 */	beq .L_801098C0
/* 801098B0 001050D0  2C 00 00 2D */	cmpwi r0, 0x2d
/* 801098B4 001050D4  41 82 00 0C */	beq .L_801098C0
/* 801098B8 001050D8  2C 00 00 20 */	cmpwi r0, 0x20
/* 801098BC 001050DC  40 82 00 70 */	bne .L_8010992C
.L_801098C0:
/* 801098C0 001050E0  7C 60 07 74 */	extsb r0, r3
/* 801098C4 001050E4  2C 00 00 30 */	cmpwi r0, 0x30
/* 801098C8 001050E8  40 82 00 64 */	bne .L_8010992C
/* 801098CC 001050EC  7E 2C 8B 78 */	mr r12, r17
/* 801098D0 001050F0  7E 43 93 78 */	mr r3, r18
/* 801098D4 001050F4  7F 44 D3 78 */	mr r4, r26
/* 801098D8 001050F8  38 A0 00 01 */	li r5, 0x1
/* 801098DC 001050FC  7D 89 03 A6 */	mtctr r12
/* 801098E0 00105100  4E 80 04 21 */	bctrl
/* 801098E4 00105104  2C 03 00 00 */	cmpwi r3, 0x0
/* 801098E8 00105108  40 82 00 0C */	bne .L_801098F4
/* 801098EC 0010510C  38 60 FF FF */	li r3, -0x1
/* 801098F0 00105110  48 00 00 D8 */	b .L_801099C8
.L_801098F4:
/* 801098F4 00105114  3B 5A 00 01 */	addi r26, r26, 0x1
/* 801098F8 00105118  3B 7B FF FF */	subi r27, r27, 0x1
/* 801098FC 0010511C  48 00 00 30 */	b .L_8010992C
.L_80109900:
/* 80109900 00105120  7E 2C 8B 78 */	mr r12, r17
/* 80109904 00105124  7E 43 93 78 */	mr r3, r18
/* 80109908 00105128  38 81 00 09 */	addi r4, r1, 0x9
/* 8010990C 0010512C  38 A0 00 01 */	li r5, 0x1
/* 80109910 00105130  7D 89 03 A6 */	mtctr r12
/* 80109914 00105134  4E 80 04 21 */	bctrl
/* 80109918 00105138  2C 03 00 00 */	cmpwi r3, 0x0
/* 8010991C 0010513C  40 82 00 0C */	bne .L_80109928
/* 80109920 00105140  38 60 FF FF */	li r3, -0x1
/* 80109924 00105144  48 00 00 A4 */	b .L_801099C8
.L_80109928:
/* 80109928 00105148  3B 18 00 01 */	addi r24, r24, 0x1
.L_8010992C:
/* 8010992C 0010514C  80 01 00 78 */	lwz r0, 0x78(r1)
/* 80109930 00105150  7C 18 00 00 */	cmpw r24, r0
/* 80109934 00105154  41 80 FF CC */	blt .L_80109900
.L_80109938:
/* 80109938 00105158  2C 1B 00 00 */	cmpwi r27, 0x0
/* 8010993C 0010515C  41 82 00 2C */	beq .L_80109968
/* 80109940 00105160  7E 2C 8B 78 */	mr r12, r17
/* 80109944 00105164  7E 43 93 78 */	mr r3, r18
/* 80109948 00105168  7F 44 D3 78 */	mr r4, r26
/* 8010994C 0010516C  7F 65 DB 78 */	mr r5, r27
/* 80109950 00105170  7D 89 03 A6 */	mtctr r12
/* 80109954 00105174  4E 80 04 21 */	bctrl
/* 80109958 00105178  2C 03 00 00 */	cmpwi r3, 0x0
/* 8010995C 0010517C  40 82 00 0C */	bne .L_80109968
/* 80109960 00105180  38 60 FF FF */	li r3, -0x1
/* 80109964 00105184  48 00 00 64 */	b .L_801099C8
.L_80109968:
/* 80109968 00105188  88 01 00 70 */	lbz r0, 0x70(r1)
/* 8010996C 0010518C  2C 00 00 00 */	cmpwi r0, 0x0
/* 80109970 00105190  40 82 00 44 */	bne .L_801099B4
/* 80109974 00105194  48 00 00 34 */	b .L_801099A8
.L_80109978:
/* 80109978 00105198  7E 2C 8B 78 */	mr r12, r17
/* 8010997C 0010519C  7E 43 93 78 */	mr r3, r18
/* 80109980 001051A0  9A 01 00 08 */	stb r16, 0x8(r1)
/* 80109984 001051A4  38 81 00 08 */	addi r4, r1, 0x8
/* 80109988 001051A8  38 A0 00 01 */	li r5, 0x1
/* 8010998C 001051AC  7D 89 03 A6 */	mtctr r12
/* 80109990 001051B0  4E 80 04 21 */	bctrl
/* 80109994 001051B4  2C 03 00 00 */	cmpwi r3, 0x0
/* 80109998 001051B8  40 82 00 0C */	bne .L_801099A4
/* 8010999C 001051BC  38 60 FF FF */	li r3, -0x1
/* 801099A0 001051C0  48 00 00 28 */	b .L_801099C8
.L_801099A4:
/* 801099A4 001051C4  3B 18 00 01 */	addi r24, r24, 0x1
.L_801099A8:
/* 801099A8 001051C8  80 01 00 78 */	lwz r0, 0x78(r1)
/* 801099AC 001051CC  7C 18 00 00 */	cmpw r24, r0
/* 801099B0 001051D0  41 80 FF C8 */	blt .L_80109978
.L_801099B4:
/* 801099B4 001051D4  7F 39 C2 14 */	add r25, r25, r24
.L_801099B8:
/* 801099B8 001051D8  88 17 00 00 */	lbz r0, 0x0(r23)
/* 801099BC 001051DC  7C 00 07 75 */	extsb. r0, r0
/* 801099C0 001051E0  40 82 F8 04 */	bne .L_801091C4
.L_801099C4:
/* 801099C4 001051E4  7F 23 CB 78 */	mr r3, r25
.L_801099C8:
/* 801099C8 001051E8  BA 01 02 80 */	lmw r16, 0x280(r1)
/* 801099CC 001051EC  80 01 02 C4 */	lwz r0, 0x2c4(r1)
/* 801099D0 001051F0  7C 08 03 A6 */	mtlr r0
/* 801099D4 001051F4  38 21 02 C0 */	addi r1, r1, 0x2c0
/* 801099D8 001051F8  4E 80 00 20 */	blr
.endfn __pformatter_80109180