#ifndef _CONTROLLER_H
#define _CONTROLLER_H

#include "egg/core/eggController.h"

struct Controller {
	Controller(int);

	enum EPadPort {
		PORT_INVALID = -1,
		PORT_0       = 0,
		PORT_1       = 1,
		PORT_2       = 2,
		PORT_3       = 3,
	};
	
	enum EButton {
		False = 0x0,

		PRESS_DPAD_LEFT  = 0x1,
		PRESS_DPAD_RIGHT = 0x2,
		PRESS_DPAD_DOWN  = 0x4,
		PRESS_DPAD_UP    = 0x8,

		PRESS_Z = 0x10,
		PRESS_R = 0x20,
		PRESS_L = 0x40,

		PRESS_A     = 0x100,
		PRESS_B     = 0x200,
		PRESS_X     = 0x400,
		PRESS_Y     = 0x800,
		PRESS_START = 0x1000,

		ANALOG_LEFT  = 0x1000000,
		ANALOG_RIGHT = 0x2000000,
		ANALOG_DOWN  = 0x4000000,
		ANALOG_UP    = 0x8000000,

		CSTICK_LEFT  = 0x10000,
		CSTICK_RIGHT = 0x20000,
		CSTICK_DOWN  = 0x40000,
		CSTICK_UP    = 0x80000,

		PRESS_DPAD = (PRESS_DPAD_LEFT | PRESS_DPAD_RIGHT | PRESS_DPAD_DOWN | PRESS_DPAD_UP),

		PRESS_LEFT  = (PRESS_DPAD_LEFT | ANALOG_LEFT),
		PRESS_RIGHT = (PRESS_DPAD_RIGHT | ANALOG_RIGHT),
		PRESS_DOWN  = (PRESS_DPAD_DOWN | ANALOG_DOWN),
		PRESS_UP    = (PRESS_DPAD_UP | ANALOG_UP),

		PRESS_ABX     = (PRESS_A | PRESS_B | PRESS_X),
		PRESS_ABXY    = (PRESS_A | PRESS_B | PRESS_X | PRESS_Y),
		PRESS_ABXYLRZ = (PRESS_A | PRESS_B | PRESS_X | PRESS_Y | PRESS_L | PRESS_R | PRESS_Z),

		PRESS_ANY = 0xFFFFFFFF,
	};
	
	bool isButtonDown(u32 buttons);
	bool isButtonHeld(u32 buttons);
	bool getButtonUp(u32 buttons);
	
	bool isMoveLeft();
	bool isMoveRight();
	bool isMoveUp();
	bool isMoveDown();
	
	u32 getButton() const;
	u32 getButtonDown() const;
	u32 getButtonUp() const;
	f32 getMainStickX() const;
	f32 getMainStickY() const;
	f32 getMainStickValue() const;
	s16 getMainStickAngle() const;
	f32 getSubStickX() const;
	f32 getSubStickY() const;
	f32 getSubStickValue() const;
	s16 getSubStickAngle() const;

	int mContNum;
	EGG::CoreController* mCont;
};

#endif
