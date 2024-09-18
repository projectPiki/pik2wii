.include "macros.inc"
.file "auto_fn_80299028_text"

# 0x80299028 - 0x80299054
.text
.balign 4

.fn fn_80299028, global
/* 80299028 00294848  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8029902C 0029484C  38 00 FF FF */	li r0, -0x1
/* 80299030 00294850  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80299034 00294854  3C 80 80 64 */	lis r4, lbl_80638CA0@ha
/* 80299038 00294858  38 64 8C A0 */	addi r3, r4, lbl_80638CA0@l
/* 8029903C 0029485C  90 0D A3 70 */	stw r0, lbl_8066CB70@sda21(r0)
/* 80299040 00294860  D0 0D A3 74 */	stfs f0, lbl_8066CB74@sda21(r0)
/* 80299044 00294864  D0 04 8C A0 */	stfs f0, lbl_80638CA0@l(r4)
/* 80299048 00294868  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8029904C 0029486C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80299050 00294870  4E 80 00 20 */	blr
.endfn fn_80299028

# 0x80534E0C - 0x80534E10
.section .ctors, "a"
.balign 4
	.4byte fn_80299028
