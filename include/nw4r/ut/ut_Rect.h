#ifndef NW4R_UT_RECT_H
#define NW4R_UT_RECT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/math.h>

namespace nw4r {
namespace ut {

////////////////////// BASE TYPES //////////////////////

/**
 * @brief Simple box.
 *
 * @note Size: 0x10.
 */
struct Rect {
	Rect()
	    : left(0.0f)
	    , top(0.0f)
	    , right(0.0f)
	    , bottom(0.0f)
	{
	}

	Rect(f32 l, f32 t, f32 r, f32 b)
	    : left(l)
	    , top(t)
	    , right(r)
	    , bottom(b)
	{
	}

	~Rect() { }

	void SetWidth(f32 width) { right = left + width; }
	f32 GetWidth() const { return right - left; }

	void SetHeight(f32 height) { bottom = top + height; }
	f32 GetHeight() const { return bottom - top; }

	void Normalize()
	{
		f32 l = left;
		f32 t = top;
		f32 r = right;
		f32 b = bottom;

		left   = math::FSelect(r - l, l, r); // min(r, l)
		right  = math::FSelect(r - l, r, l); // max(r, l)
		top    = math::FSelect(b - t, t, b); // min(b, t)
		bottom = math::FSelect(b - t, b, t); // max(b, t)
	}

	void MoveTo(f32 x, f32 y)
	{
		right  = x + GetWidth();
		left   = x;
		bottom = y + GetHeight();
		top    = y;
	}

	f32 left;   // _00
	f32 top;    // _04
	f32 right;  // _08
	f32 bottom; // _0C
};

////////////////////////////////////////////////////////

} // namespace ut
} // namespace nw4r

#endif
