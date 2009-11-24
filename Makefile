# Makefile for Winxed

#-----------------------------------------------------------------------
# Modify this section to meet your operating system conventions and
# compiler used.

CXX = g++
CFLAGS = -g -Wall
OBJEXT = .o
EXEEXT = 

#-----------------------------------------------------------------------

default: winxedst0

all: winxed$(EXEEXT)

pbc: winxed.pbc

help:
	@echo "Targets:"
	@echo "  default - Build the stage 0 compiler"
	@echo "  all     - Build the compiler driver - native executable"
	@echo "  pbc     - Build the compiler driver - parrot binary"
	@echo "  test    - Run the test suite"
	@echo "  help    - This message"

#-----------------------------------------------------------------------

#-------------------------------
#    Compiler stage 0 
#-------------------------------

winxedst0$(EXEEXT): winxedst0$(OBJEXT) token$(OBJEXT) errors$(OBJEXT) predef$(OBJEXT) emit$(OBJEXT)
	$(CXX) -o winxedst0 winxedst0$(OBJEXT) token$(OBJEXT) errors$(OBJEXT) predef$(OBJEXT) emit$(OBJEXT)

winxedst0$(OBJEXT): winxedst0.cpp emit.h token.h errors.h predef.h
	$(CXX) $(CFLAGS) -c winxedst0.cpp

token$(OBJEXT): token.cpp token.h errors.h
	$(CXX) $(CFLAGS) -c token.cpp

errors$(OBJEXT): errors.cpp errors.h token.h
	$(CXX) $(CFLAGS) -c errors.cpp

predef$(OBJEXT): predef.cpp predef.h
	$(CXX) $(CFLAGS) -c predef.cpp

emit$(OBJEXT): emit.cpp emit.h token.h
	$(CXX) $(CFLAGS) -c emit.cpp

#-------------------------------
#      Driver
#-------------------------------

winxed$(EXEEXT): winxed.pbc
	pbc_to_exe winxed.pbc

winxed.pbc: winxed.pir
	parrot -o winxed.pbc winxed.pir

winxed.pir: winxed.winxed winxedst0$(EXEEXT)
	./winxedst0$(EXEEXT) -c winxed.winxed

#-----------------------------------------------------------------------

# Useful for some tests
%.pir: %.winxed winxed
	./winxedst0$(EXEEXT) -c $<


test: winxed.pbc
	parrot winxed.pbc t/harness -r t

testv: winxed.pbc
	parrot winxed.pbc t/harness -rv t


clean:
	rm -f winxedst0$(EXEEXT)
	rm -f winxed$(EXEEXT)
	rm -f winxed.c
	rm -f winxed.pbc
	rm -f winxed.pir
	rm -f *$(OBJEXT)

# Makefile end
