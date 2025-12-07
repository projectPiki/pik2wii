#ifndef MSL_MATH_DOUBLE_H
#define MSL_MATH_DOUBLE_H
#include <types.h>

#include <PowerPC_EABI_Support/MSL_C/MSL_Common/fdlibm_public.h>

#ifdef __cplusplus
extern "C" {
#endif

inline f32 acosf(f32 x)
{
	return acos(x);
}
inline f32 asinf(f32 x)
{
	return asin(x);
}
inline f32 atan2f(f32 x, f32 y)
{
	return atan2(x, y);
}
inline f32 ceilf(f32 x)
{
	return ceil(x);
}
inline f32 cosf(f32 x)
{
	return cos(x);
}
inline f32 sinf(f32 x)
{
	return sin(x);
}
inline f32 sqrtf(f32 x)
{
	return sqrt(x);
}
inline f32 tanf(f32 x)
{
	return tan(x);
}
inline f32 floorf(f32 x)
{
	return floor(x);
}
inline f32 fmodf(f32 x, f32 y)
{
	return fmod(x, y);
}

inline f32 ldexpf(f32 value, int exp)
{
	return ldexp(value, exp);
}

inline f32 modff(f32 x, f32* iptr)
{
	f32 frac;
	f64 intg;

	frac  = modf(x, &intg);
	*iptr = intg;

	return frac;
}

f32 fabsf(f32 x);

#ifdef __cplusplus
}
#endif
#endif
