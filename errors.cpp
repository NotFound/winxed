// errors.cpp
// Revision 8-nov-2009

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

CompileError::CompileError(const std::string &msg, const Token &where) :
	std::runtime_error(msg + " (found: " + where.describe() + " )"),
	w(where)
{
}

unsigned int CompileError::linenum() const
{
	return w.linenum();
}

std::string CompileError::file() const
{
	return w.file();
}

//**********************************************************************

Unsupported::Unsupported(const std::string &msg, const Token &where) :
	CompileError("Unsupported feature: " + msg, where)
{
}

//**********************************************************************

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
