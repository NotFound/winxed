#! winxed

// Basic tests: array expresions

using extern Test.More plan, is;

function main()
{
    plan(11);

    var a = [];
    is(elements(a), 0, "empty");

    a = [7];
    is(elements(a), 1, "one item");
    is(a[0], 7, "integer value");

    a = ["hi"];
    is(a[0], "hi", "string value");

    a = [42, "and all"];
    is(elements(a), 2, "two mixed items");
    is(a[0], 42, "first item");
    is(a[1], "and all", "second item");

    int i = 69;
    string s = "something";
    a = [i, s];
    is(elements(a), 2, "two mixed vars");
    is(a[0], 69, "first item");
    is(a[1], "something", "second item");

    a = [ foo ];
    var f = a[0];
    is(f(), "this is foo", "a function");
}

function foo()
{
    return "this is foo";
}

// End
