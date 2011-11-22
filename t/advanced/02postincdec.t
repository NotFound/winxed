#! winxed

// Tests for postfix ++ and -- operators with var

using extern Test.More plan, is;

function main()
{
    plan (4);

    var v = 0;
    var d;
    d = v++;
    is(d, 0, 'post ++ gives previous value - var');
    is(v, 1, 'post ++ increments - var');
    d = v--;
    is(d, 2, 'post -- gives previous value - var');
    is(v, 0, 'post -- increments - var');
}

// End
