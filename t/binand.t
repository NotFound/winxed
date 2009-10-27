#! winxed
# Basic tests for binary and operator

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;
	plan (3);

	int a = 7;
	int b = 3;
	is (a & b, 3, '7 & 3 : 3');
	a= 6;
	is (a & b, 2, '6 & 3 : 2');
	b= 1;
	is (a & b, 0, '6 & 1 : 0');
}
