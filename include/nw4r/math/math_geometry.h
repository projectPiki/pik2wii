#ifndef NW4R_MATH_GEOMETRY_H
#define NW4R_MATH_GEOMETRY_H

#include <nw4r/types_nw4r.h>

#include <nw4r/math/math_types.h>

namespace nw4r {
namespace math {

// Forward declarations
struct AABB;

/////////////////// GLOBAL FUNCTIONS ///////////////////

bool IntersectionAABB(const AABB* pA, const AABB* pB);

/////////////////// ENUMS AND TYPES ////////////////////

/**
 * @brief Types of intersections between a frustum and a bounding box.
 */
enum IntersectionResult {
	INTERSECTION_NONE, // 0
	INTERSECTION_1,    // 1
	INTERSECTION_2,    // 2

	INTERSECTION_LINE3_ON_PLANE    = INTERSECTION_2, // 2
	INTERSECTION_RAY3_ON_PLANE     = INTERSECTION_2, // 2
	INTERSECTION_SEGMENT3_ON_PLANE = INTERSECTION_2, // 2

	INTERSECTION_OUTSIDE = 0, // 0
	INTERSECTION_INSIDE,      // 1
	INTERSECTION_INTERSECT,   // 2
};

/**
 * @brief 3D plane.
 *
 * @note Size: 0x10.
 */
struct PLANE {
	PLANE() { }

	f32 Test(const VEC3& rPoint) const { return d + VEC3Dot(&n, &rPoint); }

	void Set(const VEC3* p0, const VEC3* p1, const VEC3* p2);

	VEC3 n; // _00
	f32 d;  // _0C
};

/**
 * @brief Axis-aligned bounding box.
 *
 * @note Size: 0x18.
 */
struct AABB {
	AABB() { }

	void Set(const VEC3* pPoints, uint num);
	void Set(const AABB* pBox, const MTX34* pMtx);

	VEC3 min; // _00
	VEC3 max; // _0C
};

/**
 * @brief Cut rectangular pyramid (usually for camera view areas).
 *
 * @note Size: 0xF0.
 */
class FRUSTUM {
private:
	/**
	 * @brief Vertex indices of frustum bounds.
	 */
	enum Point {
		POINT_NEAR_TL, // 0
		POINT_NEAR_TR, // 1
		POINT_NEAR_BR, // 2
		POINT_NEAR_BL, // 3

		POINT_FAR_TL, // 4
		POINT_FAR_TR, // 5
		POINT_FAR_BR, // 6
		POINT_FAR_BL, // 7

		POINT_MAX, // 8
	};

	/**
	 * @brief Plane indices of frustum bounds.
	 */
	enum Plane {
		PLANE_L, // 0
		PLANE_R, // 1
		PLANE_N, // 2
		PLANE_F, // 3
		PLANE_T, // 4
		PLANE_B, // 5

		PLANE_MAX, // 6
	};

public:
	void Set(f32 fovy, f32 aspect, f32 n, f32 f, const MTX34& rCamMtx);
	void Set(f32 t, f32 b, f32 l, f32 r, f32 n, f32 f, const MTX34& rCamMtx);

	IntersectionResult IntersectAABB_Ex(const AABB* pBox) const;

private:
	MTX34 mCamMtx;            // _00
	PLANE mPlaneL;            // _30
	PLANE mPlaneR;            // _40
	PLANE mPlaneT;            // _50
	PLANE mPlaneB;            // _60
	f32 mNearZ;               // _70
	f32 mFarZ;                // _74
	AABB mBox;                // _78
	PLANE mPlanes[PLANE_MAX]; // _90
};

////////////////////////////////////////////////////////

} // namespace math
} // namespace nw4r

#endif
