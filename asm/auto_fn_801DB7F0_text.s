.include "macros.inc"
.file "auto_fn_801DB7F0_text"

# 0x801DB7F0 - 0x801DB81C
.text
.balign 4

.fn fn_801DB7F0, global
/* 801DB7F0 001D7010  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801DB7F4 001D7014  38 00 FF FF */	li r0, -0x1
/* 801DB7F8 001D7018  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801DB7FC 001D701C  3C 80 80 64 */	lis r4, lbl_80638A20@ha
/* 801DB800 001D7020  38 64 8A 20 */	addi r3, r4, lbl_80638A20@l
/* 801DB804 001D7024  90 0D A0 90 */	stw r0, lbl_8066C890@sda21(r0)
/* 801DB808 001D7028  D0 0D A0 94 */	stfs f0, lbl_8066C894@sda21(r0)
/* 801DB80C 001D702C  D0 04 8A 20 */	stfs f0, lbl_80638A20@l(r4)
/* 801DB810 001D7030  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801DB814 001D7034  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801DB818 001D7038  4E 80 00 20 */	blr
.endfn fn_801DB7F0

# 0x80534D68 - 0x80534D6C
.section .ctors, "a"
.balign 4
	.4byte fn_801DB7F0
