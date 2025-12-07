#ifndef NW4R_G3D_RES_RESCOMMON_H
#define NW4R_G3D_RES_RESCOMMON_H

#include <nw4r/types_nw4r.h>

#include <RevoSDK/GX.h>

////////////////////////////////////////////////////////
//////////////////// RESOURCE MACROS ///////////////////
////////////////////////////////////////////////////////

/**
 * Define ResName pascal string for file resource groups.
 */
#define NW4R_G3D_RESFILE_NAME_DEF(VAR, STR) nw4r::g3d::ResNameData27 ResNameData_##VAR ATTRIBUTE_ALIGN(32) = { sizeof(STR) - 1, STR }

/**
 * Similar to "ofs_to_obj" but accounting for the additional -4 offset.
 * Debug builds show this behavior was not achieved through a function.
 */
#define NW4R_G3D_OFS_TO_RESNAME(BASE, OFS) nw4r::g3d::ResName((char*)(BASE) + (OFS) - sizeof(u32))

/**
 * Define common functions for resource classes.
 * @note Hides ResCommon::ref, why did they do this???
 */
#define NW4R_G3D_RESOURCE_FUNC_DEF(T)              NW4R_G3D_RESOURCE_FUNC_DEF_IMPL(T, T##Data)
#define NW4R_G3D_RESOURCE_FUNC_DEF_EX(TCLS, TDATA) NW4R_G3D_RESOURCE_FUNC_DEF_IMPL(TCLS, TDATA)

#define NW4R_G3D_RESOURCE_FUNC_DEF_IMPL(TCLS, TDATA) \
	explicit TCLS(void* pData = nullptr)             \
	    : nw4r::g3d::ResCommon<TDATA>(pData)         \
	{                                                \
	}                                                \
                                                     \
	TDATA& ref()                                     \
	{                                                \
		return *ptr();                               \
	}                                                \
                                                     \
	const TDATA& ref() const                         \
	{                                                \
		return *ptr();                               \
	}                                                \
                                                     \
	bool operator==(const TCLS& rOther) const        \
	{                                                \
		return ptr() == rOther.ptr();                \
	}                                                \
                                                     \
	bool operator!=(const TCLS& rOther) const        \
	{                                                \
		return ptr() != rOther.ptr();                \
	}

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
/////////////////// RESOURCE WRAPPER ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief Class for handling data resources.
 *
 * @note Size: 0x4.
 */
template <typename T>
class ResCommon {
public:
	explicit ResCommon(void* pData)
	    : mpData(static_cast<T*>(pData))
	{
	}

	explicit ResCommon(const void* pData)
	    : mpData(static_cast<const T*>(pData))
	{
	}

	bool IsValid() const { return mpData != nullptr; }

	T* ptr() { return mpData; }
	const T* ptr() const { return mpData; }

	T& ref() { return *mpData; }
	const T& ref() const { return *mpData; }

	template <typename TTo>
	TTo* ofs_to_ptr_raw(s32 ofs)
	{
		return reinterpret_cast<TTo*>((char*)mpData + ofs);
	}
	template <typename TTo>
	const TTo* ofs_to_ptr_raw(s32 ofs) const
	{
		return reinterpret_cast<const TTo*>((char*)mpData + ofs);
	}

	template <typename TTo>
	TTo* ofs_to_ptr(s32 ofs)
	{
		u8* pPtr = reinterpret_cast<u8*>(mpData);

		if (ofs != 0) {
			return reinterpret_cast<TTo*>(pPtr + ofs);
		}

		return nullptr;
	}
	template <typename TTo>
	const TTo* ofs_to_ptr(s32 ofs) const
	{
		const u8* pPtr = reinterpret_cast<const u8*>(mpData);

		if (ofs != 0) {
			return reinterpret_cast<const TTo*>(pPtr + ofs);
		}

		return nullptr;
	}

