.include "macros.inc"
.file "auto_fn_804C5300_text"

# 0x804C5300 - 0x804C532C
.text
.balign 4

.fn fn_804C5300, global
/* 804C5300 004C0B20  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804C5304 004C0B24  38 00 FF FF */	li r0, -0x1
/* 804C5308 004C0B28  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804C530C 004C0B2C  3C 80 80 64 */	lis r4, lbl_80639728@ha
/* 804C5310 004C0B30  38 64 97 28 */	addi r3, r4, lbl_80639728@l
/* 804C5314 004C0B34  90 0D AA B8 */	stw r0, lbl_8066D2B8@sda21(r0)
/* 804C5318 004C0B38  D0 0D AA BC */	stfs f0, lbl_8066D2BC@sda21(r0)
/* 804C531C 004C0B3C  D0 04 97 28 */	stfs f0, lbl_80639728@l(r4)
/* 804C5320 004C0B40  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804C5324 004C0B44  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804C5328 004C0B48  4E 80 00 20 */	blr
.endfn fn_804C5300

# 0x80535068 - 0x8053506C
.section .ctors, "a"
.balign 4
	.4byte fn_804C5300
