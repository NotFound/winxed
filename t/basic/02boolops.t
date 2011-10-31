#! winxed

// Basic tests: bool operators

using extern Test.More done_testing, is, ok;

function set_n(int value)
{
    var n = value;
    ${ set_hll_global "n", n };
}

function get_n()
{
    var n;
    ${ get_hll_global n, "n" };
    return int(n);
}

// Repeated to workaround a bug in stage 0
function something1(int value)
{
    set_n(value);
    return value;
}
function something2(int value)
{
    set_n(value);
    return value;
}
function something3(int value)
{
    set_n(value);
    return value;
}
function something4(int value)
{
    set_n(value);
    return value;
}


function main()
{
    int a = 7;
    int b = 3;
    var n;

    set_n(0);

    is(a && b, 3, '7 && 3 : 3');
    is(b && a, 7, '3 && 7 : 7');
    is(a || b, 7, '7 || 3 : 7');
    is(b || a, 3, '3 || 7 : 3');

    a = 0;
    b = a && something1(1);
    ok(b == 0 && get_n() == 0, "zero && x does not evaluate x");

    a = 7;
    b = a && something2(42);
    ok(b == 42 && get_n() == 42, "non-zero && x evaluate x");

    set_n(0);
    a = 42;
    b = a || something3(1);
    ok(b == 42 && get_n() == 0, "non-zero || x does not evaluate x");

    a = 0;
    b = a || something4(93);
    ok(b == 93 && get_n() == 93, "zero || x evaluate x");

    done_testing();
}

// End