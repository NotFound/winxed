#! winxed

// Basic tests: try / catch

using extern Test.More plan, ok;

function fail()
{
    afunctionthatshouldnotexist();
}

function main()
{
    plan(2);

    try {
        fail();
	ok(0, "exception not caught");
    }
    catch ()
    {
        ok(1, "catch without parameter");
    }
    try {
        fail();
	ok(0, "exception not caught");
    }
    catch (e)
    {
        ok(1, "catch with parameter");
    }
}

// End
