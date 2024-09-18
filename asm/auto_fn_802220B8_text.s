.include "macros.inc"
.file "auto_fn_802220B8_text"

# 0x802220B8 - 0x802220E4
.text
.balign 4

.fn fn_802220B8, global
/* 802220B8 0021D8D8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802220BC 0021D8DC  38 00 FF FF */	li r0, -0x1
/* 802220C0 0021D8E0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802220C4 0021D8E4  3C 80 80 64 */	lis r4, lbl_80638AC0@ha
/* 802220C8 0021D8E8  38 64 8A C0 */	addi r3, r4, lbl_80638AC0@l
/* 802220CC 0021D8EC  90 0D A1 48 */	stw r0, lbl_8066C948@sda21(r0)
/* 802220D0 0021D8F0  D0 0D A1 4C */	stfs f0, lbl_8066C94C@sda21(r0)
/* 802220D4 0021D8F4  D0 04 8A C0 */	stfs f0, lbl_80638AC0@l(r4)
/* 802220D8 0021D8F8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802220DC 0021D8FC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802220E0 0021D900  4E 80 00 20 */	blr
.endfn fn_802220B8

# 0x80534D90 - 0x80534D94
.section .ctors, "a"
.balign 4
	.4byte fn_802220B8
