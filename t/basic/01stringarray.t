#! winxed

// Basic tests for string array

using extern Test.More plan, is, ok;

function main()
{
    plan(14);

    string noinit [];
    ok(noinit instanceof "ResizableStringArray", "type of non initialized");
    is(elements(noinit), 0, "size of non initialized");

    string a []= [ "foo", "bar" ];
    ok(a instanceof "ResizableStringArray", "type of initialized");
    is(elements(a), 2, "size of initialized");
    is(a[0], "foo", "first value");
    is(a[1], "bar", "second value");

    string b [2];
    ok(b instanceof "FixedStringArray", "type of non initialized with size");
    is(elements(b), 2, "size of non initialized with size");

    string c [2] = [ "foo", "bar" ];
    ok(c instanceof "FixedStringArray", "type of initialized with size");
    is(elements(c), 2, "size of initialized with size");
    is(c[0], "foo", "first value");
    is(c[1], "bar", "second value");

    int size= 4;
    string d[size];
    ok(c instanceof "FixedStringArray", "type of non initialized with size non constant");
    is(elements(d), size, "size of non initialized with size non constant");
}

// End
