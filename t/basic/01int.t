#! winxed

// Basic tests: int type

using extern Test.More plan, is;

function main()
{
    plan(3);

    int i = 42;
    is(i, 42, "simple initializer");
    int j;
    j = 69;
    is(j, 69, "simple assignment");
    i = 0xFE;
    is(i, 254, "hex integer");
}

// End
