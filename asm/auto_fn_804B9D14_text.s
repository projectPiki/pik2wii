.include "macros.inc"
.file "auto_fn_804B9D14_text"

# 0x804B9D14 - 0x804B9D40
.text
.balign 4

.fn fn_804B9D14, global
/* 804B9D14 004B5534  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B9D18 004B5538  38 00 FF FF */	li r0, -0x1
/* 804B9D1C 004B553C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B9D20 004B5540  3C 80 80 64 */	lis r4, lbl_80639580@ha
/* 804B9D24 004B5544  38 64 95 80 */	addi r3, r4, lbl_80639580@l
/* 804B9D28 004B5548  90 0D AA 60 */	stw r0, lbl_8066D260@sda21(r0)
/* 804B9D2C 004B554C  D0 0D AA 64 */	stfs f0, lbl_8066D264@sda21(r0)
/* 804B9D30 004B5550  D0 04 95 80 */	stfs f0, lbl_80639580@l(r4)
/* 804B9D34 004B5554  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B9D38 004B5558  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B9D3C 004B555C  4E 80 00 20 */	blr
.endfn fn_804B9D14

# 0x80535048 - 0x8053504C
.section .ctors, "a"
.balign 4
	.4byte fn_804B9D14
