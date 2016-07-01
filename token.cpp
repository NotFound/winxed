// token.cpp
// Revision 9-jun-2012

#include "token.h"
#include "errors.h"

#include <sstream>

#include <string.h>
#include <stdlib.h>

//**********************************************************************

static std::string tostring(int n)
{
    std::ostringstream oss;
    oss << n;
    return oss.str();
}

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

Token::Token (TokenType type, const std::string &ss, const Token &base) :
    ttype(type), s(ss),
    ln(base.linenum()), filename(base.file())
{ }

Token::Token (bool value, const Token &base) :
    ttype(TokenTInteger), s(value ? "1" : "0"),
    ln(base.linenum()), filename(base.file())
{
}

Token::Token (int value, const Token &base) :
    ttype(TokenTInteger), s(tostring(value)),
    ln(base.linenum()), filename(base.file())
{
}

bool Token::empty () const
{ return s.empty(); }

int Token::getinteger() const
{
    if (ttype == TokenTInteger)
    {
        long n = strtol(s.c_str(), NULL, 0);
        return n;
    }
    else
        throw Expected("integer number", *this);
}

#if 1
std::string Token::str() const
{ return s; }
#endif

std::string Token::identifier() const
{
    if (ttype == TokenTIdentifier)
        return s;
    else
        throw Expected("identifier", *this);
}

std::string Token::pirliteralstring() const
{
    switch (ttype) {
    case TokenTQuoted:
        return unquote(s);
    default:
        throw Expected("literal string", *this);
    }
}

std::string Token::describe() const
{
    switch (ttype) {
    case TokenTEOF:
        return "*End of file*";
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

bool Token::isliteralstring() const
{ return ttype == TokenTQuoted; }

bool Token::isop(const std::string &name) const
{
    return ttype == TokenTOperator &&
        s == name;
}

bool Token::isop(char name) const
{
    return ttype == TokenTOperator &&
        s.length() == 1 && s[0] == name;
}

bool Token::iskeyword(const std::string &name) const
{
    return ttype == TokenTIdentifier &&
        s == name;
}

bool Token::isspace() const
{
    return
        ttype == TokenTComment ||
        ttype == TokenTWhiteSpace ||
        (ttype == TokenTUnknown &&
        (s.empty() ||
        s[0] == ' ' ||
        s[0] == '\t' ||
        s[0] == '\r' ||
        s[0] == '\n'
        ));
}

//**********************************************************************

bool ishexdigit(char c)
{
    return strchr("0123456789abcdefABCDEF", c) != NULL;
}

bool isidentifierstart(char c)
{
    return c == '_' || isalpha((unsigned char) c);
}

bool isidentifier(char c)
{
    return c == '_' || c == '$' || isalnum((unsigned char) c);
}

std::string unquote (const std::string &s)
{
    std::string r;
    bool nonascii= false;
    for (size_t i= 0; i < s.size(); ++i)
    {
        unsigned char c= s[i];
        if (c > 127)
            nonascii= true;
        switch(c)
        {
        case '\n':
            r+= "\\n"; break;
        case '\t':
            r+= "\\t"; break;
        case '"':
            r+= "\\\""; break;
        case '\'':
            r+= "\\'"; break;
        case '\\':
            r+= "\\\\"; break;
        case '\r':
            r+= "\\r"; break;
        case '\b':
            r+= "\\b"; break;
        case '\f':
            r+= "\\f"; break;
        case '\v':
            r+= "\\v"; break;
        case '\x1B':
            r+= "\\e"; break;
        default:
            r+= c;
        }
    }
    return (nonascii ? "utf8:\"" : "\"") + r + "\"";
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

Token Tokenizer::getquoted()
{
    std::string s;
    unsigned int linenum = ln;
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
            case '"':
                s+= '\"';
                break;
            case '\'':
                s+= '\'';
                break;
            case '\\':
                s+= '\\';
                break;
            case 'r':
                s+= '\r';
                break;
            case 'b':
                s+= '\b';
                break;
            case 'f':
                s+= '\f';
                break;
            case 'v':
                s+= '\v';
                break;
            case 'e':
                s+= '\x1B';
                break;
            default:
                throw SyntaxError ("Invalid escape sequence",
                    Token(TokenTQuoted, s + '\\' + c, linenum, name));
            }
        }
        else
            s+= c;
    }
    if ((!is) || c != '"')
        throw SyntaxError ("Unterminated string ",
            Token(TokenTQuoted, s, linenum, name));
    return Token(TokenTQuoted, s, linenum, name);
}

