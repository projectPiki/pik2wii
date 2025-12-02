#ifndef _GAME_NAVI_H
#define _GAME_NAVI_H

#include "BitFlag.h"
#include "CollInfo.h"
#include "Color4.h"
#include "Game/FakePiki.h"
#include "Game/GameSystem.h"
#include "Game/PelletView.h"
#include "Game/StateMachine.h"
#include "Game/gamePlayData.h"
#include "Game/gameStat.h"
#include "JSystem/J2D/J2DGrafContext.h"
#include "JSystem/J3D/J3DModel.h"
#include "JSystem/J3D/J3DMtxCalc.h"
#include "JSystem/JAudio/JAI/JAInter/Object.h"
#include "JSystem/JSupport/JSUList.h"
#include "MonoObjectMgr.h"
#include "RevoSDK/mtx.h"
#include "Sys/MatBaseAnimation.h"
#include "SysShape/Joint.h"
#include "SysShape/Model.h"
#include "Vector3.h"
#include "efx/TNaviEffect.h"

struct Controller;

enum NaviIndex {
	NAVIID_Olimar      = 0,
	NAVIID_Louie       = 1, // or president
	NAVIID_Multiplayer = 2,
	NAVIID_Both        = 2,
};

enum AliveOrimaType {
	ALIVEORIMA_Active   = 0,
	ALIVEORIMA_Inactive = 1,
};

#define GET_OTHER_NAVI(navi) (1 - (navi)->mNaviIndex)

#define CG_NAVIPARMS(navi) (static_cast<NaviParms*>(navi->mParms)->mNaviParms)
#define C_NAVIPARMS        (CG_NAVIPARMS(this))

// Louie scale is also used for president
#define OLIMAR_SCALE 1.3f
#define LOUIE_SCALE  1.5f

namespace PSM {
struct DirectorUpdator;
struct Navi;
} // namespace PSM

namespace Game {
struct CPlate;
struct NaviNukuAdjustStateArg;
struct NaviState;
struct NaviParms;

namespace ItemPikihead {
struct Item;
}

enum NaviControlFlags {
	NAVICTRL_InMovie = 0x1,
	NAVICTRL_InOnyon = 0x2,
};

struct NaviFSM : public StateMachine<Navi> {
	virtual void init(Navi*);                    // _08
	virtual void transit(Navi*, int, StateArg*); // _14

	// _00     = VTBL
	// _00-_1C = StateMachine
	int mBackupStateID; // _1C
};

struct NaviWhistle {
	NaviWhistle(Navi*);

	enum WhistleState {
		WS_Idle,
		WS_Blowing,
		WS_Ended,
	};

	void init();
	void updatePosition();
	void start();
	void stop();
	bool timeout();
	void setFaceDir(f32);
	void updateWhistle();
	void update(Vector3f&, bool);

	inline f32 getTimePercentage();

	inline Vector3f getPosition() const { return mPosition; }

	Vector3f mNaviOffsetVec; // _00
	Vector3f mPosition;      // _0C
	Vector3f mNormal;        // _18
	f32 mRadius;             // _24
	u16 mState;              // _28
	f32 mActiveTime;         // _2C
	bool mIsWhistleActive;   // _30
	Navi* mNavi;             // _34
	Color4 mColor;           // _38
};

#define NAVI_THROWTIMER_LENGTH (10)

struct Navi : public FakePiki, virtual public PelletView {
	typedef NaviState StateType;
	Navi();

