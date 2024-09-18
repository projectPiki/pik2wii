.include "macros.inc"
.file "auto_fn_804E24E8_text"

# 0x804E24E8 - 0x804E2514
.text
.balign 4

.fn fn_804E24E8, global
/* 804E24E8 004DDD08  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804E24EC 004DDD0C  38 00 FF FF */	li r0, -0x1
/* 804E24F0 004DDD10  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804E24F4 004DDD14  3C 80 80 64 */	lis r4, lbl_8063E530@ha
/* 804E24F8 004DDD18  38 64 E5 30 */	addi r3, r4, lbl_8063E530@l
/* 804E24FC 004DDD1C  90 0D AB 60 */	stw r0, lbl_8066D360@sda21(r0)
/* 804E2500 004DDD20  D0 0D AB 64 */	stfs f0, lbl_8066D364@sda21(r0)
/* 804E2504 004DDD24  D0 04 E5 30 */	stfs f0, lbl_8063E530@l(r4)
/* 804E2508 004DDD28  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804E250C 004DDD2C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804E2510 004DDD30  4E 80 00 20 */	blr
.endfn fn_804E24E8

# 0x80535088 - 0x8053508C
.section .ctors, "a"
.balign 4
	.4byte fn_804E24E8
