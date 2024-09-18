.include "macros.inc"
.file "auto_fn_802B2F90_text"

# 0x802B2F90 - 0x802B2FBC
.text
.balign 4

.fn fn_802B2F90, global
/* 802B2F90 002AE7B0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802B2F94 002AE7B4  38 00 FF FF */	li r0, -0x1
/* 802B2F98 002AE7B8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802B2F9C 002AE7BC  3C 80 80 64 */	lis r4, lbl_80638D88@ha
/* 802B2FA0 002AE7C0  38 64 8D 88 */	addi r3, r4, lbl_80638D88@l
/* 802B2FA4 002AE7C4  90 0D A4 18 */	stw r0, lbl_8066CC18@sda21(r0)
/* 802B2FA8 002AE7C8  D0 0D A4 1C */	stfs f0, lbl_8066CC1C@sda21(r0)
/* 802B2FAC 002AE7CC  D0 04 8D 88 */	stfs f0, lbl_80638D88@l(r4)
/* 802B2FB0 002AE7D0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802B2FB4 002AE7D4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802B2FB8 002AE7D8  4E 80 00 20 */	blr
.endfn fn_802B2F90

# 0x80534E44 - 0x80534E48
.section .ctors, "a"
.balign 4
	.4byte fn_802B2F90
