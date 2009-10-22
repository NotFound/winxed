#! winxed
# Basic tests for not operator

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;
	plan (3);

	int i= ! (1 + 1);
	is (i, 0);
	i= ! i;
	is (i, 1);
	is (++i, 2);
}
