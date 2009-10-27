#! winxed
# Basic tests for binary or operator

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;
	plan (3);

	int a = 7;
	int b = 3;
	is (a | b, 7, '7 | 3 : 7');
	a= 17;
	is (a | b, 19, '17 | 3 : 19');
	b= 11;
	is (a | b, 27, '17 | 11 : 27');
}
