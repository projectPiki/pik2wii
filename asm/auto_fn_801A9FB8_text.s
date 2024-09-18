.include "macros.inc"
.file "auto_fn_801A9FB8_text"

# 0x801A9FB8 - 0x801A9FE4
.text
.balign 4

.fn fn_801A9FB8, global
/* 801A9FB8 001A57D8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801A9FBC 001A57DC  38 00 FF FF */	li r0, -0x1
/* 801A9FC0 001A57E0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801A9FC4 001A57E4  3C 80 80 64 */	lis r4, lbl_80638980@ha
/* 801A9FC8 001A57E8  38 64 89 80 */	addi r3, r4, lbl_80638980@l
/* 801A9FCC 001A57EC  90 0D 9F F0 */	stw r0, lbl_8066C7F0@sda21(r0)
/* 801A9FD0 001A57F0  D0 0D 9F F4 */	stfs f0, lbl_8066C7F4@sda21(r0)
/* 801A9FD4 001A57F4  D0 04 89 80 */	stfs f0, lbl_80638980@l(r4)
/* 801A9FD8 001A57F8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801A9FDC 001A57FC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801A9FE0 001A5800  4E 80 00 20 */	blr
.endfn fn_801A9FB8

# 0x80534D3C - 0x80534D40
.section .ctors, "a"
.balign 4
	.4byte fn_801A9FB8
