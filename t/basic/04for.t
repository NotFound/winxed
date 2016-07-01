#! winxed

// Basic tests: for loop

using extern Test.More plan, is;

function main()
{
    plan(7);

    int check = 0;
    for (;;) {
        check = check + 1;
        is(check, 1, "for (;;)");
        break;
    }

    string s;
    int i;
    for (i = 0; i < 5; i = i + 1)
        s = s + "x";
    is(s, "xxxxx", "simple counting");
    i = 0;
    s = "";
    for (; i < 5; i = i + 1)
        s = s + "x";
    is(s, "xxxxx", "simple counting without initialization");

    s = "";
    for (i = 0; i < 0; i = i + 1)
        s = s + "x";
    is(s, "", "condition false at start");

    i = 0;
    s = "";
    for (; i < 0; i = i + 1)
        s = s + "x";
    is(s, "", "condition false at start without initialization");
    for (; i < 0;)
        s = s + "x";
    is(s, "", "condition false at start - condition only");

    for (s = ""; length(s) < 4;)
        s = s + "x";
    is (s, "xxxx", "without increment");
}

// End
