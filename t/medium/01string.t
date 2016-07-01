#! winxed

// string type

using extern Test.More plan, is;

function main()
{
    plan(3);

    string r;

    // Non-ascii escape sequences
    r = "\xf1";
    is(length(r), 1, "non-ascii hex escape have correct length");
    is(r, "ñ", "non-ascii hex escape have correct value");
    is(ord(r), 0xf1, "non-ascii hex escape have correct code");
}

// End
