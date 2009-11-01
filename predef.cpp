// predef.cpp
// Revision 1-nov-2009

#include "predef.h"

void emit_predef(std::ostream & os)
{
	os <<
"# Predefined functions\n"
".sub 'print'\n"
"  .param pmc args :slurpy\n"
"  .local pmc it\n"
"  it = iter args\n"
"  it = .ITERATE_FROM_START\n"
"next:\n"
"  unless it goto argsend\n"
"  .local string s\n"
"  s = shift it\n"
"  print s\n"
"  goto next\n"
"argsend:\n"
".end\n"
"\n"
".sub 'say'\n"
"  .param pmc args :slurpy\n"
"  'print'(args :flat)\n"
"  say ''\n"
".end\n"
"\n"
	;
}

// End of predef.cpp
