.include "macros.inc"
.file "auto_fn_803165B8_text"

# 0x803165B8 - 0x803165E4
.text
.balign 4

.fn fn_803165B8, global
/* 803165B8 00311DD8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803165BC 00311DDC  38 00 FF FF */	li r0, -0x1
/* 803165C0 00311DE0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803165C4 00311DE4  3C 80 80 64 */	lis r4, lbl_80639108@ha
/* 803165C8 00311DE8  38 64 91 08 */	addi r3, r4, lbl_80639108@l
/* 803165CC 00311DEC  90 0D A5 00 */	stw r0, lbl_8066CD00@sda21(r0)
/* 803165D0 00311DF0  D0 0D A5 04 */	stfs f0, lbl_8066CD04@sda21(r0)
/* 803165D4 00311DF4  D0 04 91 08 */	stfs f0, lbl_80639108@l(r4)
/* 803165D8 00311DF8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803165DC 00311DFC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803165E0 00311E00  4E 80 00 20 */	blr
.endfn fn_803165B8

# 0x80534E9C - 0x80534EA0
.section .ctors, "a"
.balign 4
	.4byte fn_803165B8
