.include "macros.inc"
.file "auto_fn_804F8FEC_text"

# 0x804F8FEC - 0x804F900C
.text
.balign 4

.fn fn_804F8FEC, global
/* 804F8FEC 004F480C  38 00 FF FF */	li r0, -0x1
/* 804F8FF0 004F4810  3C 80 80 01 */	lis r4, fn_80008320@ha
/* 804F8FF4 004F4814  3C A0 80 64 */	lis r5, lbl_8063E570@ha
/* 804F8FF8 004F4818  90 0D AB B0 */	stw r0, lbl_8066D3B0@sda21(r0)
/* 804F8FFC 004F481C  38 84 83 20 */	addi r4, r4, fn_80008320@l
/* 804F9000 004F4820  38 6D AB B0 */	li r3, lbl_8066D3B0@sda21
/* 804F9004 004F4824  38 A5 E5 70 */	addi r5, r5, lbl_8063E570@l
/* 804F9008 004F4828  4B C0 AC 50 */	b __register_global_object
.endfn fn_804F8FEC

# 0x80535098 - 0x8053509C
.section .ctors, "a"
.balign 4
	.4byte fn_804F8FEC
