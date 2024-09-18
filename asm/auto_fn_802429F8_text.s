.include "macros.inc"
.file "auto_fn_802429F8_text"

# 0x802429F8 - 0x80242A24
.text
.balign 4

.fn fn_802429F8, global
/* 802429F8 0023E218  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802429FC 0023E21C  38 00 FF FF */	li r0, -0x1
/* 80242A00 0023E220  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80242A04 0023E224  3C 80 80 64 */	lis r4, lbl_80638B50@ha
/* 80242A08 0023E228  38 64 8B 50 */	addi r3, r4, lbl_80638B50@l
/* 80242A0C 0023E22C  90 0D A1 E0 */	stw r0, lbl_8066C9E0@sda21(r0)
/* 80242A10 0023E230  D0 0D A1 E4 */	stfs f0, lbl_8066C9E4@sda21(r0)
/* 80242A14 0023E234  D0 04 8B 50 */	stfs f0, lbl_80638B50@l(r4)
/* 80242A18 0023E238  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80242A1C 0023E23C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80242A20 0023E240  4E 80 00 20 */	blr
.endfn fn_802429F8

# 0x80534DB4 - 0x80534DB8
.section .ctors, "a"
.balign 4
	.4byte fn_802429F8
