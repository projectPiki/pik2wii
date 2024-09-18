.include "macros.inc"
.file "auto_fn_804B32E0_text"

# 0x804B32E0 - 0x804B330C
.text
.balign 4

.fn fn_804B32E0, global
/* 804B32E0 004AEB00  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B32E4 004AEB04  38 00 FF FF */	li r0, -0x1
/* 804B32E8 004AEB08  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B32EC 004AEB0C  3C 80 80 64 */	lis r4, lbl_80639510@ha
/* 804B32F0 004AEB10  38 64 95 10 */	addi r3, r4, lbl_80639510@l
/* 804B32F4 004AEB14  90 0D AA 18 */	stw r0, lbl_8066D218@sda21(r0)
/* 804B32F8 004AEB18  D0 0D AA 1C */	stfs f0, lbl_8066D21C@sda21(r0)
/* 804B32FC 004AEB1C  D0 04 95 10 */	stfs f0, lbl_80639510@l(r4)
/* 804B3300 004AEB20  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B3304 004AEB24  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B3308 004AEB28  4E 80 00 20 */	blr
.endfn fn_804B32E0

# 0x8053502C - 0x80535030
.section .ctors, "a"
.balign 4
	.4byte fn_804B32E0
