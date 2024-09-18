.include "macros.inc"
.file "auto_fn_8049A05C_text"

# 0x8049A05C - 0x8049A08C
.text
.balign 4

.fn fn_8049A05C, global
/* 8049A05C 0049587C  88 0D A9 80 */	lbz r0, lbl_8066D180@sda21(r0)
/* 8049A060 00495880  7C 00 07 75 */	extsb. r0, r0
/* 8049A064 00495884  4C 82 00 20 */	bnelr
/* 8049A068 00495888  3C 80 80 67 */	lis r4, lbl_8066A304@ha
/* 8049A06C 0049588C  C0 02 00 00 */	lfs f0, lbl_806754E0@sda21(r0)
/* 8049A070 00495890  38 64 A3 04 */	addi r3, r4, lbl_8066A304@l
/* 8049A074 00495894  38 00 00 01 */	li r0, 0x1
/* 8049A078 00495898  D0 04 A3 04 */	stfs f0, lbl_8066A304@l(r4)
/* 8049A07C 0049589C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 8049A080 004958A0  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 8049A084 004958A4  98 0D A9 80 */	stb r0, lbl_8066D180@sda21(r0)
/* 8049A088 004958A8  4E 80 00 20 */	blr
.endfn fn_8049A05C

# 0x80535008 - 0x8053500C
.section .ctors, "a"
.balign 4
	.4byte fn_8049A05C
