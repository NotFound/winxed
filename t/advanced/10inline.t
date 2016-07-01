#! winxed

// inline

using extern Test.More plan, ok, is;

inline check_ok(const int value, const string msg)
{
    ok(value, msg);
}

inline select(int s, var values) return int
{
    if (s < 0)
        return 999;
    return values[s];
}

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
    plan(8);

    check_ok(1, "inline with const params and arg");
    int i = 16;
    string msg = "inline with const params and non const args";
    check_ok(i, msg);

    is(select(-1, null), 999, "return from inline - 1");
    is(select(1, [ 42, 7] ), 7, "return from inline - 2");

    float f = 16.1;
    is(addmul2_10(i), 42, "inline return int");
    is(addmul2_10(f), 42, "inline with float arg");
    f = 16.6;
    is(addmul2_10(f), 43, "inline with float arg does not truncate");
    is(addmul2_10_i(f), 42, "inline with float arg on int parameter");
}

// End
