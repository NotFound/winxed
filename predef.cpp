// predef.cpp
// Revision 27-jan-2010

#include "predef.h"

void emit_predef(std::ostream & os)
{
	os <<
"# Predefined functions\n"
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
