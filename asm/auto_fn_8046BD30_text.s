.include "macros.inc"
.file "auto_fn_8046BD30_text"

# 0x8046BD30 - 0x8046BD5C
.text
.balign 4

.fn fn_8046BD30, global
/* 8046BD30 00467550  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8046BD34 00467554  38 00 FF FF */	li r0, -0x1
/* 8046BD38 00467558  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8046BD3C 0046755C  3C 80 80 64 */	lis r4, lbl_80639418@ha
/* 8046BD40 00467560  38 64 94 18 */	addi r3, r4, lbl_80639418@l
/* 8046BD44 00467564  90 0D A9 10 */	stw r0, lbl_8066D110@sda21(r0)
/* 8046BD48 00467568  D0 0D A9 14 */	stfs f0, lbl_8066D114@sda21(r0)
/* 8046BD4C 0046756C  D0 04 94 18 */	stfs f0, lbl_80639418@l(r4)
/* 8046BD50 00467570  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8046BD54 00467574  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8046BD58 00467578  4E 80 00 20 */	blr
.endfn fn_8046BD30

# 0x80534FCC - 0x80534FD0
.section .ctors, "a"
.balign 4
	.4byte fn_8046BD30
