.include "macros.inc"
.file "auto_fn_804F8528_text"

# 0x800066B8 - 0x800066C0
.section extab, "a"
.balign 4

.obj "@etb_800066B8", local
.hidden "@etb_800066B8"
	.4byte 0x080A0000
	.4byte 0x00000000
.endobj "@etb_800066B8"

# 0x80006BB4 - 0x80006BC0
.section extabindex, "a"
.balign 4

.obj "@eti_80006BB4", local
.hidden "@eti_80006BB4"
	.4byte fn_804F8528
	.4byte 0x00000054
	.4byte "@etb_800066B8"
.endobj "@eti_80006BB4"

# 0x804F8528 - 0x804F857C
.text
.balign 4

.fn fn_804F8528, global
/* 804F8528 004F3D48  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804F852C 004F3D4C  7C 08 02 A6 */	mflr r0
/* 804F8530 004F3D50  90 01 00 14 */	stw r0, 0x14(r1)
/* 804F8534 004F3D54  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804F8538 004F3D58  7C 7F 1B 78 */	mr r31, r3
/* 804F853C 004F3D5C  7C 83 23 78 */	mr r3, r4
/* 804F8540 004F3D60  81 84 00 00 */	lwz r12, 0x0(r4)
/* 804F8544 004F3D64  81 8C 00 08 */	lwz r12, 0x8(r12)
/* 804F8548 004F3D68  7D 89 03 A6 */	mtctr r12
/* 804F854C 004F3D6C  4E 80 04 21 */	bctrl
/* 804F8550 004F3D70  C0 43 00 18 */	lfs f2, 0x18(r3)
/* 804F8554 004F3D74  C0 23 00 14 */	lfs f1, 0x14(r3)
/* 804F8558 004F3D78  C0 03 00 10 */	lfs f0, 0x10(r3)
/* 804F855C 004F3D7C  D0 1F 00 00 */	stfs f0, 0x0(r31)
/* 804F8560 004F3D80  D0 3F 00 04 */	stfs f1, 0x4(r31)
/* 804F8564 004F3D84  D0 5F 00 08 */	stfs f2, 0x8(r31)
/* 804F8568 004F3D88  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804F856C 004F3D8C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804F8570 004F3D90  7C 08 03 A6 */	mtlr r0
/* 804F8574 004F3D94  38 21 00 10 */	addi r1, r1, 0x10
/* 804F8578 004F3D98  4E 80 00 20 */	blr
.endfn fn_804F8528
