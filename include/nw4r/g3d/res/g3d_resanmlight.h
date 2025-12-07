#ifndef NW4R_G3D_RES_RESANMLIGHT_H
#define NW4R_G3D_RES_RESANMLIGHT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>

#include <nw4r/math.h>
#include <nw4r/ut.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

// Forward declarations
struct LightAnmResult;

////////////////////////////////////////////////////////
///////////////////// COMMON TYPES /////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Base (empty) class for light animation data (just light types).
 *
 * @note Size: 0x0.
 */
struct ResAnmLightDataTypedef {

	/**
	 * @brief Flags for light types.
	 */
	enum LightType {
		LIGHTTYPE_POINT,
		LIGHTTYPE_DIRECTIONAL,
		LIGHTTYPE_SPOT,

		LIGHTTYPE_MAX
	};

	// Empty.
};

////////////////////////////////////////////////////////
////////////////// LIGHT ANIM RESULTS //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data object for passing light animation results.
 *
 * @note Size: 0x40.
 */
struct LightAnmResult : public ResAnmLightDataTypedef {

	/**
	 * @brief Light animation control flags/masks.
	 */
	enum Flag {
		FLAG_LIGHT_TYPE_MASK = (1 << 0) | (1 << 1),
		FLAG_LIGHT_ENABLE    = (1 << 2),
		FLAG_SPECULAR_ENABLE = (1 << 3),
		FLAG_COLOR_ENABLE    = (1 << 4),
		FLAG_ALPHA_ENABLE    = (1 << 5)
	};

	u32 specIdx;           // _00
	u32 flags;             // _04
	math::VEC3 pos;        // _08
	math::VEC3 aim;        // _14
	ut::Color color;       // _20
	GXDistAttnFn distFunc; // _24
	f32 refDistance;       // _28
	f32 refBrightness;     // _2C
	GXSpotFn spotFunc;     // _30
	f32 cutoff;            // _34
	ut::Color specColor;   // _38
	f32 shininess;         // _3C
};

////////////////////////////////////////////////////////
///////////////// LIGHT ANIM RESOURCES /////////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for light animation resources.
 *
 * @note Size: 0x5C.
 */
struct ResAnmLightData : public ResAnmLightDataTypedef {

	/**
	 * @brief Light control/operation flags.
	 */
	enum Flag {
		FLAG_LIGHT_TYPE_MASK = (1 << 0) | (1 << 1),
		FLAG_LIGHT_ENABLE    = (1 << 2),
		FLAG_SPECULAR_ENABLE = (1 << 3),
		FLAG_COLOR_ENABLE    = (1 << 4),
		FLAG_ALPHA_ENABLE    = (1 << 5),

		FLAG_POS_X_CONST = (1 << 19),
		FLAG_POS_Y_CONST = (1 << 20),
		FLAG_POS_Z_CONST = (1 << 21),

		FLAG_COLOR_CONST  = (1 << 22),
		FLAG_ENABLE_CONST = (1 << 23),

		FLAG_AIM_X_CONST = (1 << 24),
		FLAG_AIM_Y_CONST = (1 << 25),
		FLAG_AIM_Z_CONST = (1 << 26),

		FLAG_CUTOFF_CONST         = (1 << 27),
		FLAG_REF_DISTANCE_CONST   = (1 << 28),
		FLAG_REF_BRIGHTNESS_CONST = (1 << 29),
		FLAG_SPEC_COLOR_CONST     = (1 << 30),
		FLAG_SHININESS_CONST      = (1 << 31)
	};

	u32 size;                  // _00
	s32 toResAnmScnData;       // _04
	s32 name;                  // _08
	u32 id;                    // _0C
	u32 refNumber;             // _10
	u32 specLightObjIdx;       // _14
	s32 toResUserData;         // _18
	u32 flags;                 // _1C
	ResBoolAnmData enable;     // _20
	ResAnmData posX;           // _24
	ResAnmData posY;           // _28
	ResAnmData posZ;           // _2C
	ResColorAnmData color;     // _30
	ResAnmData aimX;           // _34
	ResAnmData aimY;           // _38
	ResAnmData aimZ;           // _3C
	GXDistAttnFn distFunc;     // _40
	ResAnmData refDistance;    // _44
	ResAnmData refBrightness;  // _48
	GXSpotFn spotFunc;         // _4C
	ResAnmData cutoff;         // _50
	ResColorAnmData specColor; // _54
	ResAnmData shininess;      // _58
};

/**
 * @brief Wrapper for light animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmLight : public ResCommon<ResAnmLightData>, public ResAnmLightDataTypedef {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmLight);

	void GetAnmResult(LightAnmResult* pResult, f32 frame) const;

	u32 GetID() const { return ref().id; }

	u32 GetRefNumber() const { return ref().refNumber; }

	u32 GetSpecularLightIdx() const { return ref().specLightObjIdx; }

	bool HasSpecularLight() const { return ref().flags & ResAnmLightData::FLAG_SPECULAR_ENABLE; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
