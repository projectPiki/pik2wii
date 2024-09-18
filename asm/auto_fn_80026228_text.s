.include "macros.inc"
.file "auto_fn_80026228_text"

# 0x80026228 - 0x80026248
.text
.balign 4

.fn fn_80026228, global
/* 80026228 00021A48  3C 80 80 66 */	lis r4, lbl_8065F4DC@ha
/* 8002622C 00021A4C  C0 02 83 D0 */	lfs f0, lbl_8066D8B0@sda21(r0)
/* 80026230 00021A50  38 64 F4 DC */	addi r3, r4, lbl_8065F4DC@l
/* 80026234 00021A54  38 00 00 00 */	li r0, 0x0
/* 80026238 00021A58  D0 04 F4 DC */	stfs f0, lbl_8065F4DC@l(r4)
/* 8002623C 00021A5C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80026240 00021A60  90 03 00 08 */	stw r0, 0x8(r3)
/* 80026244 00021A64  4E 80 00 20 */	blr
.endfn fn_80026228

# 0x80534C9C - 0x80534CA0
.section .ctors, "a"
.balign 4
	.4byte fn_80026228
