#include "Game/Entities/Imomushi.h"

// TODO: fix this up
static void __Print(const char** fmt, ...)
{
	*fmt = "246-ImomushiMgr";
}

namespace Game {
namespace Imomushi {

/**
 * @note Address: 0x802BBCD4
 * @note Size: 0x50
 */
Mgr::Mgr(int objLimit, u8 modelType)
    : EnemyMgrBase(objLimit, modelType)
{
	mName = "イモムシマネージャ"; // caterpillar manager
}

/**
 * @note Address: 0x802BBD24
 * @note Size: 0x48
 */
void Mgr::doAlloc() { init(new Parms); }

/**
 * @note Address: 0x802BBEFC
 * @note Size: 0x60
 */
void Mgr::createObj(int count) { mObj = new Obj[count]; }

/**
 * @note Address: 0x802BC018
 * @note Size: 0x10
 */
EnemyBase* Mgr::getEnemy(int index) { return &mObj[index]; }

} // namespace Imomushi
} // namespace Game
