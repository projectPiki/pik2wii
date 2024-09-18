.include "macros.inc"
.file "auto_fn_8035378C_text"

# 0x8035378C - 0x803537B8
.text
.balign 4

.fn fn_8035378C, global
/* 8035378C 0034EFAC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80353790 0034EFB0  38 00 FF FF */	li r0, -0x1
/* 80353794 0034EFB4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80353798 0034EFB8  3C 80 80 64 */	lis r4, lbl_806391B8@ha
/* 8035379C 0034EFBC  38 64 91 B8 */	addi r3, r4, lbl_806391B8@l
/* 803537A0 0034EFC0  90 0D A5 70 */	stw r0, lbl_8066CD70@sda21(r0)
/* 803537A4 0034EFC4  D0 0D A5 74 */	stfs f0, lbl_8066CD74@sda21(r0)
/* 803537A8 0034EFC8  D0 04 91 B8 */	stfs f0, lbl_806391B8@l(r4)
/* 803537AC 0034EFCC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803537B0 0034EFD0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803537B4 0034EFD4  4E 80 00 20 */	blr
.endfn fn_8035378C

# 0x80534EC8 - 0x80534ECC
.section .ctors, "a"
.balign 4
	.4byte fn_8035378C
