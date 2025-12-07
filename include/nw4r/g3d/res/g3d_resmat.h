#ifndef NW4R_G3D_RES_RESMAT_H
#define NW4R_G3D_RES_RESMAT_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_resanmtexsrt.h>
#include <nw4r/g3d/res/g3d_rescommon.h>
#include <nw4r/g3d/res/g3d_respltt.h>
#include <nw4r/g3d/res/g3d_restev.h>
#include <nw4r/g3d/res/g3d_restex.h>

#include <nw4r/math.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

// Forward declarations
class ResFile;
class ResMdl;

////////////////////////////////////////////////////////
/////////////// GENERATOR MODE RESOURCES ///////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for material render mode setting resources.
 *
 * @note Size: 0x8.
 */
struct ResGenModeData {
	u8 nTexGens;         // _00
	u8 nChans;           // _01
	u8 nTevs;            // _02
	u8 nInds;            // _03
	GXCullMode cullMode; // _04
};

/**
 * @brief Wrapper for basic render mode setting resources.
 *
 * @note Size: 0x4.
 */
class ResGenMode : public ResCommon<ResGenModeData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResGenMode);

	ResGenMode CopyTo(void* pDst) const;

	void GXSetNumTexGens(u8 num);
	void GXSetNumChans(u8 num);
	void GXSetNumTevStages(u8 num);
	void GXSetNumIndStages(u8 num);
	void GXSetCullMode(GXCullMode mode);

	u8 GXGetNumTexGens() const { return IsValid() ? ptr()->nTexGens : 0; }

	u8 GXGetNumChans() const { return IsValid() ? ptr()->nChans : 0; }

	u8 GXGetNumTevStages() const { return IsValid() ? ptr()->nTevs : 0; }

	u8 GXGetNumIndStages() const { return IsValid() ? ptr()->nInds : 0; }

	GXCullMode GXGetCullMode() const { return IsValid() ? ptr()->cullMode : GX_CULL_ALL; }

	void EndEdit() { }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
//////////////// MISC MATERIAL RESOURCES ///////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for miscellaneous/advanced rendering property resources.
 *
 * @note Size: 0xC.
 */
struct ResMatMiscData {

	/**
	 * @brief Indirect rendering method types.
	 */
	enum IndirectMethod {
		WARP,
		NORMAL_MAP,
		NORMAL_MAP_SPECULAR,
		FUR,

		_RESERVED0,
		_RESERVED1,

		USER0,
		USER1,

		NUM_OF_INDIRECT_METHOD,
	};

	GXBool zCompLoc;                       // _00
	s8 light_set_idx;                      // _01
	s8 fog_idx;                            // _02
	u8 PADDING_0x3;                        // _03
	u8 indirect_method[GX_ITM_2 + 1];      // _04
	s8 normal_map_ref_light[GX_ITM_2 + 1]; // _08
};

/**
 * @brief Wrapper for misc/advanced rendering property resources.
 *
 * @note Size: 0x4.
 */
class ResMatMisc : public ResCommon<ResMatMiscData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResMatMisc);

	ResMatMisc CopyTo(void* pDst) const;

	GXBool GXGetZCompLoc() const;
	int GetLightSetIdx() const;
	int GetFogIdx() const;

	void GetIndirectTexMtxCalcMethod(GXIndTexMtxID id, ResMatMiscData::IndirectMethod* pMethod, s8* pLightRef);

	void EndEdit() { }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
//////// TEXTURE COORDINATE GENERATION RESOURCES ///////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for resources of display lists for texture coordinate generation.
 *
 * @note Size: 0xA0.
 */
struct ResTexCoordGenDL {
	union {

		/// Display list data format
		struct {
			u8 texCoordGen[GX_MAX_TEXCOORD][GX_XF_CMD_SZ * 2]; // _00
			u8 PADDING_0x90[0xA0 - 0x90];                      // _90
		} dl;

		u8 data[0xA0];
	};
};

/**
 * @brief Wrapper for texture coordinate generation resources.
 *
 * @note Size: 0x4.
 */
