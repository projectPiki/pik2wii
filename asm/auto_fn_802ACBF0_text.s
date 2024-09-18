.include "macros.inc"
.file "auto_fn_802ACBF0_text"

# 0x802ACBF0 - 0x802ACC1C
.text
.balign 4

.fn fn_802ACBF0, global
/* 802ACBF0 002A8410  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802ACBF4 002A8414  38 00 FF FF */	li r0, -0x1
/* 802ACBF8 002A8418  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802ACBFC 002A841C  3C 80 80 64 */	lis r4, lbl_80638D38@ha
/* 802ACC00 002A8420  38 64 8D 38 */	addi r3, r4, lbl_80638D38@l
/* 802ACC04 002A8424  90 0D A3 E8 */	stw r0, lbl_8066CBE8@sda21(r0)
/* 802ACC08 002A8428  D0 0D A3 EC */	stfs f0, lbl_8066CBEC@sda21(r0)
/* 802ACC0C 002A842C  D0 04 8D 38 */	stfs f0, lbl_80638D38@l(r4)
/* 802ACC10 002A8430  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802ACC14 002A8434  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802ACC18 002A8438  4E 80 00 20 */	blr
.endfn fn_802ACBF0

# 0x80534E30 - 0x80534E34
.section .ctors, "a"
.balign 4
	.4byte fn_802ACBF0
