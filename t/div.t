#! winxed
# Basic tests for int / operator

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (7);

    int a = 69;
    int b = 42;
    int c;

    c = a / 33 * 2;
    is (c, 4);

    c = a + 8 / 4 / 2;
    is (c, 70);

    c = (a + 11) / 2;
    is (c, 40);

    c = 2 / -2;
    is (c, -1);

    c = -a / a;
    is (c, -1);

    c = -b / -b;
    is (c, 1);

    c = 0 / b;
    is (c, 0);

#
#    c = a / 0;
#    is (c, 1);
}
