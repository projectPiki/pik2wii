.include "macros.inc"
.file "auto_fn_8026EC98_text"

# 0x8026EC98 - 0x8026ECC4
.text
.balign 4

.fn fn_8026EC98, global
/* 8026EC98 0026A4B8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8026EC9C 0026A4BC  38 00 FF FF */	li r0, -0x1
/* 8026ECA0 0026A4C0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8026ECA4 0026A4C4  3C 80 80 64 */	lis r4, lbl_80638BD0@ha
/* 8026ECA8 0026A4C8  38 64 8B D0 */	addi r3, r4, lbl_80638BD0@l
/* 8026ECAC 0026A4CC  90 0D A2 90 */	stw r0, lbl_8066CA90@sda21(r0)
/* 8026ECB0 0026A4D0  D0 0D A2 94 */	stfs f0, lbl_8066CA94@sda21(r0)
/* 8026ECB4 0026A4D4  D0 04 8B D0 */	stfs f0, lbl_80638BD0@l(r4)
/* 8026ECB8 0026A4D8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8026ECBC 0026A4DC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8026ECC0 0026A4E0  4E 80 00 20 */	blr
.endfn fn_8026EC98

# 0x80534DD8 - 0x80534DDC
.section .ctors, "a"
.balign 4
	.4byte fn_8026EC98
