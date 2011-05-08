#! winxed

// Basic tests for predefined functions

using extern Test.More plan, is;

function main()
{
    plan (3);

    // ord and chr

    int a = 65;

    is (chr(a), "A");
    is (chr(65), "A");

    is (ord("A"), 65);
}

// End
