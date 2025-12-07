#ifndef NW4R_G3D_RES_RESANMFOG_H
#define NW4R_G3D_RES_RESANMFOG_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>

#include <nw4r/ut.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
/////////////////// FOG ANIM RESULTS ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data object for passing fog animation results.
 *
 * @note Size: 0x10.
 */
struct FogAnmResult {
	GXFogType type;  // _00
	f32 startz;      // _04
	f32 endz;        // _08
	ut::Color color; // _0C
};

////////////////////////////////////////////////////////
////////////////// FOG ANIM RESOURCES //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for fog animation resources.
 *
 * @note Size: 0x28.
 */
struct ResAnmFogData {

	/**
	 * @brief Fog animation control/property flags.
	 */
	enum Flag {
		FLAG_START_CONST = (1 << 29), // 0x20000000
		FLAG_END_CONST   = (1 << 30), // 0x40000000
		FLAG_COLOR_CONST = (1 << 31), // 0x80000000
	};

	u32 size;              // _00
	s32 toResAnmScnData;   // _04
	s32 name;              // _08
	u32 id;                // _0C
	u32 refNumber;         // _10
	u32 flags;             // _14
	GXFogType type;        // _18
	ResAnmData startz;     // _1C
	ResAnmData endz;       // _20
	ResColorAnmData color; // _24
};

/**
 * @brief Wrapper class for fog animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmFog : public ResCommon<ResAnmFogData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmFog);

	void GetAnmResult(FogAnmResult* pResult, f32 frame) const;

	u32 GetID() const { return ref().id; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
