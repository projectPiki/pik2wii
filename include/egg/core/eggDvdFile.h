#ifndef EGG_CORE_DVDFILE_H
#define EGG_CORE_DVDFILE_H

#include <egg/core/eggFile.h>

#include <nw4r/ut.h>

#include <RevoSDK/dvd.h>
#include <RevoSDK/os.h>

namespace EGG {

//////////////////// DVD FILE TYPES ////////////////////

/**
 * @brief Object for handling file processing from the DVD.
 *
 * @note Size: 0x0.
 */
struct DvdFile : public File {

	/**
	 * @brief Context info for loading data asynchronously.
	 *
	 * @note Size: 0x40.
	 */
	struct AsyncContext {
		union {
			DVDFileInfo fileInfo;     // _00
			DVDCommandBlock cmdBlock; // _00
		};
		DvdFile* pFile; // _3C
	};

	DvdFile();

	virtual ~DvdFile();                                                        // _08
	virtual bool open(const char* pPath);                                      // _0C
	virtual bool open(s32 entryNum);                                           // _20
	virtual bool open(const char* pPath, void* pMultiHandle);                  // _24
	virtual void close();                                                      // _10
	virtual s32 readData(void* pDst, s32 size, s32 offset);                    // _14
	virtual s32 writeData(const void* pSrc, s32 size, s32 offset);             // _18
	virtual u32 getFileSize() const { return mAsyncContext.fileInfo.length; }; // _1C

	void initiate();

	DVDFileInfo* getFileInfo() { return &mAsyncContext.fileInfo; }
	s32 getStatus() const { return DVDGetCommandBlockStatus(&mAsyncContext.cmdBlock); }

	s32 sync();

	static void initialize();
	static void doneProcess(s32 result, DVDFileInfo* pFileInfo);

	static nw4r::ut::List sDvdList;
	static bool sIsInitialized;

	// _00     = VTBL
	// _00-_08 = File
	OSMutex mSyncMutex;         // _08
	OSMutex mAsyncMutex;        // _20
	OSThread* mAsyncThread;     // _38
	AsyncContext mAsyncContext; // _3C
	OSMessageQueue mAsyncQueue; // _7C
	OSMessage mAsyncBuffer[1];  // _9C
	OSMessageQueue mSyncQueue;  // _A0
	OSMessage mSyncBuffer[1];   // _C0
	OSThread* mSyncThread;      // _C4
	NW4R_UT_LIST_LINK_DECL();   // _C8
};

////////////////////////////////////////////////////////

} // namespace EGG

#endif
