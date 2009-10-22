#! winxed
# Basic tests for postfix ++ and -- operators

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;
	plan (6);

	int i= 0;
	int a;
	a= i++;
	is (a, 0);
	is (i, 1);
	aux(i++, 1);
	aux(i--, 2);
	a= i--;
	is (a, 1);
	is (i, 0);
}

function aux(int i, int check)
{
	using Test.More.is;
	is (i, check);
}
