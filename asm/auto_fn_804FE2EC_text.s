.include "macros.inc"
.file "auto_fn_804FE2EC_text"

# 0x804FE2EC - 0x804FE348
.text
.balign 4

.fn fn_804FE2EC, global
/* 804FE2EC 004F9B0C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804FE2F0 004F9B10  7C 08 02 A6 */	mflr r0
/* 804FE2F4 004F9B14  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FE2F8 004F9B18  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804FE2FC 004F9B1C  3F E0 80 64 */	lis r31, lbl_80640E80@ha
/* 804FE300 004F9B20  38 7F 0E 80 */	addi r3, r31, lbl_80640E80@l
/* 804FE304 004F9B24  4B FF E2 E5 */	bl fn_804FC5E8
/* 804FE308 004F9B28  3C C0 80 5D */	lis r6, lbl_805D0D40@ha
/* 804FE30C 004F9B2C  3C 80 80 50 */	lis r4, fn_804FE348@ha
/* 804FE310 004F9B30  38 C6 0D 40 */	addi r6, r6, lbl_805D0D40@l
/* 804FE314 004F9B34  38 7F 0E 80 */	addi r3, r31, lbl_80640E80@l
/* 804FE318 004F9B38  38 00 00 FE */	li r0, 0xfe
/* 804FE31C 004F9B3C  3C A0 80 64 */	lis r5, lbl_80640E70@ha
/* 804FE320 004F9B40  90 DF 0E 80 */	stw r6, lbl_80640E80@l(r31)
/* 804FE324 004F9B44  38 84 E3 48 */	addi r4, r4, fn_804FE348@l
/* 804FE328 004F9B48  38 A5 0E 70 */	addi r5, r5, lbl_80640E70@l
/* 804FE32C 004F9B4C  98 03 09 68 */	stb r0, 0x968(r3)
/* 804FE330 004F9B50  4B C0 59 29 */	bl __register_global_object
/* 804FE334 004F9B54  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804FE338 004F9B58  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804FE33C 004F9B5C  7C 08 03 A6 */	mtlr r0
/* 804FE340 004F9B60  38 21 00 10 */	addi r1, r1, 0x10
/* 804FE344 004F9B64  4E 80 00 20 */	blr
.endfn fn_804FE2EC

# 0x805350A4 - 0x805350A8
.section .ctors, "a"
.balign 4
	.4byte fn_804FE2EC