.include "macros.inc"
.file "auto_fn_8003D464_text"

# 0x8003D464 - 0x8003D474
.text
.balign 4

.fn fn_8003D464, global
/* 8003D464 00038C84  38 00 00 00 */	li r0, 0x0
/* 8003D468 00038C88  3C 60 80 5D */	lis r3, lbl_805D1EF0@ha
/* 8003D46C 00038C8C  90 03 1E F0 */	stw r0, lbl_805D1EF0@l(r3)
/* 8003D470 00038C90  4E 80 00 20 */	blr
.endfn fn_8003D464

# 0x80534CAC - 0x80534CB0
.section .ctors, "a"
.balign 4
	.4byte fn_8003D464
