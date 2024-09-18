.include "macros.inc"
.file "auto_fn_804BA424_text"

# 0x804BA424 - 0x804BA46C
.text
.balign 4

.fn fn_804BA424, global
/* 804BA424 004B5C44  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804BA428 004B5C48  7C 08 02 A6 */	mflr r0
/* 804BA42C 004B5C4C  90 01 00 14 */	stw r0, 0x14(r1)
/* 804BA430 004B5C50  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804BA434 004B5C54  3F E0 80 67 */	lis r31, lbl_8066A350@ha
/* 804BA438 004B5C58  38 7F A3 50 */	addi r3, r31, lbl_8066A350@l
/* 804BA43C 004B5C5C  4B FF F9 85 */	bl fn_804B9DC0
/* 804BA440 004B5C60  3C 80 80 4C */	lis r4, fn_804BA46C@ha
/* 804BA444 004B5C64  3C A0 80 64 */	lis r5, lbl_80639590@ha
/* 804BA448 004B5C68  38 7F A3 50 */	addi r3, r31, lbl_8066A350@l
/* 804BA44C 004B5C6C  38 84 A4 6C */	addi r4, r4, fn_804BA46C@l
/* 804BA450 004B5C70  38 A5 95 90 */	addi r5, r5, lbl_80639590@l
/* 804BA454 004B5C74  4B C4 98 05 */	bl __register_global_object
/* 804BA458 004B5C78  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804BA45C 004B5C7C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804BA460 004B5C80  7C 08 03 A6 */	mtlr r0
/* 804BA464 004B5C84  38 21 00 10 */	addi r1, r1, 0x10
/* 804BA468 004B5C88  4E 80 00 20 */	blr
.endfn fn_804BA424

# 0x8053504C - 0x80535050
.section .ctors, "a"
.balign 4
	.4byte fn_804BA424
