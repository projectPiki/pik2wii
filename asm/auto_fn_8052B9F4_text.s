.include "macros.inc"
.file "auto_fn_8052B9F4_text"

# 0x8052B9F4 - 0x8052BA00
.text
.balign 4

.fn fn_8052B9F4, global
/* 8052B9F4 00527214  38 0D AC A8 */	li r0, lbl_8066D4A8@sda21
/* 8052B9F8 00527218  90 0D AC B8 */	stw r0, lbl_8066D4B8@sda21(r0)
/* 8052B9FC 0052721C  4E 80 00 20 */	blr
.endfn fn_8052B9F4

# 0x805350B8 - 0x805350BC
.section .ctors, "a"
.balign 4
	.4byte fn_8052B9F4
