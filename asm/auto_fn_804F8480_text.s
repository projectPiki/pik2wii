.include "macros.inc"
.file "auto_fn_804F8480_text"

# 0x800066A8 - 0x800066B0
.section extab, "a"
.balign 4

.obj "@etb_800066A8", local
.hidden "@etb_800066A8"
	.4byte 0x080A0000
	.4byte 0x00000000
.endobj "@etb_800066A8"

# 0x80006B9C - 0x80006BA8
.section extabindex, "a"
.balign 4

.obj "@eti_80006B9C", local
.hidden "@eti_80006B9C"
	.4byte fn_804F8480
	.4byte 0x00000054
	.4byte "@etb_800066A8"
.endobj "@eti_80006B9C"

# 0x804F8480 - 0x804F84D4
.text
.balign 4

.fn fn_804F8480, global
/* 804F8480 004F3CA0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804F8484 004F3CA4  7C 08 02 A6 */	mflr r0
/* 804F8488 004F3CA8  90 01 00 14 */	stw r0, 0x14(r1)
/* 804F848C 004F3CAC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804F8490 004F3CB0  7C 7F 1B 78 */	mr r31, r3
/* 804F8494 004F3CB4  7C 83 23 78 */	mr r3, r4
/* 804F8498 004F3CB8  81 84 00 00 */	lwz r12, 0x0(r4)
/* 804F849C 004F3CBC  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 804F84A0 004F3CC0  7D 89 03 A6 */	mtctr r12
/* 804F84A4 004F3CC4  4E 80 04 21 */	bctrl
/* 804F84A8 004F3CC8  C0 43 00 28 */	lfs f2, 0x28(r3)
/* 804F84AC 004F3CCC  C0 23 00 24 */	lfs f1, 0x24(r3)
/* 804F84B0 004F3CD0  C0 03 00 20 */	lfs f0, 0x20(r3)
/* 804F84B4 004F3CD4  D0 1F 00 00 */	stfs f0, 0x0(r31)
/* 804F84B8 004F3CD8  D0 3F 00 04 */	stfs f1, 0x4(r31)
/* 804F84BC 004F3CDC  D0 5F 00 08 */	stfs f2, 0x8(r31)
/* 804F84C0 004F3CE0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804F84C4 004F3CE4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804F84C8 004F3CE8  7C 08 03 A6 */	mtlr r0
/* 804F84CC 004F3CEC  38 21 00 10 */	addi r1, r1, 0x10
/* 804F84D0 004F3CF0  4E 80 00 20 */	blr
.endfn fn_804F8480
