.include "macros.inc"
.file "auto_fn_80376B3C_text"

# 0x80376B3C - 0x80376B68
.text
.balign 4

.fn fn_80376B3C, global
/* 80376B3C 0037235C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80376B40 00372360  38 00 FF FF */	li r0, -0x1
/* 80376B44 00372364  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80376B48 00372368  3C 80 80 64 */	lis r4, lbl_80639218@ha
/* 80376B4C 0037236C  38 64 92 18 */	addi r3, r4, lbl_80639218@l
/* 80376B50 00372370  90 0D A5 A8 */	stw r0, lbl_8066CDA8@sda21(r0)
/* 80376B54 00372374  D0 0D A5 AC */	stfs f0, lbl_8066CDAC@sda21(r0)
/* 80376B58 00372378  D0 04 92 18 */	stfs f0, lbl_80639218@l(r4)
/* 80376B5C 0037237C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80376B60 00372380  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80376B64 00372384  4E 80 00 20 */	blr
.endfn fn_80376B3C

# 0x80534EE0 - 0x80534EE4
.section .ctors, "a"
.balign 4
	.4byte fn_80376B3C
