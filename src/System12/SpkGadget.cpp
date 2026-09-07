#include "System12/SpkGadget.h"
#include "egg/core/eggHeap.h"
#include "egg/prim/eggAssert.h"


// this whole file seems to exist to separate the speaker code from JAudio

SpkGenericMemPool::SpkGenericMemPool()
{
	field_0x0     = nullptr;
	freeMemCount  = 0;
	totalMemCount = 0;
	usedMemCount  = 0;
}

SpkGenericMemPool::~SpkGenericMemPool()
{
	void* chunk = field_0x0;
	while (chunk != nullptr) {
		void* next_chunk = *(void**)chunk;
		delete[] chunk;
		chunk = next_chunk;
	}
}

// TODO: What is this and Where does it go?
struct TNextOnFreeList {
	u8 pad[4];
}; // Size: 0x4

void SpkGenericMemPool::newMemPool(u32 n, int param_1)
{
	EGG_ASSERT(32, n >= sizeof(TNextOnFreeList));
	void* runner;
	for (int i = 0; i < param_1; i++) {
		runner = new u8[n];
		EGG_ASSERT(38, runner);
		*(void**)runner = field_0x0;
		field_0x0       = runner;
	}
	freeMemCount += param_1;
	totalMemCount += param_1;
}

void* SpkGenericMemPool::alloc(u32 param_0)
{
	if (field_0x0 == nullptr) {
		return nullptr;
	}
	void* chunk = field_0x0;
	field_0x0   = *(void**)chunk;
	freeMemCount--;
	if (usedMemCount < totalMemCount - freeMemCount) {
		usedMemCount = totalMemCount - freeMemCount;
	}
	return chunk;
}

void SpkGenericMemPool::free(void* ptr, u32 param_1)
{
	if (!ptr) {
		return;
	}
	void* chunk    = ptr;
	*(void**)chunk = field_0x0;
	field_0x0      = chunk;
	freeMemCount++;
}

void SpkCalc::bzerofast(void* dest, u32 size)
{
	EGG_ASSERT(88, (reinterpret_cast<u32>(dest) & 0x03) == 0);
	EGG_ASSERT(89, (size & 0x0f) == 0);

	u32* udest = (u32*)dest;

	for (size = size / (4 * sizeof(u32)); size != 0; size--) {
		*udest++ = 0;
		*udest++ = 0;
		*udest++ = 0;
		*udest++ = 0;
	}
}

void SpkCalc::bzero(void* dest, u32 size)
{
	u32* udest;
	u8* bdest = (u8*)dest;
	if ((size & 0x1f) == 0 && (reinterpret_cast<u32>(dest) & 0x1f) == 0) {
		DCZeroRange(dest, size);
		return;
	}

	u8 alignedbitsDst = reinterpret_cast<u32>(bdest) & 0x3;

	if ((size & 0xf) == 0 && alignedbitsDst == 0) {
		bzerofast(dest, size);
		return;
	}

	if (size >= 16) {
		if (alignedbitsDst != 0) {
			for (alignedbitsDst = 4 - alignedbitsDst; alignedbitsDst != 0; alignedbitsDst--) {
				*bdest++ = 0;
				size--;
			}
		}

		udest = (u32*)bdest;
		for (; size >= 4; size -= 4) {
			*udest++ = 0;
		}

		if (size != 0) {
			bdest = (u8*)udest;
			for (; size != 0; size--) {
				*bdest++ = 0;
			}
		}
	} else {
		for (; size != 0; size--) {
			*bdest++ = 0;
		}
	}
}
