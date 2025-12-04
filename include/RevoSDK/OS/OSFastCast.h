#ifndef _DOLPHIN_OS_OSFASTCAST_H
#define _DOLPHIN_OS_OSFASTCAST_H

#include "RevoSDK/OS/OSUtil.h"
#include "types.h"

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

/////// FAST CAST DEFINES ////////
// GQR formats.
#define OS_GQR_U8  (0x0004) // GQR 1
#define OS_GQR_U16 (0x0005) // GQR 2
#define OS_GQR_S8  (0x0006) // GQR 3
#define OS_GQR_S16 (0x0007) // GQR 4

// GQRs for fast casting.
#define OS_FASTCAST_U8  (2)
#define OS_FASTCAST_U16 (3)
#define OS_FASTCAST_S8  (4)
#define OS_FASTCAST_S16 (5)

//////////////////////////////////

/////// FAST CAST INLINES ////////
// Initialise fast casting.
static inline void OSInitFastCast()
{
#ifdef __MWERKS__ // clang-format off
	asm {
		li r3, OS_GQR_U8
		oris r3, r3, OS_GQR_U8
		mtspr 0x392, r3
		li r3, OS_GQR_U16
		oris r3, r3, OS_GQR_U16
		mtspr 0x393, r3
		li r3, OS_GQR_S8
		oris r3, r3, OS_GQR_S8
		mtspr 0x394, r3
		li r3, OS_GQR_S16
		oris r3, r3, OS_GQR_S16
		mtspr 0x395, r3
	}
#endif // clang-format on
}

// Float to int.
// NB: should theoretically have these for u8/u16/s8/s16 eventually.
static inline u16 __OSf32tou16(register f32 arg)
{
	f32 a;
	register f32* ptr = &a;
	u16 r;

#ifdef __MWERKS__ // clang-format off
    asm {
        psq_st arg, 0(ptr), 1, 3
	}
#endif // clang-format on

	r = *(u16*)ptr;
	return r;
}

static inline void OSf32tou16(f32* in, volatile u16* out)
{
	*out = __OSf32tou16(*in);
}

static inline s16 __OSf32tos16(register f32 inF)
{
	register s16 out;
	u32 tmp;
	register u32* tmpPtr = &tmp;
#ifdef __MWERKS__ // clang-format off
	asm {
		psq_st inF, 0(tmpPtr), 0x1, OS_FASTCAST_S16
		lha out, 0(tmpPtr)
	}
#endif // clang-format on

	return out;
}

static inline void OSf32tos16(f32* f, s16* out)
{
	*out = __OSf32tos16(*f);
}

static inline u8 __OSf32tou8(register f32 inF)
{
	register u8 out;
	u32 tmp;
	register u32* tmpPtr = &tmp;
#ifdef __MWERKS__ // clang-format off
	asm {
		psq_st inF, 0(tmpPtr), 0x1, OS_FASTCAST_U8
		lbz out, 0(tmpPtr)
	}
#endif // clang-format on

	return out;
}

static inline void OSf32tou8(f32* f, u8* out)
{
	*out = __OSf32tou8(*f);
}

static inline s8 __OSf32tos8(register f32 inF)
{
	register s8 out;
	u32 tmp;
	register u32* tmpPtr = &tmp;
#ifdef __MWERKS__ // clang-format off
	asm {
		psq_st inF, 0(tmpPtr), 0x1, OS_FASTCAST_S8
		lbz out, 0(tmpPtr)
		extsb out, out
	}
#endif // clang-format on

	return out;
}

static inline void OSf32tos8(f32* f, s8* out)
{
	*out = __OSf32tos8(*f);
}

// Int to float.
// NB: should have these for u8/u16/s8/s16 eventually.

// TODO: make these based on above/as necessary.
static inline f32 __OSu16tof32(register u16* arg)
{
	register f32 ret;

#ifdef __MWERKS__ // clang-format off
    asm {
        psq_l ret, 0(arg), 1, 3
	}
#endif // clang-format on

	return ret;
}

static inline void OSu16tof32(u16* in, volatile f32* out)
{
	*out = __OSu16tof32(in);
}

//////////////////////////////////

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif
