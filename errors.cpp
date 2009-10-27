// errors.cpp
// Revision 27-oct-2009

#include "errors.h"

//**********************************************************************

InternalError::InternalError(const std::string &msg) :
	std::runtime_error(msg)
{
}

//**********************************************************************

CompileError::CompileError(const std::string &msg) :
	std::runtime_error(msg)
{
}

CompileError::CompileError(const std::string &msg, unsigned int line) :
	std::runtime_error(msg),
	ln(line)
{
}

CompileError::CompileError(const std::string &msg, const Token &where) :
	std::runtime_error(msg + " (found: " + where.describe() + " )"),
	ln(where.linenum() ),
	w(where)
{
}

unsigned int CompileError::linenum() const
{
	return ln;
}

std::string CompileError::file() const
{
	return w.file();
}

//**********************************************************************

SyntaxError::SyntaxError(const std::string &msg, unsigned int line) :
	CompileError("Syntax error: " + msg, line)
{
}

SyntaxError::SyntaxError(const std::string &msg, const Token &where) :
	CompileError("Syntax error: " + msg, where)
{
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
