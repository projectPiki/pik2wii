.include "macros.inc"
.file "auto_03_8038E48C_text"

# 0x8038E48C - 0x8038E750
.text
.balign 4

.fn fn_8038E48C, global
/* 8038E48C 00389CAC  38 63 FF E8 */	subi r3, r3, 0x18
/* 8038E490 00389CB0  4B FF E2 84 */	b fn_8038C714
.endfn fn_8038E48C

.fn fn_8038E494, global
/* 8038E494 00389CB4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038E498 00389CB8  7C 08 02 A6 */	mflr r0
/* 8038E49C 00389CBC  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038E4A0 00389CC0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038E4A4 00389CC4  7C 7F 1B 78 */	mr r31, r3
/* 8038E4A8 00389CC8  48 14 8A 45 */	bl fn_804D6EEC
/* 8038E4AC 00389CCC  3C 80 80 5C */	lis r4, lbl_805B8948@ha
/* 8038E4B0 00389CD0  38 00 00 01 */	li r0, 0x1
/* 8038E4B4 00389CD4  38 84 89 48 */	addi r4, r4, lbl_805B8948@l
/* 8038E4B8 00389CD8  90 1F 02 20 */	stw r0, 0x220(r31)
/* 8038E4BC 00389CDC  7F E3 FB 78 */	mr r3, r31
/* 8038E4C0 00389CE0  90 9F 00 00 */	stw r4, 0x0(r31)
/* 8038E4C4 00389CE4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038E4C8 00389CE8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038E4CC 00389CEC  7C 08 03 A6 */	mtlr r0
/* 8038E4D0 00389CF0  38 21 00 10 */	addi r1, r1, 0x10
/* 8038E4D4 00389CF4  4E 80 00 20 */	blr
.endfn fn_8038E494

.fn fn_8038E4D8, global
/* 8038E4D8 00389CF8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038E4DC 00389CFC  7C 08 02 A6 */	mflr r0
/* 8038E4E0 00389D00  7C 83 23 78 */	mr r3, r4
/* 8038E4E4 00389D04  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038E4E8 00389D08  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038E4EC 00389D0C  3B E0 00 00 */	li r31, 0x0
/* 8038E4F0 00389D10  81 84 00 00 */	lwz r12, 0x0(r4)
/* 8038E4F4 00389D14  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 8038E4F8 00389D18  7D 89 03 A6 */	mtctr r12
/* 8038E4FC 00389D1C  4E 80 04 21 */	bctrl
/* 8038E500 00389D20  38 03 D8 F0 */	subi r0, r3, 0x2710
/* 8038E504 00389D24  28 00 00 1B */	cmplwi r0, 0x1b
/* 8038E508 00389D28  41 81 00 20 */	bgt .L_8038E528
/* 8038E50C 00389D2C  3C 60 80 5C */	lis r3, jumptable_805B88D8@ha
/* 8038E510 00389D30  54 00 10 3A */	slwi r0, r0, 2
/* 8038E514 00389D34  38 63 88 D8 */	addi r3, r3, jumptable_805B88D8@l
/* 8038E518 00389D38  7C 63 00 2E */	lwzx r3, r3, r0
/* 8038E51C 00389D3C  7C 69 03 A6 */	mtctr r3
/* 8038E520 00389D40  4E 80 04 20 */	bctr
/* 8038E524 00389D44  3B E0 00 01 */	li r31, 0x1
.L_8038E528:
/* 8038E528 00389D48  7F E3 FB 78 */	mr r3, r31
/* 8038E52C 00389D4C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038E530 00389D50  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038E534 00389D54  7C 08 03 A6 */	mtlr r0
/* 8038E538 00389D58  38 21 00 10 */	addi r1, r1, 0x10
/* 8038E53C 00389D5C  4E 80 00 20 */	blr
.endfn fn_8038E4D8

