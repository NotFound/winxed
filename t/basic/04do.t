#! winxed

# Basic tests: do loop

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(1);

    var c = new 'Integer';
    c =: 4;
    int i = 0;
    do {
        --c;
	++i;
    } while (c);
    is(i, 4, 'do loop with var');
}
