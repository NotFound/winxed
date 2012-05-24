#! winxed

// Mininal test for vtable overrides

using extern Test.More plan, is;

class Foo
{
    function get_string [vtable] ()
    {
        return "Hello, Foo";
    }
}

function main()
{
    plan(1);
    var f= new Foo;
    string s= f;
    is (s, "Hello, Foo", "vtable get_string");
}

// End
