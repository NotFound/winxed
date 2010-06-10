#! winxed

# Basic tests: for loop

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(4);

    string s;
    int i;
    for (i= 0; i < 5; ++i)
        s+= 'x';
    is(s, 'xxxxx', 'simple counting');

    s = '';
    for (i= 0; i < 0; ++i)
        s+= 'x';
    is(s, '', 'do nothing');

    i = 0;
    s = '';
    for (; i < 0; ++i)
        s+= 'x';
    is(s, '', 'do nothing without initialization');

    for (s = ''; length(s) < 4;)
        s+= 'x';
    is (s, 'xxxx', 'without increment');
}
