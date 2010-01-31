# Makefile for Winxed

#-----------------------------------------------------------------------
# Modify this section to meet your operating system conventions and
# compiler used.

CXX = g++
CFLAGS = -g -Wall
OBJEXT = .o
EXEEXT = 

#-----------------------------------------------------------------------

default: stage0 driver

all: stage2 driver

pbc: winxed.pbc

help:
	@echo "Targets:"
	@echo "  default - Build the stage 0 and the driver"
	@echo "  stage0  - Build the stage 0 compiler"
	@echo "  stage1  - Build the driver and the stage 1 compiler"
	@echo "  stage2  - Build the driver and the stage 2 compiler"
	@echo "  all     - Build all"
	@echo "  driver  - Build the compiler driver - native executable"
	@echo "  pbc     - Build the compiler driver - parrot binary"
	@echo "  test    - Run the stage 0 tests"
	@echo "  testv   - Run the stage 0 tests with -v option"
	@echo "  test1   - Run the stage 1 tests"
	@echo "  test2   - Run the stage 2 tests"
	@echo "  help    - This message"

#-----------------------------------------------------------------------

#-------------------------------
#    Compiler stage 0 
#-------------------------------

stage0: winxedst0$(EXEEXT)

winxedst0$(EXEEXT): winxedst0$(OBJEXT) token$(OBJEXT) errors$(OBJEXT) emit$(OBJEXT)
	$(CXX) -o winxedst0 winxedst0$(OBJEXT) token$(OBJEXT) errors$(OBJEXT) emit$(OBJEXT)

winxedst0$(OBJEXT): winxedst0.cpp emit.h token.h errors.h
	$(CXX) $(CFLAGS) -c winxedst0.cpp

token$(OBJEXT): token.cpp token.h errors.h
	$(CXX) $(CFLAGS) -c token.cpp

errors$(OBJEXT): errors.cpp errors.h token.h
	$(CXX) $(CFLAGS) -c errors.cpp

emit$(OBJEXT): emit.cpp emit.h token.h
	$(CXX) $(CFLAGS) -c emit.cpp

#-------------------------------
#    Compiler stage 1
#-------------------------------

stage1: winxedst1$(EXEEXT)

winxedst1$(EXEEXT): winxedst1.pbc
	pbc_to_exe winxedst1.pbc

winxedst1.pbc: winxedst1.pir
	parrot -o winxedst1.pbc winxedst1.pir

winxedst1.pir: winxed$(EXEEXT) winxedst1.winxed
	./winxed --stage=0 -c -o winxedst1.pir winxedst1.winxed

#-------------------------------
#    Compiler stage 2
#-------------------------------

stage2: winxedst2$(EXEEXT)

winxedst2$(EXEEXT): winxedst2.pbc
	pbc_to_exe winxedst2.pbc

winxedst2.pbc: winxedst2.pir
	parrot -o winxedst2.pbc winxedst2.pir

winxedst2.pir: winxedst1$(EXEEXT) winxedst1.winxed
	./winxed --stage=1 -c -o winxedst2.pir winxedst1.winxed

#-------------------------------
#      Driver
#-------------------------------

driver: winxed$(EXEEXT)

winxed$(EXEEXT): winxed.pbc
	pbc_to_exe winxed.pbc

winxed.pbc: winxed.pir
	parrot -o winxed.pbc winxed.pir

winxed.pir: winxed.winxed winxedst0$(EXEEXT)
	./winxedst0$(EXEEXT) -c winxed.winxed

#-------------------------------
#      Preinstall
#-------------------------------

pir: winxed.pir winxedst2.pir setup.pir

# setup.winxed need at least stage 1
setup.pir: setup.winxed winxedst1.pbc
	parrot winxedst1.pbc -o setup.pir setup.winxed

#-----------------------------------------------------------------------

# Useful for some tests
%.pir: %.winxed winxed
	./winxedst0$(EXEEXT) -c $<


test: winxed.pbc
	parrot winxed.pbc t/harness -r t/basic t/*.t

testv: winxed.pbc
	parrot winxed.pbc t/harness -rv t/basic t/*.t

TEST1 = \
	t/preincdec.t.winxed  t/ordchr.t.winxed

test1: winxed$(EXEEXT) winxedst1$(EXEEXT) $(TEST1)
	parrot winxed.pbc t/harness --stage=1 -r t/basic t/*.t $(TEST1)

test2: winxed$(EXEEXT) winxedst2$(EXEEXT) $(TEST1)
	parrot winxed.pbc t/harness --stage=2 -r t/basic t/*.t $(TEST1)

clean:
	rm -f winxedst2$(EXEEXT)
	rm -f winxedst1$(EXEEXT)
	rm -f winxedst0$(EXEEXT)
	rm -f winxedst2.pbc
	rm -f winxedst1.pbc
	rm -f winxedst2.pir
	rm -f winxedst1.pir
	rm -f winxed$(EXEEXT)
	rm -f winxed.c
	rm -f winxed.pbc
	rm -f winxed.pir
	rm -f *$(OBJEXT)

# Makefile end
