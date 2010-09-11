# Begin generated code

.namespace [ ]

.sub 'loadData'
.param string __ARG_1

.annotate 'file', 'setup.winxed'
.annotate 'line', 24
# Body
# {
.annotate 'line', 26
# var json: $P1
# predefined load_language
load_language 'data_json'
compreg $P1, 'data_json'
.annotate 'line', 27
# var file: $P2
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_1)
.annotate 'line', 28
isnull $I1, $P2
if $I1 goto __label_1
$I1 = $P2.'is_closed'()
__label_1:
unless $I1 goto __label_0
concat $S2, "Can't open ", __ARG_1
# predefined Error
.annotate 'line', 29
root_new $P4, ['parrot';'Exception']
$P4['message'] = $S2
throw $P4
__label_0: # endif
.annotate 'line', 30
$P2.'encoding'('utf8')
.annotate 'line', 31
# string jsondata: $S1
$P4 = $P2.'readall'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 32
$P2.'close'()
.annotate 'line', 33
# var code: $P3
$P3 = $P1.'compile'($S1)
.annotate 'line', 34
.tailcall $P3()
# }
.annotate 'line', 35

.end # loadData


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 39
# Body
# {
.annotate 'line', 42
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 43
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 44
$P1.'notOptStop'(1)
.annotate 'line', 45
$P1.'push_string'('file=s')
.annotate 'line', 46
$P1.'push_string'('v')
.annotate 'line', 47
# string progname: $S1
$P5 = __ARG_1.'shift'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 48
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 49
# int verbose: $I1
$P5 = $P2['v']
isnull $I1, $P5
not $I1
.annotate 'line', 50
# var file: $P3
$P3 = $P2['file']
.annotate 'line', 54
# string filename: $S2
set $S2, 'setup.json'
.annotate 'line', 55
isnull $I2, $P3
not $I2
unless $I2 goto __label_1
set $S2, $P3
__label_1: # endif
.annotate 'line', 57
# var data: $P4
$P4 = 'loadData'($S2)
.annotate 'line', 59
unless $I1 goto __label_2
# {
.annotate 'line', 60
# string description: $S3
$S3 = $P4['description']
# predefined say
.annotate 'line', 61
print "\tFile: "
say $S2
$P6 = $P4['name']
# predefined say
.annotate 'line', 62
print "\tName: "
say $P6
# predefined say
.annotate 'line', 63
print "\tDescription: "
say $S3
$P6 = $P4['copyright_holder']
# predefined say
.annotate 'line', 64
print "\t(C) "
say $P6
# predefined say
.annotate 'line', 65
 say ''
# }
__label_2: # endif
.annotate 'line', 68
load_bytecode 'distutils.pbc'
.annotate 'line', 69
'setup'(__ARG_1 :flat, $P4 :flat :named)
# }
.annotate 'line', 70

.end # main

# End generated code
