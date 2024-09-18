.include "macros.inc"
.file "auto_fn_804FAC1C_text"

# 0x800068D8 - 0x800068E0
.section extab, "a"
.balign 4

.obj "@etb_800068D8", local
.hidden "@etb_800068D8"
	.4byte 0x000A0000
	.4byte 0x00000000
.endobj "@etb_800068D8"

# 0x80006D34 - 0x80006D40
.section extabindex, "a"
.balign 4

.obj "@eti_80006D34", local
.hidden "@eti_80006D34"
	.4byte fn_804FAC1C
	.4byte 0x00000024
	.4byte "@etb_800068D8"
.endobj "@eti_80006D34"

# 0x804FAC1C - 0x804FAC40
.text
.balign 4

.fn fn_804FAC1C, global
/* 804FAC1C 004F643C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804FAC20 004F6440  7C 08 02 A6 */	mflr r0
/* 804FAC24 004F6444  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FAC28 004F6448  4B C1 6B 65 */	bl fn_8011178C
/* 804FAC2C 004F644C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804FAC30 004F6450  FC 20 08 18 */	frsp f1, f1
/* 804FAC34 004F6454  7C 08 03 A6 */	mtlr r0
/* 804FAC38 004F6458  38 21 00 10 */	addi r1, r1, 0x10
/* 804FAC3C 004F645C  4E 80 00 20 */	blr
.endfn fn_804FAC1C
