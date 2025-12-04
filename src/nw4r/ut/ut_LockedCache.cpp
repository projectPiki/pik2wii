#include <nw4r/ut/ut_LockedCache.h>

namespace nw4r {
namespace ut {
namespace {

/**
 * @brief Local + private locked cache implementation.
 *
 * @note Size: 0x1C.
 */
class LCImpl {
public:
	/**
	 * @brief Safe wrapper for mutex reference.
	 *
	 * @note Size: 0x4.
	 */
	class Lock_ {
	public:
		Lock_(LCImpl& rImpl)
		    : mMutex(rImpl.mMutex)
		{
			OSLockMutex(&mMutex);
		}

		~Lock_() { OSUnlockMutex(&mMutex); }

	private:
		OSMutex& mMutex; // _00
	};

public:
	LCImpl()
	    : mIsEnabled(false)
	{
		OSInitMutex(&mMutex);
	}

	void Enable()
	{
		Lock_ lock(*this);

		if (!mIsEnabled) {
			LCEnable();
			mIsEnabled = true;
		}
	}

	void Disable()
	{
		Lock_ lock(*this);

		if (mIsEnabled) {
			LC::QueueWaitEx(0);
			LCDisable();
			mIsEnabled = false;
		}
	}

	bool Lock()
	{
		OSLockMutex(&mMutex);

		if (mIsEnabled) {
			LC::QueueWaitEx(0);
			return true;
		}

		OSUnlockMutex(&mMutex);
		return false;
	}

	void Unlock()
	{
		LC::QueueWaitEx(0);
		OSUnlockMutex(&mMutex);
	}

private:
	bool mIsEnabled;        // _00
	mutable OSMutex mMutex; // _04
};

static LCImpl sLCImpl;

} // namespace

namespace LC {

/**
 * @brief TODO
 *
 */
void Enable()
{
	sLCImpl.Enable();
}

/**
 * @brief TODO
 *
 */
void Disable()
{
	sLCImpl.Disable();
}

/**
 * @brief TODO
 *
 */
bool Lock()
{
	return sLCImpl.Lock();
}

/**
 * @brief TODO
 *
 */
void Unlock()
{
	sLCImpl.Unlock();
}

/**
 * @brief TODO
 *
 */
void LoadBlocks(void* pDst, void* pSrc, u32 blocks)
{
	LCLoadBlocks(pDst, pSrc, blocks);
}

/**
 * @brief TODO
 *
 */
void StoreBlocks(void* pDst, void* pSrc, u32 blocks)
{
	LCStoreBlocks(pDst, pSrc, blocks);
}

/**
 * @brief TODO
 *
 */
void StoreData(void* pDst, void* pSrc, u32 size)
{
	LCStoreData(pDst, pSrc, size);
}

} // namespace LC
} // namespace ut
} // namespace nw4r
