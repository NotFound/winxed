#! winxed

// namespace syntax tests

using extern Test.More plan, is;

namespace A.B.C {
    function e() { return "A.B.C.d"; }
}

namespace A.B.C.D {
    function e() { return "A.B.C.D.e"; }
}

function main[main]()
{
    plan(2);

    is(A.B.C.e(), "A.B.C.d");
    is(A.B.C.D.e(), "A.B.C.D.e");
}
