#ifndef NW4R_G3D_RES_RESANMCHR_H
#define NW4R_G3D_RES_RESANMCHR_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanm.h>
#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_resdict.h>
#include <nw4r/g3d/res/g3d_resmdl.h>

#include <nw4r/math.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
////////////// CHARACTER ANIM RESULT INFO //////////////
////////////////////////////////////////////////////////

/**
 * @brief Class for passing character animation results to other objects.
 *
 * @note Size: 0x4.
 */
struct ChrAnmResult {

	/**
	 * @brief Character animation result flags.
	 */
	enum Flag {
		FLAG_ANM_EXISTS     = (1 << 0),
		FLAG_MTX_IDENT      = (1 << 1),
		FLAG_ROT_TRANS_ZERO = (1 << 2),
		FLAG_SCALE_ONE      = (1 << 3),
		FLAG_SCALE_UNIFORM  = (1 << 4),
		FLAG_ROT_ZERO       = (1 << 5),
		FLAG_TRANS_ZERO     = (1 << 6),
		FLAG_PATCH_SCALE    = (1 << 7),
		FLAG_PATCH_ROT      = (1 << 8),
		FLAG_PATCH_TRANS    = (1 << 9),

		// Maya Scale Compensation
		FLAG_SSC_APPLY  = (1 << 10),
		FLAG_SSC_PARENT = (1 << 11),

		// Softimage Hierarchical Scaling
		FLAG_XSI_SCALING = (1 << 12),

		FLAG_ROT_RAW_FMT = (1 << 31)
	};

	void GetScale(math::VEC3* pScale) const;
	bool GetRotateDeg(math::VEC3* pRotate) const;
	void GetTranslate(math::VEC3* pTrans) const;
	void GetRotTrans(math::MTX34* pRotTrans) const;

	void SetScale(const math::VEC3* pScale);
	void SetRotTrans(const math::MTX34* pRotTrans);

	u32 flags;       // _00
	math::VEC3 s;    // _04
	math::VEC3 rawR; // _10
	math::MTX34 rt;  // _1C
};

////////////////////////////////////////////////////////
//////////////// FRAME VALUE (FVS) DATA ////////////////
////////////////////////////////////////////////////////

/**
 * @brief Frame data unit (32-bit size).
 *
 * @note Size: 0x4.
 */
struct ResAnmChrFrm32Data {
	union {
		u32 fvsU32; // _00

		struct {
			u8 frame; // _00
			u8 vs[3]; // _01
		} fvs;
	};
};

/**
 * @brief Frame-value data (32-bit size).
 *
 * @note Size: 0xC.
 */
struct ResAnmChrFVS32Data {
	f32 scale;                         // _00
	f32 offset;                        // _04
	ResAnmChrFrm32Data frameValues[1]; // _08
};

/**
 * @brief Frame data unit (48-bit size).
 *
 * @note Size: 0x6.
 */
struct ResAnmChrFrm48Data {
	s16 frame; // _00
	u16 value; // _02
	s16 slope; // _04
};

/**
 * @brief Frame-value data (48-bit size).
 *
 * @note Size: 0xE.
 */
struct ResAnmChrFVS48Data {
	f32 scale;                         // _00
	f32 offset;                        // _04
	ResAnmChrFrm48Data frameValues[1]; // _08
};

/**
 * @brief Frame data unit (96-bit size).
 *
 * @note Size: 0xC.
 */
struct ResAnmChrFrm96Data {
	f32 frame; // _00
	f32 value; // _04
	f32 slope; // _08
};

/**
 * @brief Frame-value data (96-bit size).
 *
 * @note Size: 0xC.
 */
struct ResAnmChrFVS96Data {
	ResAnmChrFrm96Data frameValues[1]; // _00
};

/**
 * @brief Collection of frame-value data of some flexible size (32, 48 or 96 bits each).
 *
 * @note Size: 0x14.
 */
struct ResAnmChrFVSData {
	u16 numFrameValues;   // _00
	f32 invKeyFrameRange; // _04

