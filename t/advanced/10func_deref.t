#! winxed

// Tests for the new prefix:* function dereference operator

using extern Test.More plan, is;

namespace Foo {
    namespace Bar {
        function baz() { return "Foo.Bar.baz"; }
    }
    function baz() { return "Foo.baz"; }
}

function main[main]()
{
    plan(2);
    is(*Foo.Bar.baz(), "Foo.Bar.baz", "Can get 1-arity multi");
    is(*Foo.baz(), "Foo.baz", "Can get 2-arity multi");
}

