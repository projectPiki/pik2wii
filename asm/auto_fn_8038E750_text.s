.include "macros.inc"
.file "auto_fn_8038E750_text"

# 0x8038E750 - 0x8038E77C
.text
.balign 4

.fn fn_8038E750, global
/* 8038E750 00389F70  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8038E754 00389F74  38 00 FF FF */	li r0, -0x1
/* 8038E758 00389F78  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8038E75C 00389F7C  3C 80 80 64 */	lis r4, lbl_80639258@ha
/* 8038E760 00389F80  38 64 92 58 */	addi r3, r4, lbl_80639258@l
/* 8038E764 00389F84  90 0D A5 F0 */	stw r0, lbl_8066CDF0@sda21(r0)
/* 8038E768 00389F88  D0 0D A5 F4 */	stfs f0, lbl_8066CDF4@sda21(r0)
/* 8038E76C 00389F8C  D0 04 92 58 */	stfs f0, lbl_80639258@l(r4)
/* 8038E770 00389F90  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8038E774 00389F94  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8038E778 00389F98  4E 80 00 20 */	blr
.endfn fn_8038E750

# 0x80534EFC - 0x80534F00
.section .ctors, "a"
.balign 4
	.4byte fn_8038E750
