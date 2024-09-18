.include "macros.inc"
.file "auto_fn_803136DC_text"

# 0x803136DC - 0x80313708
.text
.balign 4

.fn fn_803136DC, global
/* 803136DC 0030EEFC  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803136E0 0030EF00  38 00 FF FF */	li r0, -0x1
/* 803136E4 0030EF04  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803136E8 0030EF08  3C 80 80 64 */	lis r4, lbl_806390F8@ha
/* 803136EC 0030EF0C  38 64 90 F8 */	addi r3, r4, lbl_806390F8@l
/* 803136F0 0030EF10  90 0D A4 F8 */	stw r0, lbl_8066CCF8@sda21(r0)
/* 803136F4 0030EF14  D0 0D A4 FC */	stfs f0, lbl_8066CCFC@sda21(r0)
/* 803136F8 0030EF18  D0 04 90 F8 */	stfs f0, lbl_806390F8@l(r4)
/* 803136FC 0030EF1C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80313700 0030EF20  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80313704 0030EF24  4E 80 00 20 */	blr
.endfn fn_803136DC

# 0x80534E98 - 0x80534E9C
.section .ctors, "a"
.balign 4
	.4byte fn_803136DC
