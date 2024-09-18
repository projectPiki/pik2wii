.include "macros.inc"
.file "auto_fn_801D25F8_text"

# 0x801D25F8 - 0x801D2624
.text
.balign 4

.fn fn_801D25F8, global
/* 801D25F8 001CDE18  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801D25FC 001CDE1C  38 00 FF FF */	li r0, -0x1
/* 801D2600 001CDE20  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801D2604 001CDE24  3C 80 80 64 */	lis r4, lbl_80638A10@ha
/* 801D2608 001CDE28  38 64 8A 10 */	addi r3, r4, lbl_80638A10@l
/* 801D260C 001CDE2C  90 0D A0 80 */	stw r0, lbl_8066C880@sda21(r0)
/* 801D2610 001CDE30  D0 0D A0 84 */	stfs f0, lbl_8066C884@sda21(r0)
/* 801D2614 001CDE34  D0 04 8A 10 */	stfs f0, lbl_80638A10@l(r4)
/* 801D2618 001CDE38  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801D261C 001CDE3C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801D2620 001CDE40  4E 80 00 20 */	blr
.endfn fn_801D25F8

# 0x80534D64 - 0x80534D68
.section .ctors, "a"
.balign 4
	.4byte fn_801D25F8
