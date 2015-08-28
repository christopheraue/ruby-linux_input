%module input

typedef char __s8;
typedef unsigned char __u8;

typedef short __s16;
typedef unsigned short __u16;

typedef int __s32;
typedef unsigned int __u32;

#ifdef __GNUC__
__extension__ typedef long long __s64;
__extension__ typedef unsigned long long __u64;
#else
typedef long long __s64;
typedef unsigned long long __u64;
#endif

%include "linux/input.h"
