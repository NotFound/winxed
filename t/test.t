#! winxed

// test.t
// Winxed basic functionality.

using extern Test.More plan, is, isnt;

function int_cmp()
{
	int i=  2 - 1;
	is(i, 1, "int equal");
	i = 2 + 3;
	isnt(i, 1, "int not equal");
}

function string_cmp()
{
	string s= "Hi";
	is(s, "Hi", "string equal");
	isnt(s, "Ho", "string not equal");
}

function foo()
{
	return "bar";
}

function func_calls()
{
	string s= foo();
	is(s, "bar", "function returning string");
}

function main [main] ()
{
	plan(5);

	int_cmp();
	string_cmp();
	func_calls();
}

// End of test.winxed
