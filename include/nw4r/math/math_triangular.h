#ifndef NW4R_MATH_TRIANGULAR_H
#define NW4R_MATH_TRIANGULAR_H

#include <nw4r/types_nw4r.h>

#include <nw4r/math/math_arithmetic.h>
#include <nw4r/math/math_constant.h>

#include <stl/math.h>

// TODO: move these to a better header
namespace std {
inline f32 sinf(f32 x)
{
	return sin(x);
}

inline f32 cosf(f32 x)
{
	return cos(x);
}

inline f32 tanf(f32 x)
{
	return tan(x);
}
} // namespace std

namespace nw4r {
namespace math {

////////////////// TYPES AND GLOBALS ///////////////////

namespace detail {

/**
 * @brief Struct for the sine-cosine lookup table.
 *
 * @note Size: 0x10.
 */
struct SinCosSample {
	f32 sin_val;   // at 0x0
	f32 cos_val;   // at 0x4
	f32 sin_delta; // at 0x8
	f32 cos_delta; // at 0xC
};

extern const SinCosSample gSinCosTbl[];
} // namespace detail

////////////////////////////////////////////////////////
//////////////////////// MACROS ////////////////////////

// [0, 65535] -> [0.0, 256.0f]
#define NW4R_MATH_IDX_TO_FIDX(x) ((x) * (1.0f / 256.0f))

// Convert degrees <-> lookup-table index
#define NW4R_MATH_DEG_TO_FIDX(x) ((x) * (256.0f / 360.0f))
#define NW4R_MATH_FIDX_TO_DEG(x) ((x) * (360.0f / 256.0f))

// Convert radians <-> lookup-table index
#define NW4R_MATH_RAD_TO_FIDX(x) ((x) * (128.0f / NW4R_MATH_PI))
#define NW4R_MATH_FIDX_TO_RAD(x) ((x) * (NW4R_MATH_PI / 128.0f))

// Convert degrees <-> radians
#define NW4R_MATH_DEG_TO_RAD(x) ((x) * (NW4R_MATH_PI / 180.0f))
#define NW4R_MATH_RAD_TO_DEG(x) ((x) * (180.0f / NW4R_MATH_PI))

////////////////////////////////////////////////////////
/////////////////// GLOBAL FUNCTIONS ///////////////////

f32 SinFIdx(f32 fidx);
f32 CosFIdx(f32 fidx);
void SinCosFIdx(f32* pSin, f32* pCos, f32 fidx);
f32 AtanFIdx(f32 x);
f32 Atan2FIdx(f32 y, f32 x);

////////////////////////////////////////////////////////
/////////////////// INLINE FUNCTIONS ///////////////////
// Sine
inline f32 SinIdx(u16 idx)
{
	return SinFIdx(NW4R_MATH_IDX_TO_FIDX(U16ToF32(idx)));
}
inline f32 SinDeg(f32 deg)
{
	return SinFIdx(NW4R_MATH_DEG_TO_FIDX(deg));
}
inline f32 SinRad(f32 rad)
{
	return SinFIdx(NW4R_MATH_RAD_TO_FIDX(rad));
}

// Cosine
inline f32 CosDeg(f32 deg)
{
	return CosFIdx(NW4R_MATH_DEG_TO_FIDX(deg));
}
inline f32 CosRad(f32 rad)
{
	return CosFIdx(NW4R_MATH_RAD_TO_FIDX(rad));
}

// Tangent
inline f32 TanFIdx(f32 fidx)
{
	return std::tanf(NW4R_MATH_FIDX_TO_RAD(fidx));
}
inline f32 TanDeg(f32 deg)
{
	return TanFIdx(NW4R_MATH_DEG_TO_FIDX(deg));
}
inline f32 TanRad(f32 rad)
{
	return TanFIdx(NW4R_MATH_RAD_TO_FIDX(rad));
}

// Sine and Cosine
inline void SinCosDeg(f32* pSin, f32* pCos, f32 deg)
{
	return SinCosFIdx(pSin, pCos, NW4R_MATH_DEG_TO_FIDX(deg));
}
inline void SinCosRad(f32* pSin, f32* pCos, f32 rad)
{
	return SinCosFIdx(pSin, pCos, NW4R_MATH_RAD_TO_FIDX(rad));
}

// Arc-tangent
inline f32 AtanDeg(f32 x)
{
	return NW4R_MATH_FIDX_TO_DEG(AtanFIdx(x));
}
inline f32 AtanRad(f32 x)
{
	return NW4R_MATH_FIDX_TO_RAD(AtanFIdx(x));
}

// Arc-tangent (2 arguments)
inline f32 Atan2Deg(f32 y, f32 x)
{
	return NW4R_MATH_FIDX_TO_DEG(Atan2FIdx(y, x));
}
inline f32 Atan2Rad(f32 y, f32 x)
{
	return NW4R_MATH_FIDX_TO_RAD(Atan2FIdx(y, x));
}

////////////////////////////////////////////////////////

} // namespace math
} // namespace nw4r

#endif
