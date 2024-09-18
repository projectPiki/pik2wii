.include "macros.inc"
.file "auto_fn_803D6CEC_text"

# 0x803D6CEC - 0x803D6D18
.text
.balign 4

.fn fn_803D6CEC, global
/* 803D6CEC 003D250C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803D6CF0 003D2510  38 00 FF FF */	li r0, -0x1
/* 803D6CF4 003D2514  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803D6CF8 003D2518  3C 80 80 64 */	lis r4, lbl_80639318@ha
/* 803D6CFC 003D251C  38 64 93 18 */	addi r3, r4, lbl_80639318@l
/* 803D6D00 003D2520  90 0D A6 D8 */	stw r0, lbl_8066CED8@sda21(r0)
/* 803D6D04 003D2524  D0 0D A6 DC */	stfs f0, lbl_8066CEDC@sda21(r0)
/* 803D6D08 003D2528  D0 04 93 18 */	stfs f0, lbl_80639318@l(r4)
/* 803D6D0C 003D252C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803D6D10 003D2530  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803D6D14 003D2534  4E 80 00 20 */	blr
.endfn fn_803D6CEC

# 0x80534F64 - 0x80534F68
.section .ctors, "a"
.balign 4
	.4byte fn_803D6CEC
