.include "macros.inc"
.file "auto_fn_80280580_text"

# 0x80280580 - 0x802805AC
.text
.balign 4

.fn fn_80280580, global
/* 80280580 0027BDA0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80280584 0027BDA4  38 00 FF FF */	li r0, -0x1
/* 80280588 0027BDA8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8028058C 0027BDAC  3C 80 80 64 */	lis r4, lbl_80638C10@ha
/* 80280590 0027BDB0  38 64 8C 10 */	addi r3, r4, lbl_80638C10@l
/* 80280594 0027BDB4  90 0D A2 E0 */	stw r0, lbl_8066CAE0@sda21(r0)
/* 80280598 0027BDB8  D0 0D A2 E4 */	stfs f0, lbl_8066CAE4@sda21(r0)
/* 8028059C 0027BDBC  D0 04 8C 10 */	stfs f0, lbl_80638C10@l(r4)
/* 802805A0 0027BDC0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802805A4 0027BDC4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802805A8 0027BDC8  4E 80 00 20 */	blr
.endfn fn_80280580

# 0x80534DE8 - 0x80534DEC
.section .ctors, "a"
.balign 4
	.4byte fn_80280580
