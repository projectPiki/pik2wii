.include "macros.inc"
.section .sdata2, "a"     # 0x80516360 - 0x80520E40
.balign 8
.obj lbl_805203B0, local
	.float 5.0
.endobj lbl_805203B0
.obj lbl_805203B4, local
	.float 0.0
.endobj lbl_805203B4

.section .text, "ax"  # 0x800056C0 - 0x80472F00
.fn intersect__Q23Sys8TriangleFRQ23Sys11VertexTableRQ33Sys8Triangle11SphereSweep, global
/* 8041C9CC 0041990C  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 8041C9D0 00419910  7C 08 02 A6 */	mflr r0
/* 8041C9D4 00419914  90 01 00 84 */	stw r0, 0x84(r1)
/* 8041C9D8 00419918  DB E1 00 70 */	stfd f31, 0x70(r1)
/* 8041C9DC 0041991C  F3 E1 00 78 */	psq_st f31, 120(r1), 0, qr0
/* 8041C9E0 00419920  93 E1 00 6C */	stw r31, 0x6c(r1)
/* 8041C9E4 00419924  93 C1 00 68 */	stw r30, 0x68(r1)
/* 8041C9E8 00419928  93 A1 00 64 */	stw r29, 0x64(r1)
/* 8041C9EC 0041992C  93 81 00 60 */	stw r28, 0x60(r1)
/* 8041C9F0 00419930  7C BF 2B 78 */	mr r31, r5
/* 8041C9F4 00419934  7C 7D 1B 78 */	mr r29, r3
/* 8041C9F8 00419938  C0 45 00 10 */	lfs f2, 0x10(r5)
/* 8041C9FC 0041993C  7C 9E 23 78 */	mr r30, r4
/* 8041CA00 00419940  C0 03 00 10 */	lfs f0, 0x10(r3)
/* 8041CA04 00419944  3B 9F 00 30 */	addi r28, r31, 0x30
/* 8041CA08 00419948  88 05 00 1C */	lbz r0, 0x1c(r5)
/* 8041CA0C 0041994C  EC 02 00 32 */	fmuls f0, f2, f0
/* 8041CA10 00419950  C0 65 00 0C */	lfs f3, 0xc(r5)
/* 8041CA14 00419954  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 8041CA18 00419958  2C 00 00 01 */	cmpwi r0, 1
/* 8041CA1C 0041995C  C0 A5 00 14 */	lfs f5, 0x14(r5)
/* 8041CA20 00419960  EC 23 00 7A */	fmadds f1, f3, f1, f0
/* 8041CA24 00419964  C0 83 00 14 */	lfs f4, 0x14(r3)
/* 8041CA28 00419968  C0 03 00 18 */	lfs f0, 0x18(r3)
/* 8041CA2C 0041996C  EC 25 09 3A */	fmadds f1, f5, f4, f1
/* 8041CA30 00419970  EF E1 00 28 */	fsubs f31, f1, f0
/* 8041CA34 00419974  41 82 00 3C */	beq .L_8041CA70
/* 8041CA38 00419978  40 80 00 10 */	bge .L_8041CA48
/* 8041CA3C 0041997C  2C 00 00 00 */	cmpwi r0, 0
/* 8041CA40 00419980  40 80 00 14 */	bge .L_8041CA54
/* 8041CA44 00419984  48 00 00 F8 */	b .L_8041CB3C
.L_8041CA48:
/* 8041CA48 00419988  2C 00 00 03 */	cmpwi r0, 3
/* 8041CA4C 0041998C  40 80 00 F0 */	bge .L_8041CB3C
/* 8041CA50 00419990  48 00 00 50 */	b .L_8041CAA0
.L_8041CA54:
/* 8041CA54 00419994  FC 20 FA 10 */	fabs f1, f31
/* 8041CA58 00419998  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 8041CA5C 0041999C  FC 20 08 18 */	frsp f1, f1
/* 8041CA60 004199A0  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8041CA64 004199A4  40 81 00 D8 */	ble .L_8041CB3C
/* 8041CA68 004199A8  38 60 00 00 */	li r3, 0
/* 8041CA6C 004199AC  48 00 04 28 */	b .L_8041CE94
.L_8041CA70:
/* 8041CA70 004199B0  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 8041CA74 004199B4  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8041CA78 004199B8  40 81 00 0C */	ble .L_8041CA84
/* 8041CA7C 004199BC  38 60 00 00 */	li r3, 0
/* 8041CA80 004199C0  48 00 04 14 */	b .L_8041CE94
.L_8041CA84:
/* 8041CA84 004199C4  FC 20 00 50 */	fneg f1, f0
/* 8041CA88 004199C8  C0 02 20 50 */	lfs f0, lbl_805203B0@sda21(r2)
/* 8041CA8C 004199CC  EC 01 00 28 */	fsubs f0, f1, f0
/* 8041CA90 004199D0  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8041CA94 004199D4  40 80 00 A8 */	bge .L_8041CB3C
/* 8041CA98 004199D8  38 60 00 00 */	li r3, 0
/* 8041CA9C 004199DC  48 00 03 F8 */	b .L_8041CE94
.L_8041CAA0:
/* 8041CAA0 004199E0  C0 1F 00 00 */	lfs f0, 0(r31)
/* 8041CAA4 004199E4  D0 01 00 40 */	stfs f0, 0x40(r1)
/* 8041CAA8 004199E8  EC C0 18 28 */	fsubs f6, f0, f3
/* 8041CAAC 004199EC  C0 1F 00 04 */	lfs f0, 4(r31)
/* 8041CAB0 004199F0  EC 80 10 28 */	fsubs f4, f0, f2
/* 8041CAB4 004199F4  D0 01 00 44 */	stfs f0, 0x44(r1)
/* 8041CAB8 004199F8  C0 3F 00 08 */	lfs f1, 8(r31)
/* 8041CABC 004199FC  EC 04 01 32 */	fmuls f0, f4, f4
/* 8041CAC0 00419A00  EC 81 28 28 */	fsubs f4, f1, f5
/* 8041CAC4 00419A04  D0 21 00 48 */	stfs f1, 0x48(r1)
/* 8041CAC8 00419A08  EC 06 01 BA */	fmadds f0, f6, f6, f0
/* 8041CACC 00419A0C  D0 61 00 4C */	stfs f3, 0x4c(r1)
/* 8041CAD0 00419A10  D0 41 00 50 */	stfs f2, 0x50(r1)
/* 8041CAD4 00419A14  EC 24 01 3A */	fmadds f1, f4, f4, f0
/* 8041CAD8 00419A18  D0 A1 00 54 */	stfs f5, 0x54(r1)
/* 8041CADC 00419A1C  4B FF 4D 29 */	bl pikmin2_sqrtf__Ff
/* 8041CAE0 00419A20  C0 02 20 54 */	lfs f0, lbl_805203B4@sda21(r2)
/* 8041CAE4 00419A24  FC 00 08 00 */	fcmpu cr0, f0, f1
/* 8041CAE8 00419A28  40 82 00 18 */	bne .L_8041CB00
/* 8041CAEC 00419A2C  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 8041CAF0 00419A30  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8041CAF4 00419A34  40 81 00 48 */	ble .L_8041CB3C
/* 8041CAF8 00419A38  38 60 00 00 */	li r3, 0
/* 8041CAFC 00419A3C  48 00 03 98 */	b .L_8041CE94
.L_8041CB00:
/* 8041CB00 00419A40  C0 3F 00 18 */	lfs f1, 0x18(r31)
/* 8041CB04 00419A44  7F A3 EB 78 */	mr r3, r29
/* 8041CB08 00419A48  7F 85 E3 78 */	mr r5, r28
/* 8041CB0C 00419A4C  38 81 00 40 */	addi r4, r1, 0x40
/* 8041CB10 00419A50  38 DF 00 2C */	addi r6, r31, 0x2c
/* 8041CB14 00419A54  4B FF A4 69 */	bl "intersect__Q23Sys8TriangleFRQ23Sys4EdgefR10Vector3<f>Rf"
/* 8041CB18 00419A58  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8041CB1C 00419A5C  41 82 03 78 */	beq .L_8041CE94
/* 8041CB20 00419A60  C0 1D 00 0C */	lfs f0, 0xc(r29)
/* 8041CB24 00419A64  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 8041CB28 00419A68  C0 1D 00 10 */	lfs f0, 0x10(r29)
/* 8041CB2C 00419A6C  D0 1F 00 24 */	stfs f0, 0x24(r31)
/* 8041CB30 00419A70  C0 1D 00 14 */	lfs f0, 0x14(r29)
/* 8041CB34 00419A74  D0 1F 00 28 */	stfs f0, 0x28(r31)
/* 8041CB38 00419A78  48 00 03 5C */	b .L_8041CE94
.L_8041CB3C:
/* 8041CB3C 00419A7C  C1 1F 00 10 */	lfs f8, 0x10(r31)
/* 8041CB40 00419A80  C0 5D 00 20 */	lfs f2, 0x20(r29)
/* 8041CB44 00419A84  C0 FF 00 0C */	lfs f7, 0xc(r31)
/* 8041CB48 00419A88  EC 28 00 B2 */	fmuls f1, f8, f2
/* 8041CB4C 00419A8C  C0 BD 00 1C */	lfs f5, 0x1c(r29)
/* 8041CB50 00419A90  C0 5D 00 30 */	lfs f2, 0x30(r29)
/* 8041CB54 00419A94  C1 3F 00 14 */	lfs f9, 0x14(r31)
/* 8041CB58 00419A98  EC 07 09 7A */	fmadds f0, f7, f5, f1
/* 8041CB5C 00419A9C  C0 DD 00 24 */	lfs f6, 0x24(r29)
/* 8041CB60 00419AA0  EC 28 00 B2 */	fmuls f1, f8, f2
/* 8041CB64 00419AA4  C0 BD 00 2C */	lfs f5, 0x2c(r29)
/* 8041CB68 00419AA8  C0 5D 00 40 */	lfs f2, 0x40(r29)
/* 8041CB6C 00419AAC  EC 89 01 BA */	fmadds f4, f9, f6, f0
/* 8041CB70 00419AB0  EC 07 09 7A */	fmadds f0, f7, f5, f1
/* 8041CB74 00419AB4  C0 7D 00 28 */	lfs f3, 0x28(r29)
/* 8041CB78 00419AB8  EC 28 00 B2 */	fmuls f1, f8, f2
/* 8041CB7C 00419ABC  C0 DD 00 34 */	lfs f6, 0x34(r29)
/* 8041CB80 00419AC0  EC 44 18 28 */	fsubs f2, f4, f3
/* 8041CB84 00419AC4  EC 89 01 BA */	fmadds f4, f9, f6, f0
/* 8041CB88 00419AC8  C0 BD 00 3C */	lfs f5, 0x3c(r29)
/* 8041CB8C 00419ACC  D0 41 00 1C */	stfs f2, 0x1c(r1)
/* 8041CB90 00419AD0  C0 7D 00 38 */	lfs f3, 0x38(r29)
/* 8041CB94 00419AD4  EC 07 09 7A */	fmadds f0, f7, f5, f1
/* 8041CB98 00419AD8  C0 DD 00 44 */	lfs f6, 0x44(r29)
/* 8041CB9C 00419ADC  EC 44 18 28 */	fsubs f2, f4, f3
/* 8041CBA0 00419AE0  C0 7D 00 48 */	lfs f3, 0x48(r29)
/* 8041CBA4 00419AE4  EC 89 01 BA */	fmadds f4, f9, f6, f0
/* 8041CBA8 00419AE8  C0 01 00 1C */	lfs f0, 0x1c(r1)
/* 8041CBAC 00419AEC  C0 22 20 54 */	lfs f1, lbl_805203B4@sda21(r2)
/* 8041CBB0 00419AF0  D0 41 00 20 */	stfs f2, 0x20(r1)
/* 8041CBB4 00419AF4  EC 44 18 28 */	fsubs f2, f4, f3
/* 8041CBB8 00419AF8  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8041CBBC 00419AFC  D0 41 00 24 */	stfs f2, 0x24(r1)
/* 8041CBC0 00419B00  4C 40 13 82 */	cror 2, 0, 2
/* 8041CBC4 00419B04  40 82 00 90 */	bne .L_8041CC54
/* 8041CBC8 00419B08  C0 01 00 20 */	lfs f0, 0x20(r1)
/* 8041CBCC 00419B0C  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8041CBD0 00419B10  4C 40 13 82 */	cror 2, 0, 2
/* 8041CBD4 00419B14  40 82 00 80 */	bne .L_8041CC54
/* 8041CBD8 00419B18  FC 00 10 18 */	frsp f0, f2
/* 8041CBDC 00419B1C  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8041CBE0 00419B20  4C 40 13 82 */	cror 2, 0, 2
/* 8041CBE4 00419B24  40 82 00 70 */	bne .L_8041CC54
/* 8041CBE8 00419B28  C0 1D 00 0C */	lfs f0, 0xc(r29)
/* 8041CBEC 00419B2C  38 60 00 01 */	li r3, 1
/* 8041CBF0 00419B30  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 8041CBF4 00419B34  C0 1D 00 10 */	lfs f0, 0x10(r29)
/* 8041CBF8 00419B38  D0 1F 00 24 */	stfs f0, 0x24(r31)
/* 8041CBFC 00419B3C  C0 1D 00 14 */	lfs f0, 0x14(r29)
/* 8041CC00 00419B40  D0 1F 00 28 */	stfs f0, 0x28(r31)
/* 8041CC04 00419B44  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 8041CC08 00419B48  EC 00 F8 28 */	fsubs f0, f0, f31
/* 8041CC0C 00419B4C  D0 1F 00 2C */	stfs f0, 0x2c(r31)
/* 8041CC10 00419B50  C0 DF 00 18 */	lfs f6, 0x18(r31)
/* 8041CC14 00419B54  C0 1F 00 20 */	lfs f0, 0x20(r31)
/* 8041CC18 00419B58  C0 5F 00 24 */	lfs f2, 0x24(r31)
/* 8041CC1C 00419B5C  EC 00 01 B2 */	fmuls f0, f0, f6
/* 8041CC20 00419B60  C0 3F 00 0C */	lfs f1, 0xc(r31)
/* 8041CC24 00419B64  C0 9F 00 28 */	lfs f4, 0x28(r31)
/* 8041CC28 00419B68  EC 42 01 B2 */	fmuls f2, f2, f6
/* 8041CC2C 00419B6C  C0 7F 00 10 */	lfs f3, 0x10(r31)
/* 8041CC30 00419B70  EC 01 00 28 */	fsubs f0, f1, f0
/* 8041CC34 00419B74  C0 BF 00 14 */	lfs f5, 0x14(r31)
/* 8041CC38 00419B78  EC 24 01 B2 */	fmuls f1, f4, f6
/* 8041CC3C 00419B7C  EC 43 10 28 */	fsubs f2, f3, f2
/* 8041CC40 00419B80  D0 1F 00 30 */	stfs f0, 0x30(r31)
/* 8041CC44 00419B84  EC 05 08 28 */	fsubs f0, f5, f1
/* 8041CC48 00419B88  D0 5F 00 34 */	stfs f2, 0x34(r31)
/* 8041CC4C 00419B8C  D0 1F 00 38 */	stfs f0, 0x38(r31)
/* 8041CC50 00419B90  48 00 02 44 */	b .L_8041CE94
.L_8041CC54:
/* 8041CC54 00419B94  C0 3F 00 18 */	lfs f1, 0x18(r31)
/* 8041CC58 00419B98  38 61 00 0C */	addi r3, r1, 0xc
/* 8041CC5C 00419B9C  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 8041CC60 00419BA0  38 81 00 28 */	addi r4, r1, 0x28
/* 8041CC64 00419BA4  38 A1 00 08 */	addi r5, r1, 8
/* 8041CC68 00419BA8  38 DF 00 20 */	addi r6, r31, 0x20
/* 8041CC6C 00419BAC  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 8041CC70 00419BB0  38 FF 00 2C */	addi r7, r31, 0x2c
/* 8041CC74 00419BB4  C0 1F 00 10 */	lfs f0, 0x10(r31)
/* 8041CC78 00419BB8  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 8041CC7C 00419BBC  C0 1F 00 14 */	lfs f0, 0x14(r31)
/* 8041CC80 00419BC0  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 8041CC84 00419BC4  D0 21 00 18 */	stfs f1, 0x18(r1)
/* 8041CC88 00419BC8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8041CC8C 00419BCC  81 5E 00 24 */	lwz r10, 0x24(r30)
/* 8041CC90 00419BD0  1C 00 00 0C */	mulli r0, r0, 0xc
/* 8041CC94 00419BD4  81 1D 00 04 */	lwz r8, 4(r29)
/* 8041CC98 00419BD8  7D 2A 02 14 */	add r9, r10, r0
/* 8041CC9C 00419BDC  C0 09 00 00 */	lfs f0, 0(r9)
/* 8041CCA0 00419BE0  1C 08 00 0C */	mulli r0, r8, 0xc
/* 8041CCA4 00419BE4  D0 01 00 28 */	stfs f0, 0x28(r1)
/* 8041CCA8 00419BE8  7D 0A 02 14 */	add r8, r10, r0
/* 8041CCAC 00419BEC  C0 09 00 04 */	lfs f0, 4(r9)
/* 8041CCB0 00419BF0  D0 01 00 2C */	stfs f0, 0x2c(r1)
/* 8041CCB4 00419BF4  C0 09 00 08 */	lfs f0, 8(r9)
/* 8041CCB8 00419BF8  D0 01 00 30 */	stfs f0, 0x30(r1)
/* 8041CCBC 00419BFC  C0 08 00 00 */	lfs f0, 0(r8)
/* 8041CCC0 00419C00  D0 01 00 34 */	stfs f0, 0x34(r1)
/* 8041CCC4 00419C04  C0 08 00 04 */	lfs f0, 4(r8)
/* 8041CCC8 00419C08  D0 01 00 38 */	stfs f0, 0x38(r1)
/* 8041CCCC 00419C0C  C0 08 00 08 */	lfs f0, 8(r8)
/* 8041CCD0 00419C10  D0 01 00 3C */	stfs f0, 0x3c(r1)
/* 8041CCD4 00419C14  4B FF 98 49 */	bl "intersect__Q23Sys6SphereFRQ23Sys4EdgeRfR10Vector3<f>Rf"
/* 8041CCD8 00419C18  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8041CCDC 00419C1C  41 82 00 4C */	beq .L_8041CD28
/* 8041CCE0 00419C20  C0 DF 00 18 */	lfs f6, 0x18(r31)
/* 8041CCE4 00419C24  38 60 00 01 */	li r3, 1
/* 8041CCE8 00419C28  C0 1F 00 20 */	lfs f0, 0x20(r31)
/* 8041CCEC 00419C2C  C0 5F 00 24 */	lfs f2, 0x24(r31)
/* 8041CCF0 00419C30  EC 00 01 B2 */	fmuls f0, f0, f6
/* 8041CCF4 00419C34  C0 3F 00 0C */	lfs f1, 0xc(r31)
/* 8041CCF8 00419C38  C0 9F 00 28 */	lfs f4, 0x28(r31)
/* 8041CCFC 00419C3C  EC 42 01 B2 */	fmuls f2, f2, f6
/* 8041CD00 00419C40  C0 7F 00 10 */	lfs f3, 0x10(r31)
/* 8041CD04 00419C44  EC 01 00 28 */	fsubs f0, f1, f0
/* 8041CD08 00419C48  C0 BF 00 14 */	lfs f5, 0x14(r31)
/* 8041CD0C 00419C4C  EC 24 01 B2 */	fmuls f1, f4, f6
/* 8041CD10 00419C50  EC 43 10 28 */	fsubs f2, f3, f2
/* 8041CD14 00419C54  D0 1F 00 30 */	stfs f0, 0x30(r31)
/* 8041CD18 00419C58  EC 05 08 28 */	fsubs f0, f5, f1
/* 8041CD1C 00419C5C  D0 5F 00 34 */	stfs f2, 0x34(r31)
/* 8041CD20 00419C60  D0 1F 00 38 */	stfs f0, 0x38(r31)
/* 8041CD24 00419C64  48 00 01 70 */	b .L_8041CE94
.L_8041CD28:
/* 8041CD28 00419C68  80 1D 00 04 */	lwz r0, 4(r29)
/* 8041CD2C 00419C6C  38 61 00 0C */	addi r3, r1, 0xc
/* 8041CD30 00419C70  81 1D 00 08 */	lwz r8, 8(r29)
/* 8041CD34 00419C74  38 81 00 28 */	addi r4, r1, 0x28
/* 8041CD38 00419C78  1C 00 00 0C */	mulli r0, r0, 0xc
/* 8041CD3C 00419C7C  81 5E 00 24 */	lwz r10, 0x24(r30)
/* 8041CD40 00419C80  38 A1 00 08 */	addi r5, r1, 8
/* 8041CD44 00419C84  38 DF 00 20 */	addi r6, r31, 0x20
/* 8041CD48 00419C88  7D 2A 02 14 */	add r9, r10, r0
/* 8041CD4C 00419C8C  38 FF 00 2C */	addi r7, r31, 0x2c
/* 8041CD50 00419C90  C0 09 00 00 */	lfs f0, 0(r9)
/* 8041CD54 00419C94  1C 08 00 0C */	mulli r0, r8, 0xc
/* 8041CD58 00419C98  D0 01 00 28 */	stfs f0, 0x28(r1)
/* 8041CD5C 00419C9C  7D 0A 02 14 */	add r8, r10, r0
/* 8041CD60 00419CA0  C0 09 00 04 */	lfs f0, 4(r9)
/* 8041CD64 00419CA4  D0 01 00 2C */	stfs f0, 0x2c(r1)
/* 8041CD68 00419CA8  C0 09 00 08 */	lfs f0, 8(r9)
/* 8041CD6C 00419CAC  D0 01 00 30 */	stfs f0, 0x30(r1)
/* 8041CD70 00419CB0  C0 08 00 00 */	lfs f0, 0(r8)
/* 8041CD74 00419CB4  D0 01 00 34 */	stfs f0, 0x34(r1)
/* 8041CD78 00419CB8  C0 08 00 04 */	lfs f0, 4(r8)
/* 8041CD7C 00419CBC  D0 01 00 38 */	stfs f0, 0x38(r1)
/* 8041CD80 00419CC0  C0 08 00 08 */	lfs f0, 8(r8)
/* 8041CD84 00419CC4  D0 01 00 3C */	stfs f0, 0x3c(r1)
/* 8041CD88 00419CC8  4B FF 97 95 */	bl "intersect__Q23Sys6SphereFRQ23Sys4EdgeRfR10Vector3<f>Rf"
/* 8041CD8C 00419CCC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8041CD90 00419CD0  41 82 00 4C */	beq .L_8041CDDC
/* 8041CD94 00419CD4  C0 DF 00 18 */	lfs f6, 0x18(r31)
/* 8041CD98 00419CD8  38 60 00 01 */	li r3, 1
/* 8041CD9C 00419CDC  C0 1F 00 20 */	lfs f0, 0x20(r31)
/* 8041CDA0 00419CE0  C0 5F 00 24 */	lfs f2, 0x24(r31)
/* 8041CDA4 00419CE4  EC 00 01 B2 */	fmuls f0, f0, f6
/* 8041CDA8 00419CE8  C0 3F 00 0C */	lfs f1, 0xc(r31)
/* 8041CDAC 00419CEC  C0 9F 00 28 */	lfs f4, 0x28(r31)
/* 8041CDB0 00419CF0  EC 42 01 B2 */	fmuls f2, f2, f6
/* 8041CDB4 00419CF4  C0 7F 00 10 */	lfs f3, 0x10(r31)
/* 8041CDB8 00419CF8  EC 01 00 28 */	fsubs f0, f1, f0
/* 8041CDBC 00419CFC  C0 BF 00 14 */	lfs f5, 0x14(r31)
/* 8041CDC0 00419D00  EC 24 01 B2 */	fmuls f1, f4, f6
/* 8041CDC4 00419D04  EC 43 10 28 */	fsubs f2, f3, f2
/* 8041CDC8 00419D08  D0 1F 00 30 */	stfs f0, 0x30(r31)
/* 8041CDCC 00419D0C  EC 05 08 28 */	fsubs f0, f5, f1
/* 8041CDD0 00419D10  D0 5F 00 34 */	stfs f2, 0x34(r31)
/* 8041CDD4 00419D14  D0 1F 00 38 */	stfs f0, 0x38(r31)
/* 8041CDD8 00419D18  48 00 00 BC */	b .L_8041CE94
.L_8041CDDC:
/* 8041CDDC 00419D1C  80 1D 00 08 */	lwz r0, 8(r29)
/* 8041CDE0 00419D20  38 61 00 0C */	addi r3, r1, 0xc
/* 8041CDE4 00419D24  81 1D 00 00 */	lwz r8, 0(r29)
/* 8041CDE8 00419D28  38 81 00 28 */	addi r4, r1, 0x28
/* 8041CDEC 00419D2C  1C 00 00 0C */	mulli r0, r0, 0xc
/* 8041CDF0 00419D30  81 5E 00 24 */	lwz r10, 0x24(r30)
/* 8041CDF4 00419D34  38 A1 00 08 */	addi r5, r1, 8
/* 8041CDF8 00419D38  38 DF 00 20 */	addi r6, r31, 0x20
/* 8041CDFC 00419D3C  7D 2A 02 14 */	add r9, r10, r0
/* 8041CE00 00419D40  38 FF 00 2C */	addi r7, r31, 0x2c
/* 8041CE04 00419D44  C0 09 00 00 */	lfs f0, 0(r9)
/* 8041CE08 00419D48  1C 08 00 0C */	mulli r0, r8, 0xc
/* 8041CE0C 00419D4C  D0 01 00 28 */	stfs f0, 0x28(r1)
/* 8041CE10 00419D50  7D 0A 02 14 */	add r8, r10, r0
/* 8041CE14 00419D54  C0 09 00 04 */	lfs f0, 4(r9)
/* 8041CE18 00419D58  D0 01 00 2C */	stfs f0, 0x2c(r1)
/* 8041CE1C 00419D5C  C0 09 00 08 */	lfs f0, 8(r9)
/* 8041CE20 00419D60  D0 01 00 30 */	stfs f0, 0x30(r1)
/* 8041CE24 00419D64  C0 08 00 00 */	lfs f0, 0(r8)
/* 8041CE28 00419D68  D0 01 00 34 */	stfs f0, 0x34(r1)
/* 8041CE2C 00419D6C  C0 08 00 04 */	lfs f0, 4(r8)
/* 8041CE30 00419D70  D0 01 00 38 */	stfs f0, 0x38(r1)
/* 8041CE34 00419D74  C0 08 00 08 */	lfs f0, 8(r8)
/* 8041CE38 00419D78  D0 01 00 3C */	stfs f0, 0x3c(r1)
/* 8041CE3C 00419D7C  4B FF 96 E1 */	bl "intersect__Q23Sys6SphereFRQ23Sys4EdgeRfR10Vector3<f>Rf"
/* 8041CE40 00419D80  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8041CE44 00419D84  41 82 00 4C */	beq .L_8041CE90
/* 8041CE48 00419D88  C0 DF 00 18 */	lfs f6, 0x18(r31)
/* 8041CE4C 00419D8C  38 60 00 01 */	li r3, 1
/* 8041CE50 00419D90  C0 1F 00 20 */	lfs f0, 0x20(r31)
/* 8041CE54 00419D94  C0 5F 00 24 */	lfs f2, 0x24(r31)
/* 8041CE58 00419D98  EC 00 01 B2 */	fmuls f0, f0, f6
/* 8041CE5C 00419D9C  C0 3F 00 0C */	lfs f1, 0xc(r31)
/* 8041CE60 00419DA0  C0 9F 00 28 */	lfs f4, 0x28(r31)
/* 8041CE64 00419DA4  EC 42 01 B2 */	fmuls f2, f2, f6
/* 8041CE68 00419DA8  C0 7F 00 10 */	lfs f3, 0x10(r31)
/* 8041CE6C 00419DAC  EC 01 00 28 */	fsubs f0, f1, f0
/* 8041CE70 00419DB0  C0 BF 00 14 */	lfs f5, 0x14(r31)
/* 8041CE74 00419DB4  EC 24 01 B2 */	fmuls f1, f4, f6
/* 8041CE78 00419DB8  EC 43 10 28 */	fsubs f2, f3, f2
/* 8041CE7C 00419DBC  D0 1F 00 30 */	stfs f0, 0x30(r31)
/* 8041CE80 00419DC0  EC 05 08 28 */	fsubs f0, f5, f1
/* 8041CE84 00419DC4  D0 5F 00 34 */	stfs f2, 0x34(r31)
/* 8041CE88 00419DC8  D0 1F 00 38 */	stfs f0, 0x38(r31)
/* 8041CE8C 00419DCC  48 00 00 08 */	b .L_8041CE94
.L_8041CE90:
/* 8041CE90 00419DD0  38 60 00 00 */	li r3, 0
.L_8041CE94:
/* 8041CE94 00419DD4  E3 E1 00 78 */	psq_l f31, 120(r1), 0, qr0
/* 8041CE98 00419DD8  80 01 00 84 */	lwz r0, 0x84(r1)
/* 8041CE9C 00419DDC  CB E1 00 70 */	lfd f31, 0x70(r1)
/* 8041CEA0 00419DE0  83 E1 00 6C */	lwz r31, 0x6c(r1)
/* 8041CEA4 00419DE4  83 C1 00 68 */	lwz r30, 0x68(r1)
/* 8041CEA8 00419DE8  83 A1 00 64 */	lwz r29, 0x64(r1)
/* 8041CEAC 00419DEC  83 81 00 60 */	lwz r28, 0x60(r1)
/* 8041CEB0 00419DF0  7C 08 03 A6 */	mtlr r0
/* 8041CEB4 00419DF4  38 21 00 80 */	addi r1, r1, 0x80
/* 8041CEB8 00419DF8  4E 80 00 20 */	blr 
.endfn intersect__Q23Sys8TriangleFRQ23Sys11VertexTableRQ33Sys8Triangle11SphereSweep