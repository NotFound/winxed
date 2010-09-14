// winxedst0.cpp
// Revision 14-sep-2010

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
const char REGfloat  = 'N';
const char REGstring = 'S';
const char REGvar    = 'P';
// Pseudotypes for predefined functions
const char REGany    = '?';
const char REGnone   = '\0'; // void return

static const char * nameoftype(char ctype)
{
    switch (ctype)
    {
    case REGint:    return "int";
    case REGfloat:  return "num";
    case REGstring: return "string";
    case REGvar:    return "pmc";
    default:
        throw CompileError("Invalid type");
    }
}

char nativetype(const Token &name)
{
    if (name.iskeyword("int")) return REGint;
    else if (name.iskeyword("float")) return REGfloat;
    else if (name.iskeyword("string")) return REGstring;
    else if (name.iskeyword("var")) return REGvar;
    else return '\0';
}

//**********************************************************************

inline
std::string op(const char *name, const std::string &op1)
{
    return std::string(name) + ' ' + op1;
}

inline
std::string op(const char *name,
    const std::string &op1, const std::string &op2)
{
    return std::string(name) + ' ' + op1 + ", " + op2;
}

inline
std::string op(const char *name,
    const std::string &op1,
    const std::string &op2, const std::string &op3)
{
    return std::string(name) + ' ' + op1 + ", " + op2 + ", " + op3;
}

