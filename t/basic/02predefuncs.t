#! winxed

// Basic tests for predefined functions

using extern Test.More plan, is;

function main()
{
    plan (7);

    string r;
    int a = 65;

    // ord and chr
    is (chr(a), "A", 'chr with const argument');
    is (chr(65), "A", 'chr with non const argument');
    is (ord("A"), 65, 'ord with const argument');
    r = 'A';
    is (ord(r), 65, 'ord with non const argument');

    // Concatenate with chr.
    r = "a" + chr(10);
    is(length(r), 2, 'concatenate literal and chr const - low value');
    r = "a" + chr(1000);
    is(length(r), 2, 'concatenate literal and chr const - high value');
    r = chr(10) + chr(1000);
    is(length(r), 2, 'concatenate two chr const');
}

// End
