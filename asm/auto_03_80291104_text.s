.include "macros.inc"
.file "auto_03_80291104_text"

# 0x80291104 - 0x8029190C
.text
.balign 4

.fn fn_80291104, global
/* 80291104 0028C924  39 60 00 04 */	li r11, 0x4
/* 80291108 0028C928  7D 63 58 2E */	lwzx r11, r3, r11
/* 8029110C 0028C92C  7C 63 5A 14 */	add r3, r3, r11
/* 80291110 0028C930  38 63 FF D8 */	subi r3, r3, 0x28
/* 80291114 0028C934  4B FF FF 50 */	b fn_80291064
.endfn fn_80291104

.fn fn_80291118, global
/* 80291118 0028C938  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8029111C 0028C93C  7C 08 02 A6 */	mflr r0
/* 80291120 0028C940  90 01 00 24 */	stw r0, 0x24(r1)
/* 80291124 0028C944  BF 41 00 08 */	stmw r26, 0x8(r1)
/* 80291128 0028C948  7C 7A 1B 78 */	mr r26, r3
/* 8029112C 0028C94C  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80291130 0028C950  81 8C 00 20 */	lwz r12, 0x20(r12)
/* 80291134 0028C954  7D 89 03 A6 */	mtctr r12
/* 80291138 0028C958  4E 80 04 21 */	bctrl
/* 8029113C 0028C95C  80 6D A9 AC */	lwz r3, lbl_8066D1AC@sda21(r0)
/* 80291140 0028C960  3B 80 00 00 */	li r28, 0x0
/* 80291144 0028C964  3B E0 00 00 */	li r31, 0x0
/* 80291148 0028C968  3B C0 00 01 */	li r30, 0x1
/* 8029114C 0028C96C  83 A3 00 24 */	lwz r29, 0x24(r3)
/* 80291150 0028C970  48 00 00 58 */	b .L_802911A8
.L_80291154:
/* 80291154 0028C974  7F A3 EB 78 */	mr r3, r29
/* 80291158 0028C978  7F 84 E3 78 */	mr r4, r28
/* 8029115C 0028C97C  48 21 A7 85 */	bl fn_804AB8E0
/* 80291160 0028C980  7C 7B 1B 78 */	mr r27, r3
/* 80291164 0028C984  48 21 A3 65 */	bl fn_804AB4C8
/* 80291168 0028C988  2C 03 00 00 */	cmpwi r3, 0x0
/* 8029116C 0028C98C  40 82 00 10 */	bne .L_8029117C
/* 80291170 0028C990  7C 7A E2 14 */	add r3, r26, r28
/* 80291174 0028C994  9B E3 00 1C */	stb r31, 0x1c(r3)
/* 80291178 0028C998  48 00 00 2C */	b .L_802911A4
.L_8029117C:
/* 8029117C 0028C99C  80 7B 00 44 */	lwz r3, 0x44(r27)
/* 80291180 0028C9A0  38 9A 00 0C */	addi r4, r26, 0xc
/* 80291184 0028C9A4  48 20 FA ED */	bl fn_804A0C70
/* 80291188 0028C9A8  2C 03 00 00 */	cmpwi r3, 0x0
/* 8029118C 0028C9AC  41 82 00 10 */	beq .L_8029119C
/* 80291190 0028C9B0  7C 7A E2 14 */	add r3, r26, r28
/* 80291194 0028C9B4  9B C3 00 1C */	stb r30, 0x1c(r3)
/* 80291198 0028C9B8  48 00 00 0C */	b .L_802911A4
.L_8029119C:
/* 8029119C 0028C9BC  7C 7A E2 14 */	add r3, r26, r28
/* 802911A0 0028C9C0  9B E3 00 1C */	stb r31, 0x1c(r3)
.L_802911A4:
/* 802911A4 0028C9C4  3B 9C 00 01 */	addi r28, r28, 0x1
.L_802911A8:
/* 802911A8 0028C9C8  80 1D 02 64 */	lwz r0, 0x264(r29)
/* 802911AC 0028C9CC  7C 1C 00 00 */	cmpw r28, r0
/* 802911B0 0028C9D0  41 80 FF A4 */	blt .L_80291154
/* 802911B4 0028C9D4  81 9A 00 00 */	lwz r12, 0x0(r26)
/* 802911B8 0028C9D8  7F 43 D3 78 */	mr r3, r26
/* 802911BC 0028C9DC  81 8C 00 1C */	lwz r12, 0x1c(r12)
/* 802911C0 0028C9E0  7D 89 03 A6 */	mtctr r12
/* 802911C4 0028C9E4  4E 80 04 21 */	bctrl
/* 802911C8 0028C9E8  BB 41 00 08 */	lmw r26, 0x8(r1)
/* 802911CC 0028C9EC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802911D0 0028C9F0  7C 08 03 A6 */	mtlr r0
/* 802911D4 0028C9F4  38 21 00 20 */	addi r1, r1, 0x20
/* 802911D8 0028C9F8  4E 80 00 20 */	blr
.endfn fn_80291118

