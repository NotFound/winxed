#! winxed
# Basic tests for && operator

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;
	plan (4);

	int a = 69;
	int b = 42;
	int c;
	is ((a && b) != 0, 1, 'true - bool result');
	is (a && b, 42, 'true - numeric result');
	a= 0;
	is ((a && b) != 0, 0, 'false - bool result');
	is (a && b, 0, 'false - numeric result');
}
