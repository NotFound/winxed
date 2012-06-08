#! winxed

// Basic tests for postfix ++ and -- operators

using extern Test.More plan, is;

function main()
{
    plan (8);

    int i= 0;
    int a;
    a= i++;
    is (a, 0, "post ++ gives previous value");
    is (i, 1, "post ++ increments");
    aux(i++, 1, "post ++ in function argument");
    aux(i--, 2, "post -- in function argument");
    a= i--;
    is (a, 1, "post -- gives previous value");
    is (i, 0, "post -- decrements");
    i++;
    is (i, 1, "post ++ in void context");
    i--;
    is (i, 0, "post -- in void context");
}

function aux(int i, int check, string msg)
{
    is (i, check, msg);
}

// End
