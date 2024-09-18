.include "macros.inc"
.file "auto_fn_804F8780_text"

# 0x800066F8 - 0x80006700
.section extab, "a"
.balign 4

.obj "@etb_800066F8", local
.hidden "@etb_800066F8"
	.4byte 0x08080000
	.4byte 0x00000000
.endobj "@etb_800066F8"

# 0x80006BCC - 0x80006BD8
.section extabindex, "a"
.balign 4

.obj "@eti_80006BCC", local
.hidden "@eti_80006BCC"
	.4byte fn_804F8780
	.4byte 0x0000004C
	.4byte "@etb_800066F8"
.endobj "@eti_80006BCC"

# 0x804F8780 - 0x804F87CC
.text
.balign 4

.fn fn_804F8780, global
/* 804F8780 004F3FA0  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 804F8784 004F3FA4  7C 08 02 A6 */	mflr r0
/* 804F8788 004F3FA8  38 80 00 00 */	li r4, 0x0
/* 804F878C 004F3FAC  90 01 00 44 */	stw r0, 0x44(r1)
/* 804F8790 004F3FB0  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 804F8794 004F3FB4  7C 7F 1B 78 */	mr r31, r3
/* 804F8798 004F3FB8  38 63 00 04 */	addi r3, r3, 0x4
/* 804F879C 004F3FBC  4B C3 02 35 */	bl fn_801289D0
/* 804F87A0 004F3FC0  38 7F 00 04 */	addi r3, r31, 0x4
/* 804F87A4 004F3FC4  38 81 00 08 */	addi r4, r1, 0x8
/* 804F87A8 004F3FC8  48 00 24 BD */	bl fn_804FAC64
/* 804F87AC 004F3FCC  38 61 00 08 */	addi r3, r1, 0x8
/* 804F87B0 004F3FD0  38 80 00 00 */	li r4, 0x0
/* 804F87B4 004F3FD4  4B C3 02 99 */	bl fn_80128A4C
/* 804F87B8 004F3FD8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 804F87BC 004F3FDC  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 804F87C0 004F3FE0  7C 08 03 A6 */	mtlr r0
/* 804F87C4 004F3FE4  38 21 00 40 */	addi r1, r1, 0x40
/* 804F87C8 004F3FE8  4E 80 00 20 */	blr
.endfn fn_804F8780
