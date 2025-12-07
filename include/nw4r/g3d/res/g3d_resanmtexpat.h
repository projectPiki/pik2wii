#ifndef NW4R_G3D_RES_RESANMTEXPAT_H
#define NW4R_G3D_RES_RESANMTEXPAT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_resdict.h>
#include <nw4r/g3d/res/g3d_resfile.h>
#include <nw4r/g3d/res/g3d_respltt.h>
#include <nw4r/g3d/res/g3d_restex.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
///////////// TEXTURE PATTERN ANIM RESULTS /////////////
////////////////////////////////////////////////////////

/**
 * @brief Object for passing results of texture pattern animations.
 *
 * @note Size: 0x44.
 */
struct TexPatAnmResult {
	static const int NUM_OF_ANMS = 8;

	u8 bTexExist;              // _00
	u8 bPlttExist;             // _01
	u8 PADDING_0x2[0x4 - 0x2]; // _02
	ResTex tex[NUM_OF_ANMS];   // _04
	ResPltt pltt[NUM_OF_ANMS]; // _24
};

////////////////////////////////////////////////////////
//////////// TEXTURE PATTERN ANIM RESOURCES ////////////
////////////////////////////////////////////////////////

/**
 * @brief Frame data linking textures and palettes.
 *
 * @note Size: 0x8.
 */
struct ResAnmTexPatFrmData {
	f32 frame;     // _00
	u16 texIndex;  // _04
	u16 plttIndex; // _06
};

/**
 * @brief Data for all frames of a given texture pattern animation.
 *
 * @note Size: 0x10.
 */
struct ResAnmTexPatAnmData {
	u16 numFrameValues;                 // _00
	u8 PADDING_0x2[0x4 - 0x2];          // _02
	f32 invKeyFrameRange;               // _04
	ResAnmTexPatFrmData frameValues[1]; // _08
};

/**
 * @brief All animation data for a given texture pattern.
 *
 * @note Size: 0xC.
 */
struct ResAnmTexPatMatData {

	/**
	 * @brief Flags for controlling what components to use.
	 */
	enum Flag {
		FLAG_ANM_EXISTS = (1 << 0),
		FLAG_ANM_CONST  = (1 << 1),
		FLAG_ANM_TEX    = (1 << 2),
		FLAG_ANM_PLTT   = (1 << 3),

		// Four bits in 'flags' for each animation
		NUM_OF_FLAGS = 4
	};

	/**
	 * @brief Flexible object for either frame-value or const value data.
	 *
	 * @note Size: 0x4.
	 */
	union AnmData {
		s32 toResAnmTexPatAnmData; // _00

		struct {
			u16 texIndex;  // _00
			u16 plttIndex; // _02
		} constValue;
	};

	s32 name;        // _00
	u32 flags;       // _04
	AnmData anms[1]; // _08
};

/**
 * @brief Context info for texture pattern animation resources.
 *
 * @note Size: 0xC.
 */
struct ResAnmTexPatInfoData {
	u16 numFrame;     // _00
	u16 numMaterial;  // _02
	u16 numTexture;   // _04
	u16 numPalette;   // _06
	AnmPolicy policy; // _08
};

/**
 * @brief Underlying data structure for texture pattern animation resources.
 *
 * @note Size: 0x3C.
 */
struct ResAnmTexPatData {
	ResBlockHeaderData header; // _00
	u32 revision;              // _08
	s32 toResFileData;         // _0C
	s32 toTexPatDataDic;       // _10
	s32 toTexNameArray;        // _14
	s32 toPlttNameArray;       // _18
	s32 toResTexArray;         // _1C
	s32 toResPlttArray;        // _20
	s32 toResUserData;         // _24
	s32 name;                  // _28
	s32 original_path;         // _2C
	ResAnmTexPatInfoData info; // _30
};

/**
 * @brief Wrapper for texture pattern animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmTexPat : public ResCommon<ResAnmTexPatData> {
public:
	static const u32 SIGNATURE = FOURCC('P', 'A', 'T', '0');
	static const int REVISION  = 4;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmTexPat);

	bool Bind(const ResFile file);
	void Release();

	ResFile GetParent() const;

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	void GetAnmResult(TexPatAnmResult* pResult, u32 idx, f32 frame) const;

	const ResAnmTexPatMatData* GetMatAnm(int idx) const
	{
		return static_cast<ResAnmTexPatMatData*>(ofs_to_obj<ResDic>(ref().toTexPatDataDic)[idx]);
	}
	const ResAnmTexPatMatData* GetMatAnm(u32 idx) const
	{
		return static_cast<ResAnmTexPatMatData*>(ofs_to_obj<ResDic>(ref().toTexPatDataDic)[idx]);
	}

	int GetNumFrame() const { return ref().info.numFrame; }

	int GetNumMaterial() const { return ref().info.numMaterial; }

	AnmPolicy GetAnmPolicy() const { return ref().info.policy; }
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
