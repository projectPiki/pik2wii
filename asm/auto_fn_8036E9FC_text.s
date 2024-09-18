.include "macros.inc"
.file "auto_fn_8036E9FC_text"

# 0x8036E9FC - 0x8036EA28
.text
.balign 4

.fn fn_8036E9FC, global
/* 8036E9FC 0036A21C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8036EA00 0036A220  38 00 FF FF */	li r0, -0x1
/* 8036EA04 0036A224  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8036EA08 0036A228  3C 80 80 64 */	lis r4, lbl_80639208@ha
/* 8036EA0C 0036A22C  38 64 92 08 */	addi r3, r4, lbl_80639208@l
/* 8036EA10 0036A230  90 0D A5 A0 */	stw r0, lbl_8066CDA0@sda21(r0)
/* 8036EA14 0036A234  D0 0D A5 A4 */	stfs f0, lbl_8066CDA4@sda21(r0)
/* 8036EA18 0036A238  D0 04 92 08 */	stfs f0, lbl_80639208@l(r4)
/* 8036EA1C 0036A23C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8036EA20 0036A240  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8036EA24 0036A244  4E 80 00 20 */	blr
.endfn fn_8036E9FC

# 0x80534EDC - 0x80534EE0
.section .ctors, "a"
.balign 4
	.4byte fn_8036E9FC
