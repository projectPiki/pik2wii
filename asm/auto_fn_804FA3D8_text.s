.include "macros.inc"
.file "auto_fn_804FA3D8_text"

# 0x80006898 - 0x800068A0
.section extab, "a"
.balign 4

.obj "@etb_80006898", local
.hidden "@etb_80006898"
	.4byte 0x080A0000
	.4byte 0x00000000
.endobj "@etb_80006898"

# 0x80006CD4 - 0x80006CE0
.section extabindex, "a"
.balign 4

.obj "@eti_80006CD4", local
.hidden "@eti_80006CD4"
	.4byte fn_804FA3D8
	.4byte 0x00000040
	.4byte "@etb_80006898"
.endobj "@eti_80006CD4"

# 0x804FA3D8 - 0x804FA418
.text
.balign 4

.fn fn_804FA3D8, global
/* 804FA3D8 004F5BF8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804FA3DC 004F5BFC  7C 08 02 A6 */	mflr r0
/* 804FA3E0 004F5C00  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FA3E4 004F5C04  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804FA3E8 004F5C08  7C 7F 1B 78 */	mr r31, r3
/* 804FA3EC 004F5C0C  48 00 0F D1 */	bl fn_804FB3BC
/* 804FA3F0 004F5C10  C0 02 09 78 */	lfs f0, lbl_80675E58@sda21(r0)
/* 804FA3F4 004F5C14  7F E3 FB 78 */	mr r3, r31
/* 804FA3F8 004F5C18  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 804FA3FC 004F5C1C  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 804FA400 004F5C20  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 804FA404 004F5C24  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804FA408 004F5C28  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804FA40C 004F5C2C  7C 08 03 A6 */	mtlr r0
/* 804FA410 004F5C30  38 21 00 10 */	addi r1, r1, 0x10
/* 804FA414 004F5C34  4E 80 00 20 */	blr
.endfn fn_804FA3D8
