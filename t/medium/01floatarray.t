#! winxed

//  Tests for float array

using extern Test.More plan, is, ok;

function main()
{
    plan(14);

    float noinit [];
    ok(noinit instanceof "ResizableFloatArray", "type of non initialized");
    is(elements(noinit), 0, "size of non initialized");

    float a []= [ 7, 42 ];
    ok(a instanceof "ResizableFloatArray", "type of initialized");
    is(elements(a), 2, "size of initialized");
    is(a[0], 7, "first value");
    is(a[1], 42, "second value");

    float b [2];
    ok(b instanceof "FixedFloatArray", "type of non initialized with size");
    is(elements(b), 2, "size of non initialized with size");

    float c [2] = [ 7, 42 ];
    ok(c instanceof "FixedFloatArray", "type of initialized with size");
    is(elements(c), 2, "size of initialized with size");
    is(c[0], 7, "first value");
    is(c[1], 42, "second value");

    int size= 4;
    float d[size];
    ok(c instanceof "FixedFloatArray", "type of non initialized with size non constant");
    is(elements(d), size, "size of non initialized with size non constant");
}

// End
