.include "macros.inc"
.file "auto_fn_803DF3E4_text"

# 0x803DF3E4 - 0x803DF410
.text
.balign 4

.fn fn_803DF3E4, global
/* 803DF3E4 003DAC04  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803DF3E8 003DAC08  38 00 FF FF */	li r0, -0x1
/* 803DF3EC 003DAC0C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803DF3F0 003DAC10  3C 80 80 64 */	lis r4, lbl_80639338@ha
/* 803DF3F4 003DAC14  38 64 93 38 */	addi r3, r4, lbl_80639338@l
/* 803DF3F8 003DAC18  90 0D A6 E8 */	stw r0, lbl_8066CEE8@sda21(r0)
/* 803DF3FC 003DAC1C  D0 0D A6 EC */	stfs f0, lbl_8066CEEC@sda21(r0)
/* 803DF400 003DAC20  D0 04 93 38 */	stfs f0, lbl_80639338@l(r4)
/* 803DF404 003DAC24  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803DF408 003DAC28  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803DF40C 003DAC2C  4E 80 00 20 */	blr
.endfn fn_803DF3E4

# 0x80534F6C - 0x80534F70
.section .ctors, "a"
.balign 4
	.4byte fn_803DF3E4
