.include "macros.inc"
.file "auto_03_804F9D4C_text"

# 0x804F9D4C - 0x804F9E08
.text
.balign 4

.fn fn_804F9D4C, global
/* 804F9D4C 004F556C  4E 80 00 20 */	blr
.endfn fn_804F9D4C

.fn fn_804F9D50, global
/* 804F9D50 004F5570  80 C4 00 44 */	lwz r6, 0x44(r4)
/* 804F9D54 004F5574  C0 04 00 48 */	lfs f0, 0x48(r4)
/* 804F9D58 004F5578  C0 26 00 10 */	lfs f1, 0x10(r6)
/* 804F9D5C 004F557C  C0 42 09 48 */	lfs f2, lbl_80675E28@sda21(r0)
/* 804F9D60 004F5580  FC 80 00 50 */	fneg f4, f0
/* 804F9D64 004F5584  C0 06 00 14 */	lfs f0, 0x14(r6)
/* 804F9D68 004F5588  EC 62 00 72 */	fmuls f3, f2, f1
/* 804F9D6C 004F558C  C0 25 00 00 */	lfs f1, 0x0(r5)
/* 804F9D70 004F5590  EC 42 00 32 */	fmuls f2, f2, f0
/* 804F9D74 004F5594  C0 05 00 04 */	lfs f0, 0x4(r5)
/* 804F9D78 004F5598  D0 83 00 08 */	stfs f4, 0x8(r3)
/* 804F9D7C 004F559C  EC 21 18 28 */	fsubs f1, f1, f3
/* 804F9D80 004F55A0  EC 02 00 28 */	fsubs f0, f2, f0
/* 804F9D84 004F55A4  D0 23 00 00 */	stfs f1, 0x0(r3)
/* 804F9D88 004F55A8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804F9D8C 004F55AC  4E 80 00 20 */	blr
.endfn fn_804F9D50

.fn fn_804F9D90, global
/* 804F9D90 004F55B0  C0 44 00 5C */	lfs f2, 0x5c(r4)
/* 804F9D94 004F55B4  C0 02 09 3C */	lfs f0, lbl_80675E1C@sda21(r0)
/* 804F9D98 004F55B8  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 804F9D9C 004F55BC  40 81 00 08 */	ble .L_804F9DA4
/* 804F9DA0 004F55C0  48 00 00 08 */	b .L_804F9DA8
.L_804F9DA4:
/* 804F9DA4 004F55C4  FC 40 10 50 */	fneg f2, f2
.L_804F9DA8:
/* 804F9DA8 004F55C8  C0 64 00 50 */	lfs f3, 0x50(r4)
/* 804F9DAC 004F55CC  C0 02 09 3C */	lfs f0, lbl_80675E1C@sda21(r0)
/* 804F9DB0 004F55D0  FC 03 00 40 */	fcmpo cr0, f3, f0
/* 804F9DB4 004F55D4  40 81 00 08 */	ble .L_804F9DBC
/* 804F9DB8 004F55D8  48 00 00 08 */	b .L_804F9DC0
.L_804F9DBC:
/* 804F9DBC 004F55DC  FC 60 18 50 */	fneg f3, f3
.L_804F9DC0:
/* 804F9DC0 004F55E0  C0 05 00 00 */	lfs f0, 0x0(r5)
/* 804F9DC4 004F55E4  80 84 00 44 */	lwz r4, 0x44(r4)
/* 804F9DC8 004F55E8  EC A0 10 24 */	fdivs f5, f0, f2
/* 804F9DCC 004F55EC  C0 25 00 04 */	lfs f1, 0x4(r5)
/* 804F9DD0 004F55F0  C0 02 09 48 */	lfs f0, lbl_80675E28@sda21(r0)
/* 804F9DD4 004F55F4  C0 44 00 10 */	lfs f2, 0x10(r4)
/* 804F9DD8 004F55F8  C0 84 00 14 */	lfs f4, 0x14(r4)
/* 804F9DDC 004F55FC  EC C0 00 B2 */	fmuls f6, f0, f2
/* 804F9DE0 004F5600  EC 41 18 24 */	fdivs f2, f1, f3
/* 804F9DE4 004F5604  EC 00 01 32 */	fmuls f0, f0, f4
/* 804F9DE8 004F5608  EC A5 01 B2 */	fmuls f5, f5, f6
/* 804F9DEC 004F560C  EC 42 00 32 */	fmuls f2, f2, f0
/* 804F9DF0 004F5610  EC 26 28 2A */	fadds f1, f6, f5
/* 804F9DF4 004F5614  EC 00 10 28 */	fsubs f0, f0, f2
/* 804F9DF8 004F5618  D0 23 00 00 */	stfs f1, 0x0(r3)
/* 804F9DFC 004F561C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804F9E00 004F5620  4E 80 00 20 */	blr
.endfn fn_804F9D90

.fn fn_804F9E04, global
/* 804F9E04 004F5624  4E 80 00 20 */	blr
.endfn fn_804F9E04