.include "macros.inc"
.file "auto_fn_804F843C_text"

# 0x800066A0 - 0x800066A8
.section extab, "a"
.balign 4

.obj "@etb_800066A0", local
.hidden "@etb_800066A0"
	.4byte 0x08080000
	.4byte 0x00000000
.endobj "@etb_800066A0"

# 0x80006B90 - 0x80006B9C
.section extabindex, "a"
.balign 4

.obj "@eti_80006B90", local
.hidden "@eti_80006B90"
	.4byte fn_804F843C
	.4byte 0x00000044
	.4byte "@etb_800066A0"
.endobj "@eti_80006B90"

# 0x804F843C - 0x804F8480
.text
.balign 4

.fn fn_804F843C, global
/* 804F843C 004F3C5C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804F8440 004F3C60  7C 08 02 A6 */	mflr r0
/* 804F8444 004F3C64  90 01 00 14 */	stw r0, 0x14(r1)
/* 804F8448 004F3C68  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804F844C 004F3C6C  7C 9F 23 78 */	mr r31, r4
/* 804F8450 004F3C70  81 83 00 00 */	lwz r12, 0x0(r3)
/* 804F8454 004F3C74  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 804F8458 004F3C78  7D 89 03 A6 */	mtctr r12
/* 804F845C 004F3C7C  4E 80 04 21 */	bctrl
/* 804F8460 004F3C80  7C 64 1B 78 */	mr r4, r3
/* 804F8464 004F3C84  7F E3 FB 78 */	mr r3, r31
/* 804F8468 004F3C88  48 02 54 ED */	bl fn_8051D954
/* 804F846C 004F3C8C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804F8470 004F3C90  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804F8474 004F3C94  7C 08 03 A6 */	mtlr r0
/* 804F8478 004F3C98  38 21 00 10 */	addi r1, r1, 0x10
/* 804F847C 004F3C9C  4E 80 00 20 */	blr
.endfn fn_804F843C
