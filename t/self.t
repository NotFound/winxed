#! winxed

// Basic tests for self

class Foo
{
    var n;
    function init(int i)
    {
        self.n= i;
    }
    function get()
    {
        int i= self.n;
        return i;
    }
}

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (1);

    var f= new Foo;
    f.init(42);
    is(f.get(), 42, "set and get via self");
}

// End
