## nmake file for testing appveyor
## XXX

MSCC = cl
MSLN = link
COPY = copy
DELETE = del

CFLAGS = /nologo /Ox /W3 \
	$(AFLAGS) /D_CRT_SECURE_NO_WARNINGS

all: test.exe

.SUFFIXES: .obj
.c.obj:
	$(MSCC) /c $(CFLAGS) /I. /Tc$*.c

test.exe: test.obj
	$(MSLN) /nologo /OUT:test.exe /INCREMENTAL:NO test.obj /NODEFAULTLIB:libcmt /NODEFAULTLIB:oldnames $(EXTRA_LIBPATH) kernel32.lib libcmt.lib oldnames.lib


