// winxedst0.cpp
// Revision 25-jun-2012

// Winxed compiler stage 0.

#include "token.h"
#include "errors.h"
#include "emit.h"

#include <string>
#include <iostream>
#include <istream>
#include <fstream>
#include <sstream>
#include <cctype>
#include <vector>
#include <map>
#include <algorithm>
#include <stdexcept>

#include <string.h>
#include <errno.h>

#include <typeinfo>

//**********************************************************************

// Register types
const char REGint    = 'I';
const char REGstring = 'S';
const char REGvar    = 'P';
// Pseudotypes for builtins
const char REGany    = '?';
const char REGnone   = '\0'; // void return

static const char * nameoftype(char ctype)
{
    switch (ctype)
    {
    case REGint:    return "int";
    case REGstring: return "string";
    case REGvar:    return "pmc";
    default:
        throw CompileError("Invalid type");
    }
}

char nativetype(const Token &name)
{
    if (name.iskeyword("int")) return REGint;
    else if (name.iskeyword("string")) return REGstring;
    else if (name.iskeyword("var")) return REGvar;
    else return '\0';
}

//**********************************************************************

#define INDENT "    "
#define INDENTLABEL "  "

inline
std::string op(const char *name, const std::string &op1)
{
    return INDENT + std::string(name) + ' ' + op1;
}

inline
std::string op(const char *name,
    const std::string &op1, const std::string &op2)
{
    return INDENT + std::string(name) + ' ' + op1 + ", " + op2;
}

inline
std::string op(const char *name,
    const std::string &op1,
    const std::string &op2, const std::string &op3)
{
    return INDENT + std::string(name) + ' ' + op1 + ", " + op2 + ", " + op3;
}

inline
std::string op_inc(const std::string &op1)
{
    return op("inc", op1);
}

inline
std::string op_dec(const std::string &op1)
{
    return op("dec", op1);
}

inline
std::string op_set(const std::string &res, const std::string &op1)
{
    return op("set", res, op1);
}

inline
std::string op_assign(const std::string &res, const std::string &op1)
{
    return op("assign", res, op1);
}

inline
std::string op_box(const std::string &res, const std::string &op1)
{
    return op("box", res, op1);
}

inline
std::string op_add(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("add", res, op1, op2);
}

inline
std::string op_sub(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("sub", res, op1, op2);
}

inline
std::string op_mul(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("mul", res, op1, op2);
}

inline
std::string op_div(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("div", res, op1, op2);
}

inline
std::string op_mod(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("mod", res, op1, op2);
}

inline
std::string op_cmod(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("cmod", res, op1, op2);
}

inline
std::string op_null(const std::string &res)
{
    return op("null", res);
}

inline
std::string op_isnull(const std::string &res, const std::string &op1)
{
    return op("isnull", res, op1);
}

inline
std::string op_iseq(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("iseq", res, op1, op2);
}

inline
std::string op_isne(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("isne", res, op1, op2);
}

inline
std::string op_islt(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("islt", res, op1, op2);
}

inline
std::string op_isgt(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("isgt", res, op1, op2);
}

inline
std::string op_isle(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("isle", res, op1, op2);
}

inline
std::string op_isge(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("isge", res, op1, op2);
}

inline
std::string op_isa(const std::string &res,
    const std::string &op1, const std::string &op2)
{
    return op("isa", res, op1, op2);
}

//**********************************************************************

inline void RequireOp(char name, const Token &t)
{
    if (! t.isop(name) )
        throw Expected (name, t);
}

inline void ExpectOp(char name, Tokenizer &tk)
{
    Token t= tk.get();
    RequireOp(name, t);
}

//**********************************************************************

template <typename T>
void emit_group(const std::vector<T *> &group, Emit &e)
{
    for (size_t i= 0; i < group.size(); ++i)
        group[i]->emit(e);
}

//**********************************************************************

class BuiltinFunction
{
public:
    static const int VarArgs = -1;
    BuiltinFunction(const std::string &name, char typeresult, int nargs) :
        pname(name),
        tresult(typeresult),
        n(nargs)
    {
    }
    BuiltinFunction(const std::string &name, char typeresult) :
        pname(name),
        tresult(typeresult),
        n(VarArgs)
    {
    }
    static const BuiltinFunction *find(const std::string &name,
        size_t numargs);
    bool name_is(const std::string &name) const
    { return pname == name; }
    size_t numargs() const { return n; }
    char resulttype() const { return tresult; }

    virtual char paramtype(size_t n) const = 0;
    virtual void emit(Emit &e, const std::string &result,
        const std::vector<std::string> args) const = 0;
private:
    static const BuiltinFunction *builtins[];
    static const size_t numbuiltins;
    const std::string pname;
    char tresult;
    unsigned int n;
};

class BuiltinFunctionFixargs : public BuiltinFunction
{
public:
    BuiltinFunctionFixargs(const std::string &name,
            const std::string &body,
            char typeresult,
            char type0= '\0',
            char type1= '\0',
            char type2= '\0',
            char type3= '\0');
private:
    void emit(Emit &e, const std::string &result,
        const std::vector<std::string> args) const;
    char paramtype(size_t n) const
    {
        switch(n)
        {
        case 0: return t0;
        case 1: return t1;
        case 2: return t2;
        case 3: return t3;
        default: return '\0';
        }
    }
    char t0, t1, t2, t3;
    std::vector<std::string> chunks;
    std::vector<int> marks;
};

class BuiltinFunctionVarargs : public BuiltinFunction
{
protected:
    BuiltinFunctionVarargs(const std::string &name,
            char typeresult) :
        BuiltinFunction(name, typeresult)
    { }
    char paramtype(size_t /*unused*/) const
    {
        return REGany;
    }
};

class Builtin_print : public BuiltinFunctionVarargs
{
public:
    Builtin_print() : BuiltinFunctionVarargs("print", REGnone)
    { }
private:
    void emit(Emit &e, const std::string &,
        const std::vector<std::string> args) const
    {
        const size_t n = args.size();
        for (size_t i= 0; i < n; ++i)
            e << INDENT "print " << args[i] << '\n';
    }
};

class Builtin_say : public BuiltinFunctionVarargs
{
public:
    Builtin_say() : BuiltinFunctionVarargs("say", REGnone)
    { }
private:
    void emit(Emit &e, const std::string &,
        const std::vector<std::string> args) const
    {
        const size_t n = args.size();
        if (n > 0) {
            for (size_t i= 0; i < n - 1; ++i)
                e << INDENT "print " << args[i] << '\n';
            e << INDENT "say " << args[n-1] << '\n';
        }
        else
            e << INDENT "say ''\n";
    }
};

class Builtin_cry : public BuiltinFunctionVarargs
{
public:
    Builtin_cry() : BuiltinFunctionVarargs("cry", REGnone)
    { }
private:
    void emit(Emit &e, const std::string &,
        const std::vector<std::string> args) const
    {
        e <<
            INDENT "getstderr $P0\n";
        const size_t n = args.size();
        for (size_t i= 0; i < n; ++i)
            e << INDENT "$P0.'print'(" << args[i] << ")\n";
        e << INDENT "$P0.'print'(\"\\n\")\n";
    }
};

class Builtin_ASSERT : public BuiltinFunction
{
public:
    Builtin_ASSERT() : BuiltinFunction("__ASSERT__", REGnone, 1)
    { }
    char paramtype(size_t n) const { return REGint; }
    void emit(Emit &e, const std::string &,
        const std::vector<std::string> args) const
    {
         if (e.getDebug())
         {
             e <<
                 INDENT ".const 'Sub' __WINXED_ASSERT_check ='__WINXED_ASSERT_check'\n"
                 INDENT "__WINXED_ASSERT_check(" << args[0] << ")\n";
         }
    }
};

const BuiltinFunction *BuiltinFunction::builtins[]= {
    new Builtin_ASSERT(),
    new Builtin_print(),
    new Builtin_say(),
    new Builtin_cry(),
    new BuiltinFunctionFixargs("int",
        "{res} = {arg0}",
        REGint, REGany),
    new BuiltinFunctionFixargs("string",
        "{res} = {arg0}",
        REGstring, REGany),
    new BuiltinFunctionFixargs("exit",
        "exit {arg0}",
        REGnone, REGint),
    new BuiltinFunctionFixargs("spawnw",
        "spawnw {res}, {arg0}",
        REGint, REGvar),
    new BuiltinFunctionFixargs("getstdin",
        "getstdin {res}",
        REGvar),
    new BuiltinFunctionFixargs("getstdout",
        "getstdout {res}",
        REGvar),
    new BuiltinFunctionFixargs("getstderr",
        "getstderr {res}",
        REGvar),
    new BuiltinFunctionFixargs("open",
        "root_new {res}, ['parrot';'FileHandle']\n"
        "{res}.'open'({arg0})",
        REGvar, REGstring),
    new BuiltinFunctionFixargs("open",
        "root_new {res}, ['parrot';'FileHandle']\n"
        "{res}.'open'({arg0},{arg1})",
        REGvar, REGstring, REGstring),
    new BuiltinFunctionFixargs("Error",
        "root_new {res}, ['parrot';'Exception']\n"
        "{res}['message'] = {arg0}\n"
        , REGvar, REGstring),
    new BuiltinFunctionFixargs("Error",
        "root_new {res}, ['parrot';'Exception']\n"
        "{res}['message'] = {arg0}\n"
        "{res}['severity'] = {arg1}\n"
        , REGvar, REGstring, REGint),
    new BuiltinFunctionFixargs("Error",
        "root_new {res}, ['parrot';'Exception']\n"
        "{res}['message'] = {arg0}\n"
        "{res}['severity'] = {arg1}\n"
        "{res}['type'] = {arg2}\n"
        , REGvar, REGstring, REGint, REGint),
    new BuiltinFunctionFixargs("Error",
        "root_new {res}, ['parrot';'Exception']\n"
        "{res}['message'] = {arg0}\n"
        "{res}['severity'] = {arg1}\n"
        "{res}['type'] = {arg2}\n"
        "{res}['payload'] = {arg3}\n"
        , REGvar, REGstring, REGint, REGint, REGvar),
    new BuiltinFunctionFixargs("elements",
        "elements {res}, {arg0}",
        REGint, REGvar),
    new BuiltinFunctionFixargs("length",
        "length {res}, {arg0}",
        REGint, REGstring),
    new BuiltinFunctionFixargs("bytelength",
        "bytelength {res}, {arg0}",
        REGint, REGstring),
    new BuiltinFunctionFixargs("chr",
        "chr $S0, {arg0}\n"
        "find_encoding $I0, 'utf8'\n"
        "trans_encoding {res}, $S0, $I0\n",
        REGstring, REGint),
    new BuiltinFunctionFixargs("ord",
        "ord {res}, {arg0}",
        REGint, REGstring),
    new BuiltinFunctionFixargs("ord",
        "ord {res}, {arg0}, {arg1}",
        REGint, REGstring, REGint),
    new BuiltinFunctionFixargs("substr",
        "substr {res}, {arg0}, {arg1}",
        REGstring, REGstring, REGint),
    new BuiltinFunctionFixargs("substr",
        "substr {res}, {arg0}, {arg1}, {arg2}",
        REGstring, REGstring, REGint, REGint),
    new BuiltinFunctionFixargs("replace",
        "replace {res}, {arg0}, {arg1}, {arg2}, {arg3}",
        REGstring, REGstring, REGint, REGint, REGstring),
    new BuiltinFunctionFixargs("indexof",
        "index {res}, {arg0}, {arg1}",
        REGint, REGstring, REGstring),
    new BuiltinFunctionFixargs("indexof",
        "index {res}, {arg0}, {arg1}, {arg2}",
        REGint, REGstring, REGstring, REGint),
    new BuiltinFunctionFixargs("escape",
        "escape {res}, {arg0}",
        REGstring, REGstring),
    new BuiltinFunctionFixargs("unescape",
        "$P0 = new ['String']\n"
        "$P0 = {arg0}\n"
        "{res} = $P0.'unescape'('utf8')\n",
        REGstring, REGstring),
    new BuiltinFunctionFixargs("unescape",
        "$P0 = new ['String']\n"
        "$P0 = {arg0}\n"
        "{res} = $P0.'unescape'({arg1})\n",
        REGstring, REGstring, REGstring),
    new BuiltinFunctionFixargs("upcase",
        "upcase {res}, {arg0}",
        REGstring, REGstring),
    new BuiltinFunctionFixargs("downcase",
        "downcase {res}, {arg0}",
        REGstring, REGstring),
    new BuiltinFunctionFixargs("titlecase",
        "titlecase {res}, {arg0}",
        REGstring, REGstring),
    new BuiltinFunctionFixargs("join",
        "join {res}, {arg0}, {arg1}",
        REGstring, REGstring, REGvar),
    new BuiltinFunctionFixargs("split",
        "split {res}, {arg0}, {arg1}",
        REGvar, REGstring, REGstring),
    new BuiltinFunctionFixargs("push",
        "push {arg0}, {arg1}",
        REGnone, REGvar, REGany),
    new BuiltinFunctionFixargs("getinterp",
        "getinterp {res}",
        REGvar),
    new BuiltinFunctionFixargs("get_class",
        "get_class {res}, {arg0}",
        REGvar, REGstring),
    new BuiltinFunctionFixargs("typeof",
        "typeof {res}, {arg0}",
        REGvar, REGvar),
    new BuiltinFunctionFixargs("clone",
        "clone {res}, {arg0}",
        REGvar, REGvar),
    new BuiltinFunctionFixargs("compreg",
        "compreg {res}, {arg0}",
        REGvar, REGstring),
    new BuiltinFunctionFixargs("compreg",
        "compreg {arg0}, {arg1}",
        REGnone, REGstring, REGvar),
    new BuiltinFunctionFixargs("load_language",
        "load_language {arg0}\n"
        "compreg {res}, {arg0}",
        REGvar, REGstring),
    new BuiltinFunctionFixargs("load_language",
        "load_language {arg0}\n"
        "compreg {res}, {arg1}",
        REGvar, REGstring, REGstring),
    new BuiltinFunctionFixargs("loadlib",
        "loadlib {res}, {arg0}",
        REGvar, REGstring),
    new BuiltinFunctionFixargs("load_bytecode",
        "load_bytecode {arg0}",
        REGvar, REGstring),
    new BuiltinFunctionFixargs("sprintf",
        "sprintf {res}, {arg0}, {arg1}",
        REGstring, REGstring, REGvar)
};

const size_t BuiltinFunction::numbuiltins =
    sizeof(BuiltinFunction::builtins) / sizeof(BuiltinFunction::builtins[0]);

const BuiltinFunction *BuiltinFunction::find(const std::string &name,
    size_t numargs)
{
    for (size_t i= 0; i < numbuiltins; ++i) {
        int n = builtins[i]->n;
        if ((n == BuiltinFunction::VarArgs || n == int(numargs)) &&
                builtins[i]->name_is(name) )
            return builtins[i];
    }
    return 0;
}

BuiltinFunctionFixargs::BuiltinFunctionFixargs(const std::string &name,
            const std::string &body,
            char typeresult,
            char type0, char type1, char type2, char type3) :
        BuiltinFunction(name, typeresult,
                bool(type0) +bool(type1) + bool(type2) + bool(type3) ),
        t0(type0), t1(type1), t2(type2), t3(type3)
{
    const size_t ntags = 5;
    const std::string tags[ntags] =
        { "{res}", "{arg0}", "{arg1}", "{arg2}", "{arg3}" };
    std::string::size_type pos[ntags];

    std::string aux = body;

    for (;;)
    {
        for (size_t i = 0; i < ntags; ++i)
            pos[i] = aux.find(tags[i]);
        const std::string::size_type *minp = std::min_element(pos, pos + ntags);
        size_t minpos = minp - pos;
        std::string::size_type mpos = pos[minpos];
        if (mpos == std::string::npos)
            break;
        chunks.push_back(aux.substr(0, mpos));
        marks.push_back(minpos);
        aux.erase(0, mpos + tags[minpos].length());
    }
    if (aux.length() > 0)
    {
        chunks.push_back(aux);
        marks.push_back(-1);
    }
}

void BuiltinFunctionFixargs::emit(Emit &e, const std::string &result,
    const std::vector<std::string> args) const
{
    std::string body;
    size_t n = chunks.size();
    for (size_t i = 0; i < n; ++i)
    {
        body+= chunks[i];
        int m = marks[i];
        switch (m)
        {
          case 0:
            body+= result;
            break;
          case 1: case 2: case 3: case 4:
            body+= args[m-1];
            break;
          case -1:
            break;
          default:
            throw InternalError("Unexpected failure in builtin");
        }
    }

    size_t pos = 0;
    size_t prev = 0;
    while ((pos = body.find("\n", prev)) != std::string::npos)
    {
        e << INDENT << body.substr(prev, pos - prev + 1);
        prev = pos + 1;
    }
    e << INDENT << body.substr(prev) << '\n';
}

//**********************************************************************

class Annotated
{
protected:
    Annotated(const Token & tstart) : start(tstart)
    { }
public:
    void annotate(Emit &e)
    {
        e.annotate(start);
    }
    const Token & getstart() const
    {
        return start;
    }
private:
    const Token start;
};

//**********************************************************************

class ConstantValue
{
public:
    ConstantValue(char type, const Token &value) :
        t(type), v(value)
    {
        switch(t)
        {
        case REGint:
            if (!v.isinteger())
                throw SyntaxError("Invalid const int value", v);
            break;
        case REGstring:
            if (!v.isliteralstring())
                throw SyntaxError("Invalid const string value", v);
            break;
        case 'n':
            // Special case
            if (!v.isidentifier())
                throw SyntaxError("Invalid const string value", v);
            break;
        default:
            throw InternalError("Invalid const type");
        }
    }
    char type() const { return t; }
    Token value() const { return v; }
private:
    char t;
    Token v;
};

//**********************************************************************

class ClassStatement;

typedef std::vector<std::string> ClassKey;

std::string dotted(const ClassKey &ck)
{
    size_t l = ck.size();
    if (l == 0)
        return "(anonimous)";
    else
    {
        std::string r = ck[0];
        for (size_t i = 1; i < l; ++i)
        {
            r+= '.';
            r+= ck[i];
        }
        return r;
    }
}

//**********************************************************************

class FunctionStatement;

class BlockBase
{
public:
    virtual char checklocal(const std::string &name) const = 0;
    virtual char checkconstant(const std::string &name) const = 0;
    virtual ConstantValue getconstant(const std::string &name) const = 0;
    virtual FunctionStatement *getfunction(const std::string &name) const = 0;
    virtual void genconstant(const std::string &name, char type, const Token &value) = 0;
    virtual std::string genlocallabel() = 0;
    virtual std::string genlocalregister(char type)= 0;
    virtual void freelocalregister(const std::string &)= 0;
    virtual std::string gentemp(char /*unused*/)
    {
        throw std::runtime_error("No temp registers here!");
    }
    virtual void freetempregs()
    {
        throw std::runtime_error("No temp registers here!");
    }
    virtual void genlocal(const std::string &name, char type) = 0;
    virtual bool islocal(std::string /*name*/) const = 0;
    virtual std::string getbreaklabel() const
    {
        throw std::runtime_error("No break allowed");
    }
    virtual std::string getcontinuelabel() const
    {
        throw std::runtime_error("No continue allowed");
    }
    virtual ClassStatement *findclass(const ClassKey &classkey)
    {
        std::cerr << "BlockBase::findclass **WRONG CALL**\n";
        return 0;
    }
    virtual ~BlockBase() { }
};

