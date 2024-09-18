.include "macros.inc"
.file "auto_fn_8035543C_text"

# 0x8035543C - 0x80355468
.text
.balign 4

.fn fn_8035543C, global
/* 8035543C 00350C5C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80355440 00350C60  38 00 FF FF */	li r0, -0x1
/* 80355444 00350C64  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80355448 00350C68  3C 80 80 64 */	lis r4, lbl_806391C8@ha
/* 8035544C 00350C6C  38 64 91 C8 */	addi r3, r4, lbl_806391C8@l
/* 80355450 00350C70  90 0D A5 78 */	stw r0, lbl_8066CD78@sda21(r0)
/* 80355454 00350C74  D0 0D A5 7C */	stfs f0, lbl_8066CD7C@sda21(r0)
/* 80355458 00350C78  D0 04 91 C8 */	stfs f0, lbl_806391C8@l(r4)
/* 8035545C 00350C7C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80355460 00350C80  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80355464 00350C84  4E 80 00 20 */	blr
.endfn fn_8035543C

# 0x80534ECC - 0x80534ED0
.section .ctors, "a"
.balign 4
	.4byte fn_8035543C
