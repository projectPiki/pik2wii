.include "macros.inc"
.file "auto_fn_80392930_text"

# 0x80392930 - 0x8039295C
.text
.balign 4

.fn fn_80392930, global
/* 80392930 0038E150  3C 80 80 67 */	lis r4, lbl_80669CF0@ha
/* 80392934 0038E154  C0 62 DE 50 */	lfs f3, lbl_80673330@sda21(r0)
/* 80392938 0038E158  C0 42 DE 3C */	lfs f2, lbl_8067331C@sda21(r0)
/* 8039293C 0038E15C  38 64 9C F0 */	addi r3, r4, lbl_80669CF0@l
/* 80392940 0038E160  C0 22 DE 54 */	lfs f1, lbl_80673334@sda21(r0)
/* 80392944 0038E164  C0 02 DE 58 */	lfs f0, lbl_80673338@sda21(r0)
/* 80392948 0038E168  D0 64 9C F0 */	stfs f3, lbl_80669CF0@l(r4)
/* 8039294C 0038E16C  D0 43 00 04 */	stfs f2, 0x4(r3)
/* 80392950 0038E170  D0 23 00 08 */	stfs f1, 0x8(r3)
/* 80392954 0038E174  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 80392958 0038E178  4E 80 00 20 */	blr
.endfn fn_80392930

# 0x80534F08 - 0x80534F0C
.section .ctors, "a"
.balign 4
	.4byte fn_80392930
