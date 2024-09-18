.include "macros.inc"
.file "auto_fn_8028685C_text"

# 0x8028685C - 0x80286888
.text
.balign 4

.fn fn_8028685C, global
/* 8028685C 0028207C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80286860 00282080  38 00 FF FF */	li r0, -0x1
/* 80286864 00282084  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80286868 00282088  3C 80 80 64 */	lis r4, lbl_80638C40@ha
/* 8028686C 0028208C  38 64 8C 40 */	addi r3, r4, lbl_80638C40@l
/* 80286870 00282090  90 0D A3 20 */	stw r0, lbl_8066CB20@sda21(r0)
/* 80286874 00282094  D0 0D A3 24 */	stfs f0, lbl_8066CB24@sda21(r0)
/* 80286878 00282098  D0 04 8C 40 */	stfs f0, lbl_80638C40@l(r4)
/* 8028687C 0028209C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80286880 002820A0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80286884 002820A4  4E 80 00 20 */	blr
.endfn fn_8028685C

# 0x80534DF4 - 0x80534DF8
.section .ctors, "a"
.balign 4
	.4byte fn_8028685C
