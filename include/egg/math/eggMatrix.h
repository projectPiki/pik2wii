#ifndef EGG_MATRIX_H
#define EGG_MATRIX_H

#include "egg/math/eggVector.h"
#include "nw4r/math/math_types.h"

namespace EGG {

///////////////////// MATRIX TYPES /////////////////////

/**
 * @brief Basic 3x4 matrix.
 *
 * @note Size: 0x30.
 */
struct Matrix34f {
	Matrix34f() { }
	Matrix34f(f32 xx, f32 xy, f32 xz, f32 xw, f32 yx, f32 yy, f32 yz, f32 yw, f32 zx, f32 zy, f32 zz, f32 zw);

	f32 operator()(int i, int j) const { return m[i][j]; }
	f32& operator()(int i, int j) { return m[i][j]; }
	f32 operator()(int i) const { return arr[i]; }
	f32& operator()(int i) { return arr[i]; }

	Matrix34f& operator=(const Matrix34f& other)
	{
		copyFrom(other);
		return *this;
	}

	void inverseTransposeTo(Matrix34f& to) const;
	void makeIdentity();
	void makeSRT(const Vector3f& s, const Vector3f& r, const Vector3f& t);
	void makeRT(const Vector3f& r, const Vector3f& t);
	void makeR(const Vector3f& r);
	void makeST(const Vector3f& s, const Vector3f& t);
	void makeS(const Vector3f& s);
	void makeT(const Vector3f& t);
	// Vector3f multVector(const Vector3f &vec) const;
	void multVector(const Vector3f& vec) const;
	void loadPosMtx(u32);
	void loadNrmMtx(u32 nrmMtxId);
	void multiplyTo(const Matrix34f& m2, Matrix34f& to) const;

	operator nw4r::math::MTX34*() { return (nw4r::math::MTX34*)this; }

	operator const nw4r::math::MTX34*() const { return (nw4r::math::MTX34*)this; }

	void concat(const Matrix34f&, Matrix34f&) const;
	void rotate(const Vector3f& rpy) const;
	void multVectorTo(const Vector3f& from, Vector3f& to) const;
	void transposeTo(Matrix34f& to) const;
	void copyFrom(const Matrix34f& other)
	{
		for (int i = 0; i < 12; i++) {
			(*this)(i) = other(i);
		}
	}
	void setBase(int idx, const Vector3f& b)
	{
		(*this)(0, idx) = b.x;
		(*this)(1, idx) = b.y;
		(*this)(2, idx) = b.z;
	}

	void getBase(int idx, Vector3f& b) const
	{
		b(0) = (*this)(0, idx);
		b(1) = (*this)(1, idx);
		b(2) = (*this)(2, idx);
	}

	void setTranslation(const Vector3f& t) { setBase(3, t); }

	void getTranslation(Vector3f& t) const { getBase(3, t); }

	void makeZero()
	{
		for (int i = 0; i < 12; i++) {
			arr[i] = 0.0f;
		}
	}

	static Matrix34f ident;

	union {
		f32 m[3][4];
		f32 arr[12];
	}; // _00-_30
};

////////////////////////////////////////////////////////

} // namespace EGG

#endif
