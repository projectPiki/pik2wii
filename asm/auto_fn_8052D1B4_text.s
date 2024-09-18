.include "macros.inc"
.file "auto_fn_8052D1B4_text"

# 0x8052D1B4 - 0x8052D1C0
.text
.balign 4

.fn fn_8052D1B4, global
/* 8052D1B4 005289D4  38 0D AC A8 */	li r0, lbl_8066D4A8@sda21
/* 8052D1B8 005289D8  90 0D AC C0 */	stw r0, lbl_8066D4C0@sda21(r0)
/* 8052D1BC 005289DC  4E 80 00 20 */	blr
.endfn fn_8052D1B4

# 0x805350BC - 0x805350C0
.section .ctors, "a"
.balign 4
	.4byte fn_8052D1B4
