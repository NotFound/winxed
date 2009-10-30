// winxed.cpp
// Revision 30-oct-2009

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

class Emit
{
public:
	Emit (std::ostream &out) : o(out), line(0)
	{ }
	void annotate(const Token &t)
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
	std::ostream & get() { return o; }
	template <typename T>
	friend Emit & operator << (Emit &e, const T &t);
private:
	std::ostream &o;
	std::string file;
	unsigned int line;
};

template <typename T>
Emit & operator << (Emit &e, const T &t)
{
	e.o << t;
	return e;
}

//**********************************************************************

class Namespace
{
public:
	bool isroot() const
	{
		return key.empty();
	}
	Namespace child(std::string name) const
	{
		Namespace newchild;
		newchild.key= key;
		newchild.key.push_back(name);
		return newchild;
	}
	Namespace parent() const
	{
		Namespace newparent;
		newparent.key= key;
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
};

//**********************************************************************

class BlockBase
{
protected:
	virtual char checklocal(const std::string &name) = 0;
public:
	virtual std::string genlocalregister(char type) = 0;
	virtual std::string getbreaklabel() const
	{
		throw std::runtime_error("No break allowed");
	}
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
	std::string getbreaklabel() const
	{
		return bl.getbreaklabel();
	}
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
	std::string getbreaklabel() const;
	char checklocal(const std::string &name);
private:
	unsigned int blockid();
	std::string genlocalregister(char type);
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

std::string SubBlock::getbreaklabel() const
{
	return parent.getbreaklabel();
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
	virtual void emit (Emit &e) = 0;
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
	SubBlock bl;
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
	void emit (Emit &) { };
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
	void emit (Emit &e);

	std::string n;
	Namespace ns;
};

//**********************************************************************

class ExternStatement : public BaseStatement
{
public:
	ExternStatement(Function &fn, Tokenizer &tk);
private:
	void emit (Emit &e)
	{
		e << "load_bytecode '" << n << ".pbc'\n";
	}

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
		n+= t.identifier();
		t= tk.get();
	} while (t.isop('.') );
	RequireOp(';', t);
}

//**********************************************************************

class BaseExpr : public InBlock
{
public:
	BaseExpr(Function &fn, Block &block) : InBlock(block), function(&fn) { }
	BaseExpr(Function &fn, InBlock &block) : InBlock(block), function(&fn) { }
	virtual BaseExpr *optimize();
	virtual void emit(Emit &e, const std::string &result) = 0;
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
	void prepare(Emit &e);
	void emit(Emit &e);
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
	void emit (Emit &e);

