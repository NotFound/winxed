#! winxed

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(2);

    var a = new 'ResizableBooleanArray';
    int check= a instanceof 'ResizableBooleanArray';
    is (check, 1);
    check= a instanceof 'FixedPMCArray';
    is (check, 0);
}
