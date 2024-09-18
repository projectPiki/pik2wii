.include "macros.inc"
.file "auto_fn_802AA91C_text"

# 0x802AA91C - 0x802AA948
.text
.balign 4

.fn fn_802AA91C, global
/* 802AA91C 002A613C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802AA920 002A6140  38 00 FF FF */	li r0, -0x1
/* 802AA924 002A6144  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802AA928 002A6148  3C 80 80 64 */	lis r4, lbl_80638D28@ha
/* 802AA92C 002A614C  38 64 8D 28 */	addi r3, r4, lbl_80638D28@l
/* 802AA930 002A6150  90 0D A3 D0 */	stw r0, lbl_8066CBD0@sda21(r0)
/* 802AA934 002A6154  D0 0D A3 D4 */	stfs f0, lbl_8066CBD4@sda21(r0)
/* 802AA938 002A6158  D0 04 8D 28 */	stfs f0, lbl_80638D28@l(r4)
/* 802AA93C 002A615C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802AA940 002A6160  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802AA944 002A6164  4E 80 00 20 */	blr
.endfn fn_802AA91C

# 0x80534E2C - 0x80534E30
.section .ctors, "a"
.balign 4
	.4byte fn_802AA91C
