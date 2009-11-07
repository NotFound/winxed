// predef.cpp
// Revision 7-nov-2009

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
".sub 'chomp'\n"
"  .param string str\n"
"  .param string sep :optional\n"
"  .param int has_sep :opt_flag\n"
"  load_bytecode 'String/Utils.pbc'\n"
"  .local pmc util_chomp\n"
"  util_chomp = get_root_global ['parrot';'String';'Utils'], 'chomp'\n"
"  if has_sep goto withsep\n"
"  $S0 = util_chomp(str)\n"
"  goto done\n"
"withsep:\n"
"  $S0 = util_chomp(str, sep)\n"
"done:\n"
"  .return($S0)\n"
".end\n"
"\n"
	;
}

// End of predef.cpp
