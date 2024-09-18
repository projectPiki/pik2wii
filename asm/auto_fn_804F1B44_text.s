.include "macros.inc"
.file "auto_fn_804F1B44_text"

# 0x804F1B44 - 0x804F1B70
.text
.balign 4

.fn fn_804F1B44, global
/* 804F1B44 004ED364  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804F1B48 004ED368  38 00 FF FF */	li r0, -0x1
/* 804F1B4C 004ED36C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804F1B50 004ED370  3C 80 80 64 */	lis r4, lbl_8063E540@ha
/* 804F1B54 004ED374  38 64 E5 40 */	addi r3, r4, lbl_8063E540@l
/* 804F1B58 004ED378  90 0D AB 70 */	stw r0, lbl_8066D370@sda21(r0)
/* 804F1B5C 004ED37C  D0 0D AB 74 */	stfs f0, lbl_8066D374@sda21(r0)
/* 804F1B60 004ED380  D0 04 E5 40 */	stfs f0, lbl_8063E540@l(r4)
/* 804F1B64 004ED384  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804F1B68 004ED388  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804F1B6C 004ED38C  4E 80 00 20 */	blr
.endfn fn_804F1B44

# 0x8053508C - 0x80535090
.section .ctors, "a"
.balign 4
	.4byte fn_804F1B44
