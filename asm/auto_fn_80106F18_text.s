.include "macros.inc"
.file "auto_fn_80106F18_text"

# 0x800065A0 - 0x800065A8
.section extab, "a"
.balign 4

.obj "@etb_800065A0", local
.hidden "@etb_800065A0"
	.4byte 0x18080000
	.4byte 0x00000000
.endobj "@etb_800065A0"

# 0x80006A10 - 0x80006A1C
.section extabindex, "a"
.balign 4

.obj "@eti_80006A10", local
.hidden "@eti_80006A10"
	.4byte fn_80106F18
	.4byte 0x000000BC
	.4byte "@etb_800065A0"
.endobj "@eti_80006A10"

# 0x80106F18 - 0x80106FD4
.text
.balign 4

.fn fn_80106F18, global
/* 80106F18 00102738  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80106F1C 0010273C  7C 08 02 A6 */	mflr r0
/* 80106F20 00102740  2C 03 00 00 */	cmpwi r3, 0x0
/* 80106F24 00102744  90 01 00 24 */	stw r0, 0x24(r1)
/* 80106F28 00102748  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80106F2C 0010274C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80106F30 00102750  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80106F34 00102754  7C 7D 1B 78 */	mr r29, r3
/* 80106F38 00102758  40 82 00 0C */	bne .L_80106F44
/* 80106F3C 0010275C  38 60 FF FF */	li r3, -0x1
/* 80106F40 00102760  48 00 00 78 */	b .L_80106FB8
.L_80106F44:
/* 80106F44 00102764  80 03 00 04 */	lwz r0, 0x4(r3)
/* 80106F48 00102768  54 00 57 7F */	extrwi. r0, r0, 3, 7
/* 80106F4C 0010276C  40 82 00 0C */	bne .L_80106F58
/* 80106F50 00102770  38 60 00 00 */	li r3, 0x0
/* 80106F54 00102774  48 00 00 64 */	b .L_80106FB8
.L_80106F58:
/* 80106F58 00102778  48 00 00 7D */	bl fn_80106FD4
/* 80106F5C 0010277C  81 9D 00 44 */	lwz r12, 0x44(r29)
/* 80106F60 00102780  7C 7E 1B 78 */	mr r30, r3
/* 80106F64 00102784  80 7D 00 00 */	lwz r3, 0x0(r29)
/* 80106F68 00102788  7D 89 03 A6 */	mtctr r12
/* 80106F6C 0010278C  4E 80 04 21 */	bctrl
/* 80106F70 00102790  80 1D 00 08 */	lwz r0, 0x8(r29)
/* 80106F74 00102794  38 A0 00 00 */	li r5, 0x0
/* 80106F78 00102798  80 9D 00 04 */	lwz r4, 0x4(r29)
/* 80106F7C 0010279C  7C 7F 1B 78 */	mr r31, r3
/* 80106F80 001027A0  54 00 27 FF */	extrwi. r0, r0, 1, 3
/* 80106F84 001027A4  90 BD 00 00 */	stw r5, 0x0(r29)
/* 80106F88 001027A8  54 84 02 8C */	rlwinm r4, r4, 0, 10, 6
/* 80106F8C 001027AC  90 9D 00 04 */	stw r4, 0x4(r29)
/* 80106F90 001027B0  41 82 00 0C */	beq .L_80106F9C
/* 80106F94 001027B4  80 7D 00 1C */	lwz r3, 0x1c(r29)
/* 80106F98 001027B8  4B FF DF 45 */	bl fn_80104EDC
.L_80106F9C:
/* 80106F9C 001027BC  2C 1E 00 00 */	cmpwi r30, 0x0
/* 80106FA0 001027C0  38 00 00 00 */	li r0, 0x0
/* 80106FA4 001027C4  40 82 00 0C */	bne .L_80106FB0
/* 80106FA8 001027C8  2C 1F 00 00 */	cmpwi r31, 0x0
/* 80106FAC 001027CC  41 82 00 08 */	beq .L_80106FB4
.L_80106FB0:
/* 80106FB0 001027D0  38 00 00 01 */	li r0, 0x1
.L_80106FB4:
/* 80106FB4 001027D4  7C 60 00 D0 */	neg r3, r0
.L_80106FB8:
/* 80106FB8 001027D8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80106FBC 001027DC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80106FC0 001027E0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80106FC4 001027E4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80106FC8 001027E8  7C 08 03 A6 */	mtlr r0
/* 80106FCC 001027EC  38 21 00 20 */	addi r1, r1, 0x20
/* 80106FD0 001027F0  4E 80 00 20 */	blr
.endfn fn_80106F18