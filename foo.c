#include <stdio.h>
#include <string.h>

#define MAXPDSTRING 1000
#ifndef PDBINDIR
#define PDBINDIR "bin/"
#endif

#ifndef PDGUIDIR
#define PDGUIDIR "tcl/"
#endif

#ifndef WISH
# if defined _WIN32
#  define WISH "wish85.exe"
# else
#  define WISH "wish"
# endif
#endif


int main() {
#ifdef __i386__
  printf("i386: ");
#endif
#ifdef __x86_64__
  printf("amd64: ");
#endif
  printf("hello world\n");

  if(1) {
    char wishbuf[MAXPDSTRING+30];
    wishbuf[0]=0;
    strcat(wishbuf, "/" PDBINDIR WISH);
    printf("wish: %s\n", wishbuf);
  }
  return 0;
}
