.include "macros.inc"
.file "auto_fn_80481B4C_text"

# 0x80481B4C - 0x80481BD8
.text
.balign 4

.fn fn_80481B4C, global
/* 80481B4C 0047D36C  3D 20 80 67 */	lis r9, lbl_8066A1F0@ha
/* 80481B50 0047D370  C1 22 FE 04 */	lfs f9, lbl_806752E4@sda21(r0)
/* 80481B54 0047D374  C1 02 FE 08 */	lfs f8, lbl_806752E8@sda21(r0)
/* 80481B58 0047D378  39 09 A1 F0 */	addi r8, r9, lbl_8066A1F0@l
/* 80481B5C 0047D37C  C0 E2 FE 0C */	lfs f7, lbl_806752EC@sda21(r0)
/* 80481B60 0047D380  38 E0 00 08 */	li r7, 0x8
/* 80481B64 0047D384  C0 C2 FD A0 */	lfs f6, lbl_80675280@sda21(r0)
/* 80481B68 0047D388  38 C0 00 03 */	li r6, 0x3
/* 80481B6C 0047D38C  C0 A2 FD E0 */	lfs f5, lbl_806752C0@sda21(r0)
/* 80481B70 0047D390  38 A0 00 0A */	li r5, 0xa
/* 80481B74 0047D394  C0 82 FE 10 */	lfs f4, lbl_806752F0@sda21(r0)
/* 80481B78 0047D398  38 80 00 A0 */	li r4, 0xa0
/* 80481B7C 0047D39C  C0 62 FE 14 */	lfs f3, lbl_806752F4@sda21(r0)
/* 80481B80 0047D3A0  38 60 00 20 */	li r3, 0x20
/* 80481B84 0047D3A4  C0 42 FE 18 */	lfs f2, lbl_806752F8@sda21(r0)
/* 80481B88 0047D3A8  38 00 00 14 */	li r0, 0x14
/* 80481B8C 0047D3AC  C0 22 FE 1C */	lfs f1, lbl_806752FC@sda21(r0)
/* 80481B90 0047D3B0  C0 02 FE 20 */	lfs f0, lbl_80675300@sda21(r0)
/* 80481B94 0047D3B4  D1 29 A1 F0 */	stfs f9, lbl_8066A1F0@l(r9)
/* 80481B98 0047D3B8  D1 08 00 04 */	stfs f8, 0x4(r8)
/* 80481B9C 0047D3BC  D0 E8 00 08 */	stfs f7, 0x8(r8)
/* 80481BA0 0047D3C0  D0 C8 00 10 */	stfs f6, 0x10(r8)
/* 80481BA4 0047D3C4  D0 A8 00 14 */	stfs f5, 0x14(r8)
/* 80481BA8 0047D3C8  90 E8 00 1C */	stw r7, 0x1c(r8)
/* 80481BAC 0047D3CC  90 C8 00 20 */	stw r6, 0x20(r8)
/* 80481BB0 0047D3D0  98 A8 00 38 */	stb r5, 0x38(r8)
/* 80481BB4 0047D3D4  98 88 00 39 */	stb r4, 0x39(r8)
/* 80481BB8 0047D3D8  98 68 00 3A */	stb r3, 0x3a(r8)
/* 80481BBC 0047D3DC  98 08 00 3B */	stb r0, 0x3b(r8)
/* 80481BC0 0047D3E0  D0 88 00 24 */	stfs f4, 0x24(r8)
/* 80481BC4 0047D3E4  D0 68 00 28 */	stfs f3, 0x28(r8)
/* 80481BC8 0047D3E8  D0 48 00 2C */	stfs f2, 0x2c(r8)
/* 80481BCC 0047D3EC  D0 28 00 30 */	stfs f1, 0x30(r8)
/* 80481BD0 0047D3F0  D0 08 00 34 */	stfs f0, 0x34(r8)
/* 80481BD4 0047D3F4  4E 80 00 20 */	blr
.endfn fn_80481B4C

# 0x80534FE8 - 0x80534FEC
.section .ctors, "a"
.balign 4
	.4byte fn_80481B4C