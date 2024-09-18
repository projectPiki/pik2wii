.include "macros.inc"
.file "auto_fn_801F623C_text"

# 0x801F623C - 0x801F6268
.text
.balign 4

.fn fn_801F623C, global
/* 801F623C 001F1A5C  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 801F6240 001F1A60  38 00 FF FF */	li r0, -0x1
/* 801F6244 001F1A64  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 801F6248 001F1A68  3C 80 80 64 */	lis r4, lbl_80638A80@ha
/* 801F624C 001F1A6C  38 64 8A 80 */	addi r3, r4, lbl_80638A80@l
/* 801F6250 001F1A70  90 0D A1 18 */	stw r0, lbl_8066C918@sda21(r0)
/* 801F6254 001F1A74  D0 0D A1 1C */	stfs f0, lbl_8066C91C@sda21(r0)
/* 801F6258 001F1A78  D0 04 8A 80 */	stfs f0, lbl_80638A80@l(r4)
/* 801F625C 001F1A7C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 801F6260 001F1A80  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 801F6264 001F1A84  4E 80 00 20 */	blr
.endfn fn_801F623C

# 0x80534D80 - 0x80534D84
.section .ctors, "a"
.balign 4
	.4byte fn_801F623C
