#! winxed

// closures

using extern Test.More is, done_testing;

//**********************************************************************

function getset()
{
    int n;
    string str;
    return
        function (int i) { n = i; },
        function () { return n; },
        function (string s) { str = s; },
        function () { return str; };
}

function twolevels()
{
    var n = 42;
    var f = function()
    {
        // This local function does not use the lexical except in its
        // local function, thus testing that the lexical scope
        // propagates in such case.
        return function() { return n; };
    };
    return f();
}

//**********************************************************************

function main[main]()
{
    :( var set_int, var get_int, var set_string, var get_string) = getset();
    set_int(42);
    is(get_int(), 42, "lexical int");
    set_string("hello");
    is(get_string(), "hello", "lexical string");

    var inner = twolevels();
    is(inner(), 42, "calling a closure generated in an anonymous function");
    done_testing();
}

// End