.fn fn_802911DC, global
/* 802911DC 0028C9FC  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 802911E0 0028CA00  7C 08 02 A6 */	mflr r0
/* 802911E4 0028CA04  90 01 00 54 */	stw r0, 0x54(r1)
/* 802911E8 0028CA08  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 802911EC 0028CA0C  F3 E1 00 48 */	psq_st f31, 0x48(r1), 0, qr0
/* 802911F0 0028CA10  DB C1 00 30 */	stfd f30, 0x30(r1)
/* 802911F4 0028CA14  F3 C1 00 38 */	psq_st f30, 0x38(r1), 0, qr0
/* 802911F8 0028CA18  C3 C2 B3 20 */	lfs f30, lbl_80670800@sda21(r0)
/* 802911FC 0028CA1C  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80291200 0028CA20  3B E0 FF FF */	li r31, -0x1
/* 80291204 0028CA24  C3 E2 B3 24 */	lfs f31, lbl_80670804@sda21(r0)
/* 80291208 0028CA28  93 C1 00 28 */	stw r30, 0x28(r1)
/* 8029120C 0028CA2C  3B C0 00 00 */	li r30, 0x0
/* 80291210 0028CA30  93 A1 00 24 */	stw r29, 0x24(r1)
/* 80291214 0028CA34  7C 9D 23 78 */	mr r29, r4
/* 80291218 0028CA38  93 81 00 20 */	stw r28, 0x20(r1)
/* 8029121C 0028CA3C  7C 7C 1B 78 */	mr r28, r3
/* 80291220 0028CA40  48 00 00 D8 */	b .L_802912F8
.L_80291224:
/* 80291224 0028CA44  81 9C 00 00 */	lwz r12, 0x0(r28)
/* 80291228 0028CA48  7F 83 E3 78 */	mr r3, r28
/* 8029122C 0028CA4C  7F C4 F3 78 */	mr r4, r30
/* 80291230 0028CA50  81 8C 00 10 */	lwz r12, 0x10(r12)
/* 80291234 0028CA54  7D 89 03 A6 */	mtctr r12
/* 80291238 0028CA58  4E 80 04 21 */	bctrl
/* 8029123C 0028CA5C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80291240 0028CA60  41 82 00 B4 */	beq .L_802912F4
/* 80291244 0028CA64  81 9C 00 00 */	lwz r12, 0x0(r28)
/* 80291248 0028CA68  7F 83 E3 78 */	mr r3, r28
/* 8029124C 0028CA6C  7F C4 F3 78 */	mr r4, r30
/* 80291250 0028CA70  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80291254 0028CA74  7D 89 03 A6 */	mtctr r12
/* 80291258 0028CA78  4E 80 04 21 */	bctrl
/* 8029125C 0028CA7C  81 83 00 0C */	lwz r12, 0xc(r3)
/* 80291260 0028CA80  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 80291264 0028CA84  7D 89 03 A6 */	mtctr r12
/* 80291268 0028CA88  4E 80 04 21 */	bctrl
/* 8029126C 0028CA8C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80291270 0028CA90  41 82 00 84 */	beq .L_802912F4
/* 80291274 0028CA94  81 9C 00 00 */	lwz r12, 0x0(r28)
/* 80291278 0028CA98  7F 83 E3 78 */	mr r3, r28
/* 8029127C 0028CA9C  7F C4 F3 78 */	mr r4, r30
/* 80291280 0028CAA0  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80291284 0028CAA4  7D 89 03 A6 */	mtctr r12
/* 80291288 0028CAA8  4E 80 04 21 */	bctrl
/* 8029128C 0028CAAC  C0 43 00 04 */	lfs f2, 0x4(r3)
/* 80291290 0028CAB0  C0 1D 00 04 */	lfs f0, 0x4(r29)
/* 80291294 0028CAB4  C0 23 00 00 */	lfs f1, 0x0(r3)
/* 80291298 0028CAB8  EC 82 00 28 */	fsubs f4, f2, f0
/* 8029129C 0028CABC  C0 1D 00 00 */	lfs f0, 0x0(r29)
/* 802912A0 0028CAC0  C0 43 00 08 */	lfs f2, 0x8(r3)
/* 802912A4 0028CAC4  EC 61 00 28 */	fsubs f3, f1, f0
/* 802912A8 0028CAC8  C0 3D 00 08 */	lfs f1, 0x8(r29)
/* 802912AC 0028CACC  EC 04 01 32 */	fmuls f0, f4, f4
/* 802912B0 0028CAD0  EC 22 08 28 */	fsubs f1, f2, f1
/* 802912B4 0028CAD4  D0 81 00 0C */	stfs f4, 0xc(r1)
/* 802912B8 0028CAD8  EC 03 00 FA */	fmadds f0, f3, f3, f0
/* 802912BC 0028CADC  D0 61 00 08 */	stfs f3, 0x8(r1)
/* 802912C0 0028CAE0  D0 21 00 10 */	stfs f1, 0x10(r1)
/* 802912C4 0028CAE4  EC 01 00 7A */	fmadds f0, f1, f1, f0
/* 802912C8 0028CAE8  FC 00 F8 40 */	fcmpo cr0, f0, f31
/* 802912CC 0028CAEC  40 81 00 14 */	ble .L_802912E0
/* 802912D0 0028CAF0  40 81 00 14 */	ble .L_802912E4
/* 802912D4 0028CAF4  FC 20 00 34 */	frsqrte f1, f0
/* 802912D8 0028CAF8  EC 01 00 32 */	fmuls f0, f1, f0
/* 802912DC 0028CAFC  48 00 00 08 */	b .L_802912E4
.L_802912E0:
/* 802912E0 0028CB00  FC 00 F8 90 */	fmr f0, f31
.L_802912E4:
/* 802912E4 0028CB04  FC 00 F0 40 */	fcmpo cr0, f0, f30
/* 802912E8 0028CB08  40 80 00 0C */	bge .L_802912F4
/* 802912EC 0028CB0C  FF C0 00 90 */	fmr f30, f0
/* 802912F0 0028CB10  7F DF F3 78 */	mr r31, r30
.L_802912F4:
/* 802912F4 0028CB14  3B DE 00 01 */	addi r30, r30, 0x1
.L_802912F8:
/* 802912F8 0028CB18  81 9C 00 00 */	lwz r12, 0x0(r28)
/* 802912FC 0028CB1C  7F 83 E3 78 */	mr r3, r28
/* 80291300 0028CB20  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 80291304 0028CB24  7D 89 03 A6 */	mtctr r12
/* 80291308 0028CB28  4E 80 04 21 */	bctrl
/* 8029130C 0028CB2C  7C 1E 18 00 */	cmpw r30, r3
/* 80291310 0028CB30  41 80 FF 14 */	blt .L_80291224
/* 80291314 0028CB34  7F E3 FB 78 */	mr r3, r31
/* 80291318 0028CB38  E3 E1 00 48 */	psq_l f31, 0x48(r1), 0, qr0
/* 8029131C 0028CB3C  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 80291320 0028CB40  E3 C1 00 38 */	psq_l f30, 0x38(r1), 0, qr0
/* 80291324 0028CB44  CB C1 00 30 */	lfd f30, 0x30(r1)
/* 80291328 0028CB48  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 8029132C 0028CB4C  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80291330 0028CB50  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80291334 0028CB54  83 81 00 20 */	lwz r28, 0x20(r1)
/* 80291338 0028CB58  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8029133C 0028CB5C  7C 08 03 A6 */	mtlr r0
/* 80291340 0028CB60  38 21 00 50 */	addi r1, r1, 0x50
/* 80291344 0028CB64  4E 80 00 20 */	blr
.endfn fn_802911DC

