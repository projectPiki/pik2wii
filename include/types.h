#ifndef _TYPES_H
#define _TYPES_H

#ifdef __INTELLISENSE__
#include "../.vscode/warnings.h"
#endif

#include "BuildSettings.h"
#include "compat.h"

// r2 is  8051E360
// r13 is 8051C680

typedef int BOOL;
typedef unsigned int uint;

typedef signed char s8;
typedef signed short s16;
typedef signed long s32;
typedef signed long long s64;
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;
typedef unsigned long long u64;

typedef volatile u8 vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile u64 vu64;
typedef volatile s8 vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;
typedef volatile s64 vs64;

typedef float f32;
typedef double f64;
typedef long double f128;
typedef volatile f32 vf32;
typedef volatile f64 vf64;
typedef volatile f128 vf128;

typedef u32 size_t;
typedef u32 unknown;
typedef u32 uintptr_t;

#ifndef __cplusplus
typedef u16 wchar_t;
#endif

typedef unsigned char			byte1_t;
typedef unsigned short int		byte2_t;
typedef unsigned long int		byte4_t;
typedef unsigned long long int	byte8_t;

typedef byte1_t					byte_t;

#define unk1_t char
#define unk2_t short
#define unk4_t int
#define unk8_t long long

#define unk_t unk4_t

#define SHORT_FLOAT_MAX (32768.0f)
#define SHORT_FLOAT_MIN (-32768.0f)

// Basic defines to allow newer-like C++ code to be written
#define TRUE    1
#define FALSE   0
#define NULL    ((void*)0)
#define nullptr 0

// Maximum length of a path in engine
#define PATH_MAX (256)

#define SET_FLAG(x, val)     (x |= (val))
#define RESET_FLAG(x, val)   (x &= ~(val))
#define IS_FLAG(x, val)      (x & val)
#define ARRAY_SIZE(o)        (sizeof((o)) / sizeof(*(o)))
#define ALIGN_PREV(X, N)     ((X) & ~((N) - 1))
#define ALIGN_NEXT(X, N)     ALIGN_PREV(((X) + (N) - 1), N)
#define IS_ALIGNED(X, N)     ((X & ((N) - 1)) == 0)
#define IS_NOT_ALIGNED(X, N) (((X) & ((N) - 1)) != 0)
#define ATTRIBUTE_ALIGN(num) __attribute__((aligned(num)))

#define ROUND_UP(x, align)     (((x) + (align) - 1) & (-(align)))
#define ROUND_UP_PTR(x, align) ((void*)((((u32)(x)) + (align) - 1) & (~((align) - 1))))
#define ROUND_DOWN_PTR(x, align) ((void*)(((u32)(x)) & (~((align) - 1))))

#define POINTER_ADD_TYPE(type_, ptr_, offset_)		((type_)((unsigned long)(ptr_) + (unsigned long)(offset_)))
#define POINTER_ADD(ptr_, offset_)					POINTER_ADD_TYPE(__typeof__(ptr_), ptr_, offset_)

#define BOOLIFY_TERNARY_TRUE_TYPE(type_, expr_)		((expr_) ? ((type_)(1)) : ((type_)(0)))
#define BOOLIFY_TERNARY_TRUE(expr_)					BOOLIFY_TERNARY_TRUE_TYPE(int, expr_)

#define BOOLIFY_TERNARY_FALSE_TYPE(type_, expr_)	((expr_) ? ((type_)(0)) : ((type_)(1)))
#define BOOLIFY_TERNARY_FALSE(expr_)				BOOLIFY_TERNARY_FALSE_TYPE(int, expr_)

#define BOOLIFY_TERNARY_TYPE						BOOLIFY_TERNARY_TRUE_TYPE
#define BOOLIFY_TERNARY								BOOLIFY_TERNARY_TRUE

#define ASSERT_HANG(cond) \
	if (!(cond)) {        \
		while (true) { }  \
	}

#define offsetof(type, memb) ((u32) & ((type*)0)->memb)

#define __CONCAT(x, y) x##y
#define CONCAT(x, y)   __CONCAT(x, y)

// Multi-character character constants
// clang-format off
#define TWOCC(c0, c1)                                                          \
    (u32)((c0 & 0xFF) << 8  | (c1 & 0xFF))
#define THREECC(c0, c1, c2)                                                    \
    (u32)((c0 & 0xFF) << 16 | (c1 & 0xFF) << 8  | (c2 & 0xFF))
#define FOURCC(c0, c1, c2, c3)                                                 \
    (u32)((c0 & 0xFF) << 24 | (c1 & 0xFF) << 16 | (c2 & 0xFF) << 8 | (c3 & 0xFF))
// clang-format on

#define CLAMP_VALUE_ABOVE(val, limit)              ((val) > (limit)) ? (limit) : (val)
#define MAX(a, b)                                  (((a) > (b)) ? (a) : (b))
#define MIN(a, b)                                  (((a) < (b)) ? (a) : (b))
#define MIN_EQ(a, b)							   (((a) <= (b)) ? (a) : (b))
#define ROUND_F32_TO_U8(a)                         ((a) >= 0.0f) ? ((a) + 0.5f) : ((a) - 0.5f)
#define INTERPOLATE_BETWEEN(src, dest, proportion) (proportion) * ((f32)(dest) - (f32)(src)) + (f32)(src)

#define DECOMP_DONT_INLINE __attribute__((noinline))

#ifdef __MWERKS__
#define WEAKFUNC        __declspec(weak)
#define DECL_SECT(name) __declspec(section name)
#define ASM             asm
#define DECOMP_FORCELITERAL(module, ...)               \
	void CONCAT(FORCELITERAL##module, __LINE__)(void); \
	void CONCAT(FORCELITERAL##module, __LINE__)(void)  \
	{                                                  \
		(__VA_ARGS__);                                 \
	}
#define DECOMP_FORCEACTIVE(module, ...)               \
	void fake_function(...);                          \
	void CONCAT(FORCEACTIVE##module, __LINE__)(void); \
	void CONCAT(FORCEACTIVE##module, __LINE__)(void)  \
	{                                                 \
		fake_function(__VA_ARGS__);                   \
	}
#else
#define WEAKFUNC
#define DECL_SECT(name)
#define ASM
#define DECOMP_FORCELITERAL(module, ...)
#define DECOMP_FORCEACTIVE(module, ...)
#endif

#endif // _TYPES_H
