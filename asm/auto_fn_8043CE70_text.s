.include "macros.inc"
.file "auto_fn_8043CE70_text"

# 0x8043CE70 - 0x8043CE9C
.text
.balign 4

.fn fn_8043CE70, global
/* 8043CE70 00438690  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8043CE74 00438694  38 00 FF FF */	li r0, -0x1
/* 8043CE78 00438698  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8043CE7C 0043869C  3C 80 80 64 */	lis r4, lbl_806393C8@ha
/* 8043CE80 004386A0  38 64 93 C8 */	addi r3, r4, lbl_806393C8@l
/* 8043CE84 004386A4  90 0D A8 30 */	stw r0, lbl_8066D030@sda21(r0)
/* 8043CE88 004386A8  D0 0D A8 34 */	stfs f0, lbl_8066D034@sda21(r0)
/* 8043CE8C 004386AC  D0 04 93 C8 */	stfs f0, lbl_806393C8@l(r4)
/* 8043CE90 004386B0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8043CE94 004386B4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8043CE98 004386B8  4E 80 00 20 */	blr
.endfn fn_8043CE70

# 0x80534FA4 - 0x80534FA8
.section .ctors, "a"
.balign 4
	.4byte fn_8043CE70
