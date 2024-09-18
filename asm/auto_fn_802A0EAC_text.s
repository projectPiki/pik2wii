.include "macros.inc"
.file "auto_fn_802A0EAC_text"

# 0x802A0EAC - 0x802A0EF0
.text
.balign 4

.fn fn_802A0EAC, global
/* 802A0EAC 0029C6CC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802A0EB0 0029C6D0  3C C0 80 64 */	lis r6, lbl_80638D00@ha
/* 802A0EB4 0029C6D4  C0 23 AA A8 */	lfs f1, lbl_8066AAA8@l(r3)
/* 802A0EB8 0029C6D8  3C 80 80 64 */	lis r4, lbl_80638D0C@ha
/* 802A0EBC 0029C6DC  38 A6 8D 00 */	addi r5, r6, lbl_80638D00@l
/* 802A0EC0 0029C6E0  38 E0 FF FF */	li r7, -0x1
/* 802A0EC4 0029C6E4  38 00 00 00 */	li r0, 0x0
/* 802A0EC8 0029C6E8  C0 02 B4 84 */	lfs f0, lbl_80670964@sda21(r0)
/* 802A0ECC 0029C6EC  38 64 8D 0C */	addi r3, r4, lbl_80638D0C@l
/* 802A0ED0 0029C6F0  90 ED A3 C0 */	stw r7, lbl_8066CBC0@sda21(r0)
/* 802A0ED4 0029C6F4  D0 2D A3 C4 */	stfs f1, lbl_8066CBC4@sda21(r0)
/* 802A0ED8 0029C6F8  D0 26 8D 00 */	stfs f1, lbl_80638D00@l(r6)
/* 802A0EDC 0029C6FC  D0 25 00 04 */	stfs f1, 0x4(r5)
/* 802A0EE0 0029C700  D0 25 00 08 */	stfs f1, 0x8(r5)
/* 802A0EE4 0029C704  90 04 8D 0C */	stw r0, lbl_80638D0C@l(r4)
/* 802A0EE8 0029C708  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802A0EEC 0029C70C  4E 80 00 20 */	blr
.endfn fn_802A0EAC

# 0x80534E24 - 0x80534E28
.section .ctors, "a"
.balign 4
	.4byte fn_802A0EAC
