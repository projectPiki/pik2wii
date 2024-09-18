.include "macros.inc"
.file "auto_fn_8022F258_text"

# 0x8022F258 - 0x8022F284
.text
.balign 4

.fn fn_8022F258, global
/* 8022F258 0022AA78  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8022F25C 0022AA7C  38 00 FF FF */	li r0, -0x1
/* 8022F260 0022AA80  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8022F264 0022AA84  3C 80 80 64 */	lis r4, lbl_80638B00@ha
/* 8022F268 0022AA88  38 64 8B 00 */	addi r3, r4, lbl_80638B00@l
/* 8022F26C 0022AA8C  90 0D A1 70 */	stw r0, lbl_8066C970@sda21(r0)
/* 8022F270 0022AA90  D0 0D A1 74 */	stfs f0, lbl_8066C974@sda21(r0)
/* 8022F274 0022AA94  D0 04 8B 00 */	stfs f0, lbl_80638B00@l(r4)
/* 8022F278 0022AA98  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8022F27C 0022AA9C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8022F280 0022AAA0  4E 80 00 20 */	blr
.endfn fn_8022F258

# 0x80534DA0 - 0x80534DA4
.section .ctors, "a"
.balign 4
	.4byte fn_8022F258
