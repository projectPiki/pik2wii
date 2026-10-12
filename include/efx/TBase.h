#ifndef _EFX_TBASE_H
#define _EFX_TBASE_H

#include "ParticleMgr.h"
#include "Vector3.h"
#include "efx/TCallBack_StaticClipping.h"
#include "efx/Arg.h"
#include "types.h"
#include "ParticleID.h"

namespace efx {
inline void makeMtxZAxisAlongPosPos(Mtx mtx, Vector3f& p2, Vector3f& p3)
{
	Vector3f midPt = (p2 + p3) / 2;
	Vector3f zVec = p3 - p2;

	zVec.normalise();

	Vector3f yAxis(0.0f, 1.0f, 0.0f);
	Vector3f xVec = cross(yAxis, zVec);
	Vector3f yVec = cross(zVec, xVec);

	mtx[0][0] = xVec.x;
	mtx[0][1] = yVec.x;
	mtx[0][2] = zVec.x;
	mtx[0][3] = midPt.x;

	mtx[1][0] = xVec.y;
	mtx[1][1] = yVec.y;
	mtx[1][2] = zVec.y;
	mtx[1][3] = midPt.y;

	mtx[2][0] = xVec.z;
	mtx[2][1] = yVec.z;
	mtx[2][2] = zVec.z;
	mtx[2][3] = midPt.z;
}

struct TBase {
	virtual bool create(Arg*) = 0; // _08
	virtual void forceKill()  = 0; // _0C
	virtual void fade()       = 0; // _10

	static TCallBack_StaticClipping mCallBack_StaticClipping;
};

} // namespace efx

#endif
