# !winxed

// var cast builitin

$load 'Test/More.pbc';

function main()
{
    var (Test.More.plan)(3);

    var (Test.More.ok)(1, "cast to var avoid parse as method call");

    var is = var (Test.More.is);
    is(1, 1, "cast to var gets symbols not in scope");

    var foo = new Foo("Hello");
    is(foo.get(), "Hello", "cast to var with self avoid parse as method call");
}

class Foo
{
    var fn;
    function Foo(string s)
    {
        self.fn = function () { return s; };
    }
    function get()
    {
        return var (self.fn)();
    }
}

// End
