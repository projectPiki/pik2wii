#ifndef _GAME_ENTITIES_OTAKARABASE_H
#define _GAME_ENTITIES_OTAKARABASE_H

#include "Game/EnemyStateMachine.h"
#include "Game/EnemyAnimatorBase.h"
#include "Game/EnemyParmsBase.h"
#include "Game/EnemyMgrBase.h"
#include "Game/EnemyBase.h"

/**
 * --Header for Dweevil Base Class (OtakaraBase)--
 * Derived classes:
 * BombOtakara		= Volatile Dweevil
 * ElecOtakara		= Anode Dweevil
 * FireOtakara		= Fiery Dweevil
 * GasOtakara		= Munge Dweevil
 * WaterOtakara		= Caustic Dweevil
 */

namespace Game {
namespace OtakaraBase {
enum StateID {
	OTA_Null      = -1,
	OTA_Dead      = 0,
	OTA_Flick     = 1,
	OTA_Wait      = 2,
	OTA_Move      = 3,
	OTA_Turn      = 4,
	OTA_Take      = 5,
	OTA_ItemWait  = 6,
	OTA_ItemMove  = 7,
	OTA_ItemTurn  = 8,
	OTA_ItemFlick = 9,
	OTA_ItemDrop  = 10,
	OTA_BombWait  = 11,
	OTA_BombMove  = 12,
	OTA_BombTurn  = 13,
	OTA_Count,
};

struct FSM;

struct Obj : public EnemyBase {
	Obj();

	//////////////// VTABLE
	virtual void onInit(CreatureInitArg* settings);                // _30
	virtual void onKill(CreatureKillArg* settings);                // _34
	virtual void doDirectDraw(Graphics& gfx);                      // _50
	virtual void getShadowParam(ShadowParam& settings);            // _134
	virtual ~Obj() { }                                             // _1BC (weak)
	virtual void setInitialSetting(EnemyInitialParamBase* params); // _1C4
	virtual void doUpdate();                                       // _1CC
	virtual void doUpdateCommon();                                 // _1D0
	virtual void doAnimationCullingOff();                          // _1DC
	virtual void doDebugDraw(Graphics& gfx);                       // _1EC
	virtual void changeMaterial() = 0;                             // _200
	virtual EnemyTypeID::EEnemyTypeID getEnemyTypeID()             // _258 (weak)
	{
		return EnemyTypeID::EnemyID_FireOtakara;
	}
	virtual bool damageCallBack(Creature* source, f32 damage, CollPart* part);    // _278
	virtual bool hipdropCallBack(Creature* source, f32 damage, CollPart* part);   // _284
	virtual bool earthquakeCallBack(Creature* source, f32 bounceFactor);          // _28C
	virtual bool bombCallBack(Creature* source, Vector3f& direction, f32 damage); // _294
	virtual void doStartStoneState();                                             // _2A4
	virtual void doFinishStoneState();                                            // _2A8
	virtual void doStartEarthquakeState(f32 yVelocityScale);                      // _2B0
	virtual void doFinishEarthquakeState();                                       // _2B4
	virtual void doStartEarthquakeFitState();                                     // _2B8
	virtual void doFinishEarthquakeFitState();                                    // _2BC
	virtual void startCarcassMotion();                                            // _2C4
	virtual void doStartWaitingBirthTypeDrop();                                   // _2E0
	virtual void doFinishWaitingBirthTypeDrop();                                  // _2E4
	virtual void doStartMovie();                                                  // _2F0
	virtual void doEndMovie();                                                    // _2F4
	virtual void setFSM(FSM* fsm);                                                // _2F8
	virtual f32 getDownSmokeScale() { return 0.7f; }                              // _2EC (weak)
	virtual f32 getCellRadius() { return mCellRadius; }                           // _58 (weak)
	virtual void interactCreature(Creature*) { }                                  // _2FC (weak)
	virtual void createEffect() { }                                               // _300 (weak)
	virtual void setupEffect() { }                                                // _304 (weak)
	virtual void startChargeEffect() { }                                          // _308 (weak)
	virtual void finishChargeEffect() { }                                         // _30C (weak)
	virtual void createDisChargeEffect() { }                                      // _310 (weak)
	virtual void effectDrawOn() { }                                               // _314 (weak)
	virtual void effectDrawOff() { }                                              // _318 (weak)
	virtual void startEscapeSE();                                                 // _31C
	virtual void startDisChargeSE() { }                                           // _320 (weak)
	//////////////// VTABLE END

