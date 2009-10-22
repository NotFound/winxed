# Makefile for Winxed

CXX = g++
CFLAGS = -g -Wall -Wextra

winxed: winxed.o token.o errors.o
	$(CXX) -o winxed winxed.o token.o errors.o

winxed.o: winxed.cpp token.h errors.h
	$(CXX) $(CFLAGS) -c winxed.cpp

token.o: token.cpp token.h errors.h
	$(CXX) $(CFLAGS) -c token.cpp

errors.o: errors.cpp errors.h token.h
	$(CXX) $(CFLAGS) -c errors.cpp

%.pir: %.winxed winxed
	./winxed -c $<


test: winxed
	./winxed t/harness t/*.t
