#include "Game/Entities/Tobi.h"

// TODO: fix this up
static void __Print(const char** fmt, ...)
{
	*fmt = "246-TobiMgr";
}

namespace Game {
namespace Tobi {

/**
 * @note Address: 0x80269448
 * @note Size: 0x50
 */
Mgr::Mgr(int objLimit, u8 modelType)
    : EnemyMgrBase(objLimit, modelType)
{
	mName = "トビンコマネージャ"; // tobinko manager
}

/**
 * @note Address: 0x80269498
 * @note Size: 0x48
 */
void Mgr::doAlloc() { init(new Parms); }

/**
 * @note Address: 0x80269670
 * @note Size: 0x60
 */
void Mgr::createObj(int count) { mObj = new Obj[count]; }

/**
 * @note Address: 0x8026978C
 * @note Size: 0x10
 */
EnemyBase* Mgr::getEnemy(int index) { return &mObj[index]; }

} // namespace Tobi
} // namespace Game
