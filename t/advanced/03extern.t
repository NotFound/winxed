#! winxed

// Test extern function

$load "Test/More.pbc";

namespace Test
{
namespace More
{

extern function plan;
extern function ok;

} // namespace More
} // namespace Test


function testusing()
{
    using Test.More.ok;
    ok(1, 'extern function called with using');
}

namespace Foo
{
using namespace Test.More;

function testusingns()
{
    ok(1, 'extern function called with using namespace');
}

} // namespace Foo

function main()
{
    Test.More.plan(3);

    Test.More.ok(1, 'extern functions called by full name');
    testusing();
    Foo.testusingns();
}

// End
