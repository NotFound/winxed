#
# Winxed generated file
#**************************************************

.include 'iterator.pasm'

#**************************************************
# Predefined functions

.sub 'is_null'
  .param pmc value
  $I0 = isnull value
  .return($I0)
.end

.sub 'die'
  .param string reason
  die reason
.end

.sub 'exit'
  .param int code
  exit code
.end

.sub 'print'
  .param pmc args :slurpy
  .local pmc it
  it = iter args
  it = .ITERATE_FROM_START
next:
  unless it goto argsend
  .local string s
  s = shift it
  print s
  goto next
argsend:
.end

.sub 'say'
  .param pmc args :slurpy
  'print'(args :flat)
  say ''
.end

.sub 'join'
  .param string sep
  .param pmc ar
  .local string s
  s = join sep, ar
  .return(s)
.end
.sub 'length'
  .param string s
  $I0 = length s
  .return($I0)
.end

.sub 'split'
  .param string sep
  .param string value
  .local pmc ar
  ar = split sep, value
  .return(ar)
.end

.sub 'Error'
  .param string msg
  .local pmc ex
  ex = root_new ['parrot';'Exception']
  ex['message'] = msg
  .return(ex)
.end

#**************************************************
# Begin generated code

.namespace [  ]

.sub 'main' :main
.annotate 'file', 't/instanceof.t'
.annotate 'line', 3
load_bytecode 'Test/More.pbc'
.local pmc plan
plan = get_hll_global [ 'Test'; 'More' ], 'plan'
.local pmc is
is = get_hll_global [ 'Test'; 'More' ], 'is'
.annotate 'file', 't/instanceof.t'
.annotate 'line', 9
plan(2)
.local pmc a
a = root_new ['parrot'; 'ResizableBooleanArray' ]
.local int check
$P1 = a
.annotate 'file', 't/instanceof.t'
.annotate 'line', 12
check = isa $P1, 'ResizableBooleanArray'
.annotate 'file', 't/instanceof.t'
.annotate 'line', 13
is(check, 1)
$P2 = a
.annotate 'file', 't/instanceof.t'
.annotate 'line', 14
check = isa $P2, 'FixedPMCArray'
.annotate 'file', 't/instanceof.t'
.annotate 'line', 15
is(check, 0)
.end


# End generated code.
