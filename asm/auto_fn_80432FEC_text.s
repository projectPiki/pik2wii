.include "macros.inc"
.file "auto_fn_80432FEC_text"

# 0x80432FEC - 0x80433010
.text
.balign 4

.fn fn_80432FEC, global
/* 80432FEC 0042E80C  3C 60 80 5C */	lis r3, lbl_805C7618@ha
/* 80432FF0 0042E810  3C 80 80 43 */	lis r4, fn_8043119C@ha
/* 80432FF4 0042E814  38 63 76 18 */	addi r3, r3, lbl_805C7618@l
/* 80432FF8 0042E818  3C A0 80 64 */	lis r5, lbl_806393A8@ha
/* 80432FFC 0042E81C  90 6D A8 18 */	stw r3, lbl_8066D018@sda21(r0)
/* 80433000 0042E820  38 84 11 9C */	addi r4, r4, fn_8043119C@l
/* 80433004 0042E824  38 A5 93 A8 */	addi r5, r5, lbl_806393A8@l
/* 80433008 0042E828  38 6D A8 18 */	li r3, lbl_8066D018@sda21
/* 8043300C 0042E82C  4B CD 0C 4C */	b __register_global_object
.endfn fn_80432FEC

# 0x80534F9C - 0x80534FA0
.section .ctors, "a"
.balign 4
	.4byte fn_80432FEC
