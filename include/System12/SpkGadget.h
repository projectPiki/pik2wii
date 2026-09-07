#ifndef SYSTEM12_SPKGADGET_H
#define SYSTEM12_SPKGADGET_H

#include "RevoSDK/os.h"
#include "egg/core/eggHeap.h"
#include "egg/prim/eggAssert.h"
#include "stl/limits.h"
#include "types.h"

// this whole file seems to exist to separate the speaker code from JAudio

template <class T>
class SpkGlobalInstance {
public:
	SpkGlobalInstance(T* inst) { sInstance = inst; }

	SpkGlobalInstance(bool setInstance)
	{
		if (setInstance) {
			EGG_ASSERT(43, sInstance == NULL);
			sInstance = (T*)this;
		}
	}

	~SpkGlobalInstance()
	{
		if (sInstance == (T*)this) {
			sInstance = nullptr;
		}
	}

	static T* getInstance() { return sInstance; }

	static T* sInstance;
};

namespace SpkThreadingModel {
template <typename A0>
struct InterruptsDisable {
	struct Lock {
		Lock(const A0& param_0) { field_0x0 = OSDisableInterrupts(); }
		~Lock() { OSRestoreInterrupts(field_0x0); }

		BOOL field_0x0;
	};
};

template <typename A0>
struct ObjectLevelLockable : public OSMutex {
	ObjectLevelLockable() { OSInitMutex(this); }

	struct Lock {
		Lock(A0 const& mutex)
		{
			mMutex = (A0*)&mutex;
			OSLockMutex(mMutex);
		}

		~Lock() { OSUnlockMutex(mMutex); }

		A0* mMutex;
	};
};

template <typename A0>
struct SingleThreaded {
	struct Lock {
		Lock(const A0& param_0) { }
	};
};
}; // namespace SpkThreadingModel

struct SpkGenericMemPool {
	SpkGenericMemPool();
	~SpkGenericMemPool();
	void newMemPool(u32, int);
	void* alloc(u32);
	void free(void*, u32);

	u32 getFreeMemCount() const { return freeMemCount; }

	u32 getTotalMemCount() const { return totalMemCount; }

	/* 0x00 */ void* field_0x0;
	/* 0x04 */ u32 freeMemCount;
	/* 0x08 */ u32 totalMemCount;
	/* 0x0C */ u32 usedMemCount;
};

template <typename T>
class SpkMemPool : public SpkGenericMemPool {
public:
	void newMemPool(int param_0)
	{
		typename SpkThreadingModel::SingleThreaded<SpkMemPool<T>>::Lock lock(*this);
		SpkGenericMemPool::newMemPool(sizeof(T), param_0);
	}

	void* alloc(u32 n)
	{
		EGG_ASSERT(182, n == sizeof(T));
		typename SpkThreadingModel::SingleThreaded<SpkMemPool<T>>::Lock lock(*this);
		return SpkGenericMemPool::alloc(n);
	}

	void free(void* ptr, u32 n)
	{
		EGG_ASSERT(187, n == sizeof(T));
		typename SpkThreadingModel::SingleThreaded<SpkMemPool<T>>::Lock lock(*this);
		SpkGenericMemPool::free(ptr, n);
	}

	u32 getFreeMemCount() const
	{
		typename SpkThreadingModel::SingleThreaded<SpkMemPool<T>>::Lock lock(*this);
		return SpkGenericMemPool::getFreeMemCount();
	}

	u32 getTotalMemCount() const
	{
		typename SpkThreadingModel::SingleThreaded<SpkMemPool<T>>::Lock lock(*this);
		return SpkGenericMemPool::getTotalMemCount();
	}
};

template <typename T>
class SpkPoolAllocObject {
public:
	static void* operator new(size_t n) { return memPool_.alloc(n); }
	static void* operator new(size_t n, void* ptr) { return ptr; }
	static void operator delete(void* ptr, size_t n) { memPool_.free(ptr, n); }
	static void newMemPool(int param_0) { memPool_.newMemPool(param_0); }
	static u32 getFreeMemCount() { return memPool_.getFreeMemCount(); }
	static u32 getTotalMemCount() { return memPool_.getTotalMemCount(); }

private:
	static SpkMemPool<T> memPool_;
};

template <typename T>
SpkMemPool<T> SpkPoolAllocObject<T>::memPool_;

class SpkCalc {
public:
	template <typename A, typename B>
	static A clamp(B x);

	static void bzerofast(void* dest, u32 size);
	static void bzero(void* dest, u32 size);
};

template <typename A, typename B>
A SpkCalc::clamp(B x)
{
	if (x <= std::numeric_limits<A>::min())
		return std::numeric_limits<A>::min();
	if (x >= std::numeric_limits<A>::max())
		return std::numeric_limits<A>::max();
	return x;
}

#endif
