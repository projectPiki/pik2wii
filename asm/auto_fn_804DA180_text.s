.include "macros.inc"
.file "auto_fn_804DA180_text"

# 0x804DA180 - 0x804DA1AC
.text
.balign 4

.fn fn_804DA180, global
/* 804DA180 004D59A0  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804DA184 004D59A4  38 00 FF FF */	li r0, -0x1
/* 804DA188 004D59A8  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804DA18C 004D59AC  3C 80 80 64 */	lis r4, lbl_8063E510@ha
/* 804DA190 004D59B0  38 64 E5 10 */	addi r3, r4, lbl_8063E510@l
/* 804DA194 004D59B4  90 0D AB 40 */	stw r0, lbl_8066D340@sda21(r0)
/* 804DA198 004D59B8  D0 0D AB 44 */	stfs f0, lbl_8066D344@sda21(r0)
/* 804DA19C 004D59BC  D0 04 E5 10 */	stfs f0, lbl_8063E510@l(r4)
/* 804DA1A0 004D59C0  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804DA1A4 004D59C4  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804DA1A8 004D59C8  4E 80 00 20 */	blr
.endfn fn_804DA180

# 0x80535080 - 0x80535084
.section .ctors, "a"
.balign 4
	.4byte fn_804DA180
