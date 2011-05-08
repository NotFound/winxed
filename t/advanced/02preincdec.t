#! winxed

// Advanced tests for (prefix) int ++ and -- operator

using extern Test.More plan, is;

function main()
{
    plan (2);

    int a = 69;
    int c;

    c = --(++a);
    is (c, 69, 'pre -- ++ result');
    is (a, 69, 'pre -- ++ side effect');
}

// End
