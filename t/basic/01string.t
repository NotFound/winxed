#! winxed

// Basic tests: string type

using extern Test.More plan, is;

function main()
{
    plan(11);

    string r;
    string s1= 'a';
    string s2= 'b';
    string s3= 'c';
    string s4= 'd';

    // Concatenation
    r = s1 + s2;
    is(r, 'ab', 'concat 2');
    r = s1 + s2 + s3;
    is(r, 'abc', 'concat 3');
    r = (s1 + s2) + (s3 + s4);
    is(r, 'abcd', 'concat with parens');

    // String literals
    is(length("hello\n"), 6, 'length double quoted');
    is(length('hello\n'), 7, 'length single quoted');

    // String literal compile time concatenation mixing quote types
    r = "Hello\t" + '\tworld\n';
    is(r, "Hello\t\\tworld\\n", 'double + single');
    is(length(r), 15, 'length double + single');
    r = 'Hello\n' + "\tworld\n";
    is(r, "Hello\\n\tworld\n", 'single + double');
    is(length(r), 14, 'length single + double');

    // Non-ascii strings
    r = "ñÑáéíóú";
    is(length(r), 7, 'non-ascii string have correct lenght');
    is(bytelength(r), 14, 'non-ascii string have correct byte lenght');
}

// End
