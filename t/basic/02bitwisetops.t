#! winxed

// Basic tests: bitwise operators

using extern Test.More done_testing, is;

function main()
{
    int a = 7;
    int b = 3;
    is(a & b, 3, "7 & 3 : 3");
    a= 6;
    is(a & b, 2, "6 & 3 : 2");
    b= 1;
    is(a & b, 0, "6 & 1 : 0");

    a = 7;
    b = 3;
    is(a | b, 7, "7 | 3 : 7");
    a= 17;
    is(a | b, 19, "17 | 3 : 19");
    b= 11;
    is(a | b, 27, "17 | 11 : 27");

    done_testing();
}

// End
