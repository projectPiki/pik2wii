.include "macros.inc"
.file "auto_fn_804F94B0_text"

# 0x800067C0 - 0x800067C8
.section extab, "a"
.balign 4

.obj "@etb_800067C0", local
.hidden "@etb_800067C0"
	.4byte 0x10080000
	.4byte 0x00000000
.endobj "@etb_800067C0"

# 0x80006C2C - 0x80006C38
.section extabindex, "a"
.balign 4

.obj "@eti_80006C2C", local
.hidden "@eti_80006C2C"
	.4byte fn_804F94B0
	.4byte 0x00000054
	.4byte "@etb_800067C0"
.endobj "@eti_80006C2C"

# 0x804F94B0 - 0x804F9504
.text
.balign 4

.fn fn_804F94B0, global
/* 804F94B0 004F4CD0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804F94B4 004F4CD4  7C 08 02 A6 */	mflr r0
/* 804F94B8 004F4CD8  90 01 00 14 */	stw r0, 0x14(r1)
/* 804F94BC 004F4CDC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804F94C0 004F4CE0  7C 9F 23 78 */	mr r31, r4
/* 804F94C4 004F4CE4  93 C1 00 08 */	stw r30, 0x8(r1)
/* 804F94C8 004F4CE8  7C 7E 1B 78 */	mr r30, r3
/* 804F94CC 004F4CEC  80 03 00 2C */	lwz r0, 0x2c(r3)
/* 804F94D0 004F4CF0  2C 00 00 00 */	cmpwi r0, 0x0
/* 804F94D4 004F4CF4  41 82 00 0C */	beq .L_804F94E0
/* 804F94D8 004F4CF8  7C 03 03 78 */	mr r3, r0
/* 804F94DC 004F4CFC  48 00 01 11 */	bl fn_804F95EC
.L_804F94E0:
/* 804F94E0 004F4D00  7F C3 F3 78 */	mr r3, r30
/* 804F94E4 004F4D04  7F E4 FB 78 */	mr r4, r31
/* 804F94E8 004F4D08  4B C2 D9 5D */	bl fn_80126E44
/* 804F94EC 004F4D0C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804F94F0 004F4D10  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804F94F4 004F4D14  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 804F94F8 004F4D18  7C 08 03 A6 */	mtlr r0
/* 804F94FC 004F4D1C  38 21 00 10 */	addi r1, r1, 0x10
/* 804F9500 004F4D20  4E 80 00 20 */	blr
.endfn fn_804F94B0
