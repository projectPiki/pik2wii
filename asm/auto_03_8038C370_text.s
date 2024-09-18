.include "macros.inc"
.file "auto_03_8038C370_text"

# 0x8038C370 - 0x8038C66C
.text
.balign 4

.fn fn_8038C370, global
/* 8038C370 00387B90  38 63 FF E8 */	subi r3, r3, 0x18
/* 8038C374 00387B94  4B FF C4 A4 */	b fn_80388818
.endfn fn_8038C370

.fn fn_8038C378, global
/* 8038C378 00387B98  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038C37C 00387B9C  7C 08 02 A6 */	mflr r0
/* 8038C380 00387BA0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038C384 00387BA4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038C388 00387BA8  7C 7F 1B 78 */	mr r31, r3
/* 8038C38C 00387BAC  48 14 AB 61 */	bl fn_804D6EEC
/* 8038C390 00387BB0  3C 80 80 5C */	lis r4, lbl_805B8798@ha
/* 8038C394 00387BB4  38 00 00 01 */	li r0, 0x1
/* 8038C398 00387BB8  38 84 87 98 */	addi r4, r4, lbl_805B8798@l
/* 8038C39C 00387BBC  90 1F 02 20 */	stw r0, 0x220(r31)
/* 8038C3A0 00387BC0  7F E3 FB 78 */	mr r3, r31
/* 8038C3A4 00387BC4  90 9F 00 00 */	stw r4, 0x0(r31)
/* 8038C3A8 00387BC8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038C3AC 00387BCC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038C3B0 00387BD0  7C 08 03 A6 */	mtlr r0
/* 8038C3B4 00387BD4  38 21 00 10 */	addi r1, r1, 0x10
/* 8038C3B8 00387BD8  4E 80 00 20 */	blr
.endfn fn_8038C378

