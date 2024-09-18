.include "macros.inc"
.file "auto_fn_804C0564_text"

# 0x804C0564 - 0x804C0590
.text
.balign 4

.fn fn_804C0564, global
/* 804C0564 004BBD84  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804C0568 004BBD88  38 00 FF FF */	li r0, -0x1
/* 804C056C 004BBD8C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804C0570 004BBD90  3C 80 80 64 */	lis r4, lbl_806395E0@ha
/* 804C0574 004BBD94  38 64 95 E0 */	addi r3, r4, lbl_806395E0@l
/* 804C0578 004BBD98  90 0D AA A0 */	stw r0, lbl_8066D2A0@sda21(r0)
/* 804C057C 004BBD9C  D0 0D AA A4 */	stfs f0, lbl_8066D2A4@sda21(r0)
/* 804C0580 004BBDA0  D0 04 95 E0 */	stfs f0, lbl_806395E0@l(r4)
/* 804C0584 004BBDA4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804C0588 004BBDA8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804C058C 004BBDAC  4E 80 00 20 */	blr
.endfn fn_804C0564

# 0x80535060 - 0x80535064
.section .ctors, "a"
.balign 4
	.4byte fn_804C0564
