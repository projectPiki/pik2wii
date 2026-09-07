#include "System12/ControllerBatteryMgr.h"
#include "egg/core/eggController.h"
#include "egg/prim/eggAssert.h"

namespace System12 {

SysWPADInfo ControllerBatteryMgr::s_infos[WPAD_MAX_CONTROLLERS];

EGG_SINGLETON_IMPL(11, ControllerBatteryMgr);

ControllerBatteryMgr::ControllerBatteryMgr()
    : m_controller_num(0)
{
}

void ControllerBatteryMgr::start_get_info(int controller_num)
{
	EGG_ASSERT(22, controller_num > 0 && controller_num <= 4);
	m_controller_num = controller_num;

	for (int i = 0; i < m_controller_num; i++) {
		s_infos[i]._18 = 0;
		s_infos[i]._1C = -1;
	}
}

void ControllerBatteryMgr::calc()
{
	for (int i = 0; i < m_controller_num; i++) {
		SysWPADInfo* currInfo = &s_infos[i];
		switch (currInfo->_18) {
		case 0:
			if (EGG_INSTANCE(EGG::CoreControllerMgr)->getNthController(i)->isConnected()
			    && !WPADGetInfoAsync(i, &currInfo->info, wpad_callback)) {
				currInfo->_18 = 1;
			}
			break;
		case 2:
			if (!EGG_INSTANCE(EGG::CoreControllerMgr)->getNthController(i)->isConnected()) {
				currInfo->_18 = 0;
			}
			break;
		}
	}
	return;
}

uint ControllerBatteryMgr::get_current_battery_state(int channel)
{
	EGG_ASSERT(63, channel >= 0 && channel < m_controller_num);

	if (s_infos[channel]._18 != 2)
		return -1;

	return s_infos[channel].info.battery;
}

void ControllerBatteryMgr::wpad_callback(s32 channel, s32 result)
{
	if (!result) {
		s_infos[channel]._18 = 2;
		s_infos[channel]._1C = s_infos[channel].info.battery;
		return;
	}
	s_infos[channel]._18 = 0;
	return;
}

} // namespace System12
