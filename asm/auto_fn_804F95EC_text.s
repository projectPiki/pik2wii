.include "macros.inc"
.file "auto_fn_804F95EC_text"

# 0x800067D0 - 0x800067D8
.section extab, "a"
.balign 4

.obj "@etb_800067D0", local
.hidden "@etb_800067D0"
	.4byte 0x08080000
	.4byte 0x00000000
.endobj "@etb_800067D0"

# 0x80006C44 - 0x80006C50
.section extabindex, "a"
.balign 4

.obj "@eti_80006C44", local
.hidden "@eti_80006C44"
	.4byte fn_804F95EC
	.4byte 0x00000044
	.4byte "@etb_800067D0"
.endobj "@eti_80006C44"

# 0x804F95EC - 0x804F9630
.text
.balign 4

.fn fn_804F95EC, global
/* 804F95EC 004F4E0C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804F95F0 004F4E10  7C 08 02 A6 */	mflr r0
/* 804F95F4 004F4E14  90 01 00 14 */	stw r0, 0x14(r1)
/* 804F95F8 004F4E18  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804F95FC 004F4E1C  A0 83 00 14 */	lhz r4, 0x14(r3)
/* 804F9600 004F4E20  7C 04 00 D0 */	neg r0, r4
/* 804F9604 004F4E24  7C 00 23 78 */	or r0, r0, r4
/* 804F9608 004F4E28  54 1F 0F FF */	srwi. r31, r0, 31
/* 804F960C 004F4E2C  41 82 00 0C */	beq .L_804F9618
/* 804F9610 004F4E30  88 83 00 0C */	lbz r4, 0xc(r3)
/* 804F9614 004F4E34  4B C2 D8 AD */	bl fn_80126EC0
.L_804F9618:
/* 804F9618 004F4E38  7F E3 FB 78 */	mr r3, r31
/* 804F961C 004F4E3C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804F9620 004F4E40  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804F9624 004F4E44  7C 08 03 A6 */	mtlr r0
/* 804F9628 004F4E48  38 21 00 10 */	addi r1, r1, 0x10
/* 804F962C 004F4E4C  4E 80 00 20 */	blr
.endfn fn_804F95EC
