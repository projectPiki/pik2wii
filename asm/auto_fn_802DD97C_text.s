.include "macros.inc"
.file "auto_fn_802DD97C_text"

# 0x802DD97C - 0x802DD9A8
.text
.balign 4

.fn fn_802DD97C, global
/* 802DD97C 002D919C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802DD980 002D91A0  38 00 FF FF */	li r0, -0x1
/* 802DD984 002D91A4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802DD988 002D91A8  3C 80 80 64 */	lis r4, lbl_806390B8@ha
/* 802DD98C 002D91AC  38 64 90 B8 */	addi r3, r4, lbl_806390B8@l
/* 802DD990 002D91B0  90 0D A4 D8 */	stw r0, lbl_8066CCD8@sda21(r0)
/* 802DD994 002D91B4  D0 0D A4 DC */	stfs f0, lbl_8066CCDC@sda21(r0)
/* 802DD998 002D91B8  D0 04 90 B8 */	stfs f0, lbl_806390B8@l(r4)
/* 802DD99C 002D91BC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802DD9A0 002D91C0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802DD9A4 002D91C4  4E 80 00 20 */	blr
.endfn fn_802DD97C

# 0x80534E88 - 0x80534E8C
.section .ctors, "a"
.balign 4
	.4byte fn_802DD97C
