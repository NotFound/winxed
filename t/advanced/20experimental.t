#! winxed

// tests for features currently considered experimental

using extern Test.More plan, is, ok;

function main [main]()
{
    plan(9);
    ok(1, "Experimental tests started");
    test_inline();
}

//**************************************************************
// local inline

function test_inline()
{
    inline setit(string value)
    {
        it = value;
    }
    string it;
    setit("set");
    is(it, "set", "set a local var");
    it = "changed";
    testit();
    inline testit()
    {
        is(it, "changed", "use a local var");
    }

    // Variable with the same name in inner block is not in scope
    // for the inline, its scope its the one at the definition point.
    do {
        string it = "other";
        setit("changed again");
        is(it, "other", "overriden var unchanged");
    } while (false);
    is(it, "changed again", "set from inner block");

    test_inline_function();
    test_inline_self();
}

function test_inline_function()
{
    string sep;
    inline x(const string prefix) return var
    {
        return function(string s)
        {
            // Use the inline parameter, the function parameter and a lexical.
            return prefix + sep + s;
        };
    }
    var fn = x("Hello");
    sep = ", ";
    is (fn("world"), "Hello, world", "local function inlined");
    sep = "-";
    is (fn("bye"), "Hello-bye", "local function inlined, lexical changed");
}

function test_inline_self()
{
    var foo = new Foo();
    foo.test();
    var fn = foo.test_function();
    foo.set("other");
    is(fn("test"), "othertest", "local function inlined using self");
}

class Foo
{
    var v;
    function Foo()
    {
        self.v = "Bar";
    }
    function set(string s)
    {
        self.v = s;
    }
    function test()
    {
        inline x()
        {
            is(self.v, "Bar", "self inlined");
        }
        x();
    }
    function test_function()
    {
        inline x() return var
        {
            return function(string s)
            {
                return string(self.v) + s;
            };
        }
        return x();
    }
}

//**************************************************************

// End
