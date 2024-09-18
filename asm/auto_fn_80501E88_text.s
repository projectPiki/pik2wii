.include "macros.inc"
.file "auto_fn_80501E88_text"

# 0x80501E88 - 0x80501EA0
.text
.balign 4

.fn fn_80501E88, global
/* 80501E88 004FD6A8  3C 80 80 64 */	lis r4, lbl_80641C40@ha
/* 80501E8C 004FD6AC  38 00 00 00 */	li r0, 0x0
/* 80501E90 004FD6B0  38 64 1C 40 */	addi r3, r4, lbl_80641C40@l
/* 80501E94 004FD6B4  98 04 1C 40 */	stb r0, lbl_80641C40@l(r4)
/* 80501E98 004FD6B8  38 63 00 04 */	addi r3, r3, 0x4
/* 80501E9C 004FD6BC  4B C3 1A 4C */	b fn_801338E8
.endfn fn_80501E88

# 0x805350A8 - 0x805350AC
.section .ctors, "a"
.balign 4
	.4byte fn_80501E88
