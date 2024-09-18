.include "macros.inc"
.file "auto_fn_8022D004_text"

# 0x8022D004 - 0x8022D030
.text
.balign 4

.fn fn_8022D004, global
/* 8022D004 00228824  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8022D008 00228828  38 00 FF FF */	li r0, -0x1
/* 8022D00C 0022882C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8022D010 00228830  3C 80 80 64 */	lis r4, lbl_80638AF0@ha
/* 8022D014 00228834  38 64 8A F0 */	addi r3, r4, lbl_80638AF0@l
/* 8022D018 00228838  90 0D A1 68 */	stw r0, lbl_8066C968@sda21(r0)
/* 8022D01C 0022883C  D0 0D A1 6C */	stfs f0, lbl_8066C96C@sda21(r0)
/* 8022D020 00228840  D0 04 8A F0 */	stfs f0, lbl_80638AF0@l(r4)
/* 8022D024 00228844  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8022D028 00228848  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8022D02C 0022884C  4E 80 00 20 */	blr
.endfn fn_8022D004

# 0x80534D9C - 0x80534DA0
.section .ctors, "a"
.balign 4
	.4byte fn_8022D004