	bool isMovePositionSet(bool);
	Pellet* getNearestTreasure();
	Vector3f getTargetPosition(Creature*);
	void resetTreasure();
	bool isTakeTreasure();
	bool takeTreasure();
	bool fallTreasure(bool);
	bool isDropTreasure();
	void damageTreasure(f32);
	void attackTarget();
	void createTreasureFallEffect();
	void initBombOtakara();
	bool isTransitChaseState();
	bool stimulateBomb();
	Creature* getChaseTargetCreature();

	bool setTreasure(Creature*);

	inline void getScaledRadius(f32 scale, f32* radius) { *radius = scale * (mCellRadius - 10.0f); }

	inline f32 getMaxAttackHeight() const { return mPosition.y + static_cast<EnemyParmsBase*>(mParms)->mGeneral.mMaxAttackRange.mValue; }
	inline f32 getMinAttackHeight() const { return mPosition.y - static_cast<EnemyParmsBase*>(mParms)->mGeneral.mMaxAttackAngle.mValue; }

	// _00 		= VTBL
	// _00-_2BC	= EnemyBase
	FSM* mFsm;                 // _2BC
	StateID mNextState;        // _2C0
	f32 mAttackWaitTimer;      // _2C4
	f32 mAttackActiveTimer;    // _2C8
	f32 mEscapeSfxTimer;       // _2CC
	u8 mIsAttackCharging;      // _2D0
	Vector3f mMovePosition;    // _2D4
	Creature* mTreasure;       // _2E0
	f32 mTreasureHealth;       // _2E4
	f32 mItemSearchDelayTimer; // _2E8
	f32 mBodyHeightOffset;     // _2EC
	f32 mCellRadius;           // _2F0
	                           // _2F4 = PelletView
};

struct Mgr : public EnemyMgrBase {
	Mgr(int objLimit, u8 modelType);

	// virtual ~Mgr();                                     // _58 (weak)

	virtual SysShape::Model* createModel();            // _B0
	virtual void loadModelData();                      // _C8
	virtual void loadAnimData();                       // _CC
	virtual EnemyTypeID::EEnemyTypeID getEnemyTypeID() // _AC (weak)
	{
		return EnemyTypeID::EnemyID_FireOtakara;
	}
	virtual ResTIMG* getChangeTexture() = 0; // _E0

	// _00 		= VTBL
	// _00-_44	= EnemyMgrBase
	ResTIMG* mChangeTexture; // _44
};

struct Parms : public EnemyParmsBase {
	struct ProperParms : Parameters {
		inline ProperParms()
		    : Parameters(nullptr, "OtakaraBaseParms")
		    , mOtakaraLife(this, 'fp01', "オタカラライフ", 100.0f, 0.0f, 10000.0f) // 'otakara life'
		    , mNormalAttack(this, 'fp10', "ノーマルアタック", 1.0f, 0.0f, 10.0f)   // 'normal attack'
		    , mOtakaraAttack(this, 'fp11', "オタカラアタック", 1.25f, 0.0f, 10.0f) // 'otakara attack'
		    , mTreasureCatch(this, 'fp21', "オタカラキャッチ", 2.5f, 0.0f, 10.0f)  // 'treasure catch'
		{
		}

		Parm<f32> mOtakaraLife;   // _804
		Parm<f32> mNormalAttack;  // _82C
		Parm<f32> mOtakaraAttack; // _854
		Parm<f32> mTreasureCatch; // _87C
	};

