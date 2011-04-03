#! winxed

# Advanced tests for (prefix) int ++ and -- operator

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (2);

    int a = 69;
    int c;

    c = --(++a);
    is (c, 69, 'pre -- ++ result');
    is (a, 69, 'pre -- ++ side effect');
}

// End
