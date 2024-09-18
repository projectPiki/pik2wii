.include "macros.inc"
.file "auto_fn_8052F768_text"

# 0x8052F768 - 0x8052F774
.text
.balign 4

.fn fn_8052F768, global
/* 8052F768 0052AF88  38 0D AC A8 */	li r0, lbl_8066D4A8@sda21
/* 8052F76C 0052AF8C  90 0D AC C8 */	stw r0, lbl_8066D4C8@sda21(r0)
/* 8052F770 0052AF90  4E 80 00 20 */	blr
.endfn fn_8052F768

# 0x805350C0 - 0x805350C4
.section .ctors, "a"
.balign 4
	.4byte fn_8052F768
