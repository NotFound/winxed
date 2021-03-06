# !winxed

// Default values in parameters

using extern Test.More is, done_testing;

function ret_int(int i = 42)
{
    return i;
}

function check_bool(int x = false)
{
    return x ? "True" : "False";
}

const int CONST_BAR = 42;

function theAnswer(int x = CONST_BAR)
{
    return x;
}

class Foo
{
    var x;
    function Foo()
    {
        self.x = "Hi";
    }
    function bar(var x = self.x)
    {
        return x;
    }
}

namespace Bar
{
function baz()
{
    return "baz";
}
}

function foo(var x = Bar.baz())
{
    return x;
}

function retvoid()
{
}

//**********************************************************************

function main [main](args)
{
    is(ret_int(), 42, "int default value");
    is(ret_int(7), 7, "int provided value");
    is(check_bool(), "False", "predefined constant");
    is(theAnswer(), 42, "user defined constant");
    is(new Foo().bar(), "Hi", "self in default value");
    is(foo(), "baz", "namespace qualified function in default value");

    // Multi assign
    :(int i = 42) = retvoid();
    is (i, 42, "multi return - get 1 from 0");
    :(int j, i = 7) = ret_int();
    is (i, 7, "multi return - get 2 from 1");

    done_testing();
}

// End
