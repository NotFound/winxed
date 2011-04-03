#! winxed

# Basic tests for (prefix) int ++ and -- operator

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (4);

    int a = 69;
    int c;

    c = ++a;
    is (c, 70, 'pre ++ result');
    is (a, 70, 'pre ++ side effect');

    c = --a;
    is (c, 69, 'pre -- result');
    is (a, 69, 'pre -- side effect');
}

// End
