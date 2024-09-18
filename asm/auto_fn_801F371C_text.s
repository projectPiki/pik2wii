.include "macros.inc"
.file "auto_fn_801F371C_text"

# 0x801F371C - 0x801F3748
.text
.balign 4

.fn fn_801F371C, global
/* 801F371C 001EEF3C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801F3720 001EEF40  38 00 FF FF */	li r0, -0x1
/* 801F3724 001EEF44  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801F3728 001EEF48  3C 80 80 64 */	lis r4, lbl_80638A60@ha
/* 801F372C 001EEF4C  38 64 8A 60 */	addi r3, r4, lbl_80638A60@l
/* 801F3730 001EEF50  90 0D A0 F0 */	stw r0, lbl_8066C8F0@sda21(r0)
/* 801F3734 001EEF54  D0 0D A0 F4 */	stfs f0, lbl_8066C8F4@sda21(r0)
/* 801F3738 001EEF58  D0 04 8A 60 */	stfs f0, lbl_80638A60@l(r4)
/* 801F373C 001EEF5C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801F3740 001EEF60  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801F3744 001EEF64  4E 80 00 20 */	blr
.endfn fn_801F371C

# 0x80534D78 - 0x80534D7C
.section .ctors, "a"
.balign 4
	.4byte fn_801F371C
