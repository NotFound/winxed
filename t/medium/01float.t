#! winxed

// float type

using extern Test.More plan, is;

//******************************************************

function main [main]()
{
    plan(6);

    float n0 = 2.2;
    is(n0, 2.2, "initialize with float literal");
    float n1 = 1;
    is(n1, 1, "initialize with integer literal");

    n0 = 1.2;
    is(n0, 1.2, "assign float literal");
    n1 = 3;
    is(n1, 3, "assign integer literal");

    int i = n1;
    is(i, 3, "intiailize integer with float");
    i = n0;
    is(i, 1, "assign float to integer");

}  // main

//******************************************************
// End
