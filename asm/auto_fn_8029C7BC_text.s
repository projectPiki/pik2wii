.include "macros.inc"
.file "auto_fn_8029C7BC_text"

# 0x8029C7BC - 0x8029C7E8
.text
.balign 4

.fn fn_8029C7BC, global
/* 8029C7BC 00297FDC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8029C7C0 00297FE0  38 00 FF FF */	li r0, -0x1
/* 8029C7C4 00297FE4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8029C7C8 00297FE8  3C 80 80 64 */	lis r4, lbl_80638CC0@ha
/* 8029C7CC 00297FEC  38 64 8C C0 */	addi r3, r4, lbl_80638CC0@l
/* 8029C7D0 00297FF0  90 0D A3 80 */	stw r0, lbl_8066CB80@sda21(r0)
/* 8029C7D4 00297FF4  D0 0D A3 84 */	stfs f0, lbl_8066CB84@sda21(r0)
/* 8029C7D8 00297FF8  D0 04 8C C0 */	stfs f0, lbl_80638CC0@l(r4)
/* 8029C7DC 00297FFC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8029C7E0 00298000  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8029C7E4 00298004  4E 80 00 20 */	blr
.endfn fn_8029C7BC

# 0x80534E14 - 0x80534E18
.section .ctors, "a"
.balign 4
	.4byte fn_8029C7BC
