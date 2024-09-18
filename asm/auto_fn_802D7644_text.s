.include "macros.inc"
.file "auto_fn_802D7644_text"

# 0x802D7644 - 0x802D7670
.text
.balign 4

.fn fn_802D7644, global
/* 802D7644 002D2E64  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802D7648 002D2E68  38 00 FF FF */	li r0, -0x1
/* 802D764C 002D2E6C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802D7650 002D2E70  3C 80 80 64 */	lis r4, lbl_80639098@ha
/* 802D7654 002D2E74  38 64 90 98 */	addi r3, r4, lbl_80639098@l
/* 802D7658 002D2E78  90 0D A4 B8 */	stw r0, lbl_8066CCB8@sda21(r0)
/* 802D765C 002D2E7C  D0 0D A4 BC */	stfs f0, lbl_8066CCBC@sda21(r0)
/* 802D7660 002D2E80  D0 04 90 98 */	stfs f0, lbl_80639098@l(r4)
/* 802D7664 002D2E84  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802D7668 002D2E88  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802D766C 002D2E8C  4E 80 00 20 */	blr
.endfn fn_802D7644

# 0x80534E80 - 0x80534E84
.section .ctors, "a"
.balign 4
	.4byte fn_802D7644
