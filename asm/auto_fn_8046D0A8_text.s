.include "macros.inc"
.file "auto_fn_8046D0A8_text"

# 0x8046D0A8 - 0x8046D0D4
.text
.balign 4

.fn fn_8046D0A8, global
/* 8046D0A8 004688C8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8046D0AC 004688CC  38 00 FF FF */	li r0, -0x1
/* 8046D0B0 004688D0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8046D0B4 004688D4  3C 80 80 64 */	lis r4, lbl_80639428@ha
/* 8046D0B8 004688D8  38 64 94 28 */	addi r3, r4, lbl_80639428@l
/* 8046D0BC 004688DC  90 0D A9 20 */	stw r0, lbl_8066D120@sda21(r0)
/* 8046D0C0 004688E0  D0 0D A9 24 */	stfs f0, lbl_8066D124@sda21(r0)
/* 8046D0C4 004688E4  D0 04 94 28 */	stfs f0, lbl_80639428@l(r4)
/* 8046D0C8 004688E8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8046D0CC 004688EC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8046D0D0 004688F0  4E 80 00 20 */	blr
.endfn fn_8046D0A8

# 0x80534FD0 - 0x80534FD4
.section .ctors, "a"
.balign 4
	.4byte fn_8046D0A8
