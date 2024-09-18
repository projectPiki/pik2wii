.include "macros.inc"
.file "auto_fn_80497C80_text"

# 0x80497C80 - 0x80497CC0
.text
.balign 4

.fn fn_80497C80, global
/* 80497C80 004934A0  3C C0 80 67 */	lis r6, lbl_8066A2E8@ha
/* 80497C84 004934A4  C0 42 FF F4 */	lfs f2, lbl_806754D4@sda21(r0)
/* 80497C88 004934A8  C0 22 FF F8 */	lfs f1, lbl_806754D8@sda21(r0)
/* 80497C8C 004934AC  38 A6 A2 E8 */	addi r5, r6, lbl_8066A2E8@l
/* 80497C90 004934B0  38 80 00 64 */	li r4, 0x64
/* 80497C94 004934B4  C0 02 FF FC */	lfs f0, lbl_806754DC@sda21(r0)
/* 80497C98 004934B8  38 60 00 7D */	li r3, 0x7d
/* 80497C9C 004934BC  38 00 00 02 */	li r0, 0x2
/* 80497CA0 004934C0  D0 46 A2 E8 */	stfs f2, lbl_8066A2E8@l(r6)
/* 80497CA4 004934C4  D0 25 00 04 */	stfs f1, 0x4(r5)
/* 80497CA8 004934C8  D0 05 00 08 */	stfs f0, 0x8(r5)
/* 80497CAC 004934CC  90 85 00 0C */	stw r4, 0xc(r5)
/* 80497CB0 004934D0  90 65 00 10 */	stw r3, 0x10(r5)
/* 80497CB4 004934D4  90 85 00 14 */	stw r4, 0x14(r5)
/* 80497CB8 004934D8  98 05 00 18 */	stb r0, 0x18(r5)
/* 80497CBC 004934DC  4E 80 00 20 */	blr
.endfn fn_80497C80

# 0x80535004 - 0x80535008
.section .ctors, "a"
.balign 4
	.4byte fn_80497C80
