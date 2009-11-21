# Makefile for Winxed

CXX = g++
CFLAGS = -g -Wall

winxedst0: winxedst0.o token.o errors.o predef.o emit.o
	$(CXX) -o winxedst0 winxedst0.o token.o errors.o predef.o emit.o

winxedst0.o: winxedst0.cpp emit.h token.h errors.h predef.h
	$(CXX) $(CFLAGS) -c winxedst0.cpp

token.o: token.cpp token.h errors.h
	$(CXX) $(CFLAGS) -c token.cpp

errors.o: errors.cpp errors.h token.h
	$(CXX) $(CFLAGS) -c errors.cpp

predef.o: predef.cpp predef.h
	$(CXX) $(CFLAGS) -c predef.cpp

emit.o: emit.cpp emit.h token.h
	$(CXX) $(CFLAGS) -c emit.cpp

%.pir: %.winxed winxed
	./winxedst0 -c $<


test: winxedst0
	./winxedst0 t/harness -r t

testv: winxedst0
	./winxedst0 t/harness -rv t


clean:
	rm -f winxedst0
	rm -f *.o
