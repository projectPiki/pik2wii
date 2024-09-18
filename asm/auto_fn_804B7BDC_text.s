.include "macros.inc"
.file "auto_fn_804B7BDC_text"

# 0x804B7BDC - 0x804B7C08
.text
.balign 4

.fn fn_804B7BDC, global
/* 804B7BDC 004B33FC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B7BE0 004B3400  38 00 FF FF */	li r0, -0x1
/* 804B7BE4 004B3404  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B7BE8 004B3408  3C 80 80 64 */	lis r4, lbl_80639540@ha
/* 804B7BEC 004B340C  38 64 95 40 */	addi r3, r4, lbl_80639540@l
/* 804B7BF0 004B3410  90 0D AA 38 */	stw r0, lbl_8066D238@sda21(r0)
/* 804B7BF4 004B3414  D0 0D AA 3C */	stfs f0, lbl_8066D23C@sda21(r0)
/* 804B7BF8 004B3418  D0 04 95 40 */	stfs f0, lbl_80639540@l(r4)
/* 804B7BFC 004B341C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B7C00 004B3420  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B7C04 004B3424  4E 80 00 20 */	blr
.endfn fn_804B7BDC

# 0x80535038 - 0x8053503C
.section .ctors, "a"
.balign 4
	.4byte fn_804B7BDC
