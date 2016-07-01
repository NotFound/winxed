#! winxed

// Conditional operator

using extern Test.More plan, ok, is;

//******************************************************

function main [main]()
{
    plan(8);

    int c;
    int i;
    string s;

    c = true;
    i = c ? 42 : 24;
    is(i, 42, "conditional true int int");

    c = false;
    i = c ? 42 : 24;
    is(i, 24, "conditional false int int");

    c = true;
    s = c ? "Yes" : "No";
    is(s, "Yes", "conditional true string string");

    c = false;
    s = c ? "Yes" : "No";
    is(s, "No", "conditional false string string");

    string sy = "ye";
    c = true;
    s = c ? sy : null;
    ok(s === sy, "conditional true string null");

    c = false;
    s = c ? sy : null;
    ok(s == null, "conditional false string null");

    c = true;
    s = c ? null : sy;
    ok(s == null, "conditional true null string");

    c = false;
    s = c ? null : sy;
    ok(s === sy, "conditional false null string");

}  // main

//******************************************************
// End
