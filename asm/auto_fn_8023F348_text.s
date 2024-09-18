.include "macros.inc"
.file "auto_fn_8023F348_text"

# 0x8023F348 - 0x8023F374
.text
.balign 4

.fn fn_8023F348, global
/* 8023F348 0023AB68  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8023F34C 0023AB6C  38 00 FF FF */	li r0, -0x1
/* 8023F350 0023AB70  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8023F354 0023AB74  3C 80 80 64 */	lis r4, lbl_80638B40@ha
/* 8023F358 0023AB78  38 64 8B 40 */	addi r3, r4, lbl_80638B40@l
/* 8023F35C 0023AB7C  90 0D A1 D8 */	stw r0, lbl_8066C9D8@sda21(r0)
/* 8023F360 0023AB80  D0 0D A1 DC */	stfs f0, lbl_8066C9DC@sda21(r0)
/* 8023F364 0023AB84  D0 04 8B 40 */	stfs f0, lbl_80638B40@l(r4)
/* 8023F368 0023AB88  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8023F36C 0023AB8C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8023F370 0023AB90  4E 80 00 20 */	blr
.endfn fn_8023F348

# 0x80534DB0 - 0x80534DB4
.section .ctors, "a"
.balign 4
	.4byte fn_8023F348
