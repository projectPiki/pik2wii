.include "macros.inc"
.file "auto_fn_803B8DE4_text"

# 0x803B8DE4 - 0x803B8DF0
.text
.balign 4

.fn fn_803B8DE4, global
/* 803B8DE4 003B4604  38 6D A6 74 */	li r3, lbl_8066CE74@sda21
/* 803B8DE8 003B4608  38 80 00 00 */	li r4, 0x0
/* 803B8DEC 003B460C  4B CD EA 30 */	b fn_8009781C
.endfn fn_803B8DE4

# 0x80534F54 - 0x80534F58
.section .ctors, "a"
.balign 4
	.4byte fn_803B8DE4
