#! winxed

// Tests for closures and lambdas, using Y-combinators as an example

using extern Test.More plan, is;

// "normal" Y-combinator using function syntax
function Y(outer)
{
    return (function(func) {
        return func(func);
    })(function(func) {
        return outer(function(arg) {
            return func(func)(arg);
        });
    });
}

// Y-combinator written with lambdas
function Y_lambda(var outer) {
    return (->(func) func(func))(->(func) outer(->(arg) func(func)(arg)));
}

// Naive recursive implementation of a factorial
function factorial_recursive(int n)
{
    return n == 0 ? 1 : n * int(factorial_recursive(n - 1));
}

function main()
{
    plan(5);
    is(factorial_recursive(6), 720, "recursive factorial gives correct results");

    var factorial_y = function(var func) {
        return function(int n) {
            return n == 0 ? 1 : n * int(func(n - 1));
        };
    };
    var lambda_fact = ->(func) ->(int n) n == 0 ? 1 : n * int(func(n - 1));

    is(Y(factorial_y)(6), 720, "Normal Y(factorial) works");
    is(Y_lambda(factorial_y)(6), 720, "Y_lambda(factorial) works");

    is(Y(lambda_fact)(6), 720, "Y(lambda_fact) works");
    is(Y_lambda(lambda_fact)(6), 720, "Y_lambda(lambda_fact) works");
}