inline
std::string op_set(const std::string &res, const std::string &op1)
{
    return op("set", res, op1);
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

class PredefFunction
{
public:
    static const int VarArgs = -1;
    PredefFunction(const std::string &name, char typeresult, int nargs) :
        pname(name),
        tresult(typeresult),
        n(nargs)
    {
    }
    PredefFunction(const std::string &name, char typeresult) :
        pname(name),
        tresult(typeresult),
        n(VarArgs)
    {
    }
    static const PredefFunction *find(const std::string &name,
        size_t numargs);
    bool name_is(const std::string &name) const
    { return pname == name; }
    size_t numargs() const { return n; }
    char resulttype() const { return tresult; }

    virtual char paramtype(size_t n) const = 0;
    virtual void emit(Emit &e, const std::string &result,
        const std::vector<std::string> args) const = 0;
private:
    static const PredefFunction *predefs[];
    static const size_t numpredefs;
    const std::string pname;
    char tresult;
    unsigned int n;
};

class PredefFunctionFixargs : public PredefFunction
{
public:
    PredefFunctionFixargs(const std::string &name,
            const std::string &body,
            char typeresult,
            char type0= '\0',
            char type1= '\0',
            char type2= '\0',
            char type3= '\0') :
        PredefFunction(name, typeresult,
                bool(type0) +bool(type1) + bool(type2) + bool(type3) ),
        pbody(body),
        t0(type0), t1(type1), t2(type2), t3(type3)
    {}
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
    const std::string pbody;
    char t0, t1, t2, t3;
};

class PredefFunctionVarargs : public PredefFunction
{
protected:
    PredefFunctionVarargs(const std::string &name,
            char typeresult) :
        PredefFunction(name, typeresult)
    { }
    char paramtype(size_t /*unused*/) const
    {
        return REGany;
    }
};

class Predef_print : public PredefFunctionVarargs
{
public:
    Predef_print() : PredefFunctionVarargs("print", REGnone)
    { }
private:
    void emit(Emit &e, const std::string &,
        const std::vector<std::string> args) const
    {
        const size_t n = args.size();
        for (size_t i= 0; i < n; ++i)
            e << "print " << args[i] << '\n';
    }
};

class Predef_say : public PredefFunctionVarargs
{
public:
    Predef_say() : PredefFunctionVarargs("say", REGnone)
    { }
private:
    void emit(Emit &e, const std::string &,
        const std::vector<std::string> args) const
    {
        const size_t n = args.size();
        if (n > 0) {
            for (size_t i= 0; i < n - 1; ++i)
                e << "print " << args[i] << '\n';
            e << "say " << args[n-1] << '\n';
        }
        else
            e << "say ''\n";
    }
};

class Predef_cry : public PredefFunctionVarargs
{
public:
    Predef_cry() : PredefFunctionVarargs("cry", REGnone)
    { }
private:
    void emit(Emit &e, const std::string &,
        const std::vector<std::string> args) const
    {
        e <<
            "getstderr $P0\n";
        const size_t n = args.size();
        for (size_t i= 0; i < n; ++i)
            e << "$P0.'print'(" << args[i] << ")\n";
        e << "$P0.'print'(\"\\n\")\n";
    }
};

const PredefFunction *PredefFunction::predefs[]= {
    new Predef_print(),
    new Predef_say(),
    new Predef_cry(),
    new PredefFunctionFixargs("int",
        "{res} = {arg0}",
        REGint, REGany),
    new PredefFunctionFixargs("string",
        "{res} = {arg0}",
        REGstring, REGany),
    new PredefFunctionFixargs("die",
        "die {arg0}",
        REGnone, REGstring),
    new PredefFunctionFixargs("exit",
        "exit {arg0}",
        REGnone, REGint),
    new PredefFunctionFixargs("spawnw",
        "spawnw {res}, {arg0}",
        REGint, REGvar),
    new PredefFunctionFixargs("open",
        "root_new {res}, ['parrot';'FileHandle']\n"
        "{res}.'open'({arg0})",
        REGvar, REGstring),
    new PredefFunctionFixargs("open",
        "root_new {res}, ['parrot';'FileHandle']\n"
        "{res}.'open'({arg0},{arg1})",
        REGvar, REGstring, REGstring),
    new PredefFunctionFixargs("Error",
        "root_new {res}, ['parrot';'Exception']\n"
        "{res}['message'] = {arg0}\n"
        , REGvar, REGstring),
    new PredefFunctionFixargs("Error",
        "root_new {res}, ['parrot';'Exception']\n"
        "{res}['message'] = {arg0}\n"
        "{res}['severity'] = {arg1}\n"
        , REGvar, REGstring, REGint),
    new PredefFunctionFixargs("Error",
        "root_new {res}, ['parrot';'Exception']\n"
        "{res}['message'] = {arg0}\n"
        "{res}['severity'] = {arg1}\n"
        "{res}['type'] = {arg2}\n"
        , REGvar, REGstring, REGint, REGint),
    new PredefFunctionFixargs("elements",
        "elements {res}, {arg0}",
        REGint, REGvar),
    new PredefFunctionFixargs("length",
        "length {res}, {arg0}",
        REGint, REGstring),
    new PredefFunctionFixargs("bytelength",
        "bytelength {res}, {arg0}",
        REGint, REGstring),
    new PredefFunctionFixargs("chr",
        "chr $S0, {arg0}\n"
        "find_encoding $I0, 'utf8'\n"
        "trans_encoding {res}, $S0, $I0\n",
        REGstring, REGint),
    new PredefFunctionFixargs("ord",
        "ord {res}, {arg0}",
        REGint, REGstring),
    new PredefFunctionFixargs("ord",
        "ord {res}, {arg0}, {arg1}",
        REGint, REGstring, REGint),
    new PredefFunctionFixargs("substr",
        "substr {res}, {arg0}, {arg1}",
        REGstring, REGstring, REGint),
    new PredefFunctionFixargs("substr",
        "substr {res}, {arg0}, {arg1}, {arg2}",
        REGstring, REGstring, REGint, REGint),
    new PredefFunctionFixargs("indexof",
        "index {res}, {arg0}, {arg1}",
        REGint, REGstring, REGstring),
    new PredefFunctionFixargs("upcase",
        "upcase {res}, {arg0}",
        REGstring, REGstring),
    new PredefFunctionFixargs("downcase",
        "downcase {res}, {arg0}",
        REGstring, REGstring),
    new PredefFunctionFixargs("titlecase",
        "titlecase {res}, {arg0}",
        REGstring, REGstring),
    new PredefFunctionFixargs("join",
        "join {res}, {arg0}, {arg1}",
        REGstring, REGstring, REGvar),
    new PredefFunctionFixargs("split",
        "split {res}, {arg0}, {arg1}",
        REGvar, REGstring, REGstring),
    new PredefFunctionFixargs("chomp",
        "get_root_global $P0, ['parrot';'String';'Utils'], 'chomp'\n"
        "{res} = $P0({arg0})",
        REGstring, REGstring),
    new PredefFunctionFixargs("chomp",
        "get_root_global $P0, ['parrot';'String';'Utils'], 'chomp'\n"
        "{res} = $P0({arg0}, {arg1})",
        REGstring, REGstring, REGstring),

    // This is quick helper for Resizable...Array usage
    // while a better way is implemeneted.
    new PredefFunctionFixargs("__push_int",
        "push {arg0}, {arg1}",
        REGnone, REGvar, REGint),
    new PredefFunctionFixargs("__push_string",
        "push {arg0}, {arg1}",
        REGnone, REGvar, REGstring),

    new PredefFunctionFixargs("getinterp",
        "getinterp {res}",
        REGvar),
    new PredefFunctionFixargs("get_class",
        "get_class {res}, {arg0}",
        REGvar, REGstring),
    new PredefFunctionFixargs("clone",
        "clone {res}, {arg0}",
        REGvar, REGvar),
    new PredefFunctionFixargs("compreg",
        "compreg {res}, {arg0}",
        REGvar, REGstring),
    new PredefFunctionFixargs("compreg",
        "compreg {arg0}, {arg1}",
        REGnone, REGstring, REGvar),
    new PredefFunctionFixargs("load_language",
        "load_language {arg0}\n"
        "compreg {res}, {arg0}",
        REGvar, REGstring),
    new PredefFunctionFixargs("load_language",
        "load_language {arg0}\n"
        "compreg {res}, {arg1}",
        REGvar, REGstring, REGstring),
    new PredefFunctionFixargs("loadlib",
        "loadlib {res}, {arg0}",
        REGvar, REGstring),
    new PredefFunctionFixargs("load_bytecode",
        "load_bytecode {arg0}",
        REGvar, REGstring),
    new PredefFunctionFixargs("dlfunc",
        "dlfunc {res}, {arg0}, {arg1}, {arg2}",
        REGvar, REGvar, REGstring, REGstring),
    new PredefFunctionFixargs("sprintf",
        "sprintf {res}, {arg0}, {arg1}",
        REGstring, REGstring, REGvar),
    new PredefFunctionFixargs("sprintf",
        "sprintf {res}, {arg0}, {arg1}",
        REGvar, REGvar, REGvar)
};

const size_t PredefFunction::numpredefs =
    sizeof(PredefFunction::predefs) / sizeof(PredefFunction::predefs[0]);

const PredefFunction *PredefFunction::find(const std::string &name,
    size_t numargs)
{
    for (size_t i= 0; i < numpredefs; ++i) {
        int n = predefs[i]->n;
        if ((n == PredefFunction::VarArgs || n == int(numargs)) &&
                predefs[i]->name_is(name) )
            return predefs[i];
    }
    return 0;
}

void PredefFunctionFixargs::emit(Emit &e, const std::string &result,
    const std::vector<std::string> args) const
{
    std::string body= pbody;
    const size_t n= args.size();
    size_t pos;
    if (resulttype())
        while ((pos= body.find("{res}")) != std::string::npos)
            body= body.replace(pos, 5, result);
    if (n > 0)
        while ((pos= body.find("{arg0}")) != std::string::npos)
            body= body.replace(pos, 6, args[0]);
    if (n > 1)
        while ((pos= body.find("{arg1}")) != std::string::npos)
            body= body.replace(pos, 6, args[1]);
    if (n > 2)
        while ((pos= body.find("{arg2}")) != std::string::npos)
            body= body.replace(pos, 6, args[2]);
    if (n > 3)
        while ((pos= body.find("{arg3}")) != std::string::npos)
            body= body.replace(pos, 6, args[3]);
    e << body << '\n';
}

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

class Class;

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

class BlockBase
{
public:
    virtual char checklocal(const std::string &name) const = 0;
    virtual char checkconstant(const std::string &name) const = 0;
    virtual ConstantValue getconstant(const std::string &name) const = 0;
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
    virtual Class *findclass(const ClassKey &classkey)
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
    std::string gennamedlabel(const std::string &name);
    virtual std::string getnamedlabel(const std::string &name) = 0;
protected:
    typedef std::map<std::string, std::string> NamedLabels;
    std::string findlabel(const std::string &name);
    typedef std::map<std::string, char> Locals;
    Locals locals;
    typedef std::map<std::string, ConstantValue> Constants;
    Constants constants;
private:
    NamedLabels namedlabels;
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

std::string Block::gennamedlabel(const std::string &name)
{
    std::string gen = genlabel();
    namedlabels.insert(std::make_pair(name, gen));
    //std::cerr << name << "<-" << gen << '\n';
    return gen;
}

std::string Block::findlabel(const std::string &name)
{
    NamedLabels::iterator it= namedlabels.find (name);
    if (it != namedlabels.end() )
        return it->second;
    else
        return std::string();
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
    std::string getnamedlabel(const std::string &name);
    Class *findclass(const ClassKey &classkey)
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
    //std::cerr << "SubBlock::checkconstant\n";

    char c= Block::checkconstant(name);
    if (c == '\0')
        c= parent.checkconstant(name);
    //std::cerr << "SubBlock::checkconstant end\n";
    return c;
}

ConstantValue SubBlock::getconstant(const std::string &name) const
{
    //std::cerr << "SubBlock::getconstant\n";
    if (Block::checkconstant(name))
        return Block::getconstant(name);
    else
        return parent.getconstant(name);
    //std::cerr << "SubBlock::getconstant end\n";
}

std::string SubBlock::genlocallabel()
{
    std::ostringstream l;
    l << "__label_" << id << '_' << ++nlabel;
    return l.str();
}

std::string SubBlock::getnamedlabel(const std::string &name)
{
    std::string label = findlabel(name);
    return label.empty () ? parent.getnamedlabel(name) : label;
}

//**********************************************************************

class NamespaceKey
{
public:
    NamespaceKey() { }
    NamespaceKey(const NamespaceKey &parent, const std::string &name) :
        key(parent.key)
    {
        key.push_back(name);
    }
    bool isroot() const
    {
        return key.empty();
    }
    NamespaceKey parent() const
    {
        NamespaceKey newparent(*this);
        newparent.key.pop_back();
        return newparent;
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
    NamespaceKey *parentns;
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
    std::string getnamedlabel(const std::string &name);

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
    //std::cerr << "Free " << reg << "!\n";
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

std::string FunctionBlock::getnamedlabel(const std::string &name)
{
    std::string label= findlabel(name);
    if (label.empty () )
        throw SyntaxError("Label " + name + " not found", Token());
    //std::cerr << name << ": " << label << '\n';
    return label;
}

//**********************************************************************

class Function;
class BaseExpr;

//**********************************************************************

class BaseStatement
{
public:
    virtual bool isempty() { return false; }
    virtual void emit (Emit &e) = 0;
    virtual BaseStatement *optimize() { return this; }
    void optimize_branch(BaseStatement *&branch);
    void optimize_branch(BaseExpr *&branch);
    virtual ~BaseStatement() { };
};

//**********************************************************************

enum ClassSpecifierType
{
    CLASSSPECIFIER_invalid,
    CLASSSPECIFIER_str,
    CLASSSPECIFIER_parrotkey,
    CLASSSPECIFIER_id
};

class ClassSpecifier
{
protected:
    ClassSpecifier(const Token &t) : start(t)
    { }
public:
    virtual ClassSpecifierType reftype() const
    { return CLASSSPECIFIER_invalid; }
    virtual ~ClassSpecifier() {}
    void annotate(Emit &e)
    {
        e.annotate(start);
    }
    virtual std::string basename() const = 0;
    virtual void emit(Emit &e) = 0;
private:
    const Token start;
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

class UsingStatement : public BaseStatement
{
public:
    UsingStatement(Block &bl,
        const std::string &name, const NamespaceKey &nspace);
private:
    void emit (Emit &e);

    std::string n;
    NamespaceKey ns;
};

//**********************************************************************

class ExternStatement : public BaseStatement
{
public:
    ExternStatement(Tokenizer &tk);
private:
    void emit (Emit &e)
    {
        e << "load_bytecode '" << n << ".pbc'\n";
    }

    std::string n;
};

ExternStatement::ExternStatement(Tokenizer &tk)
{
    Token t;
    do {
        t= tk.get();
        if (!n.empty() )
            n+= '/';
        n+= t.identifier();
        t= tk.get();
    } while (t.isop('.') );
    RequireOp(';', t);
}

//**********************************************************************

class StaticStatement : public BaseStatement
{
public:
    StaticStatement(Block &bl, Tokenizer &tk)
    {
        Token t = tk.get();
        n = t.identifier();
        bl.genlocal(n, REGvar);
        ExpectOp(';', tk);
    }
private:
    void emit (Emit &e)
    {
        e << ".const 'Sub' " << n << " = '" << n << "'\n";
    }

    std::string n;
};

//**********************************************************************

class BaseExpr : public InBlock
{
public:
    BaseExpr(BlockBase &block) : InBlock(block) { }
    virtual BaseExpr *optimize()
    {
        return this;
    }
    virtual bool isleft() const { return false; }
    virtual void emitleft(Emit &)
    {
        std::cerr << typeid(*this).name() << '\n';
        throw InternalError("Not a left-side expression");
    }
    virtual void emitassign(Emit &, BaseExpr &, const std::string &)
    {
        std::cerr << typeid(*this).name() << '\n';
        throw InternalError("Not an assignable expression");
    }
    virtual void emit(Emit &e, const std::string &result) = 0;
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
    void optimize_branch(BaseExpr *&branch)
    { branch= branch->optimize(); }
};

BaseExpr * parseExpr(BlockBase &block, Tokenizer &tk);

//**********************************************************************

class Condition : public InBlock
{
public:
    Condition (Block &block, Tokenizer &tk);
    Condition (BlockBase &block, BaseExpr *condexpr);
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
    BaseExpr *expr;
};

//**********************************************************************

void BaseStatement::optimize_branch(BaseStatement *&branch)
{
    if (branch)
        branch= branch->optimize();
}

void BaseStatement::optimize_branch(BaseExpr *&branch)
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
    void optimize()
    {
        for (size_t i= 0; i < args.size(); ++i)
            args[i]= args[i]->optimize();
    }
    size_t numargs() const { return args.size(); }
    int getintegervalue(size_t narg) const
    {
        BaseExpr *arg= args.at(narg);
        return arg->getintegervalue();
    }
private:
    std::string name;
    std::vector <BaseExpr *> args;
};

//**********************************************************************

class Modifiers
{
public:
    bool has_modifier(const std::string &name) const
    {
        return modifiers.find(name) != modifiers.end();
    }
    const Modifier * getmodifier(const std::string &name) const
    {
        ModifierList::const_iterator it= modifiers.find(name);
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
        for (ModifierList::iterator it= modifiers.begin();
                it != modifiers.end(); ++it)
           it->second.optimize();
    }
protected:
    typedef std::map<std::string, Modifier> ModifierList;
    ModifierList modifiers;
};

//**********************************************************************

class FunctionModifiers : public Modifiers
{
public:
    FunctionModifiers(BlockBase &block, Tokenizer &tk, const NamespaceKey &)
    {
        Token t= tk.get();
        if (! t.isop('[') )
            tk.unget(t);
        else
            parse(block, tk);
    }
};

//**********************************************************************

class ArgumentList : public InBlock
{
public:
    ArgumentList(Block &block, Tokenizer &tk);
    void optimize();
    void prepare(Emit &e);
    void emit(Emit &e);
private:
    std::vector <BaseExpr *> args;
    std::vector <std::string> argregs;
};

//**********************************************************************

class PiropStatement : public SubStatement
{
public:
    PiropStatement(Block & block, const Token &st, Tokenizer &tk) :
            SubStatement(block),
            start(st),
            args(0)
    {
        Token t = tk.get();
        if (! t.isop('{'))
            throw SyntaxError("Invalid '$' statement", start);
        t = tk.get();
        opname = t.identifier();
        t = tk.get();
        if (! t.isop('}'))
        {
            tk.unget(t);
            args = new ArgumentList(block, tk);
            t = tk.get();
            if (! t.isop('}'))
               throw Expected('}', t);
        }
        ExpectOp(';', tk);
    }
private:
    PiropStatement * optimize()
    {
        if (args)
            args->optimize();
        return this;
    }
    void emit (Emit &e)
    {
        if (args)
            args->prepare(e);
        e.annotate(start);
        e << opname;
        if (args) {
            e << ' ';
            args->emit(e);
        }
        e << '\n';
    }

    const Token start;
    std::string opname;
    ArgumentList *args;
};

//**********************************************************************

class ExprStatement : public BaseStatement
{
public:
    ExprStatement(Block &parentblock, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);

    BaseExpr *expr;
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

class ValueStatement : public SubStatement
{
public:
    ValueStatement(Block & block, const Token &st);
protected:
    void parseArray(Tokenizer &tk);
    void emit (Emit &e, const std::string &name, char type);

    enum ValueType { ValueSimple, ValueArray, ValueFixedArray };
    ValueType vtype;
    BaseExpr *esize;
    std::vector<BaseExpr *> value;
    const Token start;
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

class FloatStatement : public ValueStatement
{
public:
    FloatStatement(Block & block, const Token &st, Tokenizer &tk);
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
    ConstStatement(Block & block, const Token &st, Tokenizer &tk);
    BaseStatement *optimize();
    void emit (Emit &e);
private:
    char type;
    std::string name;
    BaseExpr *value;
};

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

class GotoStatement: public SubStatement
{
public:
    GotoStatement(Block &block, const Token &st, Tokenizer &tk);
    void emit (Emit &e);
private:
    Token start;
    Block &bl;
    std::string labelname;
};

//**********************************************************************

class ReturnStatement : public SubStatement
{
public:
    ReturnStatement(Block & block, Tokenizer &tk);
    BaseStatement *optimize();
    void emit (Emit &e);
private:
    ArgumentList *values;
};

//**********************************************************************

class YieldStatement : public SubStatement
{
public:
    YieldStatement(Block & block, Tokenizer &tk);
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
        e << "goto " << getbreaklabel() << " # break\n";
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
        e << "goto " << getcontinuelabel() << " # continue\n";
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

class SwitchStatement : public BreakableStatement
{
public:
    SwitchStatement(Block &block, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);
    BaseExpr *condition;
    std::vector<BaseExpr *> casevalue;
    std::vector<std::vector<BaseStatement *> > casest;
    std::vector<BaseStatement *> defaultst;
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
    BaseExpr * container;
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
    BaseExpr * condition;
    BaseExpr * iteration;
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
    BaseExpr * excep;
};

//**********************************************************************

class TryStatement : public BlockStatement
{
public:
    TryStatement(Block &block, const Token &st, Tokenizer &tk);
private:
    BaseStatement *optimize();
    void emit (Emit &e);
    Token start;
    Modifiers modifiers;
    BaseStatement *stry;
    BaseStatement *scatch;
    std::string exname;
};

//**********************************************************************

class Function : protected FunctionModifiers, public FunctionBlock
{
public:
    Function(Tokenizer &tk, const Token &st,
        Block &parent,
        const NamespaceKey & ns_a, const std::string &funcname);
    std::string getname() const { return name; }
    NamespaceKey getnamespace() const { return ns; }
    void optimize();
    virtual void emit (Emit &e);
    void local(std::string name);
    bool islocal(std::string name) const;
    virtual void emitparams (Emit &e);
    virtual void emitbody (Emit &e);
    virtual ~Function() {}
private:
    const Token start;
    const NamespaceKey ns;
    const std::string name;
    std::vector <std::string> params;
    class ParamInfo
    {
    public:
        ParamInfo() : t('\0') { }
        ParamInfo(char type, const Modifiers &mods) :
            t(type), modifiers(mods)
        {}
        char type() const { return t; }
        bool has_modifier(const std::string &name) const
        { return modifiers.has_modifier(name); }
    private:
        char t;
        Modifiers modifiers;
    };
    std::map <std::string, ParamInfo> paraminfo;
    std::vector <std::string> loc;
    BaseStatement *body;
    Token tend;
};

//**********************************************************************

BaseStatement *parseUsing(Block &block, Tokenizer &tk)
{
    Token t= tk.get();
    if (t.iskeyword("extern"))
    {
        return new ExternStatement(tk);
    }
    else if (t.iskeyword("static")) {
        return new StaticStatement(block, tk);
    }
    else
    {
        NamespaceKey ns;
        std::string name= t.identifier();
        while((t= tk.get()).isop('.'))
        {
            ns= NamespaceKey(ns, name);
            t= tk.get();
            name= t.identifier();
        }
        RequireOp(';', t);
        return new UsingStatement(block, name, ns);
    }
}

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

BaseStatement *parseStatement(Block &block, Tokenizer &tk)
{
    Token t= tk.get();
    while (t.isspace() )
        t= tk.get();

    if (t.isop(';'))
        return new EmptyStatement();
    if (t.isop('{') )
        return new CompoundStatement(block, tk);
    if (t.isop('$') )
        return new PiropStatement(block, t, tk);
    if (t.iskeyword("using"))
        return parseUsing(block, tk);

    switch(nativetype(t))
    {
    case REGint:
        return new IntStatement(block, t, tk);
    case REGfloat:
        return new FloatStatement(block, t, tk);
    case REGstring:
        return new StringStatement(block, t, tk);
    case REGvar:
        return new VarStatement(block, t, tk);
    default: /* Not a declaration */ ;
    }
    if (t.iskeyword("const"))
        return new ConstStatement(block, t, tk);

    if (t.iskeyword("return"))
        return new ReturnStatement(block, tk);
    if (t.iskeyword("yield"))
        return new YieldStatement(block, tk);
    if (t.iskeyword("goto"))
        return new GotoStatement(block, t, tk);
    if (t.iskeyword("break"))
        return new BreakStatement(block, tk);
    if (t.iskeyword("continue"))
        return new ContinueStatement(block, tk);
    if (t.iskeyword("if"))
        return new IfStatement(block, tk);
    if (t.iskeyword("switch"))
        return new SwitchStatement(block, tk);
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

    if (t.isidentifier() )
    {
        Token t2= tk.get();
        if (t2.isop(':'))
            return new LabelStatement(block, t.identifier());
        else
        {
            tk.unget(t2);
            tk.unget(t);
            return new ExprStatement(block, tk);
        }
    }
    else
    {
        tk.unget(t);
        return new ExprStatement(block, tk);
    }
}

//**********************************************************************

LabelStatement::LabelStatement(Block &block, const std::string &name) :
    SubStatement(block),
    labelname(name),
    codename(block.gennamedlabel(name))
{
}

void LabelStatement::emit (Emit &e)
{
    e << codename << ":"
        " # " << labelname << '\n';
}

//**********************************************************************

GotoStatement::GotoStatement(Block &block, const Token &st, Tokenizer &tk) :
    SubStatement(block),
    start(st),
    bl(block)
{
    Token t= tk.get();
    labelname= t.identifier();
    t= tk.get();
    if (!t.isop(';'))
        throw Expected ("';' after label", t);
}

void GotoStatement::emit (Emit &e)
{
    e.annotate(start);
    e <<
        "goto " << bl.getnamedlabel(labelname) <<
        " # " << labelname << '\n';
}

//**********************************************************************

ArgumentList::ArgumentList(Block &block, Tokenizer &tk) :
    InBlock(block)
{
    Token t;
    do
    {
        BaseExpr *arg= parseExpr(block, tk);
        args.push_back(arg);
        t= tk.get();
    } while (t.isop(',') );
    tk.unget(t);
}

void ArgumentList::optimize()
{
    for (size_t i= 0; i < args.size(); ++i)
        args[i]= args[i]->optimize();
}

void ArgumentList::prepare(Emit &e)
{
    for (size_t i= 0; i < args.size(); ++i)
    {
        if (! args[i]->issimple() )
        {
            std::string reg= gentemp(args[i]->checkresult());
            args[i]->emit(e, reg);
            argregs.push_back(reg);
        }
        else
        {
            if (args[i]->isnull())
            {
                std::string reg= gentemp(REGvar);
                e << op_null(reg) << '\n';
                argregs.push_back(reg);
            }
            else
                argregs.push_back(std::string());
        }
    }
}

void ArgumentList::emit(Emit &e)
{
    for (size_t i= 0; i < args.size(); ++i)
    {
        if (i > 0)
            e << ", ";
        if (argregs[i].empty() )
            args[i]->emit(e, std::string() );
        else
            e << argregs[i];
    }
}

//**********************************************************************

class SimpleBaseExpr : public BaseExpr
{
public:
    SimpleBaseExpr(BlockBase &block, Token token) :
        BaseExpr(block),
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
            e << result << " = ";
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
            e << result << " = ";
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

    BaseExpr *optimize();
    void emit(Emit &e, const std::string &result);
};

BaseExpr *IdentifierExpr::optimize()
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
        e << result << " = ";
    e << getidentifier();
    if (! result.empty() )
        e << '\n';
}

//**********************************************************************

class OpBaseExpr : public BaseExpr
{
public:
    OpBaseExpr(BlockBase &block, const Token &t) :
        BaseExpr(block),
        start(t)
    { }
protected:
    void annotate(Emit &e)
    {
        e.annotate(start);
    }
    const Token start;
};

//**********************************************************************

class OpUnaryBaseExpr : public OpBaseExpr
{
public:
    OpUnaryBaseExpr(BlockBase &block, const Token &t, BaseExpr *subexpr) :
        OpBaseExpr(block, t),
        expr(subexpr)
    { }
protected:
    BaseExpr * expr;
private:
    BaseExpr *optimize()
    {
        optimize_branch(expr);
        return this;
    }
};

//**********************************************************************

class OpUnaryMinusExpr : public OpUnaryBaseExpr
{
public:
    OpUnaryMinusExpr(BlockBase &block, Token t, BaseExpr *subexpr) :
        OpUnaryBaseExpr(block, t, subexpr)
    {
    }
private:
    bool isinteger () const { return expr->isinteger(); }
    BaseExpr *optimize()
    {
        optimize_branch(expr);
        if (expr->isliteralinteger() )
        {
            const int n= expr->getintegervalue();
            return new IntegerExpr(*this, start, -n);
        }
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string arg= gentemp(REGint);
        expr->emit(e, arg);
        std::string r= result.empty() ? gentemp(REGint) : result;
        annotate(e);
        e << r << " = neg " << arg;
        if (! result.empty() )
            e << '\n';
    }
};

//**********************************************************************

class OpNotExpr : public OpUnaryBaseExpr
{
public:
    OpNotExpr(BlockBase &block, Token t, BaseExpr *subexpr) :
        OpUnaryBaseExpr(block, t, subexpr)
    {
    }
private:
    bool isinteger () const { return true; }
    BaseExpr *optimize()
    {
        optimize_branch(expr);
        if (expr->isnull() )
            return new IntegerExpr(*this, start, 1);
        if (expr->isliteralinteger() )
        {
            const int n= expr->getintegervalue();
            return new IntegerExpr(*this, start, !n);
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

class IncDecOp : public OpUnaryBaseExpr
{
protected:
    IncDecOp(BlockBase &block, Token t, BaseExpr *subexpr) :
        OpUnaryBaseExpr(block, t, subexpr)
    {
    }
    std::string getvar()
    {
        if ( (! expr->isidentifier() ) || expr->isstring())
            throw SyntaxError("invalid type", start);
        return expr->getidentifier();
    }
private:
    bool isinteger () const { return expr->isinteger(); }
};

//**********************************************************************

class OpPreIncExpr : public IncDecOp
{
public:
    OpPreIncExpr(BlockBase &block, Token t, BaseExpr *subexpr) :
        IncDecOp(block, t, subexpr)
    {
    }
private:
    void emit(Emit &e, const std::string &result)
    {
        std::string var= getvar();
        annotate(e);
        e << "inc " << var << '\n';
        if (! result.empty())
            e << result << " = " << var << '\n';
    }
};

//**********************************************************************

class OpPreDecExpr : public IncDecOp
{
public:
    OpPreDecExpr(BlockBase &block, Token t, BaseExpr *subexpr) :
        IncDecOp(block, t, subexpr)
    {
    }
private:
    void emit(Emit &e, const std::string &result)
    {
        std::string var= getvar();
        annotate(e);
        e << "dec " << var << '\n';
        if (! result.empty())
            e << result << " = " << var << '\n';
    }
};

//**********************************************************************

class OpPostIncExpr : public IncDecOp
{
public:
    OpPostIncExpr(BlockBase &block, Token t, BaseExpr *subexpr) :
        IncDecOp(block, t, subexpr)
    {
    }
private:
    void emit(Emit &e, const std::string &result)
    {
        std::string var= getvar();
        std::string reg= gentemp(REGint);
        annotate(e);
        e << reg << " = " << var << "\n"
            "inc " << var << '\n';
        if (! result.empty())
            e << result << " = " << reg << '\n';
    }
};

//**********************************************************************

class OpPostDecExpr : public IncDecOp
{
public:
    OpPostDecExpr(BlockBase &block, Token t, BaseExpr *subexpr) :
        IncDecOp(block, t, subexpr)
    {
    }
private:
    void emit(Emit &e, const std::string &result)
    {
        std::string var= getvar();
        std::string reg= gentemp(REGint);
        annotate(e);
        e << reg << " = " << var << "\n"
            "dec " << var << '\n';
        if (! result.empty())
            e << result << " = " << reg << '\n';
    }
};

//**********************************************************************

class BinOpExpr : public OpBaseExpr
{
protected:
    BinOpExpr(BlockBase &block, Token t, BaseExpr *first, BaseExpr *second) :
        OpBaseExpr(block, t),
        efirst(first),
        esecond(second)
    {
    }
    void optimize_operands();
    BaseExpr *efirst;
    BaseExpr *esecond;
private:
    BaseExpr *optimize();
};

void BinOpExpr::optimize_operands()
{
    optimize_branch(efirst);
    optimize_branch(esecond);
}

BaseExpr *BinOpExpr::optimize()
{
    optimize_operands();
    return this;
}

//**********************************************************************

class CommonBinOpExpr : public BinOpExpr
{
public:
    CommonBinOpExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        BinOpExpr(block, t, first, second)
    {
    }
protected:
    bool isstring() const;
    bool isinteger() const;
};

bool CommonBinOpExpr::isstring() const
{
    return efirst->isstring() && esecond->isstring();
}

bool CommonBinOpExpr::isinteger() const
{
    return efirst->isinteger() && esecond->isinteger();
}

//**********************************************************************

class CompareOpExpr : public BinOpExpr
{
public:
    CompareOpExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        BinOpExpr(block, t, first, second)
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
            Token t, BaseExpr *first, BaseExpr *second) :
        CompareOpExpr(block, t, first, second)
    { }
private:
    bool isinteger() const { return true; }
    BaseExpr *optimize();
    void emit(Emit &e, const std::string &result);
};

BaseExpr *OpEqualExpr::optimize()
{
    optimize_operands();
    if (efirst->issimple() && esecond->issimple())
    {
        if (efirst->isnull() && esecond->isnull())
        {
            return new IntegerExpr(*this, start, 1);
        }
        if (efirst->isliteralinteger() && esecond->isliteralinteger())
        {
            return new IntegerExpr(*this, start,
                efirst->getintegervalue() == esecond->getintegervalue());
        }
        if (efirst->isliteralstring() && esecond->isliteralstring())
        {
            std::string s1= efirst->getstringvalue();
            std::string s2= esecond->getstringvalue();
            return new IntegerExpr(*this, start, s1 == s2);
        }
    }
    return this;
}

void OpEqualExpr::emit(Emit &e, const std::string &result)
{
    char ltype = efirst->checkresult();
    char rtype = esecond->checkresult();
    std::string res= gentemp(REGint);
    if (efirst->isnull() || esecond->isnull())
    {
        std::string op;
        if (efirst->isnull())
        {
            op= gentemp(rtype);
            esecond->emit(e, op);
        }
        else
        {
            op= gentemp(ltype);
            efirst->emit(e, op);
        }
        e << op_isnull(res, op);
    }
    else
    {
        if (ltype == rtype)
        {
            std::string op1= gentemp(ltype);
            std::string op2= gentemp(rtype);
            efirst->emit(e, op1);
            esecond->emit(e, op2);
            e << res << " = iseq " << op1 << " , " << op2;
        }
        else if (ltype == REGvar && rtype == REGstring)
        {
            std::string op1= gentemp(REGstring);
            std::string op2= gentemp(REGstring);
            std::string aux= gentemp(REGvar);
            efirst->emit(e, aux);
            esecond->emit(e, op2);
            e << op1 << " = " << aux << '\n';
            e << res << " = iseq " << op1 << " , " << op2;
        }
        else if (ltype == REGstring && rtype == REGvar)
        {
            std::string op1= gentemp(REGstring);
            std::string op2= gentemp(REGstring);
            std::string aux= gentemp(REGvar);
            efirst->emit(e, op1);
            esecond->emit(e, aux);
            e << op2 << " = " << aux << '\n';
            e << res << " = iseq " << op1 << " , " << op2;
        }
        else
        {
            std::string op1= gentemp(REGvar);
            std::string op2= gentemp(REGvar);
            if (efirst->isinteger() )
            {
                std::string aux= gentemp(REGint);
                efirst->emit(e, aux);
                e << op_box(res, aux) << '\n';
            }
            else if (efirst->isstring() )
            {
                std::string aux= gentemp(REGstring);
                efirst->emit(e, aux);
                e << op_box(op1, aux) << '\n';
            }
            else
                efirst->emit(e, op1);
            if (esecond->isinteger() )
            {
                std::string aux= gentemp(REGint);
                esecond->emit(e, aux);
                e << op_box(op2, aux) << '\n';
            }
            else if (esecond->isstring() )
            {
                std::string aux= gentemp(REGstring);
                esecond->emit(e, aux);
                e << op_box(op2, aux) << '\n';
            }
            else
                esecond->emit(e, op2);
            e << res << " = iseq " << op1 << " , " << op2;
        }
    }
    if (!result.empty())
        e << '\n' << result << " = " << res << '\n';
}

//**********************************************************************

class OpNotEqualExpr : public CompareOpExpr
{
public:
    OpNotEqualExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CompareOpExpr(block, t, first, second)
    { }
private:
    BaseExpr *optimize();
    void emit(Emit &e, const std::string &result);
};

BaseExpr *OpNotEqualExpr::optimize()
{
    optimize_operands();
    if (efirst->issimple() && esecond->issimple())
    {
        if (efirst->isnull() && esecond->isnull())
            return new IntegerExpr(*this, start, 0);
        if (efirst->isliteralinteger() && esecond->isliteralinteger())
            return new IntegerExpr(*this, start,
                efirst->getintegervalue() != esecond->getintegervalue());
        if (efirst->isliteralstring() && esecond->isliteralstring())
            return new IntegerExpr(*this, start,
                efirst->getstringvalue() != esecond->getstringvalue());
    }
    return this;
}

void OpNotEqualExpr::emit(Emit &e, const std::string &result)
{
    std::string res= gentemp(REGint);
    if (efirst->isnull() || esecond->isnull())
    {
        char type;
        std::string op;
        if (efirst->isnull())
        {
            type= esecond->checkresult();
            op= gentemp(type);
            esecond->emit(e, op);
        }
        else
        {
            type= efirst->checkresult();
            op= gentemp(type);
            efirst->emit(e, op);
        }
        e << op_isnull(res, op) << '\n' <<
            "not " << res;
    }
    else if (efirst->isinteger() && esecond->isinteger())
    {
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << res << " = isne " << op1 << " , " << op2;
    }
    else if (efirst->isstring() && esecond->isstring())
    {
        std::string op1= gentemp(REGstring);
        std::string op2= gentemp(REGstring);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << res << " = isne " << op1 << " , " << op2;
    }
    else
    {
        std::string op1= gentemp(REGvar);
        std::string op2= gentemp(REGvar);
        if (efirst->isinteger() )
        {
            std::string aux= gentemp(REGint);
            efirst->emit(e, aux);
            e << op_box(op1, aux) << '\n';
        }
        else if (efirst->isstring() )
        {
            std::string aux= gentemp(REGstring);
            efirst->emit(e, aux);
            e << op_box(op1, aux) << '\n';
        }
        else
            efirst->emit(e, op1);
        if (esecond->isinteger() )
        {
            std::string aux= gentemp(REGint);
            esecond->emit(e, aux);
            e << op_box(op2, aux) << '\n';
        }
        else if (esecond->isstring() )
        {
            std::string aux= gentemp(REGstring);
            esecond->emit(e, aux);
            e << op_box(op2, aux) << '\n';
        }
        else
            esecond->emit(e, op2);
        e << res << " = isne " << op1 << " , " << op2;
    }
    if (!result.empty())
        e << '\n' << result << " = " << res << '\n';
}

//**********************************************************************

class ComparatorBaseExpr : public CompareOpExpr
{
protected:
    ComparatorBaseExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CompareOpExpr(block, t, first, second)
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
    char type1= efirst->checkresult();
    char type2= esecond->checkresult();
    if (type1 == REGint || type2 == REGint)
    {
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        if (type1 == REGint)
            efirst->emit(e, op1);
        else {
            std::string aux= gentemp(REGvar);
            efirst->emit(e, aux);
            e << op1 << " = " << aux << '\n';
        }
        if (type2 == REGint)
            esecond->emit(e, op2);
        else {
            std::string aux= gentemp(REGvar);
            esecond->emit(e, aux);
            e << op2 << " = " << aux << '\n';
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
            efirst->emit(e, op1);
        else {
            std::string aux= gentemp(REGvar);
            efirst->emit(e, aux);
            e << op1 << " = " << aux << '\n';
        }
        if (type2 == REGstring)
            esecond->emit(e, op2);
        else {
            std::string aux= gentemp(REGvar);
            esecond->emit(e, aux);
            e << op2 << " = " << aux << '\n';
        }
        emitop(e, res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
    else
    {
        std::string op1= gentemp(REGvar);
        std::string op2= gentemp(REGvar);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
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
            Token t, BaseExpr *first, BaseExpr *second) :
        ComparatorBaseExpr(block, t, first, second)
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
            Token t, BaseExpr *first, BaseExpr *second) :
        ComparatorBaseExpr(block, t, first, second)
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
            Token t, BaseExpr *first, BaseExpr *second) :
        ComparatorBaseExpr(block, t, first, second)
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
            Token t, BaseExpr *first, BaseExpr *second) :
        ComparatorBaseExpr(block, t, first, second)
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
            Token t, BaseExpr *first, BaseExpr *second) :
        BinOpExpr(block, t, first, second)
    {
    }
private:
    bool isinteger() const { return esecond->isinteger(); }
    bool isstring() const { return esecond->isstring(); }
    void emit(Emit &e, const std::string &result)
    {
        if (efirst->isidentifier())
        {
            std::string varname= efirst->getidentifier();
            char type= checklocal(varname);
            if (esecond->isindex())
            {
                esecond->emit(e, varname);
                if (! result.empty() )
                    e << result << " = " << varname << '\n';
                return;
            }
            switch (type)
            {
            case REGint:
                if (!(esecond->isinteger() || esecond->isstring()))
                {
                    std::string r= gentemp(REGvar);
                    esecond->emit(e, r);
                    e.annotate(start);
                    e << varname << " = " << r << '\n';
                    if (! result.empty() )
                        e << result << " = " << r << '\n';
                }
                else {
                    if (result.empty() )
                        esecond->emit(e, varname);
                    else
                    {
                        std::string r= gentemp(REGint);
                        esecond->emit(e, r);
                        e.annotate(start);
                        e << varname << " = " << r << '\n';
                        e << result << " = " << r << '\n';
                    }
                }
                break;
            case REGstring:
                if (esecond->isnull())
                {
                    e.annotate(start);
                    e << op_null(varname) << '\n';
                }
                else if (!(esecond->isinteger() || esecond->isstring()))
                {
                    std::string r= gentemp(REGstring);
                    esecond->emit(e, r);
                    e.annotate(start);
                    e << varname << " = " << r << '\n';
                    if (! result.empty() )
                        e << result << " = " << r << '\n';
                }
                else {
                    if (result.empty() )
                        esecond->emit(e, varname);
                    else
                    {
                        std::string r= gentemp(REGstring);
                        esecond->emit(e, r);
                        e.annotate(start);
                        e << varname << " = " << r << '\n';
                        e << result << " = " << r << '\n';
                    }
                }
                break;
            default:
                if (esecond->isnull())
                {
                    e.annotate(start);
                    e << op_null(varname) << '\n';
                }
                else if (esecond->isinteger() || esecond->isstring() )
                {
                    e.annotate(start);
                    e << "box " << varname << ", ";
                    esecond->emit(e, std::string());
                    e << '\n';
                    if (! result.empty() )
                        e << result << " = " << varname << '\n';
                }
                else
                {
                    esecond->emit(e, varname);
                    if (! result.empty() )
                        e << result << " = " << varname << '\n';
                }
            }
        }
        else
        {
            if (!efirst->isleft() )
                throw SyntaxError("Not a left-side expression for '='", start);

            std::string reg= result.empty() ? std::string() :
                gentemp(esecond->checkresult());
            efirst->emitassign(e, *esecond, reg);
            if (! result.empty() )
                e << result << " = " << reg << '\n';
        }
    }
};

//**********************************************************************

class OpAssignToExpr : public CommonBinOpExpr
{
public:
    OpAssignToExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    BaseExpr *optimize()
    {
        optimize_operands();
        return this;
    }
    void emit(Emit &e, const std::string &/*result*/)
    {
        if (efirst->isidentifier())
        {
            std::string varname= efirst->getidentifier();
            char type= checklocal(varname);
            switch(type)
            {
            case REGint:
            case REGstring:
                if (!(esecond->isinteger() || esecond->isstring()))
                {
                    std::string r= gentemp(type == REGstring ? REGstring : REGvar);
                    esecond->emit(e, r);
                    e.annotate(start);
                    e << varname << " = " << r << '\n';
                }
                else
                    esecond->emit(e, varname);
                return;
            default:
                e.annotate(start);
                e << "assign " << varname << ", ";
                esecond->emit(e, std::string());
                e << '\n';
                return;
            }
        }
        throw Unsupported("Only simple assignments for a now", start);
    }
};

//**********************************************************************

class OpAddToExpr : public CommonBinOpExpr
{
public:
    OpAddToExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    bool isinteger() const { return efirst->isinteger(); }
    bool isstring() const { return efirst->isstring(); }
    BaseExpr *optimize()
    {
        optimize_operands();
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        if (efirst->isidentifier())
        {
            if (efirst->isstring())
            {
                std::string reg= gentemp(REGstring);
                esecond->emit(e, reg);
                std::string dest = efirst->getidentifier();
                e << "concat " << dest << ", " << dest << ", " << reg << '\n';
            }
            else
            {
                e << "add " << efirst->getidentifier() << ", ";
                esecond->emit(e, "");
                e << '\n';
            }
            if (! result.empty())
                e << "assign " << result << ", " <<
                    efirst->getidentifier() << '\n';
        }
    }
};

//**********************************************************************

class OpSubToExpr : public CommonBinOpExpr
{
public:
    OpSubToExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    bool isinteger() const { return true; }
    BaseExpr *optimize()
    {
        optimize_operands();
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        if (efirst->isidentifier())
        {
            e << "sub " << efirst->getidentifier() << ", ";
            esecond->emit(e, "");
            e << '\n';
            if (! result.empty())
                e << "assign " << result << ", " <<
                    efirst->getidentifier() << '\n';
        }
    }
};

//**********************************************************************

class OpAddExpr : public CommonBinOpExpr
{
public:
    OpAddExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    bool isstring () const
    {
        return (efirst->isstring() &&
            (esecond->isstring() || esecond->isinteger()) ) ||
            (esecond->isstring() &&
            (efirst->isstring() || efirst->isinteger()) );
    }
    BaseExpr *optimize();
    void emit(Emit &e, const std::string &result);
};

BaseExpr *OpAddExpr::optimize()
{
    //std::cerr << "OpAddExpr::optimize\n";

    optimize_operands();
    if (efirst->issimple() && esecond->issimple())
    {
        if (efirst->isliteralinteger() && esecond->isliteralinteger())
        {
            //std::cerr << "OpAddExpr::optimize int\n";
            return new IntegerExpr(*this, start,
                efirst->getintegervalue() + esecond->getintegervalue());
        }
        if (efirst->isliteralstring() && esecond->isliteralstring())
        {
            //std::cerr << "OpAddExpr::optimize string\n";
            Token newt= Token(TokenTQuoted, efirst->getstringvalue() + esecond->getstringvalue(), efirst->gettoken());
            return new StringExpr(*this, newt);
        }
    }
    return this;
}

void OpAddExpr::emit(Emit &e, const std::string &result)
{
    if (efirst->isstring() && esecond->isstring())
    {
        std::string res= result.empty() ? gentemp(REGstring) : result;
        std::string op1= gentemp(REGstring);
        std::string op2= gentemp(REGstring);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << res << " = concat " << op1 << " , " << op2;
    }
    else if (isinteger())
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << op_add(res, op1, op2);
    }
    else if (efirst->isstring() && esecond->isinteger())
    {
        std::string res= result.empty() ? gentemp(REGstring) : result;
        std::string op1= gentemp(REGstring);
        std::string op2= gentemp(REGint);
        std::string op2_s= gentemp(REGstring);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << op_set(op2_s, op2) << '\n' <<
            res << " = concat " << op1 << " , " << op2_s;
    }
    else if (efirst->isinteger() && esecond->isstring())
    {
        std::string res= result.empty() ? gentemp(REGstring) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGstring);
        std::string op1_s= gentemp(REGstring);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << op_set(op1_s, op1) << '\n' <<
            res << " = concat " << op1_s << " , " << op2;
    }
    else
    {
        std::string res= result.empty() ? gentemp(REGvar) : result;
        std::string op1= gentemp(REGvar);
        std::string op2= gentemp(REGvar);
        switch (efirst->checkresult() )
        {
        case REGint:
            e << op1 << " = new 'Integer'\n";
            break;
        case REGstring:
            e << op1 << " = new 'String'\n";
            break;
        default:
            e << op_null(op1) << '\n';
        }
        switch (esecond->checkresult() )
        {
        case REGint:
            e << op2 << " = new 'Integer'\n";
            break;
        case REGstring:
            e << op2 << " = new 'String'\n";
            break;
        default:
            e << op_null(op2) << '\n';
        }
        efirst->emit(e, op1);
        esecond->emit(e, op2);
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
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    BaseExpr *optimize();
    void emit(Emit &e, const std::string &result);
};

BaseExpr *OpSubExpr::optimize()
{
    //std::cerr << "OpSubExpr::optimize\n";

    optimize_operands();
    if (efirst->issimple() && esecond->issimple())
    {
        if (efirst->isliteralinteger() && esecond->isliteralinteger())
        {
            //std::cerr << "OpSubExpr::optimize int\n";
            int n1= efirst->getintegervalue();
            int n2= esecond->getintegervalue();
            //std::cerr << n1 << " " << n2 << '\n';
            return new IntegerExpr(*this, start, n1 - n2);
        }
    }
    return this;
}

void OpSubExpr::emit(Emit &e, const std::string &result)
{
    std::string res= result.empty() ? gentemp(REGint) : result;
    std::string op1= gentemp(REGint);
    std::string op2= gentemp(REGint);
    efirst->emit(e, op1);
    esecond->emit(e, op2);
    e << op_sub(res, op1, op2);
    if (!result.empty())
        e << '\n';
}

//**********************************************************************

class OpBoolOrExpr : public BinOpExpr
{
public:
    OpBoolOrExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        BinOpExpr(block, t, first, second)
    { }
private:
    bool isinteger() const { return true; }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        if (esecond->issimple())
        {
            efirst->emit(e, op1);
            esecond->emit(e, op2);
            e << res << " = or " << op1 << ", " << op2;
        }
        else
        {
            std::string l = genlocallabel();
            efirst->emit(e, res);
            e.annotate(start);
            e << "if " << res << " goto " << l << '\n';
            esecond->emit(e, res);
            e << l << ":\n";
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
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    bool isinteger() const { return true; }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << res << " = band " << op1 << ", " << op2;
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class OpBinOrExpr : public CommonBinOpExpr
{
public:
    OpBinOrExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    bool isinteger() const { return true; }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << res << " = bor " << op1 << ", " << op2;
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class OpBoolAndExpr : public OpBaseExpr
{
public:
    OpBoolAndExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        OpBaseExpr(block, t),
        efirst(first),
        esecond(second)
    { }
private:
    bool isinteger() const { return true; }
    BaseExpr *optimize()
    {
        optimize_branch(efirst);
        optimize_branch(esecond);
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string res= result.empty() ? gentemp(REGint) : result;
        std::string op1= gentemp(REGint);
        std::string op2= gentemp(REGint);
        if (esecond->issimple())
        {
            efirst->emit(e, op1);
            esecond->emit(e, op2);
            e.annotate(start);
            e << res << " = and " << op1 << ", " << op2;
        }
        else
        {
            std::string l = genlocallabel();
            efirst->emit(e, res);
            e.annotate(start);
            e << "unless " << res << " goto " << l << '\n';
            esecond->emit(e, res);
            e << l << ":\n";
        }
        if (!result.empty())
            e << '\n';
    }
    BaseExpr *efirst;
    BaseExpr *esecond;
};

//**********************************************************************

class OpMulExpr : public CommonBinOpExpr
{
public:
    OpMulExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    { }
private:
    bool isinteger() const
    {
        return efirst->isinteger() && esecond->isinteger();
    }
    bool isstring() const
    {
        if (efirst->isstring() && esecond->isinteger())
            return true;
        else
            return false;
    }
    BaseExpr *optimize()
    {
        optimize_operands();
        if (efirst->isliteralinteger() && esecond->isliteralinteger())
        {
            return new IntegerExpr(*this, start,
                efirst->getintegervalue() * esecond->getintegervalue());
        }
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        if (isstring())
        {
            std::string res= result.empty() ? gentemp(REGstring) : result;
            std::string op1= gentemp(REGstring);
            std::string op2= gentemp(REGint);
            efirst->emit(e, op1);
            esecond->emit(e, op2);
            e << "repeat " << res << ", " << op1 << ", " << op2;
        }
        else
        {
            char type= efirst->isinteger() && esecond->isinteger() ? REGint : REGvar;
            std::string res= result.empty() ? gentemp(type) : result;
            std::string op1= gentemp(type);
            std::string op2= gentemp(type);
            efirst->emit(e, op1);
            esecond->emit(e, op2);
            e << op_mul(res, op1, op2);
        }
        if (!result.empty())
            e << '\n';
    }
};


//**********************************************************************

class OpDivExpr : public CommonBinOpExpr
{
public:
    OpDivExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    void emit(Emit &e, const std::string &result)
    {
        char type= efirst->isinteger() && esecond->isinteger() ? REGint : REGvar;
        std::string res= result.empty() ? gentemp(type) : result;
        std::string op1= gentemp(type);
        std::string op2= gentemp(type);
        if (efirst->isinteger() && type != REGint) {
            std::string i1= gentemp(REGint);
            efirst->emit(e, i1);
            e << op_box(op1, i1);
        }
        else
            efirst->emit(e, op1);
        if (esecond->isinteger() && type != REGint) {
            std::string i2= gentemp(REGint);
            esecond->emit(e, i2);
            e << op_box(op2, i2) << '\n';
        }
        else
            esecond->emit(e, op2);
        if (result.empty())
            e << "new " << res << ", 'Integer'" << '\n';
        e << op_div(res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class OpModExpr : public CommonBinOpExpr
{
public:
    OpModExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    void emit(Emit &e, const std::string &result)
    {
        char type= efirst->isinteger() && esecond->isinteger() ? REGint : REGvar;
        std::string res= result.empty() ? gentemp(type) : result;
        std::string op1= gentemp(type);
        std::string op2= gentemp(type);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << op_mod(res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
};


//**********************************************************************

class OpCModExpr : public CommonBinOpExpr
{
public:
    OpCModExpr(BlockBase &block,
            Token t, BaseExpr *first, BaseExpr *second) :
        CommonBinOpExpr(block, t, first, second)
    {
    }
private:
    void emit(Emit &e, const std::string &result)
    {
        char type= efirst->isinteger() && esecond->isinteger() ? REGint : REGvar;
        std::string res= result.empty() ? gentemp(type) : result;
        std::string op1= gentemp(type);
        std::string op2= gentemp(type);
        efirst->emit(e, op1);
        esecond->emit(e, op2);
        e << op_cmod(res, op1, op2);
        if (!result.empty())
            e << '\n';
    }
};

//**********************************************************************

class ArrayExpr : public BaseExpr
{
public:
    ArrayExpr(BlockBase &block, Tokenizer &tk) :
            BaseExpr(block)
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
    BaseExpr *optimize()
    {
        for (size_t i= 0; i < elems.size(); ++i)
            optimize_branch(elems[i]);
        return this;
    }
    void emit(Emit &e, const std::string &result);
    std::vector<BaseExpr *> elems;
};

void ArrayExpr::emit(Emit &e, const std::string &result)
{
    std::string reg = gentemp(REGvar);
    e << reg << " = root_new ['parrot';'ResizablePMCArray']\n";
    for (size_t i= 0; i < elems.size(); ++i)
    {
        BaseExpr *elem= elems[i];
        std::string el = gentemp(REGvar);
        if (elem->issimple() && !elem->isidentifier())
        {
            e << el << " = box ";
            elem->emit(e, std::string());
            e << "\n"
                "push " << reg << " , " << el << '\n';
        }
        else
        {
            elem->emit(e, el);
            e << "push " << reg << " , " << el << '\n';
        }
    }

    if (!result.empty())
        e << result << " = " << reg << '\n';
}

//**********************************************************************

class HashExpr : public BaseExpr
{
public:
    HashExpr(BlockBase &block, Tokenizer &tk);
private:
    BaseExpr *optimize()
    {
        for (std::map<std::string, BaseExpr *>::iterator
            it= elems.begin();
            it != elems.end();
            ++it)
        {
            optimize_branch(it->second);
        }
        return this;
    }
    void emit(Emit &e, const std::string &result);
    std::map<std::string, BaseExpr *> elems;
};

HashExpr::HashExpr(BlockBase &block, Tokenizer &tk) :
    BaseExpr(block)
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
            BaseExpr *value= parseExpr(block, tk);
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
    void operator() (std::pair<std::string, BaseExpr *> elem)
    {
        BaseExpr *value= elem.second;
        std::string reg;
        if (value->isidentifier() )
        {
            std::string id= value->getidentifier();
            if (bl.checklocal(id))
                reg= id;
            else
            {
                reg = bl.gentemp(REGvar);
                (*e) << "get_hll_global " << reg << ", '" <<
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
        (*e) << r << " [" << elem.first << "] = " << reg << '\n';
    }
private:
    Emit *e;
    HashExpr &bl;
    std::string r;
};

void HashExpr::emit(Emit &e, const std::string &result)
{
    std::string reg = gentemp(REGvar);
    e << reg << " = root_new ['parrot';'Hash']\n";
    std::for_each(elems.begin(), elems.end(), EmitItem(e, *this, reg) );
    if (!result.empty())
        e << result << " = " << reg << '\n';
}

//**********************************************************************

class MemberExpr : public BaseExpr {
public:
    MemberExpr(BlockBase &block, Tokenizer &tk, Token t,
            BaseExpr *leftexpr) :
        BaseExpr(block),
        start(t),
        left(leftexpr),
        right(tk.get())
    {
        //std::cerr << "MemberExpr::MemberExpr\n";
        if (!right.isidentifier())
            throw Expected("identifier", right);
        //std::cerr << "MemberExpr::MemberExpr\n";
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string reg = gentemp(REGvar);
        std::string r = (result.empty() ||
                (result[0] == '$' && result.substr(0, 2) != "$P") ) ?
            gentemp(REGvar) : result;
        left->emit(e, reg);
        e.annotate(start);
        e << "getattribute " << r << ", " << reg <<
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
    void emitassign(Emit &e, BaseExpr& value, const std::string &to)
    {
        //std::cerr << typeid(right).name() << '\n';
        e.annotate(start);
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
        e << "setattribute " << reg << ", '" << right.identifier() <<
                "', " << regattrval << '\n';

        if (! to.empty())
            e << "set " << to << ", " << regattrval << '\n';
    }
private:
    Token start;
    BaseExpr *left;
    Token right;
};

//**********************************************************************

class FunctionCallExpr : public BaseExpr
{
public:
    FunctionCallExpr(BlockBase &block,
        Tokenizer &tk, const Token & st, BaseExpr *function);
    BaseExpr *optimize();
    bool isinteger() const;
    bool isstring() const;
private:
    const Token start;
    void emit(Emit &e, const std::string &result);
    BaseExpr *called;
    std::vector <BaseExpr *> args;
};

FunctionCallExpr::FunctionCallExpr(BlockBase &block,
        Tokenizer &tk, const Token & st, BaseExpr *function) :
    BaseExpr(block),
    start(st),
    called(function)
{
    //std::cerr << "FunctionCallExpr::FunctionCallExpr\n";

    Token t= tk.get();
    if (! t.isop (')') )
    {
        tk.unget(t);
        do
        {
            args.push_back(parseExpr(block, tk));
            t= tk.get();
        } while (t.isop(',') );
        RequireOp (')', t);
    }

    //std::cerr << "FunctionCallExpr::FunctionCallExpr end\n";
}

BaseExpr *FunctionCallExpr::optimize()
{
    //std::cerr << "FunctionCallExpr::optimize\n";
    for (size_t i= 0; i < args.size(); ++i)
        optimize_branch(args[i]);
    //std::cerr << "FunctionCallExpr::optimize end\n";
    return this;
}

bool FunctionCallExpr::isinteger() const
{
    if (called->isidentifier())
    {
        std::string name= called->getidentifier();
        if (const PredefFunction *predef=
                PredefFunction::find(name, args.size()))
        {
            return predef->resulttype() == REGint;
        }
    }
    return false;
}

bool FunctionCallExpr::isstring() const
{
    if (called->isidentifier())
    {
        std::string name= called->getidentifier();
        if (const PredefFunction *predef=
                PredefFunction::find(name, args.size()))
        {
            return predef->resulttype() == REGstring;
        }
    }
    return false;
}

void FunctionCallExpr::emit(Emit &e, const std::string &result)
{
    //std::cerr << "FunctionCallExpr::emit\n";

    if (called->isidentifier())
    {
        e.annotate(called->gettoken());
        std::string name= called->getidentifier();

    if (const PredefFunction *predef=
            PredefFunction::find(name, args.size()))
    {
        std::vector<std::string> argregs;
        for (size_t i= 0; i < args.size(); ++i)
        {
            BaseExpr &arg= * args[i];
            char paramtype= predef->paramtype(i);
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
                {
                    char type= arg.checkresult();
                    std::string reg= gentemp(type);
                    arg.emit(e, reg);
                    argregs.push_back(reg);
                }
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
        if (predef->resulttype())
        {
            std::string r;
            if (result.empty())
                r= gentemp(predef->resulttype());
            else
                r= result;
            predef->emit(e, r, argregs);
        }
        else
            predef->emit(e, std::string(), argregs);
        return;
    }
    }

    std::vector<std::string> argregs;
    for (size_t i= 0; i < args.size(); ++i)
    {
        BaseExpr &arg= * args[i];
        if (! arg.issimple() )
        {
            std::string reg= gentemp(arg.checkresult());
            arg.emit(e, reg);
            argregs.push_back(reg);
        }
        else
        {
            if (arg.isnull())
            {
                std::string reg= gentemp(REGvar);
                e << op_null(reg) << '\n';
                argregs.push_back(reg);
            }
            argregs.push_back(std::string());
        }
    }

    std::string reg;
    if (called->isidentifier())
    {
        std::string name= called->getidentifier();
        std::string quote(islocal(name) ? "" : "'");
        name = quote + name + quote;
        e.annotate(start);
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
            e.annotate(start);
            e << reg << " = " << mefun << ".'" << me->getmember() << "'(";
        }
        else
        {
            called->emit(e, reg);
            e.annotate(start);
            e << reg << '(';
        }
    }

    // Arguments

    for (size_t i= 0; i < args.size(); ++i)
    {
        if (i > 0)
            e << ", ";
        if (argregs[i].empty() )
        {
            args[i]->emit(e, std::string());
        }
        else
        {
            e << argregs[i];
        }
    }
    e << ')';

    if (! reg.empty() )
    {
        e << '\n';
        if (!result.empty() )
            e << result << " = " << reg << '\n';
    }
    else
    {
        if (!result.empty() )
            e << '\n';
    }
}

//**********************************************************************

class OpInstanceOf : public BaseExpr {
public:
    OpInstanceOf(BlockBase &block, Token t,
            BaseExpr *subexpr, Tokenizer &tk) :
        BaseExpr(block),
        start(t),
        obj(subexpr),
        checked(tk.get())
    {
    }
private:
    bool isinteger() const { return true; }
    BaseExpr *optimize()
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
            checkedval= "'" + checked.identifier() + "'";
        else
            throw CompileError("Unimplemented", checked);

        std::string reg= gentemp(REGvar);
        obj->emit(e, reg);
        e.annotate(start);

        if (result.empty() ) {
            std::string regcheck = gentemp(REGint);
            e << op_isa(regcheck, reg, checkedval) << '\n';
        }
        else
        {
            e << op_isa(result, reg, checkedval) << '\n';
        }
    }
    Token start;
    BaseExpr *obj;
    Token checked;
};

//**********************************************************************

class NewExpr : public BaseExpr
{
public:
    NewExpr(BlockBase &block, Tokenizer &tk, Token t);
private:
    BaseExpr *optimize();
    void emit(Emit &e, const std::string &result);
    unsigned int ln;
    ClassSpecifier *claspec;
    std::vector<BaseExpr *> init;
};

NewExpr::NewExpr(BlockBase &block, Tokenizer &tk, Token t) :
    BaseExpr(block),
    ln(t.linenum()),
    init(0)
{
    //std::cerr << "NewExpr::NewExpr\n";

    t= tk.get();

    claspec = parseClassSpecifier(t, tk, block);

    t= tk.get();

    if (t.isop('('))
    {
        t = tk.get();
        if (! t.isop(')') )
        {
            tk.unget(t);
            do {
                init.push_back(parseExpr(block, tk));
                t = tk.get();
            } while (t.isop(','));
            RequireOp(')', t);
        }
    }
    else
        tk.unget(t);

    //std::cerr << "NewExpr::NewExpr end\n";
}

BaseExpr *NewExpr::optimize()
{
    for (size_t i= 0; i < init.size(); ++i)
        optimize_branch(init[i]);
    return this;
}

void NewExpr::emit(Emit &e, const std::string &result)
{
    std::string reg;
    std::string regnew = result;
    size_t numinits = init.size();
    switch (numinits)
    {
    case 0:
        break;
    case 1:
        if (claspec->reftype() == CLASSSPECIFIER_id)
            regnew = gentemp(REGvar);
        else
        {
            reg = gentemp(REGvar);
            init[0]->emit(e, reg);
        }
        break;
    default:
        regnew = gentemp(REGvar);
        break;
    }

    
    if (! result.empty())
        e << regnew << " = ";

    e << "new ";
    claspec->emit(e);
    if (! result.empty())
    {
        if (! reg.empty())
            e << ", " << reg;
    }
    e << '\n';

    if (numinits > 1 ||
            (numinits > 0 && claspec->reftype() == CLASSSPECIFIER_id))
    {
        std::vector<std::string> regs;
        for (size_t i= 0; i < numinits; ++i)
        {
            std::string reg = gentemp(init[i]->checkresult());
            init[i]->emit(e, reg);
            regs.push_back(reg);
        }
        e << regnew << ".'" << claspec->basename() << "'(" << regs[0];
        for (size_t i= 1; i < numinits; ++i)
            e << ", " << regs[i];
        e << ")\n";
        e << op_set(result, regnew) << '\n';
    }
}

//**********************************************************************

class NewIndexedExpr : public BaseExpr
{
public:
    NewIndexedExpr(BlockBase &block, Tokenizer &tk, Token start) :
            BaseExpr(block)
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
    }
private:
    BaseExpr *optimize()
    {
        return this;
    }
    void emit(Emit &e, const std::string &result)
    {
        std::string sep;
        if (!hll.empty()) {
            e << "root_new " << result << ", [" << hll;
            sep = ";";
        }
        else {
            e << "new " << result << ", ";
            sep = "[";
        }
        for (std::vector<std::string>::iterator it = nskey.begin();
            it != nskey.end(); ++it)
        {
            e << sep << *it;
            sep = ";";
        }
        e << "]\n";
    }

    std::string hll;
    std::vector<std::string> nskey;
};

//**********************************************************************

BaseExpr *parseNew(BlockBase &block, Tokenizer &tk, Token start)
{
    Token t = tk.get();
    if (t.isop('['))
        return new NewIndexedExpr(block, tk, start);
    else {
        tk.unget(t);
        return new NewExpr(block, tk, start);
    }
}

//**********************************************************************

class IndexExpr : public BaseExpr
{
public:
    IndexExpr(BlockBase &block, Tokenizer &tk, Token tname);
private:
    bool isleft() const { return true; }
    bool isindex() const { return true; }
    BaseExpr *optimize();
    void emit(Emit &e, const std::string &result);
    void emitleft(Emit &e);
    void emitassign(Emit &e, BaseExpr& value, const std::string &to);
    std::string name;
    std::vector <BaseExpr *> arg;
};

IndexExpr::IndexExpr(BlockBase &block, Tokenizer &tk, Token tname) :
    BaseExpr(block),
    name(tname.identifier())
{
    Token t;
    do {
        BaseExpr *newarg = parseExpr(block, tk);
        arg.push_back(newarg);
    } while ((t= tk.get()).isop(','));
    RequireOp (']', t);
}

BaseExpr *IndexExpr::optimize()
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
            reg= gentemp(arg[i]->checkresult());
            arg[i]->emit(e, reg);
            argvalue[i]= reg;
        }
    }
    if (!result.empty() )
        e << result << " = ";
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

void IndexExpr::emitassign(Emit &e, BaseExpr& value, const std::string &to)
{
    std::string reg2;
    if (value.isnull()) {
        reg2= gentemp(REGvar);
        e << op_null(reg2) << '\n';
    }
    else
    {
        reg2= gentemp(value.checkresult());
        value.emit(e, reg2);
        e << '\n';
    }

    std::string reg;
    size_t nitems= arg.size();
    std::vector <std::string> argvalue(nitems);
    for (size_t i= 0; i < nitems; ++i)
    {
        if (! arg[i]->issimple() )
        {
            reg= gentemp(arg[i]->checkresult());
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
    e << "] = " << reg2 << '\n';

    if (!to.empty())
        e << "set " << to << ", " << reg2 << '\n';
}

//**********************************************************************

class OpConditionalExpr : public BaseExpr
{
public:
    OpConditionalExpr(BlockBase &block, const Token &start,
            BaseExpr *econd, BaseExpr *etrue, BaseExpr *efalse) :
        BaseExpr(block),
        condition(new Condition(block, econd)),
        exprtrue(etrue),
        exprfalse(efalse)
    {
    }
private:
    bool isinteger() const { return exprtrue->isinteger(); }
    bool isstring() const { return exprtrue->isstring(); }
    BaseExpr *optimize()
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
        e << "goto " << label_end << '\n';
        e << label_false << ":\n";
        exprfalse->emit(e, result);
        e << label_end << ":\n";
    }
    Condition *condition;
    BaseExpr *exprtrue;
    BaseExpr *exprfalse;
};

//**********************************************************************

BaseExpr * parseExpr_16(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_15(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_14(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_13(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_9(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_8(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_6(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_5(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_4(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_3(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_2(BlockBase &block, Tokenizer &tk);
BaseExpr * parseExpr_0(BlockBase &block, Tokenizer &tk);

BaseExpr * parseExpr_0(BlockBase &block, Tokenizer &tk)
{
    //std::cerr << "parseExpr_0\n";
    BaseExpr *subexpr= NULL;
    Token t= tk.get();

    if (t.isop('(') )
    {
        //std::cerr << "parseExpr_0 (\n";
        subexpr = parseExpr(block, tk);
        t= tk.get();
        //std::cerr << "parseExpr_0 )\n";
        RequireOp (')', t);
    }
    else if (t.isop('[') )
    {
        subexpr = new ArrayExpr(block, tk);
    }
    else if (t.isop('{') )
    {
        subexpr = new HashExpr(block, tk);
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

    //std::cerr << "parseExpr_0 end\n";
    return subexpr;
}

BaseExpr *parseExpr_2(BlockBase &block, Tokenizer &tk)
{
    //std::cerr << "parseExpr_2\n";

    BaseExpr *subexpr= parseExpr_0(block, tk);
    Token t;
    while ((t= tk.get()).isop('.') || t.isop('('))
    {
        if (t.isop('.'))
            subexpr= new MemberExpr(block, tk, t, subexpr);
        else
        {
            subexpr = new FunctionCallExpr(block, tk, t, subexpr);
        }
    }
    tk.unget(t);
    //std::cerr << "parseExpr_2 end\n";
    return subexpr;
}

BaseExpr *parseExpr_3(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_2(block, tk);
    Token t= tk.get();
    if (t.isop("++") )
        return new OpPostIncExpr(block, t, subexpr);
    else if (t.isop("--") )
        return new OpPostDecExpr(block, t, subexpr);
    else
    {
        tk.unget(t);
        return subexpr;
    }
}

BaseExpr * parseExpr_4(BlockBase &block, Tokenizer &tk)
{
    Token t= tk.get();
    if (t.isop('-') )
    {
        BaseExpr *subexpr= parseExpr_4(block, tk);
        return new OpUnaryMinusExpr(block, t, subexpr);
    }
    else if (t.isop('!') )
    {
        BaseExpr *subexpr= parseExpr_4(block, tk);
        return new OpNotExpr(block, t, subexpr);
    }
    else if (t.isop("++"))
    {
        BaseExpr *subexpr= parseExpr_4(block, tk);
        return new OpPreIncExpr(block, t, subexpr);
    }
    else if (t.isop("--"))
    {
        BaseExpr *subexpr= parseExpr_4(block, tk);
        return new OpPreDecExpr(block, t, subexpr);
    }
    else
    {
        tk.unget(t);
        return parseExpr_3(block, tk);
    }
}

BaseExpr * parseExpr_5(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_4(block, tk);
    Token t;
    while ((t= tk.get()).isop('*') || t.isop('/') || t.isop('%') || t.isop("%%"))
    {
        BaseExpr *subexpr2= parseExpr_4(block, tk);
        if (t.isop('*'))
            subexpr= new OpMulExpr(block, t, subexpr, subexpr2);
        else if (t.isop('/'))
            subexpr= new OpDivExpr(block, t, subexpr, subexpr2);
        else if (t.isop('%'))
            subexpr= new OpModExpr(block, t, subexpr, subexpr2);
        else
            subexpr= new OpCModExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

BaseExpr * parseExpr_6(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_5(block, tk);
    Token t;
    while ((t= tk.get()).isop('+') || t.isop('-'))
    {
        BaseExpr *subexpr2= parseExpr_5(block, tk);
        if (t.isop('+'))
            subexpr= new OpAddExpr(block, t, subexpr, subexpr2);
        else
            subexpr= new OpSubExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

BaseExpr * parseExpr_8(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_6(block, tk);
    Token t= tk.get();
    if (t.isop("=="))
    {
        BaseExpr *subexpr2= parseExpr_6(block, tk);
        subexpr= new OpEqualExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop("!="))
    {
        BaseExpr *subexpr2= parseExpr_6(block, tk);
        subexpr= new OpNotEqualExpr(block, t, subexpr, subexpr2);
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

BaseExpr * parseExpr_9(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_8(block, tk);
    Token t= tk.get();
    if (t.isop('<'))
    {
        BaseExpr *subexpr2= parseExpr_8(block, tk);
        subexpr= new OpLessExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop('>'))
    {
        BaseExpr *subexpr2= parseExpr_8(block, tk);
        subexpr= new OpGreaterExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop("<="))
    {
        BaseExpr *subexpr2= parseExpr_8(block, tk);
        subexpr= new OpLessEqualExpr(block, t, subexpr, subexpr2);
    }
    else if (t.isop(">="))
    {
        BaseExpr *subexpr2= parseExpr_8(block, tk);
        subexpr= new OpGreaterEqualExpr(block, t, subexpr, subexpr2);
    }
    else
    {
        tk.unget(t);
    }
    return subexpr;
}

BaseExpr * parseExpr_10(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_9(block, tk);
    Token t;
    while ((t= tk.get()).isop('&'))
    {
        BaseExpr *subexpr2= parseExpr_9(block, tk);
        subexpr= new OpBinAndExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

BaseExpr * parseExpr_12(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_10(block, tk);
    Token t;
    while ((t= tk.get()).isop('|'))
    {
        BaseExpr *subexpr2= parseExpr_10(block, tk);
        subexpr= new OpBinOrExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

BaseExpr * parseExpr_13(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_12(block, tk);
    Token t;
    while ((t= tk.get()).isop("&&"))
    {
        BaseExpr *subexpr2= parseExpr_12(block, tk);
        subexpr= new OpBoolAndExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

BaseExpr * parseExpr_14(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_13(block, tk);
    Token t;
    while ((t= tk.get()).isop("||"))
    {
        BaseExpr *subexpr2= parseExpr_13(block, tk);
        subexpr= new OpBoolOrExpr(block, t, subexpr, subexpr2);
    }
    tk.unget(t);
    return subexpr;
}

enum AssignOp { AssignOpNone,
    SimpleAssignOp, AssignToOp,
    AddAssignOp, SubAssignOp
};

AssignOp getAssignOp(const Token &t)
{
    if (t.isop('=')) return SimpleAssignOp;
    if (t.isop("=:")) return AssignToOp;
    if (t.isop("+=")) return AddAssignOp;
    if (t.isop("-=")) return SubAssignOp;
    return AssignOpNone;
}

BaseExpr * parseExpr_15(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_14(block, tk);
    Token t = tk.get();
    if (t.isop('?')) {
        BaseExpr *extrue = parseExpr_16(block, tk);
        ExpectOp(':', tk);
        BaseExpr *exfalse = parseExpr_16(block, tk);
        return new OpConditionalExpr(block, t, subexpr, extrue, exfalse);
    }
    else
    {
        tk.unget(t);
        return subexpr;
    }
}

BaseExpr * parseExpr_16(BlockBase &block, Tokenizer &tk)
{
    BaseExpr *subexpr= parseExpr_15(block, tk);
    Token t;
    AssignOp op;
    while ((op= getAssignOp(t= tk.get())) != AssignOpNone)
    {
        BaseExpr *subexpr2= parseExpr_16(block, tk);
        switch (op)
        {
        case SimpleAssignOp:
            subexpr= new OpAssignExpr(block, t, subexpr, subexpr2);
            break;
        case AssignToOp:
            subexpr= new OpAssignToExpr(block, t, subexpr, subexpr2);
            break;
        case AddAssignOp:
            subexpr= new OpAddToExpr(block, t, subexpr, subexpr2);
            break;
        case SubAssignOp:
            subexpr= new OpSubToExpr(block, t, subexpr, subexpr2);
            break;
        default: /* Must never happen */ ;
        }
    }
    tk.unget(t);
    return subexpr;
}

BaseExpr * parseExpr(BlockBase &block, Tokenizer &tk)
{
    return parseExpr_16(block, tk);
}

//**********************************************************************

ExprStatement::ExprStatement(Block &parentblock, Tokenizer &tk)
{
    //std::cerr << "ExprStatement\n";
    expr= parseExpr(parentblock, tk);
    ExpectOp(';', tk);
    //std::cerr << "ExprStatement end\n";
}

BaseStatement *ExprStatement::optimize ()
{
    optimize_branch(expr);
    return this;
}

void ExprStatement::emit (Emit &e)
{
    expr->emit(e, std::string());
    e << '\n';
}

//**********************************************************************

ValueStatement::ValueStatement(Block & block, const Token &st) :
    SubStatement (block),
    vtype(ValueSimple),
    esize(0),
    start(st)
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

    e.annotate(start);
    e << ".local " <<
        (vtype == ValueSimple ?
                (type == REGint ? "int" : (
                    type == REGfloat ? "num" : "string") ) :
                "pmc") <<
        ' ' << name << '\n';

    switch (vtype)
    {
    case ValueSimple:
        if (value.size() == 1)
        {
            char vtype= value[0]->checkresult();
            if (vtype == REGint || vtype == REGstring ||
                    (dynamic_cast<IndexExpr *>(value[0])))
                value[0]->emit(e, name);
            else
            {
                std::string reg= gentemp(REGvar);
                value[0]->emit(e, reg);
                e << op_set(name, reg) << '\n';
            }
        }
        break;
    case ValueArray:
        e << "root_new " << name << ", ['parrot';"
                "'Resizable" << arraytype << "Array' ]\n";
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
        e << "root_new " << name << ", ['parrot';"
                 "'Fixed" << arraytype << "Array' ]\n" <<
            name << " = ";
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
    RequireOp (';', t);
}

void IntStatement::emit (Emit &e)
{
    e.annotate(start);
    emit(e, name, REGint);
}

//**********************************************************************

FloatStatement::FloatStatement(Block &block,  const Token &st, Tokenizer &tk) :
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
        genlocal(name, REGfloat);
        if (t.isop('='))
        {
            value.push_back(parseExpr(block, tk));
            t= tk.get();
        }
    }
    RequireOp (';', t);
}

void FloatStatement::emit (Emit &e)
{
    e.annotate(start);
    emit(e, name, REGfloat);
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
    RequireOp (';', t);
}

void StringStatement::emit (Emit &e)
{
    e.annotate(start);
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
    e.annotate(start);
    e << ".local pmc " << name << '\n';
    if (value.size() == 1)
    {
        BaseExpr & v = *value[0];
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
                e << "box " << name << ", " << reg << '\n';
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

ConstStatement::ConstStatement(Block & block, const Token &st, Tokenizer &tk) :
    ValueStatement (block, st),
    value(0)
{
    Token t= tk.get();
    type = nativetype(t);

    switch (type) {
    case REGint:
    case REGstring:
        break;
    case REGfloat:
        throw SyntaxError("const float not allowed in stage 0", t);
    default:
        throw SyntaxError("Invalid const type", t);
    }

    t= tk.get();
    name= t.identifier();
    ExpectOp('=', tk);
    value= parseExpr(block, tk);
    t= tk.get();
    RequireOp (';', t);
}

BaseStatement *ConstStatement::optimize()
{
    optimize_branch(value);

    // Reusing the optimize phase as constant evaluation phase.
    // Maybe a separate phase will be added later.
    genconstant(name, type, value->gettoken());

    //std::cerr << "ConstStatement::optimize end\n";
    return this;
}

void ConstStatement::emit (Emit &e)
{
    //std::cerr << "ConstStatement::emit\n";
    if (! value->issimple() )
        throw Expected("constant expression", start);

    // Put a hint in the generated code.
    e.comment("Constant " + name + " evaluated at compile time");

    //std::cerr << "ConstStatement::emit end\n";
}

//**********************************************************************

UsingStatement::UsingStatement(Block &bl,
        const std::string &name, const NamespaceKey &nspace) :
    n(name), ns(nspace)
{
    bl.genlocal(n, REGvar);
}

void UsingStatement::emit (Emit &e)
{
    e << ".local pmc " << n << '\n';
    if (! ns.isroot() )
        e  << n <<
            " = get_hll_global " << ns.get_key() <<
            ", '" << n << "'\n";
    else
        e  << n <<
            " = get_hll_global '" << n << "'\n";
}

//**********************************************************************

ReturnStatement::ReturnStatement(Block & block, Tokenizer &tk) :
    SubStatement (block), values(0)
{
    Token t= tk.get();
    if (!t.isop(';'))
    {
        tk.unget(t);
        values= new ArgumentList(block, tk);
        ExpectOp(';', tk);
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
    e << ".return (";
    if (values)
        values->emit(e);
    e << " )\n";
}

//**********************************************************************

YieldStatement::YieldStatement(Block & block, Tokenizer &tk) :
    SubStatement (block), values(0)
{
    Token t= tk.get();
    if (! t.isop(';') )
    {
        tk.unget(t);
        values= new ArgumentList(block, tk);
        ExpectOp (';', tk);
    }
}

BaseStatement *YieldStatement::optimize()
{
    if (values)
        values->optimize();
    return this;
}

void YieldStatement::emit (Emit &e)
{
    if (values)
        values->prepare(e);
    e << ".yield (";
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
    //std::cerr << "CompoundStatement::emit\n";

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
    std::string container_ = genlocalregister(REGvar);
    if (container-> isstring() )
    {
        std::string value= gentemp(REGstring);
        container->emit(e, value);
        e.annotate(start);
        e << op_box(container_, value) << '\n';
    }
    else
        container->emit(e, container_);

    e.annotate(start);
    if (vartype != '\0')
        e << ".local " << nameoftype(vartype) << ' ' << varname << '\n';
    const std::string iter= "iter_" + varname;

    e << ".local pmc " << iter << "\n" <<
        iter << " = iter " << container_ << "\n" <<
        iter << " = 0\n" << // ITERATE_FROM_START
        continuelabel << ": # FOR IN\n" <<
        "unless " << iter << " goto " << breaklabel<< "\n"
        "shift " << varname << ", " << iter << '\n'
        ;
    st->emit(e);
    e << "goto " << continuelabel << '\n' <<
        breaklabel << ": # FOR IN END\n";
    freelocalregister(container_);
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
    std::string l_condition= (initializer && iteration) ?
        genlabel() :
        std::string();
    std::string breaklabel = genbreaklabel();
    if (initializer)
    {
        initializer->emit(e);
        if (!l_condition.empty())
            e << "goto " << l_condition << " # for condition\n";
    }
    e << continuelabel << ": # for iteration\n";
    if (iteration)
    {
        iteration->emit(e, std::string());
        e << '\n';
    }
    if (! l_condition.empty())
        e << l_condition << ": # for condition\n";
    if (condition)
    {
        char type= condition->checkresult();
        std::string reg= gentemp(type);
        condition->emit(e, reg);
        e << "unless " << reg << " goto " << breaklabel << " # for end\n";
    }
    e << "# for body\n";
    st->emit(e);
    e << "goto " << continuelabel << " # for iteration\n" <<
        breaklabel << ": # for end\n";
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

    if (excep->issimple() )
    {
        e << "throw ";
        excep->emit(e, std::string());
        e << '\n';
    }
    else
    {
        std::string reg= gentemp(REGvar);
        excep->emit(e, reg);
        e << "throw " << reg << '\n';
    }
}

//**********************************************************************

TryStatement::TryStatement(Block &block, const Token &st, Tokenizer &tk) :
    BlockStatement (block),
    start(st),
    stry(0), scatch(0)
{
    Token t= tk.get();
    if (t.isop('['))
    {
        modifiers.parse(*this, tk);
    }
    else
        tk.unget(t);
    stry = parseStatement (block, tk);
    t= tk.get();
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
    modifiers.optimize();
    optimize_branch(stry);
    optimize_branch(scatch);
    return this;
}

void TryStatement::emit (Emit &e)
{
    e.annotate(start);
    std::string label= genlabel();
    std::string handler = label + "_HANDLER";
    std::string pasthandler = label + "_PAST_HANDLER";
    std::string except = exname.empty() ?
        gentemp(REGvar) :
        exname;

    std::string reghandler= gentemp(REGvar);
    e << reghandler << " = new 'ExceptionHandler'\n"
        "set_addr " << reghandler << ", " << handler << '\n';
    static const char * const ehattrs[] = {
        "min_severity", "max_severity"
    };
    for (size_t i= 0; i < sizeof(ehattrs) / sizeof(ehattrs[0]); ++i)
        if (const Modifier *m= modifiers.getmodifier(ehattrs[i]))
        {
            if (m->numargs() != 1)
                throw CompileError("Wrong args");
            int n= m->getintegervalue(0);
            e << reghandler << ".'" << ehattrs[i] << "'(" << n << ")\n";
        }
    if (const Modifier *m= modifiers.getmodifier("handle_types"))
    {
        size_t n= m->numargs();
        e << reghandler << ".'handle_types'(";
        for (size_t i= 0; i < n; ++i)
        {
            int value= m->getintegervalue(i);
            if (i > 0) e << ",";
            e << value;
        }
        e << ")\n";
    }

    e << "push_eh " << reghandler << '\n';

    stry->emit(e);
    e <<
        "pop_eh\n"
        "goto " << pasthandler << '\n' <<
        handler << ":\n";
    if (!exname.empty() )
    {
        genlocal(exname, REGvar);
        e << ".local pmc " << exname << '\n';
    }
    e <<
        ".get_results(" << except << ")\n"
        "finalize " << except << "\n"
        "pop_eh\n"
        ;

    scatch->emit(e);
    e << pasthandler << ":\n";
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

Condition::Condition (BlockBase &block, BaseExpr *condexpr) :
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
        e.annotate(expr->gettoken());
    if (expr->isidentifier() && expr->isinteger())
        reg= expr->getidentifier();
    else
    {
        char type= expr->checkresult();
        reg = gentemp(type);
        expr->emit(e, reg);
        if (type == REGvar || type == REGstring)
        {
            std::string reg2= reg;
            reg= gentemp(REGint);
            std::string nocase= genlocallabel();
            e << reg << " = 0\n"
                "if_null " << reg2 << ", " << nocase << "\n"
                "unless " << reg2 << " goto " << nocase << "\n"
                "inc " << reg << '\n' <<
                nocase << ":\n";
        }
    }
    return reg;
}

void Condition::emit_if(Emit &e, const std::string &labeltrue)
{
    std::string reg;
    if (expr->issimple())
        e.annotate(expr->gettoken());
    std::string auxlabel;
    if (expr->isidentifier() && expr->isinteger()) {
        reg= expr->getidentifier();
    }
    else
    {
        char type= expr->checkresult();
        reg = gentemp(type);
        expr->emit(e, reg);
        if (type == REGvar || type == REGstring) {
            auxlabel = genlocallabel();
            e << "if_null " << reg << ", " << auxlabel << "\n";
        }
    }
    e << "if " << reg << " goto " << labeltrue << '\n';
    if (!auxlabel.empty())
        e << auxlabel << ":\n";
}

void Condition::emit_else(Emit &e, const std::string &labelfalse)
{
    std::string reg;
    if (expr->issimple())
        e.annotate(expr->gettoken());
    if (expr->isidentifier() && expr->isinteger()) {
        reg= expr->getidentifier();
    }
    else
    {
        char type= expr->checkresult();
        reg = gentemp(type);
        expr->emit(e, reg);
        if (type == REGvar || type == REGstring)
            e << "if_null " << reg << ", " << labelfalse << "\n";
    }
    e << "unless " << reg << " goto " << labelfalse << '\n';
}

//**********************************************************************

SwitchStatement::SwitchStatement(Block &block, Tokenizer &tk) :
    BreakableStatement (block),
    condition(0)
{
    ExpectOp ('(', tk);
    condition= parseExpr(*this, tk);
    ExpectOp(')', tk);
    ExpectOp('{', tk);

more:
    Token t= tk.get();
    if (t.iskeyword("case"))
    {
        //std::cerr << "case\n";
        BaseExpr *caseexpr= parseExpr(*this, tk);
        casevalue.push_back(caseexpr);
        //std::cerr << "/case\n";
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
    else if(t.isop('}'))
    {
        //std::cerr << "esac\n";
    }
    else throw Expected("case, default or block end", t);
}

BaseStatement *SwitchStatement::optimize()
{
    optimize_branch(condition);
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

void SwitchStatement::emit(Emit &e)
{
    e.comment("switch");
    char type = '\0';
    for (size_t i= 0; i < casevalue.size(); ++i)
    {
        BaseExpr &value= *casevalue[i];
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

    if (condition->checkresult() == type)
        condition->emit(e, reg);
    else
    {
        std::string r= gentemp(condition->checkresult());
        condition->emit(e, r);
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
        casevalue[i]->emit(e, value);
        e << "if " << reg << " == " << value <<
                " goto " << label << '\n';
    }
    e << "goto " << defaultlabel << '\n';

    for (size_t i= 0; i < casest.size(); ++i)
    {
        e << caselabel[i] << ": # case\n";
        std::vector<BaseStatement *> &cst= casest[i];
        for (size_t j= 0; j < cst.size(); ++j)
            cst[j]->emit(e);
    }

    e << defaultlabel << ": # default\n";
    for (size_t i= 0; i < defaultst.size(); ++i)
        defaultst[i]->emit(e);
    e << breaklabel << ":\n";
    e.comment("switch end");
}

//**********************************************************************

IfStatement::IfStatement(Block &block, Tokenizer &tk) :
    BlockStatement (block),
    condition(0),
    st(new EmptyStatement()),
    stelse(new EmptyStatement())
{
    //std::cerr << "if\n";
    condition= new Condition(*this, tk);
    st= parseStatement(block, tk);
    Token t= tk.get();
    if (t.iskeyword("else")) {
        //std::cerr << "if else\n";
        stelse= parseStatement(*this, tk);
    }
    else
    {
        tk.unget(t);
    }
    //std::cerr << "end if\n";
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
        e << "goto " << l_endif << '\n';
        e << l_else << ":\n";
        stelse->emit(e);
    }
    e << l_endif << ":\n";
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
    e << labelcontinue << ": # WHILE\n";
    std::string reg;
    if (! forever) {
        reg= condition->emit(e);
        e << '\n';
    }
    if (st->isempty()) {
        if (! forever)
            e << "if " << reg << ' ';
        e << "goto " << labelcontinue << '\n';
    }
    else {
        if (! forever)
            e << "unless " << reg << " goto " << labelend << '\n';
        st->emit(e);
        e << "goto " << labelcontinue << '\n' <<
            labelend << ": # END WHILE\n";
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

    e << labelstart << ": # DO\n";

    if (!st->isempty())
        st->emit(e);
    e << labelcontinue << ": # DO CONTINUE\n";
    if (! forever)
    {
        if (!oneshot)
            condition->emit_if(e, labelstart);
    }
    else
        e << "goto " << labelstart << '\n';
    e << labelend << ": # END DO\n";
}

//**********************************************************************

Function::Function(Tokenizer &tk, const Token &st,
        Block &parent,
        const NamespaceKey & ns_a, const std::string &funcname) :
    FunctionModifiers(parent, tk, ns_a),
    FunctionBlock(parent),
    start(st),
    ns(ns_a), name(funcname)
{
    Token t= tk.get();
    RequireOp('(', t);
    t= tk.get ();

    if (!t.isop(')'))
    {
        tk.unget(t);
        do
        {
            t= tk.get();
            char ctype= nativetype(t);
            if (ctype == '\0')
                ctype= REGvar;
            else
                t= tk.get();
            std::string name= t.identifier();
            t= tk.get();
            Modifiers modifiers;
            if (t.isop('['))
            {
                modifiers.parse(*this, tk);
                t= tk.get();
            }

            params.push_back(name);
            ParamInfo pi(ctype, modifiers);
            paraminfo [name]= pi;
            genlocal(name, ctype);
            
        } while (t.isop(','));
    }
    RequireOp(')', t);
    ExpectOp('{', tk);

    CompoundStatement *cbody = new CompoundStatement(*this, tk);
    tend= cbody->getend();
    body= cbody;
}

void Function::local(std::string name)
{
    loc.push_back(name);
}

bool Function::islocal(std::string name) const
{
    return std::find(loc.begin(), loc.end(), name) != loc.end() ||
        checklocal(name) ||
        std::find(params.begin(), params.end(), name) != params.end();
}

void Function::optimize()
{
    body= body->optimize();
}

void Function::emitparams (Emit &e)
{
    for (size_t i= 0; i < params.size(); ++i)
    {
        const std::string &param= params[i];
        const ParamInfo &info= paraminfo[param];
        e << ".param " << nameoftype(info.type()) << ' ' <<
                param;
        if (info.has_modifier("slurpy"))
            e << " :slurpy";
        if (info.has_modifier("optional"))
            e << " :optional";
        if (info.has_modifier("opt_flag"))
            e << " :opt_flag";
        e << '\n';
    }
    e << '\n';
}

void Function::emitbody (Emit &e)
{
    e.annotate(start);
    body->emit(e);
    e.annotate(tend);
}

void Function::emit (Emit &e)
{
    getnamespace().emit (e);

    e << "\n.sub '" << getname() << "'";
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
    e << "\n";

    emitparams(e);
    emitbody(e);

    e << "\n.end # " << getname() << "\n\n";

    //std::cerr << "Temporary used: " <<  tempsused() << '\n';
}

//**********************************************************************

class NamespaceBlock;

class NamespaceBlockBase : public Block
{
public:
    NamespaceBlockBase () :
        subblocks(0)
    { }
    void addconstant(ConstStatement *cst)
    {
        constants.push_back(cst);
    }
    void addnamespace(NamespaceBlock *ns)
    {
        namespaces.push_back(ns);
    }
    void addclass(Class *cl)
    {
        classes.push_back(cl);
    }
    void optimize()
    {
        //std::cerr << "NamespaceBlockBase::optimize\n";

        for (size_t i= 0; i < constants.size(); ++i)
            constants[i]->optimize();
    }
    void emit (Emit &e) const
    {
        emit_group(constants, e);
    }
    virtual NamespaceBlockBase *getparent () { return 0; }
    Class *findclass_base(const ClassKey &classkey);
    virtual Class *findclass(const ClassKey &classkey) = 0;
private:
    std::string genlocallabel()
    { throw InternalError("No Namespace labels"); }
    std::string getnamedlabel(const std::string&)
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

    std::vector <ConstStatement *> constants;
    std::vector <NamespaceBlock *> namespaces;
    std::vector <Class *> classes;
};

class RootNamespaceBlock : public NamespaceBlockBase
{
    char checkconstant(const std::string &name) const
    {
        char result = NamespaceBlockBase::checkconstant(name);
        if (result == '\0') {
            if (name == "true" || name == "false")
                result = REGint;
            else if (name == "__STAGE__")
                result = REGstring;
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
                    Token(TokenTSingleQuoted, "0", 0, "__predefconst__"));
        }
        else throw InternalError("No such constant");
    }
    Class *findclass(const ClassKey &classkey);
};

class NamespaceBlock : public NamespaceBlockBase
{
public:
    NamespaceBlock(const std::string &name, NamespaceBlockBase &parentns) :
        nsname(name),
        parentnbb(parentns),
        parent(parentns)
    {
    }
    const std::string &getname() const { return nsname; }
    char checkconstant(const std::string &name) const
    {
        char c= Block::checkconstant(name);
        if (c == '\0')
            c= parentnbb.checkconstant(name);
        return c;
    }
    ConstantValue getconstant(const std::string &name) const
    {
        if (Block::checkconstant(name))
            return Block::getconstant(name);
        else
            return parentnbb.getconstant(name);
    }
    NamespaceBlockBase *getparent () { return &parentnbb; }
    Class *findclass(const ClassKey &classkey);
private:
    const std::string nsname;
    NamespaceBlockBase &parentnbb;
    Block &parent;
};

//**********************************************************************

class Class : public SubBlock
{
public:
    Class(NamespaceBlockBase &ns_b, Tokenizer &tk, NamespaceKey &ns_a);
    const std::string &getname() const { return name; }
    void emit (Emit &e);
    std::vector <Token> attributes() const { return attrs; }
    void optimize();
    const NamespaceKey &getkey() const;
private:
    unsigned int subblocks;
    unsigned int blockid()
    {
        return ++subblocks;
    }

    std::string genlocallabel() { throw InternalError("No Class labels"); }
    std::string getnamedlabel(const std::string&) { throw InternalError("No Class labels"); }
    std::string genlocalregister(char) { throw InternalError("No Class registers"); }

    Token start;
    std::string name;
    NamespaceKey ns;
    std::vector <ClassSpecifier *> parents;
    std::vector <Function *> functions;
    std::vector <Token> attrs;
    std::vector <ConstStatement *> constants;
};

//**********************************************************************

Class *NamespaceBlockBase::findclass_base(const ClassKey &classkey)
{
    const std::string &name = classkey[0];
    if (classkey.size() == 1)
    {
        for (size_t i = 0; i < classes.size(); ++i)
            if (classes[i]->getname() == name)
                return classes[i];
        return 0;
    }
    else
    {
        for (size_t i = 0; i < namespaces.size(); ++i)
            if (namespaces[i]->getname() == name)
            {
                std::vector<std::string> localkey(++classkey.begin(), classkey.end());
                Class *result = namespaces[i]->findclass(localkey);
                if (result)
                    return result;
            }
        return 0;
    }
}

Class *RootNamespaceBlock::findclass(const ClassKey &classkey)
{
    return findclass_base(classkey);
}

Class *NamespaceBlock::findclass(const ClassKey &classkey)
{
    Class *cl = findclass_base(classkey);
    if (! cl)
        cl = parentnbb.findclass(classkey);
    return cl;
}

//**********************************************************************

class Method : public Function
{
public:
    Method(Tokenizer &tk, const Token &st,
            Block &parent,
            const NamespaceKey & ns_a,
            Class &cl,
            const std::string &name) :
        Function(tk, st, parent, ns_a, name),
        myclass(cl)
    {
        genlocal("self", REGvar);
    }
    void emit (Emit &e)
    {
        getnamespace().emit (e);

        e << "\n.sub '" << getname() << "'";

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
    const Class &myclass;
};

//**********************************************************************

class ClassSpecifierStr : public ClassSpecifier
{
public:
    ClassSpecifierStr(const Token &t) :
        ClassSpecifier(t),
        name(t.pirliteralstring())
    {
    }
    ClassSpecifierType reftype() const { return CLASSSPECIFIER_str; }
private:
    void emit(Emit &e)
    {
        e << "[ " << name << " ]";
    }
    std::string basename() const { return name; }
    std::string name;
};


class ClassSpecifierParrotKey : public ClassSpecifier
{
public:
    ClassSpecifierParrotKey(const Token &start, Tokenizer &tk) :
        ClassSpecifier(start)
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
    ClassSpecifierId(const Token &start, Tokenizer &tk, BlockBase &owner) :
        ClassSpecifier(start),
        bl(owner)
    {
        id.push_back(start.identifier());
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
        Class *cl = bl.findclass(id);
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
    if (start.isliteralstring())
        return new ClassSpecifierStr(start);
    else if (start.isidentifier ())
        return new ClassSpecifierId(start, tk, owner);
    else if (start.isop('['))
        return new ClassSpecifierParrotKey(start, tk);
    else
        throw Expected("parent class", start);
}

//**********************************************************************

Class::Class(NamespaceBlockBase &ns_b, Tokenizer &tk, NamespaceKey &ns_a) :
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

    ns= NamespaceKey(ns_a, name);
    while (! (t= tk.get()).isop('}'))
    {
        if (t.iskeyword("function"))
        {
            Token name= tk.get();
            if (! name.isidentifier() )
                throw Expected("method name", name);
            Function *f = new Method (tk, t, *this, ns, *this, name.identifier());
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
            ConstStatement *cst= new ConstStatement(*this, t, tk);
            constants.push_back(cst);
        }
        else
            throw Expected ("'function' or '}'", t);
    }
}

const NamespaceKey &Class::getkey() const
{
    return ns;
}

void Class::optimize()
{
    for (size_t i= 0; i < constants.size(); ++i)
        constants[i]->optimize();
    for (size_t i= 0; i < functions.size(); ++i)
        functions[i]->optimize();
}

void Class::emit (Emit &e)
{
    ns.emit (e);

    emit_group(constants, e);

    e << ".sub Winxed_class_init :anon :load :init\n";
    e.annotate(start);
    e << "$P0 = newclass " << ns.get_key() << "\n";

    for (size_t i= 0; i < parents.size(); ++i)
    {
        ClassSpecifier & parent= *parents[i];
        parent.annotate(e);
        std::ostringstream oss;
        oss << "$P" << i + 1;
        std::string p= oss.str();
        e << p << " = get_class ";
        parent.emit(e);
        e << "\n"
            "addparent $P0, " << p << "\n";
    }
    for (size_t i= 0; i < attrs.size(); ++i)
    {
        const Token &attrname= attrs[i];
        e.annotate(attrname);
        e << "addattribute $P0, '" << attrname.identifier() << "'\n";
    }

    e << ".end\n";

    emit_group(functions, e);
}

//**********************************************************************

class Winxed
{
public:
    Winxed() :
        cur_nsblock(&root_ns)
    {
        namespaces.push_back(cur_nsblock);
    }
    void parse (Tokenizer &tk);
    void optimize ();
    void emit (Emit &e);
private:
    RootNamespaceBlock root_ns;
    NamespaceBlockBase *cur_nsblock;
    NamespaceKey cur_namespace;
    std::vector <NamespaceBlockBase *> namespaces;
    std::vector <Class *> classes;
    std::vector <Function *> functions;
    std::vector <std::string> loads;
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

        if (t.iskeyword("namespace"))
        {
            t = tk.get();
            std::string nsname = t.identifier();
            cur_namespace= NamespaceKey(cur_namespace, nsname);
            NamespaceBlock *new_ns = new NamespaceBlock(nsname, *cur_nsblock);
            cur_nsblock->addnamespace(new_ns);
            cur_nsblock = new_ns;
            namespaces.push_back(cur_nsblock);
            ExpectOp('{', tk);
        }
        else if (t.iskeyword("const"))
        {
            ConstStatement *cst= new ConstStatement(*cur_nsblock, t, tk);
            cur_nsblock->addconstant(cst);
        }
        else if (t.iskeyword("class"))
        {
            Class *c = new Class (*cur_nsblock, tk, cur_namespace);
            classes.push_back(c);
            cur_nsblock->addclass(c);
        }
        else if (t.iskeyword("function"))
        {
            Token fname = tk.get();
            if (! fname.isidentifier() )
                throw Expected("function name", fname);
            Function *f = new Function (tk, t, *cur_nsblock, cur_namespace, fname.identifier());
            functions.push_back(f);
        }
        else if (t.iskeyword("$load"))
        {
            Token loadname = tk.get();
            if (! loadname.isliteralstring() )
                throw Expected("filename", loadname);
            ExpectOp(';', tk);
            loads.push_back(loadname.str());
        }
        else if (t.isop('}'))
        {
            if (cur_namespace.isroot())
                throw SyntaxError("Unexpected '}'", t);
            cur_namespace= cur_namespace.parent();
            cur_nsblock= cur_nsblock->getparent();
        }
        else
            throw SyntaxError("Unexpected statement", t);
    }
}

void Winxed::optimize()
{
    //std::cerr << "Winxed::optimize\n";

    root_ns.genconstant("null", 'n', Token(TokenTIdentifier, "null", 0, "(predef"));

    for (size_t i= 0; i < namespaces.size(); ++i)
        namespaces[i]->optimize();
    for (size_t i= 0; i < classes.size(); ++i)
        classes[i]->optimize();
    for (size_t i= 0; i < functions.size(); ++i)
        functions[i]->optimize();

    //std::cerr << "Winxed::optimize end\n";
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

    for (size_t i = 0; i < loads.size(); ++i)
        e << "  load_bytecode '" << loads[i] << "'\n";

    e <<
        ".end\n";
    e.comment("End of initializations");
    e << "\n\n";

    emit_group(namespaces, e);
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
    bool compileonly= true;
    bool noan= false;

    int i;
    for (i = 1; i < argc; ++i)
    {
        if (strcmp(argv[i], "-o") == 0)
        {
            outputname= argv[++i];
        }
        else if (strcmp(argv[i], "-c") == 0)
            compileonly= true;
        else if (strcmp(argv[i], "-e") == 0)
            expr = argv[++i];
        else if (strcmp(argv[i], "--noan") == 0)
            noan= true;
        else break;
    }

    std::istream *input;
    std::ifstream inputfile;
    std::istringstream inputstring;

    if (! expr.empty() )
    {
        expr = "function main(argv) {" + expr + ";}\n";
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

    Winxed winxed;
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
         std::cerr << e.what() << '\n';
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
