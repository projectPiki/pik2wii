.include "macros.inc"
.file "auto_fn_804F9E08_text"

# 0x80006858 - 0x80006870
.section extab, "a"
.balign 4

.obj "@etb_80006858", local
.hidden "@etb_80006858"
	.4byte 0x104A0000
	.4byte 0x0000003C
	.4byte 0x00000010
	.4byte 0x00000000
	.4byte 0x82000014
	.4byte fn_8000A4F4
.endobj "@etb_80006858"

# 0x80006CA4 - 0x80006CB0
.section extabindex, "a"
.balign 4

.obj "@eti_80006CA4", local
.hidden "@eti_80006CA4"
	.4byte fn_804F9E08
	.4byte 0x00000090
	.4byte "@etb_80006858"
.endobj "@eti_80006CA4"

# 0x804F9E08 - 0x804F9E98
.text
.balign 4

.fn fn_804F9E08, global
/* 804F9E08 004F5628  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 804F9E0C 004F562C  7C 08 02 A6 */	mflr r0
/* 804F9E10 004F5630  90 01 00 44 */	stw r0, 0x44(r1)
/* 804F9E14 004F5634  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 804F9E18 004F5638  F3 E1 00 38 */	psq_st f31, 0x38(r1), 0, qr0
/* 804F9E1C 004F563C  FF E0 08 90 */	fmr f31, f1
/* 804F9E20 004F5640  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 804F9E24 004F5644  7C BF 2B 78 */	mr r31, r5
/* 804F9E28 004F5648  93 C1 00 28 */	stw r30, 0x28(r1)
/* 804F9E2C 004F564C  7C 7E 1B 78 */	mr r30, r3
/* 804F9E30 004F5650  38 61 00 14 */	addi r3, r1, 0x14
/* 804F9E34 004F5654  4B FF F8 19 */	bl fn_804F964C
/* 804F9E38 004F5658  7F E4 FB 78 */	mr r4, r31
/* 804F9E3C 004F565C  38 61 00 08 */	addi r3, r1, 0x8
/* 804F9E40 004F5660  4B FF E6 41 */	bl fn_804F8480
/* 804F9E44 004F5664  C0 21 00 1C */	lfs f1, 0x1c(r1)
/* 804F9E48 004F5668  C0 01 00 10 */	lfs f0, 0x10(r1)
/* 804F9E4C 004F566C  EC 41 00 24 */	fdivs f2, f1, f0
/* 804F9E50 004F5670  D3 FE 00 08 */	stfs f31, 0x8(r30)
/* 804F9E54 004F5674  C0 21 00 08 */	lfs f1, 0x8(r1)
/* 804F9E58 004F5678  C0 01 00 14 */	lfs f0, 0x14(r1)
/* 804F9E5C 004F567C  EC 5F 10 28 */	fsubs f2, f31, f2
/* 804F9E60 004F5680  EC 02 00 7A */	fmadds f0, f2, f1, f0
/* 804F9E64 004F5684  D0 1E 00 00 */	stfs f0, 0x0(r30)
/* 804F9E68 004F5688  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 804F9E6C 004F568C  C0 01 00 18 */	lfs f0, 0x18(r1)
/* 804F9E70 004F5690  EC 02 00 7A */	fmadds f0, f2, f1, f0
/* 804F9E74 004F5694  D0 1E 00 04 */	stfs f0, 0x4(r30)
/* 804F9E78 004F5698  E3 E1 00 38 */	psq_l f31, 0x38(r1), 0, qr0
/* 804F9E7C 004F569C  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 804F9E80 004F56A0  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 804F9E84 004F56A4  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 804F9E88 004F56A8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 804F9E8C 004F56AC  7C 08 03 A6 */	mtlr r0
/* 804F9E90 004F56B0  38 21 00 40 */	addi r1, r1, 0x40
/* 804F9E94 004F56B4  4E 80 00 20 */	blr
.endfn fn_804F9E08
