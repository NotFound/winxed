#! winxed

// Basic tests for =: operator

using extern Test.More plan, is;

function main()
{
    plan (2);

    var a= new [ "FixedStringArray" ];
    a=: 42;
    is (a instanceof "FixedStringArray", 1, "type unchanged");
    int i= a;
    is (i, 42, "integer value assigned");
}

// End
