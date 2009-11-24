#! winxed

class Foo
{
	function num () { return 1; }
	function do()
	{
		using Test.More.ok;
		ok(1);
	}
}

class Bar
{
	function num () { return 2; }
	function do()
	{
		using Test.More.ok;
		ok(1);
		ok(1);
	}
}

function main()
{
	var tests = [ new Foo(), new Bar() ];
	var t;
	int total= 0;
	for (t in tests)
	{
		total = total + t.num();
	}
	using extern Test.More;
	using Test.More.plan;
	plan(total);
	for (t in tests)
		t.do();
}
