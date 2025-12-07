#ifndef NW4R_G3D_CAMERA_H
#define NW4R_G3D_CAMERA_H

#include <nw4r/types_nw4r.h>

#include <nw4r/g3d/res/g3d_rescommon.h>

#include <nw4r/math.h>

#include <RevoSDK/MTX.h>

namespace nw4r {
namespace g3d {

////////////////////////////////////////////////////////
/////////////////// CAMERA RESOURCES ///////////////////
////////////////////////////////////////////////////////

/**
 * @brief Underlying data structure for camera resources.
 *
 * @note Size: 0x10C.
 */
struct CameraData {

	/**
	 * @brief Flags for camera operations and types.
	 */
	enum Flag {
		FLAG_CAM_LOOKAT    = (1 << 0),
		FLAG_CAM_ROTATE    = (1 << 1),
		FLAG_CAM_AIM       = (1 << 2),
		FLAG_CAM_MTX_READY = (1 << 3),

		FLAG_PROJ_FRUSTUM   = (1 << 4),
		FLAG_PROJ_PERSP     = (1 << 5),
		FLAG_PROJ_ORTHO     = (1 << 6),
		FLAG_PROJ_MTX_READY = (1 << 7),

		FLAG_VI_ODD_FIELD = (1 << 8),
	};

	math::MTX34 cameraMtx;     // _00
	math::MTX44 projMtx;       // _30
	u32 flags;                 // _70
	math::VEC3 cameraPos;      // _74
	math::VEC3 cameraUp;       // _80
	math::VEC3 cameraTarget;   // _8C
	math::VEC3 cameraRotate;   // _98
	f32 cameraTwist;           // _A4
	GXProjectionType projType; // _A8
	f32 projFovy;              // _AC
	f32 projAspect;            // _B0
	f32 projNear;              // _B4
	f32 projFar;               // _B8
	f32 projTop;               // _BC
	f32 projBottom;            // _C0
	f32 projLeft;              // _C4
	f32 projRight;             // _C8
	f32 lightScaleS;           // _CC
	f32 lightScaleT;           // _D0
	f32 lightTransS;           // _D4
	f32 lightTransT;           // _D8
	math::VEC2 viewportOrigin; // _DC
	math::VEC2 viewportSize;   // _E4
	f32 viewportNear;          // _EC
	f32 viewportFar;           // _F0
	u32 scissorX;              // _F4
	u32 scissorY;              // _F8
	u32 scissorWidth;          // _FC
	u32 scissorHeight;         // _100
	s32 scissorOffsetX;        // _104
	s32 scissorOffsetY;        // _108
};

/**
 * @brief Wrapper for camera resources.
 *
 * @note Size: 0x4.
 */
class Camera : public ResCommon<CameraData> {
public:
	enum PostureType { POSTURE_LOOKAT, POSTURE_ROTATE, POSTURE_AIM };

	struct PostureInfo {
		PostureType tp;          // at 0x0
		math::VEC3 cameraUp;     // at 0x4
		math::VEC3 cameraTarget; // at 0x10
		math::VEC3 cameraRotate; // at 0x1C
		f32 cameraTwist;         // at 0x28
	};

public:
	explicit Camera(CameraData* pData);

	void Init();
	void Init(u16 efbWidth, u16 efbHeight, u16 xfbWidth, u16 xfbHeight, u16 viWidth, u16 viHeight);

	void SetPosition(f32 x, f32 y, f32 z);
	void SetPosition(const math::VEC3& rPos);

	void SetPosture(const PostureInfo& rInfo);
	void SetCameraMtxDirectly(const math::MTX34& rMtx);
	void SetPerspective(f32 fovy, f32 aspect, f32 near, f32 far);
	void SetOrtho(f32 top, f32 bottom, f32 left, f32 right, f32 near, f32 far);
	void SetProjectionMtxDirectly(const math::MTX44* pMtx);

	void SetScissor(u32 x, u32 y, u32 width, u32 height);
	void SetScissorBoxOffset(s32 ox, s32 oy);

	void SetViewport(f32 x, f32 y, f32 width, f32 height);
	void SetViewportZRange(f32 near, f32 far);
	void GetViewport(f32* pX, f32* pY, f32* pWidth, f32* pHeight, f32* pNear, f32* pFar) const;

	void GetCameraMtx(math::MTX34* pMtx) const;
	void GetProjectionMtx(math::MTX44* pMtx) const;
	void GetProjectionTexMtx(math::MTX34* pMtx) const;
	void GetEnvironmentTexMtx(math::MTX34* pMtx) const;

	void GXSetViewport() const;
	void GXSetProjection() const;
	void GXSetScissor() const;
	void GXSetScissorBoxOffset() const;

	GXProjectionType GetProjectionType() const { return ref().projType; }

private:
	void UpdateCameraMtx() const;
	void UpdateProjectionMtx() const;

	// _00-_04 = ResCommon
};

////////////////////////////////////////////////////////

} // namespace g3d
} // namespace nw4r

#endif
