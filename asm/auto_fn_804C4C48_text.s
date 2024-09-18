.include "macros.inc"
.file "auto_fn_804C4C48_text"

# 0x804C4C48 - 0x804C4C74
.text
.balign 4

.fn fn_804C4C48, global
/* 804C4C48 004C0468  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804C4C4C 004C046C  38 00 FF FF */	li r0, -0x1
/* 804C4C50 004C0470  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804C4C54 004C0474  3C 80 80 64 */	lis r4, lbl_80639618@ha
/* 804C4C58 004C0478  38 64 96 18 */	addi r3, r4, lbl_80639618@l
/* 804C4C5C 004C047C  90 0D AA B0 */	stw r0, lbl_8066D2B0@sda21(r0)
/* 804C4C60 004C0480  D0 0D AA B4 */	stfs f0, lbl_8066D2B4@sda21(r0)
/* 804C4C64 004C0484  D0 04 96 18 */	stfs f0, lbl_80639618@l(r4)
/* 804C4C68 004C0488  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804C4C6C 004C048C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804C4C70 004C0490  4E 80 00 20 */	blr
.endfn fn_804C4C48

# 0x80535064 - 0x80535068
.section .ctors, "a"
.balign 4
	.4byte fn_804C4C48
