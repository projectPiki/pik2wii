.include "macros.inc"
.file "auto_fn_804F83EC_text"

# 0x80006698 - 0x800066A0
.section extab, "a"
.balign 4

.obj "@etb_80006698", local
.hidden "@etb_80006698"
	.4byte 0x08080000
	.4byte 0x00000000
.endobj "@etb_80006698"

# 0x80006B84 - 0x80006B90
.section extabindex, "a"
.balign 4

.obj "@eti_80006B84", local
.hidden "@eti_80006B84"
	.4byte fn_804F83EC
	.4byte 0x00000050
	.4byte "@etb_80006698"
.endobj "@eti_80006B84"

# 0x804F83EC - 0x804F843C
.text
.balign 4

.fn fn_804F83EC, global
/* 804F83EC 004F3C0C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804F83F0 004F3C10  7C 08 02 A6 */	mflr r0
/* 804F83F4 004F3C14  90 01 00 14 */	stw r0, 0x14(r1)
/* 804F83F8 004F3C18  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804F83FC 004F3C1C  7C 7F 1B 78 */	mr r31, r3
/* 804F8400 004F3C20  7C 83 23 78 */	mr r3, r4
/* 804F8404 004F3C24  81 84 00 00 */	lwz r12, 0x0(r4)
/* 804F8408 004F3C28  81 8C 00 18 */	lwz r12, 0x18(r12)
/* 804F840C 004F3C2C  7D 89 03 A6 */	mtctr r12
/* 804F8410 004F3C30  4E 80 04 21 */	bctrl
/* 804F8414 004F3C34  81 9F 00 00 */	lwz r12, 0x0(r31)
/* 804F8418 004F3C38  7F E3 FB 78 */	mr r3, r31
/* 804F841C 004F3C3C  81 8C 00 28 */	lwz r12, 0x28(r12)
/* 804F8420 004F3C40  7D 89 03 A6 */	mtctr r12
/* 804F8424 004F3C44  4E 80 04 21 */	bctrl
/* 804F8428 004F3C48  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804F842C 004F3C4C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804F8430 004F3C50  7C 08 03 A6 */	mtlr r0
/* 804F8434 004F3C54  38 21 00 10 */	addi r1, r1, 0x10
/* 804F8438 004F3C58  4E 80 00 20 */	blr
.endfn fn_804F83EC
