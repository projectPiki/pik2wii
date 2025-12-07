#ifndef NW4R_G3D_FOG_H
#define NW4R_G3D_FOG_H
#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>

#include <nw4r/math.h>
#include <nw4r/ut.h>

#include <RevoSDK/GX.h>

////////////////////////////////////////////////////////
///////////////////// FOG RESOURCES ////////////////////
////////////////////////////////////////////////////////

namespace nw4r {
namespace g3d {

/**
 * @brief Underlying data structure for fog resources.
 *
 * @note Size: 0x30.
 */
struct FogData {
	GXFogType type;         // _00
	f32 startz;             // _04
	f32 endz;               // _08
	f32 nearz;              // _0C
	f32 farz;               // _10
	GXColor color;          // _14
	GXBool adjEnable;       // _18
	u8 PADDING_0x19;        // _19
	u16 adjCenter;          // _1A
	GXFogAdjTable adjTable; // _1C
};

/**
 * @brief Wrapper for fog resources.
 *
 * @note Size: 0x4.
 */
class Fog : public ResCommon<FogData> {
public:
	explicit Fog(FogData* pData);

	void Init();
	Fog CopyTo(void* pDst) const;

	void SetFogRangeAdjParam(u16 width, u16 center, const math::MTX44& rProjMtx);
	void SetGP() const;

	void SetFogType(GXFogType type)
	{
		if (!IsValid()) {
			return;
		}

		ref().type = type;
	}

	void SetZ(f32 startZ, f32 endZ)
	{
		if (!IsValid()) {
			return;
		}

		FogData& r = ref();

		r.startz = startZ;
		r.endz   = endZ;
	}

	void SetNearFar(f32 nearZ, f32 farZ)
	{
		if (!IsValid()) {
			return;
		}

		FogData& r = ref();

		r.nearz = nearZ;
		r.farz  = farZ;
	}

	void SetFogColor(GXColor color)
	{
		if (!IsValid()) {
			return;
		}

		ref().color = color;
	}

	bool IsFogRangeAdjEnable() const { return IsValid() && ref().adjEnable == TRUE; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
