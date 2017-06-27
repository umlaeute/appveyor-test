## nmake file for testing appveyor
## XXX

VCSDK = "%ProgramFiles%\\Microsoft SDKs\\Windows\\v6.0A"
VC = "%ProgramFiles%\\Microsoft Visual Studio 9.0\\VC"

LDIR = $(VCSDK)\\lib
LD2 = $(VC)\\lib

AFLAGS = /D__i386__
CFLAGS =  /nologo /Ox /W3 \
	/DWIN32 /DWINDOWS \
	$(AFLAGS) /D_CRT_SECURE_NO_WARNINGS

VCINSTALLDIR ?= /foo/bar/baz

.PHONY: test

all: foo.exe

test:
	echo "VCSDK: $(VCSDK)"
	echo "VC: $(VC)"
	echo "VCINSTALLDIR: $(VCINSTALLDIR)"

.SUFFIXES: .obj
.c.obj:
	cl /c $(CFLAGS) -I. -I$(VC)\\Include -I$(VSCDK)\\Include   /Tc$*.c

foo.exe: foo.obj
	link /nologo /OUT:foo.exe /INCREMENTAL:NO foo.obj  /NODEFAULTLIB:libcmt /NODEFAULTLIB:oldnames /LIBPATH:$(LDIR) /LIBPATH:$(LD2) kernel32.lib $(LD2)\\libcmt.lib $(LD2)\\oldnames.lib