	Parms() { }

	virtual void read(Stream& stream) // _08 (weak)
	{
		CreatureParms::read(stream);
		mGeneral.read(stream);
		mProperParms.read(stream);
	}

	// _00-_7F8	= EnemyParmsBase
	ProperParms mProperParms; // _7F8
};

enum AnimID {
	OTAKARAANIM_Wait       = 0, // 'wait1'
	OTAKARAANIM_Move       = 1, // 'move1'
	OTAKARAANIM_Turn       = 2, // 'pivot1'
	OTAKARAANIM_Attack     = 3, // 'attack1'
	OTAKARAANIM_TakeItem   = 4,
	OTAKARAANIM_ItemWait   = 5, // 'wait2'
	OTAKARAANIM_ItemMove   = 6, // 'move2'
	OTAKARAANIM_ItemTurn   = 7, // 'pivot2'
	OTAKARAANIM_ItemAttack = 8, // 'attack2'
	OTAKARAANIM_DropItem   = 9, // 'dropitem2'
	OTAKARAANIM_Dead       = 10,
	OTAKARAANIM_Carry      = 11,
	OTAKARAANIM_AnimCount, // 12
};

struct ProperAnimator : public EnemyAnimatorBase {
	virtual ~ProperAnimator() { }                                   // _08 (weak)
	virtual void setAnimMgr(SysShape::AnimMgr* mgr);                // _0C
	virtual SysShape::Animator& getAnimator() { return mAnimator; } // _10 (weak)
	virtual SysShape::Animator& getAnimator(int idx);               // _14

	// _00 		= VTBL
	// _00-_10	= EnemyAnimatorBase
	SysShape::Animator mAnimator; // _10
};

/////////////////////////////////////////////////////////////////
// STATE MACHINE DEFINITIONS
struct FSM : public EnemyStateMachine {
	virtual void init(EnemyBase* enemy); // _08

	// _00		= VTBL
	// _00-_1C	= EnemyStateMachine
};

struct State : public EnemyFSMState {
	inline State(int stateID, const char* name)
	    : EnemyFSMState(stateID)
	{
		mName = name;
	}

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateDead : public State {
	inline StateDead(const char* name)
	    : State(OTA_Dead, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateFlick : public State {
	inline StateFlick(const char* name)
	    : State(OTA_Flick, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateWait : public State {
	inline StateWait(const char* name)
	    : State(OTA_Wait, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateMove : public State {
	inline StateMove(const char* name)
	    : State(OTA_Move, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateTurn : public State {
	inline StateTurn(const char* name)
	    : State(OTA_Turn, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateTake : public State {
	inline StateTake(const char* name)
	    : State(OTA_Take, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateItemWait : public State {
	inline StateItemWait(const char* name)
	    : State(OTA_ItemWait, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateItemMove : public State {
	inline StateItemMove(const char* name)
	    : State(OTA_ItemMove, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateItemTurn : public State {
	inline StateItemTurn(const char* name)
	    : State(OTA_ItemTurn, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateItemFlick : public State {
	inline StateItemFlick(const char* name)
	    : State(OTA_ItemFlick, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateItemDrop : public State {
	inline StateItemDrop(const char* name)
	    : State(OTA_ItemDrop, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateBombWait : public State {
	inline StateBombWait(const char* name)
	    : State(OTA_BombWait, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateBombMove : public State {
	inline StateBombMove(const char* name)
	    : State(OTA_BombMove, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateBombTurn : public State {
	inline StateBombTurn(const char* name)
	    : State(OTA_BombTurn, name)
	{
	}

	virtual void init(EnemyBase* enemy, StateArg* settings); // _08
	virtual void exec(EnemyBase* enemy);                     // _0C
	virtual void cleanup(EnemyBase* enemy);                  // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};
/////////////////////////////////////////////////////////////////
} // namespace OtakaraBase
} // namespace Game

#endif
