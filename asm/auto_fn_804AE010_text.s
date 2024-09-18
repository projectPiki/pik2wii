.include "macros.inc"
.file "auto_fn_804AE010_text"

# 0x804AE010 - 0x804AE03C
.text
.balign 4

.fn fn_804AE010, global
/* 804AE010 004A9830  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804AE014 004A9834  38 00 FF FF */	li r0, -0x1
/* 804AE018 004A9838  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804AE01C 004A983C  3C 80 80 64 */	lis r4, lbl_806394E0@ha
/* 804AE020 004A9840  38 64 94 E0 */	addi r3, r4, lbl_806394E0@l
/* 804AE024 004A9844  90 0D A9 D8 */	stw r0, lbl_8066D1D8@sda21(r0)
/* 804AE028 004A9848  D0 0D A9 DC */	stfs f0, lbl_8066D1DC@sda21(r0)
/* 804AE02C 004A984C  D0 04 94 E0 */	stfs f0, lbl_806394E0@l(r4)
/* 804AE030 004A9850  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804AE034 004A9854  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804AE038 004A9858  4E 80 00 20 */	blr
.endfn fn_804AE010

# 0x80535020 - 0x80535024
.section .ctors, "a"
.balign 4
	.4byte fn_804AE010
