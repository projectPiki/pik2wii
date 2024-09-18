.include "macros.inc"
.file "auto_fn_8003D998_text"

# 0x8003D998 - 0x8003D9AC
.text
.balign 4

.fn fn_8003D998, global
/* 8003D998 000391B8  3C 80 80 5D */	lis r4, lbl_805D1EF0@ha
/* 8003D99C 000391BC  3C 60 80 5D */	lis r3, lbl_805D1EF8@ha
/* 8003D9A0 000391C0  38 84 1E F0 */	addi r4, r4, lbl_805D1EF0@l
/* 8003D9A4 000391C4  90 83 1E F8 */	stw r4, lbl_805D1EF8@l(r3)
/* 8003D9A8 000391C8  4E 80 00 20 */	blr
.endfn fn_8003D998

# 0x80534CB0 - 0x80534CB4
.section .ctors, "a"
.balign 4
	.4byte fn_8003D998
