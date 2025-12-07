#ifndef NW4R_G3D_RES_RESLIGHTSET_H
#define NW4R_G3D_RES_RESLIGHTSET_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/g3d_state.h>
#include <nw4r/g3d/res/g3d_resanmscn.h>
#include <nw4r/g3d/res/g3d_rescommon.h>

namespace nw4r {
namespace g3d {

// Forward declarations
class ResAnmScn;

////////////////////////////////////////////////////////
///////////////// LIGHT SET RESOURCES //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for light set resources.
 *
 * @note Size: 0x4C.
 */
struct ResLightSetData {
	static const u32 INVALID_ID = 0xFFFF;

	u32 size;                                         // _00
	s32 toResAnmScnData;                              // _04
	s32 name;                                         // _08
	u32 id;                                           // _0C
	u32 refNumber;                                    // _10
	s32 ambLightName;                                 // _14
	u16 ambLightId;                                   // _18
	u8 numLight;                                      // _1A
	u8 PADDING_0x1B[0x1C - 0x1B];                     // _1B
	s32 lightNames[G3DState::NUM_LIGHT_IN_LIGHT_SET]; // _1C
	u16 lightId[G3DState::NUM_LIGHT_IN_LIGHT_SET];    // _3C
};

/**
 * @brief Wrapper for light set resources.
 *
 * @note Size: 0x4.
 */
class ResLightSet : public ResCommon<ResLightSetData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResLightSet);

	bool Bind(const ResAnmScn scene);

	bool HasAmbLight() const { return ref().ambLightName != 0; }

	ResName GetAmbLightResName() const
	{
		const ResLightSetData& r = ref();

		if (r.ambLightName != 0) {
			return NW4R_G3D_OFS_TO_RESNAME(&r, r.ambLightName);
		}

		return ResName(nullptr);
	}

	u32 GetAmbLightID() const { return ref().ambLightId; }

	u32 GetNumLight() const { return ref().numLight; }

	bool IsAmbLightBound() const { return !HasAmbLight() || GetAmbLightID() != ResLightSetData::INVALID_ID; }

	ResName GetLightResName(u32 idx) const
	{
		const ResLightSetData& r = ref();

		const s32* pNames = r.lightNames;
		return NW4R_G3D_OFS_TO_RESNAME(pNames, pNames[idx]);
	}

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
