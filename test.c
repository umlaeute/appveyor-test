#define MY_VERSION_STRING "Frobnozzel v0.1; (c) 2019 ACME; GPLv3 "
#if defined(__GNUC__)
    asm(".ascii \"" MY_VERSION_STRING "\"\n\t");
#elif defined(_MSC_VER)
# if defined(_WIN64)
#  pragma message w64 embedding
#  pragma comment(user, MY_VERSION_STRING)
#  pragma comment(user, "Frobnozzel user win64")
#  pragma comment(exestr, "Frobnozzel exestr win64")
# elif defined(_WIN32)
#  pragma message w32 embedding
//    __asm db MY_VERSION_STRING
#  pragma comment(user, "Frobnozzel user win32")
#  pragma comment(exestr, "Frobnozzel exestr win32")
# endif
#endif

#include <stdio.h>

int main() {
  printf("hello world\n");
#ifdef _WIN32
  printf("_WIN32\n");
#endif
#ifdef _WIN64
  printf("_WIN64\n");
#endif
#ifdef _MSC_VER
  printf("_MSC_VER\n");
#endif
  return 0;
}
