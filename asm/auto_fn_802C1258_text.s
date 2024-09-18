.include "macros.inc"
.file "auto_fn_802C1258_text"

# 0x802C1258 - 0x802C1284
.text
.balign 4

.fn fn_802C1258, global
/* 802C1258 002BCA78  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 802C125C 002BCA7C  38 00 FF FF */	li r0, -0x1
/* 802C1260 002BCA80  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 802C1264 002BCA84  3C 80 80 64 */	lis r4, lbl_80638DE8@ha
/* 802C1268 002BCA88  38 64 8D E8 */	addi r3, r4, lbl_80638DE8@l
/* 802C126C 002BCA8C  90 0D A4 50 */	stw r0, lbl_8066CC50@sda21(r0)
/* 802C1270 002BCA90  D0 0D A4 54 */	stfs f0, lbl_8066CC54@sda21(r0)
/* 802C1274 002BCA94  D0 04 8D E8 */	stfs f0, lbl_80638DE8@l(r4)
/* 802C1278 002BCA98  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 802C127C 002BCA9C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 802C1280 002BCAA0  4E 80 00 20 */	blr
.endfn fn_802C1258

# 0x80534E60 - 0x80534E64
.section .ctors, "a"
.balign 4
	.4byte fn_802C1258
