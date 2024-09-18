.include "macros.inc"
.file "auto_fn_8001B550_text"

# 0x8001B550 - 0x8001B598
.text
.balign 4

.fn fn_8001B550, global
/* 8001B550 00016D70  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8001B554 00016D74  7C 08 02 A6 */	mflr r0
/* 8001B558 00016D78  90 01 00 14 */	stw r0, 0x14(r1)
/* 8001B55C 00016D7C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8001B560 00016D80  3F E0 80 66 */	lis r31, lbl_8065F414@ha
/* 8001B564 00016D84  38 7F F4 14 */	addi r3, r31, lbl_8065F414@l
/* 8001B568 00016D88  4B FF D8 51 */	bl fn_80018DB8
/* 8001B56C 00016D8C  3C 80 80 02 */	lis r4, fn_80018E04@ha
/* 8001B570 00016D90  3C A0 80 5D */	lis r5, lbl_805D1C88@ha
/* 8001B574 00016D94  38 7F F4 14 */	addi r3, r31, lbl_8065F414@l
/* 8001B578 00016D98  38 84 8E 04 */	addi r4, r4, fn_80018E04@l
/* 8001B57C 00016D9C  38 A5 1C 88 */	addi r5, r5, lbl_805D1C88@l
/* 8001B580 00016DA0  48 0E 86 D9 */	bl __register_global_object
/* 8001B584 00016DA4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8001B588 00016DA8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8001B58C 00016DAC  7C 08 03 A6 */	mtlr r0
/* 8001B590 00016DB0  38 21 00 10 */	addi r1, r1, 0x10
/* 8001B594 00016DB4  4E 80 00 20 */	blr
.endfn fn_8001B550

# 0x80534C94 - 0x80534C98
.section .ctors, "a"
.balign 4
	.4byte fn_8001B550
