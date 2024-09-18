.include "macros.inc"
.file "auto_fn_800118DC_text"

# 0x800118DC - 0x800118F0
.text
.balign 4

.fn fn_800118DC, global
/* 800118DC 0000D0FC  3C 60 80 66 */	lis r3, lbl_8065F320@ha
/* 800118E0 0000D100  38 00 00 00 */	li r0, 0x0
/* 800118E4 0000D104  38 63 F3 20 */	addi r3, r3, lbl_8065F320@l
/* 800118E8 0000D108  98 03 00 20 */	stb r0, 0x20(r3)
/* 800118EC 0000D10C  4E 80 00 20 */	blr
.endfn fn_800118DC

# 0x80534C88 - 0x80534C8C
.section .ctors, "a"
.balign 4
	.4byte fn_800118DC
