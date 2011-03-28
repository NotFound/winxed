#! winxed

// Basic tests: test that we can test
// Not so basic functionality, but is needed for other tests.

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.ok;

    plan(1);

    ok(1, 'plan and ok works');
}

// End
