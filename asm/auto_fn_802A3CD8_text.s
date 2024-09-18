.include "macros.inc"
.file "auto_fn_802A3CD8_text"

# 0x802A3CD8 - 0x802A3D04
.text
.balign 4

.fn fn_802A3CD8, global
/* 802A3CD8 0029F4F8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802A3CDC 0029F4FC  38 00 FF FF */	li r0, -0x1
/* 802A3CE0 0029F500  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802A3CE4 0029F504  3C 80 80 64 */	lis r4, lbl_80638D18@ha
/* 802A3CE8 0029F508  38 64 8D 18 */	addi r3, r4, lbl_80638D18@l
/* 802A3CEC 0029F50C  90 0D A3 C8 */	stw r0, lbl_8066CBC8@sda21(r0)
/* 802A3CF0 0029F510  D0 0D A3 CC */	stfs f0, lbl_8066CBCC@sda21(r0)
/* 802A3CF4 0029F514  D0 04 8D 18 */	stfs f0, lbl_80638D18@l(r4)
/* 802A3CF8 0029F518  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802A3CFC 0029F51C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802A3D00 0029F520  4E 80 00 20 */	blr
.endfn fn_802A3CD8

# 0x80534E28 - 0x80534E2C
.section .ctors, "a"
.balign 4
	.4byte fn_802A3CD8
