// emit.cpp
// Revision 7-nov-2009

#include "emit.h"

Emit::Emit (std::ostream &out) :
    o(out),
    with_an(true),
    line(0)
{ }

void Emit::omit_annotations()
{
    with_an= false;
}

void Emit::comment(const std::string &msg)
{
    o << "# " << msg << '\n';
}

void Emit::boxedcomment(const std::string &msg)
{
    const size_t n= msg.size();
    comment('+' + std::string(n + 2, '-') + '+');
    comment("| " + msg + " |");
    comment('+' + std::string(n + 2, '-') + '+');
}

void Emit::annotate(const Token &t)
{
    if (with_an)
    {
        if (t.file() != file)
        {
            file= t.file();
            line= t.linenum();
            o << ".annotate 'file', '" << file << "'\n";
            if (line)
                o << ".annotate 'line', " << line << '\n';
        }
        else if (t.linenum() != line)
        {
            line= t.linenum();
            if (line)
                o << ".annotate 'line', " << line << '\n';
        }
    }
}


// End of emit.cpp
