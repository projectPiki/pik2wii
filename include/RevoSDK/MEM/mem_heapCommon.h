#ifndef REVOSDK_MEM_HEAPCOMMON_H
#define REVOSDK_MEM_HEAPCOMMON_H

#include <types.h>

#include <RevoSDK/MEM/mem_list.h>

#include <RevoSDK/os.h>

#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

/////////////////// MEMORY HEAP TYPES //////////////////

/**
 * @brief Memory heap option flags.
 */
typedef enum {
	MEM_HEAP_OPT_CLEAR_ALLOC = (1 << 0), // 0x1
	MEM_HEAP_OPT_DEBUG_FILL  = (1 << 1), // 0x2
	MEM_HEAP_OPT_CAN_LOCK    = (1 << 2), // 0x4
} MEMHeapOpt;

/**
 * @brief Basic memory heap struct.
 *
 * @note Size: 0x3C.
 */
typedef struct MEMiHeapHead {
	u32 magic;     // _00
	MEMLink link;  // _04
	MEMList list;  // _0C
	u8* start;     // _18
	u8* end;       // _1C
	OSMutex mutex; // _20

	union {
		u32 attribute;
		struct {
			u32 attribute_0_24 : 24;
			u32 opt : 8;
		};
	}; // _38
} MEMiHeapHead;

////////////////////////////////////////////////////////
/////////////////// GLOBAL FUNCTIONS ///////////////////

void MEMiInitHeapHead(MEMiHeapHead* heap, u32 magic, void* start, void* end, u16 opt);
void MEMiFinalizeHeap(MEMiHeapHead* heap);
MEMiHeapHead* MEMFindContainHeap(const void* memBlock);

////////////////////////////////////////////////////////
/////////////////// INLINE FUNCTIONS ///////////////////

static uintptr_t GetUIntPtr(const void* p)
{
	return (uintptr_t)p;
}

static int ComparePtr(const void* p0, const void* p1)
{
	return (const u8*)p0 - (const u8*)p1;
}

static void* AddU32ToPtr(const void* p, u32 ofs)
{
	return (void*)(GetUIntPtr(p) + ofs);
}

static void* SubU32ToPtr(const void* p, u32 ofs)
{
	return (void*)(GetUIntPtr(p) - ofs);
}

static const void* AddU32ToCPtr(const void* p, u32 ofs)
{
	return (const void*)(GetUIntPtr(p) + ofs);
}

static const void* SubU32ToCPtr(const void* p, u32 ofs)
{
	return (const void*)(GetUIntPtr(p) - ofs);
}

static s32 GetOffsetFromPtr(const void* start, const void* end)
{
	return GetUIntPtr(end) - GetUIntPtr(start);
}

static u16 GetOptForHeap(const MEMiHeapHead* heap)
{
	return heap->opt;
}

static void SetOptForHeap(MEMiHeapHead* heap, u16 opt)
{
	heap->opt = (u8)opt;
}

static void LockHeap(MEMiHeapHead* heap)
{
	if (GetOptForHeap(heap) & MEM_HEAP_OPT_CAN_LOCK) {
		OSLockMutex(&heap->mutex);
	}
}

static void UnlockHeap(MEMiHeapHead* heap)
{
	if (GetOptForHeap(heap) & MEM_HEAP_OPT_CAN_LOCK) {
		OSUnlockMutex(&heap->mutex);
	}
}

static void FillAllocMemory(MEMiHeapHead* heap, void* memBlock, u32 size)
{
	if (GetOptForHeap(heap) & MEM_HEAP_OPT_CLEAR_ALLOC) {
		memset(memBlock, 0, size);
	}
}

static s32 MEMGetHeapTotalSize(const MEMiHeapHead* heap)
{
	return GetOffsetFromPtr(heap, heap->end);
}

static void* MEMGetHeapEndAddress(const MEMiHeapHead* heap)
{
	return heap->end;
}

////////////////////////////////////////////////////////

#ifdef __cplusplus
}
#endif

#endif
