.include "macros.inc"
.file "auto_fn_8052A178_text"

# 0x8052A178 - 0x8052A184
.text
.balign 4

.fn fn_8052A178, global
/* 8052A178 00525998  38 00 00 00 */	li r0, 0x0
/* 8052A17C 0052599C  90 0D AC A8 */	stw r0, lbl_8066D4A8@sda21(r0)
/* 8052A180 005259A0  4E 80 00 20 */	blr
.endfn fn_8052A178

# 0x805350B4 - 0x805350B8
.section .ctors, "a"
.balign 4
	.4byte fn_8052A178
