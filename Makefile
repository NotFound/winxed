# Makefile for Winxed

CXX = g++
CFLAGS = -g -Wall

winxed: winxed.o token.o errors.o predef.o emit.o
	$(CXX) -o winxed winxed.o token.o errors.o predef.o emit.o

winxed.o: winxed.cpp token.h errors.h predef.h
	$(CXX) $(CFLAGS) -c winxed.cpp

token.o: token.cpp token.h errors.h
	$(CXX) $(CFLAGS) -c token.cpp

errors.o: errors.cpp errors.h token.h
	$(CXX) $(CFLAGS) -c errors.cpp

predef.o: predef.cpp predef.h
	$(CXX) $(CFLAGS) -c predef.cpp

emit.o: emit.cpp emit.h token.h
	$(CXX) $(CFLAGS) -c emit.cpp

%.pir: %.winxed winxed
	./winxed -c $<


test: winxed
	./winxed t/harness -r t

testv: winxed
	./winxed t/harness -rv t


clean:
	rm -f winxed
	rm -f *.o
