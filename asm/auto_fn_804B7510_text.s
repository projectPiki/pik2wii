.include "macros.inc"
.file "auto_fn_804B7510_text"

# 0x804B7510 - 0x804B753C
.text
.balign 4

.fn fn_804B7510, global
/* 804B7510 004B2D30  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B7514 004B2D34  38 00 FF FF */	li r0, -0x1
/* 804B7518 004B2D38  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B751C 004B2D3C  3C 80 80 64 */	lis r4, lbl_80639530@ha
/* 804B7520 004B2D40  38 64 95 30 */	addi r3, r4, lbl_80639530@l
/* 804B7524 004B2D44  90 0D AA 30 */	stw r0, lbl_8066D230@sda21(r0)
/* 804B7528 004B2D48  D0 0D AA 34 */	stfs f0, lbl_8066D234@sda21(r0)
/* 804B752C 004B2D4C  D0 04 95 30 */	stfs f0, lbl_80639530@l(r4)
/* 804B7530 004B2D50  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B7534 004B2D54  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B7538 004B2D58  4E 80 00 20 */	blr
.endfn fn_804B7510

# 0x80535034 - 0x80535038
.section .ctors, "a"
.balign 4
	.4byte fn_804B7510
