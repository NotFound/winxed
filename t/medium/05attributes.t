#! winxed

// Test attribute access

using extern Test.More plan, is;

function main()
{
    plan(6);

    int check;
    string s;
    string atname;
    var foo = new Foo;

    foo.set("bar");
    s = foo.bar;
    is(s, "bar", "get string");

    foo.bar = "world";
    is(foo.get(), "world", "set string");

    atname = "bar";
    foo.set("hello");
    is(foo.*atname, "hello", "indirect get string");

    foo.*atname = "bye";
    is(foo.bar, "bye", "indirect set string");

    check = 0;
    try {
        s = foo.thereisnothinghere;
    }
    catch() {
        check = 1;
    }
    is(check, 1, "get non existent throws");

    atname = "nosuchattribute";
    check = 0;
    try {
        s = foo.*atname;
    }
    catch() {
        check = 1;
    }
    is(check, 1, "indirect get non existent throws");
}

class Foo
{
    var bar;
    function set(string s) { self.bar = s; }
    function get() { return self.bar; }
}

// End
