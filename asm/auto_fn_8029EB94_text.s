.include "macros.inc"
.file "auto_fn_8029EB94_text"

# 0x8029EB94 - 0x8029EBC0
.text
.balign 4

.fn fn_8029EB94, global
/* 8029EB94 0029A3B4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8029EB98 0029A3B8  38 00 FF FF */	li r0, -0x1
/* 8029EB9C 0029A3BC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8029EBA0 0029A3C0  3C 80 80 64 */	lis r4, lbl_80638CF0@ha
/* 8029EBA4 0029A3C4  38 64 8C F0 */	addi r3, r4, lbl_80638CF0@l
/* 8029EBA8 0029A3C8  90 0D A3 A8 */	stw r0, lbl_8066CBA8@sda21(r0)
/* 8029EBAC 0029A3CC  D0 0D A3 AC */	stfs f0, lbl_8066CBAC@sda21(r0)
/* 8029EBB0 0029A3D0  D0 04 8C F0 */	stfs f0, lbl_80638CF0@l(r4)
/* 8029EBB4 0029A3D4  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8029EBB8 0029A3D8  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8029EBBC 0029A3DC  4E 80 00 20 */	blr
.endfn fn_8029EB94

# 0x80534E20 - 0x80534E24
.section .ctors, "a"
.balign 4
	.4byte fn_8029EB94
