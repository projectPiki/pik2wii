.include "macros.inc"
.file "auto_fn_80440C04_text"

# 0x80440C04 - 0x80440C30
.text
.balign 4

.fn fn_80440C04, global
/* 80440C04 0043C424  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80440C08 0043C428  38 00 FF FF */	li r0, -0x1
/* 80440C0C 0043C42C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80440C10 0043C430  3C 80 80 64 */	lis r4, lbl_806393D8@ha
/* 80440C14 0043C434  38 64 93 D8 */	addi r3, r4, lbl_806393D8@l
/* 80440C18 0043C438  90 0D A8 40 */	stw r0, lbl_8066D040@sda21(r0)
/* 80440C1C 0043C43C  D0 0D A8 44 */	stfs f0, lbl_8066D044@sda21(r0)
/* 80440C20 0043C440  D0 04 93 D8 */	stfs f0, lbl_806393D8@l(r4)
/* 80440C24 0043C444  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80440C28 0043C448  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80440C2C 0043C44C  4E 80 00 20 */	blr
.endfn fn_80440C04

# 0x80534FA8 - 0x80534FAC
.section .ctors, "a"
.balign 4
	.4byte fn_80440C04
