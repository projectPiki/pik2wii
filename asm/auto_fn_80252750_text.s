.include "macros.inc"
.file "auto_fn_80252750_text"

# 0x80252750 - 0x8025277C
.text
.balign 4

.fn fn_80252750, global
/* 80252750 0024DF70  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80252754 0024DF74  38 00 FF FF */	li r0, -0x1
/* 80252758 0024DF78  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8025275C 0024DF7C  3C 80 80 64 */	lis r4, lbl_80638B80@ha
/* 80252760 0024DF80  38 64 8B 80 */	addi r3, r4, lbl_80638B80@l
/* 80252764 0024DF84  90 0D A2 10 */	stw r0, lbl_8066CA10@sda21(r0)
/* 80252768 0024DF88  D0 0D A2 14 */	stfs f0, lbl_8066CA14@sda21(r0)
/* 8025276C 0024DF8C  D0 04 8B 80 */	stfs f0, lbl_80638B80@l(r4)
/* 80252770 0024DF90  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80252774 0024DF94  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80252778 0024DF98  4E 80 00 20 */	blr
.endfn fn_80252750

# 0x80534DC0 - 0x80534DC4
.section .ctors, "a"
.balign 4
	.4byte fn_80252750
