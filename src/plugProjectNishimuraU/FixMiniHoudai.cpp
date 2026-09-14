#include "Game/Entities/MiniHoudai.h"
#include "Game/gamePlayData.h"

namespace Game {
namespace FixMiniHoudai {

/**
 * @note Address: 0x8030195C
 * @note Size: 0x90
 */
Obj::Obj() { }

void Obj::setZukanVisible(bool updateTekiDeathInfo)
{
	if (!mInPiklopedia) {
		return;
	}
	if (gameSystem->isFlag(GAMESYS_DisableDeathCounter)) {
		return;
	}
	if (EnemyInfoFunc::getEnemyInfo(EnemyTypeID::EnemyID_MiniHoudai, 0xFFFF)->mFlags & EFlag_HasNoInfo) {
		return;
	}
	TekiStat::Info* info = playData->mTekiStatMgr.getTekiInfo(EnemyTypeID::EnemyID_MiniHoudai);
	if (updateTekiDeathInfo) {
		info->incKilled();
	} else {
		info->mState.set(TEKISTAT_STATE_UPDATED);
	}
}

} // namespace FixMiniHoudai
} // namespace Game
