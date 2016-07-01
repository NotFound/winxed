#! winxed

// Basic tests: initizalizers with mixed types

using extern Test.More done_testing, is;

function int_string()
{
    int i1 = "42";
    is(i1, 42, "int from literal string");

    const string sc1 = "4";
    int i2 = sc1;
    is(i2, 4, "int from const string");
    int i3 = sc1 + "2";
    is(i3, 42, "int from const string expression");

    string s1 = sc1;
    string s2 = "20";
    int i4 = s1 + s2;
    is(i4, 420, "int from string expression");
}

function string_int()
{
    string s1 = 42;
    is(s1, "42", "string from literal int");

    const int ic1 = 4;
    string s2 = ic1;
    is(s2, "4", "string from const int");
    string s3 = ic1 * 10 + 2;
    is(s3, "42", "string from const int expression");

    int i1 = ic1 * 100;
    int i2 = 20;
    string s4 = i1 + i2;
    is(s4, "420", "string from int expression");
}

function main()
{
    int_string();
    string_int();

    done_testing();
}

// End
