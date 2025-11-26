#ifndef _GAME_CURRTRIINFO_H
#define _GAME_CURRTRIINFO_H

#include "Vector3.h"

namespace Sys {
struct Triangle;
struct TriangleTable;
} // namespace Sys

namespace Game {
struct CurrTriInfo {
	CurrTriInfo()
	{
		mTriangle = nullptr;

		mMaxY = FLOAT_DIST_MAX;
		mMinY = FLOAT_DIST_MIN;

		mTable = nullptr;

		mNormalVec.set(0.0f, 1.0f, 0.0f);

		mUpdateOnNewMaxY = true;
		mGetFullInfo     = false;
		_0E              = 0;
		_0F              = 0;
		_10              = 0;
		_11              = 0;
	}

	Vector3f mPosition;         // _00
	bool mUpdateOnNewMaxY;      // _0C, an enigma to name
	bool mGetFullInfo;          // _0D, grabs normal and maxY/minY
	u8 _0E;                     // _0E, new
	u8 _0F;                     // _0F, new
	u8 _10;                     // _10, new
	u8 _11;                     // _11, new
	u8 _12[0x2];                // _12, padding
	u8 _14[0x14];               // _14, unknown, new
	Sys::TriangleTable* mTable; // _28
	Sys::Triangle* mTriangle;   // _2C
	f32 mMaxY;                  // _30
	f32 mMinY;                  // _34
	Vector3f mNormalVec;        // _38
};
} // namespace Game

#endif
