.include "macros.inc"
.file "auto_fn_803A3E94_text"

# 0x803A3E94 - 0x803A3EE0
.text
.balign 4

.fn fn_803A3E94, global
/* 803A3E94 0039F6B4  3C 80 80 67 */	lis r4, lbl_80669F30@ha
/* 803A3E98 0039F6B8  C0 A2 E0 90 */	lfs f5, lbl_80673570@sda21(r0)
/* 803A3E9C 0039F6BC  C0 82 E0 A0 */	lfs f4, lbl_80673580@sda21(r0)
/* 803A3EA0 0039F6C0  38 64 9F 30 */	addi r3, r4, lbl_80669F30@l
/* 803A3EA4 0039F6C4  C0 42 E0 8C */	lfs f2, lbl_8067356C@sda21(r0)
/* 803A3EA8 0039F6C8  C0 22 E0 A8 */	lfs f1, lbl_80673588@sda21(r0)
/* 803A3EAC 0039F6CC  C0 62 E0 A4 */	lfs f3, lbl_80673584@sda21(r0)
/* 803A3EB0 0039F6D0  C0 02 E0 AC */	lfs f0, lbl_8067358C@sda21(r0)
/* 803A3EB4 0039F6D4  D0 A4 9F 30 */	stfs f5, lbl_80669F30@l(r4)
/* 803A3EB8 0039F6D8  D0 83 00 04 */	stfs f4, 0x4(r3)
/* 803A3EBC 0039F6DC  D0 63 00 08 */	stfs f3, 0x8(r3)
/* 803A3EC0 0039F6E0  D0 43 00 0C */	stfs f2, 0xc(r3)
/* 803A3EC4 0039F6E4  D0 43 00 10 */	stfs f2, 0x10(r3)
/* 803A3EC8 0039F6E8  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 803A3ECC 0039F6EC  D0 43 00 18 */	stfs f2, 0x18(r3)
/* 803A3ED0 0039F6F0  D0 43 00 1C */	stfs f2, 0x1c(r3)
/* 803A3ED4 0039F6F4  D0 23 00 20 */	stfs f1, 0x20(r3)
/* 803A3ED8 0039F6F8  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 803A3EDC 0039F6FC  4E 80 00 20 */	blr
.endfn fn_803A3E94

# 0x80534F34 - 0x80534F38
.section .ctors, "a"
.balign 4
	.4byte fn_803A3E94