	union {
		ResAnmChrFVS32Data fvs32; // _08
		ResAnmChrFVS48Data fvs48; // _08
		ResAnmChrFVS96Data fvs96; // _08
	};
};

////////////////////////////////////////////////////////
///////////////// CONST VALUE (CV) DATA ////////////////
////////////////////////////////////////////////////////

/**
 * @brief Const value data (8-bit size).
 *
 * @note Size: 0x9.
 */
struct ResAnmChrCV8Data {
	f32 scale;    // _00
	f32 offset;   // _04
	u8 values[1]; // _08
};

/**
 * @brief Const value data (16-bit size).
 *
 * @note Size: 0xA.
 */
struct ResAnmChrCV16Data {
	f32 scale;     // _00
	f32 offset;    // _04
	u16 values[1]; // _08
};

/**
 * @brief Const value data (32-bit size).
 *
 * @note Size: 0x4.
 */
struct ResAnmChrCV32Data {
	f32 values[1]; // _00
};

/**
 * @brief Const value data of flexible size (8, 16 or 32 bits).
 *
 * @note Size: 0xA.
 */
struct ResAnmChrCVData {
	union {
		ResAnmChrCV8Data cv8;   // _00
		ResAnmChrCV16Data cv16; // _00
		ResAnmChrCV32Data cv32; // _00
	};
};

////////////////////////////////////////////////////////
///////////////// CHARACTER ANIMATIONS /////////////////
////////////////////////////////////////////////////////

/**
 * @brief Flexible data object for either const value or frame-value data.
 *
 * @note Size: 0x14.
 */
struct ResAnmChrAnmData {
	union {
		ResAnmChrFVSData fvs; // _00
		ResAnmChrCVData cv;   // _00
	};
};

/**
 * @brief Node (bone) data within an overall character animation.
 *
 * @note Size: 0x14.
 */
struct ResAnmChrNodeData {

	/**
	 * @brief Control flags for transforms/operations.
	 */
	enum Flag {
		FLAG_ANM_EXISTS     = (1 << 0),
		FLAG_MTX_IDENT      = (1 << 1),
		FLAG_ROT_TRANS_ZERO = (1 << 2),
		FLAG_SCALE_ONE      = (1 << 3),
		FLAG_SCALE_UNIFORM  = (1 << 4),
		FLAG_ROT_ZERO       = (1 << 5),
		FLAG_TRANS_ZERO     = (1 << 6),
		FLAG_PATCH_SCALE    = (1 << 7),
		FLAG_PATCH_ROT      = (1 << 8),
		FLAG_PATCH_TRANS    = (1 << 9),

		// Maya Scale Compensation
		FLAG_SSC_APPLY  = (1 << 10),
		FLAG_SSC_PARENT = (1 << 11),

		// Softimage Hierarchical Scaling
		FLAG_XSI_SCALING = (1 << 12),

		FLAG_SCALE_X_CONST = (1 << 13),
		FLAG_SCALE_Y_CONST = (1 << 14),
		FLAG_SCALE_Z_CONST = (1 << 15),

		FLAG_ROT_X_CONST = (1 << 16),
		FLAG_ROT_Y_CONST = (1 << 17),
		FLAG_ROT_Z_CONST = (1 << 18),

		FLAG_TRANS_X_CONST = (1 << 19),
		FLAG_TRANS_Y_CONST = (1 << 20),
		FLAG_TRANS_Z_CONST = (1 << 21),

		FLAG_HAS_SCALE = (1 << 22),
		FLAG_HAS_ROT   = (1 << 23),
		FLAG_HAS_TRANS = (1 << 24),

		FLAG_SCALE_FVS32_FMT = (1 << 25),
		FLAG_SCALE_FVS48_FMT = (1 << 26),
		FLAG_SCALE_FVS96_FMT = FLAG_SCALE_FVS32_FMT | FLAG_SCALE_FVS48_FMT,

