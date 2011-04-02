#! winxed

// Test return with multiple values

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(5);

    :(int i, int j) = ret2();
    is(i, 42, "first value of 2");
    is(j, 24, "second value of 2");

    :(i, j[optional], int has2[opt_flag]) = ret1();
    is(i, 7, "first value of 1");
    is(has2, 0, "optional not used");

    :(i, j[optional], has2[opt_flag]) = ret2();
    is(has2, 1, "optional used");
}

function ret1()
{
    return 7;
}

function ret2()
{
    return 42, 24;
}

// End
