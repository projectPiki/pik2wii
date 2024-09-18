.include "macros.inc"
.file "auto_fn_803A2B04_text"

# 0x803A2B04 - 0x803A2B28
.text
.balign 4

.fn fn_803A2B04, global
/* 803A2B04 0039E324  3C 80 80 67 */	lis r4, lbl_80669F24@ha
/* 803A2B08 0039E328  C0 42 E0 6C */	lfs f2, lbl_8067354C@sda21(r0)
/* 803A2B0C 0039E32C  C0 22 E0 80 */	lfs f1, lbl_80673560@sda21(r0)
/* 803A2B10 0039E330  38 64 9F 24 */	addi r3, r4, lbl_80669F24@l
/* 803A2B14 0039E334  C0 02 E0 64 */	lfs f0, lbl_80673544@sda21(r0)
/* 803A2B18 0039E338  D0 44 9F 24 */	stfs f2, lbl_80669F24@l(r4)
/* 803A2B1C 0039E33C  D0 23 00 04 */	stfs f1, 0x4(r3)
/* 803A2B20 0039E340  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803A2B24 0039E344  4E 80 00 20 */	blr
.endfn fn_803A2B04

# 0x80534F2C - 0x80534F30
.section .ctors, "a"
.balign 4
	.4byte fn_803A2B04
