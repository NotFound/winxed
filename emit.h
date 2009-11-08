#ifndef INCLUDE_EMIT_H
#define INCLUDE_EMIT_H

// emit.h
// Revision 8-nov-2009

#include "token.h"

#include <ostream>

class Emit
{
public:
    Emit (std::ostream &out);
    void omit_annotations();
    void comment(const std::string &msg);
    void boxedcomment(const std::string &msg);
    void annotate(const Token &t);
    std::ostream & get() { return o; }
    template <typename T>
    friend Emit & operator << (Emit &e, const T &t);
private:
    void preemit();
    std::ostream &o;
    bool with_an;
    bool pendingf;
    bool pendingl;
    std::string file;
    unsigned int line;
};

template <typename T>
Emit & operator << (Emit &e, const T &t)
{
    e.preemit();
    e.o << t;
    return e;
}

#endif

// End of emit.h