class Block : public BlockBase
{
public:
    Block();
    virtual unsigned int blockid() = 0;
    void genlocal(const std::string &name, char type);
    bool islocal(std::string name) const;
    void genconstant(const std::string &name, char type, const Token &value);
    char checklocal(const std::string &name) const;
    char checkconstant(const std::string &name) const;
    ConstantValue getconstant(const std::string &name) const;
    std::string genlabel();
protected:
    typedef std::map<std::string, char> Locals;
    Locals locals;
    typedef std::map<std::string, ConstantValue> Constants;
    Constants constants;
};

class InBlock : public BlockBase
{
protected:
    InBlock(BlockBase &block) : bl(block) { };
public:
    std::string getbreaklabel() const
    {
        return bl.getbreaklabel();
    }
    std::string getcontinuelabel() const
    {
        return bl.getcontinuelabel();
    }
    char checklocal(const std::string &name) const
    {
        return bl.checklocal(name);
    }
    char checkconstant(const std::string &name) const
    {
        return bl.checkconstant(name);
    }
    void genconstant(const std::string &name, char type, const Token &value)
    {
        bl.genconstant(name, type, value);
    }
    ConstantValue getconstant(const std::string &name) const
    {
        return bl.getconstant(name);
    }
    FunctionStatement *getfunction(const std::string &name) const
    {
        return bl.getfunction(name);
    }
    std::string genlocallabel()
    {
        return bl.genlocallabel();
    }
    std::string genlocalregister(char type)
    {
        return bl.genlocalregister(type);
    }
    void freelocalregister(const std::string &reg)
    {
        bl.freelocalregister(reg);
    }
    std::string gentemp(char type)
    {
        return bl.gentemp(type);
    }
    void freetempregs()
    {
        bl.freetempregs();
    }
    void genlocal(const std::string &name, char type)
    {
        bl.genlocal(name, type);
    }
    bool islocal(std::string name) const
    {
        return bl.islocal(name);
    }
    ClassStatement *findclass(const ClassKey &classkey)
    {
        return bl.findclass(classkey);
    }
private:
    BlockBase &bl;
};

Block::Block()
{ }

void Block::genlocal(const std::string &name, char type)
{
    locals[name]= type;
}

bool Block::islocal(std::string name) const
{
    return locals.find(name) != locals.end();
}

void Block::genconstant(const std::string &name, char type, const Token &value)
{
    constants.insert(std::make_pair(name, ConstantValue(type, value)));
}

char Block::checklocal(const std::string &name) const
{
    Locals::const_iterator it= locals.find(name);
    if (it != locals.end() )
        return it->second;
    Constants::const_iterator itc= constants.find(name);
    if (itc != constants.end() )
        return itc->second.type();
    return '\0';
}

char Block::checkconstant(const std::string &name) const
{
    Constants::const_iterator itc= constants.find(name);
    if (itc != constants.end() )
        return itc->second.type();
    return '\0';
}

ConstantValue Block::getconstant(const std::string &name) const
{
    Constants::const_iterator itc= constants.find(name);
    if (itc != constants.end() )
        return itc->second;
    throw InternalError("No such constant");
}

std::string Block::genlabel()
{
    return genlocallabel();
}

//**********************************************************************

class SubBlock : public Block
{
public:
    SubBlock(Block &parentblock) :
        parent(parentblock),
        id(parent.blockid()),
        nlabel(0)
    {
    }
    std::string getbreaklabel() const;
    std::string getcontinuelabel() const;
    bool islocal(std::string name) const;
    char checklocal(const std::string &name) const;
    char checkconstant(const std::string &name) const;
    ConstantValue getconstant(const std::string &name) const;
    FunctionStatement *getfunction(const std::string &name) const
    {
        return parent.getfunction(name);
    }
    std::string genlocalregister(char type)
    {
        return parent.genlocalregister(type);
    }
    void freelocalregister(const std::string &reg)
    {
        parent.freelocalregister(reg);
    }
    std::string gentemp(char type)
    {
        return parent.gentemp(type);
    }
    void freetempregs()
    {
        parent.freetempregs();
    }
    std::string genlocallabel();
    ClassStatement *findclass(const ClassKey &classkey)
    {
        return parent.findclass(classkey);
    }
private:
    unsigned int blockid();

    Block &parent;
    unsigned int id;
    unsigned int nlabel;
};

unsigned int SubBlock::blockid()
{
    return parent.blockid();
}

std::string SubBlock::getbreaklabel() const
{
    return parent.getbreaklabel();
}

std::string SubBlock::getcontinuelabel() const
{
    return parent.getcontinuelabel();
}

char SubBlock::checklocal(const std::string &name) const
{
    if (char c= Block::checklocal(name))
        return c;
    else
        return parent.checklocal(name);
}

bool SubBlock::islocal(std::string name) const
{
    return checklocal(name) != '\0';
}

char SubBlock::checkconstant(const std::string &name) const
{
    char c= Block::checkconstant(name);
    if (c == '\0')
        c= parent.checkconstant(name);
    return c;
}

ConstantValue SubBlock::getconstant(const std::string &name) const
{
    if (Block::checkconstant(name))
        return Block::getconstant(name);
    else
        return parent.getconstant(name);
}

std::string SubBlock::genlocallabel()
{
    std::ostringstream l;
    l << "__label_" << id << '_' << ++nlabel;
    return l.str();
}

//**********************************************************************

class NamespaceKey
{
    typedef std::vector <std::string> key_t;
public:
    NamespaceKey() { }
    NamespaceKey(const std::string &name) :
        key(1, name)
    {
    }
    NamespaceKey(const key_t &newkey) :
        key(newkey)
    {
    }
    bool isroot() const
    {
        return key.empty();
    }
    NamespaceKey parent() const
    {
        key_t newkey = key;
        newkey.pop_back();
        return NamespaceKey(newkey);
    }
    std::string get_key() const
    {
        std::string r= "[ ";
        for (size_t i= 0; i < key.size(); ++i)
        {
            if (i > 0)
                r+= "; ";
            r+= '\'' + key [i] + '\'';
        }
        r+= " ]";
        return r;
    }
    void emit (Emit &e) const
    {
        e << ".namespace " << get_key() << '\n';
    }
private:
    std::vector <std::string> key;
};

//**********************************************************************

class FunctionBlock : public SubBlock
{
public:
    FunctionBlock(Block &parent) :
        SubBlock(parent),
        subblocks(0),
        nreg(0), nlabel(0)
    {
    }
public:
    std::string genlocallabel();
    std::string genlocalregister(char type);
    std::string gentemp(char type);
    std::string genregister(char type);
    void freelocalregister(const std::string &reg);
    void freeregister(const std::string &reg);
protected:
    size_t tempsused() const
    {
        return tempi.size() + temps.size() + tempp.size() +
            + freetempi.size() + freetemps.size() + freetempp.size();
    }
    void freetempregs()
    {
        using std::copy;
        using std::back_inserter;
        copy(tempi.begin(), tempi.end(), back_inserter(freetempi));
        tempi= std::vector<std::string>();
        copy(temps.begin(), temps.end(), back_inserter(freetemps));
        temps= std::vector<std::string>();
        copy(tempp.begin(), tempp.end(), back_inserter(freetempp));
        tempp= std::vector<std::string>();
    }
private:
    unsigned int subblocks;
    unsigned int nreg;
    unsigned int nlabel;
    std::vector <std::string> tempi;
    std::vector <std::string> temps;
    std::vector <std::string> tempp;
    std::vector <std::string> freetempi;
    std::vector <std::string> freetemps;
    std::vector <std::string> freetempp;
};

std::string FunctionBlock::genlocalregister(char type)
{
    if (type != REGint && type != REGstring && type != REGvar)
        throw InternalError("invalid register type");
    std::ostringstream l;
    l << '$' << type << ++nreg;
    return l.str();
}

void FunctionBlock::freelocalregister(const std::string &reg)
{
    if (reg.at(0) != '$')
        throw InternalError("invalid free register");
    switch(reg.at(1))
    {
    case REGint:    freetempi.push_back(reg); break;
    case REGstring: freetemps.push_back(reg); break;
    case REGvar:    freetempp.push_back(reg); break;
    default: throw InternalError("invalid free register");
    }
}

void FunctionBlock::freeregister(const std::string &reg)
{
   return freelocalregister(reg);
}

std::string FunctionBlock::genregister(char type)
{
    return genlocalregister(type);
}

std::string FunctionBlock::gentemp(char type)
{
    std::vector<std::string> &usefree= type == REGint ? freetempi :
        type == REGstring ? freetemps : freetempp;
    std::string temp;
    if (usefree.size() > 0)
    {
        temp= usefree.back();
        usefree.pop_back();
    }
    else
    {
        temp= genlocalregister(type);
        switch(type)
        {
        case REGint:    tempi.push_back(temp); break;
        case REGstring: temps.push_back(temp); break;
        default:        tempp.push_back(temp); break;
        }
    }
    return temp;
}

std::string FunctionBlock::genlocallabel()
{
    std::ostringstream l;
    l << "__label_" << ++nlabel;
    return l.str();
}

//**********************************************************************

class NamespaceBlockBase;
class Expr;

//**********************************************************************

class BaseStatement
{
public:
    virtual bool isempty() { return false; }
    virtual void emit (Emit &e) = 0;
    virtual BaseStatement *optimize() { return this; }
    void optimize_branch(BaseStatement *&branch);
    void optimize_branch(Expr *&branch);
    virtual ~BaseStatement() { };
};

//**********************************************************************

class MultiStatement : public BaseStatement
{
public:
    MultiStatement(BaseStatement *st1, BaseStatement *st2)
    {
        subst.push_back(st1);
        subst.push_back(st2);
    }
    void push(BaseStatement *st)
    {
        subst.push_back(st);
    }
private:
    std::vector <BaseStatement *> subst;
    BaseStatement *optimize()
    {
        for (size_t i= 0; i < subst.size(); ++i)
            subst[i] = subst[i]->optimize();
        return this;
    }
    void emit (Emit &e)
    {
        for (size_t i= 0; i < subst.size(); ++i)
            subst[i]->emit(e);
    }
};

BaseStatement *addtomulti(BaseStatement *oldst, BaseStatement *newst)
{
    if (! oldst)
        return newst;
    else if (MultiStatement *multi = dynamic_cast<MultiStatement *>(oldst))
    {
        multi->push(newst);
        return multi;
    }
    else
        return new MultiStatement(oldst, newst);
}

//**********************************************************************

enum ClassSpecifierType
{
    CLASSSPECIFIER_invalid,
    CLASSSPECIFIER_parrotkey,
    CLASSSPECIFIER_id
};

class ClassSpecifier : public Annotated
{
protected:
    ClassSpecifier(const Token &t) : Annotated(t)
    { }
public:
    virtual ClassSpecifierType reftype() const
    { return CLASSSPECIFIER_invalid; }
    virtual ~ClassSpecifier() {}
    virtual std::string basename() const = 0;
    virtual void emit(Emit &e) = 0;
};

ClassSpecifier *parseClassSpecifier(const Token &start, Tokenizer &tk,
        BlockBase &owner);

//**********************************************************************

class SubStatement : public BaseStatement, public InBlock
{
public:
    SubStatement(Block &block);
};

SubStatement::SubStatement(Block &block) :
    InBlock(block)
{
}

//**********************************************************************

class EmptyStatement : public BaseStatement
{
private:
    bool isempty() { return true; }
    void emit (Emit &) { };
};

//**********************************************************************

class BlockStatement : public BaseStatement, public SubBlock
{
public:
    BlockStatement (Block &parentblock) :
            SubBlock(parentblock)
    {
    }
};

//**********************************************************************

class Expr : public InBlock, public Annotated
{
public:
    Expr(BlockBase &block, const Token & tstart) :
        InBlock(block),
        Annotated(tstart)
    {
    }
    virtual Expr *optimize()
    {
        return this;
    }
    virtual bool isleft() const { return false; }
    virtual void emitleft(Emit &)
    {
        std::cerr << typeid(*this).name() << '\n';
        throw InternalError("Not a left-side expression");
    }
    virtual void emitleft(Emit &, const std::string &)
    {
        std::cerr << typeid(*this).name() << '\n';
        throw InternalError("Not a left-side expression");
    }
    virtual void emitassign(Emit &, Expr &, const std::string &)
    {
        std::cerr << typeid(*this).name() << '\n';
        throw InternalError("Not an assignable expression");
    }
    virtual void emit(Emit &e, const std::string &result) = 0;
    virtual std::string emit_get(Emit &e);
    virtual bool issimple() const { return false; }
    virtual const Token &gettoken() const
    {
        std::cerr << typeid(*this).name() << '\n';
        throw InternalError("In gettoken: Not a simple expression");
    }
    virtual bool isidentifier() const { return false; }
    virtual std::string getidentifier() const
    { throw InternalError("Not an identifier"); }
    virtual bool isnull() const { return false; }
    virtual bool isliteralinteger() const { return false; }
    virtual bool isinteger() const { return false; }
    virtual int getintegervalue () const
    {
        std::cerr << typeid(*this).name() << '\n';
        throw InternalError("Not an integer");
    }
    virtual bool isliteralstring() const { return false; }
    virtual std::string getstringvalue () const
    { throw InternalError("Not a string"); }
    virtual bool isstring() const { return false; }
    virtual bool isindex() const { return false; }
    char checkresult() const
    {
        if (isinteger() ) return REGint;
        else if (isstring() ) return REGstring;
        else return REGvar;
    }
    void optimize_branch(Expr *&branch)
    { branch= branch->optimize(); }
};

Expr * parseExpr(BlockBase &block, Tokenizer &tk);

//**********************************************************************

class Condition : public InBlock
{
public:
    Condition (Block &block, Tokenizer &tk);
    Condition (BlockBase &block, Expr *condexpr);
    Condition *optimize();
    bool issimple() const;
    bool isinteger() const { return true; }
    //bool isstring() const { return expr->isstring(); }
    bool isliteralinteger() const;
    std::string value() const;
    std::string emit(Emit &e);
    void emit_if(Emit &e, const std::string &labeltrue);
    void emit_else(Emit &e, const std::string &labelfalse);
    enum Value { CVtrue, CVfalse, CVruntime };
    Value getvalue() const;
private:
    Expr *expr;
};

//**********************************************************************

void BaseStatement::optimize_branch(BaseStatement *&branch)
{
    if (branch)
        branch= branch->optimize();
}

void BaseStatement::optimize_branch(Expr *&branch)
{
    if (branch)
        branch= branch->optimize();
}

//**********************************************************************

class Modifier
{
public:
    Modifier(BlockBase &block, Tokenizer &tk)
    {
        Token t= tk.get();
        if (!t.isidentifier())
            throw Expected("Modifier name", t);
        start = t;
        name= t.identifier();
        t= tk.get();
        if (!t.isop('('))
            tk.unget(t);
        else
        {
            do
            {
                args.push_back(parseExpr(block, tk));
            } while ((t= tk.get()).isop(','));
            RequireOp(')', t);
        }
    }
    std::string getname() const { return name; }
    Token getstart() const { return start; }
    void optimize()
    {
        for (size_t i= 0; i < args.size(); ++i)
            args[i]= args[i]->optimize();
    }
    size_t numargs() const { return args.size(); }
    Expr *getarg(size_t narg) const
    {
        return args.at(narg);
    }
    int getintegervalue(size_t narg) const
    {
        Expr *arg= args.at(narg);
        return arg->getintegervalue();
    }
    std::string getstringvalue(size_t narg) const
    {
        Expr *arg= args.at(narg);
        return arg->getstringvalue();
    }
private:
    Token start;
    std::string name;
    std::vector <Expr *> args;
};

//**********************************************************************

class ModifierList
{
public:
    bool has_modifier(const std::string &name) const
    {
        return modifiers.find(name) != modifiers.end();
    }
    const Modifier * getmodifier(const std::string &name) const
    {
        ModList::const_iterator it= modifiers.find(name);
        if (it != modifiers.end())
            return &it->second;
        else
            return NULL;
    }
    void parse(BlockBase &block, Tokenizer &tk)
    {
        Token t;
        do {
            Modifier m(block, tk);
            std::string name= m.getname();
            modifiers.insert(std::make_pair(name, m));
        } while ((t= tk.get()).isop(','));
        RequireOp(']', t);
    }
    void optimize()
    {
        for (ModList::iterator it= modifiers.begin();
                it != modifiers.end(); ++it)
           it->second.optimize();
    }
protected:
    typedef std::map<std::string, Modifier> ModList;
    ModList modifiers;
};

//**********************************************************************

class FunctionModifiers : public ModifierList
{
public:
    FunctionModifiers(BlockBase &block, Tokenizer &tk)
    {
        Token t= tk.get();
        if (! t.isop('[') )
            tk.unget(t);
        else
            parse(block, tk);
    }
};

//**********************************************************************

class ArgumentModifierList : public ModifierList
{
public:
    void emitmodifiers(Emit &e)
    {
        bool isflat = false, isnamed = false;
        Expr * setname = 0;
        for (ModList::iterator it = modifiers.begin(); it != modifiers.end();
                ++it)
        {
            std::string name = it->first;
            Modifier &modifier = it->second;
            if (name == "flat")
                isflat = true;
            if (name == "named")
            {
                isnamed = true;
                switch (modifier.numargs())
                {
                  case 0:
                    break;
                  case 1:
                    setname = modifier.getarg(0);
                    break;
                  default:
                    throw SyntaxError("Invalid modifier", modifier.getstart());
                }
            }
        }
        if (isflat)
        {
            if (isnamed)
                e << " :flat :named";
            else
                e << " :flat";
        }
        else if (isnamed)
        {
            e << " :named";
            if (setname)
                e << '(';
                setname->emit(e, "");
                e << ')';
        }
    }
};

class Argument
{
public:
    Argument(BlockBase &block, Tokenizer &tk) :
            modifiers(0)
    {
        expr = parseExpr(block, tk);
        Token t = tk.get();
        if (t.isop(':'))
        {
            t = tk.get();
            if (! t.isop('['))
                throw Expected("modifier list", t);
            modifiers = new ArgumentModifierList();
            modifiers->parse(block, tk);
        }
        else
            tk.unget(t);
    }
    Expr *get()
    {
        return expr;
    }
    ArgumentModifierList *getmodifiers()
    {
        return modifiers;
    }
    Argument *optimize()
    {
        expr= expr->optimize();
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        expr->emit(e, result);
    }
private:
    Expr *expr;
    ArgumentModifierList *modifiers;
};

class ArgumentList : public InBlock
{
public:
    ArgumentList(BlockBase &block, Tokenizer &tk, char delimiter);
    int numargs() const
    {
        return args ? args->size() : 0;
    }
    Expr *getfreearg(int i)
    {
        return args->at(i)->get();
    }
    void optimize();
    void prepare(Emit &e);
    void emit(Emit &e);
private:
    std::vector <Argument *> *args;
    std::vector <std::string> argregs;
};

//**********************************************************************

class ExprStatement : public BaseStatement
{
public:
    ExprStatement(Block &parentblock, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);

    Expr *expr;
};

//**********************************************************************

class CompoundStatement : public BlockStatement
{
public:
    CompoundStatement(Block &parentblock, Tokenizer &tk);
    BaseStatement *optimize();
    void emit (Emit &e);
    Token getend() const { return tend; }
private:
    std::vector <BaseStatement *> subst;
    Token tend;
};

//**********************************************************************

class ValueStatement : public SubStatement, public Annotated
{
public:
    ValueStatement(Block & block, const Token & tstart);
protected:
    void parseArray(Tokenizer &tk);
    void emit (Emit &e, const std::string &name, char type);

