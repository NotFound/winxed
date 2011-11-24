# Makefile for Winxed

#-----------------------------------------------------------------------
# Modify this section to meet your operating system conventions and
# compiler used.

CXX = g++
CFLAGS = -g -Wall
OBJEXT = .o
EXEEXT = 

#-----------------------------------------------------------------------

DRIVER = winxedrun

#-----------------------------------------------------------------------

default: stage0 driver winxedst1.pbc winxedst2.pbc winxedst3.pbc

all: default

pbc: $(DRIVER).pbc

help:
	@echo "Targets:"
	@echo "  default - Build the stage 0, the driver and stage 1 and 2 .pbc"
	@echo "  stage0  - Build the stage 0 compiler"
	@echo "  stage1  - Build the driver and the stage 1 native executable"
	@echo "  stage2  - Build the driver and the stage 2 native executable"
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

winxedst1.pbc: winxedst1.pir
	parrot -o winxedst1.pbc winxedst1.pir

winxedst1.pir: winxedst0$(EXEEXT) winxedst1.winxed
	./winxedst0 -o winxedst1.pir winxedst1.winxed

#-------------------------------
#    Compiler stage 2
#-------------------------------

winxedst2.pbc: winxedst2.pir
	parrot -o winxedst2.pbc winxedst2.pir

winxedst2.pir: winxedst2.winxed winxedst1.pbc $(DRIVER).pbc
	parrot $(DRIVER).pbc --stage=1 -c -o winxedst2.pir winxedst2.winxed

#-------------------------------
#    Compiler stage 3
#-------------------------------

winxedst3.pbc: winxedst3.pir
	parrot -o winxedst3.pbc winxedst3.pir

winxedst3.pir: winxedst2.winxed winxedst2.pbc $(DRIVER).pbc
	parrot $(DRIVER).pbc --stage=2 -c -o winxedst3.pir winxedst2.winxed

#-------------------------------
#      Driver
#-------------------------------

driver: winxed$(EXEEXT)

winxed$(EXEEXT): $(DRIVER).pbc
	pbc_to_exe --output=winxed$(EXEEXT) $(DRIVER).pbc

$(DRIVER).pbc: $(DRIVER).pir
	parrot -o $(DRIVER).pbc $(DRIVER).pir

$(DRIVER).pir: winxed.winxed winxedst0$(EXEEXT)
	./winxedst0$(EXEEXT) -o $(DRIVER).pir winxed.winxed

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Install
#             Testing, handle with care
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Preinstall: generate pir files

preinstall: \
    setup.pir \
    pir/winxed_compiler.pir \
    pir/winxed_installed.pir 

# Installed compiler is stage 1 built with stage 2
pir/winxed_compiler.pir: winxedst3.pbc $(DRIVER).pbc
	parrot $(DRIVER).pbc -c -o pir/winxed_compiler.pir winxedst2.winxed

# Installed driver
pir/winxed_installed.pir: winxed_installed.winxed winxedst3.pbc $(DRIVER).pbc
	parrot $(DRIVER).pbc -c -o pir/winxed_installed.pir winxed_installed.winxed

# setup.pir for use from plumage
setup.pir: setup.winxed winxedst3.pbc $(DRIVER).pbc
	parrot $(DRIVER).pbc -c -o setup.pir setup.winxed

# Install

install: preinstall
	parrot setup.pir
	parrot setup.pir install

#-----------------------------------------------------------------------

test0: $(DRIVER).pbc
	parrot $(DRIVER).pbc --stage=0 t/harness --stage=0 -r t/basic t/*.t

test1: $(DRIVER).pbc winxedst1.pbc
	parrot $(DRIVER).pbc --stage=1 t/harness --stage=1 -r t/basic t/advanced t/*.t

test2: $(DRIVER).pbc winxedst2.pbc
	parrot $(DRIVER).pbc --stage=2 t/harness --stage=2 -r t/basic t/advanced t/*.t

test3: $(DRIVER).pbc winxedst3.pbc
	parrot $(DRIVER).pbc --stage=3 t/harness --stage=3 -r t/basic t/advanced t/*.t

test: test3

#-----------------------------------------------------------------------

# Test the --debug option and the compiler assertions:
# - First compile stage1 with -debug option
# - Then use that stage to compile stage1
# - Then use that new stage to run the tests

testdebug: $(DRIVER).pbc winxedst2.pbc
	parrot $(DRIVER).pbc --debug -c -o winxedst1_deb1.pir --stage=2 winxedst1.winxed
	parrot -o winxedst1_deb1.pbc winxedst1_deb1.pir
	parrot $(DRIVER).pbc --debug -c -o winxedst1_deb2.pir --stage=winxedst1_deb1 winxedst1.winxed
	parrot -o winxedst1_deb2.pbc winxedst1_deb2.pir
	parrot $(DRIVER).pbc --debug --stage=winxedst1_deb2 t/harness --debug --stage=winxedst1_deb2 -r t/basic t/advanced t/*.t

#-----------------------------------------------------------------------

clean:
	rm -f winxedst2$(EXEEXT)
	rm -f winxedst2$(OBJEXT)
	rm -f winxedst2.c
	rm -f winxedst1$(EXEEXT)
	rm -f winxedst1$(OBJEXT)
	rm -f winxedst1.c
	rm -f winxedst0$(EXEEXT)
	rm -f winxedst2.pbc
	rm -f winxedst1.pbc
	rm -f winxedst2.pir
	rm -f winxedst1.pir
	rm -f winxed$(EXEEXT)
	rm -f winxed$(OBJEXT)
	rm -f winxed.c
	rm -f $(DRIVER).pbc
	rm -f $(DRIVER).pir
	rm -f winxedst1_deb1.pbc
	rm -f winxedst1_deb1.pir
	rm -f winxedst1_deb2.pbc
	rm -f winxedst1_deb2.pir
	rm -f *$(OBJEXT)

# Makefile end
