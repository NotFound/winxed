#! winxed

// Basic tests for predefined functions

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan (3);

    // ord and chr

    int a = 65;

    is (chr(a), "A");
    is (chr(65), "A");

    is (ord("A"), 65);
}

// End
