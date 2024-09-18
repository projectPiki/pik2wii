.include "macros.inc"
.file "auto_fn_804FABF8_text"

# 0x800068D0 - 0x800068D8
.section extab, "a"
.balign 4

.obj "@etb_800068D0", local
.hidden "@etb_800068D0"
	.4byte 0x000A0000
	.4byte 0x00000000
.endobj "@etb_800068D0"

# 0x80006D28 - 0x80006D34
.section extabindex, "a"
.balign 4

.obj "@eti_80006D28", local
.hidden "@eti_80006D28"
	.4byte fn_804FABF8
	.4byte 0x00000024
	.4byte "@etb_800068D0"
.endobj "@eti_80006D28"

# 0x804FABF8 - 0x804FAC1C
.text
.balign 4

.fn fn_804FABF8, global
/* 804FABF8 004F6418  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804FABFC 004F641C  7C 08 02 A6 */	mflr r0
/* 804FAC00 004F6420  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FAC04 004F6424  4B C1 65 A9 */	bl fn_801111AC
/* 804FAC08 004F6428  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804FAC0C 004F642C  FC 20 08 18 */	frsp f1, f1
/* 804FAC10 004F6430  7C 08 03 A6 */	mtlr r0
/* 804FAC14 004F6434  38 21 00 10 */	addi r1, r1, 0x10
/* 804FAC18 004F6438  4E 80 00 20 */	blr
.endfn fn_804FABF8
