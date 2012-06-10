#! winxed

// inline

using extern Test.More plan, is;

inline addmul2_10(value) return int
{
    return value * 2 + 10;
}

inline addmul2_10_i(int value) return int
{
    return value * 2 + 10;
}

function main[main] (argv)
{
    plan(4);

    int i = 16;
    float f = 16.1;
    is(addmul2_10(i), 42, "inline return int");
    is(addmul2_10(f), 42, "inline with float arg");
    f = 16.6;
    is(addmul2_10(f), 43, "inline with float arg does not truncate");
    is(addmul2_10_i(f), 42, "inline with float arg on int parameter");
}

// End