    enum ValueType { ValueSimple, ValueArray, ValueFixedArray };
    ValueType vtype;
    Expr *esize;
    std::vector<Expr *> value;
private:
    BaseStatement *optimize();
};

//**********************************************************************

class IntStatement : public ValueStatement
{
public:
    IntStatement(Block & block, const Token &st, Tokenizer &tk);
    void emit (Emit &e);
    using ValueStatement::emit;
private:
    std::string name;
};

//**********************************************************************

class StringStatement : public ValueStatement
{
public:
    StringStatement(Block & block, const Token &st, Tokenizer &tk);
    void emit (Emit &e);
    using ValueStatement::emit;
private:
    std::string name;
};

//**********************************************************************

template <class DECST> 
BaseStatement *parseDeclare(Block & block, const Token &st, Tokenizer &tk)
{
    BaseStatement *multi = 0;
    Token t;
    do {
       BaseStatement *item = new DECST(block, st, tk);
       multi = addtomulti(multi, item);
       t= tk.get();
    } while (t.isop(','));
    RequireOp (';', t);
    return multi;
}

//**********************************************************************

class VarStatement : public ValueStatement
{
public:
    VarStatement(Block & block, const Token &st, Tokenizer &tk);
    void emit (Emit &e);
private:
    std::string name;
};

//**********************************************************************

class ConstStatement : public ValueStatement
{
public:
    ConstStatement(Block & block, const Token &st, Tokenizer &tk, char typed);
    BaseStatement *optimize();
    void emit (Emit &e);
private:
    char type;
    std::string name;
    Expr *value;
};

BaseStatement * parseConst(Block & block, const Token &st, Tokenizer &tk);

//**********************************************************************

class LabelStatement: public SubStatement
{
public:
    LabelStatement(Block &block, const std::string &name);
    void emit (Emit &e);
private:
    std::string labelname;
    std::string codename;
};

//**********************************************************************

class ReturnStatement : public SubStatement, public Annotated
{
public:
    ReturnStatement(Block & block, const Token & tstart, Tokenizer &tk);
    BaseStatement *optimize();
    void emit (Emit &e);
private:
    ArgumentList *values;
};

//**********************************************************************

class BreakStatement : public SubStatement
{
public:
    BreakStatement(Block &block, Tokenizer &tk) :
        SubStatement(block)
    {
        ExpectOp(';', tk);
    }
private:
    void emit (Emit &e)
    {
        e << INDENT "goto " << getbreaklabel() << " # break\n";
    }
};

//**********************************************************************

class ContinueStatement : public SubStatement
{
public:
    ContinueStatement(Block &block, Tokenizer &tk) :
        SubStatement(block)
    {
        ExpectOp(';', tk);
    }
private:
    void emit (Emit &e)
    {
        e << INDENT "goto " << getcontinuelabel() << " # continue\n";
    }
};

//**********************************************************************

class BreakableStatement : public BlockStatement
{
protected:
    BreakableStatement(Block &block) :
        BlockStatement(block)
    { }
    std::string getbreaklabel() const
    {
        if (breaklabel.empty())
            throw InternalError("attempt to use break label before creating");
        return breaklabel;
    }
    std::string genbreaklabel()
    {
        if (! breaklabel.empty())
            throw InternalError("attempt to create break label twice");
        breaklabel = genlabel();
        return breaklabel;
    }
private:
    std::string breaklabel;
};

class ContinuableStatement : public BreakableStatement
{
protected:
    ContinuableStatement(Block &block) :
        BreakableStatement(block)
    { }
    std::string getcontinuelabel() const
    {
        if (continuelabel.empty())
            throw InternalError("attempt to use continue label before creating");
        return continuelabel;
    }
    std::string gencontinuelabel()
    {
        if (! continuelabel.empty())
            throw InternalError("attempt to create continue label twice");
        continuelabel = genlabel();
        return continuelabel;
    }
private:
    std::string continuelabel;
};

//**********************************************************************

class SwitchBaseStatement : public BreakableStatement
{
protected:
    SwitchBaseStatement(Block &block);
    void parse_cases(Tokenizer &tk);
    std::vector<Expr *> casevalue;
    std::vector<std::vector<BaseStatement *> > casest;
    std::vector<BaseStatement *> defaultst;
    BaseStatement *optimize();
};

class SwitchStatement : public SwitchBaseStatement
{
public:
    SwitchStatement(Block &block, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);
    Expr *condition;
};

class SwitchCaseStatement : public SwitchBaseStatement
{
public:
    SwitchCaseStatement(Block &block, Tokenizer &tk);
private:
    void emit (Emit &e);
};

//**********************************************************************

class IfStatement : public BlockStatement
{
public:
    IfStatement(Block &block, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);
    Condition *condition;
    BaseStatement *st;
    BaseStatement *stelse;
};

//**********************************************************************

class WhileStatement : public ContinuableStatement
{
public:
    WhileStatement(Block &block, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);
    Condition *condition;
    BaseStatement *st;
};

//**********************************************************************

class DoStatement : public ContinuableStatement
{
public:
    DoStatement(Block &block, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);
    Condition *condition;
    BaseStatement *st;
};

//**********************************************************************

class ForeachStatement : public ContinuableStatement
{
public:
    ForeachStatement(Block &block, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);

    Token start;
    std::string varname;
    char vartype;
    Expr * container;
    BaseStatement *st;
};

//**********************************************************************

class ForStatement : public ContinuableStatement
{
public:
    ForStatement(Block &block, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);

    BaseStatement * initializer;
    Expr * condition;
    Expr * iteration;
    BaseStatement *st;
};

//**********************************************************************

class ThrowStatement : public SubStatement
{
public:
    ThrowStatement(Block &block, const Token &st, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);
    Token pos;
    Expr * excep;
};

//**********************************************************************

class TryStatement : public BlockStatement, public Annotated
{
public:
    TryStatement(Block &block, const Token &st, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);
    BaseStatement *stry;
    BaseStatement *scatch;
    std::string exname;
};

//**********************************************************************

class FunctionParameter
{
public:
    FunctionParameter(FunctionStatement *owner, Tokenizer &tk);
    char gettype() const { return type; }
    std::string getname() const { return name; }
    void emit (Emit &e);
private:
    std::string name;
    char type;
    ModifierList modifiers;
    bool has_modifier(const std::string &name) const
    {
        return modifiers.has_modifier(name);
    }
};

//**********************************************************************

class FunctionStatement : protected FunctionModifiers, public FunctionBlock,
        public Annotated
{
public:
    FunctionStatement(Tokenizer &tk, const Token & tstart,
        Block &parent,
        const std::string &funcname);
    virtual std::string getsubid() const;
    std::string getname() const { return name; }
    void optimize();
    virtual void emit (Emit &e);
    void local(std::string name);
    bool islocal(std::string name) const;
    virtual void emitparams (Emit &e);
    virtual void emitbody (Emit &e);
    virtual ~FunctionStatement() {}
private:
    const std::string name;
    std::vector <std::string> params;
    std::map <std::string, FunctionParameter *> paraminfo;
    std::vector <std::string> loc;
    BaseStatement *body;
    Token tend;
};

//**********************************************************************

class ClassStatement : public SubBlock
{
public:
    ClassStatement(NamespaceBlockBase &ns_b, Tokenizer &tk);
    const std::string &getname() const { return name; }
    void emit (Emit &e);
    std::vector <Token> attributes() const { return attrs; }
    void optimize();
    const NamespaceKey &getkey() const;
    void emitkey (Emit &e) const;
private:
    unsigned int subblocks;
    unsigned int blockid()
    {
        return ++subblocks;
    }

    std::string genlocallabel() { throw InternalError("No Class labels"); }
    std::string genlocalregister(char) { throw InternalError("No Class registers"); }

    Token start;
    std::string name;
    NamespaceKey ns;
    std::vector <ClassSpecifier *> parents;
    std::vector <FunctionStatement *> functions;
    std::vector <Token> attrs;
    std::vector <BaseStatement *> constants;
};

//**********************************************************************

FunctionParameter::FunctionParameter(FunctionStatement *owner, Tokenizer &tk)
{
    Token t = tk.get();
    type= nativetype(t);
    if (type == '\0')
        throw Expected("parameter type", t);
    t= tk.get();
    name= t.identifier();
    t= tk.get();
    if (t.isop('['))
        modifiers.parse(*owner, tk);
    else
        tk.unget(t);
}

void FunctionParameter::emit (Emit &e)
{
    e << ".param " << nameoftype(type) << ' ' <<
            name;
    bool isslurpy = has_modifier("slurpy");
    bool isnamed = has_modifier("named");
    if (isslurpy) {
        e << " :slurpy";
        // Special case for named slurpy
        if (isnamed)
            e << " :named";
    }
    else {
        // Unfinished
        if (isnamed)
            e << " :named";
    }
    if (has_modifier("optional"))
        e << " :optional";
    if (has_modifier("opt_flag"))
        e << " :opt_flag";
    e << '\n';
}

//**********************************************************************

BaseStatement *parseFor(Block &block, Tokenizer &tk)
{
    Token t1= tk.get();
    if (t1.isop('(') )
    {
        Token t2= tk.get();
        Token t3= tk.get();
        Token t4= tk.get();
        if (t2.isidentifier() && (
            t3.iskeyword("in") || (t4.iskeyword("in"))))
        {
            tk.unget(t4);
            tk.unget(t3);
            tk.unget(t2);
            return new ForeachStatement(block, tk);
        }
        else
        {
            tk.unget(t4);
            tk.unget(t3);
            tk.unget(t2);
            return new ForStatement(block, tk);
        }
    }
    else
        throw Expected("for condition", t1);
}

BaseStatement *parseSwitch(Block &block, Tokenizer &tk)
{
    Token t = tk.get();
    if (t.isop('('))
        return new SwitchStatement(block, tk);
    if (t.isop('{'))
        return new SwitchCaseStatement(block, tk);
    throw Expected("'(' o '{' after switch", t);
}

BaseStatement *parseStatement(Block &block, Tokenizer &tk)
{
    Token t= tk.get();
    while (t.isspace() )
        t= tk.get();

    if (t.isop(';'))
        return new EmptyStatement();
    if (t.isop('{') )
        return new CompoundStatement(block, tk);
    switch(nativetype(t))
    {
    case REGint:
        return parseDeclare<IntStatement>(block, t, tk);
    case REGstring:
        return parseDeclare<StringStatement>(block, t, tk);
    case REGvar:
        return new VarStatement(block, t, tk);
    default: /* Not a declaration */ ;
    }
    if (t.iskeyword("const"))
        return parseConst(block, t, tk);

    if (t.iskeyword("return"))
        return new ReturnStatement(block, t, tk);
    if (t.iskeyword("break"))
        return new BreakStatement(block, tk);
    if (t.iskeyword("continue"))
        return new ContinueStatement(block, tk);
    if (t.iskeyword("if"))
        return new IfStatement(block, tk);
    if (t.iskeyword("switch"))
        return parseSwitch(block, tk);
    if (t.iskeyword("while"))
        return new WhileStatement(block, tk);
    if (t.iskeyword("do"))
        return new DoStatement(block, tk);
    if (t.iskeyword("for"))
        return parseFor(block, tk);
    if (t.iskeyword("throw"))
        return new ThrowStatement(block, t, tk);
    if (t.iskeyword("try"))
        return new TryStatement(block, t, tk);

    tk.unget(t);
    return new ExprStatement(block, tk);
}

//**********************************************************************

ArgumentList::ArgumentList(BlockBase &block, Tokenizer &tk, char delimiter) :
    InBlock(block),
    args(0)
{
    Token t = tk.get();
    if (! t.isop(delimiter))
    {
        args= new std::vector<Argument *>;
        tk.unget(t);
        do
        {
            Argument *arg= new Argument(block, tk);
            args->push_back(arg);
            t= tk.get();
        } while (t.isop(','));
        if (! t.isop(delimiter))
            throw SyntaxError("Unfinished argument list", t);
    }
}

void ArgumentList::optimize()
{
    if (args)
        for (size_t i= 0; i < args->size(); ++i)
            (*args)[i]= (*args)[i]->optimize();
}

void ArgumentList::prepare(Emit &e)
{
    std::string nullreg;
    if (args)
    {
        for (size_t i= 0; i < args->size(); ++i)
        {
            Expr &arg= *((*args)[i]->get());
            std::string reg;
            if (! arg.issimple() )
            {
                arg.annotate(e);
                reg= arg.emit_get(e);
            }
            else
            {
                if (arg.isnull())
                {
                    if (nullreg.empty())
                    {
                        nullreg= gentemp(REGvar);
                        e << op_null(nullreg) << '\n';
                    }
                    reg= nullreg;
                }
                else if (arg.isidentifier())
                {
                    std::string name = arg.getidentifier();
                    FunctionStatement *fun = getfunction(name);
                    if (fun)
                    {
                        name = fun->getsubid();
                        e << ".const 'Sub' " << name << " = '" << name << "'\n";
                        reg = name;
                    }
                }
            }
            argregs.push_back(reg);
        }
    }
}

void ArgumentList::emit(Emit &e)
{
    if (args)
    {
        for (size_t i= 0; i < args->size(); ++i)
        {
            if (i > 0)
                e << ", ";
            if (argregs[i].empty() )
                (*args)[i]->emit(e, std::string() );
            else
                e << argregs[i];
            if (ArgumentModifierList *modifiers = (*args)[i]->getmodifiers())
            {
                modifiers->emitmodifiers(e);
            }
        }
    }
}

//**********************************************************************

std::string Expr::emit_get(Emit &e)
{
    std::string reg = gentemp(checkresult());
    emit(e, reg);
    return reg;
}

//**********************************************************************

class SimpleBaseExpr : public Expr
{
public:
    SimpleBaseExpr(BlockBase &block, const Token & token) :
        Expr(block, token),
        t(token)
    { }
private:
    const Token &gettoken() const { return t; }
    bool issimple() const { return true; }
protected:
    const Token t;
};

//**********************************************************************

class StringExpr : public SimpleBaseExpr
{
public:
    StringExpr(BlockBase &block, Token token) :
        SimpleBaseExpr(block, token)
    {
        if (! t.isliteralstring())
            throw InternalError("Invalid literal string");
    }
private:
    bool isliteralstring() const { return true; }
    bool isstring() const { return true; }
    bool issinglequoted() const
    {
        return t.issinglequoted();
    }
    std::string getstringvalue() const
    {
        return t.str();
    }
    void emit(Emit &e, const std::string &result)
    {
        if (!result.empty() )
            e << INDENT << result << " = ";
        e << t.pirliteralstring();
        if (!result.empty() )
            e << '\n';
    }
};

//**********************************************************************

class IntegerExpr : public SimpleBaseExpr
{
public:
    IntegerExpr(BlockBase &block, Token token) :
        SimpleBaseExpr(block, token),
        value (t.getinteger())
    {
    }
    IntegerExpr(BlockBase &block, Token token, int n) :
        SimpleBaseExpr(block, Token(n, token)),
        value (n)
    {
    }
private:
    bool isliteralinteger() const { return true; }
    bool isinteger() const { return true; }
    int getintegervalue () const { return value; }

    void emit(Emit &e, const std::string &result)
    {
        if (!result.empty() )
            e << INDENT << result << " = ";
        e << getintegervalue();
        if (!result.empty() )
            e << '\n';
    }
    int value;
};

//**********************************************************************

class IdentifierExpr : public SimpleBaseExpr
{
public:
    IdentifierExpr(BlockBase &block, Token token) :
        SimpleBaseExpr(block, token)
    { }
private:
    bool isnull() const
    {
        return t.iskeyword("null");
    }
    bool isidentifier() const { return true; }
    std::string getidentifier() const
    {
        if (isnull())
            throw SyntaxError("Invalid 'null' usage", t);
        return t.identifier();
    }
    bool isinteger() const
    {
        return checklocal(t.str()) == REGint;
    }
    int getintegervalue () const
    {
        if (checkconstant(t.identifier()) == REGint)
        {
            ConstantValue cv= getconstant(t.identifier());
            if (cv.type () == REGint)
                return cv.value().getinteger();
        }
        throw SyntaxError("Not an integer value", t);
    }
    bool isstring() const
    {
        return checklocal(t.str()) == REGstring;
    }
    std::string getstringvalue() const
    {
        if (checkconstant(t.identifier()) == REGstring)
        {
            ConstantValue cv= getconstant(t.identifier());
            if (cv.type () == REGstring)
                return cv.value().str();
        }
        throw SyntaxError("Not a string value", t);
    }

    Expr *optimize();
    void emit(Emit &e, const std::string &result);
};

Expr *IdentifierExpr::optimize()
{
    char type= checkconstant(t.identifier());
    switch (type)
    {
    case REGint:
        {
        Token value = getconstant(t.identifier()).value();
        return new IntegerExpr(*this, t, value.getinteger());
        }
    case REGstring:
        {
        Token value = getconstant(t.identifier()).value();
        return new StringExpr(*this, value);
        }
    default: /* Not a constant */ ;
    }
    return this;
}

void IdentifierExpr::emit(Emit &e, const std::string &result)
{
    if (!result.empty() )
        e << INDENT << result << " = ";
    e << getidentifier();
    if (! result.empty() )
        e << '\n';
}

//**********************************************************************

class OpBaseExpr : public Expr
{
public:
    OpBaseExpr(BlockBase &block, const Token & tstart) :
            Expr(block, tstart)
    { }
};

//**********************************************************************

class OpUnaryBaseExpr : public OpBaseExpr
{
public:
    OpUnaryBaseExpr(BlockBase &block, const Token &t, Expr *subexpr) :
        OpBaseExpr(block, t),
        expr(subexpr)
    { }
protected:
    Expr * expr;
private:
    Expr *optimize()
    {
        optimize_branch(expr);
        return this;
    }
};

//**********************************************************************

class OpUnaryMinusExpr : public OpUnaryBaseExpr
{
public:
    OpUnaryMinusExpr(BlockBase &block, const Token & tstart, Expr *subexpr) :
        OpUnaryBaseExpr(block, tstart, subexpr)
    {
    }
private:
    bool isinteger () const { return expr->isinteger(); }
    Expr *optimize()
    {
        optimize_branch(expr);
        if (expr->isliteralinteger() )
        {
            const int n= expr->getintegervalue();
            return new IntegerExpr(*this, getstart(), -n);
        }
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string arg= gentemp(REGint);
        expr->emit(e, arg);
        std::string r= result.empty() ? gentemp(REGint) : result;
        annotate(e);
        e << INDENT << r << " = neg " << arg;
        if (! result.empty() )
            e << '\n';
    }
};

//**********************************************************************

class OpNotExpr : public OpUnaryBaseExpr
{
public:
    OpNotExpr(BlockBase &block, const Token & tstart, Expr *subexpr) :
        OpUnaryBaseExpr(block, tstart, subexpr)
    {
    }
private:
    bool isinteger () const { return true; }
    Expr *optimize()
    {
        optimize_branch(expr);
        if (expr->isnull() )
            return new IntegerExpr(*this, getstart(), 1);
        if (expr->isliteralinteger() )
        {
            const int n= expr->getintegervalue();
            return new IntegerExpr(*this, getstart(), !n);
        }
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string arg= gentemp(expr->isinteger() ? REGint : REGvar);
        expr->emit(e, arg);
        std::string r= result.empty() ?
            gentemp(REGint) :
            result;
        annotate(e);
        e << INDENT;
        if (expr->isinteger())
            e << "not ";
        else
            e << "isfalse ";
        e << r << ", " << arg;
        if (! result.empty() )
            e << '\n';
    }
};

