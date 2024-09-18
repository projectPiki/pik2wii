.include "macros.inc"
.file "auto_fn_802C257C_text"

# 0x802C257C - 0x802C25A8
.text
.balign 4

.fn fn_802C257C, global
/* 802C257C 002BDD9C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802C2580 002BDDA0  38 00 FF FF */	li r0, -0x1
/* 802C2584 002BDDA4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802C2588 002BDDA8  3C 80 80 64 */	lis r4, lbl_80638DF8@ha
/* 802C258C 002BDDAC  38 64 8D F8 */	addi r3, r4, lbl_80638DF8@l
/* 802C2590 002BDDB0  90 0D A4 70 */	stw r0, lbl_8066CC70@sda21(r0)
/* 802C2594 002BDDB4  D0 0D A4 74 */	stfs f0, lbl_8066CC74@sda21(r0)
/* 802C2598 002BDDB8  D0 04 8D F8 */	stfs f0, lbl_80638DF8@l(r4)
/* 802C259C 002BDDBC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802C25A0 002BDDC0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802C25A4 002BDDC4  4E 80 00 20 */	blr
.endfn fn_802C257C

# 0x80534E68 - 0x80534E6C
.section .ctors, "a"
.balign 4
	.4byte fn_802C257C
