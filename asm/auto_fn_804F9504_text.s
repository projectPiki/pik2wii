.include "macros.inc"
.file "auto_fn_804F9504_text"

# 0x800067C8 - 0x800067D0
.section extab, "a"
.balign 4

.obj "@etb_800067C8", local
.hidden "@etb_800067C8"
	.4byte 0x20080000
	.4byte 0x00000000
.endobj "@etb_800067C8"

# 0x80006C38 - 0x80006C44
.section extabindex, "a"
.balign 4

.obj "@eti_80006C38", local
.hidden "@eti_80006C38"
	.4byte fn_804F9504
	.4byte 0x000000C4
	.4byte "@etb_800067C8"
.endobj "@eti_80006C38"

# 0x804F9504 - 0x804F95C8
.text
.balign 4

.fn fn_804F9504, global
/* 804F9504 004F4D24  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 804F9508 004F4D28  7C 08 02 A6 */	mflr r0
/* 804F950C 004F4D2C  90 01 00 24 */	stw r0, 0x24(r1)
/* 804F9510 004F4D30  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 804F9514 004F4D34  7D 1F 43 78 */	mr r31, r8
/* 804F9518 004F4D38  93 C1 00 18 */	stw r30, 0x18(r1)
/* 804F951C 004F4D3C  7C FE 3B 78 */	mr r30, r7
/* 804F9520 004F4D40  93 A1 00 14 */	stw r29, 0x14(r1)
/* 804F9524 004F4D44  7C DD 33 78 */	mr r29, r6
/* 804F9528 004F4D48  93 81 00 10 */	stw r28, 0x10(r1)
/* 804F952C 004F4D4C  7C 7C 1B 78 */	mr r28, r3
/* 804F9530 004F4D50  88 03 00 3B */	lbz r0, 0x3b(r3)
/* 804F9534 004F4D54  54 00 07 FF */	clrlwi. r0, r0, 31
/* 804F9538 004F4D58  41 82 00 70 */	beq .L_804F95A8
/* 804F953C 004F4D5C  2C 07 00 00 */	cmpwi r7, 0x0
/* 804F9540 004F4D60  41 82 00 28 */	beq .L_804F9568
/* 804F9544 004F4D64  80 C3 00 20 */	lwz r6, 0x20(r3)
/* 804F9548 004F4D68  54 83 04 3E */	clrlwi r3, r4, 16
/* 804F954C 004F4D6C  54 A4 04 3E */	clrlwi r4, r5, 16
/* 804F9550 004F4D70  A0 A6 00 02 */	lhz r5, 0x2(r6)
/* 804F9554 004F4D74  A0 06 00 04 */	lhz r0, 0x4(r6)
/* 804F9558 004F4D78  54 A5 0C 3C */	clrlslwi r5, r5, 17, 1
/* 804F955C 004F4D7C  54 06 0C 3C */	clrlslwi r6, r0, 17, 1
/* 804F9560 004F4D80  4B C2 BF 5D */	bl fn_801254BC
/* 804F9564 004F4D84  48 00 00 1C */	b .L_804F9580
.L_804F9568:
/* 804F9568 004F4D88  80 C3 00 20 */	lwz r6, 0x20(r3)
/* 804F956C 004F4D8C  54 83 04 3E */	clrlwi r3, r4, 16
/* 804F9570 004F4D90  54 A4 04 3E */	clrlwi r4, r5, 16
/* 804F9574 004F4D94  A0 A6 00 02 */	lhz r5, 0x2(r6)
/* 804F9578 004F4D98  A0 C6 00 04 */	lhz r6, 0x4(r6)
/* 804F957C 004F4D9C  4B C2 BF 41 */	bl fn_801254BC
.L_804F9580:
/* 804F9580 004F4DA0  80 9C 00 20 */	lwz r4, 0x20(r28)
/* 804F9584 004F4DA4  7F A5 EB 78 */	mr r5, r29
/* 804F9588 004F4DA8  57 C6 06 3E */	clrlwi r6, r30, 24
/* 804F958C 004F4DAC  A0 64 00 02 */	lhz r3, 0x2(r4)
/* 804F9590 004F4DB0  A0 84 00 04 */	lhz r4, 0x4(r4)
/* 804F9594 004F4DB4  4B C2 BF 8D */	bl fn_80125520
/* 804F9598 004F4DB8  80 7C 00 24 */	lwz r3, 0x24(r28)
/* 804F959C 004F4DBC  7F E4 FB 78 */	mr r4, r31
/* 804F95A0 004F4DC0  4B C2 C8 19 */	bl fn_80125DB8
/* 804F95A4 004F4DC4  4B C2 B5 F1 */	bl fn_80124B94
.L_804F95A8:
/* 804F95A8 004F4DC8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 804F95AC 004F4DCC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 804F95B0 004F4DD0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 804F95B4 004F4DD4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 804F95B8 004F4DD8  83 81 00 10 */	lwz r28, 0x10(r1)
/* 804F95BC 004F4DDC  7C 08 03 A6 */	mtlr r0
/* 804F95C0 004F4DE0  38 21 00 20 */	addi r1, r1, 0x20
/* 804F95C4 004F4DE4  4E 80 00 20 */	blr
.endfn fn_804F9504