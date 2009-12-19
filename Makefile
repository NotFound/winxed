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

stage1: winxedst1.pbc

winxedst1.pbc: winxedst1.winxed winxed.pbc
	parrot winxed.pbc --target=pbc winxedst1.winxed

winxedst1$(EXEEXT): winxedst1.pbc
	pbc_to_exe winxedst1.pbc

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

TEST1 = \
	t/add.t \
	t/assignto.t \
	t/booland.t \
	t/binand.t \
	t/binor.t \
	t/classtest.t \
	t/div.t \
	t/instanceof.t \
	t/intarray.t \
	t/label.t \
	t/not.t \
	t/parent.t \
	t/postincdec.t \
	t/preincdec.t.winxed \
	t/self.t \
	t/string.t \
	t/stringarray.t \
	t/sub.t \
	t/switch.t \
	t/test.t \
	t/throw.t \
	t/var.t \
	t/vtable.t

test1: winxed$(EXEEXT) winxedst1$(EXEEXT) $(TEST1)
	parrot winxed.pbc t/harness --stage=1 $(TEST1)

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
