#! winxed

// Basic tests: function calls

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(3);

    int i = retint();
    is(i, 42, 'return int to int');

    var p = retint();
    is(p, 42, 'return int to var');

    int j = retinteger();
    is (j, 69, 'return var to int');
}

function retint()
{
    return 42;
}

function retinteger()
{
    var p = new 'Integer';
    p =: 69;
    return p;
}

// End
