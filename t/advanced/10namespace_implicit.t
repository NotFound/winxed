#! winxed

// tests for implict namespace syntax in namespace and class

using extern Test.More plan, is, ok;

namespace A.B.C {
    function foo() { return "A.B.C.foo"; }
}

namespace A.B.C.D {
    function foo() { return "A.B.C.D.foo"; }
}

class A.B.C.Bar
{
    function name() { return "A.B.C.Bar"; }
}

function use1()
{
    using namespace A.B.C;
    is(foo(), "A.B.C.foo", "using namespace full");
    int r = 0;
    try {
        var bar = new Bar;
        r = bar.name() == "A.B.C.Bar";
    }
    catch () {}
    ok(r, "using namespace full - class");
}

function use2()
{
    using namespace A.B;
    is(C.foo(), "A.B.C.foo", "using namespace partial");

    int r = 0;
    try {
        var bar = new C.Bar;
        r = bar.name() == "A.B.C.Bar";
    }
    catch () {}
    ok(r, "using namespace partial - class");
}

function main[main]()
{
    plan(7);

    is(A.B.C.foo(), "A.B.C.foo", "call by full name");
    is(A.B.C.D.foo(), "A.B.C.D.foo", "call by full name: same name, different namespace");

    int r = 0;
    try {
        var bar = new A.B.C.Bar;
        r = bar.name() == "A.B.C.Bar";
    }
    catch () {}
    ok(r, "new by full name");

    use1();
    use2();
}

// End
