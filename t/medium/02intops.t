#! winxed

// int operators

using extern Test.More plan, throws_type, diag;

$include_const "except_types.pasm";

function main()
{
    plan (1);

    diag("Exceptions:");

    throws_type(divzero, EXCEPTION_DIV_BY_ZERO, "division by zero");
}

function divzero()
{
    // Use a function to make sure is not evaluated at compile time.
    int i = divide(1, 0);
}

function divide(int a, int b)
{
    return a / b;
}

// End
