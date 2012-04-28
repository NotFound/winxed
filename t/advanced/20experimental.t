#! winxed

// tests for features currently considered experimental

using extern Test.More is, ok, done_testing;

function main [main]()
{
    ok(1, "Experimental tests started");
    test_inline();
    done_testing();
}

//*************************************************************	
// local inline

function test_inline()
{
    inline setit(string value)
    {
        it = value;
    }
    string it;
    setit("set");
    is(it, "set", "set a local var");
    it = "changed";
    testit();
    inline testit()
    {
        is(it, "changed", "use a local var");
    }
}

//*************************************************************	

// End
