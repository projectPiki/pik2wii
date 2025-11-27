#ifndef EGG_FILE_H
#define EGG_FILE_H

#include "egg/egg_types.h"

namespace EGG {

struct File {

    File() : mIsOpen(false) {}
    virtual ~File() {} // at 0x8

    virtual bool open(const char* pPath) = 0; // at 0xC
    virtual void close() = 0;                 // at 0x10

    virtual s32 readData(void* pDst, s32 size, s32 offset) = 0; // at 0x14
    virtual s32 writeData(const void* pSrc, s32 size,
                          s32 offset) = 0; // at 0x18

    virtual u32 getFileSize() const = 0; // at 0x1C


    bool mIsOpen; // at 0x4
};

} // namespace EGG

#endif