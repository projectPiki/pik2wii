.include "macros.inc"
.file "auto_fn_803B06B0_text"

# 0x803B06B0 - 0x803B06C4
.text
.balign 4

.fn fn_803B06B0, global
/* 803B06B0 003ABED0  C0 02 E3 D8 */	lfs f0, lbl_806738B8@sda21(r0)
/* 803B06B4 003ABED4  38 6D A6 50 */	li r3, lbl_8066CE50@sda21
/* 803B06B8 003ABED8  D0 0D A6 50 */	stfs f0, lbl_8066CE50@sda21(r0)
/* 803B06BC 003ABEDC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803B06C0 003ABEE0  4E 80 00 20 */	blr
.endfn fn_803B06B0

# 0x80534F50 - 0x80534F54
.section .ctors, "a"
.balign 4
	.4byte fn_803B06B0
