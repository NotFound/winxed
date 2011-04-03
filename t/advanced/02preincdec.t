#! winxed
# Basic tests for (prefix) int ++ and -- operator

function main()
{
        using extern Test.More;
        using Test.More.plan;
        using Test.More.is;
        plan (3);

        int a = 69;
        int c;

        c = ++a;
        is (c, 70);

        c = --a;
        is (c, 69);

        c = --(++a);
        is (c, 69);
}
