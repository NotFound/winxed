#! winxed

// Basic tests: test that we can test
// Not so basic functionality, but is needed for other tests.

using extern Test.More plan, ok;

function main()
{
    plan(1);

    ok(1, "plan and ok works");
}

// End
