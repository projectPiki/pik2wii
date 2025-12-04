#include "Game/Entities/Ujib.h"

// TODO: fix this up
static void __Print(const char** fmt, ...)
{
	*fmt = "246-UjibMgr";
}

namespace Game {
namespace Ujib {

/**
 * @note Address: 0x8025979C
 * @note Size: 0x50
 */
Mgr::Mgr(int objLimit, u8 modelType)
    : EnemyMgrBase(objLimit, modelType)
{
	setName("ウジンコ♂マネージャ"); // ujinko ♂ manager
}

/**
 * @note Address: 0x802597EC
 * @note Size: 0x48
 */
void Mgr::doAlloc()
{
	init(new Parms);
}

/**
 * @note Address: 0x80259910
 * @note Size: 0x60
 */
void Mgr::createObj(int count)
{
	mObj = new Obj[count];
}

/**
 * @note Address: 0x80259A2C
 * @note Size: 0x10
 */
EnemyBase* Mgr::getEnemy(int index)
{
	return &mObj[index];
}

} // namespace Ujib
} // namespace Game
