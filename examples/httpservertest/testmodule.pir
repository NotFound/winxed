.HLL 'fake'

.sub 'handler_test'
    .param pmc request
    request.'contentType'('text/html')
    request.'print'( <<'END' )
<html>
<body>
<h1>Hello from test module in fake HLL!</h1>
<ul>
<li><a href="/internal/status.html">Server satus</a></li>
<li><a href="/internal/hello.html">Internal test</a></li>
<li><a href="/pir">Pir module</a></li>
<li><a href="/nqp">Nqp module</a></li>
</ul>
</body>
</html>
END
.end
