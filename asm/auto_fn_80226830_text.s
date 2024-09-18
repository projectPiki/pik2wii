.include "macros.inc"
.file "auto_fn_80226830_text"

# 0x80226830 - 0x8022685C
.text
.balign 4

.fn fn_80226830, global
/* 80226830 00222050  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 80226834 00222054  38 00 FF FF */	li r0, -0x1
/* 80226838 00222058  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8022683C 0022205C  3C 80 80 64 */	lis r4, lbl_80638AE0@ha
/* 80226840 00222060  38 64 8A E0 */	addi r3, r4, lbl_80638AE0@l
/* 80226844 00222064  90 0D A1 60 */	stw r0, lbl_8066C960@sda21(r0)
/* 80226848 00222068  D0 0D A1 64 */	stfs f0, lbl_8066C964@sda21(r0)
/* 8022684C 0022206C  D0 04 8A E0 */	stfs f0, lbl_80638AE0@l(r4)
/* 80226850 00222070  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80226854 00222074  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80226858 00222078  4E 80 00 20 */	blr
.endfn fn_80226830

# 0x80534D98 - 0x80534D9C
.section .ctors, "a"
.balign 4
	.4byte fn_80226830
