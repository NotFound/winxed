#! winxed

// multi syntax

using extern Test.More is, done_testing;

function bar(var a) { return "p"; }
function bar(int a, int b) { return "ii"; }
function bar(int a) { return "i"; }
function bar(string a, string b) { return "ss"; }

namespace FooBar
{

function foo(string value) { return "FooBar.s-" + value; }

class Foo
{
}

class Bar
{
}

} // namespace FooBar

class Foo
{
    function baz(int a, int b) { return "ii"; }
    function baz(float a, float b) { return "nn"; }
    function baz(string a, string b) { return "ss"; }
    function baz(var a, var b) { return "pp"; }
}

class Bar
{
}

//**********************************************************************

// 'multi' modifier

function mbar(int i)
{
    return "int";
}

function mbar(var i)
{
    return "var";
}

function mbar [multi('String')](var f)
{
    return "'String'";
}

function mbar [multi(class Foo)](var f)
{
    return "Foo";
}

function mbar [multi(class ['Bar'])](var f)
{
    return "['Bar']";
}

function mbar [multi(class FooBar.Foo)](var f)
{
    return "FooBar.Foo";
}

function mbar [multi(class ['FooBar','Bar'])](var f)
{
    return "['FooBar','Bar']";
}

function is_mbar(value, string name)
{
    is(mbar(value), name, "multimethod multi " + name);
}

function test_multi()
{
    var foo = new Foo;
    var bar = new Bar;
    var foofoo = new FooBar.Foo;
    var foobar = new FooBar.Bar;

    is(mbar(0), "int", "multimethod int");
    is_mbar(0,       "var");
    is_mbar("",     "'String'");
    is_mbar(bar,    "['Bar']");
    is_mbar(foofoo, "FooBar.Foo");
    is_mbar(foobar, "['FooBar','Bar']");
}

//**********************************************************************

function main[main]()
{
    is(bar(3, 2), "ii", "multi(int, int)");
    is(bar(3), "i", "multi(int)");
    is(bar("a", "b"), "ss", "multi(string, string)");
    is(bar(3.14), "p", "multi(var)");

    is(FooBar.foo("a"), "FooBar.s-a", "multi(string) in reopened namespace");
    is(FooBar.foo(42), "FooBar.i-42", "multi(int) in reopened namespace");

    var foo = new Foo;
    is(foo.baz(1, 2), "ii", "mutimethod(int, int)");
    is(foo.baz(1.2, 3.4), "nn", "multimethod(float, float)");
    is(foo.baz("a", "b"), "ss", "multimethod(string, string)");
    is(foo.baz(foo, foo), "pp", "multimethod(var, var)");

    test_multi();
    done_testing();
}

namespace FooBar
{
function foo(int value) { return "FooBar.i-" + string(value); }
}

// End
