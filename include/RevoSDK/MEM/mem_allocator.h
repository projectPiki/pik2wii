#ifndef REVOSDK_MEM_ALLOCATOR_H
#define REVOSDK_MEM_ALLOCATOR_H

#include <types.h>

#ifdef __cplusplus
extern "C" {
#endif

// Forward declarations
typedef struct MEMAllocator MEMAllocator;
typedef struct MEMiHeapHead MEMiHeapHead;

//////////////////// ALLOCATOR TYPES ///////////////////

/// Alloc-type functions for memory areas.
typedef void* (*MEMAllocatorAllocFunc)(MEMAllocator* allocator, u32 size);

/// Free-type functions for memory areas.
typedef void (*MEMAllocatorFreeFunc)(MEMAllocator* allocator, void* block);

/**
 * @brief Pair structure for alloc and free functions for memory areas.
 *
 * @note Size: 0x8.
 */
typedef struct MEMAllocatorFuncs {
	MEMAllocatorAllocFunc allocFunc; // _00
	MEMAllocatorFreeFunc freeFunc;   // _04
} MEMAllocatorFuncs;

/**
 * @brief Memory allocator object.
 *
 * @note Size: 0x10.
 */
typedef struct MEMAllocator {
	const MEMAllocatorFuncs* funcs; // _00
	MEMiHeapHead* heap;             // _04
	u32 heapParam1;                 // _08
	u32 heapParam2;                 // _0C
} MEMAllocator;

////////////////////////////////////////////////////////
/////////////////// GLOBAL FUNCTIONS ///////////////////

void* MEMAllocFromAllocator(MEMAllocator* allocator, u32 size);
void MEMFreeToAllocator(MEMAllocator* allocator, void* block);

void MEMInitAllocatorForExpHeap(MEMAllocator* allocator, MEMiHeapHead* heap, s32 align);
void MEMInitAllocatorForFrmHeap(MEMAllocator* allocator, MEMiHeapHead* heap, s32 align);

////////////////////////////////////////////////////////

#ifdef __cplusplus
}
#endif

#endif