.fn fn_80291348, global
/* 80291348 0028CB68  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8029134C 0028CB6C  7C 08 02 A6 */	mflr r0
/* 80291350 0028CB70  2C 04 00 00 */	cmpwi r4, 0x0
/* 80291354 0028CB74  90 01 00 24 */	stw r0, 0x24(r1)
/* 80291358 0028CB78  DB E1 00 18 */	stfd f31, 0x18(r1)
/* 8029135C 0028CB7C  FF E0 08 90 */	fmr f31, f1
/* 80291360 0028CB80  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80291364 0028CB84  3B E0 00 00 */	li r31, 0x0
/* 80291368 0028CB88  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8029136C 0028CB8C  7C 9E 23 78 */	mr r30, r4
/* 80291370 0028CB90  93 A1 00 0C */	stw r29, 0xc(r1)
/* 80291374 0028CB94  7C 7D 1B 78 */	mr r29, r3
/* 80291378 0028CB98  41 80 00 20 */	blt .L_80291398
/* 8029137C 0028CB9C  81 83 00 00 */	lwz r12, 0x0(r3)
/* 80291380 0028CBA0  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 80291384 0028CBA4  7D 89 03 A6 */	mtctr r12
/* 80291388 0028CBA8  4E 80 04 21 */	bctrl
/* 8029138C 0028CBAC  7C 1E 18 00 */	cmpw r30, r3
/* 80291390 0028CBB0  40 80 00 08 */	bge .L_80291398
/* 80291394 0028CBB4  3B E0 00 01 */	li r31, 0x1
.L_80291398:
/* 80291398 0028CBB8  2C 1F 00 00 */	cmpwi r31, 0x0
/* 8029139C 0028CBBC  40 82 00 20 */	bne .L_802913BC
/* 802913A0 0028CBC0  3C A0 80 55 */	lis r5, lbl_8054B688@ha
/* 802913A4 0028CBC4  38 80 00 5D */	li r4, 0x5d
/* 802913A8 0028CBC8  38 A5 B6 88 */	addi r5, r5, lbl_8054B688@l
/* 802913AC 0028CBCC  38 65 00 09 */	addi r3, r5, 0x9
/* 802913B0 0028CBD0  38 A5 00 16 */	addi r5, r5, 0x16
/* 802913B4 0028CBD4  4C C6 31 82 */	crclr cr1eq
/* 802913B8 0028CBD8  4B DF D9 49 */	bl fn_8008ED00
.L_802913BC:
/* 802913BC 0028CBDC  81 9D 00 00 */	lwz r12, 0x0(r29)
/* 802913C0 0028CBE0  7F A3 EB 78 */	mr r3, r29
/* 802913C4 0028CBE4  7F C4 F3 78 */	mr r4, r30
/* 802913C8 0028CBE8  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 802913CC 0028CBEC  7D 89 03 A6 */	mtctr r12
/* 802913D0 0028CBF0  4E 80 04 21 */	bctrl
/* 802913D4 0028CBF4  81 9D 00 00 */	lwz r12, 0x0(r29)
/* 802913D8 0028CBF8  7C 7F 1B 78 */	mr r31, r3
/* 802913DC 0028CBFC  7F A3 EB 78 */	mr r3, r29
/* 802913E0 0028CC00  7F C4 F3 78 */	mr r4, r30
/* 802913E4 0028CC04  81 8C 00 10 */	lwz r12, 0x10(r12)
/* 802913E8 0028CC08  7D 89 03 A6 */	mtctr r12
/* 802913EC 0028CC0C  4E 80 04 21 */	bctrl
/* 802913F0 0028CC10  2C 03 00 00 */	cmpwi r3, 0x0
/* 802913F4 0028CC14  41 82 00 4C */	beq .L_80291440
/* 802913F8 0028CC18  81 9F 00 0C */	lwz r12, 0xc(r31)
/* 802913FC 0028CC1C  FC 20 F8 90 */	fmr f1, f31
/* 80291400 0028CC20  7F E3 FB 78 */	mr r3, r31
/* 80291404 0028CC24  81 8C 00 1C */	lwz r12, 0x1c(r12)
/* 80291408 0028CC28  7D 89 03 A6 */	mtctr r12
/* 8029140C 0028CC2C  4E 80 04 21 */	bctrl
/* 80291410 0028CC30  2C 03 00 00 */	cmpwi r3, 0x0
/* 80291414 0028CC34  41 82 00 24 */	beq .L_80291438
/* 80291418 0028CC38  81 9D 00 00 */	lwz r12, 0x0(r29)
/* 8029141C 0028CC3C  7F A3 EB 78 */	mr r3, r29
/* 80291420 0028CC40  7F E4 FB 78 */	mr r4, r31
/* 80291424 0028CC44  81 8C 00 18 */	lwz r12, 0x18(r12)
/* 80291428 0028CC48  7D 89 03 A6 */	mtctr r12
/* 8029142C 0028CC4C  4E 80 04 21 */	bctrl
/* 80291430 0028CC50  38 60 00 01 */	li r3, 0x1
/* 80291434 0028CC54  48 00 00 10 */	b .L_80291444
.L_80291438:
/* 80291438 0028CC58  38 60 00 00 */	li r3, 0x0
/* 8029143C 0028CC5C  48 00 00 08 */	b .L_80291444
.L_80291440:
/* 80291440 0028CC60  38 60 00 02 */	li r3, 0x2
.L_80291444:
/* 80291444 0028CC64  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80291448 0028CC68  CB E1 00 18 */	lfd f31, 0x18(r1)
/* 8029144C 0028CC6C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80291450 0028CC70  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80291454 0028CC74  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 80291458 0028CC78  7C 08 03 A6 */	mtlr r0
/* 8029145C 0028CC7C  38 21 00 20 */	addi r1, r1, 0x20
/* 80291460 0028CC80  4E 80 00 20 */	blr
.endfn fn_80291348

