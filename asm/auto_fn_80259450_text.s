.include "macros.inc"
.file "auto_fn_80259450_text"

# 0x80259450 - 0x8025947C
.text
.balign 4

.fn fn_80259450, global
/* 80259450 00254C70  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80259454 00254C74  38 00 FF FF */	li r0, -0x1
/* 80259458 00254C78  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8025945C 00254C7C  3C 80 80 64 */	lis r4, lbl_80638B90@ha
/* 80259460 00254C80  38 64 8B 90 */	addi r3, r4, lbl_80638B90@l
/* 80259464 00254C84  90 0D A2 30 */	stw r0, lbl_8066CA30@sda21(r0)
/* 80259468 00254C88  D0 0D A2 34 */	stfs f0, lbl_8066CA34@sda21(r0)
/* 8025946C 00254C8C  D0 04 8B 90 */	stfs f0, lbl_80638B90@l(r4)
/* 80259470 00254C90  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80259474 00254C94  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80259478 00254C98  4E 80 00 20 */	blr
.endfn fn_80259450

# 0x80534DC4 - 0x80534DC8
.section .ctors, "a"
.balign 4
	.4byte fn_80259450
