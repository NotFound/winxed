#! winxed

// Basic tests: do loop

using extern Test.More plan, is;

function main()
{
    plan(1);

    var c = new [ "Integer" ];
    c =: 4;
    int i = 0;
    do {
        --c;
	++i;
    } while (c);
    is(i, 4, "do loop with var");
}

// End
