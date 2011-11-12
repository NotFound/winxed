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


function call_indirect(fun, string msg)
{
    fun(1, msg);
}

function testusing()
{
    using Test.More.ok;
    ok(1, 'extern function called with using');
}

function test_indirect()
{
    call_indirect(Test.More.ok,'extern function indirect call');
}

namespace Foo
{
using namespace Test.More;

function testusingns()
{
    ok(1, 'extern function called with using namespace');
}

function testusingns_indirect()
{
    call_indirect(ok, 'extern function indirect call using namespace');
}

} // namespace Foo

function main()
{
    Test.More.plan(5);

    Test.More.ok(1, 'extern functions called by full name');
    testusing();
    test_indirect();
    Foo.testusingns();
    Foo.testusingns_indirect();
}

// End
