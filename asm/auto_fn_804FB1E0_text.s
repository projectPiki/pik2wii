.include "macros.inc"
.file "auto_fn_804FB1E0_text"

# 0x804FB1E0 - 0x804FB224
.text
.balign 4

.fn fn_804FB1E0, global
/* 804FB1E0 004F6A00  3C 80 80 64 */	lis r4, lbl_80640D80@ha
/* 804FB1E4 004F6A04  C0 22 09 90 */	lfs f1, lbl_80675E70@sda21(r0)
/* 804FB1E8 004F6A08  38 64 0D 80 */	addi r3, r4, lbl_80640D80@l
/* 804FB1EC 004F6A0C  C0 02 09 94 */	lfs f0, lbl_80675E74@sda21(r0)
/* 804FB1F0 004F6A10  D0 24 0D 80 */	stfs f1, lbl_80640D80@l(r4)
/* 804FB1F4 004F6A14  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804FB1F8 004F6A18  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804FB1FC 004F6A1C  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 804FB200 004F6A20  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 804FB204 004F6A24  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 804FB208 004F6A28  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 804FB20C 004F6A2C  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 804FB210 004F6A30  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 804FB214 004F6A34  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 804FB218 004F6A38  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 804FB21C 004F6A3C  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 804FB220 004F6A40  4E 80 00 20 */	blr
.endfn fn_804FB1E0

# 0x8053509C - 0x805350A0
.section .ctors, "a"
.balign 4
	.4byte fn_804FB1E0
