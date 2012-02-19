# !winxed

// Default values in parameters

using extern Test.More is, done_testing;

function ret_int(int i = 42)
{
    return i;
}

//**********************************************************************

function main [main](args)
{
    is(ret_int(), 42, "int default value");
    is(ret_int(7), 7, "int provided value");

    done_testing();
}

// End
