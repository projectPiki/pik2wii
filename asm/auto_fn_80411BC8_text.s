.include "macros.inc"
.file "auto_fn_80411BC8_text"

# 0x80411BC8 - 0x80411BDC
.text
.balign 4

.fn fn_80411BC8, global
/* 80411BC8 0040D3E8  C0 02 F1 08 */	lfs f0, lbl_806745E8@sda21(r0)
/* 80411BCC 0040D3EC  38 6D A7 A8 */	li r3, lbl_8066CFA8@sda21
/* 80411BD0 0040D3F0  D0 0D A7 A8 */	stfs f0, lbl_8066CFA8@sda21(r0)
/* 80411BD4 0040D3F4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80411BD8 0040D3F8  4E 80 00 20 */	blr
.endfn fn_80411BC8

# 0x80534F88 - 0x80534F8C
.section .ctors, "a"
.balign 4
	.4byte fn_80411BC8
