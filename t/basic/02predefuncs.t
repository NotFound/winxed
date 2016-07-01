#! winxed

// Basic tests for predefined functions

using extern Test.More plan, is;

function main [main]()
{
    plan (17);

    string r;
    int a = 65;

    // ord and chr
    is (chr(a), "A", "chr with const argument");
    is (chr(65), "A", "chr with non const argument");
    is (ord("A"), 65, "ord with const argument");
    r = "A";
    is (ord(r), 65, "ord with non const argument");

    // Concatenate with chr.
    r = "a" + chr(10);
    is(length(r), 2, "concatenate literal and chr const - low value");
    r = "a" + chr(1000);
    is(length(r), 2, "concatenate literal and chr const - high value");
    r = chr(10) + chr(1000);
    is(length(r), 2, "concatenate two chr const");

    // substr
    is(substr("Winxed", 1, 2), "in", "substr literal 3 args");
    is(substr("Winxed", 4), "ed", "substr literal 2 args");
    is(substr("Winxed", -3), "xed", "substr literal 2 args - negative");
    r = "Winxed";
    is(substr(r, 1, 2), "in", "substr 3 args");
    is(substr(r, 4), "ed", "substr 2 args");
    is(substr(r, -3), "xed", "substr 2 args - negative");

    // indexof
    check_indexof("abcde", "c", 2);
    check_indexof("abcde", "C", -1);
    check_indexof_3("abcde", "c", 2, 2);
    check_indexof_3("abcde", "c", 3, -1);
}

function check_indexof(string source, string find, int expect)
{
    is(indexof(source, find), expect,
            "indexof(" + source + ", " + find + ") == " + string(expect));
}

function check_indexof_3(string source, string find, int start, int expect)
{
    is(indexof(source, find, start), expect,
            "indexof(" + source + ", " + find + ", " + string(start) +
            ") == " + string(expect));
}

// End