class ResMatTexCoordGen : public ResCommon<ResTexCoordGenDL> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF_EX(ResMatTexCoordGen, ResTexCoordGenDL);

	void DCStore(bool sync);
	ResMatTexCoordGen CopyTo(void* pDst) const;

	void CallDisplayList(u8 numGens, bool sync) const;

	bool GXGetTexCoordGen2(GXTexCoordID id, GXTexGenType* pFunc, GXTexGenSrc* pParam, GXBool* pNormalize, u32* pPostMtx) const;
	void GXSetTexCoordGen2(GXTexCoordID id, GXTexGenType func, GXTexGenSrc param, GXBool normalize, u32 postMtx);

	void EndEdit() { DCStore(false); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
/////////////// TEXTURE OBJECT RESOURCES ///////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for texture object resources.
 *
 * @note Size: 0x104.
 */
struct ResTexObjData {
	u32 flagUsedTexMapID;           // _00
	GXTexObj texObj[GX_MAX_TEXMAP]; // _04
};

/**
 * @brief Wrapper for texture object resources.
 *
 * @note Size: 0x4.
 */
class ResTexObj : public ResCommon<ResTexObjData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResTexObj);

	ResTexObj CopyTo(void* pDst) const;

	const GXTexObj* GetTexObj(GXTexMapID id) const;
	GXTexObj* GetTexObj(GXTexMapID id);

	bool IsValidTexObj(GXTexMapID id) const;

	void Validate(GXTexMapID id);
	void Invalidate(GXTexMapID id);

	void EndEdit() { }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
//////// TEXTURE LOOKUP TABLE OBJECT RESOURCES /////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for texture lookup table resources.
 *
 * @note Size: 0x64.
 */
struct ResTlutObjData {
	u32 flagUsedTlutID;                     // _00
	GXTlutObj tlutObj[GX_TLUT8 - GX_TLUT0]; // _04
};

/**
 * @brief Wrapper for texture lookup table resources.
 *
 * @note Size: 0x4.
 */
class ResTlutObj : public ResCommon<ResTlutObjData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResTlutObj);

	ResTlutObj CopyTo(void* pDst) const;

	const GXTlutObj* GetTlut(GXTlut tlut) const;
	GXTlutObj* GetTlut(GXTlut tlut);

	bool IsValidTlut(GXTlut tlut) const;

	void Validate(GXTlut tlut);
	void Invalidate(GXTlut tlut);

	void EndEdit() { }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
/////////////// TEXTURE MATRIX RESOURCES ///////////////
////////////////////////////////////////////////////////

/**
 * @brief Data object for texture matrix effects.
 *
 * @note Size: 0x34.
 */
struct TexMtxEffect : public TexSrtTypedef {

	/**
	 * @brief Flags for the effect.
	 */
	enum Flag {
		FLAG_IDENT = (1 << 0),
	};

	s8 ref_camera;          // _00
	s8 ref_light;           // _01
	u8 map_mode;            // _02
	u8 misc_flag;           // _03
	math::_MTX34 effectMtx; // _04
};

/**
 * @brief Underlying data structure for texture matrix data.
 *
 * @note Size: 0x248.
 */
struct ResTexSrtData : public TexSrtTypedef {
	static const int NUM_OF_TEXTURE = 8;

	u32 flag;                            // _00
	TexMatrixMode texMtxMode;            // _04
	TexSrt texSrt[NUM_OF_TEXTURE];       // _08
	TexMtxEffect effect[NUM_OF_TEXTURE]; // _A8
};

/**
 * @brief Wrapper for texture matrix resources.
 *
 * @note Size: 0x4.
 */
class ResTexSrt : public ResCommon<ResTexSrtData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResTexSrt);

	ResTexSrt CopyTo(void* pDst) const;

	bool GetEffectMtx(u32 id, math::MTX34* pMtx) const;
	bool SetEffectMtx(u32 id, const math::MTX34* pMtx);

	bool GetMapMode(u32 id, u32* pMode, int* pCamRef, int* pLightRef) const;
	bool SetMapMode(u32 id, u32 mode, int camRef, int lightRef);

	TexSrt::Flag GetTexSrtFlag(u32 id) const
	{
		return static_cast<TexSrt::Flag>(
		    (ref().flag >> id * TexSrt::NUM_OF_FLAGS)
		    & (TexSrt::FLAG_ANM_EXISTS | TexSrt::FLAG_SCALE_ONE | TexSrt::FLAG_ROT_ZERO | TexSrt::FLAG_TRANS_ZERO));
	}

	bool IsExist(u32 id) const
	{
		if (IsValid()) {
			return ptr()->flag & (1 << id * TexSrt::NUM_OF_FLAGS);
		} else {
			return false;
		}
	}

	bool IsIdentity(u32 id) const
	{
		return (((ref().flag >> id * TexSrt::NUM_OF_FLAGS) & TexSrt::FLAGSET_IDENTITY) == TexSrt::FLAGSET_IDENTITY)
		    && (ref().effect[id].misc_flag & TexMtxEffect::FLAG_IDENT);
	}

	TexSrtTypedef::TexMatrixMode GetTexMtxMode() const { return ref().texMtxMode; }

	void EndEdit() { }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