.fn fn_8038C3BC, global
/* 8038C3BC 00387BDC  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8038C3C0 00387BE0  7C 08 02 A6 */	mflr r0
/* 8038C3C4 00387BE4  3C 80 00 4F */	lis r4, 0x4f
/* 8038C3C8 00387BE8  3C A0 5F 41 */	lis r5, 0x5f41
/* 8038C3CC 00387BEC  90 01 00 54 */	stw r0, 0x54(r1)
/* 8038C3D0 00387BF0  38 C5 4C 4C */	addi r6, r5, 0x4c4c
/* 8038C3D4 00387BF4  38 84 47 41 */	addi r4, r4, 0x4741
/* 8038C3D8 00387BF8  38 A0 53 4D */	li r5, 0x534d
/* 8038C3DC 00387BFC  93 E1 00 4C */	stw r31, 0x4c(r1)
/* 8038C3E0 00387C00  93 C1 00 48 */	stw r30, 0x48(r1)
/* 8038C3E4 00387C04  3B C0 00 00 */	li r30, 0x0
/* 8038C3E8 00387C08  93 A1 00 44 */	stw r29, 0x44(r1)
/* 8038C3EC 00387C0C  7C 7D 1B 78 */	mr r29, r3
/* 8038C3F0 00387C10  83 E3 02 1C */	lwz r31, 0x21c(r3)
/* 8038C3F4 00387C14  7F E3 FB 78 */	mr r3, r31
/* 8038C3F8 00387C18  4B FF BE E5 */	bl fn_803882DC
/* 8038C3FC 00387C1C  2C 03 00 00 */	cmpwi r3, 0x0
/* 8038C400 00387C20  41 82 00 0C */	beq .L_8038C40C
/* 8038C404 00387C24  83 DF 00 98 */	lwz r30, 0x98(r31)
/* 8038C408 00387C28  48 00 00 20 */	b .L_8038C428
.L_8038C40C:
/* 8038C40C 00387C2C  3C 60 80 55 */	lis r3, lbl_80550E50@ha
/* 8038C410 00387C30  38 80 00 46 */	li r4, 0x46
/* 8038C414 00387C34  38 63 0E 50 */	addi r3, r3, lbl_80550E50@l
/* 8038C418 00387C38  38 C0 00 00 */	li r6, 0x0
/* 8038C41C 00387C3C  38 A3 00 14 */	addi r5, r3, 0x14
/* 8038C420 00387C40  4C C6 31 82 */	crclr cr1eq
/* 8038C424 00387C44  4B D0 28 DD */	bl fn_8008ED00
.L_8038C428:
/* 8038C428 00387C48  2C 1E 00 02 */	cmpwi r30, 0x2
/* 8038C42C 00387C4C  41 82 00 44 */	beq .L_8038C470
/* 8038C430 00387C50  40 80 00 14 */	bge .L_8038C444
/* 8038C434 00387C54  2C 1E 00 00 */	cmpwi r30, 0x0
/* 8038C438 00387C58  41 82 00 18 */	beq .L_8038C450
/* 8038C43C 00387C5C  40 80 00 24 */	bge .L_8038C460
/* 8038C440 00387C60  48 00 00 50 */	b .L_8038C490
.L_8038C444:
/* 8038C444 00387C64  2C 1E 00 04 */	cmpwi r30, 0x4
/* 8038C448 00387C68  40 80 00 48 */	bge .L_8038C490
/* 8038C44C 00387C6C  48 00 00 34 */	b .L_8038C480
.L_8038C450:
/* 8038C450 00387C70  3C 60 80 55 */	lis r3, lbl_80550E50@ha
/* 8038C454 00387C74  38 63 0E 50 */	addi r3, r3, lbl_80550E50@l
/* 8038C458 00387C78  38 A3 00 2A */	addi r5, r3, 0x2a
/* 8038C45C 00387C7C  48 00 00 40 */	b .L_8038C49C
.L_8038C460:
/* 8038C460 00387C80  3C 60 80 55 */	lis r3, lbl_80550E50@ha
/* 8038C464 00387C84  38 63 0E 50 */	addi r3, r3, lbl_80550E50@l
/* 8038C468 00387C88  38 A3 00 54 */	addi r5, r3, 0x54
/* 8038C46C 00387C8C  48 00 00 30 */	b .L_8038C49C
.L_8038C470:
/* 8038C470 00387C90  3C 60 80 55 */	lis r3, lbl_80550E50@ha
/* 8038C474 00387C94  38 63 0E 50 */	addi r3, r3, lbl_80550E50@l
/* 8038C478 00387C98  38 A3 00 7C */	addi r5, r3, 0x7c
/* 8038C47C 00387C9C  48 00 00 20 */	b .L_8038C49C
.L_8038C480:
/* 8038C480 00387CA0  3C 60 80 55 */	lis r3, lbl_80550E50@ha
/* 8038C484 00387CA4  38 63 0E 50 */	addi r3, r3, lbl_80550E50@l
/* 8038C488 00387CA8  38 A3 00 A7 */	addi r5, r3, 0xa7
/* 8038C48C 00387CAC  48 00 00 10 */	b .L_8038C49C
.L_8038C490:
/* 8038C490 00387CB0  3C 60 80 55 */	lis r3, lbl_80550E50@ha
/* 8038C494 00387CB4  38 63 0E 50 */	addi r3, r3, lbl_80550E50@l
/* 8038C498 00387CB8  38 A3 00 2A */	addi r5, r3, 0x2a
.L_8038C49C:
/* 8038C49C 00387CBC  3F E0 80 55 */	lis r31, lbl_80550E50@ha
/* 8038C4A0 00387CC0  38 7D 00 04 */	addi r3, r29, 0x4
/* 8038C4A4 00387CC4  3B FF 0E 50 */	addi r31, r31, lbl_80550E50@l
/* 8038C4A8 00387CC8  38 9F 00 CD */	addi r4, r31, 0xcd
/* 8038C4AC 00387CCC  4C C6 31 82 */	crclr cr1eq
/* 8038C4B0 00387CD0  4B D7 D8 45 */	bl sprintf
/* 8038C4B4 00387CD4  38 61 00 08 */	addi r3, r1, 0x8
/* 8038C4B8 00387CD8  38 9D 00 04 */	addi r4, r29, 0x4
/* 8038C4BC 00387CDC  48 14 53 D5 */	bl fn_804D1890
/* 8038C4C0 00387CE0  80 6D AA F0 */	lwz r3, lbl_8066D2F0@sda21(r0)
/* 8038C4C4 00387CE4  38 81 00 08 */	addi r4, r1, 0x8
/* 8038C4C8 00387CE8  48 14 55 AD */	bl fn_804D1A74
/* 8038C4CC 00387CEC  2C 03 00 00 */	cmpwi r3, 0x0
/* 8038C4D0 00387CF0  41 82 00 28 */	beq .L_8038C4F8
/* 8038C4D4 00387CF4  80 03 00 34 */	lwz r0, 0x34(r3)
/* 8038C4D8 00387CF8  2C 00 00 00 */	cmpwi r0, 0x0
/* 8038C4DC 00387CFC  40 82 00 30 */	bne .L_8038C50C
/* 8038C4E0 00387D00  7F E3 FB 78 */	mr r3, r31
/* 8038C4E4 00387D04  38 BF 00 D0 */	addi r5, r31, 0xd0
/* 8038C4E8 00387D08  38 80 00 61 */	li r4, 0x61
/* 8038C4EC 00387D0C  4C C6 31 82 */	crclr cr1eq
/* 8038C4F0 00387D10  4B D0 28 11 */	bl fn_8008ED00
/* 8038C4F4 00387D14  48 00 00 18 */	b .L_8038C50C
.L_8038C4F8:
/* 8038C4F8 00387D18  7F E3 FB 78 */	mr r3, r31
/* 8038C4FC 00387D1C  38 BF 00 DF */	addi r5, r31, 0xdf
/* 8038C500 00387D20  38 80 00 66 */	li r4, 0x66
/* 8038C504 00387D24  4C C6 31 82 */	crclr cr1eq
/* 8038C508 00387D28  4B D0 27 F9 */	bl fn_8008ED00
.L_8038C50C:
/* 8038C50C 00387D2C  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8038C510 00387D30  83 E1 00 4C */	lwz r31, 0x4c(r1)
/* 8038C514 00387D34  83 C1 00 48 */	lwz r30, 0x48(r1)
/* 8038C518 00387D38  83 A1 00 44 */	lwz r29, 0x44(r1)
/* 8038C51C 00387D3C  7C 08 03 A6 */	mtlr r0
/* 8038C520 00387D40  38 21 00 50 */	addi r1, r1, 0x50
/* 8038C524 00387D44  4E 80 00 20 */	blr
.endfn fn_8038C3BC

