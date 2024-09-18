.include "macros.inc"
.file "auto_fn_804BF244_text"

# 0x804BF244 - 0x804BF270
.text
.balign 4

.fn fn_804BF244, global
/* 804BF244 004BAA64  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 804BF248 004BAA68  38 00 FF FF */	li r0, -0x1
/* 804BF24C 004BAA6C  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 804BF250 004BAA70  3C 80 80 64 */	lis r4, lbl_806395D0@ha
/* 804BF254 004BAA74  38 64 95 D0 */	addi r3, r4, lbl_806395D0@l
/* 804BF258 004BAA78  90 0D AA 98 */	stw r0, lbl_8066D298@sda21(r0)
/* 804BF25C 004BAA7C  D0 0D AA 9C */	stfs f0, lbl_8066D29C@sda21(r0)
/* 804BF260 004BAA80  D0 04 95 D0 */	stfs f0, lbl_806395D0@l(r4)
/* 804BF264 004BAA84  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 804BF268 004BAA88  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 804BF26C 004BAA8C  4E 80 00 20 */	blr
.endfn fn_804BF244

# 0x8053505C - 0x80535060
.section .ctors, "a"
.balign 4
	.4byte fn_804BF244
