.include "macros.inc"
.file "auto_fn_801F5D20_text"

# 0x801F5D20 - 0x801F5D4C
.text
.balign 4

.fn fn_801F5D20, global
/* 801F5D20 001F1540  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801F5D24 001F1544  38 00 FF FF */	li r0, -0x1
/* 801F5D28 001F1548  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801F5D2C 001F154C  3C 80 80 64 */	lis r4, lbl_80638A70@ha
/* 801F5D30 001F1550  38 64 8A 70 */	addi r3, r4, lbl_80638A70@l
/* 801F5D34 001F1554  90 0D A1 08 */	stw r0, lbl_8066C908@sda21(r0)
/* 801F5D38 001F1558  D0 0D A1 0C */	stfs f0, lbl_8066C90C@sda21(r0)
/* 801F5D3C 001F155C  D0 04 8A 70 */	stfs f0, lbl_80638A70@l(r4)
/* 801F5D40 001F1560  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801F5D44 001F1564  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801F5D48 001F1568  4E 80 00 20 */	blr
.endfn fn_801F5D20

# 0x80534D7C - 0x80534D80
.section .ctors, "a"
.balign 4
	.4byte fn_801F5D20
