.include "macros.inc"
.file "auto_fn_80439D18_text"

# 0x80439D18 - 0x80439D44
.text
.balign 4

.fn fn_80439D18, global
/* 80439D18 00435538  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80439D1C 0043553C  38 00 FF FF */	li r0, -0x1
/* 80439D20 00435540  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80439D24 00435544  3C 80 80 64 */	lis r4, lbl_806393B8@ha
/* 80439D28 00435548  38 64 93 B8 */	addi r3, r4, lbl_806393B8@l
/* 80439D2C 0043554C  90 0D A8 20 */	stw r0, lbl_8066D020@sda21(r0)
/* 80439D30 00435550  D0 0D A8 24 */	stfs f0, lbl_8066D024@sda21(r0)
/* 80439D34 00435554  D0 04 93 B8 */	stfs f0, lbl_806393B8@l(r4)
/* 80439D38 00435558  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80439D3C 0043555C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80439D40 00435560  4E 80 00 20 */	blr
.endfn fn_80439D18

# 0x80534FA0 - 0x80534FA4
.section .ctors, "a"
.balign 4
	.4byte fn_80439D18
