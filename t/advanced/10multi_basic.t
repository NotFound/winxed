#! winxed

// Basic tests for function modifiers with multiple arguments.

using extern Test.More plan, is;

// :multi

function Foo[multi("_", "_")](a, b) { return a + b; }

function Foo[multi("_")](a) { return a; }

function main[main]()
{
    plan(2);

    var foo;
    ${ get_global foo, "Foo" };
    is(foo(5), 5, "Can get 1-arity multi");
    is(foo(4,5), 9, "Can get 2-arity multi");
}

// End
