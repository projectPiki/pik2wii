.include "macros.inc"
.file "auto_fn_80328038_text"

# 0x80328038 - 0x80328064
.text
.balign 4

.fn fn_80328038, global
/* 80328038 00323858  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8032803C 0032385C  38 00 FF FF */	li r0, -0x1
/* 80328040 00323860  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 80328044 00323864  3C 80 80 64 */	lis r4, lbl_80639128@ha
/* 80328048 00323868  38 64 91 28 */	addi r3, r4, lbl_80639128@l
/* 8032804C 0032386C  90 0D A5 10 */	stw r0, lbl_8066CD10@sda21(r0)
/* 80328050 00323870  D0 0D A5 14 */	stfs f0, lbl_8066CD14@sda21(r0)
/* 80328054 00323874  D0 04 91 28 */	stfs f0, lbl_80639128@l(r4)
/* 80328058 00323878  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8032805C 0032387C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80328060 00323880  4E 80 00 20 */	blr
.endfn fn_80328038

# 0x80534EA4 - 0x80534EA8
.section .ctors, "a"
.balign 4
	.4byte fn_80328038