//**********************************************************************

class BinOpExpr : public OpBaseExpr
{
protected:
    BinOpExpr(BlockBase &block, const Token & tstart, Expr *first, Expr *second) :
        OpBaseExpr(block, tstart),
        lexpr(first),
        rexpr(second)
    {
    }
    void optimize_operands()
    {
        optimize_branch(lexpr);
        optimize_branch(rexpr);
    }
    Expr *lexpr;
    Expr *rexpr;
private:
    Expr *optimize()
    {
        optimize_operands();
        return this;
    }
};

//**********************************************************************

class CommonBinOpExpr : public BinOpExpr
{
public:
    CommonBinOpExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        BinOpExpr(block, tstart, first, second)
    {
    }
protected:
    bool isstring() const
    {
        return lexpr->isstring() && rexpr->isstring();
    }
    bool isinteger() const
    {
        return lexpr->isinteger() && rexpr->isinteger();
    }
};


//**********************************************************************

class CompareOpExpr : public BinOpExpr
{
public:
    CompareOpExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        BinOpExpr(block, tstart, first, second)
    {
    }
protected:
    bool isinteger() const { return true; }
};

//**********************************************************************

class OpEqualExpr : public CompareOpExpr
{
public:
    OpEqualExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CompareOpExpr(block, tstart, first, second)
    { }
private:
    bool isinteger() const { return true; }
    Expr *optimize();
    void emit(Emit &e, const std::string &result);
};

Expr *OpEqualExpr::optimize()
{
    optimize_operands();
    if (lexpr->isnull() && rexpr->isnull())
    {
        return new IntegerExpr(*this, getstart(), 1);
    }
    if (lexpr->isliteralinteger() && rexpr->isliteralinteger())
    {
        return new IntegerExpr(*this, getstart(),
            lexpr->getintegervalue() == rexpr->getintegervalue());
    }
    if (lexpr->isliteralstring() && rexpr->isliteralstring())
    {
        std::string s1= lexpr->getstringvalue();
        std::string s2= rexpr->getstringvalue();
        return new IntegerExpr(*this, getstart(), s1 == s2);
    }
    return this;
}

void OpEqualExpr::emit(Emit &e, const std::string &result)
{
    std::string res= gentemp(REGint);
    if (lexpr->isnull() || rexpr->isnull())
    {
        std::string op;
        if (lexpr->isnull())
            op= rexpr->emit_get(e);
        else
            op= lexpr->emit_get(e);
        e << op_isnull(res, op);
    }
    else
    {
        char ltype = lexpr->checkresult();
        char rtype = rexpr->checkresult();
        if (ltype == rtype)
        {
            std::string op1= gentemp(ltype);
            std::string op2= gentemp(rtype);
            lexpr->emit(e, op1);
            rexpr->emit(e, op2);
            e << op_iseq(res, op1, op2);
        }
        else if (ltype == REGvar && rtype == REGstring)
        {
            std::string op1= gentemp(REGstring);
            std::string op2= gentemp(REGstring);
            std::string aux= gentemp(REGvar);
            lexpr->emit(e, aux);
            rexpr->emit(e, op2);
            e << INDENT << op1 << " = " << aux << '\n';
            e << op_iseq(res, op1, op2);
        }
        else if (ltype == REGstring && rtype == REGvar)
        {
            std::string op1= gentemp(REGstring);
            std::string op2= gentemp(REGstring);
            std::string aux= gentemp(REGvar);
            lexpr->emit(e, op1);
            rexpr->emit(e, aux);
            e << INDENT << op2 << " = " << aux << '\n';
            e << op_iseq(res, op1, op2);
        }
        else
        {
            std::string op1= gentemp(REGvar);
            std::string op2= gentemp(REGvar);
            if (lexpr->isinteger() )
            {
                std::string aux= gentemp(REGint);
                lexpr->emit(e, aux);
                e << op_box(res, aux) << '\n';
            }
            else if (lexpr->isstring() )
            {
                std::string aux= gentemp(REGstring);
                lexpr->emit(e, aux);
                e << op_box(op1, aux) << '\n';
            }
            else
                lexpr->emit(e, op1);
            if (rexpr->isinteger() )
            {
                std::string aux= gentemp(REGint);
                rexpr->emit(e, aux);
                e << op_box(op2, aux) << '\n';
            }
            else if (rexpr->isstring() )
            {
                std::string aux= gentemp(REGstring);
                rexpr->emit(e, aux);
                e << op_box(op2, aux) << '\n';
            }
            else
                rexpr->emit(e, op2);
            e << op_iseq(res, op1, op2);
        }
    }
    if (!result.empty())
        e << '\n' << INDENT << result << " = " << res << '\n';
}

//**********************************************************************

class OpNotEqualExpr : public CompareOpExpr
{
public:
    OpNotEqualExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CompareOpExpr(block, tstart, first, second)
    { }
private:
    Expr *optimize();
    void emit(Emit &e, const std::string &result);
};

Expr *OpNotEqualExpr::optimize()
{
    optimize_operands();
    if (lexpr->isnull() && rexpr->isnull())
        return new IntegerExpr(*this, getstart(), 0);
    if (lexpr->isliteralinteger() && rexpr->isliteralinteger())
        return new IntegerExpr(*this, getstart(),
            lexpr->getintegervalue() != rexpr->getintegervalue());
    if (lexpr->isliteralstring() && rexpr->isliteralstring())
        return new IntegerExpr(*this, getstart(),
            lexpr->getstringvalue() != rexpr->getstringvalue());
    return this;
}

void OpNotEqualExpr::emit(Emit &e, const std::string &result)
{
    std::string res= gentemp(REGint);
    if (lexpr->isnull() || rexpr->isnull())
    {
        std::string op;
        if (lexpr->isnull())
            op= rexpr->emit_get(e);
        else
            op= lexpr->emit_get(e);
        e << op_isnull(res, op) << '\n' <<
            INDENT "not " << res;
    }
    else if (lexpr->isinteger() && rexpr->isinteger())
    {
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << op_isne(res, op1, op2);
    }
    else if (lexpr->isstring() && rexpr->isstring())
    {
        std::string op1= gentemp(REGstring);
        std::string op2= gentemp(REGstring);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << op_isne(res, op1, op2);
    }
    else
    {
        std::string op1= gentemp(REGvar);
        std::string op2= gentemp(REGvar);
        if (lexpr->isinteger() )
        {
            std::string aux= gentemp(REGint);
            lexpr->emit(e, aux);
            e << op_box(op1, aux) << '\n';
        }
        else if (lexpr->isstring() )
        {
            std::string aux= gentemp(REGstring);
            lexpr->emit(e, aux);
            e << op_box(op1, aux) << '\n';
        }
        else
            lexpr->emit(e, op1);
        if (rexpr->isinteger() )
        {
            std::string aux= gentemp(REGint);
            rexpr->emit(e, aux);
            e << op_box(op2, aux) << '\n';
        }
        else if (rexpr->isstring() )
        {
            std::string aux= gentemp(REGstring);
            rexpr->emit(e, aux);
            e << op_box(op2, aux) << '\n';
        }
        else
            rexpr->emit(e, op2);
        e << INDENT << res << " = isne " << op1 << " , " << op2;
    }
    if (!result.empty())
        e << '\n' << INDENT << result << " = " << res << '\n';
}

//**********************************************************************

