#ifndef NW4R_G3D_RES_RESVTX_H
#define NW4R_G3D_RES_RESVTX_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>

#include <nw4r/math.h>

#include <RevoSDK/GX.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
//////////////////// VERTEX POSITION ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief Vertex position data object.
 *
 * @note Size: 0x38.
 */
struct ResVtxPosData {
	u32 size;          // _00
	s32 toResMdlData;  // _04
	s32 toVtxPosArray; // _08
	s32 name;          // _0C
	u32 id;            // _10
	GXCompCnt cmpcnt;  // _14
	GXCompType tp;     // _18
	u8 frac;           // _1C
	u8 stride;         // _1D
	u16 numPos;        // _1E
	math::_VEC3 min;   // _20
	math::_VEC3 max;   // _2C
};

/**
 * @brief Vertex position resource.
 *
 * @note Size: 0x4.
 */
class ResVtxPos : public ResCommon<ResVtxPosData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResVtxPos);

	void Init() { DCStore(false); }

	void SetArray();
	void GetArray(const void** ppBase, u8* pStride) const;

	void CopyTo(void* pDst) const;
	void DCStore(bool sync);

	u32 GetSize() const { return ref().size; }

	void* GetData() { return ofs_to_ptr<void>(ref().toVtxPosArray); }
	const void* GetData() const { return ofs_to_ptr<void>(ref().toVtxPosArray); }

	u32 GetID() const { return ref().id; }

	u16 GetNumVtxPos() const { return ref().numPos; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
///////////////////// VERTEX NORMAL ////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Vertex normal data object.
 *
 * @note Size: 0x20.
 */
struct ResVtxNrmData {
	u32 size;          // _00
	s32 toResMdlData;  // _04
	s32 toVtxNrmArray; // _08
	s32 name;          // _0C
	u32 id;            // _10
	GXCompCnt cmpcnt;  // _14
	GXCompType tp;     // _18
	u8 frac;           // _1C
	u8 stride;         // _1D
	u16 numNrm;        // _1E
};

/**
 * @brief Vertex normal resource.
 *
 * @note Size: 0x4.
 */
class ResVtxNrm : public ResCommon<ResVtxNrmData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResVtxNrm);

	void Init() { DCStore(false); }

	void SetArray();
	void GetArray(const void** ppBase, u8* pStride) const;

	void CopyTo(void* pDst) const;
	void DCStore(bool);

	u32 GetSize() const { return ref().size; }

	void* GetData() { return ofs_to_ptr<void>(ref().toVtxNrmArray); }
	const void* GetData() const { return ofs_to_ptr<void>(ref().toVtxNrmArray); }

	u32 GetID() const { return ref().id; }

	u16 GetNumVtxNrm() const { return ref().numNrm; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
///////////////////// VERTEX COLOR /////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Vertex color data object.
 *
 * @note Size: 0x20.
 */
struct ResVtxClrData {
	u32 size;          // _00
	s32 toResMdlData;  // _04
	s32 toVtxClrArray; // _08
	s32 name;          // _0C
	u32 id;            // _10
	GXCompCnt cmpcnt;  // _14
	GXCompType tp;     // _18
	u8 stride;         // _1C
	u8 PADDING_0x1D;   // _1D
	u16 numClr;        // _1E
};

/**
 * @brief Vertex color resource.
 *
 * @note Size: 0x4.
 */
class ResVtxClr : public ResCommon<ResVtxClrData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResVtxClr);

	void Init() { DCStore(false); }

	void SetArray(GXAttr attr);
	void GetArray(const void** ppBase, u8* pStride) const;

	void CopyTo(void* pDst) const;
	void DCStore(bool sync);

	u32 GetSize() const { return ref().size; }

	void* GetData() { return ofs_to_ptr<void>(ref().toVtxClrArray); }
	const void* GetData() const { return ofs_to_ptr<void>(ref().toVtxClrArray); }

	u32 GetID() const { return ref().id; }

	u16 GetNumVtxClr() const { return ref().numClr; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
//////////////// VERTEX TEX COORDINATE /////////////////
////////////////////////////////////////////////////////

/**
 * @brief Vertex texture coordinate data object.
 *
 * @note Size: 0x38.
 */
struct ResVtxTexCoordData {
	u32 size;            // _00
	s32 toResMdlData;    // _04
	s32 toTexCoordArray; // _08
	s32 name;            // _0C
	u32 id;              // _10
	GXCompCnt cmpcnt;    // _14
	GXCompType tp;       // _18
	u8 frac;             // _1C
	u8 stride;           // _1D
	u16 numTexCoord;     // _1E
	math::_VEC2 min;     // _20
	math::_VEC2 max;     // _2C
};

/**
 * @brief Vertex texture coordinate resource.
 *
 * @note Size: 0x4.
 */
class ResVtxTexCoord : public ResCommon<ResVtxTexCoordData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResVtxTexCoord);

	void Init() { DCStore(false); }

	void GetArray(const void** ppBase, u8* pStride) const;
	void DCStore(bool sync);

	u32 GetSize() const { return ref().size; }

	void* GetData() { return ofs_to_ptr<void>(ref().toTexCoordArray); }
	const void* GetData() const { return ofs_to_ptr<void>(ref().toTexCoordArray); }

	u32 GetID() const { return ref().id; }

	u16 GetNumTexCoord() const { return ref().numTexCoord; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
////////////////// VERTEX FUR POSITION /////////////////
////////////////////////////////////////////////////////

/**
 * @brief Vertex fur position data object.
 *
 * @note Size: 0x28.
 */
struct ResVtxFurPosData {
	u32 size;          // _00
	s32 toResMdlData;  // _04
	s32 toFurPosArray; // _08
	s32 name;          // _0C
	u32 id;            // _10
	GXCompCnt cmpcnt;  // _14
	GXCompType tp;     // _18
	u8 frac;           // _1C
	u8 stride;         // _1D
	u16 numFurPos;     // _1E
	u32 numLayer;      // _20
	u32 ofsLayer;      // _24
};

/**
 * @brief Vertex fur position resource.
 *
 * @note Size: 0x4.
 */
class ResVtxFurPos : public ResCommon<ResVtxFurPosData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResVtxFurPos);

	void Init() { DCStore(false); }

	void GetArray(const void** ppBase, u8* pStride) const;
	void SetArray(u16 idx);
	void DCStore(bool sync);

	u32 GetSize() const { return ref().size; }

	void* GetData(int idx)
	{
		ResVtxFurPosData& r = ref();

		// ternary was required -_- Probably means other GetData funcs are ternaries
		return (r.toFurPosArray != 0 && idx < (int)r.numLayer && idx >= 0)
		         ? reinterpret_cast<void*>(reinterpret_cast<u8*>(&r) + r.toFurPosArray + idx * r.ofsLayer)
		         : nullptr;
	}

	const void* GetData(int idx) const
	{
		const ResVtxFurPosData& r = ref();

		return (r.toFurPosArray != 0 && idx < (int)r.numLayer && idx >= 0)
		         ? reinterpret_cast<const void*>(reinterpret_cast<const u8*>(&r) + r.toFurPosArray + idx * r.ofsLayer)
		         : nullptr;

		return nullptr;
	}

	u32 GetID() const { return ref().id; }

	u16 GetNumFurPos() const { return ref().toFurPosArray; }
	u32 GetNumLayer() const { return ref().numLayer; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
////////////////// VERTEX FUR VECTOR ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief Vertex fur directon data object.
 *
 * @note Size: 0x16.
 */
struct ResVtxFurVecData {
	u32 size;          // _00
	s32 toResMdlData;  // _04
	s32 toFurVecArray; // _08
	s32 name;          // _0C
	u32 id;            // _10
	u16 numFurVec;     // _14
};

/**
 * @brief Vertex fur directon resource.
 *
 * @note Size: 0x4.
 */
class ResVtxFurVec : public ResCommon<ResVtxFurVecData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResVtxFurVec);

	void Init() { DCStore(false); }

	void GetArray(const void** ppBase, u8* pStride) const;
	void DCStore(bool sync);

	u32 GetSize() const { return ref().size; }

	void* GetData()
	{
		ResVtxFurVecData& r = ref();

		if (r.toFurVecArray != 0) {
			return reinterpret_cast<void*>(reinterpret_cast<u8*>(&r) + r.toFurVecArray);
		}

		return nullptr;
	}
	const void* GetData() const
	{
		const ResVtxFurVecData& r = ref();

		if (r.toFurVecArray != 0) {
			return reinterpret_cast<const void*>(reinterpret_cast<const u8*>(&r) + r.toFurVecArray);
		}

		return nullptr;
	}

	u32 GetID() const { return ref().id; }

	u16 GetNumFurVec() const { return ref().toFurVecArray; }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