.fn fn_8038E540, global
/* 8038E540 00389D60  38 00 00 00 */	li r0, 0x0
/* 8038E544 00389D64  98 04 00 09 */	stb r0, 0x9(r4)
/* 8038E548 00389D68  4E 80 00 20 */	blr
.endfn fn_8038E540

.fn fn_8038E54C, global
/* 8038E54C 00389D6C  4E 80 00 20 */	blr
.endfn fn_8038E54C

.fn fn_8038E550, global
/* 8038E550 00389D70  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038E554 00389D74  7C 08 02 A6 */	mflr r0
/* 8038E558 00389D78  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038E55C 00389D7C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038E560 00389D80  7C 9F 23 78 */	mr r31, r4
/* 8038E564 00389D84  93 C1 00 08 */	stw r30, 0x8(r1)
/* 8038E568 00389D88  7C 7E 1B 78 */	mr r30, r3
/* 8038E56C 00389D8C  38 60 00 D4 */	li r3, 0xd4
/* 8038E570 00389D90  4B CF A3 D9 */	bl fn_80088948
/* 8038E574 00389D94  2C 03 00 00 */	cmpwi r3, 0x0
/* 8038E578 00389D98  7C 64 1B 78 */	mr r4, r3
/* 8038E57C 00389D9C  41 82 00 18 */	beq .L_8038E594
/* 8038E580 00389DA0  3C 80 80 55 */	lis r4, lbl_805510D0@ha
/* 8038E584 00389DA4  38 84 10 D0 */	addi r4, r4, lbl_805510D0@l
/* 8038E588 00389DA8  38 84 00 15 */	addi r4, r4, 0x15
/* 8038E58C 00389DAC  4B FF E1 0D */	bl fn_8038C698
/* 8038E590 00389DB0  7C 64 1B 78 */	mr r4, r3
.L_8038E594:
/* 8038E594 00389DB4  7F C3 F3 78 */	mr r3, r30
/* 8038E598 00389DB8  7F E5 FB 78 */	mr r5, r31
/* 8038E59C 00389DBC  48 14 8E 75 */	bl fn_804D7410
/* 8038E5A0 00389DC0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038E5A4 00389DC4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038E5A8 00389DC8  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 8038E5AC 00389DCC  7C 08 03 A6 */	mtlr r0
/* 8038E5B0 00389DD0  38 21 00 10 */	addi r1, r1, 0x10
/* 8038E5B4 00389DD4  4E 80 00 20 */	blr
.endfn fn_8038E550

.fn fn_8038E5B8, global
/* 8038E5B8 00389DD8  4E 80 00 20 */	blr
.endfn fn_8038E5B8

.fn fn_8038E5BC, global
/* 8038E5BC 00389DDC  3C 60 80 5C */	lis r3, lbl_805B8998@ha
/* 8038E5C0 00389DE0  38 63 89 98 */	addi r3, r3, lbl_805B8998@l
/* 8038E5C4 00389DE4  4E 80 00 20 */	blr
.endfn fn_8038E5BC

.fn fn_8038E5C8, global
/* 8038E5C8 00389DE8  38 60 27 1C */	li r3, 0x271c
/* 8038E5CC 00389DEC  4E 80 00 20 */	blr
.endfn fn_8038E5C8

.fn fn_8038E5D0, global
/* 8038E5D0 00389DF0  3C 60 00 4F */	lis r3, 0x4f
/* 8038E5D4 00389DF4  38 63 47 41 */	addi r3, r3, 0x4741
/* 8038E5D8 00389DF8  4E 80 00 20 */	blr
.endfn fn_8038E5D0

.fn fn_8038E5DC, global
/* 8038E5DC 00389DFC  3C 80 49 54 */	lis r4, 0x4954
/* 8038E5E0 00389E00  3C 60 00 53 */	lis r3, 0x53
/* 8038E5E4 00389E04  38 84 45 4D */	addi r4, r4, 0x454d
/* 8038E5E8 00389E08  38 63 4D 5F */	addi r3, r3, 0x4d5f
/* 8038E5EC 00389E0C  4E 80 00 20 */	blr
.endfn fn_8038E5DC

