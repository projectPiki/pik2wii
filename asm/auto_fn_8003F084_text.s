.include "macros.inc"
.file "auto_fn_8003F084_text"

# 0x8003F084 - 0x8003F098
.text
.balign 4

.fn fn_8003F084, global
/* 8003F084 0003A8A4  3C 80 80 5D */	lis r4, lbl_805D1EF0@ha
/* 8003F088 0003A8A8  3C 60 80 5D */	lis r3, lbl_805D1F00@ha
/* 8003F08C 0003A8AC  38 84 1E F0 */	addi r4, r4, lbl_805D1EF0@l
/* 8003F090 0003A8B0  90 83 1F 00 */	stw r4, lbl_805D1F00@l(r3)
/* 8003F094 0003A8B4  4E 80 00 20 */	blr
.endfn fn_8003F084

# 0x80534CB4 - 0x80534CB8
.section .ctors, "a"
.balign 4
	.4byte fn_8003F084
