# !winxed

// var cast builitin

$load 'Test/More.pbc';

function main()
{
    var (Test.More.plan)(1);

    var (Test.More.ok)(1, "cast to var avoid parse as method call");
}

// End
