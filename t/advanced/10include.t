#! winxed

using extern Test.More plan, is;

$include 't/include/simple.winxhead';

function main()
{
    plan(1);

    is(THE_ANSWER, 42, "const int from included file");
}

// End
