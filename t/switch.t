#! winxed
# Basic tests for switch instrucion

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (12);

    var a= ['a', 'b', 'c', 'd'];
    int i= 0;
    int j= 0;
next:
    switch (i)
    {
    case 0:
        is(a[i], 'a', 'int 1');
        is(j, 0, 'int 2');
        j = j + 1;
        break;
    case 1:
        is(a[i], 'b', 'int 3');
        is(j, 1, 'int 4');
        j = j + 1;
        break;
    case 2:
        is(a[i], 'c', 'int 5');
        is(j, 2, 'int 6');
        j = j + 1;
        break;
    default:
        is(j, 3, 'int 7');
    }
    i = i + 1;
    if (i < 4) goto next;
    is(j, 3, 'int 8');

    i= 0;
next2:
    switch(a[i])
    {
    case 'a':
        is (i, 0, 'string 1');
        break;
    case 'b':
        is (i, 1, 'string 2');
        break;
    case 'c':
        is (i, 2, 'string 3');
        break;
    default:
        is (i, 3, 'string 4');
    }
    i = i + 1;
    if (i < 4) goto next2;
}
