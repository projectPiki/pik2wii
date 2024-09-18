.include "macros.inc"
.file "auto_fn_8025FA90_text"

# 0x8025FA90 - 0x8025FABC
.text
.balign 4

.fn fn_8025FA90, global
/* 8025FA90 0025B2B0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8025FA94 0025B2B4  38 00 FF FF */	li r0, -0x1
/* 8025FA98 0025B2B8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8025FA9C 0025B2BC  3C 80 80 64 */	lis r4, lbl_80638BA0@ha
/* 8025FAA0 0025B2C0  38 64 8B A0 */	addi r3, r4, lbl_80638BA0@l
/* 8025FAA4 0025B2C4  90 0D A2 48 */	stw r0, lbl_8066CA48@sda21(r0)
/* 8025FAA8 0025B2C8  D0 0D A2 4C */	stfs f0, lbl_8066CA4C@sda21(r0)
/* 8025FAAC 0025B2CC  D0 04 8B A0 */	stfs f0, lbl_80638BA0@l(r4)
/* 8025FAB0 0025B2D0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8025FAB4 0025B2D4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8025FAB8 0025B2D8  4E 80 00 20 */	blr
.endfn fn_8025FA90

# 0x80534DCC - 0x80534DD0
.section .ctors, "a"
.balign 4
	.4byte fn_8025FA90
