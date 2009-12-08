#! winxed
# Basic tests for string array initializer

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (14);

    string noinit [];
    int n= noinit;
    is (n, 0, 'size');
    is (noinit instanceof 'ResizableStringArray', 1, 'type');

    string a []= [ 'foo', 'bar' ];
    n= a;
    is (n, 2, 'size');
    is (a instanceof 'ResizableStringArray', 1, 'type');
    is (a[0], 'foo', 'first value');
    is (a[1], 'bar', 'second value');

    string b [2];
    n= b;
    is (n, 2, 'size');
    is (b instanceof 'FixedStringArray', 1, 'type');

    string c [2] = [ 'foo', 'bar' ];
    n= c;
    is (n, 2, 'size');
    is (c instanceof 'FixedStringArray', 1, 'type');
    is (c[0], 'foo', 'first value');
    is (c[1], 'bar', 'second value');

    int size= 4;
    string d[size];
    n= d;
    is (n, size, 'non constant - size');
    is (c instanceof 'FixedStringArray', 1, 'non constant - type');
}