	template <typename TTo>
	TTo ofs_to_obj(s32 ofs)
	{
		u8* pPtr = reinterpret_cast<u8*>(mpData);

		if (ofs != 0) {
			return TTo(pPtr + ofs);
		}

		return TTo(nullptr);
	}
	template <typename TTo>
	const TTo ofs_to_obj(s32 ofs) const
	{
		const u8* pPtr = reinterpret_cast<const u8*>(mpData);

		if (ofs != 0) {
			return TTo(const_cast<u8*>(pPtr + ofs));
		}

		return TTo(nullptr);
	}

private:
	T* mpData; // _00
};

/**
 * @brief Common header structure for resource data structures.
 *
 * @note Size: 0x8.
 */
struct ResBlockHeaderData {
	char kind[4]; // _00
	u32 size;     // _04
};

/**
 * @brief Name for file resource groups.
 *
 * @note Size: 0x20.
 */
struct ResNameData27 {
	u32 len;                    // _00
	char str[32 - sizeof(u32)]; // _04
};

////////////////////////////////////////////////////////
/////////////////// NAMED RESOURCES ////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Data object for resource name.
 *
 * @note Size: 0x8.
 */
struct ResNameData {
	u32 len;     // _00
	char str[4]; // _04
};

/**
 * @brief Resource name data wrapper.
 *
 * @note Size: 0x4.
 */
class ResName : public ResCommon<const ResNameData> {
public:
	explicit ResName(const void* pData)
	    : ResCommon(pData)
	{
	}

	u32 GetLength() const { return ref().len; }

	const char* GetName() const { return ref().str; }

	bool operator==(const ResName rhs) const;

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
///////////////////// DISPLAY LISTS ////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Class for handling display list data.
 *
 * @note Size: 0xC.
 */
struct ResTagDLData {
	u32 bufSize; // _00
	u32 cmdSize; // _04
	s32 toDL;    // _08
};

/**
 * @brief Class for handling display list data resources.
 *
 * @note Size: 0x4.
 */
class ResTagDL : public ResCommon<ResTagDLData> {
public:
	NW4R_G3D_RESOURCE_FUNC_DEF(ResTagDL);

	u32 GetBufSize() const { return ref().bufSize; }

	u32 GetCmdSize() const { return ref().cmdSize; }

