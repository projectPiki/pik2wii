.include "macros.inc"
.file "auto_fn_80041534_text"

# 0x80041534 - 0x80041548
.text
.balign 4

.fn fn_80041534, global
/* 80041534 0003CD54  3C 80 80 5D */	lis r4, lbl_805D1EF0@ha
/* 80041538 0003CD58  3C 60 80 5D */	lis r3, lbl_805D1F08@ha
/* 8004153C 0003CD5C  38 84 1E F0 */	addi r4, r4, lbl_805D1EF0@l
/* 80041540 0003CD60  90 83 1F 08 */	stw r4, lbl_805D1F08@l(r3)
/* 80041544 0003CD64  4E 80 00 20 */	blr
.endfn fn_80041534

# 0x80534CB8 - 0x80534CBC
.section .ctors, "a"
.balign 4
	.4byte fn_80041534
