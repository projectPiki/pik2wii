#ifndef _SYSTEM12_WINDOW_H
#define _SYSTEM12_WINDOW_H

#include <egg/gfx/eggViewport.h>
#include <egg/math/eggVector.h>
#include <egg/prim/eggBuffer.h>
#include <nw4r/g3d.h>

namespace System12 {

class Window {
public:
	Window();

	void setG3DCamera(nw4r::g3d::Camera&);
	void refreshViewport();
	void getPosSizeInEFB(EGG::Vector2f&, f32&, f32&);
	void getGlobalPos(EGG::Vector2f&);

	EGG::Viewport& getViewport() { return mViewport; }
	f32 getSizeX() const { return mSizeX; }
	f32 getSizeY() const { return mSizeY; }
	void setSizeX(f32 x) { mSizeX = x; }
	void setSizeY(f32 y) { mSizeY = y; }

	int _00;                 // _00
	int _04;                 // _04
	int _08;                 // _08
	int _0C;                 // _0C
	int _10;                 // _10
	int _14;                 // _14
	EGG::Vector2f _18;       // _18
	f32 mSizeX;              // _20
	f32 mSizeY;              // _24
	EGG::Viewport mViewport; // _28
	s32 _44;                 // _44
	s32 _48;                 // _48
};

} // namespace System12

#endif