#include <stdio.h>

int main() {
#ifdef __i386__
  printf("i386: ");
#endif
#ifdef __x86_64__
  printf("amd64: ");
#endif
  printf("hello world\n");
  return 0;
}
