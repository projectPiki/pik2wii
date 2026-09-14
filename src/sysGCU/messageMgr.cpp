#include "JSystem/JKernel/JKRAram.h"
#include "JSystem/JMessage/TParse.h"
#include "JSystem/JMessage/TResource.h"
#include "JSystem/JUtility/JUTTexture.h"
#include "P2JME/P2JME.h"
#include "P2JME/TReference.h"
#include "System.h"
#include "nans.h"

P2JME::Mgr* gP2JMEMgr;

namespace P2JME {

static const char* sFontResName[]
    = { "message/font_foreign.szs", "message/font_foreign.szs", "message/font_foreign.szs", "message/font_foreign.szs",
	    "message/font_foreign.szs", "message/font_jpn.szs",     "message/font_foreign.szs", "message/font_foreign.szs",
	    "message/font_foreign.szs", "message/font_foreign.szs" };

static const char* sMesResName[] = { "message/mesRes_engEU.szs", "message/mesRes_fraEU.szs", "message/mesRes_gerEU.szs",
	                                 "message/mesRes_engEU.szs", "message/mesRes_itaEU.szs", "message/mesRes_jpn.szs",   "message/mesRes_spaEU.szs",
	                                 "message/mesRes_engUS.szs", "message/mesRes_fraUS.szs", "message/mesRes_spaUS.szs" };

static const char* cBtnTexName[] = { "a_btn.bti", "b_btn.bti", "c_btn.bti",  "x_btn.bti",  "y_btn.bti", "z_btn.bti",
	                                 "l_btn.bti", "r_btn.bti", "3d_btn.bti", "st_btn.bti", "t_btn.bti" };

/**
 * @note Address: N/A
 * @note Size: 0x1C
 */
const char* getCurrentFontResName()
{
	return sFontResName[sys->getLanguage()];
}

/**
 * @note Address: N/A
 * @note Size: 0x1C
 */
const char* getCurrentMesResName()
{
	return sMesResName[sys->getLanguage()];
}

/**
 * @note Address: 0x80437EAC
 * @note Size: 0x40
 */
Mgr* Mgr::create(JKRExpHeap* heap)
{
	new Mgr(heap);
}

/**
 * @note Address: 0x80437EEC
 * @note Size: 0x170
 */
Mgr::Mgr(JKRExpHeap* heap)
    : mRubyFont(nullptr)
    , mImageLists(nullptr)
    , mMaxTextures(nullptr)
    , mIsLoaded(false)
    , mLangHeap(nullptr)
    , mResContainer(nullptr)
    , mMsgRef(nullptr)
{
	P2ASSERTLINE(203, !gP2JMEMgr);
	gP2JMEMgr = this;

	sys->heapStatusStart("MessageMgr", nullptr);

	mMaxTextures = new int[1];
	mImageLists  = new JUTTexture**[1];

	// dumb.
	for (int i = 0; i < 1; i++) {
		mMaxTextures[i] = 0;
		mImageLists[i]  = new JUTTexture*;
		mImageLists[i]  = nullptr;
	}

	sys->heapStatusStart("font res", nullptr);
	setupFont("pikmin2main.bfn", heap);
	sys->heapStatusEnd("font res");

	sys->heapStatusStart("tex res", nullptr);
	setupTex();
	sys->heapStatusEnd("tex res");

	sys->heapStatusEnd("MessageMgr");

	JKRHeap* heap2 = JKRGetCurrentHeap();
	mLangHeap      = makeExpHeap(0x57800, heap2, true);
	mLangHeap->becomeCurrentHeap();
	setupMessage();
	heap2->becomeCurrentHeap();
	mIsLoaded = true;
}

/**
 * @note Address: 0x8043805C
 * @note Size: 0x68
 */
Mgr::~Mgr()
{
	gP2JMEMgr = nullptr;
}

/**
 * @note Address: N/A
 * @note Size: 0x4
 */
void Mgr::reloadMessageResource()
{
	P2ASSERTLINE(278, mLangHeap);
	mLangHeap->freeAll();
	JKRHeap* prevHeap = JKRGetCurrentHeap();
	mLangHeap->becomeCurrentHeap();

	int bufferSize = mLangHeap->getFreeSize();
	u8* langBuffer = new u8[bufferSize];
	memset(langBuffer, 0xCD, bufferSize);
	delete[] langBuffer;

	setupMessage();

	OSReport("Message FreeSize:%d \n", (int)mLangHeap->getFreeSize() >> 10);
	prevHeap->becomeCurrentHeap();
}

/**
 * @note Address: 0x804380C4
 * @note Size: 0x100
 */
void Mgr::setupMessage()
{
	JKRArchive* msgarc = JKRMountArchive(getCurrentMesResName(), JKRArchive::EMM_Mem, nullptr, JKRArchive::EMD_Head);
	P2ASSERTLINE(306, msgarc);

	mResContainer      = new JMessage::TResourceContainer;
	mMsgRef            = new TReference;
	mMsgRef->mResource = mResContainer;

	setupMessageResource(msgarc, "pikmin2.bmg");
	setupColor(msgarc, "pikmin2.bmc");
}

/**
 * @note Address: 0x804381C4
 * @note Size: 0xF8
 */
void Mgr::setupTex()
{
	JKRArchive* imgarc = JKRMountArchive("user/Yamashita/arc/gameTex.szs", JKRArchive::EMM_Mem, nullptr, JKRArchive::EMD_Head);
	createImage(ImageGroup::ID0, 11);

	ResTIMG* timg;
	for (int i = 0; i < mMaxTextures[0]; i++) {
		// dont even ask.
		timg = (ResTIMG*)JKRGetArchiveImageResource(imgarc, cBtnTexName[i]);
		P2ASSERTLINE(350, timg);
		setImage(ImageGroup::ID0, i, new JUTTexture(timg));
	}
}

/**
 * @note Address: 0x804382BC
 * @note Size: 0x248
 */
void Mgr::setupFont(char const* path, JKRExpHeap* heap)
{
	// Japanese uses a separate font loading system since it's so big
	if (sys->getLanguage() == System::LANG_Japanese) {
		JKRAram::sAramObject->mAramHeap->getFreeSize();

		JKRArchive* fontarc = JKRMountArchive(getCurrentFontResName(), JKRArchive::EMM_Mem, heap, JKRArchive::EMD_Tail);
		P2ASSERTLINE(374, fontarc);
		sys->heapStatusStart("cacheFont", nullptr);

		ResFONT* file = static_cast<ResFONT*>(fontarc->getResource(path));
		P2ASSERTLINE(377, file);

		mFont = new JUTCacheFont(file, 0x4c2c0, JKRGetCurrentHeap());
		P2ASSERTLINE(380, mFont);

		sys->heapStatusEnd("cacheFont");

		P2ASSERTLINE(384, mFont->mIsValid);
		static_cast<JUTCacheFont*>(mFont)->mPagingType = JUTCacheFont::CFPAGETYPE_Unk1;
		static_cast<JUTCacheFont*>(mFont)->loadCache_string("\tあいうえおかきくけこさしすせそたちすてとなにぬねのはひすへほまみむめもやゆよ"
		                                                    "わん\tアイウエオカキクケコサシスセソ\タチツテトナ"
		                                                    "ニヌネノハヒフヘホマミムメモヤユヨワン\t",
		                                                    true); // this is just all the characters in the japanese font sheet lol
		delete file;
		fontarc->unmount();
	} else {
		JKRArchive* fontarc = JKRMountArchive(getCurrentFontResName(), JKRArchive::EMM_Mem, JKRGetCurrentHeap(), JKRArchive::EMD_Head);
		P2ASSERTLINE(413, fontarc);

		sys->heapStatusStart("resFont", nullptr);

		ResFONT* file = static_cast<ResFONT*>(fontarc->getResource(path));

		mFont = new JUTResFont(file, JKRGetCurrentHeap());

		sys->heapStatusEnd("resFont");
	}
}

/**
 * @note Address: 0x80438504
 * @note Size: 0x1A8
 */
void Mgr::createImage(ImageGroup::EID group, int max)
{
	P2ASSERTBOUNDSLINE(429, 0, group, 1);
	P2ASSERTLINE(432, !mImageLists[group]);
	mMaxTextures[group] = max;
	mImageLists[group]  = new JUTTexture*[max];

	for (int i = 0; i < max; i++) {
		mImageLists[group][i] = nullptr;
	}
}

/**
 * @note Address: 0x804386AC
 * @note Size: 0xC4
 */
void Mgr::setImage(ImageGroup::EID group, int id, JUTTexture* tex)
{
	P2ASSERTBOUNDSLINE(448, 0, group, 1);
	P2ASSERTLINE(450, mMaxTextures[group] > id);

	mImageLists[group][id] = tex;
}

/**
 * @note Address: 0x80438770
 * @note Size: 0xB8
 */
JUTTexture* Mgr::getImage(ImageGroup::EID group, int id)
{
	P2ASSERTBOUNDSLINE(462, 0, group, 1);
	P2ASSERTLINE(464, mMaxTextures[group] > id);

	return mImageLists[group][id];
}

/**
 * @note Address: 0x80438828
 * @note Size: 0x104
 */
void Mgr::setupMessageResource(JKRArchive* arc, char const* path)
{
	sys->heapStatusStart("bmg", nullptr);
	const void* file = arc->getResource(path);
	P2ASSERTLINE(480, file);
	sys->heapStatusEnd("bmg");

	sys->heapStatusStart("メッセージのパース", nullptr); // "Message Parsing"
	JMessage::TParse parse(mResContainer);
	P2ASSERTLINE(490, parse.parse(file, 0));
	sys->heapStatusEnd("メッセージのパース"); // "Message Parsing"
}

/**
 * @note Address: 0x8043892C
 * @note Size: 0xE0
 */
bool Mgr::setupColor(JKRArchive* arc, char const* path)
{
	const void* file = arc->getResource(path);
	P2ASSERTLINE(507, file);

	sys->heapStatusStart("メッセージカラーのパース", nullptr); // "Message Parsing"
	JMessage::TParse_color parse(mResContainer);
	bool success = parse.parse(file, 0x20);
	P2ASSERTLINE(516, success);
	sys->heapStatusEnd("メッセージカラーのパース"); // "Message Parsing"
	return success;
}

} // namespace P2JME
