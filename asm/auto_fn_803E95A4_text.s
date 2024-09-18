.include "macros.inc"
.file "auto_fn_803E95A4_text"

# 0x803E95A4 - 0x803E95A8
.text
.balign 4

.fn fn_803E95A4, global
/* 803E95A4 003E4DC4  4E 80 00 20 */	blr
.endfn fn_803E95A4

# 0x80534F74 - 0x80534F78
.section .ctors, "a"
.balign 4
	.4byte fn_803E95A4
