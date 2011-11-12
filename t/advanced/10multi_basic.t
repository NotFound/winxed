#! winxed

// Basic tests for function modifiers with multiple arguments.

using extern Test.More plan, is;

// :multi

function Foo(a, b) { return a + b; }

function Foo(a) { return a; }

class Bar
{
    var str;
    function Bar(int i)
    {
        self.str = "int " + string(i);
    }
    function Bar(string s)
    {
        self.str = "string " + s;
    }
    function get()
    {
        return self.str;
    }
    function get(int unused)
    {
        return length(self.str);
    }
    function get(string unused)
    {
        return 4 * length(self.str);
    }
}

function main[main]()
{
    plan(6);

    var foo;
    ${ get_global foo, "Foo" };
    is(foo(5), 5, "Can get 1-arity multi");
    is(foo(4,5), 9, "Can get 2-arity multi");

    const string R1 = "int 42";
    const string R2 = "string hi";
    var b1 = new Bar(42);
    var b2 = new Bar("hi");
    is(b1.get(), R1, "multi constructor - int");
    is(b2.get(), R2, "multi constructor - string");
    is(b1.get(0), length(R1), "multi method - int");
    is(b2.get(""), 4 * length(R2), "multi method - string");
}

// End
