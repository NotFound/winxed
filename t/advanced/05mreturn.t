#! winxed

// Test return with multiple values

using extern Test.More plan, is, ok;

function main()
{
    plan(6);

    :(int i, int j) = ret2();
    is(i, 42, "first value of 2");
    is(j, 24, "second value of 2");

    :(i, j[optional], int has2[opt_flag]) = ret1();
    is(i, 7, "first value of 1");
    is(has2, 0, "optional not used");

    :(i, j[optional], has2[opt_flag]) = ret2();
    is(has2, 1, "optional used");

    :(var v1, var v2, var v3) = retvars();
    ok(v1 == null && v2 != null && v3 == null, "null/non null vars");
}

function ret1()
{
    return 7;
}

function ret2()
{
    return 42, 24;
}

function retvars()
{
    var v = 1;
    return null, v, null;
}

// End
