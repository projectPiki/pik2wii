.include "macros.inc"
.file "auto_fn_8029BB08_text"

# 0x8029BB08 - 0x8029BB34
.text
.balign 4

.fn fn_8029BB08, global
/* 8029BB08 00297328  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8029BB0C 0029732C  38 00 FF FF */	li r0, -0x1
/* 8029BB10 00297330  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8029BB14 00297334  3C 80 80 64 */	lis r4, lbl_80638CB0@ha
/* 8029BB18 00297338  38 64 8C B0 */	addi r3, r4, lbl_80638CB0@l
/* 8029BB1C 0029733C  90 0D A3 78 */	stw r0, lbl_8066CB78@sda21(r0)
/* 8029BB20 00297340  D0 0D A3 7C */	stfs f0, lbl_8066CB7C@sda21(r0)
/* 8029BB24 00297344  D0 04 8C B0 */	stfs f0, lbl_80638CB0@l(r4)
/* 8029BB28 00297348  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8029BB2C 0029734C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8029BB30 00297350  4E 80 00 20 */	blr
.endfn fn_8029BB08

# 0x80534E10 - 0x80534E14
.section .ctors, "a"
.balign 4
	.4byte fn_8029BB08
