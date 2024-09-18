.include "macros.inc"
.file "auto_fn_802BE808_text"

# 0x802BE808 - 0x802BE834
.text
.balign 4

.fn fn_802BE808, global
/* 802BE808 002BA028  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802BE80C 002BA02C  38 00 FF FF */	li r0, -0x1
/* 802BE810 002BA030  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802BE814 002BA034  3C 80 80 64 */	lis r4, lbl_80638DB8@ha
/* 802BE818 002BA038  38 64 8D B8 */	addi r3, r4, lbl_80638DB8@l
/* 802BE81C 002BA03C  90 0D A4 38 */	stw r0, lbl_8066CC38@sda21(r0)
/* 802BE820 002BA040  D0 0D A4 3C */	stfs f0, lbl_8066CC3C@sda21(r0)
/* 802BE824 002BA044  D0 04 8D B8 */	stfs f0, lbl_80638DB8@l(r4)
/* 802BE828 002BA048  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802BE82C 002BA04C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802BE830 002BA050  4E 80 00 20 */	blr
.endfn fn_802BE808

# 0x80534E54 - 0x80534E58
.section .ctors, "a"
.balign 4
	.4byte fn_802BE808
