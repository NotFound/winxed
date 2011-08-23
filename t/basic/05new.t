# !winxed

// new operator and constructors

using extern Test.More plan, ok, is, is_null;

function main()
{
    plan(11);

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
    ok(obj instanceof Bar, 'new with empty argument list with constructor');
    is(obj.b, 'Hi', 'constructor is invoked');

    obj = null;
    obj = new Hill.Fool;
    ok(obj != null && obj.attr == null, 'new dotted without arguments');

    obj = new Hill.Fool();
    is(obj.attr, 42, 'new dotted with empty argument list');

    obj = new 'String';
    ok(obj instanceof 'String', 'new with string literal');

    obj = new ['Integer'];
    ok(obj instanceof 'Integer', 'new with key');

    obj = new ['Integer'](42);
    is(obj, 42, 'new with key - int argument');
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

namespace Hill
{

class Fool
{
    var attr;
    function Fool()
    {
        self.attr = 42;
    }
}

}

// End
