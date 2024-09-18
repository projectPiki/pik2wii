.include "macros.inc"
.file "auto_fn_802E60EC_text"

# 0x802E60EC - 0x802E6118
.text
.balign 4

.fn fn_802E60EC, global
/* 802E60EC 002E190C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802E60F0 002E1910  38 00 FF FF */	li r0, -0x1
/* 802E60F4 002E1914  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802E60F8 002E1918  3C 80 80 64 */	lis r4, lbl_806390C8@ha
/* 802E60FC 002E191C  38 64 90 C8 */	addi r3, r4, lbl_806390C8@l
/* 802E6100 002E1920  90 0D A4 E0 */	stw r0, lbl_8066CCE0@sda21(r0)
/* 802E6104 002E1924  D0 0D A4 E4 */	stfs f0, lbl_8066CCE4@sda21(r0)
/* 802E6108 002E1928  D0 04 90 C8 */	stfs f0, lbl_806390C8@l(r4)
/* 802E610C 002E192C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802E6110 002E1930  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802E6114 002E1934  4E 80 00 20 */	blr
.endfn fn_802E60EC

# 0x80534E8C - 0x80534E90
.section .ctors, "a"
.balign 4
	.4byte fn_802E60EC
