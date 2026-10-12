#ifndef _CTYPE_H
#define _CTYPE_H

#include "types.h"
#include "locale.h"
#include "PowerPC_EABI_Support/MSL_C/MSL_Common/ctype_api.h"

#ifdef __cplusplus
extern "C" {
#endif

int tolower(int __c);

inline int isalpha(int c) {
    return ((c < 0) || (c >= 0x100)) ? 0 : (int)(_current_locale.ctype_cmpt_ptr->ctype_map_ptr[c] & 0x1);
}

inline int isdigit(int c) {
    return ((c < 0) || (c >= 0x100)) ? 0 : (int)(_current_locale.ctype_cmpt_ptr->ctype_map_ptr[c] & 0x8);
}

inline int isspace(int c) { 
    return ((c < 0) || (c >= 0x100)) ? 0 : (int)(_current_locale.ctype_cmpt_ptr->ctype_map_ptr[c] & 0x100); 
}

inline int isupper(int c) { 
    return ((c < 0) || (c >= 0x100)) ? 0 : (int)(_current_locale.ctype_cmpt_ptr->ctype_map_ptr[c] & 0x200); 
}

inline int isxdigit(int c) { 
    return ((c < 0) || (c >= 0x100)) ? 0 : (int)(_current_locale.ctype_cmpt_ptr->ctype_map_ptr[c] & 0x400); 
}

inline int toupper(int c) {
    return ((c < 0) || (c >= 0x100)) ? c : (int) (_current_locale.ctype_cmpt_ptr->upper_map_ptr[c]);
}

inline int _tolower(int c) {
    return ((c < 0) || (c >= 0x100)) ? c : (int) (_current_locale.ctype_cmpt_ptr->lower_map_ptr[c]);
}

inline int isprintable(int c) { 
    return ((c < 0) || (c >= 0x100)) ? 0 : (int)(_current_locale.ctype_cmpt_ptr->ctype_map_ptr[c] & 0x40);
}
// added underscore to avoid naming conflicts


#ifdef __cplusplus
}
#endif
#endif
