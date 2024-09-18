.include "macros.inc"
.file "auto_fn_804FA2CC_text"

# 0x80006890 - 0x80006898
.section extab, "a"
.balign 4

.obj "@etb_80006890", local
.hidden "@etb_80006890"
	.4byte 0x084A0000
	.4byte 0x00000000
.endobj "@etb_80006890"

# 0x80006CC8 - 0x80006CD4
.section extabindex, "a"
.balign 4

.obj "@eti_80006CC8", local
.hidden "@eti_80006CC8"
	.4byte fn_804FA2CC
	.4byte 0x00000070
	.4byte "@etb_80006890"
.endobj "@eti_80006CC8"

# 0x804FA2CC - 0x804FA33C
.text
.balign 4

.fn fn_804FA2CC, global
/* 804FA2CC 004F5AEC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 804FA2D0 004F5AF0  7C 08 02 A6 */	mflr r0
/* 804FA2D4 004F5AF4  90 01 00 24 */	stw r0, 0x24(r1)
/* 804FA2D8 004F5AF8  DB E1 00 10 */	stfd f31, 0x10(r1)
/* 804FA2DC 004F5AFC  F3 E1 00 18 */	psq_st f31, 0x18(r1), 0, qr0
/* 804FA2E0 004F5B00  C0 42 09 48 */	lfs f2, lbl_80675E28@sda21(r0)
/* 804FA2E4 004F5B04  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804FA2E8 004F5B08  7C 7F 1B 78 */	mr r31, r3
/* 804FA2EC 004F5B0C  EC 42 00 72 */	fmuls f2, f2, f1
/* 804FA2F0 004F5B10  C0 02 09 74 */	lfs f0, lbl_80675E54@sda21(r0)
/* 804FA2F4 004F5B14  D0 23 00 50 */	stfs f1, 0x50(r3)
/* 804FA2F8 004F5B18  EF E2 00 32 */	fmuls f31, f2, f0
/* 804FA2FC 004F5B1C  FC 20 F8 90 */	fmr f1, f31
/* 804FA300 004F5B20  48 00 08 D5 */	bl fn_804FABD4
/* 804FA304 004F5B24  D0 3F 00 54 */	stfs f1, 0x54(r31)
/* 804FA308 004F5B28  FC 20 F8 90 */	fmr f1, f31
/* 804FA30C 004F5B2C  48 00 08 ED */	bl fn_804FABF8
/* 804FA310 004F5B30  D0 3F 00 58 */	stfs f1, 0x58(r31)
/* 804FA314 004F5B34  FC 20 F8 90 */	fmr f1, f31
/* 804FA318 004F5B38  48 00 09 05 */	bl fn_804FAC1C
/* 804FA31C 004F5B3C  D0 3F 00 5C */	stfs f1, 0x5c(r31)
/* 804FA320 004F5B40  E3 E1 00 18 */	psq_l f31, 0x18(r1), 0, qr0
/* 804FA324 004F5B44  CB E1 00 10 */	lfd f31, 0x10(r1)
/* 804FA328 004F5B48  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804FA32C 004F5B4C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 804FA330 004F5B50  7C 08 03 A6 */	mtlr r0
/* 804FA334 004F5B54  38 21 00 20 */	addi r1, r1, 0x20
/* 804FA338 004F5B58  4E 80 00 20 */	blr
.endfn fn_804FA2CC
