#ifndef EGG_CORE_FILE_H
#define EGG_CORE_FILE_H

#include <egg/egg_types.h>

namespace EGG {

////////////////////// FILE TYPES //////////////////////

/**
 * @brief Base object for handling file processing.
 *
 * @note Size: 0x5.
 */
struct File {
	File()
	    : mIsOpen(false)
	{
	}

	virtual ~File() { }                                                // _08
	virtual bool open(const char* pPath)                          = 0; // _0C
	virtual void close()                                          = 0; // _10
	virtual s32 readData(void* pDst, s32 size, s32 offset)        = 0; // _14
	virtual s32 writeData(const void* pSrc, s32 size, s32 offset) = 0; // _18
	virtual u32 getFileSize() const                               = 0; // _1C

	// _00 = VTBL
	bool mIsOpen; // _04
};

////////////////////////////////////////////////////////

} // namespace EGG

#endif
