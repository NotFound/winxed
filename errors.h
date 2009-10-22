#ifndef INCLUDE_ERRORS_H
#define INCLUDE_ERRORS_H

// errors.h
// Revision 16-oct-2009

#include "token.h"

#include <stdexcept>

class SyntaxError : public std::runtime_error
{
public:
	SyntaxError(const std::string &msg, unsigned int line);
	SyntaxError(const std::string &msg, const Token &where);
	~SyntaxError() throw () {}
	unsigned int linenum() const;
	std::string file() const;
private:
	unsigned int ln;
	Token w;
};

class Expected : public SyntaxError
{
public:
	Expected(char msg, const Token &where);
	Expected(const std::string &msg, const Token &where);
};

#endif

// End of errors.h
