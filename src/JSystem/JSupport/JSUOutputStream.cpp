#include "types.h"
#include "string.h"
#include "JSystem/JSupport/JSUStream.h"

/**
 * @note Address: N/A
 * @note Size: 0x5C
 * Unused function.
 */
JSUOutputStream::~JSUOutputStream() { }

/**
 * @note Address: 0x800261E0
 * @note Size: 0x58
 */
int JSUOutputStream::write(const void* data, s32 length)
{
	int len = writeData(data, length);
	if (len != length) {
		setState(IOS_STATE_1);
	}
	return len;
}

/**
 * @note Address: 0x80026238
 * @note Size: 0xF8
 */
void JSUOutputStream::write(const char* str)
{
	if (str == nullptr) {
		u16 val = 0;
		if (writeData(&val, 2) != sizeof(val)) {
			setState(IOS_STATE_1);
		}
	} else {
		int len = strlen(str);
		if (len >= 0x10000) {
			setState(IOS_STATE_2);
		} else {
			u16 val = len;
			if (writeData(&val, 2) != sizeof(val) || (writeData(str, len) != len)) {
				setState(IOS_STATE_1);
			}
		}
	}
	return;
}
