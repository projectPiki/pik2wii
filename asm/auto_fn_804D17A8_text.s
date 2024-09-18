.include "macros.inc"
.file "auto_fn_804D17A8_text"

# 0x804D17A8 - 0x804D17D4
.text
.balign 4

.fn fn_804D17A8, global
/* 804D17A8 004CCFC8  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804D17AC 004CCFCC  38 00 FF FF */	li r0, -0x1
/* 804D17B0 004CCFD0  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804D17B4 004CCFD4  3C 80 80 64 */	lis r4, lbl_80639768@ha
/* 804D17B8 004CCFD8  38 64 97 68 */	addi r3, r4, lbl_80639768@l
/* 804D17BC 004CCFDC  90 0D AA E8 */	stw r0, lbl_8066D2E8@sda21(r0)
/* 804D17C0 004CCFE0  D0 0D AA EC */	stfs f0, lbl_8066D2EC@sda21(r0)
/* 804D17C4 004CCFE4  D0 04 97 68 */	stfs f0, lbl_80639768@l(r4)
/* 804D17C8 004CCFE8  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804D17CC 004CCFEC  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804D17D0 004CCFF0  4E 80 00 20 */	blr
.endfn fn_804D17A8

# 0x80535078 - 0x8053507C
.section .ctors, "a"
.balign 4
	.4byte fn_804D17A8
