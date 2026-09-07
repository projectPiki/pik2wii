#ifndef _SYSTEM12_3D_H
#define _SYSTEM12_3D_H

#include <System12/FrameCounter.h>
#include <egg/core/eggSingleton.h>
#include <egg/math/eggMatrix.h>
#include <egg/prim/eggBuffer.h>
#include <nw4r/g3d.h>

namespace System12 {
class Model;

class RootScene {
public:
	RootScene() { mRoot = nullptr; }

	void construct(u32, u32, EGG::Heap*);

	nw4r::g3d::ScnRoot* getRoot() const { return mRoot; }

private:
	nw4r::g3d::ScnRoot* mRoot; // _00
};

class MaterialAnimationBase : public FrameCounter {
public:
	virtual int getAnimObj() { return mAnimObj; } // _2C

	// _00     = VTBL
	// _00-_28 = System12::FrameCounter
	int mAnimObj; // _28
};

class AnimDefineFile {
public:
	struct AnimInfo {
		u32 _00;
	};

	class FrameInfo { };
};

class Animation : public FrameCounter {
public:
	Animation()
	    : mAnimObjChr(nullptr)
	    , _2C(nullptr)
	    , _30(nullptr)
	{
	}

	virtual void play(FrameCounter::eType, f32);                          // _08
	virtual void calc();                                                  // _24
	virtual void setCurrentFrame(f32);                                    // _28
	virtual nw4r::g3d::AnmObjChr* getAnimObjChr() { return mAnimObjChr; } // _2C
	virtual void play_animinfo(FrameCounter::eType, f32);                 // _30
	virtual void calc_animinfo();                                         // _34

	void attachAnimation(nw4r::g3d::AnmObjChrRes*, Model*);

	// _00     = VTBL
	// _00-_28 = System12::FrameCounter
	nw4r::g3d::AnmObjChrRes* mAnimObjChr; // _28
	int _2C;                              // _2C
	int _30;                              // _30
};

class AnimMgrBase {
public:
	AnimMgrBase();

	void allocate(Model*, int);

	EGG::TBuffer<Animation> mBuffer; // _00
	Model* mModel;                   // _2C
};

class Model {
public:
	struct ConstructArg {
		EGG::Heap* mHeap;
		u32 mBufferOption;
		nw4r::g3d::ResFile mResFile;
		int mNumView;
		int mIndex;
		const char* mModelName;
		int _18;
		const char* mAnimChrName;
		u32 mAnimChrCount;
		bool _24;
		const char* mAnimPatName;
		u32 mAnimPatCount;
		bool _30;
		const char* mAnimSrtName;
		u32 mAnimSrtCount;
		bool _3C;
	};

	Model();

	bool construct(ConstructArg&);
	void construct_animations(const nw4r::g3d::ResFile&, ConstructArg&);
	void construct_texpat_animations(const nw4r::g3d::ResFile&, ConstructArg&);
	void construct_texsrt_animations(const nw4r::g3d::ResFile&, ConstructArg&);
	void construct_vis_animations(const nw4r::g3d::ResFile&, ConstructArg&);
	void construct_clr_animations(const nw4r::g3d::ResFile&, ConstructArg&);
	void setVisible(bool);

	nw4r::g3d::ScnMdl* getModel() const { return mModel; }

	// unused/inlined:
	void setAnimation(int);
	int getNumAnimations();
	int getAnimation(int);
	void playAnimation(FrameCounter::eType, f32);
	void setLocalMtx(const EGG::Matrix34f&);

private:
	nw4r::g3d::ScnMdl* mModel;                    // _00
	int _04;                                      // _04
	AnimMgrBase* mAnimMgrBase;                    // _08
	nw4r::g3d::ResAnmChr* mResAnmChr;             // _0C
	nw4r::g3d::AnmObjVisRes* mAnmObjVisRes;       // _10
	nw4r::g3d::AnmObjMatClrRes* mAnmObjMatClrRes; // _14
	EGG::TBuffer<MaterialAnimationBase> mBuffer1; // _18
	EGG::TBuffer<MaterialAnimationBase> mBuffer2; // _24
};

} // namespace System12

#endif
