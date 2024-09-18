.include "macros.inc"
.file "auto_fn_802C60EC_text"

# 0x802C60EC - 0x802C6118
.text
.balign 4

.fn fn_802C60EC, global
/* 802C60EC 002C190C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802C60F0 002C1910  38 00 FF FF */	li r0, -0x1
/* 802C60F4 002C1914  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802C60F8 002C1918  3C 80 80 64 */	lis r4, lbl_80639068@ha
/* 802C60FC 002C191C  38 64 90 68 */	addi r3, r4, lbl_80639068@l
/* 802C6100 002C1920  90 0D A4 90 */	stw r0, lbl_8066CC90@sda21(r0)
/* 802C6104 002C1924  D0 0D A4 94 */	stfs f0, lbl_8066CC94@sda21(r0)
/* 802C6108 002C1928  D0 04 90 68 */	stfs f0, lbl_80639068@l(r4)
/* 802C610C 002C192C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802C6110 002C1930  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802C6114 002C1934  4E 80 00 20 */	blr
.endfn fn_802C60EC

# 0x80534E74 - 0x80534E78
.section .ctors, "a"
.balign 4
	.4byte fn_802C60EC
