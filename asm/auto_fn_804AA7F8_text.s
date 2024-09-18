.include "macros.inc"
.file "auto_fn_804AA7F8_text"

# 0x804AA7F8 - 0x804AA824
.text
.balign 4

.fn fn_804AA7F8, global
/* 804AA7F8 004A6018  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804AA7FC 004A601C  38 00 FF FF */	li r0, -0x1
/* 804AA800 004A6020  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804AA804 004A6024  3C 80 80 64 */	lis r4, lbl_806394D0@ha
/* 804AA808 004A6028  38 64 94 D0 */	addi r3, r4, lbl_806394D0@l
/* 804AA80C 004A602C  90 0D A9 D0 */	stw r0, lbl_8066D1D0@sda21(r0)
/* 804AA810 004A6030  D0 0D A9 D4 */	stfs f0, lbl_8066D1D4@sda21(r0)
/* 804AA814 004A6034  D0 04 94 D0 */	stfs f0, lbl_806394D0@l(r4)
/* 804AA818 004A6038  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804AA81C 004A603C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804AA820 004A6040  4E 80 00 20 */	blr
.endfn fn_804AA7F8

# 0x8053501C - 0x80535020
.section .ctors, "a"
.balign 4
	.4byte fn_804AA7F8
