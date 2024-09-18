.include "macros.inc"
.file "auto_fn_800C423C_text"

# 0x800C423C - 0x800C4248
.text
.balign 4

.fn fn_800C423C, global
/* 800C423C 000BFA5C  3C 60 80 66 */	lis r3, lbl_80665CB0@ha
/* 800C4240 000BFA60  38 63 5C B0 */	addi r3, r3, lbl_80665CB0@l
/* 800C4244 000BFA64  4B FF ED AC */	b fn_800C2FF0
.endfn fn_800C423C

# 0x80534D28 - 0x80534D2C
.section .ctors, "a"
.balign 4
	.4byte fn_800C423C
