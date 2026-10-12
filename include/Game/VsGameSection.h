#ifndef _GAME_VSGAMESECTION_H
#define _GAME_VSGAMESECTION_H

#include "types.h"
#include "Game/BaseGameSection.h"
#include "Game/ChallengeGame.h"
#include "Vector3.h"
#include "VSFifo.h"
#include "Game/VsGameSection.h"
#include "Game/Entities/ItemBigFountain.h"
#include "Game/Entities/ItemHole.h"

#define VS_YELLOW_MARBLE_NUM 7

#define VS_CHERRY_MAX_COUNT 10

#define VS_CHERRY_MIN_WEIGHT 1
#define VS_CHERRY_MAX_WEIGHT 1

#define VS_MARBLE_MIN_WEIGHT 1
#define VS_MARBLE_MAX_WEIGHT 8

#define VS_WIN_YELLOW_MARBLE_NUM 4

#define VS_PIKMIN_HANDICAP_MULTIPLIER    5
#define VS_PIKMIN_HANDICAP_DEFAULT_VALUE 2

#define VS_SHEARWIG_SPAWN_RADIUS      20.0f
#define VS_CHERRY_SPAWN_RANDOM_OFFSET 20.0f

struct Controller;

namespace Game {
struct PikiContainer;
struct MovieConfig;

namespace ItemHole {
struct Item;
} // namespace ItemHole

namespace ItemBigFountain {
struct Item;
} // namespace ItemBigFountain

namespace VsGame {
struct TekiMgr;
struct CardMgr;
struct StageData;
struct StageList;
struct State;
} // namespace VsGame

struct VsGameSection : public BaseGameSection {
	typedef VsGame::State StateType;
	struct DropCardArg {
		f32 mDropMinDistance;     // _00
		f32 mDropMaximumDistance; // _04
	};

	enum MenuFlags {
		VsSection_MenuCaveMoreOpen = 2,
		VsSection_MenuKanketuOpen  = 4,
	};

	VsGameSection(JKRHeap*, bool);

	virtual ~VsGameSection();                                              // _08
	virtual bool doUpdate();                                               // _3C
	virtual void doDraw(Graphics& gfx);                                    // _40
	virtual bool sendMessage(GameMessage&);                                // _50
	virtual void pre2dDraw(Graphics&);                                     // _54
	virtual int getCurrFloor();                                            // _58
	virtual void addChallengeScore(int);                                   // _60
	virtual void startMainBgm();                                           // _64
	virtual void section_fadeout();                                        // _68
	virtual void goNextFloor(ItemHole::Item*);                             // _6C
	virtual bool challengeDisablePelplant() { return false; }              // _80 (weak)
	virtual bool player2enabled() { return true; }                         // _134 (weak)
	virtual char* getCaveFilename() { return mCaveInfoFilename; }          // _84 (weak)
	virtual char* getEditorFilename() { return mEditFilename; }            // _88 (weak)
	virtual int getVsEditNumber() { return mEditNumber; }                  // _8C (weak)
	virtual void onMovieStart(MovieConfig* movie, u32 unused, u32 naviID); // _B0
	virtual void onMovieDone(MovieConfig*, u32, u32);                      // _B4
	virtual void gmOrimaDown(int);                                         // _D0
	virtual void gmPikminZero();                                           // _D4
	virtual void openCaveMoreMenu(ItemHole::Item*, Controller*);           // _DC
	virtual void openKanketuMenu(ItemBigFountain::Item*, Controller*);     // _E0
	virtual void onInit();                                                 // _F0
	virtual void onSetupFloatMemory();                                     // _120
	virtual void postSetupFloatMemory();                                   // _124
	virtual void onSetSoundScene();                                        // _128
	virtual void onClearHeap();                                            // _130

	void calcVsScores();
	void clearCaveMenus();
	void clearGetCherryCount();
	void clearGetDopeCount();
	void createFallPikmins(PikiContainer&, int);
	void createRedBlueBedamas(Vector3f&);
	void createVsPikmins();
	void createYellowBedamas(int);
	void dropCard(DropCardArg&);
	int& getGetCherryCount(int);
	int& getGetDopeCount(int, int);
	void initCardGeneration();
	void initCardPellets();
	void initPlayData();
	void loadChallengeStageList();
	void loadVsStageList();
	void updateCardGeneration();
	bool updateCaveMenus();
	void useCard();

	inline void setCurrState(StateType* state) { mCurrentState = state; }
	inline StateType* getCurrState() { return mCurrentState; }

	Pellet* createCardPellet();

	static int mRedWinCount;
	static int mBlueWinCount;
	static int mDrawCount;

	bool mIsVersusMode;                            // _178
	VSFifo* mVsFifo;                               // _17C
	StateMachine<Game::VsGameSection>* mFsm;       // _180
	VsGame::State* mCurrentState;                  // _184
	DvdThreadCommand mDvdThreadCommand;            // _188
	f32 mGhostIconTimers[2];                       // _1F4
	BitFlag<u8> mMenuFlags;                        // _1FC
	struct ItemHole::Item* mHole;                  // _200
	struct ItemBigFountain::Item* mFountain;       // _204
	bool mIsMenuRunning;                           // _208
	bool mIsChallengePerfect;                      // _209
	int mDeadPikiCount;                            // _20C - pikmin spawn queue
	ChallengeGame::StageList* mChallengeStageList; // _210
	VsGame::StageList* mVsStageList;               // _214
	PikiContainer mContainer1;                     // _218
	PikiContainer mContainer2;                     // _220
	char mCaveInfoFilename[128];                   // _24C
	char mEditFilename[128];                       // _2A8
	int mCurrentFloor;                             // _328
	int mEditNumber;                               // _32C
	VsGame::TekiMgr* mTekiMgr;                     // _330
	VsGame::CardMgr* mCardMgr;                     // _334
	ChallengeGame::StageData* mChallengeStageData; // _338
	int mChallengeStageNum;                        // _33C
	VsGame::StageData* mVsStageData;               // _340
	int mVsStageNum;                               // _344
	int mOlimarHandicap;                           // _348
	int mLouieHandicap;                            // _34C
	int mVsWinner;                                 // _350
	f32 mPikminRatio;                              // _354
	f32 mPikminCountTimer;                         // _358
	f32 mRedBlueYellowScore[2];                    // _35C
	f32 mCherryScore[2];                           // _364
	f32 mMaxCherryScore[2];                        // _36C
	f32 mYellowScore[2];                           // _374
	f32 mRedBlueScore[2];                          // _37C
	Pellet* mMarbleRedBlue[2];                     // _384
	Pellet* mMarbleYellow[VS_YELLOW_MARBLE_NUM];   // _38C
	int mDopeCounts[2][2];                         // _3A8
	int mPlayer2Cherries;                          // _3B8
	int mPlayer1Cherries;                          // _3BC
	int mPokoCount;                                // _3C0
	f32 mTimeLimit;                                // _3C4
	int mCardCount;                                // _3C8
	f32 mSpawnTimer;                               // _3CC
	int mMaxCherries;                              // _3D0
	Pellet** mCherryArray;                         // _3D4
	int mMarbleCount[2];                           // _3D8
	int mYellowMarbleCounts[2];                    // _3E0
};
} // namespace Game

#endif
