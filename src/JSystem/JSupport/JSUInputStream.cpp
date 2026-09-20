#include "JSystem/JSupport/JSUStream.h"
#include "types.h"

/**
 * @note Address: 0x80026378
 * @note Size: 0x5C
 */
JSUInputStream::~JSUInputStream()
{
	if (!isGood()) {
		//    OSReport("JSUInputStream: occur error.\n");
	}
}

/**
 * @note Address: 0x800263D4
 * @note Size: 0x58
 */
s32 JSUInputStream::read(void* data, s32 length)
{
	int len = readData(data, length);
	if (len != length) {
		setState(IOS_STATE_1);
	}
	return len;
}

/**
 * @note Address: 0x8002642C
 * @note Size: 0xB0
 */
char* JSUInputStream::read(char* str)
{
	u16 val;
	if (readData(&val, sizeof(val)) != sizeof(val)) {
		str[0] = '\0';
		setState(IOS_STATE_1);
		return nullptr;
	}

	int len  = readData(str, val);
	str[len] = '\0';
	if (len != val) {
		setState(IOS_STATE_1);
	}

	return str;
}

/**
 * @note Address: 0x800264DC
 * @note Size: 0x88
 */
s32 JSUInputStream::skip(s32 val)
{
	char unk;
	int i;
	for (i = 0; val > i; i++) {
		if (readData(&unk, sizeof(unk)) != sizeof(unk)) {
			setState(IOS_STATE_1);
			break;
		}
	}
	return i;
}

/**
 * @note Address: 0x80026564
 * @note Size: 0x8C
 */
u32 JSURandomInputStream::align(s32 arg0)
{
	int th_var;
	s32 one_var = getPosition();
	s32 newtemp;
	s32 seekPosTmp;

	th_var  = (arg0 - 1 + one_var) & ~(arg0 - 1) /*- one_var*/;
	newtemp = th_var - one_var;
	if (newtemp != 0) {
		seekPosTmp = seekPos(th_var, SEEK_SET);
		if (seekPosTmp != newtemp) {
			setState(IOS_STATE_1);
		}
	}
	return newtemp;
}

/**
 * @note Address: 0x800265F0
 * @note Size: 0x5C
 */
s32 JSURandomInputStream::skip(s32 offset)
{
	s32 tmp = seekPos(offset, SEEK_CUR);
	if (tmp != offset) {
		setState(IOS_STATE_1);
	}
	return tmp;
}

/**
 * @note Address: 0x8002664C
 * @note Size: 0xBC
 */
size_t JSURandomInputStream::peek(void* buffer, s32 byteCount)
{
	int dataLength;
	int position;
	position   = getPosition();
	dataLength = readData(buffer, byteCount);
	if (dataLength != byteCount) {
		setState(IOS_STATE_1);
	}
	if (dataLength != 0) {
		seekPos(position, SEEK_SET);
	}
	return dataLength;
}

/**
 * @note Address: 0x80026708
 * @note Size: 0x44
 */
s32 JSURandomInputStream::seek(s32 offset, JSUStreamSeekFrom mode)
{
	s32 seekResult = seekPos(offset, mode);
	clrState(IOS_STATE_1);
	return seekResult;
}
