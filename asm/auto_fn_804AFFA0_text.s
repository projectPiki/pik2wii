.include "macros.inc"
.file "auto_fn_804AFFA0_text"

# 0x804AFFA0 - 0x804AFFCC
.text
.balign 4

.fn fn_804AFFA0, global
/* 804AFFA0 004AB7C0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804AFFA4 004AB7C4  38 00 FF FF */	li r0, -0x1
/* 804AFFA8 004AB7C8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804AFFAC 004AB7CC  3C 80 80 64 */	lis r4, lbl_806394F0@ha
/* 804AFFB0 004AB7D0  38 64 94 F0 */	addi r3, r4, lbl_806394F0@l
/* 804AFFB4 004AB7D4  90 0D A9 F0 */	stw r0, lbl_8066D1F0@sda21(r0)
/* 804AFFB8 004AB7D8  D0 0D A9 F4 */	stfs f0, lbl_8066D1F4@sda21(r0)
/* 804AFFBC 004AB7DC  D0 04 94 F0 */	stfs f0, lbl_806394F0@l(r4)
/* 804AFFC0 004AB7E0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804AFFC4 004AB7E4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804AFFC8 004AB7E8  4E 80 00 20 */	blr
.endfn fn_804AFFA0

# 0x80535024 - 0x80535028
.section .ctors, "a"
.balign 4
	.4byte fn_804AFFA0
