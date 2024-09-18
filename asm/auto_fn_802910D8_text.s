.include "macros.inc"
.file "auto_fn_802910D8_text"

# 0x802910D8 - 0x80291104
.text
.balign 4

.fn fn_802910D8, global
/* 802910D8 0028C8F8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802910DC 0028C8FC  38 00 FF FF */	li r0, -0x1
/* 802910E0 0028C900  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802910E4 0028C904  3C 80 80 64 */	lis r4, lbl_80638C70@ha
/* 802910E8 0028C908  38 64 8C 70 */	addi r3, r4, lbl_80638C70@l
/* 802910EC 0028C90C  90 0D A3 50 */	stw r0, lbl_8066CB50@sda21(r0)
/* 802910F0 0028C910  D0 0D A3 54 */	stfs f0, lbl_8066CB54@sda21(r0)
/* 802910F4 0028C914  D0 04 8C 70 */	stfs f0, lbl_80638C70@l(r4)
/* 802910F8 0028C918  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802910FC 0028C91C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80291100 0028C920  4E 80 00 20 */	blr
.endfn fn_802910D8

# 0x80534E00 - 0x80534E04
.section .ctors, "a"
.balign 4
	.4byte fn_802910D8
