#! winxed

function aux()
{
    throw new 'Exception'({ 'message': 'something bad' });
}

function main()
{
    using extern Test.More;
    using Test.More.plan;
    using Test.More.is;

    plan(1);
    try aux();
    catch (e)
    {
        is(e['message'], 'something bad', 'get Exception message');
    }
}
