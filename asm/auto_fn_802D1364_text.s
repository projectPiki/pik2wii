.include "macros.inc"
.file "auto_fn_802D1364_text"

# 0x802D1364 - 0x802D1390
.text
.balign 4

.fn fn_802D1364, global
/* 802D1364 002CCB84  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802D1368 002CCB88  38 00 FF FF */	li r0, -0x1
/* 802D136C 002CCB8C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802D1370 002CCB90  3C 80 80 64 */	lis r4, lbl_80639088@ha
/* 802D1374 002CCB94  38 64 90 88 */	addi r3, r4, lbl_80639088@l
/* 802D1378 002CCB98  90 0D A4 B0 */	stw r0, lbl_8066CCB0@sda21(r0)
/* 802D137C 002CCB9C  D0 0D A4 B4 */	stfs f0, lbl_8066CCB4@sda21(r0)
/* 802D1380 002CCBA0  D0 04 90 88 */	stfs f0, lbl_80639088@l(r4)
/* 802D1384 002CCBA4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802D1388 002CCBA8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802D138C 002CCBAC  4E 80 00 20 */	blr
.endfn fn_802D1364

# 0x80534E7C - 0x80534E80
.section .ctors, "a"
.balign 4
	.4byte fn_802D1364
