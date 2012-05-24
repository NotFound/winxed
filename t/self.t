#! winxed

// Basic tests for self

using extern Test.More plan, is;

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
    plan (1);

    var f= new Foo;
    f.init(42);
    is(f.get(), 42, "set and get via self");
}

// End
