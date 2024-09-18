.include "macros.inc"
.file "auto_fn_804FB1A0_text"

# 0x80006900 - 0x80006918
.section extab, "a"
.balign 4

.obj "@etb_80006900", local
.hidden "@etb_80006900"
	.4byte 0x08080000
	.4byte 0x00000024
	.4byte 0x00000010
	.4byte 0x00000000
	.4byte 0x8480001F
	.4byte fn_8000A4F4
.endobj "@etb_80006900"

# 0x80006D70 - 0x80006D7C
.section extabindex, "a"
.balign 4

.obj "@eti_80006D70", local
.hidden "@eti_80006D70"
	.4byte fn_804FB1A0
	.4byte 0x00000038
	.4byte "@etb_80006900"
.endobj "@eti_80006D70"

# 0x804FB1A0 - 0x804FB1D8
.text
.balign 4

.fn fn_804FB1A0, global
/* 804FB1A0 004F69C0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 804FB1A4 004F69C4  7C 08 02 A6 */	mflr r0
/* 804FB1A8 004F69C8  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FB1AC 004F69CC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 804FB1B0 004F69D0  7C 7F 1B 78 */	mr r31, r3
/* 804FB1B4 004F69D4  7C 83 23 78 */	mr r3, r4
/* 804FB1B8 004F69D8  7C A4 2B 78 */	mr r4, r5
/* 804FB1BC 004F69DC  7F E5 FB 78 */	mr r5, r31
/* 804FB1C0 004F69E0  4B C2 F1 C9 */	bl fn_8012A388
/* 804FB1C4 004F69E4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 804FB1C8 004F69E8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 804FB1CC 004F69EC  7C 08 03 A6 */	mtlr r0
/* 804FB1D0 004F69F0  38 21 00 10 */	addi r1, r1, 0x10
/* 804FB1D4 004F69F4  4E 80 00 20 */	blr
.endfn fn_804FB1A0
