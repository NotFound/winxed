#! winxed

// Scope resolution tests.

using extern Test.More plan, is;

namespace Base
{

    function foo() { return __FUNCTION__; }

    namespace Foo
    {
        function foo() { return __FUNCTION__; }
    } // namespace Foo

    namespace Bar
    {
        function bar()
        {
            return __FUNCTION__ + "-" + string(foo());
        }
        function bar2()
        {
            is(Foo.foo(), "Base.Foo.foo");
            is(Bar.bar(), "Base.Bar.bar-Base.foo");
            is(Base.foo(), "Base.foo");
            is(Base.Foo.foo(), "Base.Foo.foo");
            return  __FUNCTION__;
        }
    } // namespace Bar

    namespace Bar2
    {
        using Foo.foo;

        function bar()
        {
            is(foo(), "Base.Foo.foo");
            return __FUNCTION__;
        }
    } // namespace Bar2

    namespace Bar3
    {
        using namespace Foo;

        function bar()
        {
            is(foo(), "Base.Foo.foo");
            return __FUNCTION__;
        }
    } // namespace Bar3

    namespace Bar4
    {
        namespace Foo
        {
            function foo() { return __FUNCTION__; }
        } // namespace Foo
        using namespace Foo;

        function bar()
        {
            is(foo(), "Base.Bar4.Foo.foo");
            return __FUNCTION__;
        }

    } // namespace Bar4

    namespace Bar5
    {
        function bar()
        {
            is(foo(), "Base.Foo.foo");
            is(Base.Foo.foo(), "Base.Foo.foo");
            is(Bar5.Foo.foo(), "Base.Bar5.Foo.foo");
            return __FUNCTION__;
        }

        namespace Foo
        {
            function foo() {return __FUNCTION__; }
        } // namespace Foo
        using namespace Base.Foo;

    } // namespace Bar5

    namespace Bar6
    {
        function bar()
        {
            is(foo(), "Base.Foo.foo");
            is(Base.Foo.foo(), "Base.Foo.foo");
            is(Bar6.Foo.foo(), "Base.Bar6.Foo.foo");
            return __FUNCTION__;
        }

    } // namespace Bar6

    namespace Bar6
    {

        namespace Foo
        {
            function foo() { return __FUNCTION__; }
        } // namespace Foo
        using namespace Base.Foo;
    } // namespace Bar6

    namespace Bar7
    {
        namespace Foo { }
        using namespace Foo;
        function bar()
        {
            is(foo(), "Base.Bar7.Foo.foo");
            is(Base.Foo.foo(), "Base.Foo.foo");
            is(Bar7.Foo.foo(), "Base.Bar7.Foo.foo");
            return __FUNCTION__;
        }

    } // namespace Bar7

    namespace Bar7
    {

        namespace Foo
        {
            function foo() { return __FUNCTION__; }
        } // namespace Foo
    } // namespace Bar7

} // namespace Base

namespace Base2
{
    function bar()
    {
        is(Base.foo(), "Base.foo");
        return __FUNCTION__;
    }
}

function main()
{
    plan(26);

    is(Base2.bar(), "Base2.bar");
    is(Base.Bar.bar2(), "Base.Bar.bar2");
    is(Base.Bar.bar(), "Base.Bar.bar-Base.foo");
    is(Base.Bar2.bar(), "Base.Bar2.bar");
    is(Base.Bar3.bar(), "Base.Bar3.bar");
    is(Base.Bar4.bar(), "Base.Bar4.bar");
    is(Base.Bar5.bar(), "Base.Bar5.bar");
    is(Base.Bar6.bar(), "Base.Bar6.bar");
    is(Base.Bar7.bar(), "Base.Bar7.bar");
}

// End
