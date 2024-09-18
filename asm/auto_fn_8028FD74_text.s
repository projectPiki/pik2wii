.include "macros.inc"
.file "auto_fn_8028FD74_text"

# 0x8028FD74 - 0x8028FDA0
.text
.balign 4

.fn fn_8028FD74, global
/* 8028FD74 0028B594  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8028FD78 0028B598  38 00 FF FF */	li r0, -0x1
/* 8028FD7C 0028B59C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8028FD80 0028B5A0  3C 80 80 64 */	lis r4, lbl_80638C60@ha
/* 8028FD84 0028B5A4  38 64 8C 60 */	addi r3, r4, lbl_80638C60@l
/* 8028FD88 0028B5A8  90 0D A3 40 */	stw r0, lbl_8066CB40@sda21(r0)
/* 8028FD8C 0028B5AC  D0 0D A3 44 */	stfs f0, lbl_8066CB44@sda21(r0)
/* 8028FD90 0028B5B0  D0 04 8C 60 */	stfs f0, lbl_80638C60@l(r4)
/* 8028FD94 0028B5B4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8028FD98 0028B5B8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8028FD9C 0028B5BC  4E 80 00 20 */	blr
.endfn fn_8028FD74

# 0x80534DFC - 0x80534E00
.section .ctors, "a"
.balign 4
	.4byte fn_8028FD74