	// vtable 1 (Creature)
	virtual Vector3f getPosition();                                     // _08
	virtual void onInit(CreatureInitArg* settings);                     // _30
	virtual void onKill(CreatureKillArg* settings);                     // _34
	virtual void doAnimation();                                         // _3C
	virtual void doEntry();                                             // _40
	virtual void doSetView(int viewportNumber);                         // _44
	virtual void doViewCalc();                                          // _48
	virtual void doSimulation(f32);                                     // _4C
	virtual void doDirectDraw(Graphics& gfx);                           // _50
	virtual void setVelocity(Vector3f& vel) { mTargetVelocity = vel; }  // _68 (weak)
	virtual void onSetPosition(Vector3f& dest);                         // _70
	virtual void inWaterCallback(WaterBox* wb);                         // _84
	virtual void outWaterCallback();                                    // _88
	virtual void bounceCallback(Sys::Triangle* tri);                    // _E8
	virtual void collisionCallback(CollEvent& event);                   // _EC
	virtual void platCallback(PlatEvent& event);                        // _F0
	virtual JAInter::Object* getJAIObject();                            // _F4
	virtual PSM::Creature* getPSCreature();                             // _F8
	virtual void on_movie_begin(bool shouldResetAnims);                 // _110
	virtual void on_movie_end(bool shouldResetAnims);                   // _114
	virtual void movieStartAnimation(u32 animIdx);                      // _118
	virtual void movieStartDemoAnimation(SysShape::AnimInfo* info);     // _11C
	virtual void movieSetTranslation(Vector3f& dest, f32 faceDir);      // _124
	virtual void movieSetFaceDir(f32);                                  // _128
	virtual bool movieGotoPosition(Vector3f& dest);                     // _12C
	virtual void movieUserCommand(u32 command, MoviePlayer* curPlayer); // _130
	virtual void getShadowParam(ShadowParam& settings);                 // _134
	virtual void getLODSphere(Sys::Sphere& lodSphere);                  // _140
	virtual void onStickStart(Creature*);                               // _158
	virtual void onStickEnd(Creature*);                                 // _15C
	virtual bool ignoreAtari(Creature* toIgnore);                       // _190
	virtual bool stimulate(Interaction& data);                          // _1A4
	virtual char* getCreatureName() { return "navi"; }                  // _1A8 (weak)
	virtual s32 getCreatureID() { return mNaviIndex; }                  // _1AC (weak)

	// vtable 2 (MotionListener + FakePiki + self)
	virtual int getDownfloorMass();                           // _1BC
	virtual void update();                                    // _1CC
	virtual f32 getMapCollisionRadius();                      // _200
	virtual void wallCallback(Vector3f& pos);                 // _204
	virtual void onKeyEvent(const SysShape::KeyEvent& event); // _20C (weak)
	virtual void do_updateLookCreature();                     // _214
	virtual bool isWalking();                                 // _21C
	virtual void viewEntryShape(Matrixf&, Vector3f&);         // _220 (weak)
	virtual SysShape::Model* viewGetShape();                  // _224 (weak)
	virtual f32 viewGetBaseScale();                           // _228 (weak)
	virtual void transit(int, StateArg*);                     // _22C

	// vtable 3 (PelletView) gets a few methods thunked by methods in vtable 2,
	// but no direct overrides.

	void addDamage(f32, bool);
	void applyDopes(int, Vector3f&);
	void applyDopeSmoke(CellObject*);
	void callPikis();
	ItemBigFountain::Item* checkBigFountain();
	ItemCave::Item* checkCave();
	FakePiki* checkDemoNaviAndPiki(Sys::Sphere&);
	ItemHole::Item* checkHole();
	Onyon* checkOnyon();
	void clearKaisanDisable();
	void clearThrowDisable();
	bool commandOn();
	void control();
	bool demoCheck();
	void demowaitAllPikis();
	void disableController();
	void enterAllPikis();
	void findNextThrowPiki();
	bool formationable();
	void fountainonAllPikis(Vector3f&);
	int getDopeCount(int);
	f32 getLifeRatio();
	OlimarData* getOlimarData();
	int getStateID();
	bool hasDope(int);
	void holeinAllPikis(Vector3f&);

