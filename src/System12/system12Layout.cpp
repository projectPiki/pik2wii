#include "System12/DvdLoader.h"
#include "System12/FrameCounter.h"
#include "System12/Language.h"
#include "System12/Layout.h"
#include "System12/ResourceMgr.h"
#include "System12/WPMessage.h"
#include "egg/core/eggAllocator.h"
#include "egg/core/eggDvdRipper.h"
#include "egg/gfx/eggGraphics.h"
#include "egg/math/eggBoundBox.h"
#include "egg/math/eggMatrix.h"
#include "egg/prim/eggAssert.h"
#include "stl/stdio.h"
#include "stl/string.h"
#include <stl/wchar.h>

System12::WPTagProcessor System12TextBox::sDefaultTagProcessor;
EGG::Mutex System12::Layout::sMutex;

u16 System12TextBox::SetStringAdjust(const wchar_t* pStr, u16 pos)
{
	return SetStringAdjust(pStr, pos, wcslen(pStr));
}

void System12TextBox::sysTextBoxInit()
{
	SetTagProcessor(&sDefaultTagProcessor);
	if (!strncmp(mUserData, "#", 1)) {
		u32 msgIDMain;
		u32 msgIDSub;
		sscanf(mUserData, "#%5d%2d", &msgIDMain, &msgIDSub);
		const wchar_t* msg = EGG_INSTANCE(System12::WPMessage)->GetMessageWide(msgIDMain, msgIDSub);
		u16 strLen         = mWPTagProcessor->CalcStrLen(msg, 1);
		AllocStringBuffer(2048);
		memset(mTextBuf, 0, 4096);
		SetStringAdjust(msg, 0, strLen);
	} else {
		wchar_t buffer[2048];
		u16 strLen = mWPTagProcessor->CalcStrLen(mTextBuf, 1);
		memcpy(buffer, mTextBuf, (strLen & 0xffff) << 1);
		buffer[strLen << 0] = 0;
		AllocStringBuffer(2048);
		memset(mTextBuf, 0, 4096);
		SetStringAdjust(buffer, 0, wcslen(buffer));
	}
}
u16 System12TextBox::SetString(const wchar_t* p1, u16 p2, u16 p3)
{

	f32 textWidth;
	bool stringImpl = false;

	if (!strncmp(mUserData, "$", 1)) {
		sscanf(mUserData, "$%f", &textWidth);
		mFontSize.width = textWidth;
		stringImpl      = true;
	}

	if (stringImpl) {
		return setStringImpl(p1, p2, p3);
	} else {
		return SetStringAdjust(p1, p2, p3);
	}
}

u16 System12TextBox::SetStringAdjust(const wchar_t* p1, u16 p2, u16 p3)
{
	u16 string = setStringImpl(p1, p2, p3);
	adjustImpl();
	return string;
}

u16 System12TextBox::setStringImpl(const wchar_t* p1, u16 p2, u16 p3)
{
	wchar_t textBuffer[2048];
	int msg;
	if (mWPTagProcessor) {
		mWPTagProcessor->PreProcessWithNumWords(p1, 2048, textBuffer, 2048, &msg, 0, 1);
		nw4r::lyt::TextBox::SetString(textBuffer, 0, msg);
	} else {
		nw4r::lyt::TextBox::SetString(p1, p2, p3);
	}
}

