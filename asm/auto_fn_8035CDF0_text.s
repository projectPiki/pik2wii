.include "macros.inc"
.file "auto_fn_8035CDF0_text"

# 0x8035CDF0 - 0x8035CE1C
.text
.balign 4

.fn fn_8035CDF0, global
/* 8035CDF0 00358610  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8035CDF4 00358614  38 00 FF FF */	li r0, -0x1
/* 8035CDF8 00358618  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8035CDFC 0035861C  3C 80 80 64 */	lis r4, lbl_806391D8@ha
/* 8035CE00 00358620  38 64 91 D8 */	addi r3, r4, lbl_806391D8@l
/* 8035CE04 00358624  90 0D A5 80 */	stw r0, lbl_8066CD80@sda21(r0)
/* 8035CE08 00358628  D0 0D A5 84 */	stfs f0, lbl_8066CD84@sda21(r0)
/* 8035CE0C 0035862C  D0 04 91 D8 */	stfs f0, lbl_806391D8@l(r4)
/* 8035CE10 00358630  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8035CE14 00358634  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8035CE18 00358638  4E 80 00 20 */	blr
.endfn fn_8035CDF0

# 0x80534ED0 - 0x80534ED4
.section .ctors, "a"
.balign 4
	.4byte fn_8035CDF0
