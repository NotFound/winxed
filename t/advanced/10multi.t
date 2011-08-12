#! winxed

// multi syntax

using extern Test.More plan, is;

multi bar(var a) { return a; }
multi bar(int a, int b) { return a * b; }
multi bar(int a) { return a + 10; }
multi bar(string a, string b) { return a + b; }

function main[main]()
{
    plan(4);
    var bar;
    ${ get_global bar, "bar" };
    is(bar(3, 2), 6, "multi(int, int)");
    is(bar(3), 13, "multi(int)");
    is(bar("a", "b"), "ab", "multi(string, string)");
    is(bar(3.14), 3.14, "multi(var)");
}
