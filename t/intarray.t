#! winxed

//  Basic tests for int array

using extern Test.More plan, is;

function main()
{
    plan (14);

    int noinit [];
    int n;
    is (noinit instanceof 'ResizableIntegerArray', 1, 'type of non initialized');
    is (elements(noinit), 0, 'size of non initialized');

    int a []= [ 7, 42 ];
    is (a instanceof 'ResizableIntegerArray', 1, 'type of initialized');
    is (elements(a), 2, 'size of initialized');
    is (a[0], 7, 'first value');
    is (a[1], 42, 'second value');

    int b [2];
    is (b instanceof 'FixedIntegerArray', 1, 'type of non initialized with size');
    is (elements(b), 2, 'size of non initialized with size');

    int c [2] = [ 7, 42 ];
    is (c instanceof 'FixedIntegerArray', 1, 'type of initialized with size');
    is (elements(c), 2, 'size of initialized with size');
    is (c[0], 7, 'first value');
    is (c[1], 42, 'second value');

    int size= 4;
    int d[size];
    is (c instanceof 'FixedIntegerArray', 1, 'type of non initialized with size non constant');
    is (elements(d), size, 'size of non initialized with size non constant');
}

// End
