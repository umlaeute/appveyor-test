## nmake file for testing appveyor
## XXX

VCSDK = "C:\\Program Files\\Microsoft SDKs\\Windows\\v6.0A"
VC9 = "C:\\Program Files\\Microsoft Visual Studio 9.0\\VC"

LDIR = $(VCSDK)\\lib
LD2 = $(VC9)\\lib
CFLAGS =  /nologo /W3 /DWIN32 /DWINDOWS /Ox \
	-D__i386__ \
        -D_CRT_SECURE_NO_WARNINGS


all: foo.exe
	echo "VCSDK: $(VCSDK)"
	echo "VC9: $(VC9)"


.SUFFIXES: .obj
.c.obj:
	cl /c $(CFLAGS) -I. -I$(VC9)\\Include -I$(VSCDK)\\Include   /Tc$*.c

foo.exe: foo.obj
	link /nologo /OUT:foo.exe /INCREMENTAL:NO foo.obj /LIBPATH:$(LDIR) /LIBPATH:$(LD2) kernel32.lib libcmt.lib oldnames.lib


