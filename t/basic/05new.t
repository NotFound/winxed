# !winxed

// new operator and constructors

$load 'Test/More.pbc';

function main()
{
    using Test.More.plan;
    using Test.More.is;
    using Test.More.is_null;

    plan(6);

    var obj;

    obj = new Foo;
    is(obj instanceof Foo, true, 'new without arguments without constructor');

    int fail = 0;
    try {
        obj = new Foo();
    }
    catch () {
        fail = 1;
    }
    is(fail, 1, 'new with empty argument list without constructor throws');

    obj = new Bar;
    is(obj instanceof Bar, true, 'new without arguments with constructor');
    is_null(obj.b, 'constructor is not invoked');

    obj = new Bar();
    is(obj instanceof Bar, true, 'new with empty argument list with constructor');
    is(obj.b, 'Hi', 'constructor is invoked');
}

class Foo
{
}

class Bar
{
    var b;
    function Bar()
    {
        self.b = 'Hi';
    }
}

// End
