.include "macros.inc"
.file "auto_fn_804C7AB0_text"

# 0x804C7AB0 - 0x804C7ADC
.text
.balign 4

.fn fn_804C7AB0, global
/* 804C7AB0 004C32D0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804C7AB4 004C32D4  38 00 FF FF */	li r0, -0x1
/* 804C7AB8 004C32D8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804C7ABC 004C32DC  3C 80 80 64 */	lis r4, lbl_80639748@ha
/* 804C7AC0 004C32E0  38 64 97 48 */	addi r3, r4, lbl_80639748@l
/* 804C7AC4 004C32E4  90 0D AA D0 */	stw r0, lbl_8066D2D0@sda21(r0)
/* 804C7AC8 004C32E8  D0 0D AA D4 */	stfs f0, lbl_8066D2D4@sda21(r0)
/* 804C7ACC 004C32EC  D0 04 97 48 */	stfs f0, lbl_80639748@l(r4)
/* 804C7AD0 004C32F0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804C7AD4 004C32F4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804C7AD8 004C32F8  4E 80 00 20 */	blr
.endfn fn_804C7AB0

# 0x80535070 - 0x80535074
.section .ctors, "a"
.balign 4
	.4byte fn_804C7AB0
