#! winxed
# Basic tests for int array initializer

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (12);

    int noinit [];
    int n= noinit;
    is (n, 0, 'size');
    is (noinit instanceof 'ResizableIntegerArray', 1, 'type');

    int a []= [ 7, 42 ];
    int n= a;
    is (n, 2, 'size');
    is (a instanceof 'ResizableIntegerArray', 1, 'type');
    is (a[0], 7, 'first value');
    is (a[1], 42, 'second value');

    int b [2];
    n= b;
    is (n, 2, 'size');
    is (b instanceof 'FixedIntegerArray', 1, 'type');

    int c [2] = [ 7, 42 ];
    n= c;
    is (n, 2, 'size');
    is (c instanceof 'FixedIntegerArray', 1, 'type');
    is (c[0], 7, 'first value');
    is (c[1], 42, 'second value');
}
