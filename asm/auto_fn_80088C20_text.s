.include "macros.inc"
.file "auto_fn_80088C20_text"

# 0x80088C20 - 0x80088C30
.text
.balign 4

.fn fn_80088C20, global
/* 80088C20 00084440  80 6D 81 BC */	lwz r3, lbl_8066A9BC@sda21(r0)
/* 80088C24 00084444  3C 03 01 30 */	addis r0, r3, 0x130
/* 80088C28 00084448  90 0D 95 58 */	stw r0, lbl_8066BD58@sda21(r0)
/* 80088C2C 0008444C  4E 80 00 20 */	blr
.endfn fn_80088C20

# 0x80534D0C - 0x80534D10
.section .ctors, "a"
.balign 4
	.4byte fn_80088C20
