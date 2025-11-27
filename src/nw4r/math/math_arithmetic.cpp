#include <nw4r/math/math_arithmetic.h>

namespace nw4r {
namespace math {

/**
 * @brief TODO
 *
 */
f32 FrSqrt(register f32 x)
{
	register f32 rsqrt;
	register f32 c_half = 0.5f, c_three = 3.0f;
	register f32 work0, work1;

#ifdef __MWERKS__ // clang-format off
    ASM (
        // Estimate reciprocal square root
        frsqrte rsqrt, x
        
        // Refine estimate using Newton-Raphson method
        // y = 1 / sqrt(x)
        fmuls work0, rsqrt, rsqrt         // rsqrt^2
        fmuls work1, rsqrt, c_half        // rsqrt * 0.5
        fnmsubs work0, work0, x, c_three  // (3 - x * rsqrt^2)
        fmuls work1, work0, work1         // (3 - x * rsqrt^2) * (rsqrt * 0.5)
    )
#endif // clang-format on

	return work1;
}

} // namespace math
} // namespace nw4r
