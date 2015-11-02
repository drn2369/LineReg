PROG= demoReg
CC= gcc
GCCFLAGS =      -g 
CFLAGS =        -g
WARNFLAGS = -Wall
WARN_ADDITIONAL = -Wshadow

HFILES= ../src/util.h ../src/lineReg.h ../src/thirdParty/kissfft/_kiss_fft_guts.h ../src/thirdParty/kissfft/kiss_fft.h ../src/thirdParty/kissfft/kiss_fftnd.h ../src/thirdParty/kissfft/kiss_fftndr.h ../src/thirdParty/kissfft/kiss_fftr.h
CFILES= demoReg.c ../src/util.c ../src/lineReg.c ../src/thirdParty/kissfft/kiss_fft.c ../src/thirdParty/kissfft/kiss_fftnd.c ../src/thirdParty/kissfft/kiss_fftndr.c ../src/thirdParty/kissfft/kiss_fftr.c
CPPFILES=

L= -lm

SOURCEFILES= $(CPPFILES) $(HFILES)	
OFILES=$(CPPFILES:.C=.o) $(CFILES:.c=.o)

all: $(PROG) 

SUFFIXES: .C .o 

.C.o:
	$(CC) -o $*.o -c $(GCCFLAGS) $(WARNFLAGS) $L $*.C

.cpp.o:
	$(CC) -o $*.o -c $(GCCFLAGS) $(WARNFLAGS) $L $*.cpp

.c.o:
	$(CC) -o $*.o -c $(GCCFLAGS) $(WARNFLAGS) $L $*.c

$(PROG): $(OFILES)  
	$(CC) -o $(PROG) $(OFILES) $L 

clean:
	rm -f $(OFILES) $(PROG) 

