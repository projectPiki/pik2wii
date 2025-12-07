#ifndef NW4R_G3D_RES_RESANMCAMERA_H
#define NW4R_G3D_RES_RESANMCAMERA_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>

#include <nw4r/math.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
///////////////////// COMMON TYPES /////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Base class for animation camera resources (just camera types).
 *
 * @note Size: 0x0.
 */
struct ResAnmCameraDataTypedef {

	/**
	 * @brief Camera animation types.
	 */
	enum CameraType {
		CAMERATYPE_ROTATE,
		CAMERATYPE_AIM,

		CAMERATYPE_MAX
	};
};

////////////////////////////////////////////////////////
///////////////// CAMERA ANIM RESULTS //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data class for passing result info from camera animations.
 *
 * @note Size: 0x34.
 */
struct CameraAnmResult : ResAnmCameraDataTypedef {

	/**
	 * @brief Result flags and bit masks.
	 */
	enum Flag {
		FLAG_CAMERA_TYPE_MASK = (1 << 0), // 0x1
		FLAG_ANM_EXISTS       = (1 << 1), // 0x2
	};

	u32 flags;                 // _00
	GXProjectionType projType; // _04
	math::VEC3 pos;            // _08
	f32 aspect;                // _14
	f32 near;                  // _18
	f32 far;                   // _1C

	union {
		struct {
			math::_VEC3 rot; // _20
		} rotate;

		struct {
			math::_VEC3 aim; // _20
			f32 twist;       // _2C
		} aim;
	};

	union {
		f32 perspFovy;   // _30
		f32 orthoHeight; // _30
	};
};

////////////////////////////////////////////////////////
//////////////// CAMERA ANIM RESOURCE //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data class for camera animation resources.
 *
 * @note Size: 0x5C.
 */
struct ResAnmCameraData : ResAnmCameraDataTypedef {

	/**
	 * @brief Camera anim control flags and masks.
	 */
	enum Flag {
		FLAG_CAMERA_TYPE_MASK = (1 << 0),
		FLAG_ANM_EXISTS       = (1 << 1),

		FLAG_POS_X_CONST = (1 << 17),
		FLAG_POS_Y_CONST = (1 << 18),
		FLAG_POS_Z_CONST = (1 << 19),

		FLAG_ASPECT_CONST = (1 << 20),
		FLAG_NEAR_CONST   = (1 << 21),
		FLAG_FAR_CONST    = (1 << 22),

		FLAG_PERSP_FOVY_CONST   = (1 << 23),
		FLAG_ORTHO_HEIGHT_CONST = (1 << 24),

		FLAG_AIM_X_CONST = (1 << 25),
		FLAG_AIM_Y_CONST = (1 << 26),
		FLAG_AIM_Z_CONST = (1 << 27),
		FLAG_TWIST_CONST = (1 << 28),

		FLAG_ROT_X_CONST = (1 << 29),
		FLAG_ROT_Y_CONST = (1 << 30),
		FLAG_ROT_Z_CONST = (1 << 31)
	};

	u32 size;                  // _00
	s32 toResAnmScnData;       // _04
	s32 name;                  // _08
	u32 id;                    // _0C
	u32 refNumber;             // _10
	GXProjectionType projType; // _14
	u32 flags;                 // _18
	s32 toResUserData;         // _1C
	ResAnmData posX;           // _20
	ResAnmData posY;           // _24
	ResAnmData posZ;           // _28
	ResAnmData aspect;         // _2C
	ResAnmData near;           // _30
	ResAnmData far;            // _34
	ResAnmData rotX;           // _38
	ResAnmData rotY;           // _3C
	ResAnmData rotZ;           // _40
	ResAnmData aimX;           // _44
	ResAnmData aimY;           // _48
	ResAnmData aimZ;           // _4C
	ResAnmData twist;          // _50
	ResAnmData perspFovy;      // _54
	ResAnmData orthoHeight;    // _58
};

/**
 * @brief Wrapper class for camera animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmCamera : public ResCommon<ResAnmCameraData>, public ResAnmCameraDataTypedef {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmCamera);

	void GetAnmResult(CameraAnmResult* pResult, f32 frame) const;

	u32 GetID() const { return ref().id; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
