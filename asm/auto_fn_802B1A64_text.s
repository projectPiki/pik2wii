.include "macros.inc"
.file "auto_fn_802B1A64_text"

# 0x802B1A64 - 0x802B1A90
.text
.balign 4

.fn fn_802B1A64, global
/* 802B1A64 002AD284  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802B1A68 002AD288  38 00 FF FF */	li r0, -0x1
/* 802B1A6C 002AD28C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802B1A70 002AD290  3C 80 80 64 */	lis r4, lbl_80638D68@ha
/* 802B1A74 002AD294  38 64 8D 68 */	addi r3, r4, lbl_80638D68@l
/* 802B1A78 002AD298  90 0D A4 00 */	stw r0, lbl_8066CC00@sda21(r0)
/* 802B1A7C 002AD29C  D0 0D A4 04 */	stfs f0, lbl_8066CC04@sda21(r0)
/* 802B1A80 002AD2A0  D0 04 8D 68 */	stfs f0, lbl_80638D68@l(r4)
/* 802B1A84 002AD2A4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802B1A88 002AD2A8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802B1A8C 002AD2AC  4E 80 00 20 */	blr
.endfn fn_802B1A64

# 0x80534E3C - 0x80534E40
.section .ctors, "a"
.balign 4
	.4byte fn_802B1A64
