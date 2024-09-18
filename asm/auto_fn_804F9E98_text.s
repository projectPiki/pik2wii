.include "macros.inc"
.file "auto_fn_804F9E98_text"

# 0x80006870 - 0x80006888
.section extab, "a"
.balign 4

.obj "@etb_80006870", local
.hidden "@etb_80006870"
	.4byte 0x104A0000
	.4byte 0x0000003C
	.4byte 0x00000010
	.4byte 0x00000000
	.4byte 0x82000014
	.4byte fn_8000A4F4
.endobj "@etb_80006870"

# 0x80006CB0 - 0x80006CBC
.section extabindex, "a"
.balign 4

.obj "@eti_80006CB0", local
.hidden "@eti_80006CB0"
	.4byte fn_804F9E98
	.4byte 0x00000090
	.4byte "@etb_80006870"
.endobj "@eti_80006CB0"

# 0x804F9E98 - 0x804F9F28
.text
.balign 4

.fn fn_804F9E98, global
/* 804F9E98 004F56B8  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 804F9E9C 004F56BC  7C 08 02 A6 */	mflr r0
/* 804F9EA0 004F56C0  90 01 00 44 */	stw r0, 0x44(r1)
/* 804F9EA4 004F56C4  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 804F9EA8 004F56C8  F3 E1 00 38 */	psq_st f31, 0x38(r1), 0, qr0
/* 804F9EAC 004F56CC  FF E0 08 90 */	fmr f31, f1
/* 804F9EB0 004F56D0  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 804F9EB4 004F56D4  7C BF 2B 78 */	mr r31, r5
/* 804F9EB8 004F56D8  93 C1 00 28 */	stw r30, 0x28(r1)
/* 804F9EBC 004F56DC  7C 7E 1B 78 */	mr r30, r3
/* 804F9EC0 004F56E0  38 61 00 14 */	addi r3, r1, 0x14
/* 804F9EC4 004F56E4  4B FF F7 89 */	bl fn_804F964C
/* 804F9EC8 004F56E8  7F E4 FB 78 */	mr r4, r31
/* 804F9ECC 004F56EC  38 61 00 08 */	addi r3, r1, 0x8
/* 804F9ED0 004F56F0  4B FF E5 B1 */	bl fn_804F8480
/* 804F9ED4 004F56F4  C0 21 00 18 */	lfs f1, 0x18(r1)
/* 804F9ED8 004F56F8  C0 01 00 0C */	lfs f0, 0xc(r1)
/* 804F9EDC 004F56FC  EC 41 00 24 */	fdivs f2, f1, f0
/* 804F9EE0 004F5700  D3 FE 00 04 */	stfs f31, 0x4(r30)
/* 804F9EE4 004F5704  C0 21 00 08 */	lfs f1, 0x8(r1)
/* 804F9EE8 004F5708  C0 01 00 14 */	lfs f0, 0x14(r1)
/* 804F9EEC 004F570C  EC 5F 10 28 */	fsubs f2, f31, f2
/* 804F9EF0 004F5710  EC 02 00 7A */	fmadds f0, f2, f1, f0
/* 804F9EF4 004F5714  D0 1E 00 00 */	stfs f0, 0x0(r30)
/* 804F9EF8 004F5718  C0 21 00 10 */	lfs f1, 0x10(r1)
/* 804F9EFC 004F571C  C0 01 00 1C */	lfs f0, 0x1c(r1)
/* 804F9F00 004F5720  EC 02 00 7A */	fmadds f0, f2, f1, f0
/* 804F9F04 004F5724  D0 1E 00 08 */	stfs f0, 0x8(r30)
/* 804F9F08 004F5728  E3 E1 00 38 */	psq_l f31, 0x38(r1), 0, qr0
/* 804F9F0C 004F572C  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 804F9F10 004F5730  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 804F9F14 004F5734  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 804F9F18 004F5738  80 01 00 44 */	lwz r0, 0x44(r1)
/* 804F9F1C 004F573C  7C 08 03 A6 */	mtlr r0
/* 804F9F20 004F5740  38 21 00 40 */	addi r1, r1, 0x40
/* 804F9F24 004F5744  4E 80 00 20 */	blr
.endfn fn_804F9E98
