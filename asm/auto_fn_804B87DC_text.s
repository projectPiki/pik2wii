.include "macros.inc"
.file "auto_fn_804B87DC_text"

# 0x804B87DC - 0x804B8808
.text
.balign 4

.fn fn_804B87DC, global
/* 804B87DC 004B3FFC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B87E0 004B4000  38 00 FF FF */	li r0, -0x1
/* 804B87E4 004B4004  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B87E8 004B4008  3C 80 80 64 */	lis r4, lbl_80639550@ha
/* 804B87EC 004B400C  38 64 95 50 */	addi r3, r4, lbl_80639550@l
/* 804B87F0 004B4010  90 0D AA 48 */	stw r0, lbl_8066D248@sda21(r0)
/* 804B87F4 004B4014  D0 0D AA 4C */	stfs f0, lbl_8066D24C@sda21(r0)
/* 804B87F8 004B4018  D0 04 95 50 */	stfs f0, lbl_80639550@l(r4)
/* 804B87FC 004B401C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B8800 004B4020  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B8804 004B4024  4E 80 00 20 */	blr
.endfn fn_804B87DC

# 0x8053503C - 0x80535040
.section .ctors, "a"
.balign 4
	.4byte fn_804B87DC
