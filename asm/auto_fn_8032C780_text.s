.include "macros.inc"
.file "auto_fn_8032C780_text"

# 0x8032C780 - 0x8032C7AC
.text
.balign 4

.fn fn_8032C780, global
/* 8032C780 00327FA0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8032C784 00327FA4  38 00 FF FF */	li r0, -0x1
/* 8032C788 00327FA8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8032C78C 00327FAC  3C 80 80 64 */	lis r4, lbl_80639138@ha
/* 8032C790 00327FB0  38 64 91 38 */	addi r3, r4, lbl_80639138@l
/* 8032C794 00327FB4  90 0D A5 20 */	stw r0, lbl_8066CD20@sda21(r0)
/* 8032C798 00327FB8  D0 0D A5 24 */	stfs f0, lbl_8066CD24@sda21(r0)
/* 8032C79C 00327FBC  D0 04 91 38 */	stfs f0, lbl_80639138@l(r4)
/* 8032C7A0 00327FC0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8032C7A4 00327FC4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8032C7A8 00327FC8  4E 80 00 20 */	blr
.endfn fn_8032C780

# 0x80534EA8 - 0x80534EAC
.section .ctors, "a"
.balign 4
	.4byte fn_8032C780