.fn fn_80291464, global
/* 80291464 0028CC84  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 80291468 0028CC88  7C 08 02 A6 */	mflr r0
/* 8029146C 0028CC8C  90 01 00 94 */	stw r0, 0x94(r1)
/* 80291470 0028CC90  DB E1 00 80 */	stfd f31, 0x80(r1)
/* 80291474 0028CC94  F3 E1 00 88 */	psq_st f31, 0x88(r1), 0, qr0
/* 80291478 0028CC98  DB C1 00 70 */	stfd f30, 0x70(r1)
/* 8029147C 0028CC9C  F3 C1 00 78 */	psq_st f30, 0x78(r1), 0, qr0
/* 80291480 0028CCA0  DB A1 00 60 */	stfd f29, 0x60(r1)
/* 80291484 0028CCA4  F3 A1 00 68 */	psq_st f29, 0x68(r1), 0, qr0
/* 80291488 0028CCA8  DB 81 00 50 */	stfd f28, 0x50(r1)
/* 8029148C 0028CCAC  F3 81 00 58 */	psq_st f28, 0x58(r1), 0, qr0
/* 80291490 0028CCB0  39 61 00 50 */	addi r11, r1, 0x50
/* 80291494 0028CCB4  4B E7 2D 55 */	bl _savegpr_27
/* 80291498 0028CCB8  FF A0 08 90 */	fmr f29, f1
/* 8029149C 0028CCBC  C3 C2 B3 24 */	lfs f30, lbl_80670804@sda21(r0)
/* 802914A0 0028CCC0  C3 E2 B3 28 */	lfs f31, lbl_80670808@sda21(r0)
/* 802914A4 0028CCC4  7C 7B 1B 78 */	mr r27, r3
/* 802914A8 0028CCC8  C3 82 B3 2C */	lfs f28, lbl_8067080C@sda21(r0)
/* 802914AC 0028CCCC  3B C0 00 00 */	li r30, 0x0
.L_802914B0:
/* 802914B0 0028CCD0  3B A0 00 00 */	li r29, 0x0
/* 802914B4 0028CCD4  48 00 01 F4 */	b .L_802916A8
.L_802914B8:
/* 802914B8 0028CCD8  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 802914BC 0028CCDC  7F 63 DB 78 */	mr r3, r27
/* 802914C0 0028CCE0  7F A4 EB 78 */	mr r4, r29
/* 802914C4 0028CCE4  81 8C 00 10 */	lwz r12, 0x10(r12)
/* 802914C8 0028CCE8  7D 89 03 A6 */	mtctr r12
/* 802914CC 0028CCEC  4E 80 04 21 */	bctrl
/* 802914D0 0028CCF0  2C 03 00 00 */	cmpwi r3, 0x0
/* 802914D4 0028CCF4  41 82 01 D0 */	beq .L_802916A4
/* 802914D8 0028CCF8  3B 80 00 00 */	li r28, 0x0
/* 802914DC 0028CCFC  48 00 01 AC */	b .L_80291688
.L_802914E0:
/* 802914E0 0028CD00  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 802914E4 0028CD04  7F 63 DB 78 */	mr r3, r27
/* 802914E8 0028CD08  7F 84 E3 78 */	mr r4, r28
/* 802914EC 0028CD0C  81 8C 00 10 */	lwz r12, 0x10(r12)
/* 802914F0 0028CD10  7D 89 03 A6 */	mtctr r12
/* 802914F4 0028CD14  4E 80 04 21 */	bctrl
/* 802914F8 0028CD18  2C 03 00 00 */	cmpwi r3, 0x0
/* 802914FC 0028CD1C  41 82 01 88 */	beq .L_80291684
/* 80291500 0028CD20  7C 1D E0 00 */	cmpw r29, r28
/* 80291504 0028CD24  41 82 01 80 */	beq .L_80291684
/* 80291508 0028CD28  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 8029150C 0028CD2C  7F 63 DB 78 */	mr r3, r27
/* 80291510 0028CD30  7F A4 EB 78 */	mr r4, r29
/* 80291514 0028CD34  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80291518 0028CD38  7D 89 03 A6 */	mtctr r12
/* 8029151C 0028CD3C  4E 80 04 21 */	bctrl
/* 80291520 0028CD40  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 80291524 0028CD44  7C 7F 1B 78 */	mr r31, r3
/* 80291528 0028CD48  7F 63 DB 78 */	mr r3, r27
/* 8029152C 0028CD4C  7F 84 E3 78 */	mr r4, r28
/* 80291530 0028CD50  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80291534 0028CD54  7D 89 03 A6 */	mtctr r12
/* 80291538 0028CD58  4E 80 04 21 */	bctrl
/* 8029153C 0028CD5C  C0 5F 00 08 */	lfs f2, 0x8(r31)
/* 80291540 0028CD60  C0 03 00 08 */	lfs f0, 0x8(r3)
/* 80291544 0028CD64  C0 3F 00 00 */	lfs f1, 0x0(r31)
/* 80291548 0028CD68  EC 82 00 28 */	fsubs f4, f2, f0
/* 8029154C 0028CD6C  C0 03 00 00 */	lfs f0, 0x0(r3)
/* 80291550 0028CD70  C0 5F 00 04 */	lfs f2, 0x4(r31)
/* 80291554 0028CD74  EC 61 00 28 */	fsubs f3, f1, f0
/* 80291558 0028CD78  C0 23 00 04 */	lfs f1, 0x4(r3)
/* 8029155C 0028CD7C  EC 04 01 32 */	fmuls f0, f4, f4
/* 80291560 0028CD80  EC 22 08 28 */	fsubs f1, f2, f1
/* 80291564 0028CD84  D0 81 00 28 */	stfs f4, 0x28(r1)
/* 80291568 0028CD88  EC 03 00 FA */	fmadds f0, f3, f3, f0
/* 8029156C 0028CD8C  D0 61 00 20 */	stfs f3, 0x20(r1)
/* 80291570 0028CD90  D0 21 00 24 */	stfs f1, 0x24(r1)
/* 80291574 0028CD94  FC 00 F0 40 */	fcmpo cr0, f0, f30
/* 80291578 0028CD98  40 81 00 14 */	ble .L_8029158C
/* 8029157C 0028CD9C  40 81 00 14 */	ble .L_80291590
/* 80291580 0028CDA0  FC 20 00 34 */	frsqrte f1, f0
/* 80291584 0028CDA4  EC 01 00 32 */	fmuls f0, f1, f0
/* 80291588 0028CDA8  48 00 00 08 */	b .L_80291590
.L_8029158C:
/* 8029158C 0028CDAC  FC 00 F0 90 */	fmr f0, f30
.L_80291590:
/* 80291590 0028CDB0  FC 00 E8 40 */	fcmpo cr0, f0, f29
/* 80291594 0028CDB4  40 80 00 F0 */	bge .L_80291684
/* 80291598 0028CDB8  EC 5E 07 B2 */	fmuls f2, f30, f30
/* 8029159C 0028CDBC  C0 21 00 20 */	lfs f1, 0x20(r1)
/* 802915A0 0028CDC0  C0 01 00 28 */	lfs f0, 0x28(r1)
/* 802915A4 0028CDC4  D3 C1 00 24 */	stfs f30, 0x24(r1)
/* 802915A8 0028CDC8  EC 21 10 7A */	fmadds f1, f1, f1, f2
/* 802915AC 0028CDCC  EC 00 08 3A */	fmadds f0, f0, f0, f1
/* 802915B0 0028CDD0  FC 00 F0 40 */	fcmpo cr0, f0, f30
/* 802915B4 0028CDD4  40 81 00 14 */	ble .L_802915C8
/* 802915B8 0028CDD8  40 81 00 14 */	ble .L_802915CC
/* 802915BC 0028CDDC  FC 20 00 34 */	frsqrte f1, f0
/* 802915C0 0028CDE0  EC 01 00 32 */	fmuls f0, f1, f0
/* 802915C4 0028CDE4  48 00 00 08 */	b .L_802915CC
.L_802915C8:
/* 802915C8 0028CDE8  FC 00 F0 90 */	fmr f0, f30
.L_802915CC:
/* 802915CC 0028CDEC  FC 00 F0 40 */	fcmpo cr0, f0, f30
/* 802915D0 0028CDF0  40 81 00 2C */	ble .L_802915FC
/* 802915D4 0028CDF4  EC 7F 00 24 */	fdivs f3, f31, f0
/* 802915D8 0028CDF8  C0 41 00 20 */	lfs f2, 0x20(r1)
/* 802915DC 0028CDFC  C0 21 00 24 */	lfs f1, 0x24(r1)
/* 802915E0 0028CE00  C0 01 00 28 */	lfs f0, 0x28(r1)
/* 802915E4 0028CE04  EC 42 00 F2 */	fmuls f2, f2, f3
/* 802915E8 0028CE08  EC 21 00 F2 */	fmuls f1, f1, f3
/* 802915EC 0028CE0C  EC 00 00 F2 */	fmuls f0, f0, f3
/* 802915F0 0028CE10  D0 41 00 20 */	stfs f2, 0x20(r1)
/* 802915F4 0028CE14  D0 21 00 24 */	stfs f1, 0x24(r1)
/* 802915F8 0028CE18  D0 01 00 28 */	stfs f0, 0x28(r1)
.L_802915FC:
/* 802915FC 0028CE1C  EC 7C 07 72 */	fmuls f3, f28, f29
/* 80291600 0028CE20  C0 01 00 20 */	lfs f0, 0x20(r1)
/* 80291604 0028CE24  C0 21 00 24 */	lfs f1, 0x24(r1)
/* 80291608 0028CE28  C0 41 00 28 */	lfs f2, 0x28(r1)
/* 8029160C 0028CE2C  EC A0 00 F2 */	fmuls f5, f0, f3
/* 80291610 0028CE30  C0 1F 00 00 */	lfs f0, 0x0(r31)
/* 80291614 0028CE34  EC 81 00 F2 */	fmuls f4, f1, f3
/* 80291618 0028CE38  C0 3F 00 04 */	lfs f1, 0x4(r31)
/* 8029161C 0028CE3C  EC 62 00 F2 */	fmuls f3, f2, f3
/* 80291620 0028CE40  C0 5F 00 08 */	lfs f2, 0x8(r31)
/* 80291624 0028CE44  EC C0 28 28 */	fsubs f6, f0, f5
/* 80291628 0028CE48  D0 A1 00 20 */	stfs f5, 0x20(r1)
/* 8029162C 0028CE4C  EC E1 20 28 */	fsubs f7, f1, f4
/* 80291630 0028CE50  EC 42 18 28 */	fsubs f2, f2, f3
/* 80291634 0028CE54  D0 81 00 24 */	stfs f4, 0x24(r1)
/* 80291638 0028CE58  D0 DF 00 00 */	stfs f6, 0x0(r31)
/* 8029163C 0028CE5C  D0 FF 00 04 */	stfs f7, 0x4(r31)
/* 80291640 0028CE60  D0 5F 00 08 */	stfs f2, 0x8(r31)
/* 80291644 0028CE64  C0 03 00 00 */	lfs f0, 0x0(r3)
/* 80291648 0028CE68  C0 23 00 04 */	lfs f1, 0x4(r3)
/* 8029164C 0028CE6C  EC A0 28 2A */	fadds f5, f0, f5
/* 80291650 0028CE70  C0 03 00 08 */	lfs f0, 0x8(r3)
/* 80291654 0028CE74  EC 21 20 2A */	fadds f1, f1, f4
/* 80291658 0028CE78  D0 61 00 28 */	stfs f3, 0x28(r1)
/* 8029165C 0028CE7C  EC 00 18 2A */	fadds f0, f0, f3
/* 80291660 0028CE80  D0 A3 00 00 */	stfs f5, 0x0(r3)
/* 80291664 0028CE84  D0 23 00 04 */	stfs f1, 0x4(r3)
/* 80291668 0028CE88  D0 C1 00 14 */	stfs f6, 0x14(r1)
/* 8029166C 0028CE8C  D0 E1 00 18 */	stfs f7, 0x18(r1)
/* 80291670 0028CE90  D0 41 00 1C */	stfs f2, 0x1c(r1)
/* 80291674 0028CE94  D0 A1 00 08 */	stfs f5, 0x8(r1)
/* 80291678 0028CE98  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 8029167C 0028CE9C  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80291680 0028CEA0  D0 03 00 08 */	stfs f0, 0x8(r3)
.L_80291684:
/* 80291684 0028CEA4  3B 9C 00 01 */	addi r28, r28, 0x1
.L_80291688:
/* 80291688 0028CEA8  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 8029168C 0028CEAC  7F 63 DB 78 */	mr r3, r27
/* 80291690 0028CEB0  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 80291694 0028CEB4  7D 89 03 A6 */	mtctr r12
/* 80291698 0028CEB8  4E 80 04 21 */	bctrl
/* 8029169C 0028CEBC  7C 1C 18 00 */	cmpw r28, r3
/* 802916A0 0028CEC0  41 80 FE 40 */	blt .L_802914E0
.L_802916A4:
/* 802916A4 0028CEC4  3B BD 00 01 */	addi r29, r29, 0x1
.L_802916A8:
/* 802916A8 0028CEC8  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 802916AC 0028CECC  7F 63 DB 78 */	mr r3, r27
/* 802916B0 0028CED0  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 802916B4 0028CED4  7D 89 03 A6 */	mtctr r12
/* 802916B8 0028CED8  4E 80 04 21 */	bctrl
/* 802916BC 0028CEDC  7C 1D 18 00 */	cmpw r29, r3
/* 802916C0 0028CEE0  41 80 FD F8 */	blt .L_802914B8
/* 802916C4 0028CEE4  3B DE 00 01 */	addi r30, r30, 0x1
/* 802916C8 0028CEE8  2C 1E 00 04 */	cmpwi r30, 0x4
/* 802916CC 0028CEEC  41 80 FD E4 */	blt .L_802914B0
/* 802916D0 0028CEF0  3B 80 00 00 */	li r28, 0x0
/* 802916D4 0028CEF4  48 00 00 50 */	b .L_80291724
.L_802916D8:
/* 802916D8 0028CEF8  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 802916DC 0028CEFC  7F 63 DB 78 */	mr r3, r27
/* 802916E0 0028CF00  7F 84 E3 78 */	mr r4, r28
/* 802916E4 0028CF04  81 8C 00 10 */	lwz r12, 0x10(r12)
/* 802916E8 0028CF08  7D 89 03 A6 */	mtctr r12
/* 802916EC 0028CF0C  4E 80 04 21 */	bctrl
/* 802916F0 0028CF10  2C 03 00 00 */	cmpwi r3, 0x0
/* 802916F4 0028CF14  41 82 00 2C */	beq .L_80291720
/* 802916F8 0028CF18  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 802916FC 0028CF1C  7F 63 DB 78 */	mr r3, r27
/* 80291700 0028CF20  7F 84 E3 78 */	mr r4, r28
/* 80291704 0028CF24  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80291708 0028CF28  7D 89 03 A6 */	mtctr r12
/* 8029170C 0028CF2C  4E 80 04 21 */	bctrl
/* 80291710 0028CF30  81 83 00 0C */	lwz r12, 0xc(r3)
/* 80291714 0028CF34  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 80291718 0028CF38  7D 89 03 A6 */	mtctr r12
/* 8029171C 0028CF3C  4E 80 04 21 */	bctrl
.L_80291720:
/* 80291720 0028CF40  3B 9C 00 01 */	addi r28, r28, 0x1
.L_80291724:
/* 80291724 0028CF44  81 9B 00 00 */	lwz r12, 0x0(r27)
/* 80291728 0028CF48  7F 63 DB 78 */	mr r3, r27
/* 8029172C 0028CF4C  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 80291730 0028CF50  7D 89 03 A6 */	mtctr r12
/* 80291734 0028CF54  4E 80 04 21 */	bctrl
/* 80291738 0028CF58  7C 1C 18 00 */	cmpw r28, r3
/* 8029173C 0028CF5C  41 80 FF 9C */	blt .L_802916D8
/* 80291740 0028CF60  E3 E1 00 88 */	psq_l f31, 0x88(r1), 0, qr0
/* 80291744 0028CF64  CB E1 00 80 */	lfd f31, 0x80(r1)
/* 80291748 0028CF68  E3 C1 00 78 */	psq_l f30, 0x78(r1), 0, qr0
/* 8029174C 0028CF6C  CB C1 00 70 */	lfd f30, 0x70(r1)
/* 80291750 0028CF70  E3 A1 00 68 */	psq_l f29, 0x68(r1), 0, qr0
/* 80291754 0028CF74  CB A1 00 60 */	lfd f29, 0x60(r1)
/* 80291758 0028CF78  E3 81 00 58 */	psq_l f28, 0x58(r1), 0, qr0
/* 8029175C 0028CF7C  39 61 00 50 */	addi r11, r1, 0x50
/* 80291760 0028CF80  CB 81 00 50 */	lfd f28, 0x50(r1)
/* 80291764 0028CF84  4B E7 2A D1 */	bl _restgpr_27
/* 80291768 0028CF88  80 01 00 94 */	lwz r0, 0x94(r1)
/* 8029176C 0028CF8C  7C 08 03 A6 */	mtlr r0
/* 80291770 0028CF90  38 21 00 90 */	addi r1, r1, 0x90
/* 80291774 0028CF94  4E 80 00 20 */	blr
.endfn fn_80291464

