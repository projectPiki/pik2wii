.include "macros.inc"
.file "auto_fn_804B2994_text"

# 0x804B2994 - 0x804B29C0
.text
.balign 4

.fn fn_804B2994, global
/* 804B2994 004AE1B4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B2998 004AE1B8  38 00 FF FF */	li r0, -0x1
/* 804B299C 004AE1BC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B29A0 004AE1C0  3C 80 80 64 */	lis r4, lbl_80639500@ha
/* 804B29A4 004AE1C4  38 64 95 00 */	addi r3, r4, lbl_80639500@l
/* 804B29A8 004AE1C8  90 0D AA 10 */	stw r0, lbl_8066D210@sda21(r0)
/* 804B29AC 004AE1CC  D0 0D AA 14 */	stfs f0, lbl_8066D214@sda21(r0)
/* 804B29B0 004AE1D0  D0 04 95 00 */	stfs f0, lbl_80639500@l(r4)
/* 804B29B4 004AE1D4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B29B8 004AE1D8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B29BC 004AE1DC  4E 80 00 20 */	blr
.endfn fn_804B2994

# 0x80535028 - 0x8053502C
.section .ctors, "a"
.balign 4
	.4byte fn_804B2994
