#! winxed

// closures

using extern Test.More is, done_testing;

//**********************************************************************

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
    var inner = twolevels();
    is(inner(), 42, "calling a closure generated in an anonymous function");
    done_testing();
}

// End
