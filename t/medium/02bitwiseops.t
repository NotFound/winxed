#! winxed

// Medium tests: bitwise operators

using extern Test.More done_testing, is;

function main()
{
    int a = 7;
    int b = 3;
    is(a & ~b, 4, "7 & ~ 3 : 4");

    done_testing();
}

// End