.fn fn_8038C528, global
/* 8038C528 00387D48  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038C52C 00387D4C  7C 08 02 A6 */	mflr r0
/* 8038C530 00387D50  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038C534 00387D54  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038C538 00387D58  7C 9F 23 78 */	mr r31, r4
/* 8038C53C 00387D5C  93 C1 00 08 */	stw r30, 0x8(r1)
/* 8038C540 00387D60  7C 7E 1B 78 */	mr r30, r3
/* 8038C544 00387D64  38 60 01 58 */	li r3, 0x158
/* 8038C548 00387D68  4B CF C4 01 */	bl fn_80088948
/* 8038C54C 00387D6C  2C 03 00 00 */	cmpwi r3, 0x0
/* 8038C550 00387D70  7C 64 1B 78 */	mr r4, r3
/* 8038C554 00387D74  41 82 00 18 */	beq .L_8038C56C
/* 8038C558 00387D78  3C 80 80 55 */	lis r4, lbl_80550E50@ha
/* 8038C55C 00387D7C  38 84 0E 50 */	addi r4, r4, lbl_80550E50@l
/* 8038C560 00387D80  38 84 00 EF */	addi r4, r4, 0xef
/* 8038C564 00387D84  4B FF C1 19 */	bl fn_8038867C
/* 8038C568 00387D88  7C 64 1B 78 */	mr r4, r3
.L_8038C56C:
/* 8038C56C 00387D8C  7F C3 F3 78 */	mr r3, r30
/* 8038C570 00387D90  7F E5 FB 78 */	mr r5, r31
/* 8038C574 00387D94  48 14 AE 9D */	bl fn_804D7410
/* 8038C578 00387D98  3C A0 80 67 */	lis r5, lbl_80669BC0@ha
/* 8038C57C 00387D9C  7F C3 F3 78 */	mr r3, r30
/* 8038C580 00387DA0  38 A5 9B C0 */	addi r5, r5, lbl_80669BC0@l
/* 8038C584 00387DA4  38 80 00 00 */	li r4, 0x0
/* 8038C588 00387DA8  88 E5 00 1B */	lbz r7, 0x1b(r5)
/* 8038C58C 00387DAC  38 A0 00 00 */	li r5, 0x0
/* 8038C590 00387DB0  38 C0 00 00 */	li r6, 0x0
/* 8038C594 00387DB4  48 14 B3 11 */	bl fn_804D78A4
/* 8038C598 00387DB8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038C59C 00387DBC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038C5A0 00387DC0  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 8038C5A4 00387DC4  7C 08 03 A6 */	mtlr r0
/* 8038C5A8 00387DC8  38 21 00 10 */	addi r1, r1, 0x10
/* 8038C5AC 00387DCC  4E 80 00 20 */	blr
.endfn fn_8038C528

