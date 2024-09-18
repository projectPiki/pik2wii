.include "macros.inc"
.file "auto_fn_8042BDA8_text"

# 0x8042BDA8 - 0x8042BDD4
.text
.balign 4

.fn fn_8042BDA8, global
/* 8042BDA8 004275C8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8042BDAC 004275CC  38 00 FF FF */	li r0, -0x1
/* 8042BDB0 004275D0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8042BDB4 004275D4  3C 80 80 64 */	lis r4, lbl_80639388@ha
/* 8042BDB8 004275D8  38 64 93 88 */	addi r3, r4, lbl_80639388@l
/* 8042BDBC 004275DC  90 0D A7 F8 */	stw r0, lbl_8066CFF8@sda21(r0)
/* 8042BDC0 004275E0  D0 0D A7 FC */	stfs f0, lbl_8066CFFC@sda21(r0)
/* 8042BDC4 004275E4  D0 04 93 88 */	stfs f0, lbl_80639388@l(r4)
/* 8042BDC8 004275E8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8042BDCC 004275EC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8042BDD0 004275F0  4E 80 00 20 */	blr
.endfn fn_8042BDA8

# 0x80534F94 - 0x80534F98
.section .ctors, "a"
.balign 4
	.4byte fn_8042BDA8
