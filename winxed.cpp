// winxed.cpp
// Revision 27-oct-2009

#include "token.h"
#include "errors.h"
#include "predef.h"

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
#include <unistd.h>
#include <sys/wait.h>

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

class Namespace
{
public:
	bool isroot() const;
	Namespace child(std::string name) const;
	Namespace parent() const;
	std::string get_key() const;
	void emit (std::ostream & os) const;
private:
	std::vector <std::string> key;
};

bool Namespace::isroot() const
{
	return key.empty();
}

Namespace Namespace::child(std::string name) const
{
	Namespace newchild;
	newchild.key= key;
	newchild.key.push_back(name);
	return newchild;
}

Namespace Namespace::parent() const
{
	Namespace newparent;
	newparent.key= key;
	newparent.key.pop_back();
	return newparent;
}

std::string Namespace::get_key() const
{
	std::string r;
	r= "[ ";
	for (size_t i= 0; i < key.size(); ++i)
	{
		if (i > 0)
			r+= "; ";
		r+= '\'' + key [i] + '\'';
	}
	r+= " ]";
	return r;
}

void Namespace::emit (std::ostream & os) const
{
	os << ".namespace " << get_key() << '\n';
}

//**********************************************************************

class BlockBase
{
protected:
	virtual char checklocal(const std::string &name) = 0;
public:
	virtual std::string genlocalregister(char type) = 0;
	virtual ~BlockBase() { }
};

class Block : public BlockBase
{
public:
	Block();
	virtual unsigned int blockid() = 0;
	std::string genregister(char type);
	void genlocal(const std::string &name, char type);
	char checklocal(const std::string &name);
	std::string genlabel();
	std::string gennamedlabel(const std::string &name);
	virtual std::string getnamedlabel(const std::string &name) = 0;
protected:
	typedef std::map<std::string, std::string> NamedLabels;
	std::string findlabel(const std::string &name);
	typedef std::map<std::string, char> Locals;
	Locals locals;
private:
	virtual std::string genlocallabel() = 0;
	NamedLabels namedlabels;
};

class InBlock : public BlockBase
{
protected:
	InBlock(Block &block) : bl(block) { };
public:
	char checklocal(const std::string &name) { return bl.checklocal(name); }
	std::string genlocalregister(char type) { return bl.genlocalregister(type); }
private:
	Block &bl;
};

Block::Block()
{ }

void Block::genlocal(const std::string &name, char type)
{
	locals[name]= type;
}

char Block::checklocal(const std::string &name)
{
	Locals::iterator it= locals.find(name);
	if (it != locals.end() )
		return it->second;
	else
		return '\0';
}

