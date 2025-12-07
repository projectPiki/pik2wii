#ifndef NW4R_G3D_RES_RESANMAMBLIGHT_H
#define NW4R_G3D_RES_RESANMAMBLIGHT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
/////////////// AMBIENT LIGHT ANIM RESULT //////////////
////////////////////////////////////////////////////////

/**
 * @brief Class for passing ambient light animation results to other objects.
 *
 * @note Size: 0x8.
 */
struct AmbLightAnmResult {

	/**
	 * @brief Color and alpha flags.
	 *
	 * @note Size: 0x8.
	 */
	enum Flag {
		FLAG_COLOR_ENABLE = (1 << 0),
		FLAG_ALPHA_ENABLE = (1 << 1),
	};

	u32 flags; // _00
	u32 color; // _04
};

////////////////////////////////////////////////////////
////////////// AMBIENT LIGHT ANIM RESOURCE /////////////
////////////////////////////////////////////////////////

/**
 * @brief Data object for ambient light data for animations.
 *
 * @note Size: 0x20.
 */
struct ResAnmAmbLightData {
	enum Flag {
		FLAG_COLOR_ENABLE = (1 << 0),
		FLAG_ALPHA_ENABLE = (1 << 1),

		FLAG_CONST = (1 << 31)
	};

	u32 size;              // _00
	s32 toResAnmScnData;   // _04
	s32 name;              // _08
	u32 id;                // _0C
	u32 refNumber;         // _10
	u32 flags;             // _14
	ResColorAnmData color; // _18
};

/**
 * @brief Data wrapper for ambient light animation resources.
 *
 * @note Size: 0x20.
 */
class ResAnmAmbLight : public ResCommon<ResAnmAmbLightData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmAmbLight);

	void GetAnmResult(AmbLightAnmResult* pResult, f32 frame) const;

	u32 GetID() const { return ref().id; }

	u32 GetRefNumber() const { return ref().refNumber; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
