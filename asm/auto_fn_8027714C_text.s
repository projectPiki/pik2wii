.include "macros.inc"
.file "auto_fn_8027714C_text"

# 0x8027714C - 0x80277178
.text
.balign 4

.fn fn_8027714C, global
/* 8027714C 0027296C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80277150 00272970  38 00 FF FF */	li r0, -0x1
/* 80277154 00272974  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80277158 00272978  3C 80 80 64 */	lis r4, lbl_80638BF0@ha
/* 8027715C 0027297C  38 64 8B F0 */	addi r3, r4, lbl_80638BF0@l
/* 80277160 00272980  90 0D A2 B0 */	stw r0, lbl_8066CAB0@sda21(r0)
/* 80277164 00272984  D0 0D A2 B4 */	stfs f0, lbl_8066CAB4@sda21(r0)
/* 80277168 00272988  D0 04 8B F0 */	stfs f0, lbl_80638BF0@l(r4)
/* 8027716C 0027298C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80277170 00272990  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80277174 00272994  4E 80 00 20 */	blr
.endfn fn_8027714C

# 0x80534DE0 - 0x80534DE4
.section .ctors, "a"
.balign 4
	.4byte fn_8027714C