		FLAG_ROT_FVS32_FMT = (1 << 27),
		FLAG_ROT_FVS48_FMT = (1 << 28),
		FLAG_ROT_FVS96_FMT = FLAG_ROT_FVS32_FMT | FLAG_ROT_FVS48_FMT,

		FLAG_ROT_CV8_FMT  = (1 << 29),
		FLAG_ROT_CV16_FMT = (1 << 27) | (1 << 29),
		FLAG_ROT_CV32_FMT = (1 << 28) | (1 << 29),

		FLAG_TRANS_FVS32_FMT = (1 << 30),
		FLAG_TRANS_FVS48_FMT = (1 << 31),
		FLAG_TRANS_FVS96_FMT = FLAG_TRANS_FVS32_FMT | FLAG_TRANS_FVS48_FMT,

		FLAG_HAS_SRT_MASK = FLAG_HAS_SCALE | FLAG_HAS_ROT | FLAG_HAS_TRANS,

		FLAG_SCALE_FMT_MASK = FLAG_SCALE_FVS32_FMT | FLAG_SCALE_FVS48_FMT | FLAG_SCALE_FVS96_FMT,

		FLAG_ROT_FMT_MASK
		= FLAG_ROT_FVS32_FMT | FLAG_ROT_FVS48_FMT | FLAG_ROT_FVS96_FMT | FLAG_ROT_CV8_FMT | FLAG_ROT_CV16_FMT | FLAG_ROT_CV32_FMT,

		FLAG_TRANS_FMT_MASK = FLAG_TRANS_FVS32_FMT | FLAG_TRANS_FVS48_FMT | FLAG_TRANS_FVS96_FMT
	};

	/**
	 * @brief Flexible data struct (to either expanded flexible struct, or single float value).
	 *
	 * @note Size: 0x4.
	 */
	union AnmData {
		s32 toResAnmChrAnmData; // _00
		f32 constValue;         // _00
	};

	s32 name;        // _00
	u32 flags;       // _04
	AnmData anms[1]; // _08
};

/**
 * @brief Character animation info object.
 *
 * @note Size: 0xC.
 */
struct ResAnmChrInfoData {
	u16 numFrame;            // _00
	u16 numNode;             // _02
	AnmPolicy policy;        // _04
	ScalingRule scalingRule; // _08
};

/**
 * @brief Base data structure for character animation info.
 *
 * @note Size: 0x28.
 */
struct ResAnmChrData {
	ResBlockHeaderData header; // _00
	u32 revision;              // _08
	s32 toResFileData;         // _0C
	s32 toChrDataDic;          // _10
	s32 toResUserData;         // _14
	s32 name;                  // _18
	s32 original_path;         // _1C
	ResAnmChrInfoData info;    // _20
};

/**
 * @brief Wrapper class for importing/handling character animation resources.
 *
 * @note Size: 0x4.
 */
class ResAnmChr : public ResCommon<ResAnmChrData> {
public:
	static const u32 SIGNATURE = FOURCC('C', 'H', 'R', '0');
	static const int REVISION  = 5;

public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResAnmChr);

	u32 GetRevision() const { return ref().revision; }

	bool CheckRevision() const { return GetRevision() == REVISION; }

	void GetAnmResult(ChrAnmResult* pResult, u32 idx, f32 frame) const;

	const ResAnmChrNodeData* GetNodeAnm(int idx) const
	{
		return static_cast<ResAnmChrNodeData*>(ofs_to_obj<ResDic>(ref().toChrDataDic)[idx]);
	}
	const ResAnmChrNodeData* GetNodeAnm(u32 idx) const
	{
		return static_cast<ResAnmChrNodeData*>(ofs_to_obj<ResDic>(ref().toChrDataDic)[idx]);
	}

	s32 GetNodeAnmIndex(const ResName name) const { return ofs_to_obj<ResDic>(ref().toChrDataDic).GetIndex(name); }

	int GetNumFrame() const { return ref().info.numFrame; }

	int GetNumNode() const { return ref().info.numNode; }

	AnmPolicy GetAnmPolicy() const { return ref().info.policy; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
