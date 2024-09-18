.include "macros.inc"
.file "auto_fn_8029190C_text"

# 0x8029190C - 0x80291938
.text
.balign 4

.fn fn_8029190C, global
/* 8029190C 0028D12C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80291910 0028D130  38 00 FF FF */	li r0, -0x1
/* 80291914 0028D134  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80291918 0028D138  3C 80 80 64 */	lis r4, lbl_80638C80@ha
/* 8029191C 0028D13C  38 64 8C 80 */	addi r3, r4, lbl_80638C80@l
/* 80291920 0028D140  90 0D A3 58 */	stw r0, lbl_8066CB58@sda21(r0)
/* 80291924 0028D144  D0 0D A3 5C */	stfs f0, lbl_8066CB5C@sda21(r0)
/* 80291928 0028D148  D0 04 8C 80 */	stfs f0, lbl_80638C80@l(r4)
/* 8029192C 0028D14C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80291930 0028D150  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80291934 0028D154  4E 80 00 20 */	blr
.endfn fn_8029190C

# 0x80534E04 - 0x80534E08
.section .ctors, "a"
.balign 4
	.4byte fn_8029190C
