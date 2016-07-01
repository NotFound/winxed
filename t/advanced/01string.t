#! winxed

// string type

using extern Test.More plan, is;

function main()
{
    plan(5);

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
}

// End
