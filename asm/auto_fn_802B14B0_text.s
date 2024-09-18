.include "macros.inc"
.file "auto_fn_802B14B0_text"

# 0x802B14B0 - 0x802B14DC
.text
.balign 4

.fn fn_802B14B0, global
/* 802B14B0 002ACCD0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802B14B4 002ACCD4  38 00 FF FF */	li r0, -0x1
/* 802B14B8 002ACCD8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802B14BC 002ACCDC  3C 80 80 64 */	lis r4, lbl_80638D58@ha
/* 802B14C0 002ACCE0  38 64 8D 58 */	addi r3, r4, lbl_80638D58@l
/* 802B14C4 002ACCE4  90 0D A3 F8 */	stw r0, lbl_8066CBF8@sda21(r0)
/* 802B14C8 002ACCE8  D0 0D A3 FC */	stfs f0, lbl_8066CBFC@sda21(r0)
/* 802B14CC 002ACCEC  D0 04 8D 58 */	stfs f0, lbl_80638D58@l(r4)
/* 802B14D0 002ACCF0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802B14D4 002ACCF4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802B14D8 002ACCF8  4E 80 00 20 */	blr
.endfn fn_802B14B0

# 0x80534E38 - 0x80534E3C
.section .ctors, "a"
.balign 4
	.4byte fn_802B14B0
