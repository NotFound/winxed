#! winxed

// Tests for literal strings encoding.

// This file use unicode utf8 encoding.
// Be careful to not recode it.

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;
    plan (1);

    string s= "ñÑáéíóú";
    is(length(s), 7, 'Non ascci string have correct length');
}
