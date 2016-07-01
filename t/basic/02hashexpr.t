#! winxed

// Basic tests: hash expresions

using extern Test.More plan, is;

function main()
{
    plan(11);

    var h = {};
    is(elements(h), 0, "empty");

    h = {"a" : 7};
    is(elements(h), 1, "one item");
    is(h["a"], 7, "integer value");

    h = {"a" : "hi"};
    is(h["a"], "hi", "string value");

    h = {"a" : 42, "b" : "and all"};
    is(elements(h), 2, "two mixed items");
    is(h["a"], 42, "int item");
    is(h["b"], "and all", "string item");

    int i = 69;
    string s = "something";
    h = {"a" : i, "b" : s};
    is(elements(h), 2, "two mixed vars");
    is(h["a"], 69, "int item");
    is(h["b"], "something", "string item");

    h = { "a" : foo };
    var f = h["a"];
    is(f(), "this is foo", "a function");
}

function foo()
{
    return "this is foo";
}

// End
