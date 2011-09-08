// emit.cpp
// Revision 8-sep-2011

#include "emit.h"

Emit::Emit (std::ostream &out) :
    o(out),
    debug(false),
    with_an(true),
    pendingf(false),
    pendingl(false),
    line(0)
{ }

void Emit::setDebug()
{
    debug = true;
}

bool Emit::getDebug() const
{
    return debug;
}

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

void Emit::preemit()
{
    if (pendingf)
    {
        o << ".annotate 'file', '" << file << "'\n";
        pendingf= false;
    }
    if (pendingl)
    {
        o << ".annotate 'line', " << line << '\n';
        pendingl= false;
    }
}

void Emit::annotate(const Token &t)
{
    if (with_an)
    {
        if (t.file() != file)
        {
            file= t.file();
            pendingf= true;
            pendingl= false;
            line= 0;
        }
        if (t.linenum() != line)
        {
            line= t.linenum();
            if (line)
                pendingl= true;
        }
    }
}


// End of emit.cpp
