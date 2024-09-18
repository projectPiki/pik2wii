.include "macros.inc"
.file "auto_fn_804973C0_text"

# 0x804973C0 - 0x80497404
.text
.balign 4

.fn fn_804973C0, global
/* 804973C0 00492BE0  3C C0 80 67 */	lis r6, lbl_8066A2CC@ha
/* 804973C4 00492BE4  C0 62 FF D4 */	lfs f3, lbl_806754B4@sda21(r0)
/* 804973C8 00492BE8  C0 42 FF E0 */	lfs f2, lbl_806754C0@sda21(r0)
/* 804973CC 00492BEC  38 A6 A2 CC */	addi r5, r6, lbl_8066A2CC@l
/* 804973D0 00492BF0  C0 22 FF E4 */	lfs f1, lbl_806754C4@sda21(r0)
/* 804973D4 00492BF4  38 80 00 3C */	li r4, 0x3c
/* 804973D8 00492BF8  C0 02 FF E8 */	lfs f0, lbl_806754C8@sda21(r0)
/* 804973DC 00492BFC  38 60 00 B4 */	li r3, 0xb4
/* 804973E0 00492C00  38 00 00 10 */	li r0, 0x10
/* 804973E4 00492C04  D0 66 A2 CC */	stfs f3, lbl_8066A2CC@l(r6)
/* 804973E8 00492C08  D0 45 00 04 */	stfs f2, 0x4(r5)
/* 804973EC 00492C0C  D0 25 00 08 */	stfs f1, 0x8(r5)
/* 804973F0 00492C10  D0 05 00 0C */	stfs f0, 0xc(r5)
/* 804973F4 00492C14  90 85 00 10 */	stw r4, 0x10(r5)
/* 804973F8 00492C18  90 65 00 14 */	stw r3, 0x14(r5)
/* 804973FC 00492C1C  98 05 00 18 */	stb r0, 0x18(r5)
/* 80497400 00492C20  4E 80 00 20 */	blr
.endfn fn_804973C0

# 0x80535000 - 0x80535004
.section .ctors, "a"
.balign 4
	.4byte fn_804973C0
