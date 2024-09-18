.include "macros.inc"
.file "auto_fn_802BEC1C_text"

# 0x802BEC1C - 0x802BEC48
.text
.balign 4

.fn fn_802BEC1C, global
/* 802BEC1C 002BA43C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802BEC20 002BA440  38 00 FF FF */	li r0, -0x1
/* 802BEC24 002BA444  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802BEC28 002BA448  3C 80 80 64 */	lis r4, lbl_80638DC8@ha
/* 802BEC2C 002BA44C  38 64 8D C8 */	addi r3, r4, lbl_80638DC8@l
/* 802BEC30 002BA450  90 0D A4 40 */	stw r0, lbl_8066CC40@sda21(r0)
/* 802BEC34 002BA454  D0 0D A4 44 */	stfs f0, lbl_8066CC44@sda21(r0)
/* 802BEC38 002BA458  D0 04 8D C8 */	stfs f0, lbl_80638DC8@l(r4)
/* 802BEC3C 002BA45C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802BEC40 002BA460  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802BEC44 002BA464  4E 80 00 20 */	blr
.endfn fn_802BEC1C

# 0x80534E58 - 0x80534E5C
.section .ctors, "a"
.balign 4
	.4byte fn_802BEC1C
