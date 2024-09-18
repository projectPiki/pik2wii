.include "macros.inc"
.file "auto_fn_802B0BDC_text"

# 0x802B0BDC - 0x802B0C08
.text
.balign 4

.fn fn_802B0BDC, global
/* 802B0BDC 002AC3FC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802B0BE0 002AC400  38 00 FF FF */	li r0, -0x1
/* 802B0BE4 002AC404  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802B0BE8 002AC408  3C 80 80 64 */	lis r4, lbl_80638D48@ha
/* 802B0BEC 002AC40C  38 64 8D 48 */	addi r3, r4, lbl_80638D48@l
/* 802B0BF0 002AC410  90 0D A3 F0 */	stw r0, lbl_8066CBF0@sda21(r0)
/* 802B0BF4 002AC414  D0 0D A3 F4 */	stfs f0, lbl_8066CBF4@sda21(r0)
/* 802B0BF8 002AC418  D0 04 8D 48 */	stfs f0, lbl_80638D48@l(r4)
/* 802B0BFC 002AC41C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802B0C00 002AC420  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802B0C04 002AC424  4E 80 00 20 */	blr
.endfn fn_802B0BDC

# 0x80534E34 - 0x80534E38
.section .ctors, "a"
.balign 4
	.4byte fn_802B0BDC