//////////////// COLOR CHANNEL RESOURCES ///////////////
////////////////////////////////////////////////////////

/**
 * @brief Data object for controlling texture colors through each GX color channel.
 *
 * @note Size: 0x14.
 */
struct Chan {

	/**
	 * @brief Flags for enabling each color type in the channel.
	 */
	enum Flag {
		FLAG_MAT_COLOR_ENABLE = (1 << 0),
		FLAG_MAT_ALPHA_ENABLE = (1 << 1),

		FLAG_AMB_COLOR_ENABLE = (1 << 2),
		FLAG_AMB_ALPHA_ENABLE = (1 << 3),

		FLAG_CTRL_COLOR_ENABLE = (1 << 4),
		FLAG_CTRL_ALPHA_ENABLE = (1 << 5),
	};

	u32 flag;           // _00
	GXColor matColor;   // _04
	GXColor ambColor;   // _08
	u32 paramChanCtrlC; // _0C
	u32 paramChanCtrlA; // _10
};

/**
 * @brief Underlying data structure for color channel resources (for the two GX color channels).
 *
 * @note Size: 0x28.
 */
struct ResChanData {
	Chan chan[2]; // _00
};

/**
 * @brief Wrapper for color channel resources.
 *
 * @note Size: 0x4.
 */
class ResMatChan : public ResCommon<ResChanData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF_EX(ResMatChan, ResChanData);

	ResMatChan CopyTo(void* pDst) const;

	bool GXGetChanMatColor(GXChannelID id, GXColor* pColor) const;
	void GXSetChanMatColor(GXChannelID id, GXColor color);

	bool GXGetChanAmbColor(GXChannelID id, GXColor* pColor) const;
	void GXSetChanAmbColor(GXChannelID id, GXColor color);

	bool GXGetChanCtrl(GXChannelID id, GXBool* pEnable, GXColorSrc* pAmbSrc, GXColorSrc* pMatSrc, GXLightID* pLightMask,
	                   GXDiffuseFn* pDiffuseFn, GXAttnFn* pAttnFn) const;
	void GXSetChanCtrl(GXChannelID id, GXBool enable, GXColorSrc ambSrc, GXColorSrc matSrc, GXLightID lightMask, GXDiffuseFn diffuseFn,
	                   GXAttnFn attnFn);

	void EndEdit() { }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
///////////////// PIXEL-LEVEL RESOURCES ////////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for pixel-level operation resources.
 *
 * @note Size: 0x20.
 */
struct ResPixDL {
	union {

		/// Display list structure for pixel operations.
		struct {
			u8 alphaCompare[GX_BP_CMD_SZ];  // _00
			u8 zMode[GX_BP_CMD_SZ];         // _05
			u8 blendMode[GX_BP_CMD_SZ * 2]; // _0A
			u8 setDstAlpha[GX_BP_CMD_SZ];   // _14
			u8 PADDING_0x19[0x20 - 0x19];   // _19
		} dl;

		u8 data[0x20]; // _00
	};
};

/**
 * @brief Wrapper for pixel-level operation resources.
 *
 * @note Size: 0x4.
 */
