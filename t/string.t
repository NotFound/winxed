#! winxed

function main()
{
	using extern Test.More;
	using Test.More.plan;
	using Test.More.is;

	plan(3);
	string s1= 'a';
	string s2= 'b';
	string s3= 'c';
	string s4= 'd';
	string r = s1 + s2;
	is (r, 'ab');
	r = s1 + s2 + s3;
	is (r, 'abc');
	r = (s1 + s2) + (s3 + s4);
	is (r, 'abcd');
}
