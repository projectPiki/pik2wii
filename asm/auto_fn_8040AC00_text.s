.include "macros.inc"
.file "auto_fn_8040AC00_text"

# 0x8040AC00 - 0x8040AC04
.text
.balign 4

.fn fn_8040AC00, global
/* 8040AC00 00406420  4E 80 00 20 */	blr
.endfn fn_8040AC00

# 0x80534F84 - 0x80534F88
.section .ctors, "a"
.balign 4
	.4byte fn_8040AC00
