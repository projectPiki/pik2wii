#ifndef NW4R_G3D_RES_RESANM_H
#define NW4R_G3D_RES_RESANM_H

#include <nw4r/types_nw4r.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
//////////////////// RES KEY FRAME /////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Basic info for animation key frames.
 *
 * @note Size: 0xC.
 */
struct ResKeyFrameData {
	f32 frame; // _00
	f32 value; // _04
	f32 slope; // _08
};

/**
 * @brief Data object for animation key frames.
 *
 * @note Size: 0x14.
 */
struct ResKeyFrameAnmData {
	u16 numKeyFrame;              // _00
	f32 invKeyFrameRange;         // _04
	ResKeyFrameData keyFrames[1]; // _08
};

namespace detail {

/// Global functions

f32 GetResKeyFrameAnmResult(const ResKeyFrameAnmData* pData, f32 frame);

} // namespace detail

////////////////////////////////////////////////////////
//////////////////// RES ANIMATION /////////////////////
////////////////////////////////////////////////////////

/**
 * @brief Animation play types.
 */
enum AnmPolicy {
	ANM_POLICY_ONETIME, // 0
	ANM_POLICY_LOOP,    // 1
	ANM_POLICY_MAX,     // 2
};

/**
 * @brief Basic flexible animation data object.
 *
 * @note Size: 0x4.
 */
union ResAnmData {
	f32 constValue;           // _00
	s32 toResKeyFrameAnmData; // _00
};

namespace detail {

/// Useful inlines

inline f32 GetResAnmResult(const ResAnmData* pData, f32 frame, bool constant)
{
	if (constant) {
		return pData->constValue;
	}

	const ResKeyFrameAnmData* pFrameData
	    = reinterpret_cast<const ResKeyFrameAnmData*>(reinterpret_cast<const char*>(pData) + pData->toResKeyFrameAnmData);

	return GetResKeyFrameAnmResult(pFrameData, frame);
}

template <typename T>
inline f32 ClipFrame(const T& rInfo, f32 frame)
{
	if (frame <= 0.0f) {
		return 0.0f;
	}

	if (rInfo.numFrame <= frame) {
		return rInfo.numFrame;
	}

	return frame;
}

} // namespace detail

////////////////////////////////////////////////////////
///////////////// RES COLOR ANIMATION //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Basic flexible color animation data object.
 *
 * @note Size: 0x4.
 */
union ResColorAnmData {
	u32 constValue;              // _00
	s32 toResColorAnmFramesData; // _00
};

/**
 * @brief Color animation frame data.
 *
 * @note Size: 0x4.
 */
struct ResColorAnmFramesData {
	u32 frameColors[1]; // _00
};

namespace detail {

/// Global functions

u32 GetResColorAnmResult(const ResColorAnmFramesData* pData, f32 frame);

/// Useful inlines

inline u32 GetResColorAnmResult(const ResColorAnmData* pData, f32 frame, bool constant)
{
	if (constant) {
		return pData->constValue;
	}

	const ResColorAnmFramesData* pFrameData
	    = reinterpret_cast<const ResColorAnmFramesData*>(reinterpret_cast<const char*>(pData) + pData->toResColorAnmFramesData);

	return GetResColorAnmResult(pFrameData, frame);
}

} // namespace detail

////////////////////////////////////////////////////////
////////////////// RES BOOL ANIMATION //////////////////
////////////////////////////////////////////////////////

/**
 * @brief Basic flexible boolean animation data object.
 *
 * @note Size: 0x4.
 */
union ResBoolAnmData {
	s32 toResBoolAnmFramesData; // _00
};

/**
 * @brief Boolean animation frame data.
 *
 * @note Size: 0x4.
 */
struct ResBoolAnmFramesData {
	u32 boolBits[1]; // _00
};

namespace detail {

/// Useful inlines

inline bool GetResBoolAnmFramesResult(const ResBoolAnmFramesData* pData, int frame)
{
	const u32* pBits = pData->boolBits;
	u32 index        = static_cast<u32>(frame);

	u32 wordIdx = index / 32;
	u32 bitIdx  = index % 32;

	u32 targetBit = (1U << 31) >> bitIdx;
	u32 bitWord   = pBits[wordIdx];

	return bitWord & targetBit;
}

inline bool GetResBoolAnmResult(const ResBoolAnmData* pData, int frame)
{
	const ResBoolAnmFramesData* pFrameData
	    = reinterpret_cast<const ResBoolAnmFramesData*>(reinterpret_cast<const char*>(pData) + pData->toResBoolAnmFramesData);

	return GetResBoolAnmFramesResult(pFrameData, frame);
}

} // namespace detail

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