.fn fn_8038E5F0, global
/* 8038E5F0 00389E10  38 60 00 01 */	li r3, 0x1
/* 8038E5F4 00389E14  4E 80 00 20 */	blr
.endfn fn_8038E5F0

.fn fn_8038E5F8, global
/* 8038E5F8 00389E18  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038E5FC 00389E1C  7C 08 02 A6 */	mflr r0
/* 8038E600 00389E20  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038E604 00389E24  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038E608 00389E28  7C 7F 1B 78 */	mr r31, r3
/* 8038E60C 00389E2C  48 14 88 E1 */	bl fn_804D6EEC
/* 8038E610 00389E30  3C 80 80 5C */	lis r4, lbl_805B8A20@ha
/* 8038E614 00389E34  38 00 00 01 */	li r0, 0x1
/* 8038E618 00389E38  38 84 8A 20 */	addi r4, r4, lbl_805B8A20@l
/* 8038E61C 00389E3C  90 1F 02 20 */	stw r0, 0x220(r31)
/* 8038E620 00389E40  7F E3 FB 78 */	mr r3, r31
/* 8038E624 00389E44  90 9F 00 00 */	stw r4, 0x0(r31)
/* 8038E628 00389E48  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038E62C 00389E4C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038E630 00389E50  7C 08 03 A6 */	mtlr r0
/* 8038E634 00389E54  38 21 00 10 */	addi r1, r1, 0x10
/* 8038E638 00389E58  4E 80 00 20 */	blr
.endfn fn_8038E5F8

.fn fn_8038E63C, global
/* 8038E63C 00389E5C  4E 80 00 20 */	blr
.endfn fn_8038E63C

.fn fn_8038E640, global
/* 8038E640 00389E60  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038E644 00389E64  7C 08 02 A6 */	mflr r0
/* 8038E648 00389E68  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038E64C 00389E6C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038E650 00389E70  7C 9F 23 78 */	mr r31, r4
/* 8038E654 00389E74  93 C1 00 08 */	stw r30, 0x8(r1)
/* 8038E658 00389E78  7C 7E 1B 78 */	mr r30, r3
/* 8038E65C 00389E7C  38 60 01 18 */	li r3, 0x118
/* 8038E660 00389E80  4B CF A2 E9 */	bl fn_80088948
/* 8038E664 00389E84  2C 03 00 00 */	cmpwi r3, 0x0
/* 8038E668 00389E88  7C 64 1B 78 */	mr r4, r3
/* 8038E66C 00389E8C  41 82 00 18 */	beq .L_8038E684
/* 8038E670 00389E90  3C 80 80 55 */	lis r4, lbl_805510F8@ha
/* 8038E674 00389E94  38 84 10 F8 */	addi r4, r4, lbl_805510F8@l
/* 8038E678 00389E98  38 84 00 16 */	addi r4, r4, 0x16
/* 8038E67C 00389E9C  48 00 02 F5 */	bl fn_8038E970
/* 8038E680 00389EA0  7C 64 1B 78 */	mr r4, r3
.L_8038E684:
/* 8038E684 00389EA4  7F C3 F3 78 */	mr r3, r30
/* 8038E688 00389EA8  7F E5 FB 78 */	mr r5, r31
/* 8038E68C 00389EAC  48 14 8D 85 */	bl fn_804D7410
/* 8038E690 00389EB0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038E694 00389EB4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038E698 00389EB8  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 8038E69C 00389EBC  7C 08 03 A6 */	mtlr r0
/* 8038E6A0 00389EC0  38 21 00 10 */	addi r1, r1, 0x10
/* 8038E6A4 00389EC4  4E 80 00 20 */	blr
.endfn fn_8038E640

