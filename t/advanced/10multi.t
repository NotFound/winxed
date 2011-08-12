#! winxed

// multi syntax

using extern Test.More plan, is;

function bar(var a) { return "p"; }
function bar(int a, int b) { return "ii"; }
function bar(int a) { return "i"; }
function bar(string a, string b) { return "ss"; }

class Foo
{
    function baz(int a, int b) { return "ii"; }
    function baz(float a, float b) { return "nn"; }
    function baz(string a, string b) { return "ss"; }
    function baz(var a, var b) { return "pp"; }
}

function main[main]()
{
    plan(8);
    is(bar(3, 2), "ii", "multi(int, int)");
    is(bar(3), "i", "multi(int)");
    is(bar("a", "b"), "ss", "multi(string, string)");
    is(bar(3.14), "p", "multi(var)");

    var foo = new Foo;
    is(foo.baz(1, 2), "ii", "");
    is(foo.baz(1.2, 3.4), "nn", "");
    is(foo.baz("a", "b"), "ss", "");
    is(foo.baz(foo, foo), "pp", "");

}
