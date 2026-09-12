#ifndef _SYSTEM12_CONTROLLER_BATTERY_MGR_H
#define _SYSTEM12_CONTROLLER_BATTERY_MGR_H

#include <RevoSDK/wpad.h>
#include <egg/core/eggSingleton.h>

namespace System12 {

struct SysWPADInfo {
	WPADInfo info;
	int _18;
	int _1C;
};

class ControllerBatteryMgr {
	EGG_SINGLETON_DECL(ControllerBatteryMgr);

public:
	ControllerBatteryMgr();

	void start_get_info(int);
	void calc();
	uint get_current_battery_state(int);
	static void wpad_callback(s32, s32);

	// unused/inlined:
	void reset_current_info();
	void get_last_battery_state(int);

	// _00     = VTBL
	// _00-_10 = EGG::Disposer
	int m_controller_num; // _10

	static SysWPADInfo s_infos[WPAD_MAX_CONTROLLERS];
};

} // namespace System12

#endif
