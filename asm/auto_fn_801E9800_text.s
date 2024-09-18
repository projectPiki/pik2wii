.include "macros.inc"
.file "auto_fn_801E9800_text"

# 0x801E9800 - 0x801E982C
.text
.balign 4

.fn fn_801E9800, global
/* 801E9800 001E5020  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801E9804 001E5024  38 00 FF FF */	li r0, -0x1
/* 801E9808 001E5028  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801E980C 001E502C  3C 80 80 64 */	lis r4, lbl_80638A50@ha
/* 801E9810 001E5030  38 64 8A 50 */	addi r3, r4, lbl_80638A50@l
/* 801E9814 001E5034  90 0D A0 C8 */	stw r0, lbl_8066C8C8@sda21(r0)
/* 801E9818 001E5038  D0 0D A0 CC */	stfs f0, lbl_8066C8CC@sda21(r0)
/* 801E981C 001E503C  D0 04 8A 50 */	stfs f0, lbl_80638A50@l(r4)
/* 801E9820 001E5040  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801E9824 001E5044  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801E9828 001E5048  4E 80 00 20 */	blr
.endfn fn_801E9800

# 0x80534D74 - 0x80534D78
.section .ctors, "a"
.balign 4
	.4byte fn_801E9800
