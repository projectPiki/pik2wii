.include "macros.inc"
.file "auto_fn_804B94D8_text"

# 0x804B94D8 - 0x804B9504
.text
.balign 4

.fn fn_804B94D8, global
/* 804B94D8 004B4CF8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B94DC 004B4CFC  38 00 FF FF */	li r0, -0x1
/* 804B94E0 004B4D00  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B94E4 004B4D04  3C 80 80 64 */	lis r4, lbl_80639570@ha
/* 804B94E8 004B4D08  38 64 95 70 */	addi r3, r4, lbl_80639570@l
/* 804B94EC 004B4D0C  90 0D AA 58 */	stw r0, lbl_8066D258@sda21(r0)
/* 804B94F0 004B4D10  D0 0D AA 5C */	stfs f0, lbl_8066D25C@sda21(r0)
/* 804B94F4 004B4D14  D0 04 95 70 */	stfs f0, lbl_80639570@l(r4)
/* 804B94F8 004B4D18  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B94FC 004B4D1C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B9500 004B4D20  4E 80 00 20 */	blr
.endfn fn_804B94D8

# 0x80535044 - 0x80535048
.section .ctors, "a"
.balign 4
	.4byte fn_804B94D8
