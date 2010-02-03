.sub 'pir_handler'
    .param pmc request
    request.'contentType'('text/html')
    request.'print'( <<'END' )
<html>
<body>
<h1>Hello from PIR module!</h1>
</body>
</html>
END
.end
