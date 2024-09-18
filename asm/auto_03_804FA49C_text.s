.include "macros.inc"
.file "auto_03_804FA49C_text"

# 0x804FA49C - 0x804FA4D8
.text
.balign 4

.fn fn_804FA49C, global
/* 804FA49C 004F5CBC  EC A1 18 2A */	fadds f5, f1, f3
/* 804FA4A0 004F5CC0  D0 23 00 00 */	stfs f1, 0x0(r3)
/* 804FA4A4 004F5CC4  EC 62 20 2A */	fadds f3, f2, f4
/* 804FA4A8 004F5CC8  FC 20 08 18 */	frsp f1, f1
/* 804FA4AC 004F5CCC  D0 43 00 04 */	stfs f2, 0x4(r3)
/* 804FA4B0 004F5CD0  FC 00 10 18 */	frsp f0, f2
/* 804FA4B4 004F5CD4  D0 A3 00 08 */	stfs f5, 0x8(r3)
/* 804FA4B8 004F5CD8  EC 25 08 28 */	fsubs f1, f5, f1
/* 804FA4BC 004F5CDC  EC 43 00 28 */	fsubs f2, f3, f0
/* 804FA4C0 004F5CE0  D0 63 00 0C */	stfs f3, 0xc(r3)
/* 804FA4C4 004F5CE4  D0 23 00 10 */	stfs f1, 0x10(r3)
/* 804FA4C8 004F5CE8  EC 01 10 24 */	fdivs f0, f1, f2
/* 804FA4CC 004F5CEC  D0 43 00 14 */	stfs f2, 0x14(r3)
/* 804FA4D0 004F5CF0  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 804FA4D4 004F5CF4  4E 80 00 20 */	blr
.endfn fn_804FA49C
