#! winxed

// Tests for lambda -> syntax

using extern Test.More plan, is;

function main[main]()
{
    plan(13);

    // Defining basic lambdas, assinging to variables
    var f1 = -> { return 4; };
    is(f1(), 4);

    var f2 = -> 4;
    is(f2(), 4);

    // Lambdas with arguments
    var f3 = ->(int x) { return x + 1; };
    is(f3(4), 5);

    var f4 = ->(int x) x + 1;
    is(f4(4), 5);

    // Inline definition and call
    is((-> { return 5; })(), 5);
    is((-> 5)(), 5);
    is((->(int x) { return x + 1; })(4), 5);
    is((->(int x) x + 1)(4), 5);

    // Lambdas returning lambdas
    var f5 = -> { return -> { return 5; }; };
    is(f5()(), 5);

    var f6 = -> -> 5;
    is(f6()(), 5);

    is((-> -> 5)()(), 5);

    // Lambdas as arguments to functions and lambdas
    var f7 = ->(f7_inner) { return f7_inner(); };
    is(f7(-> { return 5; }), 5);
    is(f7(-> 5), 5);
}
