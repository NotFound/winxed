#! winxed

// string type

using extern Test.More plan, is;

function main()
{
    plan(8);

    string r;

    // String literals
    is(length('hello\n'), 7, "length single quoted");

    // String literal compile time concatenation mixing quote types
    r = "Hello\t" + '\tworld\n';
    is(r, "Hello\t\\tworld\\n", "double + single");
    is(length(r), 15, "length double + single");
    r = 'Hello\n' + "\tworld\n";
    is(r, "Hello\\n\tworld\n", "single + double");
    is(length(r), 14, "length single + double");

    // Non-ascii escape sequences
    r = "\xf1";
    is(length(r), 1, "non-ascii hex escape have correct length");
    is(r, "ñ", "non-ascii hex escape have correct value");
    is(ord(r), 0xf1, "non-ascii hex escape have correct code");
}

// End
