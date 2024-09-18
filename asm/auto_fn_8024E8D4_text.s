.include "macros.inc"
.file "auto_fn_8024E8D4_text"

# 0x8024E8D4 - 0x8024E900
.text
.balign 4

.fn fn_8024E8D4, global
/* 8024E8D4 0024A0F4  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 8024E8D8 0024A0F8  38 00 FF FF */	li r0, -0x1
/* 8024E8DC 0024A0FC  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 8024E8E0 0024A100  3C 80 80 64 */	lis r4, lbl_80638B70@ha
/* 8024E8E4 0024A104  38 64 8B 70 */	addi r3, r4, lbl_80638B70@l
/* 8024E8E8 0024A108  90 0D A2 00 */	stw r0, lbl_8066CA00@sda21(r0)
/* 8024E8EC 0024A10C  D0 0D A2 04 */	stfs f0, lbl_8066CA04@sda21(r0)
/* 8024E8F0 0024A110  D0 04 8B 70 */	stfs f0, lbl_80638B70@l(r4)
/* 8024E8F4 0024A114  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8024E8F8 0024A118  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8024E8FC 0024A11C  4E 80 00 20 */	blr
.endfn fn_8024E8D4

# 0x80534DBC - 0x80534DC0
.section .ctors, "a"
.balign 4
	.4byte fn_8024E8D4
