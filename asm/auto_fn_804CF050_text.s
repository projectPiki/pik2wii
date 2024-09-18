.include "macros.inc"
.file "auto_fn_804CF050_text"

# 0x804CF050 - 0x804CF07C
.text
.balign 4

.fn fn_804CF050, global
/* 804CF050 004CA870  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804CF054 004CA874  38 00 FF FF */	li r0, -0x1
/* 804CF058 004CA878  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804CF05C 004CA87C  3C 80 80 64 */	lis r4, lbl_80639758@ha
/* 804CF060 004CA880  38 64 97 58 */	addi r3, r4, lbl_80639758@l
/* 804CF064 004CA884  90 0D AA D8 */	stw r0, lbl_8066D2D8@sda21(r0)
/* 804CF068 004CA888  D0 0D AA DC */	stfs f0, lbl_8066D2DC@sda21(r0)
/* 804CF06C 004CA88C  D0 04 97 58 */	stfs f0, lbl_80639758@l(r4)
/* 804CF070 004CA890  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804CF074 004CA894  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804CF078 004CA898  4E 80 00 20 */	blr
.endfn fn_804CF050

# 0x80535074 - 0x80535078
.section .ctors, "a"
.balign 4
	.4byte fn_804CF050
