#include "RevoSDK/os.h"
#include "System12/3D.h"
#include "egg/core/eggAllocator.h"
#include "egg/core/eggThread.h"
#include "egg/prim/eggAssert.h"


namespace System12 {

Model::Model()
    : mModel(nullptr)
{
	_04              = nullptr;
	mAnimMgrBase     = nullptr;
	mResAnmChr       = nullptr;
	mAnmObjVisRes    = nullptr;
	mAnmObjMatClrRes = nullptr;
}

void RootScene::construct(u32 maxScnObj, u32 numLightObj, EGG::Heap* heap)
{
	EGG::Thread* thread = EGG::Thread::findThread(OSGetCurrentThread());
	if (heap == nullptr) {
		if (thread != nullptr) {
			heap = thread->mAllocatableHeap;
		}
		if (heap == nullptr) {
			heap = EGG::Heap::getCurrentHeap();
		}
	}
	EGG::Allocator allocator(heap, 32);

	mRoot = nw4r::g3d::ScnRoot::Construct(&allocator, &allocator.mAlign, maxScnObj, numLightObj, 128, 128);
}

bool Model::construct(ConstructArg& arg)
{

	nw4r::g3d::ResFile p = arg.mResFile;
	p.Init();
	bool success = p.Bind();
	if (success) {
		EGG::Thread* thread = EGG::Thread::findThread(OSGetCurrentThread());
		EGG::Heap* heap     = arg.mHeap;
		if (heap == nullptr) {
			if (thread != nullptr) {
				heap = thread->mAllocatableHeap;
			}
			if (heap == nullptr) {
				heap = EGG::Heap::getCurrentHeap();
			}
		}

		EGG::Allocator allocator(heap, 32);
		nw4r::g3d::ResMdl model;

		if (arg.mModelName) {
			model = p.GetResMdl(arg.mModelName);
		} else {
			model = p.GetResMdl(arg.mIndex);
		}

		mModel = nw4r::g3d::ScnMdl::Construct(&allocator, &allocator.mAlign, model, arg.mBufferOption, arg.mNumView);

		if (arg._24) {
			construct_animations(p, arg);
		}
		if (p.HasResAnmTexPat()) {
			construct_texpat_animations(p, arg);
		}
		if (p.HasResAnmVis()) {
			construct_vis_animations(p, arg);
		}
		if (p.HasResAnmClr()) {
			construct_clr_animations(p, arg);
		}
		if (p.HasResAnmTexSrt()) {
			construct_texsrt_animations(p, arg);
		}
		return true;
	} else {
		return false;
	}
}

void Model::construct_vis_animations(const nw4r::g3d::ResFile& file, ConstructArg& arg)
{
	EGG::Thread* thread = EGG::Thread::findThread(OSGetCurrentThread());
	EGG::Heap* heap     = nullptr;
	if (heap == nullptr) {
		if (thread != nullptr) {
			heap = thread->mAllocatableHeap;
		}
		if (heap == nullptr) {
			heap = EGG::Heap::getCurrentHeap();
		}
	}

	EGG::Allocator allocator(heap, 32);

	mAnmObjVisRes = nw4r::g3d::AnmObjVisRes::Construct(&allocator, &allocator.mAlign, file.GetResAnmVis(0), mModel->GetResMdl());
	mAnmObjVisRes->Bind(mModel->GetResMdl());
	mModel->SetAnmObj(mAnmObjVisRes, nw4r::g3d::ScnMdlSimple::ANMOBJTYPE_NOT_SPECIFIED);
}

void Model::construct_clr_animations(const nw4r::g3d::ResFile& file, ConstructArg& arg)
{
	EGG::Thread* thread = EGG::Thread::findThread(OSGetCurrentThread());
	EGG::Heap* heap     = nullptr;
	if (heap == nullptr) {
		if (thread != nullptr) {
			heap = thread->mAllocatableHeap;
		}
		if (heap == nullptr) {
			heap = EGG::Heap::getCurrentHeap();
		}
	}

	EGG::Allocator allocator(heap, 32);

	mAnmObjMatClrRes
	    = nw4r::g3d::AnmObjMatClrRes::Construct(&allocator, &allocator.mAlign, file.GetResAnmClr(0), mModel->GetResMdl(), false);
	mAnmObjMatClrRes->Bind(mModel->GetResMdl());
	mModel->SetAnmObj(mAnmObjMatClrRes, nw4r::g3d::ScnMdlSimple::ANMOBJTYPE_NOT_SPECIFIED);
}

void Model::setVisible(bool visible)
{
	if (mModel) {
		mModel->SetScnObjOption(nw4r::g3d::ScnObj::OPTID_DISABLE_GATHER_SCNOBJ | 0x10000, !visible);
	}
}

void Animation::attachAnimation(nw4r::g3d::AnmObjChrRes* res, Model* model)
{
	mAnimObjChr = res;
	mAnimObjChr->Bind(model->getModel()->GetResMdl());
	mAnimObjChr->SetUpdateRate(0.0f);
	mAnimObjChr->SetFrame(0.0f);
	mAnimObjChr->SetPlayPolicy(nw4r::g3d::PlayPolicy_Onetime);
	setupMaxFrames(mAnimObjChr->GetResAnm().GetNumFrame() / 1.0f);
}

void Animation::play(FrameCounter::eType type, f32 f)
{
	FrameCounter::play(type, f);
	if (_2C) {
		play_animinfo(type, f);
	}
	mAnimObjChr->SetFrame(mCurrentFrame);
}

void Animation::calc()
{
	FrameCounter::calc();
	if (_2C) {
		calc_animinfo();
	}
	mAnimObjChr->SetFrame(mCurrentFrame);
}

void Animation::setCurrentFrame(f32 frame)
{
	FrameCounter::setCurrentFrame(frame);
	mAnimObjChr->SetFrame(mCurrentFrame);
}

AnimMgrBase::AnimMgrBase()
{
	mModel = nullptr;
}

void AnimMgrBase::allocate(Model* model, int i)
{
	mModel = model;
	mBuffer.allocate(i, 0);
}
} // namespace System12
