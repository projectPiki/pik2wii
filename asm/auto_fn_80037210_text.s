.include "macros.inc"
.file "auto_fn_80037210_text"

# 0x80037210 - 0x80037224
.text
.balign 4

.fn fn_80037210, global
/* 80037210 00032A30  3C 80 80 5D */	lis r4, lbl_805D1EF0@ha
/* 80037214 00032A34  3C 60 80 5D */	lis r3, lbl_805D1EB8@ha
/* 80037218 00032A38  38 84 1E F0 */	addi r4, r4, lbl_805D1EF0@l
/* 8003721C 00032A3C  90 83 1E B8 */	stw r4, lbl_805D1EB8@l(r3)
/* 80037220 00032A40  4E 80 00 20 */	blr
.endfn fn_80037210

# 0x80534CA8 - 0x80534CAC
.section .ctors, "a"
.balign 4
	.4byte fn_80037210
