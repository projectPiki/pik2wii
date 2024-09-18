.include "macros.inc"
.file "auto_fn_804FA418_text"

# 0x800068A0 - 0x800068A8
.section extab, "a"
.balign 4

.obj "@etb_800068A0", local
.hidden "@etb_800068A0"
	.4byte 0x000A0000
	.4byte 0x00000000
.endobj "@etb_800068A0"

# 0x80006CE0 - 0x80006CEC
.section extabindex, "a"
.balign 4

.obj "@eti_80006CE0", local
.hidden "@eti_80006CE0"
	.4byte fn_804FA418
	.4byte 0x00000084
	.4byte "@etb_800068A0"
.endobj "@eti_80006CE0"

# 0x804FA418 - 0x804FA49C
.text
.balign 4

.fn fn_804FA418, global
/* 804FA418 004F5C38  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 804FA41C 004F5C3C  3D 20 43 30 */	lis r9, 0x4330
/* 804FA420 004F5C40  6C 88 80 00 */	xoris r8, r4, 0x8000
/* 804FA424 004F5C44  6C A5 80 00 */	xoris r5, r5, 0x8000
/* 804FA428 004F5C48  91 21 00 08 */	stw r9, 0x8(r1)
/* 804FA42C 004F5C4C  6C C4 80 00 */	xoris r4, r6, 0x8000
/* 804FA430 004F5C50  C8 82 09 80 */	lfd f4, lbl_80675E60@sda21(r0)
/* 804FA434 004F5C54  6C E0 80 00 */	xoris r0, r7, 0x8000
/* 804FA438 004F5C58  91 01 00 0C */	stw r8, 0xc(r1)
/* 804FA43C 004F5C5C  C8 01 00 08 */	lfd f0, 0x8(r1)
/* 804FA440 004F5C60  91 21 00 10 */	stw r9, 0x10(r1)
/* 804FA444 004F5C64  EC 60 20 28 */	fsubs f3, f0, f4
/* 804FA448 004F5C68  90 A1 00 14 */	stw r5, 0x14(r1)
/* 804FA44C 004F5C6C  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 804FA450 004F5C70  90 81 00 0C */	stw r4, 0xc(r1)
/* 804FA454 004F5C74  EC 40 20 28 */	fsubs f2, f0, f4
/* 804FA458 004F5C78  90 01 00 14 */	stw r0, 0x14(r1)
/* 804FA45C 004F5C7C  C8 21 00 08 */	lfd f1, 0x8(r1)
/* 804FA460 004F5C80  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 804FA464 004F5C84  EC 21 20 28 */	fsubs f1, f1, f4
/* 804FA468 004F5C88  D0 63 00 00 */	stfs f3, 0x0(r3)
/* 804FA46C 004F5C8C  EC 00 20 28 */	fsubs f0, f0, f4
/* 804FA470 004F5C90  D0 43 00 04 */	stfs f2, 0x4(r3)
/* 804FA474 004F5C94  EC 61 18 28 */	fsubs f3, f1, f3
/* 804FA478 004F5C98  EC 40 10 28 */	fsubs f2, f0, f2
/* 804FA47C 004F5C9C  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 804FA480 004F5CA0  D0 23 00 08 */	stfs f1, 0x8(r3)
/* 804FA484 004F5CA4  EC 03 10 24 */	fdivs f0, f3, f2
/* 804FA488 004F5CA8  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 804FA48C 004F5CAC  D0 43 00 14 */	stfs f2, 0x14(r3)
/* 804FA490 004F5CB0  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 804FA494 004F5CB4  38 21 00 20 */	addi r1, r1, 0x20
/* 804FA498 004F5CB8  4E 80 00 20 */	blr
.endfn fn_804FA418
