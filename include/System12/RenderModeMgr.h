#ifndef _SYSTEM12_RENDER_MODE_MGR_H
#define _SYSTEM12_RENDER_MODE_MGR_H

#include <RevoSDK/gx.h>

namespace System12 {

class RenderModeMgr {
public:
	void wait();

	GXRenderModeObj* _00; // _00
	GXRenderModeObj* _04; // _04
	GXRenderModeObj* _08; // _08
	GXRenderModeObj* _0C; // _0C
	GXRenderModeObj* _10; // _10
	GXRenderModeObj* _14; // _14
	int mMode;            // _18
	int _1C;              // _1C
	bool _20;             // _20
	bool _21;             // _21
};

} // namespace System12

#endif
