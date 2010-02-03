sub nqp_handler($request)
{
  $request.contentType('text/html');
  $request.print(
"<html>\n" ~
"<body>\n" ~
"<h1>\n" ~
"Hello from nqp module!\n" ~
"</h1>\n" ~
"</body>\n" ~
"</html>\n"
  );
}
