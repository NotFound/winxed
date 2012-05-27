# !winxed

// new operator and constructors

using extern Test.More plan, ok, is, is_null;

function main()
{
    plan(9);

    var obj;

    obj = new Foo;
    is(obj instanceof Foo, true, "new without arguments without constructor");

    int fail = 0;
    try {
        obj = new Foo();
    }
    catch () {
        fail = 1;
    }
    is(fail, 1, "new with empty argument list without constructor throws");

    obj = new Bar;
    is(obj instanceof Bar, true, "new without arguments with constructor");
    is_null(obj.b, "constructor is not invoked");

    obj = new Bar();
    ok(obj instanceof Bar, "new with empty argument list with constructor");
    is(obj.b, "Hi", "constructor is invoked");

    obj = new ["Integer"];
    ok(obj instanceof "Integer", "new with key");

    obj = new ["Integer"](42);
    is(obj, 42, "new with key - int argument");

    obj = new ["Exception"]( { "severity":  1, "message": "foobar" } );
    ok((obj instanceof "Exception") && obj["severity"] == 1 && obj["message"] == "foobar",
            "new with key - var argument");
}

class Foo
{
}

class Bar
{
    var b;
    function Bar()
    {
        self.b = "Hi";
    }
}

// End
