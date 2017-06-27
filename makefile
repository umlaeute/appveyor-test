## nmake file for testing appveyor
## XXX

!IFNDEF VCINSTALLDIR
VCINSTALLDIR = %ProgramFiles%\\Microsoft Visual Studio 9.0\\VC
!ENDIF
!IFNDEF WindowsSDKDir
WindowsSDKDir = %ProgramFiles%\\Microsoft SDKs\\Windows\\v6.0A
!ENDIF

# use %WindowsSDKDir% instead
VCSDK = $(WindowsSDKDir)
# use %VCINSTALLDIR% instead:
VC = $(VCINSTALLDIR)

LDIR = "$(VCSDK)/lib"
LD2 = "$(VC)/lib"

AFLAGS = /D__i386__
CFLAGS =  /nologo /Ox /W3 \
	/DWIN32 /DWINDOWS \
	$(AFLAGS) /D_CRT_SECURE_NO_WARNINGS

.PHONY: test

all: foo.exe

test:
	echo "VCSDK: $(VCSDK)"
	echo "VC: $(VC)"
	echo "VCINSTALLDIR: $(VCINSTALLDIR)"
	set

.SUFFIXES: .obj
.c.obj:
	cl /c $(CFLAGS) /I. /Tc$*.c

foo.exe: foo.obj
	link /nologo /OUT:foo.exe /INCREMENTAL:NO foo.obj /NODEFAULTLIB:libcmt /NODEFAULTLIB:oldnames /LIBPATH:$(LDIR) /LIBPATH:$(LD2) kernel32.lib libcmt.lib oldnames.lib


