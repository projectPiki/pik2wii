#ifndef NW4R_G3D_PLATFORM_CPU_H
#define NW4R_G3D_PLATFORM_CPU_H

#include <nw4r/types_nw4r.h>

#include <RevoSDK/os.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
/////////////////// FAST CAST HELPERS //////////////////
////////////////////////////////////////////////////////

namespace fastcast {

/// Convert from u8
inline f32 U8_0ToF32(const u8* pPtr)
{
	f32 x;
	OSu8tof32(const_cast<u8*>(pPtr), &x);
	return x;
}

/// Convert from u16
inline f32 U16_0ToF32(const u16* pPtr)
{
	f32 x;
	OSu16tof32(const_cast<u16*>(pPtr), &x);
	return x;
}

/// Convert from s16
inline f32 S7_8ToF32(register const s16* pPtr)
{
	register f32 f;

#ifdef __MWERKS__ // clang-format off
    ASM (
        psq_l f, 0(pPtr), 1, 7
    )
#endif // clang-format on

	return f;
}

/// Convert from s16
inline f32 S10_5ToF32(register const s16* pPtr)
{
	register f32 f;

#ifdef __MWERKS__ // clang-format off
    ASM (
        psq_l f, 0(pPtr), 1, 6
    )
#endif // clang-format on

	return f;
}

/// Convert from f32
inline u8 F32ToU8_0(f32 f)
{
	u8 x;
	OSf32tou8(&f, &x);
	return x;
}

inline s16 F32ToS10_5(register f32 f)
{
	s16 x;
	register s16* pPtr = &x;

#ifdef __MWERKS__ // clang-format off
    ASM (
        psq_st f, 0(pPtr), 1, 6
    )
#endif // clang-format on

	return x;
}

/// GQRs
inline void SetGQR6_S10_5()
{
	OSSetGQR6(OS_GQR_S16, 5);
}
inline void SetGQR7_S7_8()
{
	OSSetGQR7(OS_GQR_S16, 8);
}

/// Encapsulated initialising
namespace detail {

inline void Init()
{
	OSInitFastCast();
	SetGQR6_S10_5();
	SetGQR7_S7_8();
}

} // namespace detail
} // namespace fastcast

////////////////////////////////////////////////////////
///////////////////// CACHE HELPERS ////////////////////
////////////////////////////////////////////////////////

namespace DC {

inline void StoreRange(void* pBase, u32 size)
{
	DCStoreRange(pBase, size);
}

inline void StoreRangeNoSync(void* pBase, u32 size)
{
	DCStoreRangeNoSync(pBase, size);
}

inline void FlushRangeNoSync(void* pBase, u32 size)
{
	DCFlushRangeNoSync(pBase, size);
}

inline void InvalidateRange(void* pBase, u32 size)
{
	DCInvalidateRange(pBase, size);
}

} // namespace DC

////////////////////////////////////////////////////////
/////////////////// MEMORY FUNCTIONS ///////////////////
////////////////////////////////////////////////////////

namespace detail {

void Copy32ByteBlocks(void* pDst, const void* pSrc, u32 size);
void ZeroMemory32ByteBlocks(void* pDst, u32 size);

} // namespace detail

////////////////////////////////////////////////////////
//////////////////// FAST CAST INIT ////////////////////
////////////////////////////////////////////////////////

inline void InitFastCast()
{
	fastcast::detail::Init();
}

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