	u8* GetDL() { return const_cast<u8*>(ofs_to_ptr<u8>(ref().toDL)); }
	const u8* GetDL() const { return ofs_to_ptr<u8>(ref().toDL); }

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////
//////////////////// MODEL BYTECODE ////////////////////
////////////////////////////////////////////////////////

namespace ResByteCodeData {

/**
 * @brief Operation byte codes.
 */
enum OpCode {
	NOOP,   // No operation
	END,    // End of bytecode
	CALC,   // Calculate matrix
	WEIGHT, // Apply weighting
	DRAW,   // Draw polygon
	EVPMTX, // Envelope matrix
	MTXDUP  // Duplicate matrix
};

/**
 * @brief CALC opcode layout.
 *
 * @note Size: 0x5.
 */
struct CalcParams {
	u8 opcode;        // _00
	u8 nodeIdHi;      // _01
	u8 nodeIdLo;      // _02
	u8 parentMtxIdHi; // _03
	u8 parentMtxIdLo; // _04
};

/**
 * @brief WEIGHT opcode layout.
 *
 * @note Size: 0x4.
 */
struct WeightParams {
	u8 opcode;      // _00
	u8 tgtIdHi;     // _01
	u8 tgtIdLo;     // _02
	u8 numBlendMtx; // _03
};

/**
 * @brief WEIGHT opcode layout (weighting entry).
 *
 * @note Size: 0x6.
 */
struct WeightEntry {
	u8 mtxIdHi;  // _00
	u8 mtxIdLo;  // _01
	u8 fWeight0; // _02
	u8 fWeight1; // _03
	u8 fWeight2; // _04
	u8 fWeight3; // _05
};

/**
 * @brief DRAW opcode layout.
 *
 * @note Size: 0x8.
 */
struct DrawParams {
	u8 opcode;   // _00
	u8 matIdHi;  // _01
	u8 matIdLo;  // _02
	u8 shpIdHi;  // _03
	u8 shpIdLo;  // _04
	u8 nodeIdHi; // _05
	u8 nodeIdLo; // _06
	u8 priority; // _07
};

/**
 * @brief EVPMTX opcode layout.
 *
 * @note Size: 0x5.
 */
struct EvpMtxParams {
	u8 opcode;   // _00
	u8 mtxIdHi;  // _01
	u8 mtxIdLo;  // _02
	u8 nodeIdHi; // _03
	u8 nodeIdLo; // _04
};

/**
 * @brief MTXDUP opcode layout.
 *
 * @note Size: 0x5.
 */
struct MtxDupParams {
	u8 opcode;      // _00
	u8 toMtxIdHi;   // _01
	u8 toMtxIdLo;   // _02
	u8 fromMtxIdHi; // _03
	u8 fromMtxIdLo; // _04
};

} // namespace ResByteCodeData

namespace detail {

////////////////////////////////////////////////////////
////////////////// READ/WRITE INLINES //////////////////
////////////////////////////////////////////////////////
/// PRIMITIVES

inline u8 ResRead_u8(const u8* pPtr)
{
	return *pPtr;
}

inline u32 ResRead_u32(const u8* pPtr)
{
	u32 value = ResRead_u8(pPtr++) << 24;
	value |= ResRead_u8(pPtr++) << 16;
	value |= ResRead_u8(pPtr++) << 8;
	value |= ResRead_u8(pPtr++) << 0;
	return value;
}

inline void ResWrite_u8(u8* pPtr, u8 data)
{
	*pPtr = data;
}

inline void ResWrite_u16(u8* pPtr, u16 data)
{
	ResWrite_u8(pPtr++, data >> 8);
	ResWrite_u8(pPtr++, data >> 0);
}

inline void ResWrite_u32(u8* pPtr, u32 data)
{
	ResWrite_u8(pPtr++, data >> 24);
	ResWrite_u8(pPtr++, data >> 16);
	ResWrite_u8(pPtr++, data >> 8);
	ResWrite_u8(pPtr++, data >> 0);
}

/// BLITTING PROCESSOR (BP)

inline void ResReadBPCmd(const u8* pPtr, u32* pOut)
{
	// Skip over FIFO command byte
	*pOut = ResRead_u32(pPtr + 1);
}

void ResWriteBPCmd(u8* pPtr, u32 reg);
void ResWriteBPCmd(u8* pPtr, u32 reg, u32 mask);
void ResWriteSSMask(u8* pPtr, u32 value);

/// COMMAND PROCESSOR (CP)

inline void ResReadCPCmd(const u8* pPtr, u32* pOut)
{
	// Skip over FIFO command byte + addr byte
	*pOut = ResRead_u32(pPtr + 2);
}

void ResWriteCPCmd(u8* pPtr, u8 addr, u32 value);

/// TRANSFORM UNIT (XF)

inline void ResReadXFCmd(const u8* pPtr, u32* pOut)
{
	// Skip over FIFO command byte + size short + addr short
	*pOut = ResRead_u32(pPtr + 5);
}

void ResWriteXFCmd(u8* pPtr, u16 addr, u32 value);

////////////////////////////////////////////////////////
//////////////////// UTILITY INLINES ///////////////////
////////////////////////////////////////////////////////

inline GXColor GetRGBA(u8 r, u8 g, u8 b, u8 a)
{
	return (GXColor) { r, g, b, a };
}
inline GXColorS10 GetRGBAS10(s16 r, s16 g, s16 b, s16 a)
{
	return (GXColorS10) { r, g, b, a };
}

////////////////////////////////////////////////////////

} // namespace detail
} // namespace g3d
} // namespace nw4r

#endif