class ResMatPix : public ResCommon<ResPixDL> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF_EX(ResMatPix, ResPixDL);

	void DCStore(bool sync);
	ResMatPix CopyTo(void* pDst) const;

	void CallDisplayList(bool sync) const;

	bool GXGetAlphaCompare(GXCompare* pComp0, u8* pRef0, GXAlphaOp* pLogic, GXCompare* pComp1, u8* pRef1) const;
	void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp logic, GXCompare comp1, u8 ref1);

	bool GXGetZMode(GXBool* pTest, GXCompare* pCompare, GXBool* pUpdate) const;
	void GXSetZMode(GXBool test, GXCompare compare, GXBool update);

	bool GXGetBlendMode(GXBlendMode* pMode, GXBlendFactor* pSrcFactor, GXBlendFactor* pDstFactor, GXLogicOp* pLogic) const;
	void GXSetBlendMode(GXBlendMode mode, GXBlendFactor srcFactor, GXBlendFactor dstFactor, GXLogicOp logic);

	bool GXGetDstAlpha(GXBool* pEnable, u8* pAlpha) const;
	void GXSetDstAlpha(GXBool enable, u8 alpha);

	void EndEdit() { DCStore(false); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
///////// TEXTURE ENVIRONMENT COLOR RESOURCES //////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for texture environment (TEV) color resources.
 *
 * @note Size: 0x80.
 */
struct ResTevColorDL {
	union {

		/// Display list structure for tev colors.
		struct {
			u8 tevColor[GX_MAX_TEVREG - GX_TEVREG0][GX_BP_CMD_SZ * 4]; // _00
			u8 PADDING_0x3C[0x40 - 0x3C];                              // _3C
			u8 tevKColor[GX_MAX_KCOLOR][GX_BP_CMD_SZ * 2];             // _40
			u8 PADDING_0x68[0x80 - 0x68];                              // _68
		} dl;

		u8 data[0x80];
	};
};

/**
 * @brief Wrapper for texture environment (TEV) color resources.
 *
 * @note Size: 0x4.
 */
class ResMatTevColor : public ResCommon<ResTevColorDL> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF_EX(ResMatTevColor, ResTevColorDL);

	void DCStore(bool sync);
	ResMatTevColor CopyTo(void* pDst) const;

	void CallDisplayList(bool sync) const;

	bool GXGetTevColor(GXTevRegID id, GXColor* pColor) const;
	void GXSetTevColor(GXTevRegID id, GXColor color);

	bool GXGetTevColorS10(GXTevRegID id, GXColorS10* pColor) const;
	void GXSetTevColorS10(GXTevRegID id, GXColorS10 color);

	bool GXGetTevKColor(GXTevKColorID id, GXColor* pColor) const;
	void GXSetTevKColor(GXTevKColorID id, GXColor color);

	void EndEdit() { DCStore(false); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
/////////// INDIRECT TEXTURE MATRIX RESOURCES //////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for indirect texture matrix resources.
 *
 * @note Size: 0x40.
 */
struct ResIndMtxAndScaleDL {
	union {

		/// Display list structure for indirect texture matrices.
		struct {
			u8 indTexCoordScale[2][GX_BP_CMD_SZ]; // _00
			u8 indTexMtx0[GX_BP_CMD_SZ * 3];      // _0A
			u8 PADDING_0x19[0x20 - 0x19];         // _19
			u8 indTexMtx1[GX_BP_CMD_SZ * 3];      // _20
			u8 indTexMtx2[GX_BP_CMD_SZ * 3];      // _2F
			u8 PADDING_0x3E[0x40 - 0x3E];         // _3E
		} dl;

		u8 data[0x40]; // at 0x0
	};
};

/**
 * @brief Wrapper for indirect texture matrix resources.
 *
 * @note Size: 0x4.
 */
class ResMatIndMtxAndScale : public ResCommon<ResIndMtxAndScaleDL> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF_EX(ResMatIndMtxAndScale, ResIndMtxAndScaleDL);

	void DCStore(bool sync);
	ResMatIndMtxAndScale CopyTo(void* pDst) const;

	void CallDisplayList(u8 indNum, bool sync) const;

	bool GXGetIndTexMtx(GXIndTexMtxID id, math::MTX34* pMtx) const;
	void GXSetIndTexMtx(GXIndTexMtxID id, const math::MTX34& rMtx, s8 scaleExp);

	void EndEdit() { DCStore(false); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
/////////////// TEXTURE PALETTE RESOURCES //////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for texture palette resources.
 *
 * @note Size: 0x34.
 */
struct ResTexPlttInfoData {
	s32 nameTex;            // _00
	s32 namePltt;           // _04
	ResTexData* pTexData;   // _08
	ResPlttData* pPlttData; // _0C
	GXTexMapID mapID;       // _10
	GXTlut tlutID;          // _14
	GXTexWrapMode wrap_s;   // _18
	GXTexWrapMode wrap_t;   // _1C
	GXTexFilter min_filt;   // _20
	GXTexFilter mag_filt;   // _24
	f32 lod_bias;           // _28
	GXAnisotropy max_aniso; // _2C
	bool bias_clamp;        // _30
	bool do_edge_lod;       // _31
	u8 PADDING_0x32;        // _32
	u8 PADDING_0x33;        // _33
};

/**
 * @brief Wrapper for texture palette resources.
 *
 * @note Size: 0x4.
 */
class ResTexPlttInfo : public ResCommon<ResTexPlttInfoData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResTexPlttInfo);

	bool Bind(const ResFile file, ResTexObj texObj, ResTlutObj tlutObj);
	void Release(ResTexObj texObj, ResTlutObj tlutObj);

	ResName GetTexResName() const
	{
		const ResTexPlttInfoData& r = ref();

		if (r.nameTex != 0) {
			return NW4R_G3D_OFS_TO_RESNAME(&r, r.nameTex);
		}

		return ResName(nullptr);
	}

	ResName GetPlttResName() const
	{
		const ResTexPlttInfoData& r = ref();

		if (r.namePltt != 0) {
			return NW4R_G3D_OFS_TO_RESNAME(&r, r.namePltt);
		}

		return ResName(nullptr);
	}

	bool IsCIFmt() const { return ref().namePltt != 0; }

private:
	void BindTex_(const ResTex tex, ResTexObj texObj);
	void BindPltt_(const ResPltt pltt, ResTlutObj tlutObj);

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
////////////////// MATERIAL RESOURCES //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data structure of display list-based material resources.
 *
 * @note Size: 0x180.
 */
struct ResMatDLData {
	ResPixDL dlPix;                       // _00
	ResTevColorDL dlTevColor;             // _20
	ResIndMtxAndScaleDL dlIndMtxAndScale; // _A0
	ResTexCoordGenDL dlTexCoordGen;       // _E0
};

/**
 * @brief Underlying data structure for material resources.
 *
 * @note Size: 0x414.
 */
struct ResMatData {
	u32 size;                   // _00
	s32 toResMdlData;           // _04
	s32 name;                   // _08
	u32 id;                     // _0C
	u32 flag;                   // _10
	ResGenModeData genMode;     // _14
	ResMatMiscData misc;        // _1C
	s32 toResTevData;           // _28
	u32 numResTexPlttInfo;      // _2C
	s32 toResTexPlttInfo;       // _30
	s32 toResUserData;          // _34
	s32 toResMatDLData;         // _38
	ResTexObjData texObjData;   // _3C
	ResTlutObjData tlutObjData; // _140
	ResTexSrtData texSrtData;   // _1A4
	ResChanData chan;           // _3EC
};

/**
 * @brief Wrapper for material resources.
 *
 * @note Size: 0x4.
 */
class ResMat : public ResCommon<ResMatData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResMat);

	void Init();

	bool Bind(const ResFile file);
	void Release();

	ResMdl GetParent();

	u32 GetID() const { return ref().id; }

	ResGenMode GetResGenMode() { return ResGenMode(&ref().genMode); }

	ResMatMisc GetResMatMisc() { return ResMatMisc(&ref().misc); }

	ResTev GetResTev();
	ResTev GetResTev() const;

	u32 GetNumResTexPlttInfo() const { return ref().numResTexPlttInfo; }

	ResTexPlttInfo GetResTexPlttInfo(u32 id)
	{
		ResTexPlttInfoData* pData = ofs_to_ptr<ResTexPlttInfoData>(ref().toResTexPlttInfo);

		return ResTexPlttInfo(&pData[id]);
	}

	ResMatDLData* GetResMatDLData() { return ofs_to_ptr<ResMatDLData>(ref().toResMatDLData); }

	ResMatPix GetResMatPix() { return ResMatPix(&GetResMatDLData()->dlPix); }

	ResMatTevColor GetResMatTevColor() { return ResMatTevColor(&GetResMatDLData()->dlTevColor); }

	ResMatIndMtxAndScale GetResMatIndMtxAndScale() { return ResMatIndMtxAndScale(&GetResMatDLData()->dlIndMtxAndScale); }

	ResMatTexCoordGen GetResMatTexCoordGen() { return ResMatTexCoordGen(&GetResMatDLData()->dlTexCoordGen); }

	ResTlutObj GetResTlutObj() { return ResTlutObj(&ref().tlutObjData); }

	ResTexObj GetResTexObj() { return ResTexObj(&ref().texObjData); }

	ResTexSrt GetResTexSrt() { return ResTexSrt(&ref().texSrtData); }

	ResMatChan GetResMatChan() { return ResMatChan(&ref().chan); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
