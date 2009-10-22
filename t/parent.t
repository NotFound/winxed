#! winxed

class Foo
{
	function f1() { return "Foo.f1"; }
	function f2() { return "Foo.f2"; }
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

    plan(2);
    var bar = new Bar;
    is(bar.f1(), 'Bar.f1', 'overrides parent function');
    is(bar.f2(), 'Foo.f2', 'uses parent function');
}
