.include "macros.inc"
.file "auto_fn_801AE28C_text"

# 0x801AE28C - 0x801AE2B8
.text
.balign 4

.fn fn_801AE28C, global
/* 801AE28C 001A9AAC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801AE290 001A9AB0  38 00 FF FF */	li r0, -0x1
/* 801AE294 001A9AB4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801AE298 001A9AB8  3C 80 80 64 */	lis r4, lbl_80638990@ha
/* 801AE29C 001A9ABC  38 64 89 90 */	addi r3, r4, lbl_80638990@l
/* 801AE2A0 001A9AC0  90 0D 9F F8 */	stw r0, lbl_8066C7F8@sda21(r0)
/* 801AE2A4 001A9AC4  D0 0D 9F FC */	stfs f0, lbl_8066C7FC@sda21(r0)
/* 801AE2A8 001A9AC8  D0 04 89 90 */	stfs f0, lbl_80638990@l(r4)
/* 801AE2AC 001A9ACC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801AE2B0 001A9AD0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801AE2B4 001A9AD4  4E 80 00 20 */	blr
.endfn fn_801AE28C

# 0x80534D40 - 0x80534D44
.section .ctors, "a"
.balign 4
	.4byte fn_801AE28C
