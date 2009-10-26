# Makefile for Winxed

CXX = g++
CFLAGS = -g -Wall -Wextra

winxed: winxed.o token.o errors.o predef.o
	$(CXX) -o winxed winxed.o token.o errors.o predef.o

winxed.o: winxed.cpp token.h errors.h predef.h
	$(CXX) $(CFLAGS) -c winxed.cpp

token.o: token.cpp token.h errors.h
	$(CXX) $(CFLAGS) -c token.cpp

errors.o: errors.cpp errors.h token.h
	$(CXX) $(CFLAGS) -c errors.cpp

predef.o: predef.cpp predef.h
	$(CXX) $(CFLAGS) -c predef.cpp

%.pir: %.winxed winxed
	./winxed -c $<


test: winxed
	./winxed t/harness t/*.t

testv: winxed
	./winxed t/harness -v t/*.t
