#ifndef REVOSDK_MEM_LIST_H
#define REVOSDK_MEM_LIST_H

#include <types.h>

#ifdef __cplusplus
extern "C" {
#endif

/////////////////// MEMORY LIST TYPES //////////////////

/**
 * @brief Linked list for memory structures.
 *
 * @note Size: 0xC.
 */
typedef struct MEMList {
	void* head; // _00
	void* tail; // _04
	u16 length; // _08
	u16 offset; // _0A
} MEMList;

/**
 * @brief Individual links in memory list.
 *
 * @note Size: 0x8.
 */
typedef struct MEMLink {
	void* prev; // _00
	void* next; // _04
} MEMLink;

////////////////////////////////////////////////////////
/////////////////// GLOBAL FUNCTIONS ///////////////////

void MEMInitList(MEMList* list, u16 offset);
void MEMAppendListObject(MEMList* list, void* object);
void MEMRemoveListObject(MEMList* list, void* object);
void* MEMGetNextListObject(MEMList* list, void* object);

////////////////////////////////////////////////////////

#ifdef __cplusplus
}
#endif

#endif
