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

all: winxed$(EXEEXT) winxedst1$(EXEEXT)

pbc: winxed.pbc

help:
	@echo "Targets:"
	@echo "  default - Build the stage 0 compiler"
	@echo "  stage1  - Build the stage 1 compiler"
	@echo "  all     - Build the compiler driver - native executable"
	@echo "  pbc     - Build the compiler driver - parrot binary"
	@echo "  test    - Run the test suite"
	@echo "  test1   - Run part of the test suite with the stage 1 compiler"
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
#    Compiler stage 1
#-------------------------------

stage1: winxedst1$(EXEEXT)

winxedst1$(EXEEXT): winxedst1.pbc
	pbc_to_exe winxedst1.pbc

winxedst1.pbc: winxedst1.pir winxed.pbc
	parrot -o winxedst1.pbc winxedst1.pir

winxedst1.pir: winxed$(EXEEXT) winxedst1.winxed
	./winxed --stage=0 -c -o winxedst1.pir winxedst1.winxed

#-------------------------------
#    Compiler stage 2 (testing)
#-------------------------------

stage2: winxedst2$(EXEEXT)

winxedst2$(EXEEXT): winxedst2.pbc
	pbc_to_exe winxedst2.pbc

winxedst2.pbc: winxedst2.pir
	parrot -o winxedst2.pbc winxedst2.pir

winxedst2.pir: winxedst1$(EXEEXT) winxed$(EXEEXT) winxedst1.winxed
	winxed --stage=1 -c -o winxedst2.pir winxedst1.winxed

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
	parrot winxed.pbc t/harness -r t/basic t/*.t

testv: winxed.pbc
	parrot winxed.pbc t/harness -rv t

TEST1 = \
	t/preincdec.t.winxed

test1: winxed$(EXEEXT) winxedst1$(EXEEXT) $(TEST1)
	parrot winxed.pbc t/harness --stage=1 -r t/basic t/*.t $(TEST1)

test2: winxed$(EXEEXT) winxedst2$(EXEEXT) $(TEST1)
	parrot winxed.pbc t/harness --stage=2 -r t/basic t/*.t $(TEST1)

clean:
	rm -f winxedst0$(EXEEXT)
	rm -f winxedst1$(EXEEXT)
	rm -f winxedst1.pbc
	rm -f winxed$(EXEEXT)
	rm -f winxed.c
	rm -f winxed.pbc
	rm -f winxed.pir
	rm -f *$(OBJEXT)

# Makefile end
