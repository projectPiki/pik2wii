.include "macros.inc"
.file "auto_fn_80392B0C_text"

# 0x80392B0C - 0x80392B38
.text
.balign 4

.fn fn_80392B0C, global
/* 80392B0C 0038E32C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80392B10 0038E330  38 00 FF FF */	li r0, -0x1
/* 80392B14 0038E334  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80392B18 0038E338  3C 80 80 64 */	lis r4, lbl_80639268@ha
/* 80392B1C 0038E33C  38 64 92 68 */	addi r3, r4, lbl_80639268@l
/* 80392B20 0038E340  90 0D A6 00 */	stw r0, lbl_8066CE00@sda21(r0)
/* 80392B24 0038E344  D0 0D A6 04 */	stfs f0, lbl_8066CE04@sda21(r0)
/* 80392B28 0038E348  D0 04 92 68 */	stfs f0, lbl_80639268@l(r4)
/* 80392B2C 0038E34C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80392B30 0038E350  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80392B34 0038E354  4E 80 00 20 */	blr
.endfn fn_80392B0C

# 0x80534F0C - 0x80534F10
.section .ctors, "a"
.balign 4
	.4byte fn_80392B0C
