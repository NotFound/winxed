#! winxed

// constants

using extern Test.More plan, is;

const string s0 = "hi";
const string s1 = upcase(s0) + ".";

namespace Foo
{
    const int BAR = 42;
}

namespace Foo2
{
    const int BAR2 = 7;
}

function main [main](args)
{
    plan(3);

    is(s1, "HI.", "const string evaluation with builtins");

    is(Foo.BAR, 42, "scoped constant");

    using namespace Foo2;
    is(BAR2, 7, "using namespace");
}

// End
