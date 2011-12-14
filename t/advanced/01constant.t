#! winxed

// constants

using extern Test.More done_testing, is;

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
    is(Foo.BAR, 42, "scoped constant");

    using namespace Foo2;
    is(BAR2, 7, "using namespace");

    done_testing();
}

// End
