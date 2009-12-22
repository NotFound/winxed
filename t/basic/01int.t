#! winxed

# Basic tests: int type

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;

	plan(2);
	int i = 42;
	is(i, 42, 'simple initializer');
	int j;
	j = 69;
	is(j, 69, 'simple assignment');
}
