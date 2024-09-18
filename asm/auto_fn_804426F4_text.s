.include "macros.inc"
.file "auto_fn_804426F4_text"

# 0x804426F4 - 0x80442720
.text
.balign 4

.fn fn_804426F4, global
/* 804426F4 0043DF14  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804426F8 0043DF18  38 00 FF FF */	li r0, -0x1
/* 804426FC 0043DF1C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80442700 0043DF20  3C 80 80 64 */	lis r4, lbl_80639408@ha
/* 80442704 0043DF24  38 64 94 08 */	addi r3, r4, lbl_80639408@l
/* 80442708 0043DF28  90 0D A8 68 */	stw r0, lbl_8066D068@sda21(r0)
/* 8044270C 0043DF2C  D0 0D A8 6C */	stfs f0, lbl_8066D06C@sda21(r0)
/* 80442710 0043DF30  D0 04 94 08 */	stfs f0, lbl_80639408@l(r4)
/* 80442714 0043DF34  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80442718 0043DF38  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8044271C 0043DF3C  4E 80 00 20 */	blr
.endfn fn_804426F4

# 0x80534FB4 - 0x80534FB8
.section .ctors, "a"
.balign 4
	.4byte fn_804426F4
