.include "macros.inc"
.file "auto_03_804FAC64_text"

# 0x804FAC64 - 0x804FACE8
.text
.balign 4

.fn fn_804FAC64, global
/* 804FAC64 004F6484  4B C2 EE C8 */	b fn_80129B2C
.endfn fn_804FAC64

.fn fn_804FAC68, global
/* 804FAC68 004F6488  C0 22 09 94 */	lfs f1, lbl_80675E74@sda21(r0)
/* 804FAC6C 004F648C  C0 02 09 90 */	lfs f0, lbl_80675E70@sda21(r0)
/* 804FAC70 004F6490  D0 23 00 04 */	stfs f1, 0x4(r3)
/* 804FAC74 004F6494  D0 23 00 08 */	stfs f1, 0x8(r3)
/* 804FAC78 004F6498  D0 23 00 0C */	stfs f1, 0xc(r3)
/* 804FAC7C 004F649C  D0 23 00 10 */	stfs f1, 0x10(r3)
/* 804FAC80 004F64A0  D0 23 00 18 */	stfs f1, 0x18(r3)
/* 804FAC84 004F64A4  D0 23 00 1C */	stfs f1, 0x1c(r3)
/* 804FAC88 004F64A8  D0 23 00 20 */	stfs f1, 0x20(r3)
/* 804FAC8C 004F64AC  D0 23 00 24 */	stfs f1, 0x24(r3)
/* 804FAC90 004F64B0  D0 23 00 2C */	stfs f1, 0x2c(r3)
/* 804FAC94 004F64B4  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 804FAC98 004F64B8  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 804FAC9C 004F64BC  D0 03 00 00 */	stfs f0, 0x0(r3)
/* 804FACA0 004F64C0  4E 80 00 20 */	blr
.endfn fn_804FAC68

.fn fn_804FACA4, global
/* 804FACA4 004F64C4  C1 61 00 08 */	lfs f11, 0x8(r1)
/* 804FACA8 004F64C8  C1 41 00 0C */	lfs f10, 0xc(r1)
/* 804FACAC 004F64CC  C1 21 00 10 */	lfs f9, 0x10(r1)
/* 804FACB0 004F64D0  C0 01 00 14 */	lfs f0, 0x14(r1)
/* 804FACB4 004F64D4  D0 23 00 00 */	stfs f1, 0x0(r3)
/* 804FACB8 004F64D8  D0 43 00 04 */	stfs f2, 0x4(r3)
/* 804FACBC 004F64DC  D0 63 00 08 */	stfs f3, 0x8(r3)
/* 804FACC0 004F64E0  D0 83 00 0C */	stfs f4, 0xc(r3)
/* 804FACC4 004F64E4  D0 A3 00 10 */	stfs f5, 0x10(r3)
/* 804FACC8 004F64E8  D0 C3 00 14 */	stfs f6, 0x14(r3)
/* 804FACCC 004F64EC  D0 E3 00 18 */	stfs f7, 0x18(r3)
/* 804FACD0 004F64F0  D1 03 00 1C */	stfs f8, 0x1c(r3)
/* 804FACD4 004F64F4  D1 63 00 20 */	stfs f11, 0x20(r3)
/* 804FACD8 004F64F8  D1 43 00 24 */	stfs f10, 0x24(r3)
/* 804FACDC 004F64FC  D1 23 00 28 */	stfs f9, 0x28(r3)
/* 804FACE0 004F6500  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 804FACE4 004F6504  4E 80 00 20 */	blr
.endfn fn_804FACA4