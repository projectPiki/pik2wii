.include "macros.inc"
.file "auto_fn_8010D7D0_text"

# 0x80006690 - 0x80006698
.section extab, "a"
.balign 4

.obj "@etb_80006690", local
.hidden "@etb_80006690"
	.4byte 0x08080000
	.4byte 0x00000000
.endobj "@etb_80006690"

# 0x80006B78 - 0x80006B84
.section extabindex, "a"
.balign 4

.obj "@eti_80006B78", local
.hidden "@eti_80006B78"
	.4byte fn_8010D7D0
	.4byte 0x00000040
	.4byte "@etb_80006690"
.endobj "@eti_80006B78"

# 0x8010D7D0 - 0x8010D810
.text
.balign 4

.fn fn_8010D7D0, global
/* 8010D7D0 00108FF0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8010D7D4 00108FF4  7C 08 02 A6 */	mflr r0
/* 8010D7D8 00108FF8  90 01 00 24 */	stw r0, 0x24(r1)
/* 8010D7DC 00108FFC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8010D7E0 00109000  7C 7F 1B 78 */	mr r31, r3
/* 8010D7E4 00109004  38 61 00 08 */	addi r3, r1, 0x8
/* 8010D7E8 00109008  48 00 3B DD */	bl fn_801113C4
/* 8010D7EC 0010900C  80 01 00 08 */	lwz r0, 0x8(r1)
/* 8010D7F0 00109010  7C 60 FA 14 */	add r3, r0, r31
/* 8010D7F4 00109014  90 61 00 08 */	stw r3, 0x8(r1)
/* 8010D7F8 00109018  48 00 3C 55 */	bl fn_8011144C
/* 8010D7FC 0010901C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8010D800 00109020  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8010D804 00109024  7C 08 03 A6 */	mtlr r0
/* 8010D808 00109028  38 21 00 20 */	addi r1, r1, 0x20
/* 8010D80C 0010902C  4E 80 00 20 */	blr
.endfn fn_8010D7D0
