#include "Game/Entities/KumaChappy.h"

// TODO: fix this up
static void __Print(const char** fmt, ...)
{
	*fmt = "246-KumaChappyMgr";
}

namespace Game {
namespace KumaChappy {

/**
 * @note Address: 0x802992B4
 * @note Size: 0x50
 */
Mgr::Mgr(int objLimit, u8 modelType)
    : EnemyMgrBase(objLimit, modelType)
{
	mName = "クマチャッピーマネージャ"; // bear chappy manager
}

/**
 * @note Address: 0x80299304
 * @note Size: 0x48
 */
void Mgr::doAlloc() { init(new Parms); }

/**
 * @note Address: 0x80299464
 * @note Size: 0x60
 */
void Mgr::createObj(int count) { mObj = new Obj[count]; }

/**
 * @note Address: 0x80299580
 * @note Size: 0x10
 */
EnemyBase* Mgr::getEnemy(int index) { return &mObj[index]; }

} // namespace KumaChappy
} // namespace Game