	BaseExpr *expr;
};

//**********************************************************************

class CompoundStatement : public BlockStatement
{
public:
	CompoundStatement(Function &fn, Block &parentblock, Tokenizer &tk);
	BaseStatement *optimize();
	void emit (Emit &e);
private:
	std::vector <BaseStatement *> subst;
};

//**********************************************************************

class ValueStatement : public SubStatement
{
public:
	ValueStatement(Function &fn, Block & block);
protected:
	enum ValueType { ValueSimple, ValueArray, ValueFixedArray };
	ValueType vtype;
	std::vector<BaseExpr *> value;
	size_t vsize;
private:
	BaseStatement *optimize();
};

//**********************************************************************

class IntStatement : public ValueStatement
{
public:
	IntStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (Emit &e);
private:
	std::string name;
};

//**********************************************************************

class StringStatement : public ValueStatement
{
public:
	StringStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (Emit &e);
private:
	std::string name;
};

//**********************************************************************

class VarStatement : public ValueStatement
{
public:
	VarStatement(Function &fn, Block & block, Tokenizer &tk, Token startpos);
	void emit (Emit &e);
private:
	const Token start;
	std::string name;
};

//**********************************************************************

class LabelStatement: public SubStatement
{
public:
	LabelStatement(Function &fn, Block &block, const std::string &name);
	void emit (Emit &e);
private:
	std::string labelname;
	std::string codename;
};

class GotoStatement: public SubStatement
{
public:
	GotoStatement(Function &fn, Block &block, Tokenizer &tk, Token startpos);
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
	ReturnStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (Emit &e);
private:
	ArgumentList *values;
};

//**********************************************************************

class YieldStatement : public SubStatement
{
public:
	YieldStatement(Function &fn, Block & block, Tokenizer &tk);
	void emit (Emit &e);
private:
	ArgumentList *values;
};

//**********************************************************************

class AssignStatement : public SubStatement
{
public:
	AssignStatement(Function &fn, Block & block,
		Tokenizer &tk, const Token &name);
	BaseStatement *optimize();
	void emit (Emit &e);
private:
	const Token tname;
	std::string content;
	BaseExpr *st;
};

//**********************************************************************

class AssignToStatement : public SubStatement
{
public:
	AssignToStatement(Function &fn, Block & block,
		Tokenizer &tk, const Token &name);
	void emit (Emit &e);
private:
	const Token tname;
	std::string content;
	BaseExpr *st;
};

//**********************************************************************

class AttributeAssignStatement : public SubStatement
{
public:
	AttributeAssignStatement(Function &fn, Block &block,
		Tokenizer &tk, const Token &object, const Token &name);
private:
	void emit (Emit &e);
private:
	const Token tobject;
	const Token tname;
	BaseExpr *st;
};

//**********************************************************************

class Condition;

//**********************************************************************

class BreakStatement : public SubStatement
{
public:
	BreakStatement(Function &fn, Block &block, Tokenizer &tk) :
		SubStatement(fn, block)
	{
		ExpectOp(';', tk);
	}
private:
	void emit (Emit &e)
	{
		e << "goto " << bl.getbreaklabel() << " # break\n";
	}
};

class SwitchStatement : public BlockStatement
{
public:
	SwitchStatement(Function &fn, Block &block, Tokenizer &tk);
private:
	BaseStatement *optimize();
	std::string getbreaklabel() const;
	void emit (Emit &e);
	BaseExpr *condition;
	std::string breaklabel;
	std::vector<BaseExpr *> casevalue;
	std::vector<std::vector<BaseStatement *> > casest;
	std::vector<BaseStatement *> defaultst;
};

//**********************************************************************

class IfStatement : public BlockStatement
{
public:
	IfStatement(Function &fn, Block &block, Tokenizer &tk);
private:
	BaseStatement *optimize();
	void emit (Emit &e);
	Condition *condition;
	BaseStatement *st;
	BaseStatement *stelse;
};

//**********************************************************************

class WhileStatement : public BlockStatement
{
public:
	WhileStatement(Function &fn, Block &block, Tokenizer &tk);
private:
	BaseStatement *optimize();
	std::string getbreaklabel() const;
	void emit (Emit &e);
	Condition *condition;
	BaseStatement *st;
	std::string labelend;
};

//**********************************************************************

class ForStatement : public BlockStatement
{
public:
	ForStatement(Function &fn, Block &block, Tokenizer &tk);
private:
	void emit (Emit &e);
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
	void emit (Emit &e);
	Token pos;
	BaseExpr * excep;
};

//**********************************************************************

class TryStatement : public BlockStatement
{
public:
	TryStatement(Function &fn, Block &block, Tokenizer &tk, Token t);
private:
	void emit (Emit &e);
	Token start;
	BaseStatement *stry;
	BaseStatement *scatch;
	std::string exname;
};

//**********************************************************************

class FunctionAttributes
{
public:
	FunctionAttributes(Tokenizer &tk, const Namespace &)
	{
		Token t= tk.get();
		if (! t.isop('[') )
		{
			tk.unget(t);
		}
		else
		{
			do {
				t= tk.get();
				if (! t.isidentifier())
					throw Expected("Attribute name", t);
				attributes.push_back(t.identifier());
				t= tk.get();
			} while (t.isop(','));
			RequireOp(']', t);
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

class Function : protected FunctionAttributes, public FunctionBlock
{
public:
	Function(Tokenizer &tk,
		const Namespace & ns_a, const std::string &funcname);
	std::string getname() const { return name; }
	Namespace getnamespace() const { return ns; }
	void optimize();
	virtual void emit (Emit &e);
	void local(std::string name);
	bool islocal(std::string name);
	virtual void emitparams (Emit &e);
	virtual void emitbody (Emit &e);
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
	if (t.iskeyword("extern"))
	{
		return new ExternStatement(fn, tk);
	}
	else
	{
		Namespace ns;
		std::string name = t.identifier();
		while ((t= tk.get()).isop('.') )
		{
			ns = ns.child(name);
			t= tk.get();
			name = t.identifier();
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
	if (t.iskeyword("using"))
		return parseUsing(fn, tk);

	if (t.iskeyword("int"))
		return new IntStatement(fn, block, tk);
	if (t.iskeyword("string"))
		return new StringStatement(fn, block, tk);
	if (t.iskeyword("var"))
		return new VarStatement(fn, block, tk, t);

	if (t.iskeyword("return"))
		return new ReturnStatement(fn, block, tk);
	if (t.iskeyword("yield"))
		return new YieldStatement(fn, block, tk);
	if (t.iskeyword("goto"))
		return new GotoStatement(fn, block, tk, t);
	if (t.iskeyword("break"))
		return new BreakStatement(fn, block, tk);
	if (t.iskeyword("if"))
		return new IfStatement(fn, block, tk);
	if (t.iskeyword("switch"))
		return new SwitchStatement(fn, block, tk);
	if (t.iskeyword("while"))
		return new WhileStatement(fn, block, tk);
	if (t.iskeyword("for"))
		return new ForStatement(fn, block, tk);
	if (t.iskeyword("throw"))
		return new ThrowStatement(fn, block, tk, t);
	if (t.iskeyword("try"))
		return new TryStatement(fn, block, tk, t);

	if (t.isidentifier() )
	{
		Token t2= tk.get();
		if (t2.isop('='))
			return new AssignStatement(fn, block, tk, t);
		if (t2.isop("=:"))
			return new AssignToStatement(fn, block, tk, t);
		else if (t2.isop(':'))
			return new LabelStatement(fn, block, t.identifier());
		else if (t2.isop('.'))
		{
			Token t3= tk.get();
			Token t4= tk.get();
			if (t4.isop('='))
				return new AttributeAssignStatement(fn, block, tk, t, t3);
			else
			{
				tk.unget(t4);
				tk.unget(t3);
				tk.unget(t2);
				tk.unget(t);
				return new ExprStatement(fn, block, tk);
			}
		}
		else
		{
			tk.unget(t2);
			tk.unget(t);
			return new ExprStatement(fn, block, tk);
		}
	}
	else
	{
		tk.unget(t);
		return new ExprStatement(fn, block, tk);
	}
}

//**********************************************************************

LabelStatement::LabelStatement(Function &fn, Block &block, const std::string &name) :
	SubStatement(fn, block),
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

GotoStatement::GotoStatement(Function &fn, Block &block, Tokenizer &tk, Token startpos) :
	SubStatement(fn, block),
	start(startpos),
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

void ArgumentList::prepare(Emit &e)
{
	for (size_t i= 0; i < args.size(); ++i)
		args[i]= args[i]->optimize();
	for (size_t i= 0; i < args.size(); ++i)
	{
		if (! args[i]->issimple() )
		{
			std::string reg= genlocalregister('P');
			args[i]->emit(e, reg);
			argregs.push_back(reg);
		}
		else
		{
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

class SimpleExpr : public BaseExpr
{
public:
	SimpleExpr(Function &fn, Block &block, Token token) :
		BaseExpr(fn, block), t(token)
	{ }
	SimpleExpr(Function &fn, InBlock &block, Token token) :
		BaseExpr(fn, block), t(token)
	{ }
	void emit(Emit &e, const std::string &result);
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

void SimpleExpr::emit(Emit &e, const std::string &result)
{
	if (!result.empty() )
		e << result << " = ";
	if (isliteralstring())
		e << t.pirliteralstring();
	else if (isliteralinteger())
		e << getintegervalue();
	else
		e << t.str();
	if (!result.empty() )
		e << '\n';
}

bool SimpleExpr::isidentifier() const
{
	return t.isidentifier();
}

std::string SimpleExpr::getidentifier() const
{
	return t.identifier();
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
	return t.getinteger();
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

class OpUnaryMinusExpr : public BaseExpr
{
public:
	OpUnaryMinusExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
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
			oss << - n;
			Token newt= Token(TokenTInteger, oss.str(), start.linenum(), start.file());
			return new SimpleExpr(*function, *this, newt);
		}
		return this;
	}
	void emit(Emit &e, const std::string &result)
	{
		std::string arg= genlocalregister('I');
		expr->emit(e, arg);
		std::string r= result.empty() ? genlocalregister('I') : result;
		e.annotate(start);
		e << r << " = neg " << arg;
		if (! result.empty() )
			e << '\n';
	}
	Token start;
	BaseExpr * expr;
};

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
	bool isinteger () const { return true; }
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
	void emit(Emit &e, const std::string &result)
	{
		std::string arg= genlocalregister(expr->isinteger() ? 'I' : 'P');
		expr->emit(e, arg);
		std::string r= result.empty() ?
			genlocalregister('I') :
			result;
		e.annotate(start);
		if (expr->isinteger())
			e << "not ";
		else
			e << "isfalse ";
		e << r << ", " << arg;
		if (! result.empty() )
			e << '\n';
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
	void annotate(Emit &e)
	{
		e.annotate(start);
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
	OpPreDecExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		IncDecOp(fn, block, t, subexpr)
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
	OpPostIncExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		IncDecOp(fn, block, t, subexpr)
	{
	}
private:
	void emit(Emit &e, const std::string &result)
	{
		std::string var= getvar();
		std::string reg= genlocalregister('I');
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
	OpPostDecExpr(Function &fn, Block &block, Token t, BaseExpr *subexpr) :
		IncDecOp(fn, block, t, subexpr)
	{
	}
private:
	void emit(Emit &e, const std::string &result)
	{
		std::string var= getvar();
		std::string reg= genlocalregister('I');
		annotate(e);
		e << reg << " = " << var << "\n"
			"dec " << var << '\n';
		if (! result.empty())
			e << result << " = " << reg << '\n';
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

class OpEqualExpr : public CompareOpExpr
{
public:
	OpEqualExpr(Function &fn, Block &block,
			Token t, BaseExpr *first, BaseExpr *second) :
		CompareOpExpr(fn, block, t, first, second)
	{ }
private:
	void emit(Emit &e, const std::string &result);
};

void OpEqualExpr::emit(Emit &e, const std::string &result)
{
	std::string res= genlocalregister('I');
	if (isstring())
	{
		std::string op1= genlocalregister('S');
		std::string op2= genlocalregister('S');
		efirst->emit(e, op1);
		esecond->emit(e, op2);
		e << res << " = iseq " << op1 << " , " << op2;
	}
	else if (efirst->isinteger() && esecond->isinteger())
	{
		std::string op1= genlocalregister('I');
		std::string op2= genlocalregister('I');
		efirst->emit(e, op1);
		esecond->emit(e, op2);
		e << res << " = iseq " << op1 << " , " << op2;
	}
	else
	{
		std::string op1= genlocalregister('P');
		std::string op2= genlocalregister('P');
		if (efirst->isinteger() )
		{
			std::string aux= genlocalregister('I');
			efirst->emit(e, aux);
			e << op1 << " = box " << aux << '\n';
		}
		else if (efirst->isstring() )
		{
			std::string aux= genlocalregister('S');
			efirst->emit(e, aux);
			e << op1 << " = box " << aux << '\n';
		}
		else
			efirst->emit(e, op1);
		if (esecond->isinteger() )
		{
			std::string aux= genlocalregister('I');
			esecond->emit(e, aux);
			e << op2 << " = box " << aux << '\n';
		}
		else if (esecond->isstring() )
		{
			std::string aux= genlocalregister('S');
			esecond->emit(e, aux);
			e << op2 << " = box " << aux << '\n';
		}
		else
			esecond->emit(e, op2);
		e << res << " = iseq " << op1 << " , " << op2;
	}
	if (!result.empty())
		e << '\n' << result << " = " << res << '\n';
}

//**********************************************************************

class OpNotEqualExpr : public CompareOpExpr
{
public:
	OpNotEqualExpr(Function &fn, Block &block,
			Token t, BaseExpr *first, BaseExpr *second) :
		CompareOpExpr(fn, block, t, first, second)
	{ }
private:
	void emit(Emit &e, const std::string &result);
};

void OpNotEqualExpr::emit(Emit &e, const std::string &result)
{
	std::string res= function->genregister('I');
	if (isstring())
	{
		std::string op1= function->genregister('S');
		std::string op2= function->genregister('S');
		efirst->emit(e, op1);
		esecond->emit(e, op2);
		e << res << " = isne " << op1 << " , " << op2;
	}
	else if (efirst->isinteger() && esecond->isinteger())
	{
		std::string op1= function->genregister('I');
		std::string op2= function->genregister('I');
		efirst->emit(e, op1);
		esecond->emit(e, op2);
		e << res << " = isne " << op1 << " , " << op2;
	}
	else
	{
		std::string op1= function->genregister('P');
		std::string op2= function->genregister('P');
		if (efirst->isinteger() )
		{
			std::string aux= genlocalregister('I');
			efirst->emit(e, aux);
			e << op1 << " = box " << aux << '\n';
		}
		else if (efirst->isstring() )
		{
			std::string aux= genlocalregister('S');
			efirst->emit(e, aux);
			e << op1 << " = box " << aux << '\n';
		}
		else
			efirst->emit(e, op1);
		if (esecond->isinteger() )
		{
			std::string aux= genlocalregister('I');
			esecond->emit(e, aux);
			e << op2 << " = box " << aux << '\n';
		}
		else if (esecond->isstring() )
		{
			std::string aux= genlocalregister('S');
			esecond->emit(e, aux);
			e << op2 << " = box " << aux << '\n';
		}
		else
			esecond->emit(e, op2);
		e << res << " = isne " << op1 << " , " << op2;
	}
	if (!result.empty())
		e << '\n' << result << " = " << res << '\n';
}

//**********************************************************************

class OpLessExpr : public CompareOpExpr
{
public:
	OpLessExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(Emit &e, const std::string &result);
};

OpLessExpr::OpLessExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CompareOpExpr(fn, block, t, first, second)
{
}

void OpLessExpr::emit(Emit &e, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(e, op1);
	esecond->emit(e, op2);
	e << res << " = islt " << op1 << " , " << op2;
	if (!result.empty())
		e << '\n';
}

//**********************************************************************

class OpGreaterExpr : public CompareOpExpr
{
public:
	OpGreaterExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(Emit &e, const std::string &result);
};

OpGreaterExpr::OpGreaterExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CompareOpExpr(fn, block, t, first, second)
{
}

void OpGreaterExpr::emit(Emit &e, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(e, op1);
	esecond->emit(e, op2);
	e << res << " = isgt " << op1 << " , " << op2;
	if (!result.empty())
		e << '\n';
}

//**********************************************************************

class OpAddToExpr : public CommonBinOpExpr
{
public:
	OpAddToExpr(Function &fn, Block &block,
			Token t, BaseExpr *first, BaseExpr *second) :
		CommonBinOpExpr(fn, block, t, first, second)
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
				std::string reg= genlocalregister('S');
				esecond->emit(e, reg);
				e << "concat " << efirst->getidentifier() <<
					", " << reg << '\n';
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

class OpAddExpr : public CommonBinOpExpr
{
public:
	OpAddExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	BaseExpr *optimize();
	void emit(Emit &e, const std::string &result);
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

			int n1= t1.getinteger();
			int n2= t2.getinteger();
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

void OpAddExpr::emit(Emit &e, const std::string &result)
{
	// Quick hack
	if (isstring())
	{
		std::string res= result.empty() ? genlocalregister('S') : result;
		std::string op1= genlocalregister('S');
		std::string op2= genlocalregister('S');
		efirst->emit(e, op1);
		esecond->emit(e, op2);
		e << res << " = concat " << op1 << " , " << op2;
	}
	else if (isinteger())
	{
		std::string res= result.empty() ? genlocalregister('I') : result;
		std::string op1= genlocalregister('I');
		std::string op2= genlocalregister('I');
		efirst->emit(e, op1);
		esecond->emit(e, op2);
		e << res << " = " << op1 << " + " << op2;
	}
	else
	{
		std::string res= result.empty() ? genlocalregister('P') : result;
		std::string op1= genlocalregister('P');
		std::string op2= genlocalregister('P');
		switch (efirst->checkresult() )
		{
		case 'I':
			e << op1 << " = new 'Integer'\n";
			break;
		case 'S':
			e << op1 << " = new 'String'\n";
			break;
		default:
			e << "null " << op1 << '\n';
		}
		switch (esecond->checkresult() )
		{
		case 'I':
			e << op2 << " = new 'Integer'\n";
			break;
		case 'S':
			e << op2 << " = new 'String'\n";
			break;
		default:
			e << "null " << op2 << '\n';
		}
		efirst->emit(e, op1);
		esecond->emit(e, op2);
		//e << res << " = new 'Integer'\n";
		e << res << " = " << op1 << " + " << op2;
	}
	if (!result.empty())
		e << '\n';
}

//**********************************************************************

class OpSubExpr : public CommonBinOpExpr
{
public:
	OpSubExpr(Function &f, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	BaseExpr *optimize();
	void emit(Emit &e, const std::string &result);
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
			//std::cerr << "OpSubExpr::optimize int\n";

			int n1= t1.getinteger();
			int n2= t2.getinteger();

			//std::cerr << n1 << " " << n2 << '\n';

			std::ostringstream oss;
			oss << n1 - n2;
			Token newt= Token(TokenTInteger, oss.str(), t1.linenum(), t1.file());
			return new SimpleExpr(*function, *this, newt);
		}
	}
	return this;
}

void OpSubExpr::emit(Emit &e, const std::string &result)
{
	std::string res= result.empty() ? genlocalregister('I') : result;
	std::string op1= genlocalregister('I');
	std::string op2= genlocalregister('I');
	efirst->emit(e, op1);
	esecond->emit(e, op2);
	e << res << " = " << op1 << " - " << op2;
	if (!result.empty())
		e << '\n';
}

//**********************************************************************

class OpBoolOrExpr : public BaseExpr
{
public:
	OpBoolOrExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	bool isinteger() const { return true; }
	void emit(Emit &e, const std::string &result);
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

void OpBoolOrExpr::emit(Emit &e, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(e, op1);
	esecond->emit(e, op2);
	e << res << " = or " << op1 << ", " << op2;
	if (!result.empty())
		e << '\n';
}

//**********************************************************************

class OpBinAndExpr : public CommonBinOpExpr
{
public:
	OpBinAndExpr(Function &fn, Block &block,
			Token t, BaseExpr *first, BaseExpr *second) :
		CommonBinOpExpr(fn, block, t, first, second)
	{
	}
private:
	bool isinteger() const { return true; }
	void emit(Emit &e, const std::string &result)
	{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
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
	OpBinOrExpr(Function &fn, Block &block,
			Token t, BaseExpr *first, BaseExpr *second) :
		CommonBinOpExpr(fn, block, t, first, second)
	{
	}
private:
	bool isinteger() const { return true; }
	void emit(Emit &e, const std::string &result)
	{
		std::string res= result.empty() ? function->genregister('I') : result;
		std::string op1= function->genregister('I');
		std::string op2= function->genregister('I');
		efirst->emit(e, op1);
		esecond->emit(e, op2);
		e << res << " = bor " << op1 << ", " << op2;
		if (!result.empty())
			e << '\n';
	}
};

//**********************************************************************

class OpBoolAndExpr : public BaseExpr
{
public:
	OpBoolAndExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	bool isinteger() const { return true; }
	void emit(Emit &e, const std::string &result);
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

void OpBoolAndExpr::emit(Emit &e, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(e, op1);
	esecond->emit(e, op2);
	e << res << " = and " << op1 << ", " << op2;
	if (!result.empty())
		e << '\n';
}

//**********************************************************************

class OpMulExpr : public CommonBinOpExpr
{
public:
	OpMulExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(Emit &e, const std::string &result);
};

OpMulExpr::OpMulExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CommonBinOpExpr(fn, block, t, first, second)
{
}

void OpMulExpr::emit(Emit &e, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(e, op1);
	esecond->emit(e, op2);
	e << res << " = " << op1 << " * " << op2;
	if (!result.empty())
		e << '\n';
}

//**********************************************************************

class OpDivExpr : public CommonBinOpExpr
{
public:
	OpDivExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second);
private:
	void emit(Emit &e, const std::string &result);
};

OpDivExpr::OpDivExpr(Function &fn, Block &block,
		Token t, BaseExpr *first, BaseExpr *second) :
	CommonBinOpExpr(fn, block, t, first, second)
{
}

void OpDivExpr::emit(Emit &e, const std::string &result)
{
	std::string res= result.empty() ? function->genregister('I') : result;
	std::string op1= function->genregister('I');
	std::string op2= function->genregister('I');
	efirst->emit(e, op1);
	esecond->emit(e, op2);
	e << res << " = " << op1 << " / " << op2;
	if (!result.empty())
		e << '\n';
}

//**********************************************************************

class ArrayExpr : public BaseExpr
{
public:
	ArrayExpr(Function &fn, Block &block, Tokenizer &tk);
private:
	BaseExpr *optimize()
	{
		for (size_t i= 0; i < elems.size(); ++i)
			elems[i]= elems[i]->optimize();
		return this;
	}
	void emit(Emit &e, const std::string &result);
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

void ArrayExpr::emit(Emit &e, const std::string &result)
{
	std::string reg = function->genregister('P');
	e << reg << " = root_new ['parrot';'ResizablePMCArray']\n";
	for (size_t i= 0; i < elems.size(); ++i)
	{
		BaseExpr *elem= elems[i];
		std::string el = function->genregister('P');
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
	HashExpr(Function &fn, Block &block, Tokenizer &tk);
private:
	BaseExpr *optimize()
	{
		for (std::map<std::string, BaseExpr *>::iterator
			it= elems.begin();
			it != elems.end();
			++it)
		{
			it->second= it->second->optimize();
		}
		return this;
	}
	void emit(Emit &e, const std::string &result);
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
			RequireOp (':', t);
			BaseExpr *value= parseExpr(fn, block, tk);
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
	EmitItem(Emit &em, Function & function, HashExpr &block,
			const std::string reg) :
		e(&em), fn(function), bl(block), r(reg) { }
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
				reg = fn.genregister('P');
				(*e) << "get_hll_global " << reg << ", '" <<
					id << "'\n";
			}
		}
		else if (value->isinteger())
		{
			reg = fn.genregister('I');
			value->emit(*e, reg);
		}
		else if (value->isstring())
		{
			reg = fn.genregister('S');
			value->emit(*e, reg);
		}
		else
		{
			reg = fn.genregister('P');
			value->emit(*e, reg);
		}
		(*e) << r << " [" << elem.first << "] = " << reg << '\n';
	}
private:
	Emit *e;
	Function &fn;
	HashExpr &bl;
	std::string r;
};

void HashExpr::emit(Emit &e, const std::string &result)
{
	std::string reg = function->genregister('P');
	e << reg << " = root_new ['parrot';'Hash']\n";
	std::for_each(elems.begin(), elems.end(), EmitItem(e, *function, *this, reg) );
	if (!result.empty())
		e << result << " = " << reg << '\n';
}

//**********************************************************************

class FunctionCallExpr : public BaseExpr
{
public:
	FunctionCallExpr(Function &fn, Block &block,
		Tokenizer &tk, Token tname);
	BaseExpr *optimize();
private:
	void emit(Emit &e, const std::string &result);
	Token start;
	std::string name;
	std::vector <BaseExpr *> args;
};

FunctionCallExpr::FunctionCallExpr(Function &fn, Block &block,
		Tokenizer &tk, Token tname) :
	BaseExpr(fn, block),
	start(tname),
	name(tname.identifier())
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

void FunctionCallExpr::emit(Emit &e, const std::string &result)
{
	//std::cerr << "FunctionCallExpr::emit\n";

	std::vector<std::string> argregs;
	for (size_t i= 0; i < args.size(); ++i)
	{
		BaseExpr &arg= * args[i];
		if (! arg.issimple() )
		{
			std::string reg= function->genregister(arg.isinteger() ? 'I' : 'P');
			arg.emit(e, reg);
			argregs.push_back(reg);
		}
		else
		{
			argregs.push_back(std::string());
		}
	}

	e.annotate(start);

	if (!result.empty() )
		e << result << " = ";

	std::string quote(function->islocal(name) ? "" : "'");

	e << quote << name << quote << '(';
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
			//args[i]->emit(e, std::string());
		}
	}
	e << ')';
	if (!result.empty() )
		e << '\n';
}

//**********************************************************************

class MethodCallExpr : public BaseExpr
{
public:
	MethodCallExpr(Function &fn, Block &block,
		Tokenizer &tk, Token tobj, Token tmeth);
private:
	BaseExpr *optimize();
	void emit(Emit &e, const std::string &result);
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

void MethodCallExpr::emit(Emit &e, const std::string &result)
{
	std::vector<std::string> argregs;
	for (size_t i= 0; i < args.size(); ++i)
	{
		BaseExpr &arg= * args[i];
		if (! arg.issimple() )
		{
			std::string reg= function->genregister(arg.isinteger() ? 'I' : 'P');
			arg.emit(e, reg);
			argregs.push_back(reg);
		}
		else
			argregs.push_back(std::string());
	}

	e.annotate(object);

	if (!result.empty() )
		e << result << " = ";

	e << object.identifier() << ".'" << method.identifier() << "'(";

	for (size_t i= 0; i < args.size(); ++i)
	{
		if (i > 0)
			e << ", ";
		if (argregs[i].empty() )
		{
			args[i]->emit(e, std::string());
		}
		else
			e << argregs[i];
	}
	e << ')';
	if (!result.empty() )
		e << '\n';
}

//**********************************************************************

class AttributeExpr : public BaseExpr
{
public:
	AttributeExpr(Function &fn, Block &block, Token tobj, Token tname) :
		BaseExpr(fn, block),
		obj(tobj),
		name(tname)
	{
	}
private:
	void emit(Emit &e, const std::string &result)
	{
		std::string r= genlocalregister('P');
		e << "getattribute " << r << ", " << obj.identifier() <<
			", '" << name.identifier() << "'\n"
			"set " << result << ", " << r << '\n';
	}
	const Token obj;
	const Token name;
};

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
	void emit(Emit &e, const std::string &result)
	{
		if (! checked.isliteralstring())
			throw CompileError("Unimplemented", checked);
		std::string reg= genlocalregister('P');
		obj->emit(e, reg);
		e.annotate(start);

		if (result.empty() ) {
			std::string regcheck = genlocalregister('I');
			e << regcheck << " = isa " << reg << ", '" << checked.str() << "'\n";
		}
		else
		{
			e << result << " = isa " << reg << ", '" << checked.str() << "'\n";
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
	void emit(Emit &e, const std::string &result);
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
		value = "root_new ['parrot'; " + t.pirliteralstring() + " ]";
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
		std::string name = t.identifier();
		std::vector<std::string> prefix;
		while ((t= tk.get()).isop('.') )
		{
			t= tk.get();
			prefix.push_back(name);
			name = t.identifier();
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

void NewExpr::emit(Emit &e, const std::string &result)
{
	std::string reg;
	if (init)
	{
		reg= function->genregister('P');
		init->emit(e, reg);
	}

	if (! result.empty())
	{
		e << result << " = " << value;
		if (! reg.empty())
			e << ", " << reg;
		e << '\n';
	}
	else
		e << value;
}

//**********************************************************************

class IndexExpr : public BaseExpr
{
public:
	IndexExpr(Function &fn, Block &block, Tokenizer &tk, Token tname);
private:
	void emit(Emit &e, const std::string &result);
	std::string name;
	BaseExpr *arg;
};

IndexExpr::IndexExpr(Function &fn, Block &block, Tokenizer &tk, Token tname) :
	BaseExpr(fn, block), name(tname.identifier()), arg(0)
{
	arg = parseExpr(fn, block, tk);
	Token t= tk.get();
	RequireOp (']', t);
}

void IndexExpr::emit(Emit &e, const std::string &result)
{
	std::string reg;
	if (! arg->issimple() )
	{
		reg= function->genregister('P');
		arg->emit(e, reg);
	}
	if (!result.empty() )
		e << result << " = ";
	e << name << '[';
	if (arg->issimple() )
		arg->emit(e, std::string());
	else
		e << reg;
	e << ']';
	if (!result.empty() )
		e << '\n';
}

//**********************************************************************

BaseExpr * parseDotted(Function &fn, Block &block, Tokenizer &tk, Token t)
{
	Token tname= tk.get();
	Token tpar= tk.get();
	if (tpar.isop('('))
	{
		return new MethodCallExpr(fn, block, tk, t, tname);
	}
	else
	{
		tk.unget(tpar);
		return new AttributeExpr(fn, block, t, tname);
	}
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
	else if (t.iskeyword("new"))
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
	if (t.isop('-') )
	{
		BaseExpr *subexpr= parseExpr_4(fn, block, tk);
		return new OpUnaryMinusExpr(fn, block, t, subexpr);
	}
	else if (t.isop('!') )
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
	Token t;
	while ((t= tk.get()).isop('*') || t.isop('/'))
	{
		BaseExpr *subexpr2= parseExpr_4(fn, block, tk);
		if (t.isop('*'))
			subexpr= new OpMulExpr(fn, block, t, subexpr, subexpr2);
		else
			subexpr= new OpDivExpr(fn, block, t, subexpr, subexpr2);
	}
	tk.unget(t);
	return subexpr;
}

BaseExpr * parseExpr_6(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_5(fn, block, tk);
	Token t;
	while ((t= tk.get()).isop('+') || t.isop('-'))
	{
		BaseExpr *subexpr2= parseExpr_5(fn, block, tk);
		if (t.isop('+'))
			subexpr= new OpAddExpr(fn, block, t, subexpr, subexpr2);
		else
			subexpr= new OpSubExpr(fn, block, t, subexpr, subexpr2);
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
	else if (t.iskeyword("instanceof"))
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

BaseExpr * parseExpr_10(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_9(fn, block, tk);
	Token t;
	while ((t= tk.get()).isop('&'))
	{
		BaseExpr *subexpr2= parseExpr_9(fn, block, tk);
		subexpr= new OpBinAndExpr(fn, block, t, subexpr, subexpr2);
	}
	tk.unget(t);
	return subexpr;
}

BaseExpr * parseExpr_12(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_10(fn, block, tk);
	Token t;
	while ((t= tk.get()).isop('|'))
	{
		BaseExpr *subexpr2= parseExpr_10(fn, block, tk);
		subexpr= new OpBinOrExpr(fn, block, t, subexpr, subexpr2);
	}
	tk.unget(t);
	return subexpr;
}

BaseExpr * parseExpr_13(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_12(fn, block, tk);
	Token t;
	while ((t= tk.get()).isop("&&"))
	{
		BaseExpr *subexpr2= parseExpr_12(fn, block, tk);
		subexpr= new OpBoolAndExpr(fn, block, t, subexpr, subexpr2);
	}
	tk.unget(t);
	return subexpr;
}

BaseExpr * parseExpr_14(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_13(fn, block, tk);
	Token t;
	while ((t= tk.get()).isop("||"))
	{
		BaseExpr *subexpr2= parseExpr_13(fn, block, tk);
		subexpr= new OpBoolOrExpr(fn, block, t, subexpr, subexpr2);
	}
	tk.unget(t);
	return subexpr;
}

BaseExpr * parseExpr_16(Function &fn, Block &block, Tokenizer &tk)
{
	BaseExpr *subexpr= parseExpr_14(fn, block, tk);
	Token t;
	while ((t= tk.get()).isop("+="))
	{
		BaseExpr *subexpr2= parseExpr_14(fn, block, tk);
		subexpr= new OpAddToExpr(fn, block, t, subexpr, subexpr2);
	}
	tk.unget(t);
	return subexpr;
}

BaseExpr * parseExpr(Function &fn, Block &block, Tokenizer &tk)
{
	return parseExpr_16(fn, block, tk);
}

//**********************************************************************

ExprStatement::ExprStatement(Function &fn, Block &parentblock, Tokenizer &tk) :
	BaseStatement (fn)
{
	//std::cerr << "ExprStatement\n";
	expr= parseExpr(fn, parentblock, tk);
	ExpectOp(';', tk);
	//std::cerr << "ExprStatement end\n";
}

BaseStatement *ExprStatement::optimize ()
{
	expr= expr->optimize();
	return this;
}

void ExprStatement::emit (Emit &e)
{
	expr->emit(e, std::string());
	e << '\n';
}

//**********************************************************************

ValueStatement::ValueStatement(Function &fn, Block & block) :
	SubStatement (fn, block),
	vtype(ValueSimple),
	vsize(0)
{
}

BaseStatement *ValueStatement::optimize()
{
	for (size_t i= 0; i < value.size(); ++i)
		value[i]= value[i]->optimize();
	return this;
}

//**********************************************************************

IntStatement::IntStatement(Function &fn, Block &block, Tokenizer &tk) :
	ValueStatement (fn, block)
{
	Token t= tk.get();
	name= t.identifier();
	function->genlocal(name, 'I');
	t= tk.get();
	if (t.isop('['))
	{
		t= tk.get();
		if (t.isop(']') )
		{
			vtype= ValueArray;
			t= tk.get();
			if (t.isop('='))
			{
				ExpectOp('[', tk);
				do
				{
					value.push_back(parseExpr(*function, block, tk));
					t= tk.get();
				} while (t.isop(','));
				RequireOp(']', t);
				t= tk.get();
			}
		}
		else if (t.isinteger() )
		{
			vtype= ValueFixedArray;
			vsize= t.getinteger();
			ExpectOp(']', tk);
			t= tk.get();
			if (t.isop('='))
			{
				ExpectOp('[', tk);
				do
				{
					value.push_back(parseExpr(*function, block, tk));
					t= tk.get();
				} while (t.isop(','));
				RequireOp(']', t);
				t= tk.get();
			}
		}
		else
			throw Expected("size initializer", t);
	}
	else if (t.isop('='))
	{
		value.push_back(parseExpr(*function, block, tk));
		t= tk.get();
	}
	RequireOp (';', t);
}

void IntStatement::emit (Emit &e)
{
	switch (vtype)
	{
	case ValueSimple:
		e << ".local int " << name << '\n';
		if (value.size() == 1)
			value[0]->emit(e, name);
		break;
	case ValueArray:
		e << ".local pmc " << name << "\n"
			"root_new " << name << ", ['parrot'; 'ResizableIntegerArray' ]\n";
		if (value.size() > 0)
		{
			std::string reg= bl.genregister('I');
			for (size_t i= 0; i < value.size(); ++i)
			{
				value[i]->emit(e, reg);
				e << name << '[' << i << "] = " << reg <<
					"\nnull " << reg << '\n';
			}
		}
		break;
	case ValueFixedArray:
		e << ".local pmc " << name << "\n"
			"root_new " << name << ", ['parrot'; 'FixedIntegerArray' ]\n" <<
			name << " = " << vsize << '\n';
		if (value.size() > 0)
		{
			std::string reg= bl.genregister('I');
			for (size_t i= 0; i < value.size(); ++i)
			{
				value[i]->emit(e, reg);
				e << name << '[' << i << "] = " << reg <<
					"\nnull " << reg << '\n';
			}
		}
		break;
	default:
		throw InternalError("Unexpected initializer type");
	}
}

//**********************************************************************

StringStatement::StringStatement(Function &fn, Block & block, Tokenizer &tk) :
	ValueStatement (fn, block)
{
	Token t= tk.get();
	name= t.identifier();
	function->genlocal(name, 'S');
	t= tk.get();
	if (t.isop('['))
	{
		t= tk.get();
		if (t.isop(']') )
		{
			vtype= ValueArray;
			t= tk.get();
			if (t.isop('='))
			{
				ExpectOp('[', tk);
				do
				{
					value.push_back(parseExpr(*function, block, tk));
					t= tk.get();
				} while (t.isop(','));
				RequireOp(']', t);
				t= tk.get();
			}
		}
		else if (t.isinteger() )
		{
			vtype= ValueFixedArray;
			vsize= t.getinteger();
			ExpectOp(']', tk);
			t= tk.get();
			if (t.isop('='))
			{
				ExpectOp('[', tk);
				do
				{
					value.push_back(parseExpr(*function, block, tk));
					t= tk.get();
				} while (t.isop(','));
				RequireOp(']', t);
				t= tk.get();
			}
		}
	}
	else if (t.isop('='))
	{
		value.push_back(parseExpr(*function, block, tk));
		t= tk.get();
	}
	RequireOp (';', t);
}

void StringStatement::emit (Emit &e)
{
	switch (vtype)
	{
	case ValueSimple:
		e << ".local string " << name << '\n';
		if (value.size() == 1)
			value[0]->emit(e, name);
		break;
	case ValueArray:
		e << ".local pmc " << name << "\n"
			"root_new " << name << ", ['parrot'; 'ResizableStringArray' ]\n";
		if (value.size() > 0)
		{
			std::string reg= bl.genregister('S');
			for (size_t i= 0; i < value.size(); ++i)
			{
				value[i]->emit(e, reg);
				e << name << '[' << i << "] = " << reg <<
					"\nnull " << reg << '\n';
			}
		}
		break;
	case ValueFixedArray:
		e << ".local pmc " << name << "\n"
			"root_new " << name << ", ['parrot'; 'FixedStringArray' ]\n" <<
			name << " = " << vsize << '\n';
		if (value.size() > 0)
		{
			std::string reg= bl.genregister('S');
			for (size_t i= 0; i < value.size(); ++i)
			{
				value[i]->emit(e, reg);
				e << name << '[' << i << "] = " << reg <<
					"\nnull " << reg << '\n';
			}
		}
		break;
	default:
		throw InternalError("Unexpected initializer type");
	}
}

//**********************************************************************

VarStatement::VarStatement(Function &fn, Block & block, Tokenizer &tk, Token startpos) :
	ValueStatement (fn, block),
	start(startpos)
{
	Token t= tk.get();
	name= t.identifier();
	function->genlocal(name, 'P');
	t= tk.get();
	if (t.isop('='))
	{
		value.push_back(parseExpr(*function, block, tk));
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
		if (value[0]->isinteger())
			e << name << " = root_new ['parrot'; 'Integer']\n";
		else if (value[0]->isstring())
			e << name << " = root_new ['parrot'; 'String']\n";
		value[0]->emit(e, name);
	}
}

//**********************************************************************

UsingStatement::UsingStatement(Function &fn, const std::string & name, const Namespace &nspace) :
	BaseStatement (fn), n(name), ns(nspace)
{
	function->genlocal(n, 'P');
}

void UsingStatement::emit (Emit &e)
{
	e << ".local pmc " << n << '\n' << n <<
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

AssignStatement::AssignStatement(Function &fn, Block & block,
		Tokenizer &tk, const Token &name) :
	SubStatement (fn, block), tname(name), st(0)
{
	//std::cerr << "AssignStatement\n";
	Token t= tk.get();
	if (t.iskeyword("new"))
	{
		st = new NewExpr(fn, block, tk, t);
		return;
	}
	else
	{
		tk.unget(t);
		st = parseExpr(fn, block, tk);
	}
	ExpectOp(';', tk);
	//std::cerr << "AssignStatement end\n";
}

BaseStatement *AssignStatement::optimize()
{
	if (st)
		st= st->optimize();
	return this;
}

void AssignStatement::emit (Emit &e)
{
	std::string varname = tname.identifier();
	if (content.empty() )
	{
		if (st)
		{
			//std::cerr << "AssignStatement::emit\n";

			char type = bl.checklocal(varname);
			switch (type)
			{
			case 'I':
				if (!(st->isinteger() || st->isstring() ))
				{
					std::string r= bl.genregister('P');
					st->emit(e, r);
					e.annotate(tname);
					e << varname << " = " << r << '\n';
				}
				else
					st->emit(e, varname);
				break;
			case 'S':
				if (!(st->isinteger() || st->isstring() ))
				{
					std::string r= bl.genregister('S');
					st->emit(e, r);
					e.annotate(tname);
					e << varname << " = " << r << '\n';
				}
				else
					st->emit(e, varname);
				break;
			default:
				if (st->isinteger() || st->isstring() )
				{
					e.annotate(tname);
					e << varname << " = box ";
					st->emit(e, std::string());
					e << '\n';
				}
				else
					st->emit(e, varname);
			}
		}
	}
	else
	{
		e.annotate(tname);
		e << varname << " = " << content << '\n';
	}
}

//**********************************************************************

AssignToStatement::AssignToStatement(Function &fn, Block & block,
		Tokenizer &tk, const Token &name) :
	SubStatement (fn, block), tname(name), st(0)
{
	//std::cerr << "AssignToStatement\n";
	Token t= tk.get();
	if (t.iskeyword("new"))
	{
		st = new NewExpr(fn, block, tk, t);
		return;
	}
	else
	{
		tk.unget(t);
		st = parseExpr(fn, block, tk);
	}
	ExpectOp(';', tk);
	//std::cerr << "AssignToStatement end\n";
}

void AssignToStatement::emit (Emit &e)
{
	std::string varname = tname.identifier();
	if (content.empty() )
	{
		if (st)
		{
			//std::cerr << "AssignToStatement::emit\n";

			st= st->optimize();
			char type = bl.checklocal(varname);
			switch (type)
			{
			case 'I':
				if (!(st->isinteger() || st->isstring() ))
				{
					std::string r= bl.genregister('P');
					st->emit(e, r);
					e.annotate(tname);
					e << varname << " = " << r << '\n';
				}
				else
					st->emit(e, varname);
				break;
			case 'S':
				if (!(st->isinteger() || st->isstring() ))
				{
					std::string r= bl.genregister('S');
					st->emit(e, r);
					e.annotate(tname);
					e << varname << " = " << r << '\n';
				}
				else
					st->emit(e, varname);
				break;
			default:
				if (st->isinteger() || st->isstring() )
				{
					e.annotate(tname);
					e << "assign " << varname << ", ";
					st->emit(e, std::string());
					e << '\n';
				}
				else
				{
					//st->emit(e, varname);
					e << "assign " << varname << ", ";
					st->emit(e, std::string());
					e << '\n';
				}
			}
		}
	}
	else
	{
		e.annotate(tname);
		e << varname << " = " << content << '\n';
	}
}

//**********************************************************************

AttributeAssignStatement::AttributeAssignStatement(Function &fn, Block & block,
		Tokenizer &tk, const Token &object, const Token &name) :
	SubStatement (fn, block),
	tobject(object),
	tname(name),
	st(0)
{
	Token t= tk.get();
	if (t.iskeyword("new"))
	{
		st = new NewExpr(fn, block, tk, t);
		return;
	}
	else
	{
		tk.unget(t);
		st = parseExpr(fn, block, tk);
	}
	ExpectOp(';', tk);
}

void AttributeAssignStatement::emit (Emit &e)
{
	e.annotate(tname);
	std::string varname = tname.identifier();
	st= st->optimize();

	std::string r= bl.genregister('P');
	const std::string objname= tobject.identifier();
	if (st->isinteger() || st->isstring())
	{
		e << "getattribute " << r << ", " << objname <<
			", '" << varname << "'\n";
		std::string l= function->genlabel();
		e << "unless null " << r << " goto " << l << "\n"
			"new " << r << ", '" <<
				(st->isinteger() ? "Integer" : "String") <<
				"'\n"
			"setattribute "<< objname << ", '" <<
				varname << "', " << r << '\n' <<
			l << ":\n";
		e << "assign " << r << ", ";
		st->emit(e, std::string());
		e << '\n';
	}
	else
	{
		e << "set " << r << ", ";
		st->emit(e, std::string());
		e << "\n"
			"setattribute " << objname << ", '" << varname <<
				"', " << r << '\n';
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

void CompoundStatement::emit (Emit &e)
{
	//std::cerr << "CompoundStatement::emit\n";

	for (size_t i= 0; i < subst.size(); ++i)
		if (subst[i])
			subst[i]->emit(e);
}

//**********************************************************************

ForStatement::ForStatement(Function &fn, Block &block, Tokenizer &tk) :
	BlockStatement (fn, block),
	container(0)
{
	ExpectOp ('(', tk);
	Token t= tk.get();
	varname= t.identifier();
	t= tk.get();
	if (!t.iskeyword("in"))
		throw Expected ("'in'", t);
	container= parseExpr(fn, *this, tk);
	ExpectOp(')', tk);
	st= parseStatement(fn, block, tk);
}

void ForStatement::emit(Emit &e)
{
	std::string label= genlabel();
	std::string l_for = label + "_FOR";
	std::string l_end = label + "_END";

	std::string container_ = function->genregister('P');
	container->emit(e, container_);

	e << ".local pmc iter_" << varname << "\n"
		"iter_" << varname << " = iter " << container_ << "\n"
		"iter_" << varname << " = .ITERATE_FROM_START\n" <<
		l_for << ":\n" <<
		"unless " << "iter_" << varname << " goto " << l_end<< "\n"
		"shift " << varname << ", iter_" << varname << '\n'
		;
	st->emit(e);
	e << "goto " << l_for << '\n' <<
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
		std::string reg= function->genregister('P');
		excep->emit(e, reg);
		e << "throw " << reg << '\n';
	}
}

//**********************************************************************

TryStatement::TryStatement(Function &fn, Block &block, Tokenizer &tk, Token t) :
	BlockStatement (fn, block),
	start(t),
	stry(0), scatch(0)
{
	stry = parseStatement (fn, block, tk);
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
	scatch= parseStatement (fn, block, tk);
}

void TryStatement::emit (Emit &e)
{
	e.annotate(start);
	std::string label= genlabel();
	std::string handler = label + "_HANDLER";
	std::string pasthandler = label + "_PAST_HANDLER";
	std::string except = exname.empty() ?
		function->genregister('P') :
		exname;

	e << "push_eh " << handler << '\n';
	stry->emit(e);
	e <<
		"pop_eh\n"
		"goto " << pasthandler << '\n' <<
		handler << ":\n";
	if (!exname.empty() )
	{
		function->genlocal(exname, 'P');
		e << ".local pmc " << exname << '\n';
	}
	e <<
		".get_results(" << except << ")\n"
		"pop_eh\n"
		;

	scatch->emit(e);
	e << pasthandler << ":\n";
}

//**********************************************************************

class Condition : public InBlock
{
public:
	Condition (Function &fn, Block &block, Tokenizer &tk);
	Condition *optimize();
	bool issimple() const;
	bool isinteger() const { return expr->isinteger(); }
	bool isstring() const { return expr->isstring(); }
	bool isliteralinteger() const;
	std::string value() const;
	std::string emit(Emit &e);
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
			int n = dynamic_cast<SimpleExpr &>(*expr).getintegervalue();;
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
	if (expr->isidentifier() && expr->isinteger())
		reg= dynamic_cast<SimpleExpr &>(*expr).value();
	else
	{
		char type = expr->isstring() ? 'S' : expr->isinteger() ? 'I' : 'P';
		reg = genlocalregister(type);
		expr->emit(e, reg);
	}
	return reg;
}

//**********************************************************************

SwitchStatement::SwitchStatement(Function &fn, Block &block, Tokenizer &tk) :
	BlockStatement (fn, block),
	condition(0)
{
	ExpectOp ('(', tk);
	condition= parseExpr(fn, *this, tk);
	ExpectOp(')', tk);
	ExpectOp('{', tk);

more:
	Token t= tk.get();
	if (t.iskeyword("case"))
	{
		//std::cerr << "case\n";
		BaseExpr *caseexpr= parseExpr(fn, *this, tk);
		casevalue.push_back(caseexpr);
		//std::cerr << "/case\n";
		ExpectOp(':', tk);
		std::vector<BaseStatement *> cst;
		t= tk.get();
		while (!(t.isop('}') || t.iskeyword("case") || t.iskeyword("default")))
		{
			tk.unget(t);
			cst.push_back(parseStatement(fn, *this, tk));
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
			cst.push_back(parseStatement(fn, *this, tk));
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

	//st= parseStatement(fn, block, tk);
}

BaseStatement *SwitchStatement::optimize()
{
	condition= condition->optimize();
	for (size_t i= 0; i < casevalue.size(); ++i)
		if (casevalue[i])
			casevalue[i]= casevalue[i]->optimize();
	for (size_t i= 0; i < casest.size(); ++i)
	{
		std::vector<BaseStatement *> &cst= casest[i];
		for (size_t j= 0; j < cst.size(); ++j)
			cst[j]= cst[j]->optimize();
	}
	return this;
}

std::string SwitchStatement::getbreaklabel() const
{
	return breaklabel;
}

void SwitchStatement::emit(Emit &e)
{
	char type = '\0';
	for (size_t i= 0; i < casevalue.size(); ++i)
	{
		BaseExpr &value= *casevalue[i];
		char newtype = 'P';
		if (value.isinteger())
			newtype= 'I';
		else if (value.isstring())
			newtype= 'S';
		if (type == '\0')
			type= newtype;
		else
			if (type != newtype)
				type= 'P';
	}
	std::string reg= genregister(type);
	condition->emit(e, reg);
	std::string defaultlabel= genlabel();
	breaklabel= genlabel();
	std::vector<std::string> caselabel;
	for (size_t i= 0; i < casest.size(); ++i)
	{
		std::string label= genlabel();
		caselabel.push_back(label);
		std::string value= genregister(type);
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
	e << breaklabel << ": # break goes here\n";
}

//**********************************************************************

IfStatement::IfStatement(Function &fn, Block &block, Tokenizer &tk) :
	BlockStatement (fn, block),
	condition(0),
	st(new EmptyStatement(fn)),
	stelse(new EmptyStatement(fn))
{
	//std::cerr << "if\n";
	condition= new Condition(fn, *this, tk);
	st= parseStatement(fn, block, tk);
	Token t= tk.get();
	if (t.iskeyword("else")) {
		//std::cerr << "if else\n";
		stelse= parseStatement(fn, *this, tk);
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

void IfStatement::emit(Emit &e)
{
	std::string label= genlabel();
	std::string l_else= label + "_ELSE";
	std::string l_endif= label + "_ENDIF";
	std::string reg = condition->emit(e);
	e << "\n";
	if (!(condition->isinteger() || condition->isstring()))
	{
		e << "if null " << reg << " goto " <<
			(!stelse->isempty() ? l_else : l_endif) << '\n';
	}
	e <<
		"unless " << reg << " goto " <<
			(!stelse->isempty() ? l_else : l_endif) << '\n';
	if (!st->isempty())
		st->emit(e);
	if (!stelse->isempty())
	{
		e << "goto " << l_endif << '\n';
		e << l_else << ":\n";
		stelse->emit(e);
	}
	e << l_endif << ":\n";
}

//**********************************************************************

WhileStatement::WhileStatement(Function &fn, Block &block, Tokenizer &tk) :
	BlockStatement (fn, block),
	st(new EmptyStatement(fn))
{
	condition = new Condition(fn, *this, tk);
	st= parseStatement(fn, *this, tk);
}

BaseStatement *WhileStatement::optimize()
{
	condition= condition->optimize();
	st= st->optimize();
	switch (condition->getvalue())
	{
	case Condition::CVfalse:
		return new EmptyStatement(*function);;
	case Condition::CVtrue:
	case Condition::CVruntime:
	default:
		return this;
	}
}

std::string WhileStatement::getbreaklabel() const
{
	//if (labelend.empty())
	//	throw InternalError("bad break label in while");
	return labelend;
}

void WhileStatement::emit(Emit &e)
{
	std::string label= genlabel();
	std::string l_while= label + "_WHILE";
	labelend= label + "_ENDWHILE";
	bool forever= condition->getvalue() == Condition::CVtrue;
	e << l_while << ":\n";
	std::string reg;
	if (! forever)
	{
		reg= condition->emit(e);
		e << '\n';
	}
	if (st->isempty()) {
		if (! forever)
			e << "if " << reg << ' ';
		e << "goto " << l_while << '\n';
	}
	else {
		if (! forever)
			e << "unless " << reg << " goto " << labelend << '\n';
		st->emit(e);
		e << "goto " << l_while << '\n' <<
			labelend << ":\n";
	}
}

//**********************************************************************

Function::Function(Tokenizer &tk,
		const Namespace & ns_a, const std::string &funcname) :
	FunctionAttributes(tk, ns_a),
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
			std::string type= t.identifier();
			char ctype= '\0';
			if (type == "int") ctype = 'I';
			else if (type == "string") ctype = 'S';
			else if (type == "var") ctype = 'P';
			if (ctype == '\0')
				ctype= 'P';
			else
				t= tk.get();
			std::string name= t.identifier();
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

void Function::emitparams (Emit &e)
{
	for (size_t i= 0; i < params.size(); ++i)
		e << ".param " << nameoftype(paramtypes[i]) << ' ' <<
				params[i] << '\n';
}

void Function::emitbody (Emit &e)
{
	e.annotate(start);
	body->emit(e);
}

void Function::emit (Emit &e)
{
	getnamespace().emit (e);

	e << "\n.sub '" << getname() << "'";
	if (has_attribute("main") || name == "main")
		e << " :main";
	if (has_attribute("load"))
		e << " :load";
	if (has_attribute("init"))
		e << " :init";
	e << "\n";

	emitparams(e);
	emitbody(e);

	e << ".end\n\n";
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
			attributes.push_back(t.identifier());
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

class Class
{
public:
	Class(Tokenizer &tk, const Namespace & ns_a);
	void emit (Emit &e);
	std::vector <std::string> attributes() const { return attrs; }
private:
	std::string name;
	Namespace ns;
	std::vector <Token> parents;
	std::vector <Function *> functions;
	std::vector <std::string> attrs;
};

//**********************************************************************

class Method : public Function
{
public:
	Method(Tokenizer &tk,
			const Namespace & ns_a,
			Class &cl,
			const std::string &name) :
		Function(tk, ns_a, name),
		myclass(cl)
	{
		genlocal("self", 'P');
	}
	void emit (Emit &e)
	{
		getnamespace().emit (e);

		e << "\n.sub '" << getname() << "'";

		if (has_attribute("vtable"))
			e << " :vtable";
		else
			e << " :method";

		e << "\n";
		emitparams(e);
		emitbody(e);

		e << ".end\n\n";
	}
private:
	const Class &myclass;
};

//**********************************************************************

Class::Class(Tokenizer &tk, const Namespace & ns_a)
{
	Token t= tk.get();
	name= t.identifier();
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
		if (t.iskeyword("function"))
		{
			Token name= tk.get();
			if (! name.isidentifier() )
				throw Expected("method name", name);
			Function *f = new Method (tk, ns, *this, name.identifier());
			functions.push_back(f);
		}
		else if (t.iskeyword("var"))
		{
			do {
				Token name= tk.get();
				attrs.push_back(name.identifier());
				t= tk.get();
			} while (t.isop(','));
			RequireOp(';', t);
		}
		else
			throw Expected ("'function' or '}'", t);
	}
}

void Class::emit (Emit &e)
{
	ns.emit (e);

	e << ".sub Winxed_class_init :anon :load :init\n"
		"$P0 = newclass " << ns.get_key() << "\n";

	for (size_t i= 0; i < parents.size(); ++i)
	{
		Token parent= parents[i];
		std::ostringstream oss;
		oss << "$P" << i + 1;
		std::string p= oss.str();
		e << p << " = get_class ";

		if (parent.isliteralstring() )
			e << parent.pirliteralstring();
		else 
			e << "[ '" << parent.identifier() << "' ]";

		e << "\n"
			"addparent $P0, " << p << "\n";
	}
	for (size_t i= 0; i < attrs.size(); ++i)
	{
		std::string attr= attrs[i];
		e << "addattribute $P0, '" << attr << "'\n";
	}

	e << ".end\n";

	for (size_t i= 0; i < functions.size(); ++i)
		functions[i]->emit(e);
}

//**********************************************************************

class Winxed
{
public:
	void parse (Tokenizer &tk);
	void optimize ();
	void emit (Emit &e);
private:
	Namespace cur_namespace;
	std::vector <Class *> classes;
	std::vector <Function *> functions;
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
			cur_namespace= cur_namespace.child(t.identifier());
			ExpectOp('{', tk);
		}
		else if (t.iskeyword("class"))
		{
			Class *c = new Class (tk, cur_namespace);
			classes.push_back(c);
		}
		else if (t.iskeyword("function"))
		{
			Token fname = tk.get();
			if (! fname.isidentifier() )
				throw Expected("funcion name", fname);
			Function *f = new Function (tk, cur_namespace, fname.identifier());
			functions.push_back(f);
		}
		else if (t.isop('}'))
		{
			if (cur_namespace.isroot())
				throw SyntaxError("Unexpected '}'", t);
			cur_namespace= cur_namespace.parent();
		}
		else
			throw SyntaxError("Unexpected statement", t);
	}
}

void Winxed::optimize()
{
	for (size_t i= 0; i < functions.size(); ++i)
		functions[i]->optimize();
}

void Winxed::emit (Emit &e)
{
	e <<
"#\n"
"# Winxed generated file\n"
"#**************************************************\n"	
"\n"
".include 'iterator.pasm'\n"
"\n"
"#**************************************************\n"	
	;

	emit_predef(e.get());

	e <<
"#**************************************************\n"	
"# Begin generated code\n\n"
	;

	for (size_t i= 0; i < classes.size(); ++i)
		classes[i]->emit(e);

	for (size_t i= 0; i < functions.size(); ++i)
		functions[i]->emit(e);

	e << "\n# End generated code.\n";
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
	std::vector <std::string> addlib;

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
	else if (strcmp(argv[i], "-L") == 0)
	{
		addlib.push_back(std::string(argv[++i]));
		++i;
		goto nextarg;
	}

	if (i >= argc)
		throw CompileError("No input file");

	inputname= argv[i++];
	std::ifstream ifs(inputname);
	if (! ifs.is_open() )
		throw CompileError(std::string("Cant't open ") + inputname);

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
	{
		Emit e(output);
		winxed.emit(e);
	}
	output.close();

	char parrot[]= "parrot;";
	if (!compileonly)
	{
		int n= argc - i;
		char *args[3 + n + 2 * addlib.size() ];
		args[0] = parrot;
		int pos= 1;
		for (size_t l= 0; l < addlib.size(); ++l)
		{
			args [pos++]= strdup("-L");
			args [pos++]= strdup(addlib[l].c_str());
		}
		args[pos++]= strdup(outputfile.c_str());
		for (int a= 0; a < n; ++a)
			args[a + pos]= argv[a + i];
		args[2 + n + 2 * addlib.size()]= NULL;
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
