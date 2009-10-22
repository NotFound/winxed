// errors.cpp
// Revision 20-oct-2009

#include "errors.h"

//**********************************************************************

SyntaxError::SyntaxError(const std::string &msg, unsigned int line) :
	std::runtime_error(msg),
	ln(line)
{
}

SyntaxError::SyntaxError(const std::string &msg, const Token &where) :
	std::runtime_error(msg + " (found: " + where.describe() + " )"),
	ln(where.linenum() ),
	w(where)
{
}

unsigned int SyntaxError::linenum() const
{
	return ln;
}

std::string SyntaxError::file() const
{
	return w.file();
}

//**********************************************************************

Expected::Expected(char msg, const Token &where) :
	SyntaxError(std::string("Expected '") + msg + '\'', where)
{
}

Expected::Expected(const std::string &msg, const Token &where) :
	SyntaxError("Expected " + msg, where)
{
}

// End of errors.cpp
