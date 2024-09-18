.include "macros.inc"
.file "auto_double2hex_text"

# 0x800065F0 - 0x800065F8
.section extab, "a"
.balign 4

.obj "@etb_800065F0", local
.hidden "@etb_800065F0"
	.4byte 0x204A0000
	.4byte 0x00000000
.endobj "@etb_800065F0"

# 0x80006A88 - 0x80006A94
.section extabindex, "a"
.balign 4

.obj "@eti_80006A88", local
.hidden "@eti_80006A88"
	.4byte double2hex_801084C0
	.4byte 0x000003C8
	.4byte "@etb_800065F0"
.endobj "@eti_80006A88"

# 0x801084C0 - 0x80108888
.text
.balign 4

.fn double2hex_801084C0, global
/* 801084C0 00103CE0  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 801084C4 00103CE4  7C 08 02 A6 */	mflr r0
/* 801084C8 00103CE8  90 01 00 94 */	stw r0, 0x94(r1)
/* 801084CC 00103CEC  DB E1 00 80 */	stfd f31, 0x80(r1)
/* 801084D0 00103CF0  F3 E1 00 88 */	psq_st f31, 0x88(r1), 0, qr0
/* 801084D4 00103CF4  3C A0 80 57 */	lis r5, lbl_8056BFE0@ha
/* 801084D8 00103CF8  80 04 00 0C */	lwz r0, 0xc(r4)
/* 801084DC 00103CFC  FF E0 08 90 */	fmr f31, f1
/* 801084E0 00103D00  93 E1 00 7C */	stw r31, 0x7c(r1)
/* 801084E4 00103D04  2C 00 01 FD */	cmpwi r0, 0x1fd
/* 801084E8 00103D08  93 C1 00 78 */	stw r30, 0x78(r1)
/* 801084EC 00103D0C  7C 9E 23 78 */	mr r30, r4
/* 801084F0 00103D10  93 A1 00 74 */	stw r29, 0x74(r1)
/* 801084F4 00103D14  93 81 00 70 */	stw r28, 0x70(r1)
/* 801084F8 00103D18  7C 7C 1B 78 */	mr r28, r3
/* 801084FC 00103D1C  80 A5 BF E0 */	lwz r5, lbl_8056BFE0@l(r5)
/* 80108500 00103D20  D8 21 00 08 */	stfd f1, 0x8(r1)
/* 80108504 00103D24  8B E5 00 00 */	lbz r31, 0x0(r5)
/* 80108508 00103D28  40 81 00 0C */	ble .L_80108514
/* 8010850C 00103D2C  38 60 00 00 */	li r3, 0x0
/* 80108510 00103D30  48 00 03 50 */	b .L_80108860
.L_80108514:
/* 80108514 00103D34  3B A0 00 00 */	li r29, 0x0
/* 80108518 00103D38  38 00 00 20 */	li r0, 0x20
/* 8010851C 00103D3C  9B A1 00 10 */	stb r29, 0x10(r1)
/* 80108520 00103D40  38 61 00 10 */	addi r3, r1, 0x10
/* 80108524 00103D44  38 81 00 38 */	addi r4, r1, 0x38
/* 80108528 00103D48  B0 01 00 12 */	sth r0, 0x12(r1)
/* 8010852C 00103D4C  4B FF DC 11 */	bl fn_8010613C
/* 80108530 00103D50  FC 20 FA 10 */	fabs f1, f31
/* 80108534 00103D54  C8 02 90 18 */	lfd f0, lbl_8066E4F8@sda21(r0)
/* 80108538 00103D58  FC 00 08 00 */	fcmpu cr0, f0, f1
/* 8010853C 00103D5C  40 82 00 20 */	bne .L_8010855C
/* 80108540 00103D60  3B BC FF FA */	subi r29, r28, 0x6
/* 80108544 00103D64  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 80108548 00103D68  7F A3 EB 78 */	mr r3, r29
/* 8010854C 00103D6C  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 80108550 00103D70  48 00 2E 09 */	bl strcpy
/* 80108554 00103D74  7F A3 EB 78 */	mr r3, r29
/* 80108558 00103D78  48 00 03 08 */	b .L_80108860
.L_8010855C:
/* 8010855C 00103D7C  88 01 00 3D */	lbz r0, 0x3d(r1)
/* 80108560 00103D80  28 00 00 49 */	cmplwi r0, 0x49
/* 80108564 00103D84  40 82 00 94 */	bne .L_801085F8
/* 80108568 00103D88  88 01 00 38 */	lbz r0, 0x38(r1)
/* 8010856C 00103D8C  7C 00 07 75 */	extsb. r0, r0
/* 80108570 00103D90  41 82 00 44 */	beq .L_801085B4
/* 80108574 00103D94  88 1E 00 05 */	lbz r0, 0x5(r30)
/* 80108578 00103D98  3B BC FF FB */	subi r29, r28, 0x5
/* 8010857C 00103D9C  28 00 00 41 */	cmplwi r0, 0x41
/* 80108580 00103DA0  40 82 00 1C */	bne .L_8010859C
/* 80108584 00103DA4  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 80108588 00103DA8  7F A3 EB 78 */	mr r3, r29
/* 8010858C 00103DAC  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 80108590 00103DB0  38 84 00 06 */	addi r4, r4, 0x6
/* 80108594 00103DB4  48 00 2D C5 */	bl strcpy
/* 80108598 00103DB8  48 00 00 58 */	b .L_801085F0
.L_8010859C:
/* 8010859C 00103DBC  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 801085A0 00103DC0  7F A3 EB 78 */	mr r3, r29
/* 801085A4 00103DC4  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 801085A8 00103DC8  38 84 00 0B */	addi r4, r4, 0xb
/* 801085AC 00103DCC  48 00 2D AD */	bl strcpy
/* 801085B0 00103DD0  48 00 00 40 */	b .L_801085F0
.L_801085B4:
/* 801085B4 00103DD4  88 1E 00 05 */	lbz r0, 0x5(r30)
/* 801085B8 00103DD8  3B BC FF FC */	subi r29, r28, 0x4
/* 801085BC 00103DDC  28 00 00 41 */	cmplwi r0, 0x41
/* 801085C0 00103DE0  40 82 00 1C */	bne .L_801085DC
/* 801085C4 00103DE4  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 801085C8 00103DE8  7F A3 EB 78 */	mr r3, r29
/* 801085CC 00103DEC  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 801085D0 00103DF0  38 84 00 10 */	addi r4, r4, 0x10
/* 801085D4 00103DF4  48 00 2D 85 */	bl strcpy
/* 801085D8 00103DF8  48 00 00 18 */	b .L_801085F0
.L_801085DC:
/* 801085DC 00103DFC  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 801085E0 00103E00  7F A3 EB 78 */	mr r3, r29
/* 801085E4 00103E04  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 801085E8 00103E08  38 84 00 14 */	addi r4, r4, 0x14
/* 801085EC 00103E0C  48 00 2D 6D */	bl strcpy
.L_801085F0:
/* 801085F0 00103E10  7F A3 EB 78 */	mr r3, r29
/* 801085F4 00103E14  48 00 02 6C */	b .L_80108860
.L_801085F8:
/* 801085F8 00103E18  28 00 00 4E */	cmplwi r0, 0x4e
/* 801085FC 00103E1C  40 82 00 94 */	bne .L_80108690
/* 80108600 00103E20  88 01 00 38 */	lbz r0, 0x38(r1)
/* 80108604 00103E24  7C 00 07 75 */	extsb. r0, r0
/* 80108608 00103E28  41 82 00 44 */	beq .L_8010864C
/* 8010860C 00103E2C  88 1E 00 05 */	lbz r0, 0x5(r30)
/* 80108610 00103E30  3B BC FF FB */	subi r29, r28, 0x5
/* 80108614 00103E34  28 00 00 41 */	cmplwi r0, 0x41
/* 80108618 00103E38  40 82 00 1C */	bne .L_80108634
/* 8010861C 00103E3C  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 80108620 00103E40  7F A3 EB 78 */	mr r3, r29
/* 80108624 00103E44  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 80108628 00103E48  38 84 00 18 */	addi r4, r4, 0x18
/* 8010862C 00103E4C  48 00 2D 2D */	bl strcpy
/* 80108630 00103E50  48 00 00 58 */	b .L_80108688
.L_80108634:
/* 80108634 00103E54  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 80108638 00103E58  7F A3 EB 78 */	mr r3, r29
/* 8010863C 00103E5C  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 80108640 00103E60  38 84 00 1D */	addi r4, r4, 0x1d
/* 80108644 00103E64  48 00 2D 15 */	bl strcpy
/* 80108648 00103E68  48 00 00 40 */	b .L_80108688
.L_8010864C:
/* 8010864C 00103E6C  88 1E 00 05 */	lbz r0, 0x5(r30)
/* 80108650 00103E70  3B BC FF FC */	subi r29, r28, 0x4
/* 80108654 00103E74  28 00 00 41 */	cmplwi r0, 0x41
/* 80108658 00103E78  40 82 00 1C */	bne .L_80108674
/* 8010865C 00103E7C  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 80108660 00103E80  7F A3 EB 78 */	mr r3, r29
/* 80108664 00103E84  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 80108668 00103E88  38 84 00 22 */	addi r4, r4, 0x22
/* 8010866C 00103E8C  48 00 2C ED */	bl strcpy
/* 80108670 00103E90  48 00 00 18 */	b .L_80108688
.L_80108674:
/* 80108674 00103E94  3C 80 80 54 */	lis r4, "@stringBase0_8053F8B0"@ha
/* 80108678 00103E98  7F A3 EB 78 */	mr r3, r29
/* 8010867C 00103E9C  38 84 F8 B0 */	addi r4, r4, "@stringBase0_8053F8B0"@l
/* 80108680 00103EA0  38 84 00 26 */	addi r4, r4, 0x26
/* 80108684 00103EA4  48 00 2C D5 */	bl strcpy
.L_80108688:
/* 80108688 00103EA8  7F A3 EB 78 */	mr r3, r29
/* 8010868C 00103EAC  48 00 01 D4 */	b .L_80108860
.L_80108690:
/* 80108690 00103EB0  39 00 00 01 */	li r8, 0x1
/* 80108694 00103EB4  38 E0 00 64 */	li r7, 0x64
/* 80108698 00103EB8  88 01 00 09 */	lbz r0, 0x9(r1)
/* 8010869C 00103EBC  7F 84 E3 78 */	mr r4, r28
/* 801086A0 00103EC0  88 61 00 08 */	lbz r3, 0x8(r1)
/* 801086A4 00103EC4  38 A1 00 18 */	addi r5, r1, 0x18
/* 801086A8 00103EC8  54 00 88 1C */	slwi r0, r0, 17
/* 801086AC 00103ECC  99 01 00 28 */	stb r8, 0x28(r1)
/* 801086B0 00103ED0  50 60 C8 0C */	rlwimi r0, r3, 25, 0, 6
/* 801086B4 00103ED4  54 03 5D 7E */	srwi r3, r0, 21
/* 801086B8 00103ED8  99 01 00 29 */	stb r8, 0x29(r1)
/* 801086BC 00103EDC  38 63 FC 01 */	subi r3, r3, 0x3ff
/* 801086C0 00103EE0  9B A1 00 2A */	stb r29, 0x2a(r1)
/* 801086C4 00103EE4  9B A1 00 2B */	stb r29, 0x2b(r1)
/* 801086C8 00103EE8  80 C1 00 28 */	lwz r6, 0x28(r1)
/* 801086CC 00103EEC  9B A1 00 2C */	stb r29, 0x2c(r1)
/* 801086D0 00103EF0  98 E1 00 2D */	stb r7, 0x2d(r1)
/* 801086D4 00103EF4  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 801086D8 00103EF8  93 A1 00 30 */	stw r29, 0x30(r1)
/* 801086DC 00103EFC  91 01 00 34 */	stw r8, 0x34(r1)
/* 801086E0 00103F00  90 C1 00 18 */	stw r6, 0x18(r1)
/* 801086E4 00103F04  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801086E8 00103F08  93 A1 00 20 */	stw r29, 0x20(r1)
/* 801086EC 00103F0C  91 01 00 24 */	stw r8, 0x24(r1)
/* 801086F0 00103F10  4B FF F9 09 */	bl long2str_80107FF8
/* 801086F4 00103F14  88 1E 00 05 */	lbz r0, 0x5(r30)
/* 801086F8 00103F18  28 00 00 61 */	cmplwi r0, 0x61
/* 801086FC 00103F1C  40 82 00 14 */	bne .L_80108710
/* 80108700 00103F20  38 00 00 70 */	li r0, 0x70
/* 80108704 00103F24  38 83 FF FF */	subi r4, r3, 0x1
/* 80108708 00103F28  98 03 FF FF */	stb r0, -0x1(r3)
/* 8010870C 00103F2C  48 00 00 10 */	b .L_8010871C
.L_80108710:
/* 80108710 00103F30  38 00 00 50 */	li r0, 0x50
/* 80108714 00103F34  38 83 FF FF */	subi r4, r3, 0x1
/* 80108718 00103F38  98 03 FF FF */	stb r0, -0x1(r3)
.L_8010871C:
/* 8010871C 00103F3C  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 80108720 00103F40  39 01 00 08 */	addi r8, r1, 0x8
/* 80108724 00103F44  54 03 10 3A */	slwi r3, r0, 2
/* 80108728 00103F48  39 23 00 0B */	addi r9, r3, 0xb
/* 8010872C 00103F4C  7C 09 03 A6 */	mtctr r0
/* 80108730 00103F50  2C 00 00 01 */	cmpwi r0, 0x1
/* 80108734 00103F54  41 80 00 9C */	blt .L_801087D0
.L_80108738:
/* 80108738 00103F58  2C 09 00 40 */	cmpwi r9, 0x40
/* 8010873C 00103F5C  40 80 00 84 */	bge .L_801087C0
/* 80108740 00103F60  7D 23 1E 70 */	srawi r3, r9, 3
/* 80108744 00103F64  38 09 FF FC */	subi r0, r9, 0x4
/* 80108748 00103F68  7C E8 1A 14 */	add r7, r8, r3
/* 8010874C 00103F6C  55 26 07 7E */	clrlwi r6, r9, 29
/* 80108750 00103F70  55 23 00 38 */	clrrwi r3, r9, 3
/* 80108754 00103F74  54 00 00 38 */	clrrwi r0, r0, 3
/* 80108758 00103F78  88 A7 00 00 */	lbz r5, 0x0(r7)
/* 8010875C 00103F7C  20 C6 00 07 */	subfic r6, r6, 0x7
/* 80108760 00103F80  7C 03 00 00 */	cmpw r3, r0
/* 80108764 00103F84  7C A0 36 30 */	sraw r0, r5, r6
/* 80108768 00103F88  54 03 06 3E */	clrlwi r3, r0, 24
/* 8010876C 00103F8C  41 82 00 18 */	beq .L_80108784
/* 80108770 00103F90  88 07 FF FF */	lbz r0, -0x1(r7)
/* 80108774 00103F94  54 00 40 2E */	slwi r0, r0, 8
/* 80108778 00103F98  7C 00 36 30 */	sraw r0, r0, r6
/* 8010877C 00103F9C  7C 60 03 78 */	or r0, r3, r0
/* 80108780 00103FA0  54 03 06 3E */	clrlwi r3, r0, 24
.L_80108784:
/* 80108784 00103FA4  54 63 07 3E */	clrlwi r3, r3, 28
/* 80108788 00103FA8  28 03 00 0A */	cmplwi r3, 0xa
/* 8010878C 00103FAC  40 80 00 10 */	bge .L_8010879C
/* 80108790 00103FB0  38 03 00 30 */	addi r0, r3, 0x30
/* 80108794 00103FB4  54 03 06 3E */	clrlwi r3, r0, 24
/* 80108798 00103FB8  48 00 00 2C */	b .L_801087C4
.L_8010879C:
/* 8010879C 00103FBC  88 1E 00 05 */	lbz r0, 0x5(r30)
/* 801087A0 00103FC0  28 00 00 61 */	cmplwi r0, 0x61
/* 801087A4 00103FC4  40 82 00 10 */	bne .L_801087B4
/* 801087A8 00103FC8  38 03 00 57 */	addi r0, r3, 0x57
/* 801087AC 00103FCC  54 03 06 3E */	clrlwi r3, r0, 24
/* 801087B0 00103FD0  48 00 00 14 */	b .L_801087C4
.L_801087B4:
/* 801087B4 00103FD4  38 03 00 37 */	addi r0, r3, 0x37
/* 801087B8 00103FD8  54 03 06 3E */	clrlwi r3, r0, 24
/* 801087BC 00103FDC  48 00 00 08 */	b .L_801087C4
.L_801087C0:
/* 801087C0 00103FE0  38 60 00 30 */	li r3, 0x30
.L_801087C4:
/* 801087C4 00103FE4  9C 64 FF FF */	stbu r3, -0x1(r4)
/* 801087C8 00103FE8  39 29 FF FC */	subi r9, r9, 0x4
/* 801087CC 00103FEC  42 00 FF 6C */	bdnz .L_80108738
.L_801087D0:
/* 801087D0 00103FF0  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 801087D4 00103FF4  2C 00 00 00 */	cmpwi r0, 0x0
/* 801087D8 00103FF8  40 82 00 10 */	bne .L_801087E8
/* 801087DC 00103FFC  88 1E 00 03 */	lbz r0, 0x3(r30)
/* 801087E0 00104000  2C 00 00 00 */	cmpwi r0, 0x0
/* 801087E4 00104004  41 82 00 08 */	beq .L_801087EC
.L_801087E8:
/* 801087E8 00104008  9F E4 FF FF */	stbu r31, -0x1(r4)
.L_801087EC:
/* 801087EC 0010400C  88 1E 00 05 */	lbz r0, 0x5(r30)
/* 801087F0 00104010  38 60 00 31 */	li r3, 0x31
/* 801087F4 00104014  98 64 FF FF */	stb r3, -0x1(r4)
/* 801087F8 00104018  28 00 00 61 */	cmplwi r0, 0x61
/* 801087FC 0010401C  40 82 00 10 */	bne .L_8010880C
/* 80108800 00104020  38 00 00 78 */	li r0, 0x78
/* 80108804 00104024  9C 04 FF FE */	stbu r0, -0x2(r4)
/* 80108808 00104028  48 00 00 0C */	b .L_80108814
.L_8010880C:
/* 8010880C 0010402C  38 00 00 58 */	li r0, 0x58
/* 80108810 00104030  9C 04 FF FE */	stbu r0, -0x2(r4)
.L_80108814:
/* 80108814 00104034  38 00 00 30 */	li r0, 0x30
/* 80108818 00104038  9C 04 FF FF */	stbu r0, -0x1(r4)
/* 8010881C 0010403C  88 01 00 38 */	lbz r0, 0x38(r1)
/* 80108820 00104040  7C 00 07 75 */	extsb. r0, r0
/* 80108824 00104044  41 82 00 10 */	beq .L_80108834
/* 80108828 00104048  38 00 00 2D */	li r0, 0x2d
/* 8010882C 0010404C  9C 04 FF FF */	stbu r0, -0x1(r4)
/* 80108830 00104050  48 00 00 2C */	b .L_8010885C
.L_80108834:
/* 80108834 00104054  88 1E 00 01 */	lbz r0, 0x1(r30)
/* 80108838 00104058  28 00 00 01 */	cmplwi r0, 0x1
/* 8010883C 0010405C  40 82 00 10 */	bne .L_8010884C
/* 80108840 00104060  38 00 00 2B */	li r0, 0x2b
/* 80108844 00104064  9C 04 FF FF */	stbu r0, -0x1(r4)
/* 80108848 00104068  48 00 00 14 */	b .L_8010885C
.L_8010884C:
/* 8010884C 0010406C  28 00 00 02 */	cmplwi r0, 0x2
/* 80108850 00104070  40 82 00 0C */	bne .L_8010885C
/* 80108854 00104074  38 00 00 20 */	li r0, 0x20
/* 80108858 00104078  9C 04 FF FF */	stbu r0, -0x1(r4)
.L_8010885C:
/* 8010885C 0010407C  7C 83 23 78 */	mr r3, r4
.L_80108860:
/* 80108860 00104080  E3 E1 00 88 */	psq_l f31, 0x88(r1), 0, qr0
/* 80108864 00104084  80 01 00 94 */	lwz r0, 0x94(r1)
/* 80108868 00104088  CB E1 00 80 */	lfd f31, 0x80(r1)
/* 8010886C 0010408C  83 E1 00 7C */	lwz r31, 0x7c(r1)
/* 80108870 00104090  83 C1 00 78 */	lwz r30, 0x78(r1)
/* 80108874 00104094  83 A1 00 74 */	lwz r29, 0x74(r1)
/* 80108878 00104098  83 81 00 70 */	lwz r28, 0x70(r1)
/* 8010887C 0010409C  7C 08 03 A6 */	mtlr r0
/* 80108880 001040A0  38 21 00 90 */	addi r1, r1, 0x90
/* 80108884 001040A4  4E 80 00 20 */	blr
.endfn double2hex_801084C0