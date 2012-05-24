#! winxed

using extern Test.More plan, is;

function main()
{
    plan(4);
    var a = 1;
    is(a, 1, "initialize from int");
    var b = "Hi";
    is(b, "Hi", "initialize from string");
    var c; c = 1;
    is(c, 1, "assign from int");
    var d; d = "Hi";
    is(d, "Hi", "assign from string");
}