.fn fn_80291778, global
/* 80291778 0028CF98  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 8029177C 0028CF9C  7C 08 02 A6 */	mflr r0
/* 80291780 0028CFA0  90 01 00 64 */	stw r0, 0x64(r1)
/* 80291784 0028CFA4  BE C1 00 38 */	stmw r22, 0x38(r1)
/* 80291788 0028CFA8  7C 7D 1B 78 */	mr r29, r3
/* 8029178C 0028CFAC  7C 9E 23 78 */	mr r30, r4
/* 80291790 0028CFB0  7C DF 33 78 */	mr r31, r6
/* 80291794 0028CFB4  A0 04 00 18 */	lhz r0, 0x18(r4)
/* 80291798 0028CFB8  7C 63 02 14 */	add r3, r3, r0
/* 8029179C 0028CFBC  88 03 00 1C */	lbz r0, 0x1c(r3)
/* 802917A0 0028CFC0  2C 00 00 00 */	cmpwi r0, 0x0
/* 802917A4 0028CFC4  41 82 01 54 */	beq .L_802918F8
/* 802917A8 0028CFC8  3F 60 80 66 */	lis r27, lbl_80665CB0@ha
/* 802917AC 0028CFCC  7C BA 2B 78 */	mr r26, r5
/* 802917B0 0028CFD0  3B 7B 5C B0 */	addi r27, r27, lbl_80665CB0@l
/* 802917B4 0028CFD4  3B 20 00 00 */	li r25, 0x0
/* 802917B8 0028CFD8  3B 80 00 00 */	li r28, 0x0
/* 802917BC 0028CFDC  48 00 01 34 */	b .L_802918F0
.L_802917C0:
/* 802917C0 0028CFE0  80 9A 00 00 */	lwz r4, 0x0(r26)
/* 802917C4 0028CFE4  80 64 00 28 */	lwz r3, 0x28(r4)
/* 802917C8 0028CFE8  80 04 00 A0 */	lwz r0, 0xa0(r4)
/* 802917CC 0028CFEC  80 63 00 00 */	lwz r3, 0x0(r3)
/* 802917D0 0028CFF0  83 03 00 58 */	lwz r24, 0x58(r3)
/* 802917D4 0028CFF4  90 1B 01 0C */	stw r0, 0x10c(r27)
/* 802917D8 0028CFF8  80 04 00 A4 */	lwz r0, 0xa4(r4)
/* 802917DC 0028CFFC  90 1B 01 10 */	stw r0, 0x110(r27)
/* 802917E0 0028D000  80 04 00 AC */	lwz r0, 0xac(r4)
/* 802917E4 0028D004  90 1B 01 14 */	stw r0, 0x114(r27)
/* 802917E8 0028D008  93 8D 96 A0 */	stw r28, lbl_8066BEA0@sda21(r0)
/* 802917EC 0028D00C  48 00 00 F4 */	b .L_802918E0
.L_802917F0:
/* 802917F0 0028D010  81 98 00 00 */	lwz r12, 0x0(r24)
/* 802917F4 0028D014  7F 03 C3 78 */	mr r3, r24
/* 802917F8 0028D018  81 8C 00 1C */	lwz r12, 0x1c(r12)
/* 802917FC 0028D01C  7D 89 03 A6 */	mtctr r12
/* 80291800 0028D020  4E 80 04 21 */	bctrl
/* 80291804 0028D024  80 78 00 08 */	lwz r3, 0x8(r24)
/* 80291808 0028D028  4B E3 4A 49 */	bl fn_800C6250
/* 8029180C 0028D02C  3A E0 00 00 */	li r23, 0x0
/* 80291810 0028D030  48 00 00 B0 */	b .L_802918C0
.L_80291814:
/* 80291814 0028D034  81 9D 00 00 */	lwz r12, 0x0(r29)
/* 80291818 0028D038  7F A3 EB 78 */	mr r3, r29
/* 8029181C 0028D03C  7E E4 BB 78 */	mr r4, r23
/* 80291820 0028D040  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80291824 0028D044  7D 89 03 A6 */	mtctr r12
/* 80291828 0028D048  4E 80 04 21 */	bctrl
/* 8029182C 0028D04C  81 9D 00 00 */	lwz r12, 0x0(r29)
/* 80291830 0028D050  7C 76 1B 78 */	mr r22, r3
/* 80291834 0028D054  7F A3 EB 78 */	mr r3, r29
/* 80291838 0028D058  7E E4 BB 78 */	mr r4, r23
/* 8029183C 0028D05C  81 8C 00 10 */	lwz r12, 0x10(r12)
/* 80291840 0028D060  7D 89 03 A6 */	mtctr r12
/* 80291844 0028D064  4E 80 04 21 */	bctrl
/* 80291848 0028D068  2C 03 00 00 */	cmpwi r3, 0x0
/* 8029184C 0028D06C  41 82 00 70 */	beq .L_802918BC
/* 80291850 0028D070  81 96 00 0C */	lwz r12, 0xc(r22)
/* 80291854 0028D074  7E C3 B3 78 */	mr r3, r22
/* 80291858 0028D078  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 8029185C 0028D07C  7D 89 03 A6 */	mtctr r12
/* 80291860 0028D080  4E 80 04 21 */	bctrl
/* 80291864 0028D084  2C 03 00 00 */	cmpwi r3, 0x0
/* 80291868 0028D088  41 82 00 54 */	beq .L_802918BC
/* 8029186C 0028D08C  88 16 00 40 */	lbz r0, 0x40(r22)
/* 80291870 0028D090  7C 00 C8 00 */	cmpw r0, r25
/* 80291874 0028D094  40 82 00 48 */	bne .L_802918BC
/* 80291878 0028D098  7F C3 F3 78 */	mr r3, r30
/* 8029187C 0028D09C  38 80 00 01 */	li r4, 0x1
/* 80291880 0028D0A0  48 21 9B 99 */	bl fn_804AB418
/* 80291884 0028D0A4  38 96 00 10 */	addi r4, r22, 0x10
/* 80291888 0028D0A8  38 A1 00 08 */	addi r5, r1, 0x8
/* 8029188C 0028D0AC  4B E9 7E F5 */	bl fn_80129780
/* 80291890 0028D0B0  38 61 00 08 */	addi r3, r1, 0x8
/* 80291894 0028D0B4  38 80 00 00 */	li r4, 0x0
/* 80291898 0028D0B8  4B E9 71 39 */	bl fn_801289D0
/* 8029189C 0028D0BC  38 61 00 08 */	addi r3, r1, 0x8
/* 802918A0 0028D0C0  38 80 00 00 */	li r4, 0x0
/* 802918A4 0028D0C4  4B E9 71 A9 */	bl fn_80128A4C
/* 802918A8 0028D0C8  80 78 00 08 */	lwz r3, 0x8(r24)
/* 802918AC 0028D0CC  81 83 00 00 */	lwz r12, 0x0(r3)
/* 802918B0 0028D0D0  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 802918B4 0028D0D4  7D 89 03 A6 */	mtctr r12
/* 802918B8 0028D0D8  4E 80 04 21 */	bctrl
.L_802918BC:
/* 802918BC 0028D0DC  3A F7 00 01 */	addi r23, r23, 0x1
.L_802918C0:
/* 802918C0 0028D0E0  81 9D 00 00 */	lwz r12, 0x0(r29)
/* 802918C4 0028D0E4  7F A3 EB 78 */	mr r3, r29
/* 802918C8 0028D0E8  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 802918CC 0028D0EC  7D 89 03 A6 */	mtctr r12
/* 802918D0 0028D0F0  4E 80 04 21 */	bctrl
/* 802918D4 0028D0F4  7C 17 18 00 */	cmpw r23, r3
/* 802918D8 0028D0F8  41 80 FF 3C */	blt .L_80291814
/* 802918DC 0028D0FC  83 18 00 04 */	lwz r24, 0x4(r24)
.L_802918E0:
/* 802918E0 0028D100  2C 18 00 00 */	cmpwi r24, 0x0
/* 802918E4 0028D104  40 82 FF 0C */	bne .L_802917F0
/* 802918E8 0028D108  3B 5A 00 04 */	addi r26, r26, 0x4
/* 802918EC 0028D10C  3B 39 00 01 */	addi r25, r25, 0x1
.L_802918F0:
/* 802918F0 0028D110  7C 19 F8 00 */	cmpw r25, r31
/* 802918F4 0028D114  41 80 FE CC */	blt .L_802917C0
.L_802918F8:
/* 802918F8 0028D118  BA C1 00 38 */	lmw r22, 0x38(r1)
/* 802918FC 0028D11C  80 01 00 64 */	lwz r0, 0x64(r1)
/* 80291900 0028D120  7C 08 03 A6 */	mtlr r0
/* 80291904 0028D124  38 21 00 60 */	addi r1, r1, 0x60
/* 80291908 0028D128  4E 80 00 20 */	blr
.endfn fn_80291778