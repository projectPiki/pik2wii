.include "macros.inc"
.file "auto_fn_80281AEC_text"

# 0x80281AEC - 0x80281B18
.text
.balign 4

.fn fn_80281AEC, global
/* 80281AEC 0027D30C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80281AF0 0027D310  38 00 FF FF */	li r0, -0x1
/* 80281AF4 0027D314  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80281AF8 0027D318  3C 80 80 64 */	lis r4, lbl_80638C20@ha
/* 80281AFC 0027D31C  38 64 8C 20 */	addi r3, r4, lbl_80638C20@l
/* 80281B00 0027D320  90 0D A2 F0 */	stw r0, lbl_8066CAF0@sda21(r0)
/* 80281B04 0027D324  D0 0D A2 F4 */	stfs f0, lbl_8066CAF4@sda21(r0)
/* 80281B08 0027D328  D0 04 8C 20 */	stfs f0, lbl_80638C20@l(r4)
/* 80281B0C 0027D32C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80281B10 0027D330  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80281B14 0027D334  4E 80 00 20 */	blr
.endfn fn_80281AEC

# 0x80534DEC - 0x80534DF0
.section .ctors, "a"
.balign 4
	.4byte fn_80281AEC