.fn fn_8038C5B0, global
/* 8038C5B0 00387DD0  4E 80 00 20 */	blr
.endfn fn_8038C5B0

.fn fn_8038C5B4, global
/* 8038C5B4 00387DD4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038C5B8 00387DD8  7C 08 02 A6 */	mflr r0
/* 8038C5BC 00387DDC  7C 83 23 78 */	mr r3, r4
/* 8038C5C0 00387DE0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038C5C4 00387DE4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038C5C8 00387DE8  3B E0 00 00 */	li r31, 0x0
/* 8038C5CC 00387DEC  81 84 00 00 */	lwz r12, 0x0(r4)
/* 8038C5D0 00387DF0  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 8038C5D4 00387DF4  7D 89 03 A6 */	mtctr r12
/* 8038C5D8 00387DF8  4E 80 04 21 */	bctrl
/* 8038C5DC 00387DFC  38 03 D8 F0 */	subi r0, r3, 0x2710
/* 8038C5E0 00387E00  28 00 00 1B */	cmplwi r0, 0x1b
/* 8038C5E4 00387E04  41 81 00 20 */	bgt .L_8038C604
/* 8038C5E8 00387E08  3C 60 80 5C */	lis r3, jumptable_805B8728@ha
/* 8038C5EC 00387E0C  54 00 10 3A */	slwi r0, r0, 2
/* 8038C5F0 00387E10  38 63 87 28 */	addi r3, r3, jumptable_805B8728@l
/* 8038C5F4 00387E14  7C 63 00 2E */	lwzx r3, r3, r0
/* 8038C5F8 00387E18  7C 69 03 A6 */	mtctr r3
/* 8038C5FC 00387E1C  4E 80 04 20 */	bctr
/* 8038C600 00387E20  3B E0 00 01 */	li r31, 0x1
.L_8038C604:
/* 8038C604 00387E24  7F E3 FB 78 */	mr r3, r31
/* 8038C608 00387E28  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038C60C 00387E2C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038C610 00387E30  7C 08 03 A6 */	mtlr r0
/* 8038C614 00387E34  38 21 00 10 */	addi r1, r1, 0x10
/* 8038C618 00387E38  4E 80 00 20 */	blr
.endfn fn_8038C5B4

.fn fn_8038C61C, global
/* 8038C61C 00387E3C  38 00 00 00 */	li r0, 0x0
/* 8038C620 00387E40  98 04 00 09 */	stb r0, 0x9(r4)
/* 8038C624 00387E44  4E 80 00 20 */	blr
.endfn fn_8038C61C

.fn fn_8038C628, global
/* 8038C628 00387E48  4E 80 00 20 */	blr
.endfn fn_8038C628

.fn fn_8038C62C, global
/* 8038C62C 00387E4C  3C 60 80 5C */	lis r3, lbl_805B87E8@ha
/* 8038C630 00387E50  38 63 87 E8 */	addi r3, r3, lbl_805B87E8@l
/* 8038C634 00387E54  4E 80 00 20 */	blr
.endfn fn_8038C62C

.fn fn_8038C638, global
/* 8038C638 00387E58  38 60 27 1D */	li r3, 0x271d
/* 8038C63C 00387E5C  4E 80 00 20 */	blr
.endfn fn_8038C638

.fn fn_8038C640, global
/* 8038C640 00387E60  3C 60 00 4F */	lis r3, 0x4f
/* 8038C644 00387E64  38 63 47 41 */	addi r3, r3, 0x4741
/* 8038C648 00387E68  4E 80 00 20 */	blr
.endfn fn_8038C640

.fn fn_8038C64C, global
/* 8038C64C 00387E6C  3C 80 5F 4D */	lis r4, 0x5f4d
/* 8038C650 00387E70  38 60 53 4D */	li r3, 0x534d
/* 8038C654 00387E74  38 84 41 50 */	addi r4, r4, 0x4150
/* 8038C658 00387E78  4E 80 00 20 */	blr
.endfn fn_8038C64C

.fn fn_8038C65C, global
/* 8038C65C 00387E7C  38 60 00 01 */	li r3, 0x1
/* 8038C660 00387E80  4E 80 00 20 */	blr
.endfn fn_8038C65C

.fn fn_8038C664, global
/* 8038C664 00387E84  80 63 02 20 */	lwz r3, 0x220(r3)
/* 8038C668 00387E88  4E 80 00 20 */	blr
.endfn fn_8038C664