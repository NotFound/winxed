#! winxed

// Basic tests for (prefix) int ++ and -- operator

using extern Test.More plan, is;

function main()
{
    plan (4);

    int a = 69;
    int c;

    c = ++a;
    is (c, 70, "pre ++ result");
    is (a, 70, "pre ++ side effect");

    c = --a;
    is (c, 69, "pre -- result");
    is (a, 69, "pre -- side effect");
}

// End
