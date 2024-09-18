.include "macros.inc"
.file "auto_fn_80441AC8_text"

# 0x80441AC8 - 0x80441AF4
.text
.balign 4

.fn fn_80441AC8, global
/* 80441AC8 0043D2E8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80441ACC 0043D2EC  38 00 FF FF */	li r0, -0x1
/* 80441AD0 0043D2F0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80441AD4 0043D2F4  3C 80 80 64 */	lis r4, lbl_806393E8@ha
/* 80441AD8 0043D2F8  38 64 93 E8 */	addi r3, r4, lbl_806393E8@l
/* 80441ADC 0043D2FC  90 0D A8 58 */	stw r0, lbl_8066D058@sda21(r0)
/* 80441AE0 0043D300  D0 0D A8 5C */	stfs f0, lbl_8066D05C@sda21(r0)
/* 80441AE4 0043D304  D0 04 93 E8 */	stfs f0, lbl_806393E8@l(r4)
/* 80441AE8 0043D308  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80441AEC 0043D30C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80441AF0 0043D310  4E 80 00 20 */	blr
.endfn fn_80441AC8

# 0x80534FAC - 0x80534FB0
.section .ctors, "a"
.balign 4
	.4byte fn_80441AC8
