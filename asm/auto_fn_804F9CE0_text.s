.include "macros.inc"
.file "auto_fn_804F9CE0_text"

# 0x80006850 - 0x80006858
.section extab, "a"
.balign 4

.obj "@etb_80006850", local
.hidden "@etb_80006850"
	.4byte 0x000A0000
	.4byte 0x00000000
.endobj "@etb_80006850"

# 0x80006C98 - 0x80006CA4
.section extabindex, "a"
.balign 4

.obj "@eti_80006C98", local
.hidden "@eti_80006C98"
	.4byte fn_804F9CE0
	.4byte 0x0000006C
	.4byte "@etb_80006850"
.endobj "@eti_80006C98"

# 0x804F9CE0 - 0x804F9D4C
.text
.balign 4

.fn fn_804F9CE0, global
/* 804F9CE0 004F5500  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 804F9CE4 004F5504  7C 08 02 A6 */	mflr r0
/* 804F9CE8 004F5508  7C 64 1B 78 */	mr r4, r3
/* 804F9CEC 004F550C  90 01 00 54 */	stw r0, 0x54(r1)
/* 804F9CF0 004F5510  88 0D AB B8 */	lbz r0, lbl_8066D3B8@sda21(r0)
/* 804F9CF4 004F5514  2C 00 00 00 */	cmpwi r0, 0x0
/* 804F9CF8 004F5518  41 82 00 0C */	beq .L_804F9D04
/* 804F9CFC 004F551C  C0 4D 8F D0 */	lfs f2, lbl_8066B7D0@sda21(r0)
/* 804F9D00 004F5520  48 00 00 08 */	b .L_804F9D08
.L_804F9D04:
/* 804F9D04 004F5524  C0 42 09 38 */	lfs f2, lbl_80675E18@sda21(r0)
.L_804F9D08:
/* 804F9D08 004F5528  C0 24 00 58 */	lfs f1, 0x58(r4)
/* 804F9D0C 004F552C  38 61 00 08 */	addi r3, r1, 0x8
/* 804F9D10 004F5530  C0 04 00 5C */	lfs f0, 0x5c(r4)
/* 804F9D14 004F5534  EC 61 00 B2 */	fmuls f3, f1, f2
/* 804F9D18 004F5538  C0 24 00 50 */	lfs f1, 0x50(r4)
/* 804F9D1C 004F553C  EC 80 00 B2 */	fmuls f4, f0, f2
/* 804F9D20 004F5540  C0 44 00 54 */	lfs f2, 0x54(r4)
/* 804F9D24 004F5544  C0 A4 00 48 */	lfs f5, 0x48(r4)
/* 804F9D28 004F5548  C0 C4 00 4C */	lfs f6, 0x4c(r4)
/* 804F9D2C 004F554C  4B C3 09 15 */	bl fn_8012A640
/* 804F9D30 004F5550  38 61 00 08 */	addi r3, r1, 0x8
/* 804F9D34 004F5554  38 80 00 01 */	li r4, 0x1
/* 804F9D38 004F5558  4B C2 EB E9 */	bl fn_80128920
/* 804F9D3C 004F555C  80 01 00 54 */	lwz r0, 0x54(r1)
/* 804F9D40 004F5560  7C 08 03 A6 */	mtlr r0
/* 804F9D44 004F5564  38 21 00 50 */	addi r1, r1, 0x50
/* 804F9D48 004F5568  4E 80 00 20 */	blr
.endfn fn_804F9CE0
