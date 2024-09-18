.include "macros.inc"
.file "auto_fn_801E537C_text"

# 0x801E537C - 0x801E53A8
.text
.balign 4

.fn fn_801E537C, global
/* 801E537C 001E0B9C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801E5380 001E0BA0  38 00 FF FF */	li r0, -0x1
/* 801E5384 001E0BA4  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801E5388 001E0BA8  3C 80 80 64 */	lis r4, lbl_80638A40@ha
/* 801E538C 001E0BAC  38 64 8A 40 */	addi r3, r4, lbl_80638A40@l
/* 801E5390 001E0BB0  90 0D A0 A8 */	stw r0, lbl_8066C8A8@sda21(r0)
/* 801E5394 001E0BB4  D0 0D A0 AC */	stfs f0, lbl_8066C8AC@sda21(r0)
/* 801E5398 001E0BB8  D0 04 8A 40 */	stfs f0, lbl_80638A40@l(r4)
/* 801E539C 001E0BBC  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801E53A0 001E0BC0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801E53A4 001E0BC4  4E 80 00 20 */	blr
.endfn fn_801E537C

# 0x80534D70 - 0x80534D74
.section .ctors, "a"
.balign 4
	.4byte fn_801E537C
