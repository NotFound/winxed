#! winxed
# Basic tests for =: operator

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;
	plan (2);

	var a= new 'FixedStringArray';
	a=: 42;
	is (a instanceof 'FixedStringArray', 1, 'type unchanged');
	int i= a;
	is (i, 42, 'integer value assigned');
}
