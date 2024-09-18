.include "macros.inc"
.file "auto_fn_801A63C8_text"

# 0x801A63C8 - 0x801A63F4
.text
.balign 4

.fn fn_801A63C8, global
/* 801A63C8 001A1BE8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801A63CC 001A1BEC  38 00 FF FF */	li r0, -0x1
/* 801A63D0 001A1BF0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801A63D4 001A1BF4  3C 80 80 64 */	lis r4, lbl_80638970@ha
/* 801A63D8 001A1BF8  38 64 89 70 */	addi r3, r4, lbl_80638970@l
/* 801A63DC 001A1BFC  90 0D 9F E8 */	stw r0, lbl_8066C7E8@sda21(r0)
/* 801A63E0 001A1C00  D0 0D 9F EC */	stfs f0, lbl_8066C7EC@sda21(r0)
/* 801A63E4 001A1C04  D0 04 89 70 */	stfs f0, lbl_80638970@l(r4)
/* 801A63E8 001A1C08  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801A63EC 001A1C0C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801A63F0 001A1C10  4E 80 00 20 */	blr
.endfn fn_801A63C8

# 0x80534D38 - 0x80534D3C
.section .ctors, "a"
.balign 4
	.4byte fn_801A63C8
