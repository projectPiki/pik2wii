#include "Controller.h"
#include "Game/BirthMgr.h"
#include "Game/DeathMgr.h"
#include "Game/Entities/PelletCarcass.h"
#include "Game/Entities/PelletItem.h"
#include "Game/Entities/PelletOtakara.h"
#include "Game/GameSystem.h"
#include "Game/MapMgr.h"
#include "Game/ResultTexMgr.h"
#include "Game/SingleGame.h"
#include "Game/generalEnemyMgr.h"
#include "P2Macros.h"
#include "PSM/Global.h"
#include "Screen/Game2DMgr.h"
#include "System.h"
#include "TParticle2dMgr.h"
#include "kh/khCaveResult.h"
#include "nans.h"

// TODO: fix this up
static void __Print(const char** fmt, ...)
{
	*fmt = "SingleGS_CaveResult";
}

namespace Game {
namespace SingleGame {

/**
 * @note Address: 0x8021AC20
 * @note Size: 0xF8
 * __ct
 */
CaveResultState::CaveResultState()
    : State(SGS_CaveResult)
{
	mController   = new Controller(0);
	mLoadCallback = new Delegate<CaveResultState>(this, &loadResource);
	mBackupHeap   = nullptr;
	mMainHeap     = nullptr;
}

/**
 * @note Address: 0x8021AD18
 * @note Size: 0x124
 */
void CaveResultState::init(SingleGameSection* section, StateArg* arg)
{
	playData->mCavePokoCount = 0;
	gameSystem->detachObjectMgr(generalEnemyMgr);
	gameSystem->detachObjectMgr(mapMgr);
	gameSystem->setPause(true, "caver-init", 3);

	Screen::gGame2DMgr->mScreenMgr->reset();
	Screen::gGame2DMgr->setGamePad(mController);
	mSection = section;

	P2ASSERTLINE(284, arg);
	mGameState = static_cast<CaveResultArg*>(arg)->mGameState;

	mResultTextures = nullptr;
	section->refreshHIO();
	accountEarnings(section, playData->mCaveCropMemory, true);

	mStatus        = 0;
	mResultTexHeap = nullptr;
	PSMCancelToPauseOffMainBgm();
}

/**
 * @note Address: N/A
 * @note Size: 0x7C
 */
void CaveResultState::initNext(SingleGameSection* section)
{
	// UNUSED FUNCTION
}

/**
 * @note Address: 0x8021AE3C
 * @note Size: 0x240
 */
void CaveResultState::loadResource()
{
	ResultTexMgr::Arg arg;
	arg.mHeap              = mMainHeap;
	arg.mOtakaraConfigList = PelletOtakara::mgr->mConfigList;
	arg.mItemConfigList    = PelletItem::mgr->mConfigList;

	mResultTexHeap  = arg.mHeap;
	mResultTextures = new ResultTexMgr::Mgr;
	mResultTextures->create(arg);

	JUTTexture* texture     = new JUTTexture(sys->getRenderModeWidth(), sys->getRenderModeHeight(), GX_TF_RGB565);
	texture->mMinFilter     = GX_NEAR;
	texture->mMagFilter     = GX_NEAR;
	mSection->mXfbTexture2d = texture;

	createResultNodes();

	PSGame::SceneInfo sceneInfo;
	sceneInfo.mSceneType = PSGame::SceneInfo::CAVE_RESULTS;
	sceneInfo.mCameras   = 0;
	PSMSetSceneInfo(sceneInfo);
	PSSystem::getSceneMgr()->doFirstLoad();
	PSMGetChildScene()->startMainSeq();
}

/**
 * @note Address: N/A
 * @note Size: 0x134
 */
void CaveResultState::open2D(Game::SingleGameSection* section)
{
	mStartTimer            = 1.0f;
	mStatus                = 2;
	section->mDisplayWiper = section->mWipeInFader;
	section->mWipeInFader->start(mStartTimer);
	playData->clearCurrentCave();
	PlayData* data            = playData;
	data->mLoadType           = STORYSAVE_Overworld;
	data->mBeforeSaveDelegate = nullptr;

	CourseInfo* courseInfo = section->getCurrentCourseInfo();
	P2ASSERTLINE(381, courseInfo);
	int otakaraNum = playData->getOtakaraNum_Course_CaveID(courseInfo->mCourseIndex, section->mCaveID);
	int otakaraMax = playData->getOtakaraMax_Course_CaveID(courseInfo->mCourseIndex, section->mCaveID);
	kh::Screen::DispCaveResult disp(&mResultNodes, DeathMgr::get_cave(DeathCounter::COD_All), otakaraNum, otakaraMax, playData->mPokoCount,
	                                playData->isStoryFlag(STORY_DebtPaid), mMainHeap, (mIsCaveComplete && otakaraNum >= otakaraMax));
	DeathMgr::account_cave();
	BirthMgr::account_cave();
	JUT_ASSERTLINE(408, Screen::gGame2DMgr->open_CaveResult(disp), "cannot open caveresult\n");
}

/**
 * @note Address: 0x8021B07C
 * @note Size: 0x2E8
 */
void CaveResultState::exec(SingleGameSection* section)
{
	switch (mStatus) {
	case 0:
		section->clearHeap();
		mBackupHeap = JKRHeap::sCurrentHeap;
		mMainHeap   = JKRExpHeap::create(mBackupHeap->getFreeSize(), mBackupHeap, true);
		mMainHeap->becomeCurrentHeap();
		mStatus = 1;
		sys->dvdLoadUseCallBack(&mDvdThread, mLoadCallback);
		return;
	case 1:
		if (mDvdThread.mMode == DvdThreadCommand::CM_Completed) {
			open2D(section);
		}
		return;
	case 2:
		mStartTimer -= sys->getDeltaTime();
		if (mStartTimer < 0.0f) {
			mStatus = 3;
		}
		break;

	case 3:
		switch (Screen::gGame2DMgr->check_CaveResult()) {
		case Screen::Game2DMgr::CHECK2D_CaveResult_Finished:
			LoadArg arg(mGameState, false, true, false);
			section->loadMainMapSituation();
			transit(section, SGS_Load, &arg);
			return;
		}
		break;

	case 4:
		mStartTimer -= sys->getDeltaTime();
		if (mStartTimer < 0.0f) {
			LoadArg arg(mGameState, false, false, false);
			section->loadMainMapSituation();
			transit(section, SGS_Load, &arg);
			return;
		}
		break;
	}

	Screen::gGame2DMgr->update();
	particle2dMgr->update();
}

/**
 * @note Address: 0x8021B364
 * @note Size: 0xC0
 */
void CaveResultState::draw(SingleGameSection* section, Graphics& gfx)
{
	gfx.mOrthoGraph.setPort();
	if (1 < mStatus) {
		gfx.mPerspGraph.setPort();
		particle2dMgr->draw(1, 0);
		section->draw_Ogawa2D(gfx);
		gfx.mPerspGraph.setPort();
		particle2dMgr->draw(0, 0);
	}
}

/**
 * @note Address: 0x8021B424
 * @note Size: 0xC4
 */
void CaveResultState::cleanup(SingleGameSection* section)
{
	PSMGetSceneMgrCheck()->deleteCurrentScene();

	playData->mCaveCropMemory->clear();
	_14                     = 0;
	mSection->mXfbTexture2d = nullptr;
	mMainHeap->freeAll();
	mMainHeap->destroy();
	mMainHeap = nullptr;
	mBackupHeap->becomeCurrentHeap();
}

/**
 * @note Address: 0x8021B4E8
 * @note Size: 0x40C
 */
void CaveResultState::createResultNodes()
{
	mIsCaveComplete = 0;
	sys->startChangeCurrentHeap(mResultTexHeap);
	PelletCropMemory* cropMem = playData->mCaveCropMemory->createClone();
	PelletCarcass::Mgr* carcassMgr;
	PelletItem::Mgr* itemMgr;
	PelletOtakara::Mgr* otaMgr;

	if (mSection->mDoTrackCarcass) {
		carcassMgr           = PelletCarcass::mgr;
		KindCounter& counter = playData->mCaveCropMemory->mCarcass;
		for (int i = 0; i < counter.getNumKinds(); i++) {
			if (counter(i) && carcassMgr->getPelletConfig(i)) {
				counter(i) = 0;
			}
		}
	}

	playData->mMainCropMemory->addTo(playData->mCaveCropMemory);
	playData->mCaveCropMemory->clear();

	itemMgr              = PelletItem::mgr;
	KindCounter& counter = cropMem->mItem;
	for (int i = 0; i < counter.getNumKinds(); i++) {
		if (counter(i) || mSection->mItemCounter(i)) {
			mIsCaveComplete      = true;
			PelletConfig* config = itemMgr->getPelletConfig(i);
			int id               = PelletList::Mgr::getOffsetFromDictionaryNo(config->mParams.mDictionary.mData - 1);
			u64 tag              = Result::TNode::convertByMorimun(id);
			Result::TNode* node  = new Result::TNode;
			node->setTNode(tag, mResultTextures->getItemTexture(i), counter(i), config->getPokoValue() * counter(i), config->getPokoValue(),
			               mSection->mItemCounter(i));
			mResultNodes.add(node);
		}
	}

	otaMgr                = PelletOtakara::mgr;
	KindCounter& counter2 = cropMem->mOtakara;
	for (int i = 0; i < counter2.getNumKinds(); i++) {
		if (counter2(i) || mSection->mOtakaraCounter(i)) {
			mIsCaveComplete      = true;
			PelletConfig* config = otaMgr->getPelletConfig(i);
			int id               = PelletList::Mgr::getOffsetFromDictionaryNo(config->mParams.mDictionary.mData - 1);
			u64 tag              = Result::TNode::convertByMorimun(id);
			Result::TNode* node  = new Result::TNode;
			node->setTNode(tag, mResultTextures->getOtakaraTexture(i), counter2(i), config->getPokoValue() * counter2(i),
			               config->getPokoValue(), mSection->mOtakaraCounter(i));
			mResultNodes.add(node);
		}
	}

	carcassMgr            = PelletCarcass::mgr;
	KindCounter& counter3 = cropMem->mCarcass;
	int value             = 0;
	int num               = 0;
	for (int i = 0; i < counter3.getNumKinds(); i++) {
		if (counter3(i)) {
			PelletConfig* config = carcassMgr->getPelletConfig(i);
			num += counter3(i);
			value += counter3(i) * config->getPokoValue();
		}
	}
	if (num > 0) {
		Result::TNode* node = new Result::TNode;
		bool track          = mSection->mDoTrackCarcass ? true : false;
		JUTTexture* tex     = mResultTextures->getCarcassTexture();
		node->setTNode(0, tex, num, value, -1, track);
		mResultNodes.add(node);
	}

	sys->endChangeCurrentHeap();
	mSection->clearCaveOtakaraEarningsAndDrops();

	/*
	stwu     r1, -0x40(r1)
	mflr     r0
	stw      r0, 0x44(r1)
	li       r0, 0
	stmw     r20, 0x10(r1)
	mr       r31, r3
	stb      r0, 0xf8(r3)
	lwz      r3, sys@sda21(r13)
	lwz      r4, 0x74(r31)
	bl       startChangeCurrentHeap__6SystemFP7JKRHeap
	lwz      r3, playData__4Game@sda21(r13)
	lwz      r3, 0xb8(r3)
	bl       createClone__Q24Game16PelletCropMemoryFv
	lwz      r4, 0xec(r31)
	mr       r30, r3
	lbz      r0, 0x274(r4)
	cmplwi   r0, 0
	beq      lbl_8021B598
	lwz      r3, playData__4Game@sda21(r13)
	li       r23, 0
	lwz      r20, mgr__Q24Game13PelletCarcass@sda21(r13)
	li       r22, 0
	lwz      r3, 0xb8(r3)
	addi     r21, r3, 0x14
	b        lbl_8021B58C

lbl_8021B54C:
	mr       r3, r21
	mr       r4, r23
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	cmplwi   r0, 0
	beq      lbl_8021B588
	mr       r3, r20
	mr       r4, r23
	bl       getPelletConfig__Q24Game13BasePelletMgrFi
	cmplwi   r3, 0
	beq      lbl_8021B588
	mr       r3, r21
	mr       r4, r23
	bl       __cl__Q24Game11KindCounterFi
	stb      r22, 0(r3)

lbl_8021B588:
	addi     r23, r23, 1

lbl_8021B58C:
	lhz      r0, 0(r21)
	cmpw     r23, r0
	blt      lbl_8021B54C

lbl_8021B598:
	lwz      r4, playData__4Game@sda21(r13)
	lwz      r3, 0xb4(r4)
	lwz      r4, 0xb8(r4)
	bl       addTo__Q24Game16PelletCropMemoryFPQ24Game16PelletCropMemory
	lwz      r3, playData__4Game@sda21(r13)
	lwz      r3, 0xb8(r3)
	bl       clear__Q24Game16PelletCropMemoryFv
	lwz      r29, mgr__Q24Game10PelletItem@sda21(r13)
	addi     r28, r30, 0xc
	li       r27, 0
	b        lbl_8021B6C0

lbl_8021B5C4:
	mr       r3, r28
	mr       r4, r27
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	cmplwi   r0, 0
	bne      lbl_8021B5F8
	lwz      r3, 0xec(r31)
	mr       r4, r27
	addi     r3, r3, 0x26c
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	cmplwi   r0, 0
	beq      lbl_8021B6BC

lbl_8021B5F8:
	li       r0, 1
	mr       r3, r29
	stb      r0, 0xf8(r31)
	mr       r4, r27
	bl       getPelletConfig__Q24Game13BasePelletMgrFi
	mr       r22, r3
	lhz      r3, 0x254(r3)
	addi     r3, r3, -1
	bl       getOffsetFromDictionaryNo__Q34Game10PelletList3MgrFi
	bl       convertByMorimun__Q34Game6Result5TNodeFi
	mr       r0, r3
	mr       r25, r4
	li       r3, 0x50
	mr       r26, r0
	bl       __nw__FUl
	or.      r21, r3, r3
	beq      lbl_8021B644
	bl       __ct__Q34Game6Result5TNodeFv
	mr       r21, r3

lbl_8021B644:
	lwz      r3, 0xec(r31)
	mr       r4, r27
	lwz      r20, 0x170(r22)
	addi     r3, r3, 0x26c
	bl       __cl__Q24Game11KindCounterFi
	lbz      r24, 0(r3)
	mr       r3, r28
	mr       r4, r27
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	mr       r3, r28
	mr       r4, r27
	mullw    r23, r20, r0
	bl       __cl__Q24Game11KindCounterFi
	lbz      r22, 0(r3)
	mr       r4, r27
	lwz      r3, 0x70(r31)
	bl       getItemTexture__Q34Game12ResultTexMgr3MgrFi
	stw      r24, 8(r1)
	mr       r7, r3
	mr       r3, r21
	mr       r6, r25
	mr       r5, r26
	mr       r8, r22
	mr       r9, r23
	mr       r10, r20
	bl       setTNode__Q34Game6Result5TNodeFUxP10JUTTextureiiii
	mr       r4, r21
	addi     r3, r31, 0x20
	bl       add__Q24Game5DNodeFPQ24Game5DNode

lbl_8021B6BC:
	addi     r27, r27, 1

lbl_8021B6C0:
	lhz      r0, 0(r28)
	cmpw     r27, r0
	blt      lbl_8021B5C4
	lwz      r29, mgr__Q24Game13PelletOtakara@sda21(r13)
	addi     r25, r30, 4
	li       r26, 0
	b        lbl_8021B7D8

lbl_8021B6DC:
	mr       r3, r25
	mr       r4, r26
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	cmplwi   r0, 0
	bne      lbl_8021B710
	lwz      r3, 0xec(r31)
	mr       r4, r26
	addi     r3, r3, 0x264
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	cmplwi   r0, 0
	beq      lbl_8021B7D4

lbl_8021B710:
	li       r0, 1
	mr       r3, r29
	stb      r0, 0xf8(r31)
	mr       r4, r26
	bl       getPelletConfig__Q24Game13BasePelletMgrFi
	mr       r22, r3
	lhz      r3, 0x254(r3)
	addi     r3, r3, -1
	bl       getOffsetFromDictionaryNo__Q34Game10PelletList3MgrFi
	bl       convertByMorimun__Q34Game6Result5TNodeFi
	mr       r0, r3
	mr       r28, r4
	li       r3, 0x50
	mr       r27, r0
	bl       __nw__FUl
	or.      r21, r3, r3
	beq      lbl_8021B75C
	bl       __ct__Q34Game6Result5TNodeFv
	mr       r21, r3

lbl_8021B75C:
	lwz      r3, 0xec(r31)
	mr       r4, r26
	lwz      r20, 0x170(r22)
	addi     r3, r3, 0x264
	bl       __cl__Q24Game11KindCounterFi
	lbz      r22, 0(r3)
	mr       r3, r25
	mr       r4, r26
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	mr       r3, r25
	mr       r4, r26
	mullw    r23, r20, r0
	bl       __cl__Q24Game11KindCounterFi
	lbz      r24, 0(r3)
	mr       r4, r26
	lwz      r3, 0x70(r31)
	bl       getOtakaraTexture__Q34Game12ResultTexMgr3MgrFi
	stw      r22, 8(r1)
	mr       r7, r3
	mr       r3, r21
	mr       r6, r28
	mr       r5, r27
	mr       r8, r24
	mr       r9, r23
	mr       r10, r20
	bl       setTNode__Q34Game6Result5TNodeFUxP10JUTTextureiiii
	mr       r4, r21
	addi     r3, r31, 0x20
	bl       add__Q24Game5DNodeFPQ24Game5DNode

lbl_8021B7D4:
	addi     r26, r26, 1

lbl_8021B7D8:
	lhz      r0, 0(r25)
	cmpw     r26, r0
	blt      lbl_8021B6DC
	lwz      r20, mgr__Q24Game13PelletCarcass@sda21(r13)
	addi     r22, r30, 0x14
	li       r25, 0
	li       r26, 0
	li       r23, 0
	b        lbl_8021B858

lbl_8021B7FC:
	mr       r3, r22
	mr       r4, r23
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	cmplwi   r0, 0
	beq      lbl_8021B854
	mr       r3, r20
	mr       r4, r23
	bl       getPelletConfig__Q24Game13BasePelletMgrFi
	mr       r27, r3
	mr       r3, r22
	mr       r4, r23
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	mr       r3, r22
	lwz      r21, 0x170(r27)
	mr       r4, r23
	add      r26, r26, r0
	bl       __cl__Q24Game11KindCounterFi
	lbz      r0, 0(r3)
	mullw    r0, r0, r21
	add      r25, r25, r0

lbl_8021B854:
	addi     r23, r23, 1

lbl_8021B858:
	lhz      r0, 0(r22)
	cmpw     r23, r0
	blt      lbl_8021B7FC
	cmpwi    r26, 0
	ble      lbl_8021B8D0
	li       r3, 0x50
	bl       __nw__FUl
	or.      r21, r3, r3
	beq      lbl_8021B884
	bl       __ct__Q34Game6Result5TNodeFv
	mr       r21, r3

lbl_8021B884:
	lwz      r4, 0xec(r31)
	lwz      r3, 0x70(r31)
	lbz      r4, 0x274(r4)
	neg      r0, r4
	or       r0, r0, r4
	srwi     r22, r0, 0x1f
	bl       getCarcassTexture__Q34Game12ResultTexMgr3MgrFv
	stw      r22, 8(r1)
	mr       r7, r3
	mr       r3, r21
	mr       r8, r26
	mr       r9, r25
	li       r6, 0
	li       r5, 0
	li       r10, -1
	bl       setTNode__Q34Game6Result5TNodeFUxP10JUTTextureiiii
	mr       r4, r21
	addi     r3, r31, 0x20
	bl       add__Q24Game5DNodeFPQ24Game5DNode

lbl_8021B8D0:
	lwz      r3, sys@sda21(r13)
	bl       endChangeCurrentHeap__6SystemFv
	lwz      r3, 0xec(r31)
	bl       clearCaveOtakaraEarningsAndDrops__Q24Game17SingleGameSectionFv
	lmw      r20, 0x10(r1)
	lwz      r0, 0x44(r1)
	mtlr     r0
	addi     r1, r1, 0x40
	blr
	*/
}

} // namespace SingleGame
} // namespace Game