Token Tokenizer::getheredoc()
{
    unsigned int linenum = ln;
    std::string mark;
    char c;
    while ((c = getchar()) != '\n' && c != '\0')
    {
        if (c != '\r')
            mark += c;
    }
    if (c == 0)
        throw SyntaxError ("Unterminated heredoc ",
            Token(TokenTQuoted, "<<:", linenum, name));
    mark += ":>>";
    std::string content;
    std::string line;
    do {
        line = "";
        while ((c = getchar()) != '\n' && c != '\0')
        {
            if (c != '\r')
                line += c;
        }
        if (c == 0)
            throw SyntaxError ("Unterminated heredoc ",
                Token(TokenTQuoted, "<<:", linenum, name));
        if (line != mark) {
            content += line;
            content += '\n';
        }
    } while (line != mark);
    return Token(TokenTQuoted, content, linenum, name);
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
        switch((c = getchar()))
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
        switch ((c= getchar()))
        {
        case ':':
            s+= c;
            break;
        default:
            ungetchar(c);
        }
        break;
    case '<':
        switch ((c= getchar()))
        {
        case '<':
            c = getchar();
            if (c == ':')
                return getheredoc();
            else {
                s+= '<';
                ungetchar(c);
            }
            break;
        case '=':
            s+= c;
            break;
        default:
            ungetchar(c);
        }
        break;
    case '>':
        switch ((c= getchar()))
        {
        case '>':
            c = getchar();
            if (c == '>')
                s = ">>>";
            else {
                s = ">>";
                ungetchar(c);
            }
            break;
        case '=':
            s+= c;
            break;
        default:
            ungetchar(c);
        }
        break;
    case '=':
        switch ((c= getchar()))
        {
        case ':':
            s+= c;
            break;
        case '=':
            s+= c;
            if ((c = getchar()) == '=')
                s+= c;
            else
                ungetchar(c);
            break;
        default:
            ungetchar(c);
        }
        break;
    case '&':
        switch ((c= getchar()))
        {
        case '&':
            s+= c;
            break;
        default:
            ungetchar(c);
        }
        break;
    case '|':
        switch ((c= getchar()))
        {
        case '|':
            s+= c;
            break;
        default:
            ungetchar(c);
        }
        break;
    case '"':
        return getquoted ();
    case '0':
        c= getchar();
        if (c == 'x' || c == 'X')
        {
            s+= c;
            while ((c= getchar()) && is && ishexdigit(c))
                s+= c;
            if (is)
                ungetchar(c);
            Token tok(TokenTInteger, s, linenum, name);
            if (s == "0x")
                throw SyntaxError("Invalid hex number", tok);
            return tok;
        }
        else
            ungetchar(c);
    case '1': case '2': case '3': case '4':
    case '5': case '6': case '7': case '8': case '9':
        while ((c= getchar()) && is && c >= '0' && c <= '9')
            s+= c;
        if (is)
            ungetchar(c);
        return Token(TokenTInteger, s, linenum, name);
    case '!':
        if ((c= getchar()) == '=') {
            s+= c;
            if ((c= getchar()) == '=')
                s += c;
            else
                ungetchar(c);
        }
        else
            ungetchar(c);
        break;
    case '$':
        c = getchar();
        if (isidentifier(c))
        {
            s+= c;
            for (c= getchar(); isidentifier(c); c= getchar())
                s+= c;
            ungetchar(c);
            return Token(TokenTIdentifier, s, linenum, name);
        }
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
