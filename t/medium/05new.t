# !winxed

// new operator and constructors

using extern Test.More plan, ok, is, is_null;

function main()
{
    plan(2);

    var obj;

    obj = new Hill.Fool;
    ok(obj != null && obj.attr == null, "new dotted without arguments");

    obj = new Hill.Fool();
    is(obj.attr, 42, "new dotted with empty argument list");
}

namespace Hill
{

class Fool
{
    var attr;
    function Fool()
    {
        self.attr = 42;
    }
}

}

// End
