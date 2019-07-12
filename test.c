#define MY_VERSION_STRING "Frobnozzel v0.1; (c) 2019 ACME; GPLv3 "
#if defined(__GNUC__)
    asm(".ascii \"" MY_VERSION_STRING "\"\n\t");
#elif defined(_MSC_VER)
# if defined(_WIN64)
#  pragma comment(user, MY_VERSION_STRING
# elif defined(_WIN32)
    __asm db MY_VERSION_STRING
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
#ifdef _MSV_VER
  printf("_MSV_VER\n");
#endif
  return 0;
}
