.include "macros.inc"
.file "auto_fn_801AFDA4_text"

# 0x801AFDA4 - 0x801AFDD0
.text
.balign 4

.fn fn_801AFDA4, global
/* 801AFDA4 001AB5C4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801AFDA8 001AB5C8  38 00 FF FF */	li r0, -0x1
/* 801AFDAC 001AB5CC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801AFDB0 001AB5D0  3C 80 80 64 */	lis r4, lbl_806389A0@ha
/* 801AFDB4 001AB5D4  38 64 89 A0 */	addi r3, r4, lbl_806389A0@l
/* 801AFDB8 001AB5D8  90 0D A0 08 */	stw r0, lbl_8066C808@sda21(r0)
/* 801AFDBC 001AB5DC  D0 0D A0 0C */	stfs f0, lbl_8066C80C@sda21(r0)
/* 801AFDC0 001AB5E0  D0 04 89 A0 */	stfs f0, lbl_806389A0@l(r4)
/* 801AFDC4 001AB5E4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801AFDC8 001AB5E8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801AFDCC 001AB5EC  4E 80 00 20 */	blr
.endfn fn_801AFDA4

# 0x80534D44 - 0x80534D48
.section .ctors, "a"
.balign 4
	.4byte fn_801AFDA4
