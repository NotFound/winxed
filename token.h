#ifndef INCLUDE_TOKEN_H
#define INCLUDE_TOKEN_H

// token.h
// Revision 24-may-2012

#include <string>
#include <istream>
#include <vector>

enum TokenType
{
	TokenTEOF,
	TokenTComment,
	TokenTWhiteSpace,
	TokenTInteger,
	TokenTQuoted,
	TokenTIdentifier,
	TokenTOperator,
	TokenTUnknown
};

class Token
{
public:
	Token ();
	Token (TokenType tt);
	Token (TokenType tt, const std::string &file);
	Token (const std::string &ss, unsigned int linenum, const std::string &file);
	Token (TokenType type, const std::string &ss, unsigned int linenum, const std::string &file);
	Token (TokenType type, const std::string &ss, const Token &base);
	Token (bool value, const Token &base);
	Token (int value, const Token &base);

	bool empty () const;
	int getinteger() const;
	std::string str() const;
	std::string identifier() const;
	std::string pirliteralstring() const;
	std::string describe() const;
	unsigned int linenum() const;
	std::string file() const;
	bool isspace() const;
	bool isidentifier() const;
	bool isinteger() const;
	bool issinglequoted() const;
	bool isliteralstring() const;
	bool isop(const std::string &name) const;
	bool isop(char name) const;
	bool iskeyword(const std::string &name) const;
private:
	TokenType ttype;
	std::string s;
	unsigned int ln;
	std::string filename;
};

std::string unquote (const std::string &s);

class Tokenizer
{
public:
	Tokenizer (std::istream &is_a, const char *filename= 0);
	Token get ();
	void unget (const Token & t);
private:
	char getchar();
	void ungetchar(char c);
	Token getquoted();
	Token getheredoc();
	Token getany();

	std::istream &is;
	std::string name;
	unsigned int ln;
	char unc;
	std::vector<Token> untoc;
};


#endif

// End of token.h
