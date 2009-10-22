#! winxed

// test.t
// Winxed basic functionality.

function int_cmp()
{
	using Test.More.is;
	using Test.More.isnt;

	int i=  2 - 1;
	is(i, 1, 'int equal');
	i = 2 + 3;
	isnt(i, 1, 'int not equal');
}

function string_cmp()
{
	using Test.More.is;
	using Test.More.isnt;

	string s= 'Hi';
	is(s, 'Hi', 'string equal');
	isnt(s, 'Ho', 'string not equal');
}

function foo()
{
	return "bar";
}

function func_calls()
{
	using Test.More.is;

	string s= foo();
	is(s, 'bar', 'function returning string');
}

function main()
{
	using extern Test.More;
	using Test.More.plan;

	plan(5);

	int_cmp();
	string_cmp();
	func_calls();
}

// End of test.winxed
