.include "macros.inc"
.file "auto_fn_801CF8F0_text"

# 0x801CF8F0 - 0x801CF91C
.text
.balign 4

.fn fn_801CF8F0, global
/* 801CF8F0 001CB110  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801CF8F4 001CB114  38 00 FF FF */	li r0, -0x1
/* 801CF8F8 001CB118  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801CF8FC 001CB11C  3C 80 80 64 */	lis r4, lbl_80638A00@ha
/* 801CF900 001CB120  38 64 8A 00 */	addi r3, r4, lbl_80638A00@l
/* 801CF904 001CB124  90 0D A0 70 */	stw r0, lbl_8066C870@sda21(r0)
/* 801CF908 001CB128  D0 0D A0 74 */	stfs f0, lbl_8066C874@sda21(r0)
/* 801CF90C 001CB12C  D0 04 8A 00 */	stfs f0, lbl_80638A00@l(r4)
/* 801CF910 001CB130  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801CF914 001CB134  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801CF918 001CB138  4E 80 00 20 */	blr
.endfn fn_801CF8F0

# 0x80534D60 - 0x80534D64
.section .ctors, "a"
.balign 4
	.4byte fn_801CF8F0
