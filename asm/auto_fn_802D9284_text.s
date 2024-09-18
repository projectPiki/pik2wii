.include "macros.inc"
.file "auto_fn_802D9284_text"

# 0x802D9284 - 0x802D92B0
.text
.balign 4

.fn fn_802D9284, global
/* 802D9284 002D4AA4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802D9288 002D4AA8  38 00 FF FF */	li r0, -0x1
/* 802D928C 002D4AAC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802D9290 002D4AB0  3C 80 80 64 */	lis r4, lbl_806390A8@ha
/* 802D9294 002D4AB4  38 64 90 A8 */	addi r3, r4, lbl_806390A8@l
/* 802D9298 002D4AB8  90 0D A4 D0 */	stw r0, lbl_8066CCD0@sda21(r0)
/* 802D929C 002D4ABC  D0 0D A4 D4 */	stfs f0, lbl_8066CCD4@sda21(r0)
/* 802D92A0 002D4AC0  D0 04 90 A8 */	stfs f0, lbl_806390A8@l(r4)
/* 802D92A4 002D4AC4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802D92A8 002D4AC8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802D92AC 002D4ACC  4E 80 00 20 */	blr
.endfn fn_802D9284

# 0x80534E84 - 0x80534E88
.section .ctors, "a"
.balign 4
	.4byte fn_802D9284