.fn fn_8038E6A8, global
/* 8038E6A8 00389EC8  4E 80 00 20 */	blr
.endfn fn_8038E6A8

.fn fn_8038E6AC, global
/* 8038E6AC 00389ECC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038E6B0 00389ED0  7C 08 02 A6 */	mflr r0
/* 8038E6B4 00389ED4  7C 83 23 78 */	mr r3, r4
/* 8038E6B8 00389ED8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038E6BC 00389EDC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038E6C0 00389EE0  3B E0 00 00 */	li r31, 0x0
/* 8038E6C4 00389EE4  81 84 00 00 */	lwz r12, 0x0(r4)
/* 8038E6C8 00389EE8  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 8038E6CC 00389EEC  7D 89 03 A6 */	mtctr r12
/* 8038E6D0 00389EF0  4E 80 04 21 */	bctrl
/* 8038E6D4 00389EF4  38 03 D8 F0 */	subi r0, r3, 0x2710
/* 8038E6D8 00389EF8  28 00 00 1B */	cmplwi r0, 0x1b
/* 8038E6DC 00389EFC  41 81 00 20 */	bgt .L_8038E6FC
/* 8038E6E0 00389F00  3C 60 80 5C */	lis r3, jumptable_805B89B0@ha
/* 8038E6E4 00389F04  54 00 10 3A */	slwi r0, r0, 2
/* 8038E6E8 00389F08  38 63 89 B0 */	addi r3, r3, jumptable_805B89B0@l
/* 8038E6EC 00389F0C  7C 63 00 2E */	lwzx r3, r3, r0
/* 8038E6F0 00389F10  7C 69 03 A6 */	mtctr r3
/* 8038E6F4 00389F14  4E 80 04 20 */	bctr
/* 8038E6F8 00389F18  3B E0 00 01 */	li r31, 0x1
.L_8038E6FC:
/* 8038E6FC 00389F1C  7F E3 FB 78 */	mr r3, r31
/* 8038E700 00389F20  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038E704 00389F24  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038E708 00389F28  7C 08 03 A6 */	mtlr r0
/* 8038E70C 00389F2C  38 21 00 10 */	addi r1, r1, 0x10
/* 8038E710 00389F30  4E 80 00 20 */	blr
.endfn fn_8038E6AC

.fn fn_8038E714, global
/* 8038E714 00389F34  3C 60 80 5C */	lis r3, lbl_805B8A70@ha
/* 8038E718 00389F38  38 63 8A 70 */	addi r3, r3, lbl_805B8A70@l
/* 8038E71C 00389F3C  4E 80 00 20 */	blr
.endfn fn_8038E714

.fn fn_8038E720, global
/* 8038E720 00389F40  38 60 27 1A */	li r3, 0x271a
/* 8038E724 00389F44  4E 80 00 20 */	blr
.endfn fn_8038E720

.fn fn_8038E728, global
/* 8038E728 00389F48  3C 60 00 4F */	lis r3, 0x4f
/* 8038E72C 00389F4C  38 63 47 41 */	addi r3, r3, 0x4741
/* 8038E730 00389F50  4E 80 00 20 */	blr
.endfn fn_8038E728

.fn fn_8038E734, global
/* 8038E734 00389F54  3C 80 41 55 */	lis r4, 0x4155
/* 8038E738 00389F58  3C 60 53 4D */	lis r3, 0x534d
/* 8038E73C 00389F5C  38 84 53 45 */	addi r4, r4, 0x5345
/* 8038E740 00389F60  38 63 5F 50 */	addi r3, r3, 0x5f50
/* 8038E744 00389F64  4E 80 00 20 */	blr
.endfn fn_8038E734

.fn fn_8038E748, global
/* 8038E748 00389F68  38 60 00 01 */	li r3, 0x1
/* 8038E74C 00389F6C  4E 80 00 20 */	blr
.endfn fn_8038E748