std::string Block::genregister(char type)
{
	return genlocalregister(type);
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

class FunctionBlock : public Block
{
public:
	FunctionBlock();
public:
	std::string genlocallabel();
	std::string genlocalregister(char type);
private:
	unsigned int blockid();
	std::string getnamedlabel(const std::string &name);

	unsigned int subblocks;
	unsigned int nreg;
	unsigned int nlabel;
};

FunctionBlock::FunctionBlock() :
	subblocks(0), nreg(0), nlabel(0)
{
}

unsigned int FunctionBlock::blockid()
{
	return ++subblocks;
}

std::string FunctionBlock::genlocalregister(char type)
{
	std::ostringstream l;
	l << '$' << type << ++nreg;
	return l.str();
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

class SubBlock : public Block
{
public:
	SubBlock(Block &parentblock);
private:
	unsigned int blockid();
	std::string genlocalregister(char type);
	char checklocal(const std::string &name);
	std::string genlocallabel();
	std::string getnamedlabel(const std::string &name);

	Block &parent;
	unsigned int id;
	unsigned int nlabel;
};

SubBlock::SubBlock(Block &parentblock) :
	parent(parentblock),
	id(parent.blockid()),
	nlabel(0)
{
}

unsigned int SubBlock::blockid()
{
	return parent.blockid();
}

std::string SubBlock::genlocalregister(char type)
{
	return parent.genlocalregister(type);
}

char SubBlock::checklocal(const std::string &name)
{
	if (char c= Block::checklocal(name))
		return c;
	else
		return parent.checklocal(name);
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

class Function;

//**********************************************************************

class BaseStatement
{
public:
	BaseStatement(Function &fn) : function (&fn) { }
	virtual bool isempty() { return false; }
	virtual void emit (std::ostream & os) = 0;
	virtual BaseStatement *optimize() { return this; }
	virtual ~BaseStatement() { };
protected:
	Function *function;
};

//**********************************************************************

class SubStatement : public BaseStatement
{
public:
	SubStatement(Function &fn, Block &block);
protected:
	Block &bl;
};

SubStatement::SubStatement(Function &fn, Block &block) :
	BaseStatement (fn),
	bl(block)
{
}

//**********************************************************************

class EmptyStatement : public BaseStatement
{
public:
	EmptyStatement(Function &fn) : BaseStatement(fn) { }
private:
	bool isempty() { return true; }
	void emit (std::ostream &) { };
};

//**********************************************************************

class BlockStatement : public BaseStatement, public SubBlock
{
public:
	BlockStatement (Function &fn, Block &parentblock);
};

BlockStatement::BlockStatement (Function &fn, Block &parentblock) :
	BaseStatement(fn),
	SubBlock(parentblock)
{
}

//**********************************************************************

class UsingStatement : public BaseStatement
{
public:
	UsingStatement(Function &fn, const std::string & name, const Namespace &nspace);
private:
	void emit (std::ostream & os);

	std::string n;
	Namespace ns;
};

//**********************************************************************

class ExternStatement : public BaseStatement
{
public:
	ExternStatement(Function &fn, Tokenizer &tk);
private:
	void emit (std::ostream & os);

	std::string n;
};

ExternStatement::ExternStatement(Function &fn, Tokenizer &tk) :
	BaseStatement (fn)
{
	Token t;
	do {
		t= tk.get();
		if (!n.empty() )
			n+= '/';
		n+= t.str();
		t= tk.get();
	} while (t.isop('.') );
	RequireOp(';', t);
}

void ExternStatement::emit (std::ostream & os)
{
	os << "load_bytecode '" << n << ".pbc'\n";
}

//**********************************************************************

class BaseExpr : public InBlock
{
public:
	BaseExpr(Function &fn, Block &block) : InBlock(block), function(&fn) { }
	BaseExpr(Function &fn, InBlock &block) : InBlock(block), function(&fn) { }
	virtual BaseExpr *optimize();
	virtual void emit(std::ostream &os, const std::string &result) = 0;
	virtual bool issimple() const { return false; }
	virtual bool isidentifier() const { return false; }
	virtual std::string getidentifier() const
	{ throw InternalError("Not an identifier"); }
	virtual bool isliteralinteger() const { return false; }
	virtual bool isinteger() const { return false; }
	virtual int getintegervalue () const
	{ throw InternalError("Not an integer"); }
	virtual bool isliteralstring() const { return false; }
	virtual bool isstring() const { return false; }
	char checkresult() const;
protected:
	Function *function;
};

BaseExpr * parseExpr(Function &fn, Block &block, Tokenizer &tk);

//**********************************************************************

class ArgumentList : public InBlock
{
public:
	ArgumentList(Function &fn, Block &block, Tokenizer &tk);
	void prepare(std::ostream &os);
	void emit(std::ostream &os);
private:
	Function *function;
	std::vector <BaseExpr *> args;
	std::vector <std::string> argregs;
};

//**********************************************************************

class ExprStatement : public BaseStatement
{
public:
	ExprStatement(Function &fn, Block &parentblock, Tokenizer &tk);
private:
	BaseStatement *optimize();
	void emit (std::ostream & os);

	BaseExpr *expr;
};

//**********************************************************************

class CompoundStatement : public BlockStatement
{
public:
	CompoundStatement(Function &fn, Block &parentblock, Tokenizer &tk);
	BaseStatement *optimize();
	void emit (std::ostream & os);
private:
	std::vector <BaseStatement *> subst;
};

//**********************************************************************

class ValueStatement : public SubStatement
{
public:
	ValueStatement(Function &fn, Block & block);
protected:
	BaseExpr *value;
private:
	BaseStatement *optimize();
};

//**********************************************************************

class IntStatement : public ValueStatement
{
public:
	IntStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (std::ostream & os);
private:
	std::string name;
};

//**********************************************************************

class StringStatement : public ValueStatement
{
public:
	StringStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (std::ostream & os);
private:
	std::string name;
};

//**********************************************************************

class VarStatement : public ValueStatement
{
public:
	VarStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (std::ostream & os);
private:
	std::string name;
};

//**********************************************************************

class LabelStatement: public SubStatement
{
public:
	LabelStatement(Function &fn, Block &block, const std::string &name);
	void emit (std::ostream & os);
private:
	std::string labelname;
	std::string codename;
};

class GotoStatement: public SubStatement
{
public:
	GotoStatement(Function &fn, Block &block, Tokenizer &tk, Token startpos);
	void emit (std::ostream & os);
private:
	Token start;
	Block &bl;
	std::string labelname;
};

//**********************************************************************

class ReturnStatement : public SubStatement
{
public:
	ReturnStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (std::ostream & os);
private:
	ArgumentList *values;
};

//**********************************************************************

class YieldStatement : public SubStatement
{
public:
	YieldStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (std::ostream & os);
private:
	ArgumentList *values;
};

//**********************************************************************

class AssignStatement : public SubStatement
{
public:
	AssignStatement(Function &fn, Block & block,
		Tokenizer &tk, const std::string &name);
	void emit (std::ostream & os);
private:
	std::string varname;
	std::string content;
	BaseExpr *st;
};

//**********************************************************************

class Condition;

//**********************************************************************

class IfStatement : public BlockStatement
{
public:
	IfStatement(Function &fn, Block &block, Tokenizer &tk);
private:
	BaseStatement *optimize();
	void emit (std::ostream & os);
	Condition *condition;
	BaseStatement *st;
	BaseStatement *stelse;
};

//**********************************************************************

class ForeverStatement : public BlockStatement
{
public:
	ForeverStatement(Function &fn, Block &block, BaseStatement *body);
private:
	BaseStatement *optimize();
	void emit (std::ostream & os);
	BaseStatement *st;
};

//**********************************************************************

class WhileStatement : public BlockStatement
{
public:
	WhileStatement(Function &fn, Block &block, Tokenizer &tk);
private:
	BaseStatement *optimize();
	void emit (std::ostream & os);
	Condition *condition;
	BaseStatement *st;
};

//**********************************************************************

class ForStatement : public BlockStatement
{
public:
	ForStatement(Function &fn, Block &block, Tokenizer &tk);
private:
	void emit (std::ostream & os);
	std::string varname;
	BaseExpr * container;
	BaseStatement *st;
};

//**********************************************************************

class ThrowStatement : public SubStatement
{
public:
	ThrowStatement(Function &fn, Block &block, Tokenizer &tk, Token t);
private:
	void emit (std::ostream & os);
	Token pos;
	BaseExpr * excep;
};

//**********************************************************************

class TryStatement : public BlockStatement
{
public:
	TryStatement(Function &fn, Block &block, Tokenizer &tk, Token t);
private:
	void emit (std::ostream & os);
	unsigned int ln;
	BaseStatement *stry;
	BaseStatement *scatch;
	std::string exname;
};

//**********************************************************************

class Function : public FunctionBlock
{
public:
	Function(Tokenizer &tk,
		const Namespace & ns_a, const std::string &funcname);
	std::string getname() const { return name; }
	Namespace getnamespace() const { return ns; }
	void optimize();
	virtual void emit (std::ostream & os);
	void local(std::string name);
	bool islocal(std::string name);
	virtual void emitbody (std::ostream & os);
	virtual ~Function() {}
private:
	const Namespace ns;
	Token start;
	const std::string name;
	std::vector <std::string> params;
	std::vector <char> paramtypes;
	std::vector <std::string> loc;
	BaseStatement *body;
};

//**********************************************************************

BaseStatement *parseUsing(Function &fn, Tokenizer &tk)
{
	Token t= tk.get();
	if (t.str() == "extern")
	{
		return new ExternStatement(fn, tk);
	}
	else
	{
		Namespace ns;
		std::string name = t.str();
		while ((t= tk.get()).isop('.') )
		{
			ns = ns.child(name);
			t= tk.get();
			name = t.str();
		}
		RequireOp(';', t);
		return new UsingStatement(fn, name, ns);
	}
}

BaseStatement *parseStatement(Function &fn, Block &block, Tokenizer &tk)
{
	Token t= tk.get();
	while (t.isspace() )
		t= tk.get();

	if (t.isop(';'))
		return new EmptyStatement(fn);
	if (t.isop('{') )
		return new CompoundStatement(fn, block, tk);
	if (t.str() == "using")
		return parseUsing(fn, tk);

	if (t.str() == "int")
		return new IntStatement(fn, block, tk);
	if (t.str() == "string")
		return new StringStatement(fn, block, tk);
	if (t.str() == "var")
		return new VarStatement(fn, block, tk);

	if (t.str() == "return")
		return new ReturnStatement(fn, block, tk);
	if (t.str() == "yield")
		return new YieldStatement(fn, block, tk);
	if (t.str() == "goto")
		return new GotoStatement(fn, block, tk, t);
	if (t.str() == "if")
		return new IfStatement(fn, block, tk);
	if (t.str() == "while")
		return new WhileStatement(fn, block, tk);
	if (t.str() == "for")
		return new ForStatement(fn, block, tk);
	if (t.str() == "throw")
		return new ThrowStatement(fn, block, tk, t);
	if (t.str() == "try")
		return new TryStatement(fn, block, tk, t);

	if (t.isidentifier() )
	{
		Token t2= tk.get();
		if (t2.str() == "=")
		{
			std::string varname= t.str();
			if (fn.islocal(varname))
			{
				return new AssignStatement(fn, block, tk, varname);
			}
		}
		else if (t2.str() == ":")
			return new LabelStatement(fn, block, t.str());
		else
		{
			tk.unget(t2);
			tk.unget(t);
			return new ExprStatement(fn, block, tk);
		}
	}
	tk.unget(t);
	return new ExprStatement(fn, block, tk);
}

//**********************************************************************

LabelStatement::LabelStatement(Function &fn, Block &block, const std::string &name) :
	SubStatement(fn, block),
	labelname(name),
	codename(block.gennamedlabel(name))
{
}

void LabelStatement::emit (std::ostream & os)
{
	os << codename << ":"
		" # " << labelname << '\n';
}

//**********************************************************************

GotoStatement::GotoStatement(Function &fn, Block &block, Tokenizer &tk, Token startpos) :
	SubStatement(fn, block),
	start(startpos),
	bl(block)
{
	Token t= tk.get();
	labelname= t.str();
	t= tk.get();
	if (t.str() != ";")
		throw Expected ("';' after label", t);
}

void GotoStatement::emit (std::ostream & os)
{
	os <<
		".annotate 'file', '" << start.file() << "'\n"
		".annotate 'line', " << start.linenum() << "\n"
		"goto " << bl.getnamedlabel(labelname) <<
		" # " << labelname << '\n';
}

//**********************************************************************

char BaseExpr::checkresult() const
{
	if (isinteger() ) return 'I';
	else if (isstring() ) return 'S';
	else return 'P';
}

BaseExpr *BaseExpr::optimize()
{
	return this;
}

//**********************************************************************

ArgumentList::ArgumentList(Function &fn, Block &block, Tokenizer &tk) :
	InBlock(block),
	function(& fn)
{
	Token t;
	do
	{
		BaseExpr *arg= parseExpr(fn, block, tk);
		args.push_back(arg);
		t= tk.get();
	} while (t.isop(',') );
	tk.unget(t);
}

void ArgumentList::prepare(std::ostream &os)
{
	for (size_t i= 0; i < args.size(); ++i)
		args[i]= args[i]->optimize();
	for (size_t i= 0; i < args.size(); ++i)
	{
		if (! args[i]->issimple() )
		{
			std::string reg= genlocalregister('P');
			args[i]->emit(os, reg);
			argregs.push_back(reg);
		}
		else
		{
			argregs.push_back(std::string());
		}
	}
}

void ArgumentList::emit(std::ostream &os)
{
	for (size_t i= 0; i < args.size(); ++i)
	{
		if (i > 0)
			os << ", ";
		if (argregs[i].empty() )
			args[i]->emit(os, std::string() );
		else
			os << argregs[i];
	}
}

//**********************************************************************

class SimpleExpr : public BaseExpr
{
public:
	SimpleExpr(Function &fn, Block &block, Token token) :
		BaseExpr(fn, block), t(token)
	{ }
	SimpleExpr(Function &fn, InBlock &block, Token token) :
		BaseExpr(fn, block), t(token)
	{ }
	void emit(std::ostream &os, const std::string &result);
	bool issimple() const { return true; }
	bool isidentifier() const;
	std::string getidentifier() const;
	bool isliteralinteger() const;
	bool isinteger() const;
	int getintegervalue () const;
	bool isliteralstring() const;
	bool isstring() const;
	bool issinglequoted() const;
	Token get() const;
	std::string value() const;
private:
	Token t;
};

void SimpleExpr::emit(std::ostream &os, const std::string &result)
{
	if (!result.empty() )
		os << result << " = ";
	if (isliteralstring())
	{
		if (issinglequoted())
			os << '\'' << t.str() << '\'';
		else
			os << unquote(t.str());
	}
	else
		os << t.str();
	if (!result.empty() )
		os << '\n';
}

bool SimpleExpr::isidentifier() const
{
	return t.isidentifier();
}

std::string SimpleExpr::getidentifier() const
{
	if (! isidentifier())
		throw InternalError("Not an identifier");
	return t.str();
}

bool SimpleExpr::isliteralinteger() const
{
	return t.isinteger();
}

bool SimpleExpr::isinteger() const
{
	if (isliteralinteger())
		return true;
	else if (isidentifier())
		return function->checklocal(t.str()) == 'I';
	else return false;
}

int SimpleExpr::getintegervalue () const
{
	if (! isliteralinteger())
		throw InternalError("Not an integer");
	std::istringstream iss(t.str());
	int n;
	iss >> n;
	return n;
}

bool SimpleExpr::isliteralstring() const
{
	return t.isliteralstring();
}

bool SimpleExpr::isstring() const
{
	if (isliteralstring())
		return true;
	else if (isidentifier())
		return function->checklocal(t.str()) == 'S';
	else return false;
}

bool SimpleExpr::issinglequoted() const
{
	return t.issinglequoted();
}

Token SimpleExpr::get() const
{
	return t;
}

std::string SimpleExpr::value() const
{
	return t.str();
}

//**********************************************************************

class OpNotExpr : public BaseExpr
{
public:
	OpNotExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		BaseExpr(fn, block),
		start(t),
		expr(subexpr)
	{
	}
private:
	bool isinteger () const { return expr->isinteger(); }
	BaseExpr *optimize()
	{
		expr= expr->optimize();
		if (expr->isliteralinteger() )
		{
			const int n= expr->getintegervalue();
			std::ostringstream oss;
			oss << ! n;
			Token newt= Token(TokenTInteger, oss.str(), start.linenum(), start.file());
			return new SimpleExpr(*function, *this, newt);
		}
		return this;
	}
	void emit(std::ostream &os, const std::string &result)
	{
		std::string arg= genlocalregister('I');
		expr->emit(os, arg);
		std::string r= result.empty() ? genlocalregister('I') : result;
		os << ".annotate 'file', '" << start.file() << "'\n"
			".annotate 'line', " << start.linenum() << "\n" <<
			r << " = not " << arg;
		if (! result.empty() )
			os << '\n';
	}
	Token start;
	BaseExpr * expr;
};

//**********************************************************************

class IncDecOp : public BaseExpr
{
protected:
	IncDecOp(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		BaseExpr(fn, block),
		start(t),
		expr(subexpr)
	{
	}
	void annotate(std::ostream &os)
	{
		os << ".annotate 'file', '" << start.file() << "'\n"
			".annotate 'line', " << start.linenum() << '\n';
	}
	std::string getvar()
	{
		if (! (expr->isidentifier() && expr->isinteger()))
			throw SyntaxError("int var required", start);
		return expr->getidentifier();
	}
private:
	bool isinteger () const { return expr->isinteger(); }
	Token start;
protected:
	BaseExpr * expr;
};

//**********************************************************************

class OpPreIncExpr : public IncDecOp
{
public:
	OpPreIncExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		IncDecOp(fn, block, t, subexpr)
	{
	}
private:
	void emit(std::ostream &os, const std::string &result)
	{
		std::string var= getvar();
		annotate(os);
		os << "inc " << var << '\n';
		if (! result.empty())
			os << result << " = " << var << '\n';
	}
};

//**********************************************************************

class OpPreDecExpr : public IncDecOp
{
public:
	OpPreDecExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		IncDecOp(fn, block, t, subexpr)
	{
	}
private:
	void emit(std::ostream &os, const std::string &result)
	{
		std::string var= getvar();
		annotate(os);
		os << "dec " << var << '\n';
		if (! result.empty())
			os << result << " = " << var << '\n';
	}
};

//**********************************************************************

class OpPostIncExpr : public IncDecOp
{
public:
	OpPostIncExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		IncDecOp(fn, block, t, subexpr)
	{
	}
private:
	void emit(std::ostream &os, const std::string &result)
	{
		std::string var= getvar();
		std::string reg= genlocalregister('I');
		annotate(os);
		os << reg << " = " << var << "\n"
			"inc " << var << '\n';
		if (! result.empty())
			os << result << " = " << reg << '\n';
	}
};

//**********************************************************************

class OpPostDecExpr : public IncDecOp
{
public:
	OpPostDecExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		IncDecOp(fn, block, t, subexpr)
	{
	}
private:
	void emit(std::ostream &os, const std::string &result)
	{
		std::string var= getvar();
		std::string reg= genlocalregister('I');
		annotate(os);
		os << reg << " = " << var << "\n"
			"dec " << var << '\n';
		if (! result.empty())
			os << result << " = " << reg << '\n';
	}
};

//**********************************************************************

class BinOpExpr : public BaseExpr
{
protected:
	BinOpExpr(Function &fn, Block &block, Token t, BaseExpr *first, BaseExpr *second);
	void optimize_operands();
	unsigned int linenum;
	BaseExpr *efirst;
	BaseExpr *esecond;
private:
	BaseExpr *optimize();
};

BinOpExpr::BinOpExpr(Function &fn, Block &block, Token t, BaseExpr *first, BaseExpr *second) :
	BaseExpr(fn, block),
	linenum(t.linenum()),
	efirst(first),
	esecond(second)
{
}

void BinOpExpr::optimize_operands()
{
	efirst= efirst->optimize();
	esecond= esecond->optimize();
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
	CommonBinOpExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
protected:
	bool isstring() const;
	bool isinteger() const;
};

CommonBinOpExpr::CommonBinOpExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	BinOpExpr(fn, block, t, first, second)
{
}

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
	CompareOpExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
protected:
	bool isinteger() const { return true; }
};

CompareOpExpr::CompareOpExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	BinOpExpr(fn, block, t, first, second)
{
}

//**********************************************************************

class OpEqualExpr : public CommonBinOpExpr
{
public:
	OpEqualExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(std::ostream &os, const std::string &result);
};

OpEqualExpr::OpEqualExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CommonBinOpExpr(fn, block, t, first, second)
{
}

void OpEqualExpr::emit(std::ostream &os, const std::string &result)
{
	std::string res= genlocalregister('I');
	if (isstring())
	{
		std::string op1= genlocalregister('S');
		std::string op2= genlocalregister('S');
		efirst->emit(os, op1);
		esecond->emit(os, op2);
		os << res << " = iseq " << op1 << " , " << op2;
	}
	else if (efirst->isinteger() && esecond->isinteger())
	{
		std::string op1= genlocalregister('I');
		std::string op2= genlocalregister('I');
		efirst->emit(os, op1);
		esecond->emit(os, op2);
		os << res << " = iseq " << op1 << " , " << op2;
	}
	else
	{
		std::string op1= genlocalregister('P');
		std::string op2= genlocalregister('P');
		if (efirst->isinteger() )
		{
			std::string aux= genlocalregister('I');
			efirst->emit(os, aux);
			os << op1 << " = box " << aux << '\n';
		}
		else if (efirst->isstring() )
		{
			std::string aux= genlocalregister('S');
			efirst->emit(os, aux);
			os << op1 << " = box " << aux << '\n';
		}
		else
			efirst->emit(os, op1);
		if (esecond->isinteger() )
		{
			std::string aux= genlocalregister('I');
			esecond->emit(os, aux);
			os << op2 << " = box " << aux << '\n';
		}
		else if (esecond->isstring() )
		{
			std::string aux= genlocalregister('S');
			esecond->emit(os, aux);
			os << op2 << " = box " << aux << '\n';
		}
		else
			esecond->emit(os, op2);
		os << res << " = iseq " << op1 << " , " << op2;
	}
	if (!result.empty())
		os << '\n' << result << " = " << res << '\n';
}

//**********************************************************************

class OpNotEqualExpr : public CommonBinOpExpr
{
public:
	OpNotEqualExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(std::ostream &os, const std::string &result);
};

OpNotEqualExpr::OpNotEqualExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CommonBinOpExpr(fn, block, t, first, second)
{
}

void OpNotEqualExpr::emit(std::ostream &os, const std::string &result)
{
	std::string res= function->genregister('I');
	if (isstring())
	{
		std::string op1= function->genregister('S');
		std::string op2= function->genregister('S');
		efirst->emit(os, op1);
		esecond->emit(os, op2);
		os << res << " = isne " << op1 << " , " << op2;
	}
	else if (isinteger())
	{
		std::string op1= function->genregister('I');
		std::string op2= function->genregister('I');
		efirst->emit(os, op1);
		esecond->emit(os, op2);
		os << res << " = isne " << op1 << " , " << op2;
	}
	else
	{
		std::string op1= function->genregister('P');
		std::string op2= function->genregister('P');
		if (efirst->isinteger() )
		{
			std::string aux= genlocalregister('I');
			efirst->emit(os, aux);
			os << op1 << " = box " << aux << '\n';
		}
		else if (efirst->isstring() )
		{
			std::string aux= genlocalregister('S');
			efirst->emit(os, aux);
			os << op1 << " = box " << aux << '\n';
		}
		else
			efirst->emit(os, op1);
		if (esecond->isinteger() )
		{
			std::string aux= genlocalregister('I');
			esecond->emit(os, aux);
			os << op2 << " = box " << aux << '\n';
		}
		else if (esecond->isstring() )
		{
			std::string aux= genlocalregister('S');
			esecond->emit(os, aux);
			os << op2 << " = box " << aux << '\n';
		}
		else
			esecond->emit(os, op2);
		os << res << " = isne " << op1 << " , " << op2;
	}
	if (!result.empty())
		os << '\n' << result << " = " << res << '\n';
}

//**********************************************************************

class OpLessExpr : public CompareOpExpr
{
public:
	OpLessExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(std::ostream &os, const std::string &result);
};

OpLessExpr::OpLessExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CompareOpExpr(fn, block, t, first, second)
{
}

void OpLessExpr::emit(std::ostream &os, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(os, op1);
	esecond->emit(os, op2);
	os << res << " = islt " << op1 << " , " << op2;
	if (!result.empty())
		os << '\n';
}

//**********************************************************************

class OpGreaterExpr : public CompareOpExpr
{
public:
	OpGreaterExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(std::ostream &os, const std::string &result);
};

OpGreaterExpr::OpGreaterExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CompareOpExpr(fn, block, t, first, second)
{
}

void OpGreaterExpr::emit(std::ostream &os, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(os, op1);
	esecond->emit(os, op2);
	os << res << " = isgt " << op1 << " , " << op2;
	if (!result.empty())
		os << '\n';
}

//**********************************************************************

class OpAddExpr : public CommonBinOpExpr
{
public:
	OpAddExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	BaseExpr *optimize();
	void emit(std::ostream &os, const std::string &result);
};

OpAddExpr::OpAddExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CommonBinOpExpr(fn, block, t, first, second)
{
}

BaseExpr *OpAddExpr::optimize()
{
	//std::cerr << "OpAddExpr::optimize\n";

	optimize_operands();
	if (efirst->issimple() && esecond->issimple())
	{
		Token t1= dynamic_cast<SimpleExpr *>(efirst)->get();
		Token t2= dynamic_cast<SimpleExpr *>(esecond)->get();
		if (t1.isinteger() && t2.isinteger())
		{
			//std::cerr << "OpAddExpr::optimize int\n";

			int n1, n2;
			{
				std::string v= dynamic_cast<SimpleExpr *>(efirst)->value();
				std::istringstream iss(v);
				iss >> n1;
			}
			{
				std::string v= dynamic_cast<SimpleExpr *>(esecond)->value();
				std::istringstream iss(v);
				iss >> n2;
			}

			//std::cerr << n1 << " " << n2 << '\n';

			std::ostringstream oss;
			oss << n1 + n2;
			Token newt= Token(TokenTInteger, oss.str(), t1.linenum(), t1.file());
			return new SimpleExpr(*function, *this, newt);
		}
		if (t1.isliteralstring() && t2.isliteralstring())
		{
			//std::cerr << "OpAddExpr::optimize string\n";

			SimpleExpr &e1= dynamic_cast<SimpleExpr &>(*efirst);
			SimpleExpr &e2= dynamic_cast<SimpleExpr &>(*esecond);
			std::string s1= e1.value();
			std::string s2= e2.value();
			Token newt= Token(TokenTQuoted, s1 + s2, t1.linenum(), t1.file());
			return new SimpleExpr(*function, *this, newt);
		}
	}
	return this;
}

void OpAddExpr::emit(std::ostream &os, const std::string &result)
{
	// Quick hack
	if (isstring())
	{
		std::string res= result.empty() ? genlocalregister('S') : result;
		std::string op1= genlocalregister('S');
		std::string op2= genlocalregister('S');
		efirst->emit(os, op1);
		esecond->emit(os, op2);
		os << res << " = concat " << op1 << " , " << op2;
	}
	else if (isinteger())
	{
		std::string res= result.empty() ? genlocalregister('I') : result;
		std::string op1= genlocalregister('I');
		std::string op2= genlocalregister('I');
		efirst->emit(os, op1);
		esecond->emit(os, op2);
		os << res << " = " << op1 << " + " << op2;
	}
	else
	{
		std::string res= result.empty() ? genlocalregister('P') : result;
		std::string op1= genlocalregister('P');
		std::string op2= genlocalregister('P');
		switch (efirst->checkresult() )
		{
		case 'I':
			os << op1 << " = new 'Integer'\n";
			break;
		case 'S':
			os << op1 << " = new 'String'\n";
			break;
		default:
			os << "null " << op1 << '\n';
		}
		switch (esecond->checkresult() )
		{
		case 'I':
			os << op2 << " = new 'Integer'\n";
			break;
		case 'S':
			os << op2 << " = new 'String'\n";
			break;
		default:
			os << "null " << op2 << '\n';
		}
		efirst->emit(os, op1);
		esecond->emit(os, op2);
		//os << res << " = new 'Integer'\n";
		os << res << " = " << op1 << " + " << op2;
	}
	if (!result.empty())
		os << '\n';
}

//**********************************************************************

class OpSubExpr : public CommonBinOpExpr
{
public:
	OpSubExpr(Function &f, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	BaseExpr *optimize();
	void emit(std::ostream &os, const std::string &result);
};

OpSubExpr::OpSubExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CommonBinOpExpr(fn, block, t, first, second)
{
}

BaseExpr *OpSubExpr::optimize()
{
	//std::cerr << "OpSubExpr::optimize\n";

	optimize_operands();
	if (efirst->issimple() && esecond->issimple())
	{
		Token t1= dynamic_cast<SimpleExpr *>(efirst)->get();
		Token t2= dynamic_cast<SimpleExpr *>(esecond)->get();
		if (t1.isinteger() && t2.isinteger())
		{
			//std::cerr << "OpAddExpr::optimize int\n";

			int n1, n2;
			{
				std::string v= dynamic_cast<SimpleExpr *>(efirst)->value();
				std::istringstream iss(v);
				iss >> n1;
			}
			{
				std::string v= dynamic_cast<SimpleExpr *>(esecond)->value();
				std::istringstream iss(v);
				iss >> n2;
			}

			//std::cerr << n1 << " " << n2 << '\n';

			std::ostringstream oss;
			oss << n1 - n2;
			Token newt= Token(TokenTInteger, oss.str(), t1.linenum(), t1.file());
			return new SimpleExpr(*function, *this, newt);
		}
	}
	return this;
}

void OpSubExpr::emit(std::ostream &os, const std::string &result)
{
	std::string res= result.empty() ? genlocalregister('I') : result;
	std::string op1= genlocalregister('I');
	std::string op2= genlocalregister('I');
	efirst->emit(os, op1);
	esecond->emit(os, op2);
	os << res << " = " << op1 << " - " << op2;
	if (!result.empty())
		os << '\n';
}

//**********************************************************************

class OpBoolOrExpr : public BaseExpr
{
public:
	OpBoolOrExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	bool isinteger() const { return true; }
	void emit(std::ostream &os, const std::string &result);
	unsigned int linenum;
	BaseExpr *efirst;
	BaseExpr *esecond;
};

OpBoolOrExpr::OpBoolOrExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	BaseExpr(fn, block),
	linenum(t.linenum()),
	efirst(first),
	esecond(second)
{
}

void OpBoolOrExpr::emit(std::ostream &os, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(os, op1);
	esecond->emit(os, op2);
	os << res << " = or " << op1 << ", " << op2;
	if (!result.empty())
		os << '\n';
}

//**********************************************************************

class OpBoolAndExpr : public BaseExpr
{
public:
	OpBoolAndExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	bool isinteger() const { return true; }
	void emit(std::ostream &os, const std::string &result);
	unsigned int linenum;
	BaseExpr *efirst;
	BaseExpr *esecond;
};

OpBoolAndExpr::OpBoolAndExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	BaseExpr(fn, block),
	linenum(t.linenum()),
	efirst(first), esecond(second)
{
}

void OpBoolAndExpr::emit(std::ostream &os, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(os, op1);
	esecond->emit(os, op2);
	os << res << " = and " << op1 << ", " << op2;
	if (!result.empty())
		os << '\n';
}

//**********************************************************************

class OpMulExpr : public CommonBinOpExpr
{
public:
	OpMulExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(std::ostream &os, const std::string &result);
};

OpMulExpr::OpMulExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CommonBinOpExpr(fn, block, t, first, second)
{
}

void OpMulExpr::emit(std::ostream &os, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(os, op1);
	esecond->emit(os, op2);
	os << res << " = " << op1 << " * " << op2;
	if (!result.empty())
		os << '\n';
}

//**********************************************************************

class ArrayExpr : public BaseExpr
{
public:
	ArrayExpr(Function &fn, Block &block, Tokenizer &tk);
private:
	void emit(std::ostream &os, const std::string &result);
	std::vector<BaseExpr *> elems;
};


ArrayExpr::ArrayExpr(Function &fn, Block &block, Tokenizer &tk) :
	BaseExpr(fn, block)
{
	Token t = tk.get();
	if (! t.isop (']') )
	{
		tk.unget(t);
		do {
			elems.push_back(parseExpr(fn, block, tk));
			t= tk.get();
		} while (t.isop(',') );
		RequireOp (']', t);
	}
}

void ArrayExpr::emit(std::ostream &os, const std::string &result)
{
	std::string reg = function->genregister('P');
	os << reg << " = root_new ['parrot';'ResizablePMCArray']\n";
	for (size_t i= 0; i < elems.size(); ++i)
	{
		BaseExpr *elem= elems[i]->optimize();
		std::string el = function->genregister('P');
		if (elem->issimple() && !elem->isidentifier())
		{
			os << el << " = box ";
			elem->emit(os, std::string());
			os << "\n"
				"push " << reg << " , " << el << '\n';
		}
		else
		{
			elem->emit(os, el);
			os << "push " << reg << " , " << el << '\n';
		}
	}

	if (!result.empty())
		os << result << " = " << reg << '\n';
}

//**********************************************************************

class HashExpr : public BaseExpr
{
public:
	HashExpr(Function &fn, Block &block, Tokenizer &tk);
private:
	void emit(std::ostream &os, const std::string &result);
	std::map<std::string, BaseExpr *> elems;
};

HashExpr::HashExpr(Function &fn, Block &block, Tokenizer &tk) :
	BaseExpr(fn, block)
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
			if (t.str () != ":")
				throw Expected (':', t);
			BaseExpr *value= parseExpr(fn, block, tk);
			std::string key;
			if (tkey.isidentifier() || tkey.issinglequoted() )
				key= "'" + tkey.str() + "'";
			else if (tkey.isliteralstring())
				key= "\"" + tkey.str() + "\"";
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
	EmitItem(std::ostream &os, const std::string reg) : o(&os), r(reg) { }
	void operator() (std::pair<std::string, BaseExpr *> elem)
	{
		BaseExpr *value= elem.second->optimize();
		(*o) << r << " [" << elem.first << "] = ";
		value->emit(*o, std::string());
		(*o) << '\n';
	}
private:
	std::ostream *o;
	std::string r;
};

void HashExpr::emit(std::ostream &os, const std::string &result)
{
	std::string reg = function->genregister('P');
	os << reg << " = root_new ['parrot';'Hash']\n";
	std::for_each(elems.begin(), elems.end(), EmitItem(os, reg) );
	if (!result.empty())
		os << result << " = " << reg << '\n';
}

//**********************************************************************

class FunctionCallExpr : public BaseExpr
{
public:
	FunctionCallExpr(Function &fn, Block &block,
		Tokenizer &tk, Token tname);
	BaseExpr *optimize();
private:
	void emit(std::ostream &os, const std::string &result);
	Token start;
	std::string name;
	std::vector <BaseExpr *> args;
};

FunctionCallExpr::FunctionCallExpr(Function &fn, Block &block,
		Tokenizer &tk, Token tname) :
	BaseExpr(fn, block),
	start(tname),
	name(tname.str())
{
	Token t= tk.get();
	if (! t.isop (')') )
	{
		tk.unget(t);
		do
		{
			args.push_back(parseExpr(fn, block, tk));
			t= tk.get();
		} while (t.isop(',') );
		RequireOp (')', t);
	}
}

BaseExpr *FunctionCallExpr::optimize()
{
	for (size_t i= 0; i < args.size(); ++i)
		args[i]= args[i]->optimize();
	return this;
}

void FunctionCallExpr::emit(std::ostream &os, const std::string &result)
{
	//std::cerr << "FunctionCallExpr::emit\n";

	std::vector<std::string> argregs;
	for (size_t i= 0; i < args.size(); ++i)
	{
		BaseExpr &arg= * args[i];
		if (! arg.issimple() )
		{
			std::string reg= function->genregister(arg.isinteger() ? 'I' : 'P');
			arg.emit(os, reg);
			argregs.push_back(reg);
		}
		else
		{
			argregs.push_back(std::string());
		}
	}

	os << ".annotate 'file', '" << start.file() << "'\n"
		".annotate 'line', " << start.linenum() << '\n';

	if (!result.empty() )
		os << result << " = ";

	std::string quote(function->islocal(name) ? "" : "'");

	os << quote << name << quote << '(';
	for (size_t i= 0; i < args.size(); ++i)
	{
		if (i > 0)
			os << ", ";
		if (argregs[i].empty() )
		{
			args[i]->emit(os, std::string());
		}
		else
		{
			os << argregs[i];
			//args[i]->emit(os, std::string());
		}
	}
	os << ')';
	if (!result.empty() )
		os << '\n';
}

//**********************************************************************

class MethodCallExpr : public BaseExpr
{
public:
	MethodCallExpr(Function &fn, Block &block,
		Tokenizer &tk, Token tobj, Token tmeth);
private:
	BaseExpr *optimize();
	void emit(std::ostream &os, const std::string &result);
	Token object;
	Token method;
	std::vector <BaseExpr *> args;
};

MethodCallExpr::MethodCallExpr(Function &fn, Block &block,
		Tokenizer &tk, Token tobj, Token tmeth) :
	BaseExpr(fn, block), object(tobj), method(tmeth)
{
	Token t= tk.get();
	if (!t.isop (')') )
	{
		tk.unget(t);
		do
		{
			args.push_back(parseExpr(fn, block, tk));
			t= tk.get();
		} while (t.isop(',') );
		RequireOp (')', t);
	}
}

BaseExpr *MethodCallExpr::optimize()
{
	for (size_t i= 0; i < args.size(); ++i)
		args[i]= args[i]->optimize();
	return this;
}

void MethodCallExpr::emit(std::ostream &os, const std::string &result)
{
	std::vector<std::string> argregs;
	for (size_t i= 0; i < args.size(); ++i)
	{
		if (! args[i]->issimple() )
		{
			std::string reg= function->genregister('P');
			args[i]->emit(os, reg);
			argregs.push_back(reg);
		}
		else
			argregs.push_back(std::string());
	}

	if (!result.empty() )
		os << result << " = ";
	os << object.str() << ".'" << method.str() << "'(";
	for (size_t i= 0; i < args.size(); ++i)
	{
		if (i > 0)
			os << ", ";
		if (argregs[i].empty() )
		{
			args[i]->emit(os, std::string());
		}
		else
			os << argregs[i];
	}
	os << ')';
	if (!result.empty() )
		os << '\n';
}

//**********************************************************************

class OpInstanceOf : public BaseExpr {
public:
	OpInstanceOf(Function &fn, Block &block, Token t,
			BaseExpr *subexpr, Tokenizer &tk) :
		BaseExpr(fn, block),
		start(t),
		obj(subexpr),
		checked(tk.get())
	{
	}
private:
	bool isinteger() const { return true; }
	BaseExpr *optimize()
	{
		obj->optimize();
		return this;
	}
	void emit(std::ostream &os, const std::string &result)
	{
		if (! checked.isliteralstring())
			throw CompileError("Unimplemented", checked);
		std::string reg= genlocalregister('P');
		obj->emit(os, reg);
		os << ".annotate 'file', '" << start.file() << "'\n"
			".annotate 'line', " << start.linenum() << '\n';

		if (result.empty() ) {
			std::string regcheck = genlocalregister('I');
			os << regcheck << " = isa " << reg << ", '" << checked.str() << "'\n";
		}
		else
		{
			os << result << " = isa " << reg << ", '" << checked.str() << "'\n";
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
	NewExpr(Function &fn, Block &block, Tokenizer &tk, Token t);
private:
	void emit(std::ostream &os, const std::string &result);
	unsigned int ln;
	std::string value;
	BaseExpr *init;
};

NewExpr::NewExpr(Function &fn, Block &block, Tokenizer &tk, Token t) :
	BaseExpr(fn, block), ln(t.linenum()), init(0)
{
	t= tk.get();
	if (t.issinglequoted())
	{
		value = "root_new ['parrot'; '" + t.str() + "' ]";
		t= tk.get();
		if (! t.isop(';') )
		{
			tk.unget(t);
			init = parseExpr(fn, block, tk);
		}
		else
		{
			tk.unget(t);
		}
	}
	else
	{
		std::string name = t.str();
		std::vector<std::string> prefix;
		while ((t= tk.get()).isop('.') )
		{
			t= tk.get();
			prefix.push_back(name);
			name = t.str();
		}
		value = " new [";
		for (size_t i= 0; i < prefix.size(); ++i)
		{
			value+= "'" + prefix[i] + "';";
		}
		value+= "'" + name + "' ]";
		tk.unget(t);
	}
}

void NewExpr::emit(std::ostream &os, const std::string &result)
{
	std::string reg;
	if (init)
	{
		reg= function->genregister('P');
		init->emit(os, reg);
	}

	if (! result.empty())
	{
		os << result << " = " << value;
		if (! reg.empty())
			os << ", " << reg;
		os << '\n';
	}
	else
		os << value;
}

//**********************************************************************

class IndexExpr : public BaseExpr
{
public:
	IndexExpr(Function &fn, Block &block, Tokenizer &tk, Token tname);
private:
	void emit(std::ostream &os, const std::string &result);
	std::string name;
	BaseExpr *arg;
};

IndexExpr::IndexExpr(Function &fn, Block &block, Tokenizer &tk, Token tname) :
	BaseExpr(fn, block), name(tname.str()), arg(0)
{
	arg = parseExpr(fn, block, tk);
	Token t= tk.get();
	RequireOp (']', t);
}

void IndexExpr::emit(std::ostream &os, const std::string &result)
{
	std::string reg;
	if (! arg->issimple() )
	{
		reg= function->genregister('P');
		arg->emit(os, reg);
	}
	if (!result.empty() )
		os << result << " = ";
	os << name << '[';
	if (arg->issimple() )
		arg->emit(os, std::string());
	else
		os << reg;
	os << ']';
	if (!result.empty() )
		os << '\n';
}

//**********************************************************************

BaseExpr * parseDotted(Function &fn, Block &block, Tokenizer &tk, Token t)
{
	Token t2= tk.get();
	Token t3= tk.get();
	if (t3.str() != "(")
		throw Expected ('(', t3);
	return new MethodCallExpr(fn, block, tk, t, t2);
}

BaseExpr * parseExpr_14(Function &fn, Block &block, Tokenizer &tk);
BaseExpr * parseExpr_13(Function &fn, Block &block, Tokenizer &tk);
BaseExpr * parseExpr_9(Function &fn, Block &block, Tokenizer &tk);
BaseExpr * parseExpr_8(Function &fn, Block &block, Tokenizer &tk);
BaseExpr * parseExpr_6(Function &fn, Block &block, Tokenizer &tk);
BaseExpr * parseExpr_5(Function &fn, Block &block, Tokenizer &tk);
BaseExpr * parseExpr_4(Function &fn, Block &block, Tokenizer &tk);
BaseExpr * parseExpr_3(Function &fn, Block &block, Tokenizer &tk);
BaseExpr * parseExpr_0(Function &fn, Block &block, Tokenizer &tk);

BaseExpr * parseExpr_0(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= NULL;
	Token t= tk.get();

	if (t.isop('(') )
	{
		subexpr = parseExpr(fn, block, tk);
		t= tk.get();
		RequireOp (')', t);
	}
	else if (t.isop('[') )
	{
		subexpr = new ArrayExpr(fn, block, tk);
	}
	else if (t.isop('{') )
	{
		subexpr = new HashExpr(fn, block, tk);
	}
	else if (t.str() == "new")
			subexpr = new NewExpr(fn, block, tk, t);
	else
	{
		Token t2= tk.get();
		if (t2.isop('(') )
			subexpr = new FunctionCallExpr(fn, block, tk, t);
		else if (t2.isop('[') )
			subexpr = new IndexExpr(fn, block, tk, t);
		else if (t2.isop('.') )
			subexpr = parseDotted(fn, block, tk, t);
		else
		{
			tk.unget(t2);
			subexpr = new SimpleExpr(fn, block, t);
		}
	}

	return subexpr;
}

BaseExpr *parseExpr_3(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_0(fn, block, tk);
	Token t= tk.get();
	if (t.isop("++") )
		return new OpPostIncExpr(fn, block, t, subexpr);
	else if (t.isop("--") )
		return new OpPostDecExpr(fn, block, t, subexpr);
	else
	{
		tk.unget(t);
		return subexpr;
	}
}

BaseExpr * parseExpr_4(Function &fn, Block &block, Tokenizer &tk)
{
	Token t= tk.get();
	if (t.isop('!') )
	{
		BaseExpr *subexpr= parseExpr_4(fn, block, tk);
		return new OpNotExpr(fn, block, t, subexpr);
	}
	else if (t.isop("++"))
	{
		BaseExpr *subexpr= parseExpr_4(fn, block, tk);
		return new OpPreIncExpr(fn, block, t, subexpr);
	}
	else if (t.isop("--"))
	{
		BaseExpr *subexpr= parseExpr_4(fn, block, tk);
		return new OpPreDecExpr(fn, block, t, subexpr);
	}
	else
	{
		tk.unget(t);
		return parseExpr_3(fn, block, tk);
	}
}

BaseExpr * parseExpr_5(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_4(fn, block, tk);
	Token t= tk.get();
	while (t.isop('*') )
	{
		BaseExpr *subexpr2= parseExpr_4(fn, block, tk);
		subexpr= new OpMulExpr(fn, block, t, subexpr, subexpr2);
		t= tk.get();
	}
	tk.unget(t);
	return subexpr;
}

BaseExpr * parseExpr_6(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_5(fn, block, tk);
	Token t= tk.get();
	std::string op = t.str();
	while (op == "+" || op == "-")
	{
		BaseExpr *subexpr2= parseExpr_5(fn, block, tk);
		if (op == "+")
			subexpr= new OpAddExpr(fn, block, t, subexpr, subexpr2);
		else
			subexpr= new OpSubExpr(fn, block, t, subexpr, subexpr2);
		t= tk.get();
		op= t.str();
	}
	tk.unget(t);
	return subexpr;
}

BaseExpr * parseExpr_8(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_6(fn, block, tk);
	Token t= tk.get();
	if (t.isop("=="))
	{
		BaseExpr *subexpr2= parseExpr_6(fn, block, tk);
		subexpr= new OpEqualExpr(fn, block, t, subexpr, subexpr2);
	}
	else if (t.isop("!="))
	{
		BaseExpr *subexpr2= parseExpr_6(fn, block, tk);
		subexpr= new OpNotEqualExpr(fn, block, t, subexpr, subexpr2);
	}
	else if (t.str() == "instanceof")
	{
		subexpr= new OpInstanceOf(fn, block, t, subexpr, tk);
	}
	else
	{
		tk.unget(t);
	}
	return subexpr;
}

BaseExpr * parseExpr_9(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_8(fn, block, tk);
	Token t= tk.get();
	if (t.isop('<'))
	{
		BaseExpr *subexpr2= parseExpr_8(fn, block, tk);
		subexpr= new OpLessExpr(fn, block, t, subexpr, subexpr2);
	}
	else if (t.isop('>'))
	{
		BaseExpr *subexpr2= parseExpr_8(fn, block, tk);
		subexpr= new OpGreaterExpr(fn, block, t, subexpr, subexpr2);
	}
	else
	{
		tk.unget(t);
	}
	return subexpr;
}

BaseExpr * parseExpr_13(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_9(fn, block, tk);
	Token t= tk.get();
	if (t.isop("&&"))
	{
		BaseExpr *subexpr2= parseExpr_9(fn, block, tk);
		subexpr= new OpBoolAndExpr(fn, block, t, subexpr, subexpr2);
	}
	else
	{
		tk.unget(t);
	}
	return subexpr;
}

BaseExpr * parseExpr_14(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_13(fn, block, tk);
	Token t= tk.get();
	if (t.isop("||"))
	{
		BaseExpr *subexpr2= parseExpr_13(fn, block, tk);
		subexpr= new OpBoolOrExpr(fn, block, t, subexpr, subexpr2);
	}
	else
	{
		tk.unget(t);
	}
	return subexpr;
}

BaseExpr * parseExpr(Function &fn, Block &block, Tokenizer &tk)
{
	return parseExpr_14(fn, block, tk);
}

//**********************************************************************

ExprStatement::ExprStatement(Function &fn, Block &parentblock, Tokenizer &tk) :
	BaseStatement (fn)
{
	expr= parseExpr(fn, parentblock, tk);
	ExpectOp(';', tk);
}

BaseStatement *ExprStatement::optimize ()
{
	expr= expr->optimize();
	return this;
}

void ExprStatement::emit (std::ostream & os)
{
	expr->emit(os, std::string());
	os << '\n';
}

//**********************************************************************

ValueStatement::ValueStatement(Function &fn, Block & block) :
	SubStatement (fn, block),
	value(0)
{
}

BaseStatement *ValueStatement::optimize()
{
	if (value)
		value= value->optimize();
	return this;
}

//**********************************************************************

IntStatement::IntStatement(Function &fn, Block &block, Tokenizer &tk) :
	ValueStatement (fn, block)
{
	Token t= tk.get();
	function->genlocal(t.str(), 'I');
	name= t.str();
	t= tk.get();
	if (t.isop('='))
	{
		value= parseExpr(*function, block, tk);
		t= tk.get();
	}
	RequireOp (';', t);
}

void IntStatement::emit (std::ostream & os)
{
	os << ".local int " << name << '\n';
	if (value)
		value->emit(os, name);
}

//**********************************************************************

StringStatement::StringStatement(Function &fn, Block & block, Tokenizer &tk) :
	ValueStatement (fn, block)
{
	Token t= tk.get();
	function->genlocal(t.str(), 'S');
	name= t.str();
	t= tk.get();
	if (t.isop('='))
	{
		value= parseExpr(*function, block, tk);
		t= tk.get();
	}
	RequireOp (';', t);
}

void StringStatement::emit (std::ostream & os)
{
	os << ".local string " << name << '\n';
	if (value)
		value->emit(os, name);
}

//**********************************************************************

VarStatement::VarStatement(Function &fn, Block & block, Tokenizer &tk) :
	ValueStatement (fn, block)
{
	Token t= tk.get();
	function->genlocal(t.str(), 'P');
	name= t.str();
	t= tk.get();
	if (t.isop('='))
	{
		value= parseExpr(*function, block, tk);
		t= tk.get();
	}
	RequireOp (';', t);
}

void VarStatement::emit (std::ostream & os)
{
	os << ".local pmc " << name << '\n';
	if (value)
		value->emit(os, name);
}

//**********************************************************************

UsingStatement::UsingStatement(Function &fn, const std::string & name, const Namespace &nspace) :
	BaseStatement (fn), n(name), ns(nspace)
{
	function->genlocal(n, 'P');
}

void UsingStatement::emit (std::ostream & os)
{
	os << ".local pmc " << n << '\n' << n <<
		" = get_hll_global " << ns.get_key() <<
		", '" << n << "'\n";
}

//**********************************************************************

ReturnStatement::ReturnStatement(Function &fn, Block & block, Tokenizer &tk) :
	SubStatement (fn, block), values(0)
{
	Token t= tk.get();
	if (!t.isop(';'))
	{
		tk.unget(t);
		values= new ArgumentList(*function, block, tk);
		ExpectOp(';', tk);
	}
}

void ReturnStatement::emit (std::ostream & os)
{
	if (values)
		values->prepare(os);
	os << ".return (";
	if (values)
		values->emit(os);
	os << " )\n";
}

//**********************************************************************

YieldStatement::YieldStatement(Function &fn, Block & block, Tokenizer &tk) :
	SubStatement (fn, block), values(0)
{
	Token t= tk.get();
	if (! t.isop(';') )
	{
		tk.unget(t);
		values= new ArgumentList(*function, block, tk);
		ExpectOp (';', tk);
	}
}

void YieldStatement::emit (std::ostream & os)
{
	if (values)
		values->prepare(os);
	os << ".yield (";
	if (values)
		values->emit(os);
	os << " )\n";
}

//**********************************************************************

AssignStatement::AssignStatement(Function &fn, Block & block,
		Tokenizer &tk, const std::string &name) :
	SubStatement (fn, block), varname(name), st(0)
{
	Token t= tk.get();
	if (t.str() == "new")
	{
		st = new NewExpr(fn, block, tk, t);
		return;
	}
	else
	{
		tk.unget(t);
		st = parseExpr(fn, block, tk);
	}
}

void AssignStatement::emit (std::ostream & os)
{
	if (content.empty() )
	{
		if (st)
		{
			//std::cerr << "AssignStatement::emit\n";

			st= st->optimize();
			char type = bl.checklocal(varname);
			switch (type)
			{
			case 'I':
				if (!(st->isinteger() || st->isstring() ))
				{
					std::string r= bl.genregister('P');
					st->emit(os, r);
					os << varname << " = " << r << '\n';
				}
				else
					st->emit(os, varname);
				break;
			case 'S':
				if (!(st->isinteger() || st->isstring() ))
				{
					std::string r= bl.genregister('S');
					st->emit(os, r);
					os << varname << " = " << r << '\n';
				}
				else
					st->emit(os, varname);
				break;
			default:
				if (st->isinteger() || st->isstring() )
				{
					os << varname << " = box ";
					st->emit(os, std::string());
					os << '\n';
				}
				else
					st->emit(os, varname);
			}
		}
	}
	else
	{
		os << varname << " = " << content << '\n';
	}
}

//**********************************************************************

CompoundStatement::CompoundStatement(Function &fn, Block &parentblock,
		Tokenizer &tk) :
	BlockStatement (fn, parentblock)
{
	for (Token t= tk.get(); ! t.isop('}'); t= tk.get() )
	{
		tk.unget(t);
		BaseStatement *st= parseStatement(*function, *this, tk);
		subst.push_back(st);
	}
}

BaseStatement *CompoundStatement::optimize ()
{
	bool empty= true;
	for (size_t i= 0; i < subst.size(); ++i) {
		subst[i]= subst[i]->optimize();
		if (!subst[i]->isempty() )
			empty= false;
	}
	if (empty)
		return new EmptyStatement(*function);
	else
		return this;
}

void CompoundStatement::emit (std::ostream & os)
{
	//std::cerr << "CompoundStatement::emit\n";

	for (size_t i= 0; i < subst.size(); ++i)
		if (subst[i])
			subst[i]->emit(os);
}

//**********************************************************************

ForStatement::ForStatement(Function &fn, Block &block, Tokenizer &tk) :
	BlockStatement (fn, block),
	container(0)
{
	ExpectOp ('(', tk);
	Token t= tk.get();
	varname= t.str();
	t= tk.get();
	if (t.str() != "in")
		throw Expected ("'in'", t);
	container= parseExpr(fn, *this, tk);
	ExpectOp(')', tk);
	st= parseStatement(fn, block, tk);
}

void ForStatement::emit(std::ostream & os)
{
	std::string label= genlabel();
	std::string l_for = label + "_FOR";
	std::string l_end = label + "_END";

	std::string container_ = function->genregister('P');
	container->emit(os, container_);

	os << ".local pmc iter_" << varname << "\n"
		"iter_" << varname << " = iter " << container_ << "\n"
		"iter_" << varname << " = .ITERATE_FROM_START\n" <<
		l_for << ":\n" <<
		"unless " << "iter_" << varname << " goto " << l_end<< "\n"
		"shift " << varname << ", iter_" << varname << '\n'
		;
	st->emit(os);
	os << "goto " << l_for << '\n' <<
		l_end << ":\n";
}

//**********************************************************************

ThrowStatement::ThrowStatement(Function &fn, Block &block,
		Tokenizer &tk, Token t) :
	SubStatement (fn, block),
	pos(t), excep(0)
{
	excep = parseExpr(fn, block, tk);
}

void ThrowStatement::emit (std::ostream & os)
{
	os << ".annotate 'file', '" << pos.file() << "'\n"
		".annotate 'line', " << pos.linenum() << '\n';

	if (excep->issimple() )
	{
		os << "throw ";
		excep->emit(os, std::string());
		os << '\n';
	}
	else
	{
		std::string reg= function->genregister('P');
		excep->emit(os, reg);
		os << "throw " << reg << '\n';
	}
}

//**********************************************************************

TryStatement::TryStatement(Function &fn, Block &block, Tokenizer &tk, Token t) :
	BlockStatement (fn, block),
	ln(t.linenum()),
	stry(0), scatch(0)
{
	stry = parseStatement (fn, block, tk);
	t= tk.get();
	if (t.str() != "catch")
		throw Expected("catch", t);
	ExpectOp ('(', tk);
	t= tk.get();
	if (! t.isop(')'))
	{
		exname= t.str();
		ExpectOp (')', tk);
	}
	scatch= parseStatement (fn, block, tk);
}

void TryStatement::emit (std::ostream & os)
{
	os << ".annotate 'file', 'ggggg'\n"
		".annotate 'line', " << ln << '\n';
	std::string label= genlabel();
	std::string handler = label + "_HANDLER";
	std::string pasthandler = label + "_PAST_HANDLER";
	std::string except = exname.empty() ?
		function->genregister('P') :
		exname;

	os << "push_eh " << handler << '\n';
	stry->emit(os);
	os <<
		"pop_eh\n"
		"goto " << pasthandler << '\n' <<
		handler << ":\n";
	if (!exname.empty() )
	{
		function->genlocal(exname, 'P');
		os << ".local pmc " << exname << '\n';
	}
	os <<
		".get_results(" << except << ")\n"
		"pop_eh\n"
		;

	scatch->emit(os);
	os << pasthandler << ":\n";
}

//**********************************************************************

class Condition : public InBlock
{
public:
	Condition (Function &fn, Block &block, Tokenizer &tk);
	Condition *optimize();
	bool issimple() const;
	bool isliteralinteger() const;
	std::string value() const;
	std::string emit(std::ostream &os);
	enum Value { CVtrue, CVfalse, CVruntime };
	Value getvalue() const;
private:
	BaseExpr *expr;
};

Condition::Condition (Function &fn, Block &block, Tokenizer &tk) :
	InBlock (block),
	expr (0)
{
	ExpectOp ('(', tk);
	expr= parseExpr(fn, block, tk);
	ExpectOp(')', tk);
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
	return dynamic_cast<SimpleExpr &>(*expr).value();
}

Condition::Value Condition::getvalue() const
{
	if (issimple())
	{
		if (isliteralinteger())
		{
			std::string v= value();
			std::istringstream iss(v);
			int n;
			iss >> n;
			if (n != 0)
				return CVtrue;
			else
				return CVfalse;
		}
	}
	return CVruntime;
}

std::string Condition::emit(std::ostream &os)
{
	std::string reg;
	if (expr->isidentifier() && expr->isinteger())
		reg= dynamic_cast<SimpleExpr &>(*expr).value();
	else
	{
		char type = expr->isstring() ? 'S' : expr->isinteger() ? 'I' : 'P';
		reg = genlocalregister(type);
		expr->emit(os, reg);
	}
	return reg;
}

//**********************************************************************

IfStatement::IfStatement(Function &fn, Block &block, Tokenizer &tk) :
	BlockStatement (fn, block),
	condition(0),
	st(new EmptyStatement(fn)),
	stelse(new EmptyStatement(fn))
{
	condition= new Condition(fn, *this, tk);
	st= parseStatement(fn, block, tk);
	Token t= tk.get();
	if (t.str() == "else")
		stelse= parseStatement(fn, block, tk);
	else
	{
		tk.unget(t);
	}
}

BaseStatement *IfStatement::optimize()
{
	condition= condition->optimize();
	st= st->optimize();
	stelse= stelse->optimize();
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

void IfStatement::emit(std::ostream & os)
{
	std::string label= genlabel();
	std::string l_else= label + "_ELSE";
	std::string l_endif= label + "_ENDIF";
	std::string reg = condition->emit(os);
	os << "\n"
		"unless " << reg << " goto " <<
			(!stelse->isempty() ? l_else : l_endif) << '\n';
	if (!st->isempty())
		st->emit(os);
	if (!stelse->isempty())
	{
		os << "goto " << l_endif << '\n';
		os << l_else << ":\n";
		stelse->emit(os);
	}
	os << l_endif << ":\n";
}

//**********************************************************************

ForeverStatement::ForeverStatement(Function &fn, Block &block,
		BaseStatement *body) :
	BlockStatement(fn, block),
	st(body)
{
}

BaseStatement *ForeverStatement::optimize()
{
	st= st->optimize();
	return this;
}

void ForeverStatement::emit (std::ostream & os)
{
	std::string label= genlabel() + "_FOREVER";
	os << label << ":\n";
	st->emit(os);
	os << "goto " << label << '\n';
}

//**********************************************************************

WhileStatement::WhileStatement(Function &fn, Block &block, Tokenizer &tk) :
	BlockStatement (fn, block),
	st(new EmptyStatement(fn))
{
	condition = new Condition(fn, *this, tk);
	st= parseStatement(fn, block, tk);
}

BaseStatement *WhileStatement::optimize()
{
	condition= condition->optimize();
	st= st->optimize();
	switch (condition->getvalue())
	{
	case Condition::CVtrue:
		return new ForeverStatement(*function, *this, st);;
	case Condition::CVfalse:
		return new EmptyStatement(*function);;
	case Condition::CVruntime:
	default:
		return this;
	}
}

void WhileStatement::emit(std::ostream & os)
{
	std::string label= genlabel();
	std::string l_while= label + "_WHILE";
	std::string l_end= label + "_ENDWHILE";
	os << l_while << ":\n";
	std::string reg= condition->emit(os);
	os << '\n';
	if (st->isempty()) {
		os << "if " << reg << " goto " << l_while << '\n';
	}
	else {
		os << "unless " << reg << " goto " << l_end << '\n';
		st->emit(os);
		os << "goto " << l_while << '\n' <<
			l_end << ":\n";
	}
}

//**********************************************************************

Function::Function(Tokenizer &tk,
		const Namespace & ns_a, const std::string &funcname) :
	FunctionBlock(), ns(ns_a), name(funcname)
{
	Token t= tk.get();
	RequireOp('(', t);
	start= t;
	t= tk.get ();

	if (!t.isop(')'))
	{
		tk.unget(t);
		do
		{
			t= tk.get();
			std::string type= t.str();
			char ctype= '\0';
			if (type == "int") ctype = 'I';
			else if (type == "string") ctype = 'S';
			else if (type == "var") ctype = 'P';
			if (ctype == '\0')
				throw CompileError ("type invalid in function", t);
			t= tk.get();
			std::string name= t.str();
			params.push_back(name);
			paramtypes.push_back(ctype);
			genlocal(name, ctype);
			t= tk.get();
		} while (t.isop(','));
	}
	RequireOp(')', t);

	//std::cout << ".sub '" << name << "'\n";

	ExpectOp('{', tk);

	body = new CompoundStatement(*this, *this, tk);
}

void Function::local(std::string name)
{
	loc.push_back(name);
}

bool Function::islocal(std::string name)
{
	return std::find(loc.begin(), loc.end(), name) != loc.end() ||
		checklocal(name) ||
		std::find(params.begin(), params.end(), name) != params.end();
}

void Function::optimize()
{
	body= body->optimize();
}

static const char * nameoftype(char ctype)
{
	switch (ctype)
	{
	case 'I': return "int";
	case 'S': return "string";
	case 'P': return "pmc";
	default:
		throw CompileError("Invalid type");
	}
}

void Function::emitbody (std::ostream & os)
{
	for (size_t i= 0; i < params.size(); ++i)
		os << ".param " << nameoftype(paramtypes[i]) << ' ' <<
				params[i] << '\n';
	os << ".annotate 'file', '" << start.file() << "'\n"
		".annotate 'line', " << start.linenum() << "\n";
	body->emit(os);
}

void Function::emit (std::ostream & os)
{
	getnamespace().emit (os);

	os << "\n.sub '" << getname() << "'";
	if (name == "main")
		os << " :main";
	os << "\n";

	emitbody(os);

	os << ".end\n\n";
}

//**********************************************************************

class MethodAttributes
{
public:
	MethodAttributes(Tokenizer &tk, const Namespace &)
	{
		Token t= tk.get();
		if (! t.isop('[') )
		{
			tk.unget(t);
		}
		else
		{
			t= tk.get();
			if (! t.isidentifier())
				throw Expected("Attribute name", t);
			attributes.push_back(t.str());
			ExpectOp(']', tk);
		}
	}
	bool has_attribute(const std::string &attr)
	{
		return find(attributes.begin(), attributes.end(), attr)
			!= attributes.end();
	}
private:
	std::vector<std::string> attributes;
};

//**********************************************************************

class Method : private MethodAttributes, public Function
{
public:
	Method(Tokenizer &tk, const Namespace & ns_a, const std::string &name) :
		MethodAttributes(tk, ns_a),
		Function(tk, ns_a, name)
	{
		genlocal("self", 'P');
	}
	void emit (std::ostream & os)
	{
		getnamespace().emit (os);

		os << "\n.sub '" << getname() << "'";

		if (has_attribute("vtable"))
			os << " :vtable";
		else
			os << " :method";

		os << "\n";

		emitbody(os);

		os << ".end\n\n";
	}
};

//**********************************************************************

class Class
{
public:
	Class(Tokenizer &tk, const Namespace & ns_a);
	void emit (std::ostream & os);
private:
	std::string name;
	Namespace ns;
	std::vector <Token> parents;
	std::vector <Function *> functions;
};

Class::Class(Tokenizer &tk, const Namespace & ns_a)
{
	Token t= tk.get();
	name= t.str();
	t= tk.get();
	if (t.isop(':'))
	{
		t= tk.get();
		if (! (t.isidentifier () ||  t.isliteralstring()))
			throw Expected("parent class", t);
		parents.push_back(t);
		t= tk.get();
	}
	RequireOp('{', t);

	ns= ns_a.child(name);
	while (! (t= tk.get()).isop('}'))
	{
		if (t.str() == "function")
		{
			Token name= tk.get();
			if (! name.isidentifier() )
				throw Expected("method name", name);
			Function *f = new Method (tk, ns, name.str());
			functions.push_back(f);
		}
		else
			throw Expected ("'function' or '}'", t);
	}
}

void Class::emit (std::ostream & os)
{
	ns.emit (os);

	os << ".sub Winxed_class_init :anon :load :init\n"
		"$P0 = newclass " << ns.get_key() << "\n";

	for (size_t i= 0; i < parents.size(); ++i)
	{
		Token parent= parents[i];
		std::ostringstream oss;
		oss << "$P" << i + 1;
		std::string p= oss.str();
		os << p << " = get_class ";

		if (parent.isliteralstring() )
			os << "'" << parent.str() << "'";
		else 
			os << "[ '" << parent.str() << "' ]";

		os << "\n"
			"addparent $P0, " << p << "\n";
	}

	os << ".end\n";

	for (size_t i= 0; i < functions.size(); ++i)
		functions[i]->emit(os);
}

//**********************************************************************

class Winxed
{
public:
	void parse (Tokenizer &tk);
	void optimize ();
	void emit (std::ostream & os);
private:
	Namespace cur_namespace;
	std::vector <Class *> classes;
	std::vector <Function *> functions;
};

void Winxed::parse (Tokenizer &tk)
{
	for (;;)
	{
		Token a(tk.get());
		while ( (!a.empty() ) && a.isspace() )
			a= tk.get();
		if (a.empty())
			break;

		std::string name = a.str();

		if (name == "namespace")
		{
			a = tk.get();
			cur_namespace= cur_namespace.child(a.str());
			ExpectOp('{', tk);
		}
		else if (name == "class")
		{
			Class *c = new Class (tk, cur_namespace);
			classes.push_back(c);
		}
		else if (name == "function")
		{
			Token fname = tk.get();
			if (! fname.isidentifier() )
				throw Expected("funcion name", fname);
			Function *f = new Function (tk, cur_namespace, fname.str());
			functions.push_back(f);
		}
		else if (name == "}")
		{
			if (cur_namespace.isroot())
				throw SyntaxError("Unexpected '}'", a);
			cur_namespace= cur_namespace.parent();
		}
		else
			throw SyntaxError("Unexpected statement", a);
	}
}

void Winxed::optimize()
{
	for (size_t i= 0; i < functions.size(); ++i)
		functions[i]->optimize();
}

void Winxed::emit (std::ostream & os)
{
	os <<
"#\n"
"# Winxed generated file\n"
"#**************************************************\n"	
"\n"
".include 'iterator.pasm'\n"
"\n"
"#**************************************************\n"	
	;

	emit_predef(os);

	os <<
"#**************************************************\n"	
"# Begin generated code\n\n"
	;

	for (size_t i= 0; i < classes.size(); ++i)
		classes[i]->emit(os);

	for (size_t i= 0; i < functions.size(); ++i)
		functions[i]->emit(os);

	os << "\n# End generated code.\n";
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

int execute(char **args)
{
	pid_t p;
	int stat;
	switch ((p= fork()) )
	{
	case pid_t(-1):
		throw InternalError(std::string("fork failed: ") + strerror(errno) );
	case 0:
		execvp("parrot", args);
		throw InternalError(std::string("exec failed: ") + strerror(errno) );
	default:
		waitpid(p, & stat, 0);
		return WIFEXITED(stat) ? WEXITSTATUS(stat) : 127;
	}
}

void winxed_main (int argc, char **argv)
{
	if (argc < 2)
		throw CompileError("No arguments");
	int i= 1;
	const char *inputname= 0;
	std::string outputfile;
	bool compileonly= false;
	enum Target { TargetRun, TargetPir, TargetPbc } target = TargetPir;

nextarg:
	if (strcmp(argv[i], "-o") == 0)
	{
		outputfile= argv[++i];
		++i;
		goto nextarg;
	}
	else if (strcmp(argv[i], "-c") == 0)
	{
		compileonly= true;
		++i;
		goto nextarg;
	}
	else if (strcmp(argv[i], "--target") == 0)
	{
		std::string t= argv [++i];
		if (t == "pir")
			target= TargetPir;
		else if (t == "pbc")
			target= TargetPbc;
		else
			throw CompileError("Invalid target");
		compileonly= true;
		++i;
		goto nextarg;
	}

	if (i >= argc)
		throw CompileError("No input file");

	inputname= argv[i++];
	std::ifstream ifs(inputname);
	if (! ifs.is_open() )
		throw CompileError(std::string("Cant't open ") + argv [1]);

	if (outputfile.empty() )
		outputfile= genfile (inputname, target == TargetPbc ? "pbc" : "pir");

	std::ofstream output;
	std::string pirfile = target == TargetPbc ?
		genfile(inputname, "pir") : outputfile;

	output.open(pirfile.c_str());
	if (!output.is_open() )
		throw CompileError(std::string("Cant't open ") + outputfile);

	Winxed winxed;
	Tokenizer tk (ifs, inputname);
	winxed.parse (tk);
	winxed.optimize();
	winxed.emit(output);
	output.close();

	char parrot[]= "parrot;";
	if (!compileonly)
	{
		int n= argc - i;
		char *args[3 + n];
		args[0] = parrot;
		args[1]= strdup(outputfile.c_str());
		for (int a= 0; a < n; ++a)
			args[a + 2]= argv[a + i];
		args[2 + n]= NULL;
		int r= execute(args);
		unlink(outputfile.c_str());
		if (r)
			throw CompileError("Run failed");
	}
	else if (target == TargetPbc)
	{
		char *args[5];
		args[0] = parrot;
		args[1] = strdup("-o");
		args[2]= strdup(outputfile.c_str());
		args[3]= strdup(pirfile.c_str());
		args[4]= NULL;
		int r= execute(args);
		unlink(pirfile.c_str());
		if (r)
			throw CompileError("PBC compile failed");
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

// End of winxed.cpp
