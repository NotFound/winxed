#! winxed

// Minimal tests of parent class

class Foo
{
    var n;
    function f1() { return "Foo.f1"; }
    function f2() { return "Foo.f2"; }
    function f3() { return self.f1(); }
}

class Bar : Foo
{
    function f1() { return "Bar.f1"; }
}

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(3);
    var bar = new Bar;
    is(bar.f1(), "Bar.f1", "overrides parent function");
    is(bar.f2(), "Foo.f2", "uses parent function");
    is(bar.f3(), "Bar.f1", "parent function uses child override with self");
}

// End