	// Increase the amount of sprays in sprayType (use enum SPRAY_TYPE)
	void incDopeCount(int sprayType);
	bool invincible();
	bool isCStickNetural();
	void makeCStick(bool);
	void makeVelocity();
	u32 ogGetNextThrowPiki();
	bool procActionButton();
	bool releasePikis();
	void reviseController(Vector3f&);
	void set_movie_draw(bool);
	void setDeadLaydown();
	void setInvincibleTimer(u8);
	void setLifeMax();
	void setupNukuAdjustArg(ItemPikihead::Item*, NaviNukuAdjustStateArg&);
	void startDamage(f32);
	void startThrowDisable();
	bool throwable();
	void throwPiki(Piki*, Vector3f&);
	void updateCursor();
	void updateKaisanDisable();
	void updateThrowDisable();
	void useDope(int);

	inline void setCalcs()
	{
		SysShape::Model* model = mModel;
		model->loopTimer();
		mAnimator.mBoundAnimator.setModelCalc(model, 0);
	}

	inline void setCamera(PlayCamera* cam)
	{
		mCamera  = cam;
		mCamera2 = cam;
	}

	inline void setController(Controller* control)
	{
		mController1 = control;
		mController2 = control;
	}

	inline int getNaviID() { return mNaviIndex; }

	// inline NaviState* getCurrentState() { return mCurrentState; }

	inline void setControlFlag(u16 flag) { mNaviControlFlag.typeView |= flag; }
	inline void resetControlFlag(u16 flag) { mNaviControlFlag.typeView &= ~flag; }
	inline bool isControlFlag(u16 flag) { return mNaviControlFlag.typeView & flag; }

	inline void setCurrState(StateType* state) { mCurrentState = state; }
	inline StateType* getCurrState() { return mCurrentState; }
	inline struct NaviParms* getParms() { return static_cast<NaviParms*>(mParms); }

	// _000      = VTBL
	// _000-_254 = FakePiki
	// _254-_258 = ptr to PelletView
	u8 _258[0x18];                          // _258, unknown, new in Wii version
	CPlate* mCPlateMgr;                     // _270
	u8 mPlateScaleTimer;                    // _274
	u8 mStickCount;                         // _275
	s32 mSprayCounts[2];                    // _278 proven signed by Navi::hasDope
	u8 _264[4];                             // _280
	bool mHideModel;                        // _284
	u8 mUnusedFlag;                         // _285
	u8 mPluckingCounter;                    // _286
	PSM::Navi* mSoundObj;                   // _288
	NaviFSM* mFsm;                          // _28C
	NaviState* mCurrentState;               // _290
	Controller* mController1;               // _294
	Controller* mController2;               // _298
	PlayCamera* mCamera;                    // _29C
	PlayCamera* mCamera2;                   // _2A0
	BitFlag<u16> mNaviControlFlag;          // _2A4
	NaviWhistle* mWhistle;                  // _2A8
	SysShape::Model* mMarkerModel;          // _2AC
	SysShape::Model* mCursorModel;          // _2B0
	u8 _2B4[4];                             // _2B4, unknown location, but before mCursorMatAnim
	Sys::MatRepeatAnimator* mCursorMatAnim; // _2B8
	Sys::MatLoopAnimator* mArrowMatAnim;    // _2BC
	f32 mHealth;                            // _2C0
	u8 mInvincibleTimer;                    // _2C4
	Piki* mNextThrowPiki;                   // _2C8
	u8 mUnusedFlag2;                        // _2CC
	f32 mHoldPikiTimer;                     // _2D0
	f32 mHoldPikiCharge;                    // _2D4, neither charge is used for anything
	f32 mHoldPikiCharge2;                   // _2D8
	u8 mThrowTimer;                         // _2DC, use NAVI_THROWSTATE enum
	SysShape::Joint* mBeaconJoint;          // _2E0
	Vector3f mBeaconPosition;               // _2E4
	efx::TNaviEffect* mEffectsObj;          // _2F0
	s8 mDisbandTimer;                       // _2F4
	Footmarks* mFootmarks;                  // _2F8
	u16 mNaviIndex;                         // _2FC
	u8 _2DE;                                // _2FE
	Vector3f mCStickTargetVector;           // _300
	Vector3f mCStickPosition;               // _30C
	f32 mCStickAngle;                       // _318
	u8 _2FC;                                // _31C
	u8 _2FD;                                // _31D
	int mCStickState;                       // _320
	int mCStickIncrement;                   // _324
	f32 mSceneAnimationTimer;               // _328
	bool mCommandOn1;                       // _32C
	bool mCommandOn2;                       // _32D
	                                        // PelletView: _330 - _340
};

struct NaviMgr : public MonoObjectMgr<Navi>, public JKRDisposer {
	NaviMgr();

