#! winxed

// Basic tests: bool operators

using extern Test.More done_testing, is, ok, nok;

//******************************************************

// Helper functions to check short-circuit evaluation

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

function something(int value)
{
    set_n(value);
    return value;
}

//******************************************************

class Foo
{
    var bar;
}

//******************************************************

function main()
{
    int a = 7;
    int b = 3;
    var n;
    set_n(0);

    // Declare the function used for side effects to workaround
    // pitfalls of stage 0.
    using something;

    is(! a, 0, "! true gives 0");
    a = 0;
    is(! a, 1, "! false gives 1");
    a = ! a;
    ok(a, "assign ! a to a - from false");
    a = ! a;
    nok(a, "assign ! a to a - from true");

    a = 7;
    is(a && b, 3, '7 && 3 : 3');
    is(b && a, 7, '3 && 7 : 7');
    is(a || b, 7, '7 || 3 : 7');
    is(b || a, 3, '3 || 7 : 3');

    a = 0;
    b = a && something(1);
    ok(b == 0 && get_n() == 0, "zero && x does not evaluate x");

    a = 7;
    b = a && something(42);
    ok(b == 42 && get_n() == 42, "non-zero && x evaluate x");

    set_n(0);
    a = 42;
    b = a || something(1);
    ok(b == 42 && get_n() == 0, "non-zero || x does not evaluate x");

    a = 0;
    b = a || something(93);
    ok(b == 93 && get_n() == 93, "zero || x evaluate x");

    var v1 = 1;
    var v2 = 2;
    var r = v1 || v2;
    is(r, v1, "|| with var");

    v1 = new Foo;
    v1.bar = 17;
    r = v1.bar || v2;
    is(r, 17, "|| with attribute access on left, true");
    r = v2 || v1.bar;
    is(r, 2, "|| with attribute access on right, true");
    v1.bar = 0;
    r = v2 || v1.bar;
    is(r, 2, "|| with attribute access on left, true");
    v2 = 0;
    v1.bar = 17;
    r = v2 || v1.bar;
    is(r, 17, "|| with attribute access on left, false");

    v1.bar = 17;
    v2 = 2;
    r = v1.bar && v2;
    is(r, 2, "&& with attribute access on left, true");
    r = v2 && v1.bar;
    is(r, 17, "&& with attribute access on right, true");
    v1.bar = 0;
    r = v2 && v1.bar;
    is(r, 0, "&& with attribute access on left, true");
    v2 = 0;
    v1.bar = 17;
    r = v2 && v1.bar;
    is(r, 0, "&& with attribute access on left, false");

    done_testing();
}

// End
