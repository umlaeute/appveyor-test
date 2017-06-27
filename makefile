## nmake file for testing appveyor
## XXX

MSCC = cl
MSLN = link
COPY = copy
DELETE = del

# use %WindowsSDKDir% instead
VCSDK = "C:/Program Files/Microsoft SDKs/Windows/v6.0A"
# use %VCINSTALLDIR% instead:
VC9 = "C:/Program Files/Microsoft Visual Studio 9.0/VC"

EXTRA_LIBDIR=

# \
!ifndef 0 # \
# nmake code here \
!IFNDEF VCINSTALLDIR # \
VCINSTALLDIR = $(VC9) # \
EXTRA_LIBDIR = /L$(VC9)/lib $(EXTRA_LIBDIR) # \
!ENDIF # \
!IFNDEF WindowsSDKDir # \
WindowsSDKDir = $(VCSDK) # \
EXTRA_LIBDIR = /L$(VCSDK)/lib $(EXTRA_LIBDIR)# \
!ENDIF # \
!else
# GNU make code here
ifndef VCINSTALLDIR
VCINSTALLDIR = $(VC9)
EXTRA_LIBDIR += /L$(VC9)/lib
endif
ifndef VCSDK
WindowsSDKDir = $(VCSDK)
EXTRA_LIBDIR += /L$(VCSDK)/lib
endif
# \
!endif

AFLAGS = /D__i386__
CFLAGS =  /nologo /Ox /W3 \
	/DWIN32 /DWINDOWS \
	$(AFLAGS) /D_CRT_SECURE_NO_WARNINGS

.PHONY: test set

all: foo.exe

test:
	@echo "VCSDK: $(VCSDK)"
	@echo "VC: $(VC9)"
	@echo "VCINSTALLDIR: $(VCINSTALLDIR)"
set:
	set

.SUFFIXES: .obj
.c.obj:
	$(MSCC) /c $(CFLAGS) /I. /Tc$*.c

foo.exe: foo.obj
	$(MSLN) /nologo /OUT:foo.exe /INCREMENTAL:NO foo.obj /NODEFAULTLIB:libcmt /NODEFAULTLIB:oldnames $(EXTRA_LIBDIR) kernel32.lib libcmt.lib oldnames.lib