	// vtable 1 (CNode, _00)
	virtual ~NaviMgr(); // _08 (weak)

	// vtable 2 (MonoObjectMgr, _00)
	virtual void doAnimation();          // _64 (thunk at _34)
	virtual void doEntry();              // _68 (thunk at _38)
	virtual void doSimulation(f32 rate); // _74 (thunk at _44)
	virtual Navi* birth();               // _7C
	virtual void resetMgr();             // _80 (thunk at _54)

	// vtable 3 (JKRDisposer + self, _30)
	virtual void killAll();                          // _98
	virtual char* getMgrName() { return "NaviMgr"; } // _9C (weak)
	virtual bool frozenable() { return false; }      // _A0 (weak, thunk at _5C in vt 2)
	virtual void loadResources();                    // _A4 (thunk at _50 in vt 2)

	void clearDeadCount();
	SysShape::Model* createModel(int naviID);
	void createPSMDirectorUpdator();
	Navi* getActiveNavi();
	int getAliveCount();
	Navi* getAliveOrima(int aliveOrimaType); // see AliveOrimaType enum; 0 = get active, 1 = get inactive
	Navi* getDeadOrima(int deadID);          // 0 for first dead, 1 for second dead
	void informOrimaDead(int naviID);
	void load();
	void loadResources_float();
	void setMovieDraw(bool isMoviePlaying);
	void setupSoundViewerAndBas();
	void setupNavi(Navi* navi);

	// Unused/inlined:
	void init();
	Navi* getSurviveNavi();
	void draw2d(J2DGrafContext&);

	static SysShape::AnimMgr* animMgr;

	// _00     = VTBL 1 + 2
	// _00-_30 = MonoObjectMgr
	// _30     = VTBL 3
	// _30-_48 = JKRDisposer
	PSM::DirectorUpdator* mBackupPSMMgr;     // _48 (appears to be completely unused)
	PSM::DirectorUpdator* mPSMMgr;           // _4C (used for damage taking bgm mix)
	int mDeadNavis;                          // _50
	int mNaviDeadFlags[2];                   // _54 (seems to translate the order of killed captains to their ids?)
	BitFlag<u8> mFlags;                      // _5C
	Sys::MatTevRegAnimation mCursorAnims[2]; // _60
	Sys::MatTevRegAnimation mMarkerAnims[2]; // _88
	J3DModelData* mOlimarModel;              // _B0
	J3DModelData* mLouieModel;               // _B4 (also president model)
	J3DModelData* mCursorModelData;          // _B8
	u8 _BC[8];                               // _BC, unused?
	J3DModelData* mMarkerModelData;          // _C4
	NaviParms* mNaviParms;                   // _C8
	CollPartFactory* mCollData;              // _CC
};

extern NaviMgr* naviMgr;
} // namespace Game

namespace og {
namespace Screen {
void DataNavi::update(int naviIdx)
{
	Game::Navi* navi = Game::naviMgr->getAt(naviIdx);
	mFollowPikis     = Game::GameStat::formationPikis.mCounter[naviIdx];
	mNextThrowPiki   = navi->ogGetNextThrowPiki();
	mDope1Count      = navi->getDopeCount(1);
	mDope0Count      = navi->getDopeCount(0);
	mNaviLifeRatio   = navi->getLifeRatio();
}
} // namespace Screen
} // namespace og

#endif
