#! winxed

// Mininal test for vtable overrides

class Foo
{
    function get_string [vtable] ()
    {
        return "Hello, Foo";
    }
}

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(1);
    var f= new Foo;
    string s= f;
    is (s, "Hello, Foo", "vtable get_string");
}

// End