class OpSameExpr : public CompareOpExpr
{
public:
    OpSameExpr(bool positiveform, BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CompareOpExpr(block, tstart, first, second),
        positive(positiveform)
    { }
private:
    bool isinteger() const { return true; }
    void emit(Emit &e, const std::string &result)
    {
        char ltype = lexpr->checkresult();
        char rtype = rexpr->checkresult();
        if (! ((ltype == REGvar && rtype == REGvar) ||
                (ltype == REGstring && rtype == REGstring)))
            throw SyntaxError(std::string(positive ? "===" : "!==") +
                    " operator requires val types", getstart());
        std::string op1= gentemp(ltype);
        std::string op2= gentemp(rtype);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        std::string res= result.empty() ? gentemp(REGint) : result;
        e << INDENT << res << " = " << (positive ? "issame" : "isntsame") <<
            ' ' << op1 << " , " << op2;
        if (!result.empty())
            e << '\n' << INDENT << result << " = " << res << '\n';
    }
    bool positive;
};

//**********************************************************************

class ComparatorBaseExpr : public CompareOpExpr
{
protected:
    ComparatorBaseExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CompareOpExpr(block, tstart, first, second)
    {
    }
    virtual void emitop(Emit &e, 
        const std::string &res,
        const std::string &op1, const std::string &op2) = 0;
private:
    void emit(Emit &e, const std::string &result);
};

void ComparatorBaseExpr::emit(Emit &e, const std::string &result)
{
    std::string res= result.empty() ? gentemp(REGint) : result;
    char type1= lexpr->checkresult();
    char type2= rexpr->checkresult();
    if (type1 == REGint || type2 == REGint)
    {
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        if (type1 == REGint)
            lexpr->emit(e, op1);
        else {
            std::string aux= gentemp(REGvar);
            lexpr->emit(e, aux);
            e << INDENT << op1 << " = " << aux << '\n';
        }
        if (type2 == REGint)
            rexpr->emit(e, op2);
        else {
            std::string aux= gentemp(REGvar);
            rexpr->emit(e, aux);
            e << INDENT << op2 << " = " << aux << '\n';
        }
        emitop(e, res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
    else if (type1 == REGstring || type2 == REGstring)
    {
        std::string op1= gentemp(REGstring);
        std::string op2= gentemp(REGstring);
        if (type1 == REGstring)
            lexpr->emit(e, op1);
        else {
            std::string aux= gentemp(REGvar);
            lexpr->emit(e, aux);
            e << INDENT << op1 << " = " << aux << '\n';
        }
        if (type2 == REGstring)
            rexpr->emit(e, op2);
        else {
            std::string aux= gentemp(REGvar);
            rexpr->emit(e, aux);
            e << INDENT << op2 << " = " << aux << '\n';
        }
        emitop(e, res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
    else
    {
        std::string op1= gentemp(REGvar);
        std::string op2= gentemp(REGvar);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        emitop(e, res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
}

//**********************************************************************

class OpLessExpr : public ComparatorBaseExpr
{
public:
    OpLessExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        ComparatorBaseExpr(block, tstart, first, second)
    {
    }
private:
    void emitop(Emit &e, 
        const std::string &res,
        const std::string &op1, const std::string &op2)
    {
        e << op_islt(res, op1, op2);
    }
};

//**********************************************************************

class OpGreaterExpr : public ComparatorBaseExpr
{
public:
    OpGreaterExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        ComparatorBaseExpr(block, tstart, first, second)
    {
    }
private:
    void emitop(Emit &e, 
        const std::string &res,
        const std::string &op1, const std::string &op2)
    {
        e << op_isgt(res, op1, op2);
    }
};

//**********************************************************************

class OpLessEqualExpr : public ComparatorBaseExpr
{
public:
    OpLessEqualExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        ComparatorBaseExpr(block, tstart, first, second)
    {
    }
private:
    void emitop(Emit &e, 
        const std::string &res,
        const std::string &op1, const std::string &op2)
    {
        e << op_isle(res, op1, op2);
    }
};

//**********************************************************************

class OpGreaterEqualExpr : public ComparatorBaseExpr
{
public:
    OpGreaterEqualExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        ComparatorBaseExpr(block, tstart, first, second)
    {
    }
private:
    void emitop(Emit &e, 
        const std::string &res,
        const std::string &op1, const std::string &op2)
    {
        e << op_isge(res, op1, op2);
    }
};

//**********************************************************************

class OpAssignExpr : public BinOpExpr
{
public:
    OpAssignExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        BinOpExpr(block, tstart, first, second)
    {
    }
private:
    bool isinteger() const { return rexpr->isinteger(); }
    bool isstring() const { return rexpr->isstring(); }
    void emit(Emit &e, const std::string &result)
    {
        if (lexpr->isidentifier())
        {
            std::string varname= lexpr->getidentifier();
            char type= checklocal(varname);
            if (rexpr->isindex())
            {
                rexpr->emit(e, varname);
                if (! result.empty() )
                    e << INDENT << result << " = " << varname << '\n';
                return;
            }
            switch (type)
            {
            case REGint:
                if (!(rexpr->isinteger() || rexpr->isstring()))
                {
                    std::string r= gentemp(REGvar);
                    rexpr->emit(e, r);
                    annotate(e);
                    e << INDENT << varname << " = " << r << '\n';
                    if (! result.empty() )
                        e << INDENT << result << " = " << r << '\n';
                }
                else {
                    if (result.empty() )
                        rexpr->emit(e, varname);
                    else
                    {
                        std::string r= gentemp(REGint);
                        rexpr->emit(e, r);
                        annotate(e);
                        e << INDENT << varname << " = " << r << '\n';
                        e << INDENT << result << " = " << r << '\n';
                    }
                }
                break;
            case REGstring:
                if (rexpr->isnull())
                {
                    annotate(e);
                    e << op_null(varname) << '\n';
                }
                else if (!(rexpr->isinteger() || rexpr->isstring()))
                {
                    std::string r= gentemp(REGstring);
                    rexpr->emit(e, r);
                    annotate(e);
                    e << INDENT << varname << " = " << r << '\n';
                    if (! result.empty() )
                        e << INDENT << result << " = " << r << '\n';
                }
                else {
                    if (result.empty() )
                        rexpr->emit(e, varname);
                    else
                    {
                        std::string r= gentemp(REGstring);
                        rexpr->emit(e, r);
                        annotate(e);
                        e << INDENT << varname << " = " << r << '\n';
                        e << INDENT << result << " = " << r << '\n';
                    }
                }
                break;
            default:
                if (rexpr->isnull())
                {
                    annotate(e);
                    e << op_null(varname) << '\n';
                }
                else if (rexpr->isinteger() || rexpr->isstring() )
                {
                    annotate(e);
                    std::string r= gentemp(rexpr->checkresult());
                    rexpr->emit(e, r);
                    e << op_box(varname, r);
                    e << '\n';
                    if (! result.empty() )
                        e << INDENT << result << " = " << varname << '\n';
                }
                else
                {
                    rexpr->emit(e, varname);
                    if (! result.empty() )
                        e << INDENT << result << " = " << varname << '\n';
                }
            }
        }
        else
        {
            if (!lexpr->isleft() )
                throw SyntaxError("Not a left-side expression for '='", getstart());

            std::string reg= result.empty() ? std::string() :
                gentemp(rexpr->checkresult());
            lexpr->emitassign(e, *rexpr, reg);
            if (! result.empty() )
                e << INDENT << result << " = " << reg << '\n';
        }
    }
};

//**********************************************************************

class OpAddExpr : public CommonBinOpExpr
{
public:
    OpAddExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CommonBinOpExpr(block, tstart, first, second)
    {
    }
private:
    bool isstring () const
    {
        return (lexpr->isstring() &&
            (rexpr->isstring() || rexpr->isinteger()) ) ||
            (rexpr->isstring() &&
            (lexpr->isstring() || lexpr->isinteger()) );
    }
    Expr *optimize();
    void emit(Emit &e, const std::string &result);
};

Expr *OpAddExpr::optimize()
{
    optimize_operands();
    if (lexpr->isliteralinteger() && rexpr->isliteralinteger())
    {
        return new IntegerExpr(*this, getstart(),
            lexpr->getintegervalue() + rexpr->getintegervalue());
    }
    if (lexpr->isliteralstring() && rexpr->isliteralstring())
    {
        Token newt= Token(TokenTQuoted, lexpr->getstringvalue() + rexpr->getstringvalue(), lexpr->gettoken());
        return new StringExpr(*this, newt);
    }
    return this;
}

void OpAddExpr::emit(Emit &e, const std::string &result)
{
    if (lexpr->isstring() && rexpr->isstring())
    {
        std::string res= result.empty() ? gentemp(REGstring) : result;
        std::string op1= gentemp(REGstring);
        std::string op2= gentemp(REGstring);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << INDENT << res << " = concat " << op1 << " , " << op2;
    }
    else if (isinteger())
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << op_add(res, op1, op2);
    }
    else if (lexpr->isstring() && rexpr->isinteger())
    {
        std::string res= result.empty() ? gentemp(REGstring) : result;
        std::string op1= gentemp(REGstring);
        std::string op2= gentemp(REGint);
        std::string op2_s= gentemp(REGstring);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << op_set(op2_s, op2) << '\n' <<
            INDENT << res << " = concat " << op1 << " , " << op2_s;
    }
    else if (lexpr->isinteger() && rexpr->isstring())
    {
        std::string res= result.empty() ? gentemp(REGstring) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGstring);
        std::string op1_s= gentemp(REGstring);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << op_set(op1_s, op1) << '\n' <<
            res << " = concat " << op1_s << " , " << op2;
    }
    else
    {
        std::string res= result.empty() ? gentemp(REGvar) : result;
        std::string op1= gentemp(REGvar);
        std::string op2= gentemp(REGvar);
        switch (lexpr->checkresult() )
        {
        case REGint:
            e << INDENT << op1 << " = new 'Integer'\n";
            break;
        case REGstring:
            e << INDENT << op1 << " = new 'String'\n";
            break;
        default:
            e << op_null(op1) << '\n';
        }
        switch (rexpr->checkresult() )
        {
        case REGint:
            e << INDENT << op2 << " = new 'Integer'\n";
            break;
        case REGstring:
            e << INDENT << op2 << " = new 'String'\n";
            break;
        default:
            e << op_null(op2) << '\n';
        }
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << op_add(res, op1, op2);
    }
    if (!result.empty())
        e << '\n';
}

//**********************************************************************

class OpSubExpr : public CommonBinOpExpr
{
public:
    OpSubExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CommonBinOpExpr(block, tstart, first, second)
    {
    }
private:
    Expr *optimize()
    {
        optimize_operands();
        if (lexpr->isliteralinteger() && rexpr->isliteralinteger())
        {
            int n1= lexpr->getintegervalue();
            int n2= rexpr->getintegervalue();
            return new IntegerExpr(*this, getstart(), n1 - n2);
        }
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << op_sub(res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class OpBoolOrExpr : public BinOpExpr
{
public:
    OpBoolOrExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        BinOpExpr(block, tstart, first, second)
    { }
private:
    bool isinteger() const { return true; }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        if (rexpr->issimple())
        {
            lexpr->emit(e, op1);
            rexpr->emit(e, op2);
            e << INDENT << res << " = or " << op1 << ", " << op2;
        }
        else
        {
            std::string l = genlocallabel();
            lexpr->emit(e, res);
            annotate(e);
            e << INDENT "if " << res << " goto " << l << '\n';
            rexpr->emit(e, res);
            e << INDENTLABEL << l << ":\n";
        }
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class OpBinAndExpr : public CommonBinOpExpr
{
public:
    OpBinAndExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CommonBinOpExpr(block, tstart, first, second)
    {
    }
private:
    bool isinteger() const { return true; }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << INDENT << res << " = band " << op1 << ", " << op2;
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class OpBinOrExpr : public CommonBinOpExpr
{
public:
    OpBinOrExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CommonBinOpExpr(block, tstart, first, second)
    {
    }
private:
    bool isinteger() const { return true; }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << INDENT <<  res << " = bor " << op1 << ", " << op2;
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class OpBoolAndExpr : public OpBaseExpr
{
public:
    OpBoolAndExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        OpBaseExpr(block, tstart),
        lexpr(first),
        rexpr(second)
    { }
private:
    bool isinteger() const { return true; }
    Expr *optimize()
    {
        optimize_branch(lexpr);
        optimize_branch(rexpr);
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        if (rexpr->issimple())
        {
            lexpr->emit(e, op1);
            rexpr->emit(e, op2);
            annotate(e);
            e << INDENT << res << " = and " << op1 << ", " << op2;
        }
        else
        {
            std::string l = genlocallabel();
            lexpr->emit(e, res);
            annotate(e);
            e << INDENT "unless " << res << " goto " << l << '\n';
            rexpr->emit(e, res);
            e << INDENTLABEL << l << ":\n";
        }
        if (!result.empty())
            e << '\n';
    }
    Expr *lexpr;
    Expr *rexpr;
};

//**********************************************************************

class OpMulExpr : public CommonBinOpExpr
{
public:
    OpMulExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CommonBinOpExpr(block, tstart, first, second)
    { }
private:
    bool isinteger() const
    {
        return lexpr->isinteger() && rexpr->isinteger();
    }
    Expr *optimize()
    {
        optimize_operands();
        if (lexpr->isliteralinteger() && rexpr->isliteralinteger())
        {
            return new IntegerExpr(*this, getstart(),
                lexpr->getintegervalue() * rexpr->getintegervalue());
        }
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        char type= isinteger() ? REGint : REGvar;
        std::string res= result.empty() ? gentemp(type) : result;
        std::string op1= gentemp(type);
        std::string op2= gentemp(type);
        lexpr->emit(e, op1);
        rexpr->emit(e, op2);
        e << op_mul(res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
};


//**********************************************************************

class OpDivExpr : public CommonBinOpExpr
{
public:
    OpDivExpr(BlockBase &block,
            const Token & tstart, Expr *first, Expr *second) :
        CommonBinOpExpr(block, tstart, first, second)
    {
    }
private:
    void emit(Emit &e, const std::string &result)
    {
        char type= lexpr->isinteger() && rexpr->isinteger() ? REGint : REGvar;
        std::string res= result.empty() ? gentemp(type) : result;
        std::string op1= gentemp(type);
        std::string op2= gentemp(type);
        if (lexpr->isinteger() && type != REGint) {
            std::string i1= gentemp(REGint);
            lexpr->emit(e, i1);
            e << op_box(op1, i1);
        }
        else
            lexpr->emit(e, op1);
        if (rexpr->isinteger() && type != REGint) {
            std::string i2= gentemp(REGint);
            rexpr->emit(e, i2);
            e << op_box(op2, i2) << '\n';
        }
        else
            rexpr->emit(e, op2);
        if (result.empty())
            e << INDENT "new " << res << ", 'Integer'" << '\n';
        e << op_div(res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class ArrayExpr : public Expr
{
public:
    ArrayExpr(BlockBase &block, Tokenizer &tk, const Token & tstart) :
            Expr(block, tstart)
    {
        Token t = tk.get();
        if (! t.isop (']') )
        {
            tk.unget(t);
            do {
                elems.push_back(parseExpr(block, tk));
                t= tk.get();
            } while (t.isop(',') );
            RequireOp (']', t);
        }
    }
private:
    Expr *optimize()
    {
        for (size_t i= 0; i < elems.size(); ++i)
            optimize_branch(elems[i]);
        return this;
    }
    void emit(Emit &e, const std::string &result);
    std::vector<Expr *> elems;
};

static void emit_maybeboxed(Emit &e, BlockBase &bl,
        Expr &elem, const std::string &el)
{
    char type = elem.checkresult();
    switch (type)
    {
    case REGint: case REGstring:
        {
            std::string aux = bl.gentemp(type);
            elem.emit(e, aux);
            e << op_box(el, aux) << '\n';
        }
        break;
    default:
        elem.emit(e, el);
    }
}

void ArrayExpr::emit(Emit &e, const std::string &result)
{
    std::string reg = gentemp(REGvar);
    e << INDENT << reg << " = root_new ['parrot';'ResizablePMCArray']\n";
    for (size_t i= 0; i < elems.size(); ++i)
    {
        Expr *elem= elems[i];
        std::string el = gentemp(REGvar);
        if (elem->issimple())
        {
            if (elem->isidentifier())
            {
                std::string id= elem->getidentifier();
                if (checklocal(id))
                    emit_maybeboxed(e, *this, *elem, el);
                else if (FunctionStatement *fun = getfunction(id))
                {
                    std::string subid = fun->getsubid();
                    e << INDENT ".const 'Sub' " << subid << " = '" << subid << "'\n";
                    el = subid;
                }
                else
                    emit_maybeboxed(e, *this, *elem, el);
            }
            else
            {
                e << INDENT << el << " = box ";
                elem->emit(e, std::string());
                e << "\n";
            }
        }
        else
            emit_maybeboxed(e, *this, *elem, el);
        e << INDENT "push " << reg << " , " << el << '\n';
    }

    if (!result.empty())
        e << INDENT << result << " = " << reg << '\n';
}

//**********************************************************************

class HashExpr : public Expr
{
public:
    HashExpr(BlockBase &block, Tokenizer &tk, const Token & tstart);
private:
    Expr *optimize()
    {
        for (std::map<std::string, Expr *>::iterator
            it= elems.begin();
            it != elems.end();
            ++it)
        {
            optimize_branch(it->second);
        }
        return this;
    }
    void emit(Emit &e, const std::string &result);
    std::map<std::string, Expr *> elems;
};

HashExpr::HashExpr(BlockBase &block, Tokenizer &tk, const Token & tstart) :
    Expr(block, tstart)
{
    Token t = tk.get();
    if (! t.isop ('}') )
    {
        tk.unget(t);
        do {
            Token tkey= tk.get();
            if (! (tkey.isliteralstring() || tkey.isidentifier() ) )
                throw Expected("key", t);
            t= tk.get();
            RequireOp (':', t);
            Expr *value= parseExpr(block, tk);
            std::string key;
            if (tkey.isidentifier())
                key= "'" + tkey.identifier() + "'";
            else if (tkey.isliteralstring())
                key= tkey.pirliteralstring();
            else
                throw Expected("Identifier or string", tkey);
            elems[key]= value;
            t= tk.get();
        } while (t.isop(',') );
        RequireOp ('}', t);
    }
}

class EmitItem
{
public:
    EmitItem(Emit &em, HashExpr &block,
            const std::string reg) :
        e(&em), bl(block), r(reg) { }
    void operator() (std::pair<std::string, Expr *> elem)
    {
        Expr *value= elem.second;
        std::string reg;
        if (value->isidentifier() )
        {
            std::string id= value->getidentifier();
            if (bl.checklocal(id))
                reg= id;
            else if (FunctionStatement *fun = bl.getfunction(id))
            {
                std::string subid = fun->getsubid();
                (*e) << INDENT ".const 'Sub' " << subid << " = '" << subid << "'\n";
                reg = subid;
            }
            else
            {
                reg = bl.gentemp(REGvar);
                (*e) << INDENT "get_hll_global " << reg << ", '" <<
                    id << "'\n";
            }
        }
        else if (value->isinteger())
        {
            reg = bl.gentemp(REGint);
            value->emit(*e, reg);
        }
        else if (value->isstring())
        {
            reg = bl.gentemp(REGstring);
            value->emit(*e, reg);
        }
        else
        {
            reg = bl.gentemp(REGvar);
            value->emit(*e, reg);
        }
        (*e) << INDENT << r << " [" << elem.first << "] = " << reg << '\n';
    }
private:
    Emit *e;
    HashExpr &bl;
    std::string r;
};

void HashExpr::emit(Emit &e, const std::string &result)
{
    std::string reg = gentemp(REGvar);
    e << INDENT << reg << " = root_new ['parrot';'Hash']\n";
    std::for_each(elems.begin(), elems.end(), EmitItem(e, *this, reg) );
    if (!result.empty())
        e << INDENT << result << " = " << reg << '\n';
}

//**********************************************************************

class MemberExpr : public Expr
{
public:
    MemberExpr(BlockBase &block, Tokenizer &tk, const Token & tstart,
            Expr *leftexpr) :
        Expr(block, tstart),
        left(leftexpr),
        right(tk.get())
    {
        if (!right.isidentifier())
            throw Expected("identifier", right);
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string reg = gentemp(REGvar);
        std::string r = (result.empty() ||
                (result[0] == '$' && result.substr(0, 2) != "$P") ) ?
            gentemp(REGvar) : result;
        left->emit(e, reg);
        annotate(e);
        e << INDENT "getattribute " << r << ", " << reg <<
            ", '" << right.identifier() << "'\n";
        if (result != r)
            e << op_set(result, r) << '\n';
    }
    std::string getmember() const { return right.identifier(); }
    void emitleft(Emit &e, const std::string &result)
    {
        char type= left->checkresult();
        switch(type)
        {
        case REGint: case REGstring:
            {
                std::string aux= gentemp(type);
                left->emit(e, aux);
                e << op_box(result, aux) << '\n';
            }
            break;
        default:
            left->emit(e, result);
        }
    }
    bool isleft() const { return true; }
    void emitleft(Emit &)
    {
        throw InternalError("here");
    }
    void emitassign(Emit &e, Expr& value, const std::string &to)
    {
        annotate(e);
        std::string reg = gentemp(REGvar);
        left->emit(e, reg);
        char typevalue= value.checkresult();
        std::string regval= gentemp(typevalue);
        if (value.isnull())
            e << op_null(regval) << '\n';
        else
            value.emit(e, regval);
        e << '\n';
        std::string regattrval;
        if (typevalue == REGvar)
            regattrval= regval;
        else
        {
            regattrval= gentemp(REGvar);
            e << op_box(regattrval, regval) << '\n';
        }
        e << INDENT "setattribute " << reg << ", '" << right.identifier() <<
                "', " << regattrval << '\n';

        if (! to.empty())
            e << INDENT "set " << to << ", " << regattrval << '\n';
    }
private:
    Expr *left;
    Token right;
};

//**********************************************************************

class CallExpr : public Expr
{
public:
    CallExpr(BlockBase &block, Tokenizer &tk, const Token & tstart,
            Expr *function) :
        Expr(block, tstart),
        called(function),
        args(0)
    {
        Token t= tk.get();
        if (! t.isop (')') )
        {
            tk.unget(t);
            args= new ArgumentList(block, tk, ')');
        }
    }
    Expr * optimize()
    {
        if (args)
            args->optimize();
        return this;
    }
    bool isinteger() const;
    bool isstring() const;
private:
    void emit(Emit &e, const std::string &result);
    Expr *called;
    ArgumentList *args;
};


bool CallExpr::isinteger() const
{
    if (called->isidentifier())
    {
        std::string name= called->getidentifier();
        int numargs = args ? args->numargs() : 0;
        if (const BuiltinFunction *builtin=
                BuiltinFunction::find(name, numargs))
        {
            return builtin->resulttype() == REGint;
        }
    }
    return false;
}

bool CallExpr::isstring() const
{
    if (called->isidentifier())
    {
        std::string name= called->getidentifier();
        int numargs = args ? args->numargs() : 0;
        if (const BuiltinFunction *builtin=
                BuiltinFunction::find(name, numargs))
        {
            return builtin->resulttype() == REGstring;
        }
    }
    return false;
}

void CallExpr::emit(Emit &e, const std::string &result)
{
    const int numargs = args ? args->numargs() : 0;
    if (called->isidentifier())
    {
        annotate(e);
        std::string name= called->getidentifier();

    if (const BuiltinFunction *builtin=
            BuiltinFunction::find(name, numargs))
    {
        std::vector<std::string> argregs;
        for (int i= 0; i < numargs; ++i)
        {
            Expr &arg= * (args->getfreearg(i));
            char paramtype= builtin->paramtype(i);
            switch (paramtype)
            {
            case REGint:
                if (arg.isliteralinteger())
                    argregs.push_back(arg.gettoken().str());
                else if (arg.isinteger() && arg.isidentifier())
                    argregs.push_back(arg.getidentifier());
                else
                {
                    std::string reg= gentemp(REGint);
                    arg.emit(e, reg);
                    argregs.push_back(reg);
                }
                break;
            case REGstring:
                if (arg.isliteralstring())
                    argregs.push_back(arg.gettoken().pirliteralstring());
                else if (arg.isstring() && arg.isidentifier())
                    argregs.push_back(arg.getidentifier());
                else
                {
                    std::string reg= gentemp(REGstring);
                    arg.emit(e, reg);
                    argregs.push_back(reg);
                }
                break;
            case REGany:
                argregs.push_back(arg.emit_get(e));
                break;
            default:
                {
                    std::string reg= gentemp(REGvar);
                    char type= arg.checkresult();
                    switch(type)
                    {
                    case REGint:
                    case REGstring:
                        {
                        std::string reg2= gentemp(type);
                        arg.emit(e, reg2);
                        e << op_box(reg, reg2) << '\n';
                        }
                        break;
                    default:
                        arg.emit(e, reg);
                    }
                    argregs.push_back(reg);
                }
            }
        }
        if (builtin->resulttype())
        {
            std::string r;
            if (result.empty())
                r= gentemp(builtin->resulttype());
            else
                r= result;
            builtin->emit(e, r, argregs);
        }
        else
            builtin->emit(e, std::string(), argregs);
        return;
    }
    }

    if (args)
        args->prepare(e);

    std::string reg;
    if (called->isidentifier())
    {
        std::string name= called->getidentifier();
        bool is_local = islocal(name);
        if (! is_local) {
            FunctionStatement *fun = getfunction(name);
            if (fun) {
                name = fun->getsubid();
                e << INDENT ".const 'Sub' " << name << " = '" << name << "'\n";
                is_local = true;
            }
        }
        std::string quote(is_local ? "" : "'");
        name = quote + name + quote;
        annotate(e);
        e << INDENT;
        if (!result.empty() )
            e << result << " = ";
        e << name << '(';
    }
    else
    {
        reg= gentemp(REGvar);
        if (MemberExpr *me= dynamic_cast<MemberExpr*>(called))
        {
            std::string mefun= gentemp(REGvar);
            me->emitleft(e, mefun);
            annotate(e);
            e << INDENT << reg << " = " << mefun << ".'" << me->getmember() << "'(";
        }
        else
        {
            called->emit(e, reg);
            annotate(e);
            e << INDENT << reg << '(';
        }
    }

    // Arguments
    if (args)
        args->emit(e);

    e << ')';

    if (! reg.empty() )
    {
        e << '\n';
        if (!result.empty() )
            e << INDENT << result << " = " << reg << '\n';
    }
    else
    {
        if (!result.empty() )
            e << '\n';
    }
}

//**********************************************************************

class OpInstanceOf : public Expr
{
public:
    OpInstanceOf(BlockBase &block, const Token & tstart,
            Expr *subexpr, Tokenizer &tk) :
        Expr(block, tstart),
        obj(subexpr),
        checked(tk.get())
    {
    }
private:
    bool isinteger() const { return true; }
    Expr *optimize()
    {
        optimize_branch(obj);
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string checkedval;
        if (checked.isliteralstring())
            checkedval= checked.pirliteralstring();
        else if (checked.isidentifier())
        {
            ClassKey key;
            key.push_back(checked.identifier());
            ClassStatement *cl = findclass(key);
            if (cl)
                checkedval = cl->getkey().get_key();
            else
                checkedval= "'" + checked.identifier() + "'";
        }
        else
            throw CompileError("Unimplemented", checked);

        std::string reg= gentemp(REGvar);
        obj->emit(e, reg);
        annotate(e);

        if (result.empty() ) {
            std::string regcheck = gentemp(REGint);
            e << op_isa(regcheck, reg, checkedval) << '\n';
        }
        else
        {
            e << op_isa(result, reg, checkedval) << '\n';
        }
    }
    Expr *obj;
    Token checked;
};

//**********************************************************************

class NewExpr : public Expr
{
public:
    NewExpr(BlockBase &block, Tokenizer &tk, const Token & tstart);
private:
    Expr *optimize();
    void emit(Emit &e, const std::string &result);
    unsigned int ln;
    ClassSpecifier *claspec;
    ArgumentList *init;
};

NewExpr::NewExpr(BlockBase &block, Tokenizer &tk, const Token & tstart) :
    Expr(block, tstart),
    ln(tstart.linenum()),
    init(0)
{
    Token t= tk.get();

    claspec = parseClassSpecifier(t, tk, block);

    t= tk.get();

    if (t.isop('('))
        init = new ArgumentList(block, tk, ')');
    else
        tk.unget(t);
}

Expr *NewExpr::optimize()
{
    if (init)
        init->optimize();
    return this;
}

void NewExpr::emit(Emit &e, const std::string &result)
{
    std::string reg;
    std::string regnew = result;
    int numinits = init ? init->numargs() : -1;
    switch (numinits)
    {
    case -1:
    case 0:
        break;
    case 1:
        if (claspec->reftype() == CLASSSPECIFIER_id)
            regnew = gentemp(REGvar);
        else
        {
            reg = gentemp(REGvar);
            init->getfreearg(0)->emit(e, reg);
        }
        break;
    default:
        regnew = gentemp(REGvar);
        break;
    }

    
    if (! result.empty())
        e << INDENT << regnew << " = ";

    e << "new ";
    claspec->emit(e);
    if (! result.empty())
    {
        if (! reg.empty())
            e << ", " << reg;
    }
    e << '\n';

    if (numinits > 1 ||
            (numinits >= 0 && claspec->reftype() == CLASSSPECIFIER_id))
    {
        init->prepare(e);

        e << INDENT << regnew << ".'" << claspec->basename() << "'(";
        init->emit(e);
        e << ")\n";
        e << op_set(result, regnew) << '\n';
    }
}

//**********************************************************************

class NewIndexedExpr : public Expr
{
public:
    NewIndexedExpr(BlockBase &block, Tokenizer &tk, const Token & tstart) :
            Expr(block, tstart),
            init(0)
    {
        Token first = tk.get();
        if (!first.isliteralstring())
            throw Expected("string literal", first);
        Token t = tk.get();
        if (t.isop(':')) {
            hll = first.pirliteralstring();
            first = tk.get();
            if (!first.isliteralstring())
                throw Expected("string literal", first);
            t = tk.get();
        }
        nskey.push_back(first.pirliteralstring());
        while (t.isop(',')) {
            first = tk.get();
            if (!first.isliteralstring())
                throw Expected("string literal", first);
            nskey.push_back(first.pirliteralstring());
            t = tk.get();
        }
        t= tk.get();

        if (t.isop('('))
            init = new ArgumentList(block, tk, ')');
        else
            tk.unget(t);
    }
private:
    Expr *optimize()
    {
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        if (init) {
            if (init->numargs() != 1)
                throw SyntaxError("Wrong number of arguments", getstart());
            init->prepare(e);
        }
        std::string sep;
        if (!hll.empty()) {
            e << INDENT "root_new " << result << ", [" << hll;
            sep = ";";
        }
        else {
            e << INDENT "new " << result << ", ";
            sep = "[";
        }
        for (std::vector<std::string>::iterator it = nskey.begin();
            it != nskey.end(); ++it)
        {
            e << sep << *it;
            sep = ";";
        }
        e << "]";
        if (init) {
            e << ", ";
            init->emit(e);
        }
        e << "\n";
    }

    std::string hll;
    std::vector<std::string> nskey;
    ArgumentList *init;
};

//**********************************************************************

Expr *parseNew(BlockBase &block, Tokenizer &tk, const Token & tstart)
{
    Token t = tk.get();
    if (t.isop('['))
        return new NewIndexedExpr(block, tk, tstart);
    else {
        tk.unget(t);
        return new NewExpr(block, tk, tstart);
    }
}

//**********************************************************************

class IndexExpr : public Expr
{
public:
    IndexExpr(BlockBase &block, Tokenizer &tk, const Token & tname) :
        Expr(block, tname),
        name(tname.identifier())
    {
        Token t;
        do {
            Expr *newarg = parseExpr(block, tk);
            arg.push_back(newarg);
        } while ((t= tk.get()).isop(','));
        RequireOp (']', t);
    }
private:
    bool isleft() const { return true; }
    bool isindex() const { return true; }
    Expr *optimize();
    void emit(Emit &e, const std::string &result);
    void emitleft(Emit &e);
    void emitassign(Emit &e, Expr& value, const std::string &to);
    std::string name;
    std::vector <Expr *> arg;
};

Expr *IndexExpr::optimize()
{
    for (size_t i= 0; i < arg.size(); ++i)
        arg[i]= arg[i]->optimize();
    return this;
}

void IndexExpr::emit(Emit &e, const std::string &result)
{
    std::string reg;
    size_t nitems= arg.size();
    std::vector <std::string> argvalue(nitems);
    for (size_t i= 0; i < nitems; ++i)
    {
        if (! arg[i]->issimple() )
        {
            reg= arg[i]->emit_get(e);
            argvalue[i]= reg;
        }
    }
    if (!result.empty() )
        e << INDENT << result << " = ";
    e << name << '[';
    for (size_t i= 0; i < nitems; ++i)
    {
        if (i > 0) e << ';';
        if (argvalue[i].empty() )
            arg[i]->emit(e, std::string());
        else
            e << argvalue[i];
    }
    e << ']';
    if (!result.empty() )
        e << '\n';
}

void IndexExpr::emitleft(Emit &e)
{
    std::string reg;
    size_t nitems= arg.size();
    std::vector <std::string> argvalue(nitems);
    for (size_t i= 0; i < nitems; ++i)
    {
        if (! arg[i]->issimple() )
        {
            reg= gentemp(REGvar);
            arg[i]->emit(e, reg);
            argvalue[i]= reg;
        }
    }
    e << name << '[';
    for (size_t i= 0; i < nitems; ++i)
    {
        if (i > 0) e << ';';
        if (argvalue[i].empty() )
            arg[i]->emit(e, std::string());
        else
            e << argvalue[i];
    }
    e << ']';
}

void IndexExpr::emitassign(Emit &e, Expr& value, const std::string &to)
{
    std::string reg2;
    if (value.isnull()) {
        reg2= gentemp(REGvar);
        e << op_null(reg2) << '\n';
    }
    else
    {
        reg2= value.emit_get(e);
        e << '\n';
    }

    size_t nitems= arg.size();
    std::vector <std::string> argvalue(nitems);
    for (size_t i= 0; i < nitems; ++i)
    {
        if (! arg[i]->issimple() )
            argvalue[i]= arg[i]->emit_get(e);
    }
    e << INDENT << name << '[';
    for (size_t i= 0; i < nitems; ++i)
    {
        if (i > 0) e << ';';
        if (argvalue[i].empty() )
            arg[i]->emit(e, std::string());
        else
            e << argvalue[i];
    }
    e << "] = " << reg2 << '\n';

    if (!to.empty())
        e << INDENT "set " << to << ", " << reg2 << '\n';
}

//**********************************************************************

class OpConditionalExpr : public Expr
{
public:
    OpConditionalExpr(BlockBase &block, const Token & tstart,
            Expr *econd, Expr *etrue, Expr *efalse) :
        Expr(block, tstart),
        condition(new Condition(block, econd)),
        exprtrue(etrue),
        exprfalse(efalse)
    {
    }
private:
    bool isinteger() const { return exprtrue->isinteger(); }
    bool isstring() const { return exprtrue->isstring(); }
    Expr *optimize()
    {
        condition= condition->optimize();
        switch (condition->getvalue() )
        {
        case Condition::CVfalse:
            return exprfalse->optimize();
        case Condition::CVtrue:
            return exprtrue->optimize();
        default:
            exprtrue = exprtrue->optimize();
            exprfalse = exprfalse->optimize();
            return this;
        }
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string label_false= genlocallabel();
        std::string label_end= genlocallabel();
        condition->emit_else(e, label_false);
        exprtrue->emit(e, result);
        e << INDENT "goto " << label_end << '\n';
        e << INDENTLABEL << label_false << ":\n";
        if (exprfalse->isnull())
            e << op_null(result) << '\n';
        else
            exprfalse->emit(e, result);
        e << INDENTLABEL << label_end << ":\n";
    }
    Condition *condition;
    Expr *exprtrue;
    Expr *exprfalse;
};

//**********************************************************************

Expr * parseExpr_16(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_15(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_14(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_13(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_9(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_8(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_6(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_5(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_4(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_2(BlockBase &block, Tokenizer &tk);
Expr * parseExpr_0(BlockBase &block, Tokenizer &tk);

Expr * parseExpr_0(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= NULL;
    Token t= tk.get();

    if (t.isop('(') )
    {
        subexpr = parseExpr(block, tk);
        t= tk.get();
        RequireOp (')', t);
    }
    else if (t.isop('[') )
    {
        subexpr = new ArrayExpr(block, tk, t);
    }
    else if (t.isop('{') )
    {
        subexpr = new HashExpr(block, tk, t);
    }
    else if (t.iskeyword("new"))
            subexpr = parseNew(block, tk, t);
    else
    {
        Token t2= tk.get();
        if (t2.isop('[') )
            subexpr = new IndexExpr(block, tk, t);
        else
        {
            tk.unget(t2);
            if (t.isidentifier())
                subexpr = new IdentifierExpr(block, t);
            else if (t.isinteger())
                subexpr = new IntegerExpr(block, t);
            else if (t.isliteralstring())
                subexpr = new StringExpr(block, t);
            else
                throw SyntaxError("Invalid statement", t);
        }
    }
    return subexpr;
}

Expr *parseExpr_2(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_0(block, tk);
    Token t;
    while ((t= tk.get()).isop('.') || t.isop('('))
    {
        if (t.isop('.'))
            subexpr= new MemberExpr(block, tk, t, subexpr);
        else
        {
            subexpr = new CallExpr(block, tk, t, subexpr);
        }
    }
    tk.unget(t);
    return subexpr;
}

Expr * parseExpr_4(BlockBase &block, Tokenizer &tk)
{
    Token t= tk.get();
    if (t.isop('-') )
    {
        Expr *subexpr= parseExpr_4(block, tk);
        return new OpUnaryMinusExpr(block, t, subexpr);
    }
    else if (t.isop('!') )
    {
        Expr *subexpr= parseExpr_4(block, tk);
        return new OpNotExpr(block, t, subexpr);
    }
    else
    {
        tk.unget(t);
        return parseExpr_2(block, tk);
    }
}


Expr * parseExpr_5(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_4(block, tk);
    Token t;
    while ((t= tk.get()).isop('*') || t.isop('/'))
    {
        Expr *subexpr2= parseExpr_4(block, tk);
        if (t.isop('*'))
            subexpr= new OpMulExpr(block, t, subexpr, subexpr2);
        else if (t.isop('/'))
            subexpr= new OpDivExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

Expr * parseExpr_6(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_5(block, tk);
    Token t;
    while ((t= tk.get()).isop('+') || t.isop('-'))
    {
        Expr *subexpr2= parseExpr_5(block, tk);
        if (t.isop('+'))
            subexpr= new OpAddExpr(block, t, subexpr, subexpr2);
        else
            subexpr= new OpSubExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

Expr * parseExpr_8(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_6(block, tk);
    Token t= tk.get();
    if (t.isop('<'))
    {
        Expr *subexpr2= parseExpr_6(block, tk);
        subexpr= new OpLessExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop('>'))
    {
        Expr *subexpr2= parseExpr_6(block, tk);
        subexpr= new OpGreaterExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop("<="))
    {
        Expr *subexpr2= parseExpr_6(block, tk);
        subexpr= new OpLessEqualExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop(">="))
    {
        Expr *subexpr2= parseExpr_6(block, tk);
        subexpr= new OpGreaterEqualExpr(block, t, subexpr, subexpr2);
    }
    else if (t.iskeyword("instanceof"))
    {
        subexpr= new OpInstanceOf(block, t, subexpr, tk);
    }
    else
    {
        tk.unget(t);
    }
    return subexpr;
}

Expr * parseExpr_9(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_8(block, tk);
    Token t= tk.get();
    if (t.isop("=="))
    {
        Expr *subexpr2= parseExpr_8(block, tk);
        subexpr= new OpEqualExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop("!="))
    {
        Expr *subexpr2= parseExpr_8(block, tk);
        subexpr= new OpNotEqualExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop("==="))
    {
        Expr *subexpr2= parseExpr_8(block, tk);
        subexpr= new OpSameExpr(true, block, t, subexpr, subexpr2);
    }
    else if (t.isop("!=="))
    {
        Expr *subexpr2= parseExpr_8(block, tk);
        subexpr= new OpSameExpr(false, block, t, subexpr, subexpr2);
    }
    else
    {
        tk.unget(t);
    }
    return subexpr;
}

Expr * parseExpr_10(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_9(block, tk);
    Token t;
    while ((t= tk.get()).isop('&'))
    {
        Expr *subexpr2= parseExpr_9(block, tk);
        subexpr= new OpBinAndExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

Expr * parseExpr_12(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_10(block, tk);
    Token t;
    while ((t= tk.get()).isop('|'))
    {
        Expr *subexpr2= parseExpr_10(block, tk);
        subexpr= new OpBinOrExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

Expr * parseExpr_13(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_12(block, tk);
    Token t;
    while ((t= tk.get()).isop("&&"))
    {
        Expr *subexpr2= parseExpr_12(block, tk);
        subexpr= new OpBoolAndExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

Expr * parseExpr_14(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_13(block, tk);
    Token t;
    while ((t= tk.get()).isop("||"))
    {
        Expr *subexpr2= parseExpr_13(block, tk);
        subexpr= new OpBoolOrExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

Expr * parseExpr_15(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_14(block, tk);
    Token t = tk.get();
    if (t.isop('?')) {
        Expr *extrue = parseExpr_16(block, tk);
        ExpectOp(':', tk);
        Expr *exfalse = parseExpr_16(block, tk);
        return new OpConditionalExpr(block, t, subexpr, extrue, exfalse);
    }
    else
    {
        tk.unget(t);
        return subexpr;
    }
}

Expr * parseExpr_16(BlockBase &block, Tokenizer &tk)
{
    Expr *subexpr= parseExpr_15(block, tk);
    Token t;
    while ((t= tk.get()).isop('='))
    {
        Expr *subexpr2= parseExpr_16(block, tk);
        subexpr= new OpAssignExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

Expr * parseExpr(BlockBase &block, Tokenizer &tk)
{
    return parseExpr_16(block, tk);
}

//**********************************************************************

ExprStatement::ExprStatement(Block &parentblock, Tokenizer &tk)
{
    expr= parseExpr(parentblock, tk);
    ExpectOp(';', tk);
}

BaseStatement *ExprStatement::optimize ()
{
    optimize_branch(expr);
    return this;
}

void ExprStatement::emit (Emit &e)
{
    expr->annotate(e);
    expr->emit(e, std::string());
    e << '\n';
}

//**********************************************************************

ValueStatement::ValueStatement(Block & block, const Token & tstart) :
    SubStatement (block),
    Annotated(tstart),
    vtype(ValueSimple),
    esize(0)
{
}

void ValueStatement::parseArray(Tokenizer &tk)
{
    Token t= tk.get();
    if (t.isop(']') )
    {
        vtype= ValueArray;
        t= tk.get();
        if (t.isop('='))
        {
            ExpectOp('[', tk);
            do
            {
                value.push_back(parseExpr(*this, tk));
                t= tk.get();
            } while (t.isop(','));
            RequireOp(']', t);
        }
        else
            tk.unget(t);
    }
    else
    {
        vtype= ValueFixedArray;
        tk.unget(t);
        esize= parseExpr(*this, tk);
        ExpectOp(']', tk);
        t= tk.get();
        if (t.isop('='))
        {
            ExpectOp('[', tk);
            do
            {
                value.push_back(parseExpr(*this, tk));
                t= tk.get();
            } while (t.isop(','));
            RequireOp(']', t);
        }
        else
            tk.unget(t);
    }
}

BaseStatement *ValueStatement::optimize()
{
    optimize_branch(esize);
    for (size_t i= 0; i < value.size(); ++i)
        optimize_branch(value[i]);
    return this;
}

void ValueStatement::emit (Emit &e, const std::string &name, char type)
{
    std::string arraytype(type == REGint ? "Integer" : "String");

    annotate(e);
    e << INDENT ".local " <<
        (vtype == ValueSimple ?
                (type == REGint ? "int" : "string") :
                "pmc") <<
        ' ' << name << '\n';

    switch (vtype)
    {
    case ValueSimple:
        if (value.size() == 1)
        {
            char vtype= value[0]->checkresult();
            if (((vtype == REGint || vtype == REGstring) && vtype == type) ||
                    (dynamic_cast<IndexExpr *>(value[0])))
                value[0]->emit(e, name);
            else
            {
                std::string reg= gentemp(vtype);
                value[0]->emit(e, reg);
                e << op_set(name, reg) << '\n';
            }
        }
        break;
    case ValueArray:
        e << INDENT "root_new " << name << ", ['parrot';"
                "'Resizable" << arraytype << "Array' ]\n";
        if (value.size() > 0)
        {
            std::string reg= gentemp(type);
            for (size_t i= 0; i < value.size(); ++i)
            {
                value[i]->emit(e, reg);
                e << INDENT << name << '[' << i << "] = " << reg << '\n';
                if (type == REGvar)
                    e << op_null(reg) << '\n';
            }
        }
        break;
    case ValueFixedArray:
        {
        size_t vsize;
        std::string regsize;
        if (esize->isliteralinteger() )
            vsize= esize->getintegervalue();
        else
        {
            regsize= gentemp(REGint);
            esize->emit(e, regsize);
        }
        e << INDENT "root_new " << name << ", ['parrot';"
                 "'Fixed" << arraytype << "Array' ]\n" <<
            INDENT << name << " = ";
        if (regsize.empty())
            e << vsize;
        else
            e << regsize;
        e << '\n';
        if (value.size() > 0)
        {
            std::string reg= gentemp(type);
            for (size_t i= 0; i < value.size(); ++i)
            {
                value[i]->emit(e, reg);
                e << name << '[' << i << "] = " << reg << '\n';
                if (type == REGvar)
                    e << op_null(reg) << '\n';
            }
        }
        }
        break;
    default:
        throw InternalError("Unexpected initializer type");
    }
}

//**********************************************************************

IntStatement::IntStatement(Block &block,  const Token &st, Tokenizer &tk) :
    ValueStatement (block, st)
{
    Token t= tk.get();
    name= t.identifier();
    t= tk.get();
    if (t.isop('['))
    {
        genlocal(name, REGvar);
        parseArray(tk);
        t= tk.get();
    }
    else
    {
        genlocal(name, REGint);
        if (t.isop('='))
        {
            value.push_back(parseExpr(block, tk));
            t= tk.get();
        }
    }
    tk.unget(t);
}

void IntStatement::emit (Emit &e)
{
    annotate(e);
    emit(e, name, REGint);
}

//**********************************************************************

StringStatement::StringStatement(Block & block, const Token &st, Tokenizer &tk) :
    ValueStatement (block, st)
{
    Token t= tk.get();
    name= t.identifier();
    t= tk.get();
    if (t.isop('['))
    {
        genlocal(name, REGvar);
        parseArray(tk);
        t= tk.get();
    }
    else
    {
        genlocal(name, REGstring);
        if (t.isop('='))
        {
            value.push_back(parseExpr(block, tk));
            t= tk.get();
        }
    }
    tk.unget(t);
}

void StringStatement::emit (Emit &e)
{
    annotate(e);
    emit(e, name, REGstring);
}

//**********************************************************************

VarStatement::VarStatement(Block & block, const Token &st, Tokenizer &tk) :
    ValueStatement (block, st)
{
    Token t= tk.get();
    name= t.identifier();
    genlocal(name, REGvar);
    t= tk.get();
    if (t.isop('='))
    {
        value.push_back(parseExpr(block, tk));
        t= tk.get();
    }
    RequireOp (';', t);
}

void VarStatement::emit (Emit &e)
{
    annotate(e);
    e << INDENT ".local pmc " << name << '\n';
    if (value.size() == 1)
    {
        Expr & v = *value[0];
        if (v.isnull())
            e << op_null(name) << '\n';
        else
        {
            const char type = v.checkresult();
            std::string reg;
            switch (type) {
            case REGint:
            case REGstring:
                reg = gentemp(type);
                v.emit(e, reg);
                e << op_box(name, reg) << '\n';
                break;
            case REGvar:
                v.emit(e, name);
                break;
            default:
                throw InternalError("Unexpected value type in var statement");
            }
        }
    }
}

//**********************************************************************

ConstStatement::ConstStatement(Block & block, const Token &st, Tokenizer &tk,
        char typed) :
    ValueStatement (block, st),
    type(typed),
    value(0)
{
    Token t= tk.get();
    name= t.identifier();
    ExpectOp('=', tk);
    value= parseExpr(block, tk);
}

BaseStatement *ConstStatement::optimize()
{
    optimize_branch(value);
    genconstant(name, type, value->gettoken());
    return this;
}

void ConstStatement::emit (Emit &e)
{
    if (! value->issimple() )
        throw Expected("constant expression", getstart());

    // Put a hint in the generated code.
    e.comment("Constant " + name + " evaluated at compile time");
}

BaseStatement * parseConst(Block & block, const Token &st, Tokenizer &tk)
{
    Token t= tk.get();
    const char type = nativetype(t);

    switch (type) {
    case REGint:
    case REGstring:
        break;
    default:
        throw SyntaxError("Invalid const type", t);
    }

    BaseStatement *multi = 0;
    do {
        BaseStatement *statement = new ConstStatement(block, st, tk, type);
        multi = addtomulti(multi, statement);
        t= tk.get();
    } while (t.isop(','));
    RequireOp (';', t);
    return multi;
}

//**********************************************************************

ReturnStatement::ReturnStatement(Block & block,
        const Token & tstart, Tokenizer &tk) :
    SubStatement (block), Annotated(tstart), values(0)
{
    Token t= tk.get();
    if (! t.isop(';') )
    {
        tk.unget(t);
        values= new ArgumentList(block, tk, ';');
    }
}

BaseStatement *ReturnStatement::optimize()
{
    if (values)
        values->optimize();
    return this;
}

void ReturnStatement::emit (Emit &e)
{
    if (values)
        values->prepare(e);
    annotate(e);
    e << INDENT ".return (";
    if (values)
        values->emit(e);
    e << " )\n";
}

//**********************************************************************

CompoundStatement::CompoundStatement(Block &parentblock,
        Tokenizer &tk) :
    BlockStatement (parentblock)
{
    Token t;
    for (t= tk.get(); ! t.isop('}'); t= tk.get() )
    {
        tk.unget(t);
        BaseStatement *st= parseStatement(*this, tk);
        subst.push_back(st);
    }
    tend= t;
}

BaseStatement *CompoundStatement::optimize ()
{
    bool empty= true;
    for (size_t i= 0; i < subst.size(); ++i) {
        optimize_branch(subst[i]);
        if (!subst[i]->isempty() )
            empty= false;
    }
    if (empty)
        return new EmptyStatement();
    else
        return this;
}

void CompoundStatement::emit (Emit &e)
{
    for (size_t i= 0; i < subst.size(); ++i)
    {
        subst[i]->emit(e);
        freetempregs();
    }
}

//**********************************************************************

ForeachStatement::ForeachStatement(Block &block, Tokenizer &tk) :
    ContinuableStatement (block),
    vartype('\0'),
    container(0)
{
    Token t= tk.get();
    vartype = nativetype(t);
    if (vartype != '\0')
        t= tk.get();
    start = t;
    varname= t.identifier();
    if (vartype != '\0')
        genlocal(varname, vartype);
    t= tk.get();
    if (!t.iskeyword("in"))
        throw Expected ("'in'", t);
    container= parseExpr(*this, tk);
    ExpectOp(')', tk);
    st= parseStatement(*this, tk);
}

BaseStatement *ForeachStatement::optimize()
{
    optimize_branch(container);
    optimize_branch(st);
    return this;
}

void ForeachStatement::emit(Emit &e)
{
    std::string label= genlabel();
    std::string continuelabel = gencontinuelabel();
    std::string breaklabel= genbreaklabel();
    std::string regcont = genlocalregister(REGvar);
    if (container-> isstring() )
    {
        std::string value= gentemp(REGstring);
        container->emit(e, value);
        e.annotate(start);
        e << op_box(regcont, value) << '\n';
    }
    else
        container->emit(e, regcont);

    e.annotate(start);
    if (vartype != '\0')
        e << INDENT ".local " << nameoftype(vartype) << ' ' << varname << '\n';
    const std::string iter= "iter_" + varname;

    e << INDENT ".local pmc " << iter << "\n" <<
        INDENT "if null " << regcont << " goto " << breaklabel << '\n' <<
        INDENT "iter " << iter << ", " << regcont << "\n" <<
        INDENT << iter << " = 0\n" << // ITERATE_FROM_START
        INDENTLABEL << continuelabel << ": # FOR IN\n" <<
        INDENT "unless " << iter << " goto " << breaklabel<< "\n"
        INDENT "shift " << varname << ", " << iter << '\n'
        ;
    st->emit(e);
    e << INDENT "goto " << continuelabel << '\n' <<
        INDENTLABEL << breaklabel << ": # FOR IN END\n";
    freelocalregister(regcont);
}

//**********************************************************************

ForStatement::ForStatement(Block &block, Tokenizer &tk) :
    ContinuableStatement (block),
    initializer(0),
    condition(0),
    iteration(0),
    st(0)
{
    Token t= tk.get();
    if (! t.isop(';'))
    {
        tk.unget(t);
        initializer= parseStatement(*this, tk);
    }
    t= tk.get();
    if (! t.isop(';'))
    {
        tk.unget(t);
        condition= parseExpr(*this, tk);
        ExpectOp(';', tk);
    }
    t= tk.get();
    if (! t.isop(')'))
    {
        tk.unget(t);
        iteration= parseExpr(*this, tk);
        ExpectOp(')', tk);
    }
    st= parseStatement(*this, tk);
}

BaseStatement *ForStatement::optimize()
{
    optimize_branch(initializer);
    optimize_branch(condition);
    optimize_branch(iteration);
    optimize_branch(st);
    return this;
}

void ForStatement::emit(Emit &e)
{
    e.comment("for loop");

    std::string continuelabel= gencontinuelabel();
    std::string l_condition= genlabel();
    std::string breaklabel = genbreaklabel();

    if (initializer)
        initializer->emit(e);

    e << INDENTLABEL << l_condition << ": # for condition\n";
    if (condition)
    {
        std::string reg= condition->emit_get(e);
        e << INDENT "unless " << reg << " goto " << breaklabel << " # for end\n";
    }

    e << "# for body\n";
    st->emit(e);

    e << INDENTLABEL << continuelabel << ": # for iteration\n";

    if (iteration)
    {
        iteration->emit(e, std::string());
        e << '\n';
    }
    e << INDENT "goto " << l_condition << " # for condition\n";

    e << INDENTLABEL << breaklabel << ": # for end\n";
    e.comment("for loop end");
}

//**********************************************************************

ThrowStatement::ThrowStatement(Block &block, const Token &st,
        Tokenizer &tk) :
    SubStatement (block),
    pos(st), excep(0)
{
    excep = parseExpr(block, tk);
}

BaseStatement *ThrowStatement::optimize()
{
    optimize_branch(excep);
    return this;
}

void ThrowStatement::emit (Emit &e)
{
    e.annotate(pos);

    char type = excep->checkresult();
    std::string reg = gentemp(type);
    excep->emit(e, reg);
    switch (type)
    {
    case REGvar:
        e << INDENT "throw" << ' ' << reg << '\n';
        break;
    case REGstring:
        {
            std::string aux = gentemp(REGvar);
            e <<
                INDENT "root_new " << aux << ", ['parrot';'Exception']\n"
                INDENT << aux << "['message'] = " << reg << "\n"
                INDENT "throw " << aux << "\n"
                ;
        }
        break;
    default:
        throw SyntaxError("Invalid throw argument", pos);
    }
}

//**********************************************************************

TryStatement::TryStatement(Block &block, const Token &st, Tokenizer &tk) :
    BlockStatement (block),
    Annotated(st),
    stry(0), scatch(0)
{
    stry = parseStatement (block, tk);
    Token t= tk.get();
    if (! t.iskeyword("catch"))
        throw Expected("catch", t);
    ExpectOp ('(', tk);
    t= tk.get();
    if (! t.isop(')'))
    {
        exname= t.identifier();
        ExpectOp (')', tk);
    }
    scatch= parseStatement (block, tk);
}

BaseStatement *TryStatement::optimize()
{
    optimize_branch(stry);
    optimize_branch(scatch);
    return this;
}

void TryStatement::emit (Emit &e)
{
    annotate(e);
    std::string label= genlabel();
    std::string handler = label + "_HANDLER";
    std::string pasthandler = label + "_PAST_HANDLER";
    std::string except = exname.empty() ?
        gentemp(REGvar) :
        exname;

    std::string reghandler= gentemp(REGvar);
    e << INDENT << reghandler << " = new 'ExceptionHandler'\n"
        INDENT "set_label " << reghandler << ", " << handler << '\n';

    e << INDENT "push_eh " << reghandler << '\n';

    stry->emit(e);
    e <<
        INDENT "pop_eh\n"
        INDENT "goto " << pasthandler << '\n' <<
        INDENTLABEL << handler << ":\n";
    if (!exname.empty() )
    {
        genlocal(exname, REGvar);
        e << INDENT ".local pmc " << exname << '\n';
    }
    e <<
        INDENT ".get_results(" << except << ")\n"
        INDENT "finalize " << except << "\n"
        INDENT "pop_eh\n"
        ;

    scatch->emit(e);
    e << INDENTLABEL << pasthandler << ":\n";
}

//**********************************************************************

Condition::Condition (Block &block, Tokenizer &tk) :
    InBlock (block),
    expr (0)
{
    ExpectOp ('(', tk);
    expr= parseExpr(block, tk);
    ExpectOp(')', tk);
}

Condition::Condition (BlockBase &block, Expr *condexpr) :
    InBlock(block),
    expr(condexpr)
{
}

Condition *Condition::optimize()
{
    expr= expr->optimize();
    return this;
}

bool Condition::issimple() const
{
    return expr->issimple();
}

bool Condition::isliteralinteger() const
{
    return expr->isliteralinteger();
}

std::string Condition::value() const
{
    return expr->getstringvalue();
}

Condition::Value Condition::getvalue() const
{
    if (issimple())
    {
        if (expr->isnull())
            return CVfalse;
        if (isliteralinteger())
        {
            int n = expr->getintegervalue();
            if (n != 0)
                return CVtrue;
            else
                return CVfalse;
        }
    }
    return CVruntime;
}

std::string Condition::emit(Emit &e)
{
    std::string reg;
    if (expr->issimple())
        expr->annotate(e);
    if (expr->isidentifier() && expr->isinteger())
        reg= expr->getidentifier();
    else
    {
        char type= expr->checkresult();
        reg = expr->emit_get(e);
        if (type == REGvar || type == REGstring)
        {
            std::string reg2= reg;
            reg= gentemp(REGint);
            std::string nocase= genlocallabel();
            e << op_null(reg) << "\n"
                INDENT "if_null " << reg2 << ", " << nocase << "\n"
                INDENT "unless " << reg2 << " goto " << nocase << "\n" <<
                op_inc(reg) << '\n' <<
                INDENTLABEL << nocase << ":\n";
        }
    }
    return reg;
}

void Condition::emit_if(Emit &e, const std::string &labeltrue)
{
    std::string reg;
    if (expr->issimple())
        expr->annotate(e);
    std::string auxlabel;
    if (expr->isidentifier() && expr->isinteger()) {
        reg= expr->getidentifier();
    }
    else
    {
        char type= expr->checkresult();
        reg = expr->emit_get(e);
        if (type == REGvar || type == REGstring) {
            auxlabel = genlocallabel();
            e << INDENT "if_null " << reg << ", " << auxlabel << "\n";
        }
    }
    e << INDENT "if " << reg << " goto " << labeltrue << '\n';
    if (!auxlabel.empty())
        e << INDENTLABEL << auxlabel << ":\n";
}

void Condition::emit_else(Emit &e, const std::string &labelfalse)
{
    std::string reg;
    if (expr->issimple())
        expr->annotate(e);
    if (expr->isidentifier() && expr->isinteger()) {
        reg= expr->getidentifier();
    }
    else
    {
        char type= expr->checkresult();
        reg = expr->emit_get(e);
        if (type == REGvar || type == REGstring)
            e << INDENT "if_null " << reg << ", " << labelfalse << "\n";
    }
    e << INDENT "unless " << reg << " goto " << labelfalse << '\n';
}

//**********************************************************************

SwitchBaseStatement::SwitchBaseStatement(Block &block) :
    BreakableStatement (block)
{
}

void SwitchBaseStatement::parse_cases(Tokenizer &tk)
{
more:
    Token t= tk.get();
    if (t.iskeyword("case"))
    {
        Expr *caseexpr= parseExpr(*this, tk);
        casevalue.push_back(caseexpr);
        ExpectOp(':', tk);
        std::vector<BaseStatement *> cst;
        t= tk.get();
        while (!(t.isop('}') || t.iskeyword("case") || t.iskeyword("default")))
        {
            tk.unget(t);
            cst.push_back(parseStatement(*this, tk));
            t= tk.get();
        }
        casest.push_back(cst);
        tk.unget(t);
        goto more;
    }
    else if (t.iskeyword("default"))
    {
        ExpectOp(':', tk);
        std::vector<BaseStatement *> cst;
        t= tk.get();
        while (!(t.isop('}') || t.iskeyword("case") || t.iskeyword("default")))
        {
            tk.unget(t);
            cst.push_back(parseStatement(*this, tk));
            t= tk.get();
        }
        defaultst= cst;
        tk.unget(t);
        goto more;
    }
    else if(! t.isop('}'))
        throw Expected("case, default or block end", t);
}

BaseStatement *SwitchBaseStatement::optimize()
{
    for (size_t i= 0; i < casevalue.size(); ++i)
        optimize_branch(casevalue[i]);
    for (size_t i= 0; i < casest.size(); ++i)
    {
        std::vector<BaseStatement *> &cst= casest[i];
        for (size_t j= 0; j < cst.size(); ++j)
            optimize_branch(cst[j]);
    }
    for (size_t j= 0; j < defaultst.size(); ++j)
        optimize_branch(defaultst[j]);
    return this;
}

//**********************************************************************

SwitchStatement::SwitchStatement(Block &block, Tokenizer &tk) :
    SwitchBaseStatement (block),
    condition(0)
{
    condition= parseExpr(*this, tk);
    ExpectOp(')', tk);
    ExpectOp('{', tk);

    parse_cases(tk);
}

BaseStatement *SwitchStatement::optimize()
{
    optimize_branch(condition);
    SwitchBaseStatement::optimize();
    return this;
}

void SwitchStatement::emit(Emit &e)
{
    e.comment("switch");
    char type = '\0';
    for (size_t i= 0; i < casevalue.size(); ++i)
    {
        Expr &value= *casevalue[i];
        char newtype = REGvar;
        if (value.isinteger())
            newtype= REGint;
        else if (value.isstring())
            newtype= REGstring;
        if (type == '\0')
            type= newtype;
        else
            if (type != newtype)
                type= REGvar;
    }
    std::string reg= gentemp(type);

    condition->annotate(e);
    if (condition->checkresult() == type)
        condition->emit(e, reg);
    else
    {
        std::string r= condition->emit_get(e);
        e << op_set(reg, r) << '\n';
    }

    std::string defaultlabel= genlabel();
    std::string breaklabel= genbreaklabel();
    std::vector<std::string> caselabel;
    for (size_t i= 0; i < casest.size(); ++i)
    {
        std::string label= genlabel();
        caselabel.push_back(label);
        std::string value= gentemp(type);
        casevalue[i]->annotate(e);
        casevalue[i]->emit(e, value);
        e << INDENT "if " << reg << " == " << value <<
                " goto " << label << '\n';
    }
    e << INDENT "goto " << defaultlabel << '\n';

    for (size_t i= 0; i < casest.size(); ++i)
    {
        e << INDENTLABEL << caselabel[i] << ": # case\n";
        std::vector<BaseStatement *> &cst= casest[i];
        for (size_t j= 0; j < cst.size(); ++j)
            cst[j]->emit(e);
    }

    e << INDENTLABEL << defaultlabel << ": # default\n";
    for (size_t i= 0; i < defaultst.size(); ++i)
        defaultst[i]->emit(e);
    e << INDENTLABEL << breaklabel << ":\n";
    e.comment("switch end");
}

//**********************************************************************

SwitchCaseStatement::SwitchCaseStatement(Block &block, Tokenizer &tk) :
    SwitchBaseStatement (block)
{
    parse_cases(tk);
}

void SwitchCaseStatement::emit(Emit &e)
{
    e.comment("switch-case");
    std::string defaultlabel= genlabel();
    std::string breaklabel= genbreaklabel();
    std::vector<std::string> caselabel;
    std::string reg= gentemp(REGint);
    for (size_t i= 0; i < casest.size(); ++i)
    {
        std::string label= genlabel();
        caselabel.push_back(label);
        casevalue[i]->emit(e, reg);
        e << INDENT "if " << reg << " goto " << label << '\n';
    }
    e << INDENT "goto " << defaultlabel << '\n';

    for (size_t i= 0; i < casest.size(); ++i)
    {
        e << INDENTLABEL << caselabel[i] << ": # case\n";
        std::vector<BaseStatement *> &cst= casest[i];
        for (size_t j= 0; j < cst.size(); ++j)
            cst[j]->emit(e);
    }

    e << INDENTLABEL << defaultlabel << ": # default\n";
    for (size_t i= 0; i < defaultst.size(); ++i)
        defaultst[i]->emit(e);
    e << INDENTLABEL << breaklabel << ":\n";
    e.comment("switch end");
}

//**********************************************************************

IfStatement::IfStatement(Block &block, Tokenizer &tk) :
    BlockStatement (block),
    condition(0),
    st(new EmptyStatement()),
    stelse(new EmptyStatement())
{
    condition= new Condition(*this, tk);
    st= parseStatement(block, tk);
    Token t= tk.get();
    if (t.iskeyword("else")) {
        stelse= parseStatement(*this, tk);
    }
    else
    {
        tk.unget(t);
    }
}

BaseStatement *IfStatement::optimize()
{
    condition= condition->optimize();
    optimize_branch(st);
    optimize_branch(stelse);
    switch (condition->getvalue())
    {
    case Condition::CVtrue:
        return st;
    case Condition::CVfalse:
        return stelse;
    case Condition::CVruntime:
    default:
        return this;
    }
}

void IfStatement::emit(Emit &e)
{
    std::string label= genlabel();
    const bool noelse = stelse->isempty();
    const std::string l_endif= label + "_ENDIF";
    const std::string l_else= noelse ? l_endif : label + "_ELSE";

    condition->emit_else(e, l_else);
    if (!st->isempty())
        st->emit(e);
    if (!noelse)
    {
        e << INDENT "goto " << l_endif << '\n';
        e << INDENTLABEL << l_else << ":\n";
        stelse->emit(e);
    }
    e << INDENTLABEL << l_endif << ":\n";
}

//**********************************************************************

WhileStatement::WhileStatement(Block &block, Tokenizer &tk) :
    ContinuableStatement (block),
    st(new EmptyStatement())
{
    condition = new Condition(*this, tk);
    st= parseStatement(*this, tk);
}

BaseStatement *WhileStatement::optimize()
{
    condition= condition->optimize();
    optimize_branch(st);
    switch (condition->getvalue())
    {
    case Condition::CVfalse:
        return new EmptyStatement();
    case Condition::CVtrue:
    case Condition::CVruntime:
    default:
        return this;
    }
}

void WhileStatement::emit(Emit &e)
{
    std::string labelcontinue= gencontinuelabel();
    std::string labelend = genbreaklabel();
    bool forever= condition->getvalue() == Condition::CVtrue;
    e << INDENTLABEL << labelcontinue << ": # WHILE\n";
    std::string reg;
    if (! forever) {
        reg= condition->emit(e);
        e << '\n';
    }
    if (st->isempty()) {
        e << INDENT;
        if (! forever)
            e << "if " << reg << ' ';
        e << "goto " << labelcontinue << '\n';
    }
    else {
        if (! forever)
            e << INDENT "unless " << reg << " goto " << labelend << '\n';
        st->emit(e);
        e << INDENT "goto " << labelcontinue << '\n' <<
            INDENTLABEL << labelend << ": # END WHILE\n";
    }
}

//**********************************************************************

DoStatement::DoStatement(Block &block, Tokenizer &tk) :
    ContinuableStatement (block),
    st(new EmptyStatement())
{
    st= parseStatement(*this, tk);
    Token t= tk.get();
    if (!t.iskeyword("while"))
        throw Expected("while", t);
    condition = new Condition(*this, tk);
}

BaseStatement *DoStatement::optimize()
{
    condition= condition->optimize();
    optimize_branch(st);
    return this;
}

void DoStatement::emit(Emit &e)
{
    std::string labelstart= genlabel();
    std::string labelcontinue= gencontinuelabel();
    std::string labelend= genbreaklabel();
    bool forever= condition->getvalue() == Condition::CVtrue;
    bool oneshot = condition->getvalue() == Condition::CVfalse;

    e << INDENTLABEL << labelstart << ": # DO\n";

    if (!st->isempty())
        st->emit(e);
    e << INDENTLABEL << labelcontinue << ": # DO CONTINUE\n";
    if (! forever)
    {
        if (!oneshot)
            condition->emit_if(e, labelstart);
    }
    else
        e << INDENT "goto " << labelstart << '\n';
    e << INDENTLABEL << labelend << ": # END DO\n";
}

//**********************************************************************

FunctionStatement::FunctionStatement(Tokenizer &tk, const Token & tstart,
        Block &parent,
        const std::string &funcname) :
    FunctionModifiers(parent, tk),
    FunctionBlock(parent),
    Annotated(tstart),
    name(funcname)
{
    Token t= tk.get();
    RequireOp('(', t);
    t= tk.get ();

    if (!t.isop(')'))
    {
        tk.unget(t);
        do
        {
            FunctionParameter *pi = new FunctionParameter(this, tk);
            const std::string paramname = pi->getname();
            paraminfo [paramname]= pi;
            params.push_back(paramname);
            genlocal(paramname, pi->gettype());
            t= tk.get();
        } while (t.isop(','));
    }
    RequireOp(')', t);
    ExpectOp('{', tk);

    CompoundStatement *cbody = new CompoundStatement(*this, tk);
    tend= cbody->getend();
    body= cbody;
}

std::string FunctionStatement::getsubid() const
{
    return "__Id__" + name;
}

void FunctionStatement::local(std::string name)
{
    loc.push_back(name);
}

bool FunctionStatement::islocal(std::string name) const
{
    return std::find(loc.begin(), loc.end(), name) != loc.end() ||
        checklocal(name) ||
        std::find(params.begin(), params.end(), name) != params.end();
}

void FunctionStatement::optimize()
{
    body= body->optimize();
}

void FunctionStatement::emitparams (Emit &e)
{
    for (size_t i= 0; i < params.size(); ++i)
        paraminfo[params[i]]->emit(e);
    e << '\n';
}

void FunctionStatement::emitbody (Emit &e)
{
    annotate(e);
    body->emit(e);
    e.annotate(tend);
}

void FunctionStatement::emit (Emit &e)
{
    e << "\n.namespace [ ]\n.sub '" << getname() << "'";
    if (has_modifier("main") || name == "main")
        e << " :main";
    if (has_modifier("load"))
        e << " :load";
    if (has_modifier("init"))
        e << " :init";
    if (has_modifier("anon"))
        e << " :anon";
    if (has_modifier("immediate"))
        e << " :immediate";
    e << " :subid('" << getsubid() << "')";
    e << "\n";

    emitparams(e);
    emitbody(e);

    e << "\n.end # " << getname() << "\n\n";
}

//**********************************************************************

class External
{
public:
    External(std::vector<std::string> module, std::vector<std::string> names) :
        mod(module),
        n(names)
    {
    }
    void emit(Emit &e)
    {
        e <<
".sub 'importextern' :anon :load :init\n"
"    .local pmc ex, curns, srcns, symbols\n"
"    ex = new ['Exporter']\n"
"    curns = get_namespace\n"
"    symbols = new ['ResizableStringArray']\n"
        ;

        e << INDENT "srcns = get_root_namespace ['parrot'; '";
        e << mod[0];
        for (size_t i = 1; i < mod.size(); ++i)
            e << "'; '" << mod[i];
        e << "']\n";
        for (size_t i = 0; i < n.size(); ++i)
            e << INDENT "push symbols, '" << n[i] << "'\n";

        e <<
"    ex.'destination'(curns)\n"
"    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n"
".end\n"
       ;
    }
private:
    std::vector<std::string> mod;
    std::vector<std::string> n;
};

class NamespaceBlockBase : public Block
{
private:
    typedef std::map<std::string, FunctionStatement *> mapfunc_t;
public:
    NamespaceBlockBase () :
        subblocks(0)
    { }
    void addconstant(BaseStatement *cst)
    {
        constants.push_back(cst);
    }
    void addclass(ClassStatement *cl)
    {
        classes.push_back(cl);
    }
    void optimize()
    {
        for (size_t i= 0; i < constants.size(); ++i)
            constants[i]->optimize();
    }
    void emit (Emit &e) const
    {
        for (std::vector<External *>::const_iterator it = externals.begin();
                it != externals.end(); ++it)
            (*it)->emit(e);
        emit_group(constants, e);
    }
    void add_function(FunctionStatement *st)
    {
        functions[st->getname()] = st;
    }
    FunctionStatement *getfunction(const std::string &name) const
    {
        mapfunc_t::const_iterator it = functions.find(name);
        if (it != functions.end())
            return it->second;
        return 0;
    }
    ClassStatement *findclass(const ClassKey &classkey);
    virtual void addload(const std::string &loadname) = 0;
    void addextern(std::vector<std::string> module, std::vector<std::string> names)
    {
        externals.push_back(new External(module, names));
    }
private:
    std::string genlocallabel()
    { throw InternalError("No Namespace labels"); }
    std::string genlocalregister(char)
    { throw InternalError("No Namespace registers"); }
    void freelocalregister(const std::string&)
    { throw InternalError("No Namespace registers"); }
    unsigned int subblocks;
    unsigned int blockid()
    {
        return ++subblocks;
    }

    std::vector <BaseStatement *> constants;
    std::vector <ClassStatement *> classes;
    mapfunc_t functions;
    std::vector <External *> externals;
};

class RootNamespaceBlock : public NamespaceBlockBase
{
public:
    RootNamespaceBlock(bool debug) :
            debug_flag(debug)
    {
    }
private:
    char checkconstant(const std::string &name) const
    {
        char result = NamespaceBlockBase::checkconstant(name);
        if (result == '\0') {
            if (name == "true" || name == "false")
                result = REGint;
            else if (name == "__STAGE__")
                result = REGstring;
            else if (name == "__DEBUG__")
                result = REGint;
            else if (name == "__WINXED_ERROR__")
                result = REGint;
        }
        return result;
    }
    ConstantValue getconstant(const std::string &name) const
    {
        if (NamespaceBlockBase::checkconstant(name) != '\0')
            return NamespaceBlockBase::getconstant(name);
        else if (name == "true") {
            return ConstantValue(REGint,
                Token(TokenTInteger, "1", 0, "__predefconst__"));
        }
        else if (name == "false") {
            return ConstantValue(REGint,
                Token(TokenTInteger, "0", 0, "__predefconst__"));
        }
        else if (name == "__STAGE__") {
            // This is stage 0
            return ConstantValue(REGstring,
                    Token(TokenTQuoted, "0", 0, "__predefconst__"));
        }
        else if (name == "__DEBUG__") {
            return ConstantValue(REGint,
                Token(TokenTInteger,
                        debug_flag ? "1" : "0", debug_flag,
                        "__predefconst__"));
        }
        else if (name == "__WINXED_ERROR__") {
            // Hard coded value for exception type.
            return ConstantValue(REGint,
                Token(TokenTInteger, "567", 567, "__predefconst__"));
        }
        else throw InternalError("No such constant");
    }
public:
    void addload(const std::string &loadname)
    {
        loads.push_back(loadname);
    }
    void emitloads(Emit &e)
    {
        for (size_t i = 0; i < loads.size(); ++i)
            e << "  load_bytecode '" << loads[i] << "'\n";
    }
private:
    bool debug_flag;
    std::vector <std::string> loads;
};

//**********************************************************************

ClassStatement *NamespaceBlockBase::findclass(const ClassKey &classkey)
{
    if (classkey.size() == 1)
    {
        const std::string &name = classkey[0];
        for (size_t i = 0; i < classes.size(); ++i)
            if (classes[i]->getname() == name)
                return classes[i];
    }
    return 0;
}

//**********************************************************************

class MethodStatement : public FunctionStatement
{
public:
    MethodStatement(Tokenizer &tk, const Token &st,
            Block &parent,
            ClassStatement &cl,
            const std::string &name) :
        FunctionStatement(tk, st, parent, name),
        myclass(cl)
    {
        genlocal("self", REGvar);
    }
    std::string getsubid() const
    {
        return "__Id__" + myclass.getname() + "__" + getname();
    }
    void emit (Emit &e)
    {
        myclass.emitkey(e);
        e << ".sub '" << getname() << "'";

        if (has_modifier("vtable"))
            e << " :vtable";
        else
            e << " :method";

        e << "\n";
        emitparams(e);
        emitbody(e);

        e << "\n.end # " << getname() << "\n\n";
    }
private:
    const ClassStatement &myclass;
};

//**********************************************************************

class ClassSpecifierParrotKey : public ClassSpecifier
{
public:
    ClassSpecifierParrotKey(const Token & tstart, Tokenizer &tk) :
        ClassSpecifier(tstart)
    {
        Token t;
        do {
            t = tk.get();
            if (! t.isliteralstring())
                throw SyntaxError("Literal string expected in class key", t);
            pkey.push_back(t.pirliteralstring());
        } while ((t = tk.get()).isop(','));
    }
    ClassSpecifierType reftype() const { return CLASSSPECIFIER_parrotkey; }
private:
    void emit(Emit &e)
    {
        e << "[ " << pkey[0];
        for (size_t i = 1; i < pkey.size(); ++i)
            e << "; " << pkey[i];
        e << " ]";
    }
    std::string basename() const { return ""; }
    ClassKey pkey;
};


class ClassSpecifierId : public ClassSpecifier
{
public:
    ClassSpecifierId(const Token & tstart, Tokenizer &tk, BlockBase &owner) :
        ClassSpecifier(tstart),
        bl(owner)
    {
        id.push_back(tstart.identifier());
        Token t;
        while ((t = tk.get()).isop('.'))
        {
            t = tk.get();
            id.push_back(t.identifier());
        }
        tk.unget(t);
    }
    ClassSpecifierType reftype() const { return CLASSSPECIFIER_id; }
private:
    BlockBase &bl;
    void emit(Emit &e)
    {
        ClassStatement *cl = bl.findclass(id);
        if (cl)
        {
            e << cl->getkey().get_key();
        }
        else
        {
            std::cerr << "WARNING: class " << dotted(id)
                    <<  " not found at compile time\n";
            e << "[ '" << id[0];
            for (size_t i = 1; i < id.size(); ++i)
                e << "'; '" << id [i];
            e << "' ]";
        }
    }
    std::string basename() const { return id.back(); }
    ClassKey id;
};


ClassSpecifier *parseClassSpecifier(const Token &start, Tokenizer &tk,
        BlockBase &owner)
{
    if (start.isidentifier ())
        return new ClassSpecifierId(start, tk, owner);
    else if (start.isop('['))
        return new ClassSpecifierParrotKey(start, tk);
    else
        throw Expected("parent class", start);
}

//**********************************************************************

ClassStatement::ClassStatement
    (NamespaceBlockBase &ns_b, Tokenizer &tk) :
        SubBlock(ns_b),
        subblocks(0)
{
    start= tk.get();
    name= start.identifier();
    Token t= tk.get();
    if (t.isop(':'))
    {
        do {
            t= tk.get();
            parents.push_back(parseClassSpecifier(t, tk, ns_b));
            t= tk.get();
        } while (t.isop(','));
    }
    RequireOp('{', t);

    ns= NamespaceKey(name);
    while (! (t= tk.get()).isop('}'))
    {
        if (t.iskeyword("function"))
        {
            Token name= tk.get();
            if (! name.isidentifier() )
                throw Expected("method name", name);
            FunctionStatement *f = new MethodStatement
                    (tk, t, *this, *this, name.identifier());
            functions.push_back(f);
        }
        else if (t.iskeyword("var"))
        {
            do {
                Token name= tk.get();
                if (!name.isidentifier())
                    throw Expected("identifier", name);
                attrs.push_back(name);
                t= tk.get();
            } while (t.isop(','));
            RequireOp(';', t);
        }
        else if (t.iskeyword("const"))
        {
            BaseStatement *cst= parseConst(*this, t, tk);
            constants.push_back(cst);
        }
        else
            throw Expected ("'function' or '}'", t);
    }
}

const NamespaceKey &ClassStatement::getkey() const
{
    return ns;
}

void ClassStatement::emitkey (Emit &e) const
{
    ns.emit(e);
}

void ClassStatement::optimize()
{
    for (size_t i= 0; i < constants.size(); ++i)
        constants[i]->optimize();
    for (size_t i= 0; i < functions.size(); ++i)
        functions[i]->optimize();
}

void ClassStatement::emit (Emit &e)
{
    emitkey(e);

    emit_group(constants, e);

    e << ".sub Winxed_class_init :anon :load :init\n";
    e.annotate(start);
    e << INDENT "$P0 = newclass " << ns.get_key() << "\n";

    for (size_t i= 0; i < parents.size(); ++i)
    {
        ClassSpecifier & parent= *parents[i];
        parent.annotate(e);
        std::ostringstream oss;
        oss << "$P" << i + 1;
        std::string p= oss.str();
        e << INDENT << p << " = get_class ";
        parent.emit(e);
        e << "\n"
            INDENT "addparent $P0, " << p << "\n";
    }
    for (size_t i= 0; i < attrs.size(); ++i)
    {
        const Token &attrname= attrs[i];
        e.annotate(attrname);
        e << INDENT "addattribute $P0, '" << attrname.identifier() << "'\n";
    }

    e << ".end\n\n";

    emit_group(functions, e);
}

//**********************************************************************

void parsensUsing(const Token &start, Tokenizer &tk, NamespaceBlockBase &ns)
{
    Token t = tk.get();
    if (!t.iskeyword("extern"))
        throw UnsupportedInStage(start.str(), start);
    t = tk.get();
    if (t.isliteralstring())
        throw UnsupportedInStage(t.str(), t);
    if (! t.isidentifier())
        throw Expected("string literal or identifier", t);
    std::vector<std::string> module;
    module.push_back(t.identifier());
    while ((t = tk.get()).isop('.'))
    {
        t = tk.get();
        module.push_back(t.identifier());
    }
    if (! t.isop(';'))
    {
        std::vector<std::string> names;
        tk.unget(t);
        do {
            t = tk.get();
            names.push_back(t.identifier());
        } while ((t = tk.get()).isop(','));
        RequireOp(';', t);
        ns.addextern(module, names);
    }
    std::string reqmodule = module[0];
    for (size_t i = 1; i < module.size(); ++i)
    {
        reqmodule += '/';
        reqmodule += module[i];
    }
    reqmodule += ".pbc";
    ns.addload(reqmodule);
}

//**********************************************************************

class Winxed
{
public:
    Winxed(bool debug) :
        assertions(debug),
        root_ns(debug)
    {
    }
    void parse (Tokenizer &tk);
    void optimize ();
    void emit (Emit &e);
private:
    bool assertions;
    RootNamespaceBlock root_ns;
    std::vector <ClassStatement *> classes;
    std::vector <FunctionStatement *> functions;
};

void Winxed::parse (Tokenizer &tk)
{
    for (;;)
    {
        Token t(tk.get());
        while ( (!t.empty() ) && t.isspace() )
            t= tk.get();
        if (t.empty())
            break;

        if (t.iskeyword("const"))
        {
            BaseStatement *cst= parseConst(root_ns, t, tk);
            root_ns.addconstant(cst);
        }
        else if (t.iskeyword("class"))
        {
            ClassStatement *c =
                new ClassStatement (root_ns, tk);
            classes.push_back(c);
            root_ns.addclass(c);
        }
        else if (t.iskeyword("function"))
        {
            Token fname = tk.get();
            if (! fname.isidentifier() )
                throw Expected("function name", fname);
            FunctionStatement *f = new FunctionStatement
                    (tk, t, root_ns, fname.identifier());
            functions.push_back(f);
            root_ns.add_function(f);
        }
        else if (t.iskeyword("using"))
            parsensUsing(t, tk, root_ns);
        else if (t.iskeyword("$load"))
        {
            Token loadname = tk.get();
            if (! loadname.isliteralstring() )
                throw Expected("filename", loadname);
            ExpectOp(';', tk);
            root_ns.addload(loadname.str());
        }
        else if (t.isop('}'))
        {
            throw SyntaxError("Unexpected '}'", t);
        }
        else
            throw SyntaxError("Unexpected statement", t);
    }
}

void Winxed::optimize()
{
    root_ns.genconstant("null", 'n', Token(TokenTIdentifier, "null", 0, "(predef"));

    root_ns.optimize();
    for (size_t i= 0; i < classes.size(); ++i)
        classes[i]->optimize();
    for (size_t i= 0; i < functions.size(); ++i)
        functions[i]->optimize();
}

void Winxed::emit (Emit &e)
{
    e <<
"#\n"
"# Winxed generated file\n"
"#**************************************************\n"    
    ;

    e.boxedcomment("Begin generated code");

    //TODO: emit only initialization for things used.
    e << "\n";
    e.comment("Initializations");
    e <<
        ".sub 'initialize' :load :init :anon\n"
        "  load_bytecode 'String/Utils.pbc'\n";

    root_ns.emitloads(e);

    e <<
        ".end\n";

    if (assertions)
    {
        e <<
            ".sub WinxedAssertCheck :anon :subid('__WINXED_ASSERT_check')\n"
            "    .param int check\n"
            "    if check goto done\n"
            "    die 'Assertion failed!'\n"
            "  done:\n"
            "    .return()\n"
            ".end\n";
    }

    e.comment("End of initializations");
    e << "\n\n";

    root_ns.emit(e);
    emit_group(classes, e);
    emit_group(functions, e);

    e.boxedcomment("End generated code");
}

//**********************************************************************

std::string genfile(const std::string &filename, const std::string ext)
{
    std::string::size_type n= filename.rfind('.');
    if (n == std::string::npos)
        return filename + "." + ext;
    else
        return filename.substr(0, n) + "." + ext;
}

void winxed_main (int argc, char **argv)
{
    if (argc < 2)
        throw CompileError("No arguments");
    std::string inputname;
    std::string expr;
    std::string outputname;
    bool noan = false;
    bool debug = false;

    int i;
    for (i = 1; i < argc; ++i)
    {
        const char * const arg = argv[i];
        if (strcmp(arg, "-c") == 0)
            /* Ignored */;
        else if (strcmp(arg, "-o") == 0)
            outputname= argv[++i];
        else if (strcmp(arg, "-e") == 0)
            expr = argv[++i];
        else if (strcmp(arg, "--noan") == 0)
            noan = true;
        else if (strcmp(arg, "--debug") == 0)
            debug = true;
        else break;
    }

    std::istream *input;
    std::ifstream inputfile;
    std::istringstream inputstring;

    if (! expr.empty() )
    {
        expr = "function main(var argv) {" + expr + ";}\n";
        inputstring.str(expr);
        input = &inputstring;
        inputname = "##eval##";
    }
    else
    {
        if (i < argc)
            inputname= argv[i++];
        if (!inputname.empty())
            inputfile.open(inputname.c_str());
        if (! inputfile.is_open() )
            throw CompileError(std::string("Cant't open input file ") + inputname);
        input= &inputfile;
    }

    if (outputname.empty() )
        outputname= genfile(inputname, "pir");
    std::string pirfile = genfile(outputname, "pir");

    Winxed winxed(debug);
    {
        Tokenizer tk (*input, inputname.c_str());
        winxed.parse (tk);
    }
    if (input == &inputfile)
        inputfile.close();

    winxed.optimize();
    {
        std::ostream *output;
        std::ofstream outputfile;

        if (outputname == "-")
        {
            output= &std::cout;
        }
        else
        {
            outputfile.open(pirfile.c_str());
            if (!outputfile.is_open() )
                throw CompileError(std::string("Cant't open output file ") + pirfile);
            output= &outputfile;
        }

        Emit e(*output);
        if (debug)
            e.setDebug();
        if (noan)
            e.omit_annotations();
        winxed.emit(e);
        if (output == &outputfile)
            outputfile.close();
    }
}

//**********************************************************************

int main (int argc, char **argv)
{
    try
    {
        winxed_main (argc, argv);
        return 0;
    }
    catch (const CompileError &e)
    {
        std::cerr << e.file() << ':';
        if (e.linenum() != 0)
            std::cerr  << e.linenum() << ':';
         std::cerr << ' ' << e.what() << '\n';
    }
    catch (std::exception &e)
    {
        std::cerr << "ERROR: " << e.what() << '\n';
    }
    catch (...)
    {
        std::cerr << "\n*** UNEXPECTED ERROR ***\n";
    }
    return 1;
}

// End of winxedst0.cpp
