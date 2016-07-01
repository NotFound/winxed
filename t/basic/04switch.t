#! winxed

// Basic tests: expression-less switch

using extern Test.More plan, is;

function main()
{
    plan(2);

    int i = 2;
    int check = 0;
    switch {
        case i == 1:
            check = 1;
            break;
        case i == 2:
            check = 2;
            break;
        default:
            check = 3;
    }
    is(check, 2, "simple expression-less switch");

    i = 4;
    check = 0;
    switch {
        case i == 1:
            check = 1;
            break;
        case i == 2:
            check = 2;
            break;
        default:
            check = 3;
    }
    is(check, 3, "default case for switch");
}

// End
