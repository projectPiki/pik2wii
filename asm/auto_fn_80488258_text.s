.include "macros.inc"
.file "auto_fn_80488258_text"

# 0x80488258 - 0x804882A4
.text
.balign 4

.fn fn_80488258, global
/* 80488258 00483A78  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8048825C 00483A7C  3C C0 80 64 */	lis r6, lbl_80639478@ha
/* 80488260 00483A80  C0 63 AA A8 */	lfs f3, lbl_8066AAA8@l(r3)
/* 80488264 00483A84  3C 80 80 67 */	lis r4, lbl_8066A248@ha
/* 80488268 00483A88  38 A6 94 78 */	addi r5, r6, lbl_80639478@l
/* 8048826C 00483A8C  C0 02 FE 90 */	lfs f0, lbl_80675370@sda21(r0)
/* 80488270 00483A90  38 00 FF FF */	li r0, -0x1
/* 80488274 00483A94  C0 42 FE 88 */	lfs f2, lbl_80675368@sda21(r0)
/* 80488278 00483A98  38 64 A2 48 */	addi r3, r4, lbl_8066A248@l
/* 8048827C 00483A9C  C0 22 FE 8C */	lfs f1, lbl_8067536C@sda21(r0)
/* 80488280 00483AA0  90 0D A9 60 */	stw r0, lbl_8066D160@sda21(r0)
/* 80488284 00483AA4  D0 6D A9 64 */	stfs f3, lbl_8066D164@sda21(r0)
/* 80488288 00483AA8  D0 66 94 78 */	stfs f3, lbl_80639478@l(r6)
/* 8048828C 00483AAC  D0 65 00 04 */	stfs f3, 0x4(r5)
/* 80488290 00483AB0  D0 65 00 08 */	stfs f3, 0x8(r5)
/* 80488294 00483AB4  D0 43 00 04 */	stfs f2, 0x4(r3)
/* 80488298 00483AB8  D0 23 00 08 */	stfs f1, 0x8(r3)
/* 8048829C 00483ABC  D0 04 A2 48 */	stfs f0, lbl_8066A248@l(r4)
/* 804882A0 00483AC0  4E 80 00 20 */	blr
.endfn fn_80488258

# 0x80534FF0 - 0x80534FF4
.section .ctors, "a"
.balign 4
	.4byte fn_80488258