namespace System12 {

void* FontLessArcResourceAccessor::GetResource(u32 type, const char* pName, u32* pSize)
{
	if (type == 'font') {
		return EGG_INSTANCE(SystemResourceMgr)->mPikmin12Font;
	}
	return nw4r::lyt::ArcResourceAccessor::GetResource(type, pName, pSize);
}

void Layout::Animator::setup(nw4r::lyt::AnimTransform* anim)
{
	_28 = anim;
	if (anim) {
		setupMaxFrames(anim->GetFrameSize() / 1.0f);
	} else {
		setupMaxFrames(0.0f);
	}
}

Layout::Layout(EGG::Heap* pHeap)
    : _00(nullptr)
    , _04(nullptr)
    , _08(nullptr)
    , _0C(nullptr)
    , _10(nullptr)
    , mLayout(nullptr)
{
	mHeap = pHeap;
}

void Layout::construct(const char* path, const char* brlyt, bool multi_lang)
{
	const char* lang = multi_lang ? "true" : "false";
	EGG_PRINT("[Layout construct] path:%s, brlyt:%s, multi_lang:%s\n", path, brlyt, lang);
	EGG::Heap* heap = mHeap;
	if (!mHeap) {
		heap = EGG::Heap::getCurrentHeap();
	}
	EGG_ASSERT(539, heap);

	u32 pathLen     = strlen(path);
	const char* ext = path + (pathLen - 3);
	if (!strcmp(ext, "szs")) {
		DvdLoader::Arg arg;
		arg.mHeap     = mHeap;
		arg.mFilePath = path;
		mArcDataPtr   = DvdLoader::loadSZS(arg);
	} else {
		EGG_ASSERT(588, strcmp(ext, "arc") == 0);
		if (multi_lang) {
			char dir[256];
			makeLanguagePath(EGG_INSTANCE(Language), dir, 256, path, "");
			mArcDataPtr = EGG::DvdRipper::loadToMainRAM(dir, 0, mHeap, EGG::DvdRipper::ALLOC_DIR_HEAD, 0, 0, 0);
		} else {
			mArcDataPtr = EGG::DvdRipper::loadToMainRAM(path, 0, mHeap, EGG::DvdRipper::ALLOC_DIR_HEAD, 0, 0, 0);
		}
		EGG_PRINT("ext is %s. load from arc.\n", ext);
	}
	EGG_ASSERT_MSG(600, mArcDataPtr, "%s(%s)\n", path, brlyt);

	bool result = mFontLessArcResourceAccessor.Attach(mArcDataPtr, "");
	EGG_ASSERT(603, result);
	if (mHeap) {
		heap = mHeap;
	}

	if (!mHeap) {
		EGG_ASSERT_MSG(609, 0, "mHeap not specified!\n");
	}

	allocatorAssert();
	sMutex.lock();
	EGG::Allocator allocator(heap, 32);
	nw4r::lyt::Layout::SetAllocator(&allocator);
	mLayout        = new System12LayoutImpl;
	void* resource = mFontLessArcResourceAccessor.GetResource(0, brlyt, nullptr);
	mLytResource   = resource;
	EGG_ASSERT_MSG(632, resource, "%s not found.\n", brlyt);

	mLayout->Build(mLytResource, &mFontLessArcResourceAccessor);
	buildResBlock(mLytResource, &mFontLessArcResourceAccessor, &_D0);
	nw4r::lyt::Layout::SetAllocator(0);
	sMutex.unlock();
	EGG_PRINT("ippatu keisan\n");

	nw4r::lyt::DrawInfo drawinfo;
	drawinfo.SetInvisiblePaneCalculateMtx(true);

	nw4r::ut::Rect rec = mLayout->GetLayoutRect();

	drawinfo.SetViewMtx(*EGG::Matrix34f::ident);
	drawinfo.SetViewRect(rec);

	mLayout->CalculateMtx(drawinfo);
}

AnimTransformDisposer::~AnimTransformDisposer()
{
}

nw4r::lyt::AnimTransform* Layout::createAnimTransform(const char* name, bool multi_lang)
{
	EGG::Heap* heap               = mHeap;
	volatile const char* fileName = name;
	if (!mHeap) {
		heap = EGG::Heap::getCurrentHeap();
	}
	EGG_ASSERT(695, heap);
	allocatorAssert();
	sMutex.lock();
	EGG::Allocator allocator(heap, 4);

	nw4r::lyt::Layout::SetAllocator(&allocator);

	// BBA has code here to load anims based on language if multi_lang is true

	void* animptr = mFontLessArcResourceAccessor.GetResource('anim', (const char*)fileName, nullptr);
	EGG_ASSERT_MSG(720, animptr, "file_name : %s\n", fileName);

	nw4r::lyt::AnimTransform* transform = getLayout()->CreateAnimTransform(animptr, &mFontLessArcResourceAccessor);
	new (heap, 4) AnimTransformDisposer(getLayout(), transform);
	nw4r::lyt::Layout::SetAllocator(nullptr);
	sMutex.unlock();
	return transform;
}

void Layout::bind(const char* name, bool recursive, bool multi_lang)
{
	bind(name, getRootPane(), recursive, multi_lang);
}

void Layout::bind(const char* name, nw4r::lyt::Pane* pane, bool recursive, bool multi_lang)
{
	EGG::Heap* heap = mHeap;
	if (!mHeap) {
		heap = EGG::Heap::getCurrentHeap();
	}
	EGG_ASSERT(749, heap);
	nw4r::lyt::AnimTransform* transform = createAnimTransform(name, multi_lang);
	pane->BindAnimation(transform, recursive, false);
	Layout::Animator* animator = new Animator();
	animator->setup(transform);
}

Layout::Animator* Layout::createAnimator(nw4r::lyt::AnimTransform* anim)
{
	EGG::Heap* heap = mHeap;
	if (!mHeap) {
		heap = EGG::Heap::getCurrentHeap();
	}
	EGG_ASSERT(781, heap);

	Layout::Animator* animator = new (heap, 4) Animator();

	EGG_ASSERT(784, animator);

	animator->setup(anim);

	registerAnimator(animator);
	return animator;
}

nw4r::lyt::Pane* Layout::clonePane(const char* paneName, bool recursive)
{
	nw4r::lyt::Pane* pane1 = getRootPane()->FindPaneByName(paneName, true);
	nw4r::lyt::Pane* pane2 = clonePaneImpl(paneName);
	if (recursive) {
		clonePaneRecursiveImpl(pane2, pane1);
	}
	return pane2;
}

void Layout::clonePaneRecursiveImpl(nw4r::lyt::Pane* pPane1, nw4r::lyt::Pane* pPane2)
{
	NW4R_UT_LINKLIST_FOREACH(it, pPane1->GetChildList(), {
		nw4r::lyt::Pane* pane1 = getRootPane()->FindPaneByName(pPane1->GetName(), true);
		nw4r::lyt::Pane* pane2 = clonePaneImpl(pPane1->GetName());
		pPane1->AppendChild(pane2);
		clonePaneRecursiveImpl(pane1, pPane2); //
	})
}

void Layout::calculateMtx()
{
	calculateMtx(EGG::Matrix34f::ident);
}

void Layout::calculateMtx(const EGG::Matrix34f& mtx)
{
	nw4r::lyt::DrawInfo drawinfo;
	nw4r::ut::Rect rec = mLayout->GetLayoutRect();

	drawinfo.SetViewMtx(*mtx);
	drawinfo.SetViewRect(rec);
	mLayout->CalculateMtx(drawinfo);
}

void Layout::draw(_GXCullMode mode, bool zbuffer)
{
	draw(EGG::Matrix34f::ident, mode, zbuffer);
}

void Layout::draw(const EGG::Matrix34f& mtx, _GXCullMode mode, bool zbuffer)
{
	GXSetCullMode(mode);
	if (zbuffer) {
		EGG::Graphics::enable_zbuffer();
	} else {
		EGG::Graphics::disable_zbuffer();
	}
	nw4r::lyt::DrawInfo drawinfo;
	nw4r::ut::Rect rec = mLayout->GetLayoutRect();
	drawinfo.SetViewMtx(*mtx);
	drawinfo.SetViewRect(rec);
	mLayout->CalculateMtx(drawinfo);
	GXSetClipMode(GX_CLIP_ENABLE);
	mLayout->Draw(drawinfo);
}

bool System12LayoutImpl::Build(const void* pLytBinary, nw4r::lyt::ResourceAccessor* lytResBuf)
{
	const nw4r::lyt::res::BinaryFileHeader* const pHeader = static_cast<const nw4r::lyt::res::BinaryFileHeader*>(pLytBinary);

	NW4R_ASSERT_PTR_NULL(mspAllocator, 1067);
	NW4R_ASSERT_PTR_NULL(lytResBuf, 1068);
	if (!nw4r::lyt::detail::TestFileHeader(*pHeader, SIGNATURE)) {
		return false;
	}

	if (pHeader->version != 10) {
		NW4R_PANIC(1083, "Version check faild ('%d.%d' must be '%d.%d')", (pHeader->version >> 8) & 0xFF, pHeader->version & 0xFF, 0, 10);
	}

	nw4r::lyt::ResBlockSet blockSet = {
		nullptr,  // pTextureList
		nullptr,  // pFontList
		nullptr,  // pMaterialList
		lytResBuf // pResAccessor
	};

	nw4r::lyt::Pane* pParentPane = nullptr;
	nw4r::lyt::Pane* pLastPane   = nullptr;

	bool bReadRootGroup = false;
	int groupNestLevel  = 0;

	const void* pBlockData = static_cast<const u8*>(pLytBinary) + pHeader->headerSize;

	for (int i = 0; i < pHeader->dataBlocks; i++) {
		const nw4r::lyt::res::DataBlockHeader* pBlockHeader = static_cast<const nw4r::lyt::res::DataBlockHeader*>(pBlockData);

		switch (nw4r::lyt::detail::GetSignatureInt(pBlockHeader->kind)) {
		case 'lyt1': {
			const nw4r::lyt::res::Layout* pRes = static_cast<const nw4r::lyt::res::Layout*>(pBlockData);

			mLayoutSize = pRes->layoutSize;
			break;
		}

		case 'txl1': {
			blockSet.pTextureList = static_cast<const nw4r::lyt::res::TextureList*>(pBlockData);
			break;
		}

		case 'fnl1': {
			blockSet.pFontList = static_cast<const nw4r::lyt::res::FontList*>(pBlockData);
			break;
		}

		case 'mat1': {
			blockSet.pMaterialList = static_cast<const nw4r::lyt::res::MaterialList*>(pBlockData);
			break;
		}

		case 'pan1':
		case 'pic1':
		case 'txt1':
		case 'wnd1':
		case 'bnd1': {
			nw4r::lyt::Pane* pPane = buildPane(nw4r::lyt::detail::GetSignatureInt(pBlockHeader->kind), pBlockData, blockSet);

			if (pPane != nullptr) {
				if (mpRootPane == nullptr) {
					mpRootPane = pPane;
				}

				if (pParentPane != nullptr) {
					pParentPane->AppendChild(pPane);
				}

				pLastPane = pPane;
			}

			break;
		}

		case 'pas1': {
			NW4R_ASSERT_PTR_NULL(pLastPane, 1145);
			pParentPane = pLastPane;
			break;
		}

		case 'pae1': {
			pLastPane   = pParentPane;
			pParentPane = pLastPane->GetParent();
			break;
		}

		case 'grp1': {
			if (!bReadRootGroup) {
				bReadRootGroup   = true;
				mpGroupContainer = NewObj<nw4r::lyt::GroupContainer>();
				break;
			}

			if (mpGroupContainer != nullptr && groupNestLevel == 1) {
				nw4r::lyt::Group* pGroup
				    = NewObj<nw4r::lyt::Group>(reinterpret_cast<const nw4r::lyt::res::Group*>(pBlockHeader), mpRootPane);

				if (pGroup != nullptr) {
					mpGroupContainer->AppendGroup(pGroup);
				}
			}

			break;
		}

		case 'grs1': {
			groupNestLevel++;
			break;
		}

		case 'gre1': {
			groupNestLevel--;
			break;
		}
		}

		pBlockData = static_cast<const u8*>(pBlockData) + pBlockHeader->size;
	}

	return true;
}

nw4r::lyt::Pane* System12LayoutImpl::buildPane(s32 kind, const void* pBinary, const nw4r::lyt::ResBlockSet& rBlockSet)
{

	switch (kind) {
	case 'pan1': {
		const nw4r::lyt::res::Pane* pRes = static_cast<const nw4r::lyt::res::Pane*>(pBinary);
		return NewObj<nw4r::lyt::Pane>(pRes);
	}

	case 'pic1': {
		const nw4r::lyt::res::Picture* pRes = static_cast<const nw4r::lyt::res::Picture*>(pBinary);
		return NewObj<nw4r::lyt::Picture>(pRes, rBlockSet);
	}

	case 'txt1': {
		const nw4r::lyt::res::TextBox* pRes = static_cast<const nw4r::lyt::res::TextBox*>(pBinary);
		return NewObj<System12TextBox>(pRes, rBlockSet);
	}

	case 'wnd1': {
		const nw4r::lyt::res::Window* pRes = static_cast<const nw4r::lyt::res::Window*>(pBinary);
		return NewObj<nw4r::lyt::Window>(pRes, rBlockSet);
	}

	case 'bnd1': {
		const nw4r::lyt::res::Bounding* pRes = static_cast<const nw4r::lyt::res::Bounding*>(pBinary);
		return NewObj<nw4r::lyt::Bounding>(pRes, rBlockSet);
	}

	default: {
		return nullptr;
	}
	}
}

void Layout::allocatorAssert()
{
}

System12LayoutImpl::~System12LayoutImpl()
{
}
} // namespace System12

System12TextBox::~System12TextBox()
{
}
