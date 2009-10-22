// token.cpp
// Revision 20-oct-2009

#include "token.h"
#include "errors.h"

//**********************************************************************

Token::Token () :
	ttype(TokenTUnknown), ln(0)
{ }

Token::Token (TokenType tt) :
	ttype(tt), ln(0)
{ }

Token::Token (TokenType tt, const std::string &file) :
	ttype(tt), ln(0), filename(file)
{
}

Token::Token (const std::string &ss, unsigned int linenum,
		const std::string &file) :
	ttype(TokenTUnknown), s(ss), ln(linenum), filename(file)
{ }

Token::Token (TokenType type, const std::string &ss, unsigned int linenum,
		const std::string &file) :
	ttype(type), s(ss), ln(linenum), filename(file)
{ }

bool Token::empty () const
{ return s.empty(); }

std::string Token::str() const
{ return s; }

std::string Token::describe() const
{
	switch (ttype) {
	case TokenTEOF:
		return "*End of file*";
	case TokenTSingleQuoted:
		return "'" + s + "'";
	case TokenTQuoted:
		return "\"" + unquote(s) + "\"";
	case TokenTOperator:
		return "'" + s + "'";
	case TokenTUnknown:
		return "*Unknown*";
	default:
		return s;
	}
}

unsigned int Token::linenum() const
{ return ln; }

std::string Token::file() const
{ return filename; }

bool Token::isidentifier() const
{ return ttype == TokenTIdentifier; }

bool Token::isinteger() const
{ return ttype == TokenTInteger; }

bool Token::issinglequoted() const
{ return ttype == TokenTSingleQuoted; }

bool Token::isliteralstring() const
{ return ttype == TokenTSingleQuoted || ttype == TokenTQuoted; }

bool Token::isspace() const
{
	return
		ttype == TokenTComment ||
		ttype == TokenTWhiteSpace ||
		(ttype == TokenTUnknown &&
		(s.empty() ||
		s[0] == ' ' ||
		s[0] == '\t' ||
		s[0] == '\n'
		));
}

//**********************************************************************

bool isidentifierstart(char c)
{
	return c == '_' || isalpha((unsigned char) c);
}

bool isidentifier(char c)
{
	return c == '_' || isalnum((unsigned char) c);
}

std::string unquote (const std::string &s)
{
	std::string r;
	for (size_t i= 0; i < s.size(); ++i)
	{
		char c= s[i];
		switch(c)
		{
		case '\n':
			r+= "\\n"; break;
		case '\t':
			r+= "\\t"; break;
		case '\\':
			r+= "\\\\"; break;
		default:
			r+= c;
		}
	}
	return "\"" + r + "\"";
}

//**********************************************************************

Tokenizer::Tokenizer (std::istream &is_a, const char *filename) :
	is (is_a),
	name (std::string(filename ? filename : "(unknown)")),
	ln(1),
	unc('\0')
{
}

char Tokenizer::getchar()
{
	if (unc)
	{
		char c= unc;
		unc = '\0';
		return c;
	}
	else
	{
		char c= is.get();
		if (is.eof())
			c= '\0';
		if (c == '\n')
			++ln;
		return c;
	}
}

void Tokenizer::ungetchar(char c)
{
	unc = c;
}

std::string Tokenizer::quoted()
{
	std::string s;
	unsigned int line = ln;
	char c;
	while ((c= getchar()) && is && c != '"' && c != '\n')
	{
		if (c == '\\')
		{
			c= getchar();
			switch(c)
			{
			case 'n':
				s+= '\n';
				break;
			case 't':
				s+= '\t';
				break;
			case '\\':
				s+= '\\';
				break;
			}
		}
		else
			s+= c;
	}
	if ((!is) || c != '"')
		throw SyntaxError ("Unterminated string ", line);
	return s;
}

void Tokenizer::unget (const Token & t)
{
	untoc.push_back(t);
}

Token Tokenizer::getany ()
{
	if (! untoc.empty () )
	{
		Token t(untoc.back());
		untoc.pop_back();
		return t;
	}
	char c = getchar();
	while (is && (c == ' ' || c == '\t' ||  c == '\n'))
		c= getchar();
	if (is.eof())
		return Token(TokenTEOF, name);

	unsigned int linenum = ln;
	std::string s(1, c);
	switch (c) {
	case '#':
		c= getchar();
		while (c != '\0' && c != '\n')
		{
			s+= c;
			c= getchar();
		}
		return Token(TokenTComment, s, linenum, name);
	case '/':
		c = getchar();
		switch (c)
		{
		case '/':
			for (; (!is.eof()) && c != '\n'; c= getchar())
				s+= c;
			return Token(TokenTComment, s, linenum, name);
		case '*':
			s+= c;
			c= getchar();
			do
			{
				while (is && c != '*') {
					s+= c;
					c= getchar();
				}
				c= getchar();
			} while (is && c != '/');
			s+= c;
			return Token(TokenTComment, s, linenum, name);
		default:
			ungetchar(c);
		}
		break;
	case ':':
		c= getchar();
		switch (c)
		{
		case ':':
			s+= c;
			break;
		default:
			ungetchar(c);
		}
		break;
	case '<':
		c= getchar();
		switch (c)
		{
		case '<':
		case '=':
			s+= c;
			break;
		default:
			ungetchar(c);
		}
		break;
	case '=':
		c= getchar();
		switch (c)
		{
		case '=':
			s+= c;
			break;
		default:
			ungetchar(c);
		}
		break;
	case '&':
		c= getchar();
		switch(c)
		{
		case '&':
		case '=':
			s+= c;
			break;
		default:
			ungetchar(c);
		}
		break;
	case '|':
		c= getchar();
		switch(c)
		{
		case '|':
		case '=':
			s+= c;
			break;
		default:
			ungetchar(c);
		}
		break;
	case '\'':
		s= std::string();
		while ((c= getchar()) && is && c != '\'' && c != '\n')
			s+= c;
		if ((!is) || c != '\'')
			throw SyntaxError("Unterminated string", linenum);
		return Token(TokenTSingleQuoted, s, linenum, name);
	case '"':
		s= quoted ();
		return Token(TokenTQuoted, s, linenum, name);
	case '0': case '1': case '2': case '3': case '4':
	case '5': case '6': case '7': case '8': case '9':
		while ((c= getchar()) && is && c >= '0' && c <= '9')
			s+= c;
		if (is)
			ungetchar(c);
		return Token(TokenTInteger, s, linenum, name);
	case '+':
		c= getchar();
		if (c == '+')
			s+= c;
		else
			ungetchar(c);
		break;
	case '-':
		c= getchar();
		if (c == '-')
			s+= c;
		else
			ungetchar(c);
		break;
	case '!':
		c= getchar();
		if (c == '=')
			s+= c;
		else
			ungetchar(c);
		break;
	default:
		if (isidentifierstart(c))
		{
			for (c= getchar(); isidentifier(c); c= getchar())
				s+= c;
			ungetchar(c);
			return Token(TokenTIdentifier, s, linenum, name);
		}
	}
	return Token(TokenTOperator, s, linenum, name);
}

Token Tokenizer::get ()
{
	Token t;
	while ((t= getany () ).isspace())
		continue;
	return t;
}

// End of token.cpp
