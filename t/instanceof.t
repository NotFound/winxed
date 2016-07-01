#! winxed

// Mininal tests of instanceof operator

using extern Test.More plan, is;

class MyArray : [ "ResizablePMCArray" ]
{
}

class OtherArray : MyArray
{
}

function main [main] ()
{
    plan(4);

    var a = new [ "ResizableBooleanArray" ];
    int check= a instanceof "ResizableBooleanArray";
    is (check, 1, "is own type");
    check= a instanceof "FixedPMCArray";
    is (check, 0, "is not a different type");
    var b = new MyArray;
    check= b instanceof "ResizablePMCArray";
    is (check, 1, "is a parent");
    var c = new MyArray;
    check= c instanceof "ResizablePMCArray";
    is (check, 1, "is a grandparent");
}

// End
