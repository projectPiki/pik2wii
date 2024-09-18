.include "macros.inc"
.file "auto_fn_8052F814_text"

# 0x8052F814 - 0x8052F820
.text
.balign 4

.fn fn_8052F814, global
/* 8052F814 0052B034  38 0D AC A8 */	li r0, lbl_8066D4A8@sda21
/* 8052F818 0052B038  90 0D AC D0 */	stw r0, lbl_8066D4D0@sda21(r0)
/* 8052F81C 0052B03C  4E 80 00 20 */	blr
.endfn fn_8052F814

# 0x805350C4 - 0x805350C8
.section .ctors, "a"
.balign 4
	.4byte fn_8052F814
