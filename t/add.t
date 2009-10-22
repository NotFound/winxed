#! winxed
# Basic tests for int + operator

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;
	plan (5);

	int a = 69;
	int b = 42;
	int c;
	c = a + b * 2;
	is (c, 153);

	c = 2 * b  + a;
	is (c, 153);
	c = 2 * (b  + a);
	is (c, 222);

	c = ((a + b)) * 2;
	is (c, 222);

	c = 2 * b  + a == 153;
	is (c, 1);
}
