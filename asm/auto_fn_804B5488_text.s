.include "macros.inc"
.file "auto_fn_804B5488_text"

# 0x804B5488 - 0x804B54B4
.text
.balign 4

.fn fn_804B5488, global
/* 804B5488 004B0CA8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804B548C 004B0CAC  38 00 FF FF */	li r0, -0x1
/* 804B5490 004B0CB0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804B5494 004B0CB4  3C 80 80 64 */	lis r4, lbl_80639520@ha
/* 804B5498 004B0CB8  38 64 95 20 */	addi r3, r4, lbl_80639520@l
/* 804B549C 004B0CBC  90 0D AA 20 */	stw r0, lbl_8066D220@sda21(r0)
/* 804B54A0 004B0CC0  D0 0D AA 24 */	stfs f0, lbl_8066D224@sda21(r0)
/* 804B54A4 004B0CC4  D0 04 95 20 */	stfs f0, lbl_80639520@l(r4)
/* 804B54A8 004B0CC8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804B54AC 004B0CCC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804B54B0 004B0CD0  4E 80 00 20 */	blr
.endfn fn_804B5488

# 0x80535030 - 0x80535034
.section .ctors, "a"
.balign 4
	.4byte fn_804B5488
