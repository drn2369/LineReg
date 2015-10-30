PROG= demoReg
CC= gcc
GCCFLAGS =      -g 
CFLAGS =        -g
WARNFLAGS = -Wall -ansi 
WARN_ADDITIONAL = -Wshadow

HFILES= ../src/util.h ../src/lineReg.h
CFILES= demoReg.c ../src/lineReg.c ../src/util.c
CPPFILES=

SOURCEFILES= $(CPPFILES) $(HFILES)	
OFILES=$(CPPFILES:.C=.o) $(CFILES:.c=.o)

all: $(PROG) 

SUFFIXES: .C .o 

.C.o:
	$(CC) -o $*.o -c $(GCCFLAGS) $(WARNFLAGS) $*.C

.cpp.o:
	$(CC) -o $*.o -c $(GCCFLAGS) $(WARNFLAGS) $*.cpp

.c.o:
	$(CC) -o $*.o -c $(GCCFLAGS) $(WARNFLAGS) $*.c

$(PROG): $(OFILES)  
	$(CC) -o $(PROG) $(OFILES) 

clean:
	rm -f $(OFILES) $(PROG) 

