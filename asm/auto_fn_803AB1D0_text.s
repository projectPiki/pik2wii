.include "macros.inc"
.file "auto_fn_803AB1D0_text"

# 0x803AB1D0 - 0x803AB1FC
.text
.balign 4

.fn fn_803AB1D0, global
/* 803AB1D0 003A69F0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803AB1D4 003A69F4  38 00 FF FF */	li r0, -0x1
/* 803AB1D8 003A69F8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803AB1DC 003A69FC  3C 80 80 64 */	lis r4, lbl_806392B8@ha
/* 803AB1E0 003A6A00  38 64 92 B8 */	addi r3, r4, lbl_806392B8@l
/* 803AB1E4 003A6A04  90 0D A6 30 */	stw r0, lbl_8066CE30@sda21(r0)
/* 803AB1E8 003A6A08  D0 0D A6 34 */	stfs f0, lbl_8066CE34@sda21(r0)
/* 803AB1EC 003A6A0C  D0 04 92 B8 */	stfs f0, lbl_806392B8@l(r4)
/* 803AB1F0 003A6A10  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803AB1F4 003A6A14  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803AB1F8 003A6A18  4E 80 00 20 */	blr
.endfn fn_803AB1D0

# 0x80534F44 - 0x80534F48
.section .ctors, "a"
.balign 4
	.4byte fn_803AB1D0
