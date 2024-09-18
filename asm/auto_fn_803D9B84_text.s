.include "macros.inc"
.file "auto_fn_803D9B84_text"

# 0x803D9B84 - 0x803D9BB0
.text
.balign 4

.fn fn_803D9B84, global
/* 803D9B84 003D53A4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803D9B88 003D53A8  38 00 FF FF */	li r0, -0x1
/* 803D9B8C 003D53AC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803D9B90 003D53B0  3C 80 80 64 */	lis r4, lbl_80639328@ha
/* 803D9B94 003D53B4  38 64 93 28 */	addi r3, r4, lbl_80639328@l
/* 803D9B98 003D53B8  90 0D A6 E0 */	stw r0, lbl_8066CEE0@sda21(r0)
/* 803D9B9C 003D53BC  D0 0D A6 E4 */	stfs f0, lbl_8066CEE4@sda21(r0)
/* 803D9BA0 003D53C0  D0 04 93 28 */	stfs f0, lbl_80639328@l(r4)
/* 803D9BA4 003D53C4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803D9BA8 003D53C8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803D9BAC 003D53CC  4E 80 00 20 */	blr
.endfn fn_803D9B84

# 0x80534F68 - 0x80534F6C
.section .ctors, "a"
.balign 4
	.4byte fn_803D9B84
