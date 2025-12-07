#ifndef MSL_FDLIBM_PUBLIC_H
#define MSL_FDLIBM_PUBLIC_H

#include <types.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * For including FDLIBM declarations without also including its many macros.
 */

f64 atan(f64 x);
f64 ceil(f64 x);
f64 copysign(f64 x, f64 y);
f64 cos(f64 x);
f64 floor(f64 x);
f64 frexp(f64 x, int* eptr);
f64 ldexp(f64 value, int exp);
f64 modf(f64 x, f64* iptr);
f64 sin(f64 x);
f64 tan(f64 x);
f64 acos(f64 x);
f64 asin(f64 x);
f64 atan2(f64 y, f64 x);
f64 fmod(f64 x, f64 y);
f64 pow(f64 x, f64 y);
f64 sqrt(f64 x);

#ifdef __cplusplus
}
#endif

#endif
