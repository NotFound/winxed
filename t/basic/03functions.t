#! winxed

// Basic tests: function calls

using extern Test.More plan, is;

function main()
{
    plan(3);

    int i = retint();
    is(i, 42, "return int to int");

    var p = retint();
    is(p, 42, "return int to var");

    int j = retinteger();
    is (j, 69, "return var to int");
}

function retint()
{
    return 42;
}

function retinteger()
{
    var p = 69;
    return p;
}

// End
