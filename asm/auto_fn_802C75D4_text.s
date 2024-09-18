.include "macros.inc"
.file "auto_fn_802C75D4_text"

# 0x802C75D4 - 0x802C7600
.text
.balign 4

.fn fn_802C75D4, global
/* 802C75D4 002C2DF4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802C75D8 002C2DF8  38 00 FF FF */	li r0, -0x1
/* 802C75DC 002C2DFC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802C75E0 002C2E00  3C 80 80 64 */	lis r4, lbl_80639078@ha
/* 802C75E4 002C2E04  38 64 90 78 */	addi r3, r4, lbl_80639078@l
/* 802C75E8 002C2E08  90 0D A4 98 */	stw r0, lbl_8066CC98@sda21(r0)
/* 802C75EC 002C2E0C  D0 0D A4 9C */	stfs f0, lbl_8066CC9C@sda21(r0)
/* 802C75F0 002C2E10  D0 04 90 78 */	stfs f0, lbl_80639078@l(r4)
/* 802C75F4 002C2E14  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802C75F8 002C2E18  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802C75FC 002C2E1C  4E 80 00 20 */	blr
.endfn fn_802C75D4

# 0x80534E78 - 0x80534E7C
.section .ctors, "a"
.balign 4
	.4byte fn_802C75D4
