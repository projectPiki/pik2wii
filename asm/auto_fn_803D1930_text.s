.include "macros.inc"
.file "auto_fn_803D1930_text"

# 0x803D1930 - 0x803D195C
.text
.balign 4

.fn fn_803D1930, global
/* 803D1930 003CD150  3C 60 80 67 */	lis r3, lbl_8066AAA8@ha
/* 803D1934 003CD154  38 00 FF FF */	li r0, -0x1
/* 803D1938 003CD158  C0 03 AA A8 */	lfs f0, lbl_8066AAA8@l(r3)
/* 803D193C 003CD15C  3C 80 80 64 */	lis r4, lbl_80639308@ha
/* 803D1940 003CD160  38 64 93 08 */	addi r3, r4, lbl_80639308@l
/* 803D1944 003CD164  90 0D A6 D0 */	stw r0, lbl_8066CED0@sda21(r0)
/* 803D1948 003CD168  D0 0D A6 D4 */	stfs f0, lbl_8066CED4@sda21(r0)
/* 803D194C 003CD16C  D0 04 93 08 */	stfs f0, lbl_80639308@l(r4)
/* 803D1950 003CD170  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 803D1954 003CD174  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 803D1958 003CD178  4E 80 00 20 */	blr
.endfn fn_803D1930

# 0x80534F60 - 0x80534F64
.section .ctors, "a"
.balign 4
	.4byte fn_803D1930
