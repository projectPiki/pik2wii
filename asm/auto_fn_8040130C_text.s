.include "macros.inc"
.file "auto_fn_8040130C_text"

# 0x8040130C - 0x80401338
.text
.balign 4

.fn fn_8040130C, global
/* 8040130C 003FCB2C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80401310 003FCB30  38 00 FF FF */	li r0, -0x1
/* 80401314 003FCB34  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80401318 003FCB38  3C 80 80 64 */	lis r4, lbl_80639368@ha
/* 8040131C 003FCB3C  38 64 93 68 */	addi r3, r4, lbl_80639368@l
/* 80401320 003FCB40  90 0D A7 60 */	stw r0, lbl_8066CF60@sda21(r0)
/* 80401324 003FCB44  D0 0D A7 64 */	stfs f0, lbl_8066CF64@sda21(r0)
/* 80401328 003FCB48  D0 04 93 68 */	stfs f0, lbl_80639368@l(r4)
/* 8040132C 003FCB4C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80401330 003FCB50  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80401334 003FCB54  4E 80 00 20 */	blr
.endfn fn_8040130C

# 0x80534F80 - 0x80534F84
.section .ctors, "a"
.balign 4
	.4byte fn_8040130C
