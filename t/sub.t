#! winxed
# Basic tests for int - operator

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (5);

    int a = 69;
    int b = 42;
    int c;

    c = a - b * 2;
    is (c, -15);

    c = 2 * b  - a;
    is (c, 15);

    c = 2 * (b  - a);
    is (c, -54);

    c = ((a - b)) * 2;
    is (c, 54);

    c = 2 * b  - a == 15;
    is (c, 1);
}
