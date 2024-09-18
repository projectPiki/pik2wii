.include "macros.inc"
.file "auto_fn_804FABD4_text"

# 0x800068C8 - 0x800068D0
.section extab, "a"
.balign 4

.obj "@etb_800068C8", local
.hidden "@etb_800068C8"
	.4byte 0x000A0000
	.4byte 0x00000000
.endobj "@etb_800068C8"

# 0x80006D1C - 0x80006D28
.section extabindex, "a"
.balign 4

.obj "@eti_80006D1C", local
.hidden "@eti_80006D1C"
	.4byte fn_804FABD4
	.4byte 0x00000024
	.4byte "@etb_800068C8"
.endobj "@eti_80006D1C"

# 0x804FABD4 - 0x804FABF8
.text
.balign 4

.fn fn_804FABD4, global
/* 804FABD4 004F63F4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804FABD8 004F63F8  7C 08 02 A6 */	mflr r0
/* 804FABDC 004F63FC  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FABE0 004F6400  4B C1 6A D5 */	bl fn_801116B4
/* 804FABE4 004F6404  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804FABE8 004F6408  FC 20 08 18 */	frsp f1, f1
/* 804FABEC 004F640C  7C 08 03 A6 */	mtlr r0
/* 804FABF0 004F6410  38 21 00 10 */	addi r1, r1, 0x10
/* 804FABF4 004F6414  4E 80 00 20 */	blr
.endfn fn_804FABD4
