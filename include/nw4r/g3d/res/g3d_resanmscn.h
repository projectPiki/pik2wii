#ifndef NW4R_G3D_RES_RESANMSCN_H
#define NW4R_G3D_RES_RESANMSCN_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_resanmamblight.h>
#include <nw4r/g3d/res/g3d_resanmcamera.h>
#include <nw4r/g3d/res/g3d_resanmfog.h>
#include <nw4r/g3d/res/g3d_resanmlight.h>
#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_reslightset.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
////////////// ANIMATION SCENE RESOURCES ///////////////
////////////////////////////////////////////////////////

/**
 * @brief Context info for animation scene resources.
 *
 * @note Size: 0x14.
 */
struct ResAnmScnInfoData {
	u16 numFrame;                 // _00
	u16 numSpecularLight;         // _02
	AnmPolicy policy;             // _04
	u16 numResLightSetData;       // _08
	u16 numResAnmAmbLightData;    // _0A
	u16 numResAnmLightData;       // _0C
	u16 numResAnmFogData;         // _0E
	u16 numResAnmCameraData;      // _10
	u8 PADDING_0x12[0x14 - 0x12]; // _12
};

/**
 * @brief Underlying data structure for scene animation resources.
 *
 * @note Size: 0x44.
 */
struct ResAnmScnData {
	ResBlockHeaderData header;     // _00
	u32 revision;                  // _08
	s32 toResFileData;             // _0C
	s32 toScnTopLevelDic;          // _10
	s32 toResLightSetDataArray;    // _14
	s32 toResAnmAmbLightDataArray; // _18
	s32 toResAnmLightDataArray;    // _1C
	s32 toResAnmFogDataArray;      // _20
	s32 toResAnmCameraDataArray;   // _24
	s32 name;                      // _28
	s32 original_path;             // _2C
	ResAnmScnInfoData info;        // _30
};

/**
 * @brief Wrapper for scene animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmScn : public ResCommon<ResAnmScnData> {
public:
	static const u32 SIGNATURE = FOURCC('S', 'C', 'N', '0');
	static const int REVISION  = 4;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmScn);

	bool Bind(const ResAnmScn scene);

	bool Bind() { return Bind(*this); }

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	bool HasResAnmAmbLight() const;
	bool HasResAnmLight() const;

	ResLightSet GetResLightSet(int idx) const;
	ResLightSet GetResLightSet(u32 idx) const;
	u32 GetResLightSetNumEntries() const;

	ResAnmAmbLight GetResAnmAmbLight(const ResName name) const;
	ResAnmAmbLight GetResAnmAmbLight(int idx) const;
	ResAnmAmbLight GetResAnmAmbLight(u32 idx) const;

	ResAnmLight GetResAnmLight(const ResName name) const;
	ResAnmLight GetResAnmLight(int idx) const;
	ResAnmLight GetResAnmLight(u32 idx) const;

	ResLightSet GetResLightSetByRefNumber(u32 refNumber) const;
	ResAnmAmbLight GetResAnmAmbLightByRefNumber(u32 refNumber) const;
	ResAnmLight GetResAnmLightByRefNumber(u32 refNumber) const;
	ResAnmFog GetResAnmFogByRefNumber(u32 refNumber) const;
	ResAnmCamera GetResAnmCameraByRefNumber(u32 refNumber) const;

	u16 GetResAnmFogMaxRefNumber() const { return ref().info.numResAnmFogData; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
