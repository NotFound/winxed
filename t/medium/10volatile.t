#! winxed

// volatile tests.

using extern Test.More done_testing, ok;

function outer_nv(int n)
{
    var p = n;
    return function()
        {
            p = p + 1;
            return int(p);
        };
}

function outer_v(int n)
{
    volatile var p = n;
    return function()
        {
            p = p + 1;
            return int(p);
        };
}

function main()
{
    ok(1);
 
    var inner_nv = outer_nv(42);
    int r1 = inner_nv();
    int r2 = inner_nv();
    ok(r1 == 43 && r2 == 43, "non volatile");

    var inner_v = outer_v(42);
    r1 = inner_v();
    r2 = inner_v();
    ok(r1 == 43 && r2 == 44, "volatile");
 
    done_testing();
}

// End
