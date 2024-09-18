.include "macros.inc"
.file "auto_fn_801C59F0_text"

# 0x801C59F0 - 0x801C5A1C
.text
.balign 4

.fn fn_801C59F0, global
/* 801C59F0 001C1210  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801C59F4 001C1214  38 00 FF FF */	li r0, -0x1
/* 801C59F8 001C1218  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801C59FC 001C121C  3C 80 80 64 */	lis r4, lbl_806389F0@ha
/* 801C5A00 001C1220  38 64 89 F0 */	addi r3, r4, lbl_806389F0@l
/* 801C5A04 001C1224  90 0D A0 58 */	stw r0, lbl_8066C858@sda21(r0)
/* 801C5A08 001C1228  D0 0D A0 5C */	stfs f0, lbl_8066C85C@sda21(r0)
/* 801C5A0C 001C122C  D0 04 89 F0 */	stfs f0, lbl_806389F0@l(r4)
/* 801C5A10 001C1230  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801C5A14 001C1234  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801C5A18 001C1238  4E 80 00 20 */	blr
.endfn fn_801C59F0

# 0x80534D5C - 0x80534D60
.section .ctors, "a"
.balign 4
	.4byte fn_801C59F0
