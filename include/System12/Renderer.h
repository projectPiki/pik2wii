#ifndef _SYSTEM12_RENDERER_H
#define _SYSTEM12_RENDERER_H

#include <System12/3D.h>
#include <System12/Window.h>
#include <egg/core/eggSingleton.h>
#include <egg/gfx/eggCamera.h>
#include <egg/gfx/eggProjection.h>

namespace System12 {

class Renderer {
	EGG_SINGLETON_DECL(Renderer);

public:
	struct Arg {
		Arg()
		{
			mCamera     = nullptr;
			mWindow     = nullptr;
			mProjection = nullptr;
			mHeap       = nullptr;
		}

		Arg& operator=(const Arg& arg)
		{
			mCamera      = arg.mCamera;
			mWindow      = arg.mWindow;
			mProjection  = arg.mProjection;
			mMaxScnObj   = arg.mMaxScnObj;
			mNumLightObj = arg.mNumLightObj;
			mHeap        = arg.mHeap;
			return *this;
		}

		EGG::BaseCamera* mCamera;         // _00
		Window* mWindow;                  // _04
		EGG::ProjectionData* mProjection; // _08
		u32 mMaxScnObj;                   // _0C
		u32 mNumLightObj;                 // _10
		EGG::Heap* mHeap;                 // _14
	};

	Renderer();

	virtual void calc();       // _08
	virtual void draw();       // _0C
	virtual void setup_draw(); // _10

	void init(Arg&);
	void push_back(Model*);
	void raw_draw();

	EGG::ProjectionData* getProjection() { return mArg.mProjection; }
	void setProjection(EGG::ProjectionData* proj) { mArg.mProjection = proj; }
	//  EGG::BaseCamera* getCamera() { return mArg.mCamera; }
	Window* getWindow() { return mArg.mWindow; }
	void setWindow(Window* window) { mArg.mWindow = window; }
	RootScene& getRootScene() { return mScene; }

private:
	RootScene mScene; // _14
	Arg mArg;         // _18
};

} // namespace System12

#endif
