.include "macros.inc"
.file "auto_fn_803811D8_text"

# 0x803811D8 - 0x80381200
.text
.balign 4

.fn fn_803811D8, global
/* 803811D8 0037C9F8  3C 80 80 67 */	lis r4, lbl_80669B78@ha
/* 803811DC 0037C9FC  C0 42 DB 58 */	lfs f2, lbl_80673038@sda21(r0)
/* 803811E0 0037CA00  38 64 9B 78 */	addi r3, r4, lbl_80669B78@l
/* 803811E4 0037CA04  C0 22 DB 60 */	lfs f1, lbl_80673040@sda21(r0)
/* 803811E8 0037CA08  C0 02 DB 78 */	lfs f0, lbl_80673058@sda21(r0)
/* 803811EC 0037CA0C  D0 44 9B 78 */	stfs f2, lbl_80669B78@l(r4)
/* 803811F0 0037CA10  D0 23 00 04 */	stfs f1, 0x4(r3)
/* 803811F4 0037CA14  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803811F8 0037CA18  D0 43 00 0C */	stfs f2, 0xc(r3)
/* 803811FC 0037CA1C  4E 80 00 20 */	blr
.endfn fn_803811D8

# 0x80534EE4 - 0x80534EE8
.section .ctors, "a"
.balign 4
	.4byte fn_803811D8
