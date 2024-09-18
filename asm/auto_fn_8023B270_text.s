.include "macros.inc"
.file "auto_fn_8023B270_text"

# 0x8023B270 - 0x8023B29C
.text
.balign 4

.fn fn_8023B270, global
/* 8023B270 00236A90  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8023B274 00236A94  38 00 FF FF */	li r0, -0x1
/* 8023B278 00236A98  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8023B27C 00236A9C  3C 80 80 64 */	lis r4, lbl_80638B20@ha
/* 8023B280 00236AA0  38 64 8B 20 */	addi r3, r4, lbl_80638B20@l
/* 8023B284 00236AA4  90 0D A1 A0 */	stw r0, lbl_8066C9A0@sda21(r0)
/* 8023B288 00236AA8  D0 0D A1 A4 */	stfs f0, lbl_8066C9A4@sda21(r0)
/* 8023B28C 00236AAC  D0 04 8B 20 */	stfs f0, lbl_80638B20@l(r4)
/* 8023B290 00236AB0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8023B294 00236AB4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8023B298 00236AB8  4E 80 00 20 */	blr
.endfn fn_8023B270

# 0x80534DA8 - 0x80534DAC
.section .ctors, "a"
.balign 4
	.4byte fn_8023B270
