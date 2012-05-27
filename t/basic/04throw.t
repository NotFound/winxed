#! winxed

// Basic tests: throw

using extern Test.More plan, is;

function aux()
{
    throw new ["Exception"]({ "message": "something bad" });
}

function main [main](var args)
{
    plan(1);
    try
        aux();
    catch (e) {
        is(e["message"], "something bad", "get Exception message");
    }
}

// End
