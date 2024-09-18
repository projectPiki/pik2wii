.include "macros.inc"
.file "__init_cpp_exceptions.cpp"

# 0x8010496C - 0x801049DC
.text
.balign 4

.fn __init_cpp_exceptions, global
/* 8010496C 0010018C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80104970 00100190  7C 08 02 A6 */	mflr r0
/* 80104974 00100194  90 01 00 14 */	stw r0, 0x14(r1)
/* 80104978 00100198  80 0D 82 90 */	lwz r0, fragmentID_8066AA90@sda21(r0)
/* 8010497C 0010019C  2C 00 FF FE */	cmpwi r0, -0x2
/* 80104980 001001A0  40 82 00 18 */	bne .L_80104998
/* 80104984 001001A4  3C 60 80 00 */	lis r3, _eti_init_info@ha
/* 80104988 001001A8  7C 44 13 78 */	mr r4, r2
/* 8010498C 001001AC  38 63 6D 88 */	addi r3, r3, _eti_init_info@l
/* 80104990 001001B0  48 00 00 4D */	bl __register_fragment
/* 80104994 001001B4  90 6D 82 90 */	stw r3, fragmentID_8066AA90@sda21(r0)
.L_80104998:
/* 80104998 001001B8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8010499C 001001BC  7C 08 03 A6 */	mtlr r0
/* 801049A0 001001C0  38 21 00 10 */	addi r1, r1, 0x10
/* 801049A4 001001C4  4E 80 00 20 */	blr
.endfn __init_cpp_exceptions

.fn __fini_cpp_exceptions, global
/* 801049A8 001001C8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801049AC 001001CC  7C 08 02 A6 */	mflr r0
/* 801049B0 001001D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801049B4 001001D4  80 6D 82 90 */	lwz r3, fragmentID_8066AA90@sda21(r0)
/* 801049B8 001001D8  2C 03 FF FE */	cmpwi r3, -0x2
/* 801049BC 001001DC  41 82 00 10 */	beq .L_801049CC
/* 801049C0 001001E0  48 00 00 51 */	bl __unregister_fragment
/* 801049C4 001001E4  38 00 FF FE */	li r0, -0x2
/* 801049C8 001001E8  90 0D 82 90 */	stw r0, fragmentID_8066AA90@sda21(r0)
.L_801049CC:
/* 801049CC 001001EC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801049D0 001001F0  7C 08 03 A6 */	mtlr r0
/* 801049D4 001001F4  38 21 00 10 */	addi r1, r1, 0x10
/* 801049D8 001001F8  4E 80 00 20 */	blr
.endfn __fini_cpp_exceptions

# 0x80534C80 - 0x80534C84
.section .ctors, "a"
.balign 4

.obj __init_cpp_exceptions_reference, global
	.4byte __init_cpp_exceptions
.endobj __init_cpp_exceptions_reference

# 0x805350E0 - 0x805350E8
.section .dtors, "a"
.balign 4

.obj __destroy_global_chain_reference, global
	.4byte __destroy_global_chain
.endobj __destroy_global_chain_reference

.obj __fini_cpp_exceptions_reference, global
	.4byte __fini_cpp_exceptions
.endobj __fini_cpp_exceptions_reference
