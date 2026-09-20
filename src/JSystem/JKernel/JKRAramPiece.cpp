#include "JSystem/JKernel/JKRAram.h"
#include "JSystem/JKernel/JKRDecomp.h"
#include "JSystem/JKernel/JKRHeap.h"
#include "RevoSDK/ar.h"
#include "RevoSDK/os.h"
#include "types.h"

JSUList<JKRAMCommand> JKRAramPiece::sAramPieceCommandList;
OSMutex JKRAramPiece::mMutex;

JKRAMCommand* JKRAramPiece::prepareCommand(int direction, u32 source, u32 destination, u32 length, JKRAramBlock* block,
                                           JKRAMCommand::Callback callback)
{
	JKRAMCommand* cmd = new (JKRHeap::getSystemHeap(), -4) JKRAMCommand();
	cmd->mDirection   = direction;
	cmd->mSource      = source;
	cmd->mDestination = destination;
	cmd->mAramBlock   = block;
	cmd->mLength      = length;
	cmd->mCallback    = callback;
	return cmd;
}

/**
 * @note Address: 0x80019AD8
 * @note Size: 0x20
 */
void JKRAramPiece::sendCommand(JKRAMCommand* command)
{
	startDMA(command);
}

struct OrderSyncMsg {
	int _00;
	JKRAMCommand* _04;
};

JKRAMCommand* JKRAramPiece::orderAsync(int direction, u32 source, u32 destination, u32 length, JKRAramBlock* block,
                                       JKRAMCommand::Callback callback)
{
	lock();
	if (!IS_ALIGNED(source, 32) || !IS_ALIGNED(destination, 32)) {
		OSReport("direction = %x\n", direction);
		OSReport("source = %x\n", source);
		OSReport("destination = %x\n", destination);
		OSReport("length = %x\n", length);
		JUTException::panic(__FILE__, 108, "illegal address. abort.");
	}

	JKRAramCommand* msg = new (JKRGetSystemHeap(), -4) JKRAramCommand();
	JKRAMCommand* cmd   = JKRAramPiece::prepareCommand(direction, source, destination, length, block, callback);
	msg->setting(1, cmd);

	OSSendMessage(&JKRAram::sMessageQueue, msg, OS_MESSAGE_BLOCK);
	if (cmd->mCallback) {
		sAramPieceCommandList.append(&cmd->_20);
	}

	unlock();
	return cmd;
}

bool JKRAramPiece::sync(JKRAMCommand* cmd, int is_non_blocking)
{
	OSMessage message;

	lock();
	if (is_non_blocking == 0) {
		OSReceiveMessage(&cmd->mMessageQueue, &message, OS_MESSAGE_BLOCK);
		sAramPieceCommandList.remove(&cmd->_20);
		unlock();
		return true;
	}

	if (!OSReceiveMessage(&cmd->mMessageQueue, &message, OS_MESSAGE_NOBLOCK)) {
		unlock();
		return false;
	}

	sAramPieceCommandList.remove(&cmd->_20);
	unlock();
	return true;
}

/**
 * @note Address: 0x80019AF8
 * @note Size: 0x1AC
 */
bool JKRAramPiece::orderSync(int direction, u32 source, u32 destination, u32 length, JKRAramBlock* block)
{
	lock();

	JKRAMCommand* command = JKRAramPiece::orderAsync(direction, source, destination, length, block, nullptr);
	bool result           = JKRAramPiece::sync(command, 0);
	delete command;

	unlock();
	return result;
}

/**
 * @note Address: 0x80019CA4
 * @note Size: 0x78
 */
void JKRAramPiece::startDMA(JKRAMCommand* cmd)
{
	if (cmd->mDirection == ARAM_DIR_ARAM_TO_MRAM) {
		DCInvalidateRange((u8*)cmd->mDestination, cmd->mLength);
	} else {
		DCStoreRange((u8*)cmd->mSource, cmd->mLength);
	}
	ARStartDMA(cmd->mDirection, cmd->mSource, cmd->mDestination, cmd->mLength);
	doneDMA(cmd->mDirection);
}

/**
 * @note Address: 0x80019D1C
 * @note Size: 0xA8
 */
void JKRAramPiece::doneDMA(u32 cmdAddr)
{
	JKRAMCommand* cmd = (JKRAMCommand*)cmdAddr;

	if (cmd->_60 != 0) {
		if (cmd->_60 == 2) {
			JKRDecomp::sendCommand(cmd->mDecompCommand);
		}
	} else if (cmd->mCallback) {
		(*cmd->mCallback)(cmdAddr);
	} else if (cmd->_5C) {
		OSSendMessage(cmd->_5C, cmd, OS_MESSAGE_NOBLOCK);
	} else {
		OSSendMessage(&cmd->mMessageQueue, cmd, OS_MESSAGE_NOBLOCK);
	}
}

/**
 * @note Address: 0x80019DC4
 * @note Size: 0x70
 * __ct__12JKRAMCommandFv
 */
JKRAMCommand::JKRAMCommand()
    : _20(this)
    , _30(this)
{
	OSInitMessageQueue(&mMessageQueue, &mMessage, OS_MESSAGE_BLOCK);
	mCallback = nullptr;
	_5C       = nullptr;
	_60       = 0;
	_8C       = nullptr;
	_90       = nullptr;
	_94       = nullptr;
}

/**
 * @note Address: 0x80019E34
 * @note Size: 0xA8
 * __dt__12JKRAMCommandFv
 */
JKRAMCommand::~JKRAMCommand()
{
	if (_8C) {
		delete _8C;
	}
	if (_90) {
		delete _90;
	}
	if (_94) {
		JKRHeap::free(_94, nullptr);
	}
}
