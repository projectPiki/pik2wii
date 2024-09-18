.include "macros.inc"
.file "auto_fn_804F84D4_text"

# 0x800066B0 - 0x800066B8
.section extab, "a"
.balign 4

.obj "@etb_800066B0", local
.hidden "@etb_800066B0"
	.4byte 0x080A0000
	.4byte 0x00000000
.endobj "@etb_800066B0"

# 0x80006BA8 - 0x80006BB4
.section extabindex, "a"
.balign 4

.obj "@eti_80006BA8", local
.hidden "@eti_80006BA8"
	.4byte fn_804F84D4
	.4byte 0x00000054
	.4byte "@etb_800066B0"
.endobj "@eti_80006BA8"

# 0x804F84D4 - 0x804F8528
.text
.balign 4

.fn fn_804F84D4, global
/* 804F84D4 004F3CF4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804F84D8 004F3CF8  7C 08 02 A6 */	mflr r0
/* 804F84DC 004F3CFC  90 01 00 14 */	stw r0, 0x14(r1)
/* 804F84E0 004F3D00  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804F84E4 004F3D04  7C 7F 1B 78 */	mr r31, r3
/* 804F84E8 004F3D08  7C 83 23 78 */	mr r3, r4
/* 804F84EC 004F3D0C  81 84 00 00 */	lwz r12, 0x0(r4)
/* 804F84F0 004F3D10  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 804F84F4 004F3D14  7D 89 03 A6 */	mtctr r12
/* 804F84F8 004F3D18  4E 80 04 21 */	bctrl
/* 804F84FC 004F3D1C  C0 43 00 08 */	lfs f2, 0x8(r3)
/* 804F8500 004F3D20  C0 23 00 04 */	lfs f1, 0x4(r3)
/* 804F8504 004F3D24  C0 03 00 00 */	lfs f0, 0x0(r3)
/* 804F8508 004F3D28  D0 1F 00 00 */	stfs f0, 0x0(r31)
/* 804F850C 004F3D2C  D0 3F 00 04 */	stfs f1, 0x4(r31)
/* 804F8510 004F3D30  D0 5F 00 08 */	stfs f2, 0x8(r31)
/* 804F8514 004F3D34  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804F8518 004F3D38  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804F851C 004F3D3C  7C 08 03 A6 */	mtlr r0
/* 804F8520 004F3D40  38 21 00 10 */	addi r1, r1, 0x10
/* 804F8524 004F3D44  4E 80 00 20 */	blr
.endfn fn_804F84D4
