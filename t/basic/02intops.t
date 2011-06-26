#! winxed

// Basic tests: int operators

using extern Test.More plan, is, throws_type, diag;

function main()
{
    plan (14);

    int a = 69;
    int b = 42;
    int zero = 0;
    int c;

    diag("Priority in simple operations:");

    c = a + b * 2;
    is(c, 153, "a + b * 2");

    c = 2 * b  + a;
    is(c, 153, "2 * b  + a");

    c = 2 * (b  + a);
    is(c, 222, "2 * (b  + a)");

    c = ((a + b)) * 2;
    is(c, 222, "((a + b)) * 2");

    c = 2 * b  + a == 153;
    is(c, 1, "2 * b  + a == 153");

    c = a / 33 * 2;
    is(c, 4, "a / 33 * 2");

    c = a + 8 / 4 / 2;
    is(c, 70, "a + 8 / 4 / 2");

    c = (a + 11) / 2;
    is(c, 40, "(a + 11) / 2");

    c = 2 / -2;
    is(c, -1, "2 / -2");

    c = -a / a;
    is(c, -1, "-a / a");

    c = -b / -b;
    is(c, 1, "-b / -b");

    c = 0 / b;
    is(c, 0, "0 / b");

    c = zero / b;
    is(c, 0, "zero / b");

    diag("Exceptions:");

    is (divzero(), 1, "division by zero throws");
}

function divzero()
{
    // Use a function to make sure is not evaluated at compile time.
    // Don't check the exception type to be able to run
    // in stage 0 without complications.
    try {
        int i = divide(1, 0);
        return 0;
    }
    catch () {
        return 1;
    }
}

function divide(int a, int b)
{
    return a / b;
}

// End
