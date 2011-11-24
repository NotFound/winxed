#! winxed

function main()
{
	using extern Test.More;
	using Test.More.plan;

	plan(3);

	nested_labels();
	out_label();
}

function nested_labels()
{
	using Test.More.is;

	int i= 0;
next:
	{
		int j= 0;
	next:
		j = j + 1;
		if (j < 7) goto next;
		if (i == 0)
			is (j, 7, 'nested label: in block');
	}
	i = i + 1;
	if (i < 10) goto next;
	is (i, 10, 'nested label: out of block');
}

function out_label()
{
	using Test.More.is;
	int i= 0;
	int j;
	for (j in [1, 2, 3, 4, 5] )
	{
		i= j;
		if (j == 3) goto out;
	}
out:
	is (i, 3, 'goto label outside block');
}
