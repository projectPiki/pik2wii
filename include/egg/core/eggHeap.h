#ifndef EGG_CORE_HEAP_H
#define EGG_CORE_HEAP_H

#include <egg/egg_types.h>

#include <egg/core/eggBitFlag.h>
#include <egg/core/eggDisposer.h>

#include <nw4r/ut.h>

#include <RevoSDK/mem.h>
#include <RevoSDK/os.h>

namespace EGG {

// Forward declarations
class Allocator;
class ExpHeap;

//////////////////// HEAP BASE TYPE ////////////////////

/**
 * @brief Base memory heap structure.
 *
 * @note Size: 0x0.
 */
class Heap : public Disposer {
public:
	/**
	 * @brief Kinds of heaps.
	 */
	enum EHeapKind {
		HEAP_KIND_NONE,   // 0
		HEAP_KIND_EXPAND, // 1
		HEAP_KIND_FRAME,  // 2
		HEAP_KIND_UNIT,   // 3
		HEAP_KIND_ASSERT, // 4
	};

private:
	/**
	 * @brief Quick flag for disabling alloc.
	 */
	enum {
		BIT_DISABLE_ALLOC,
	};

public:
	explicit Heap(MEMiHeapHead* pHeapHandle);

	virtual ~Heap();                                                      // _08
	virtual EHeapKind getHeapKind() const                            = 0; // _0C
	virtual void initAllocator(Allocator* pAllocator, s32 align = 4) = 0; // _10
	virtual void* alloc(u32 size, s32 align = 4)                     = 0; // _14
	virtual void free(void* pBlock)                                  = 0; // _18
	virtual void destroy()                                           = 0; // _1C
	virtual u32 resizeForMBlock(void* pBlock, u32 size)              = 0; // _20
	virtual u32 getAllocatableSize(s32 align = 4)                    = 0; // _24
	virtual u32 adjust()                                             = 0; // _28

	static Heap* findHeap(MEMiHeapHead* pHeapHandle);
	Heap* findParentHeap();
	static Heap* findContainHeap(const void* pBlock);

	void dispose();
	Heap* becomeCurrentHeap();

	void* getStartAddress() { return this; }
	void* getEndAddress() { return MEMGetHeapEndAddress(mHeapHandle); }
	s32 getTotalSize() { return static_cast<u8*>(getEndAddress()) - static_cast<u8*>(getStartAddress()); }

	bool isHeapPointer(void* pBlock) { return pBlock >= getStartAddress() && pBlock < getEndAddress(); }

	void disableAllocation() { mFlags.setBit(BIT_DISABLE_ALLOC); }
	void enableAllocation() { mFlags.resetBit(BIT_DISABLE_ALLOC); }
	bool tstDisableAllocation() { return mFlags.onBit(BIT_DISABLE_ALLOC); }

	void appendDisposer(Disposer* pDisposer) { nw4r::ut::List_Append(&mDisposerList, pDisposer); }
	void removeDisposer(Disposer* pDisposer) { nw4r::ut::List_Remove(&mDisposerList, pDisposer); }

	static void initialize();

	static void* alloc(u32 size, int align, Heap* pHeap);
	static void free(void* pBlock, Heap* pHeap);

	static const nw4r::ut::List& getHeapList() { return sHeapList; }
	static Heap* getCurrentHeap() { return sCurrentHeap; }

	static ExpHeap* dynamicCastToExp(Heap* pHeap)
	{
		if (pHeap->getHeapKind() == HEAP_KIND_EXPAND) {
			return reinterpret_cast<ExpHeap*>(pHeap);
		}

		return nullptr;
	}

	static void disableAllocationAllBut(Heap* pHeap) { sAllocatableHeap = pHeap; }

protected:
	static void* addOffset(void* pBase, u32 offset) { return static_cast<u8*>(pBase) + offset; }

	void registerHeapBuffer(void* pBuffer) { mHeapBuffer = pBuffer; }

private:
	static Heap* sCurrentHeap;

	static nw4r::ut::List sHeapList;
	static BOOL sIsHeapListInitialized;
	static OSMutex sRootMutex;

	static Heap* sAllocatableHeap;

protected:
	// _00     = VTBL
	// _00-_10 = Disposer
	MEMiHeapHead* mHeapHandle; // _10
	void* mHeapBuffer;         // _14
	Heap* mParentHeap;         // _18

private:
	TBitFlag<u16> mFlags;         // _1C
	NW4R_UT_LIST_LINK_DECL();     // _20
	nw4r::ut::List mDisposerList; // _28
};

} // namespace EGG

////////////////////////////////////////////////////////
////////////////// OPERATOR OVERRIDES //////////////////

// void* operator new(size_t size);
// void* operator new(size_t size, EGG::Heap* pHeap, int align = 4);

// void* operator new[](size_t size);
// void* operator new[](size_t size, int align);
// void* operator new[](size_t size, EGG::Heap* pHeap, int align = 4);

// void operator delete(void* pBlock) noexcept;
// void operator delete[](void* pBlock) noexcept;

////////////////////////////////////////////////////////

#endif
