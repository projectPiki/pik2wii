.include "macros.inc"
.file "auto_fn_804FAC40_text"

# 0x800068E0 - 0x800068E8
.section extab, "a"
.balign 4

.obj "@etb_800068E0", local
.hidden "@etb_800068E0"
	.4byte 0x000A0000
	.4byte 0x00000000
.endobj "@etb_800068E0"

# 0x80006D40 - 0x80006D4C
.section extabindex, "a"
.balign 4

.obj "@eti_80006D40", local
.hidden "@eti_80006D40"
	.4byte fn_804FAC40
	.4byte 0x00000024
	.4byte "@etb_800068E0"
.endobj "@eti_80006D40"

# 0x804FAC40 - 0x804FAC64
.text
.balign 4

.fn fn_804FAC40, global
/* 804FAC40 004F6460  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804FAC44 004F6464  7C 08 02 A6 */	mflr r0
/* 804FAC48 004F6468  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FAC4C 004F646C  4B C1 6B BD */	bl fn_80111808
/* 804FAC50 004F6470  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804FAC54 004F6474  FC 20 08 18 */	frsp f1, f1
/* 804FAC58 004F6478  7C 08 03 A6 */	mtlr r0
/* 804FAC5C 004F647C  38 21 00 10 */	addi r1, r1, 0x10
/* 804FAC60 004F6480  4E 80 00 20 */	blr
.endfn fn_804FAC40
