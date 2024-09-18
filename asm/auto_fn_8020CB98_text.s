.include "macros.inc"
.file "auto_fn_8020CB98_text"

# 0x8020CB98 - 0x8020CBC4
.text
.balign 4

.fn fn_8020CB98, global
/* 8020CB98 002083B8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8020CB9C 002083BC  38 00 FF FF */	li r0, -0x1
/* 8020CBA0 002083C0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8020CBA4 002083C4  3C 80 80 64 */	lis r4, lbl_80638AA0@ha
/* 8020CBA8 002083C8  38 64 8A A0 */	addi r3, r4, lbl_80638AA0@l
/* 8020CBAC 002083CC  90 0D A1 30 */	stw r0, lbl_8066C930@sda21(r0)
/* 8020CBB0 002083D0  D0 0D A1 34 */	stfs f0, lbl_8066C934@sda21(r0)
/* 8020CBB4 002083D4  D0 04 8A A0 */	stfs f0, lbl_80638AA0@l(r4)
/* 8020CBB8 002083D8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8020CBBC 002083DC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8020CBC0 002083E0  4E 80 00 20 */	blr
.endfn fn_8020CB98

# 0x80534D88 - 0x80534D8C
.section .ctors, "a"
.balign 4
	.4byte fn_8020CB98
