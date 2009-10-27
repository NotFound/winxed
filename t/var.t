#! winxed

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(2);
    var a = 1;
    is(a, 1, 'initialize from int');
    var b = 'Hi';
    is(b, 'Hi', 'initialize from string');
    var c; c = 1;
    is(c, 1, 'assign from int');
    var d; d = 'Hi';
    is(d, 'Hi', 'assign from string');
}
