# Begin generated code


.sub initial_load_bytecode :anon :load :init
    load_bytecode 'Getopt/Obj.pbc'
.end

# end libs
.namespace [ 'Options' ]

.sub 'Options' :method
.param pmc __ARG_1
.param int __ARG_2

.annotate 'file', 'winxed_installed.winxed'
.annotate 'line', 13
# Body
# {
.annotate 'line', 15
# var options: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 16
root_new $P5, ['parrot';'ResizablePMCArray']
box $P6, 'c'
$P5.'push'($P6)
box $P6, 'Compile only. Same as --target=pir'
$P5.'push'($P6)
.annotate 'line', 15
$P3.'push'($P5)
.annotate 'line', 17
root_new $P7, ['parrot';'ResizablePMCArray']
box $P8, 'e=s'
$P7.'push'($P8)
box $P8, 'Evaluate'
$P7.'push'($P8)
.annotate 'line', 15
$P3.'push'($P7)
.annotate 'line', 18
root_new $P9, ['parrot';'ResizablePMCArray']
box $P10, 'help'
$P9.'push'($P10)
box $P10, 'Show this help'
$P9.'push'($P10)
.annotate 'line', 15
$P3.'push'($P9)
set $P1, $P3
.annotate 'line', 20
setattribute self, 'options', $P1
.annotate 'line', 21
iter $P11, $P1
set $P11, 0
__label_0: # for iteration
unless $P11 goto __label_1
shift $P2, $P11
$P4 = $P2[0]
.annotate 'line', 22
self.'push_string'($P4)
goto __label_0
__label_1: # endfor
.annotate 'line', 23
self.'notOptStop'(1)
.annotate 'line', 24
$P6 = __ARG_1.'shift'()
setattribute self, 'name', $P6
.annotate 'line', 25
$P8 = self.'get_options'(__ARG_1)
setattribute self, 'opts', $P8
# }
.annotate 'line', 26

.end # Options


.sub 'get' :method

.annotate 'line', 27
# Body
# {
.annotate 'line', 29
getattribute $P1, self, 'opts'
.return($P1)
# }
.annotate 'line', 30

.end # get


.sub 'showhelp' :method

.annotate 'line', 31
# Body
# {
.annotate 'line', 33
getattribute $P2, self, 'name'
# predefined say
print 'Usage: '
print $P2
say ' [options] [program] [args]'
# predefined say
.annotate 'line', 34
say '  Available options:'
.annotate 'line', 35
# int l: $I1
null $I1
.annotate 'line', 36
# int i: $I2
null $I2
.annotate 'line', 37
# var o: $P1
null $P1
.annotate 'line', 38
getattribute $P2, self, 'options'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 39
$S2 = $P1[0]
# predefined length
length $I3, $S2
add $I2, $I3, 4
.annotate 'line', 40
le $I2, $I1, __label_2
set $I1, $I2
__label_2: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 42
getattribute $P4, self, 'options'
iter $P5, $P4
set $P5, 0
__label_3: # for iteration
unless $P5 goto __label_4
shift $P1, $P5
# {
.annotate 'line', 43
# string s: $S1
$S1 = $P1[0]
.annotate 'line', 44
# predefined length
length $I4, $S1
isgt $I3, $I4, 1
unless $I3 goto __label_7
# predefined substr
substr $S2, $S1, 1, 1
isne $I3, $S2, '='
__label_7:
unless $I3 goto __label_5
concat $S0, '--', $S1
set $S1, $S0
goto __label_6
__label_5: # else
concat $S0, '-', $S1
set $S1, $S0
__label_6: # endif
.annotate 'line', 48
# predefined length
length $I4, $S1
sub $I2, $I1, $I4
.annotate 'line', 49
repeat $S3, ' ', $I2
$P4 = $P1[1]
# predefined say
print '    '
print $S1
print $S3
print '->  '
say $P4
# }
goto __label_3
__label_4: # endfor
# }
.annotate 'line', 51

.end # showhelp

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Options' ]
.annotate 'line', 7
get_class $P1, [ 'Getopt'; 'Obj' ]
addparent $P0, $P1
.annotate 'line', 9
addattribute $P0, 'name'
.annotate 'line', 10
addattribute $P0, 'options'
.annotate 'line', 11
addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'extname'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 55
# Body
# {
.annotate 'line', 59
# string newname: $S1
null $S1
.annotate 'line', 60
# int l: $I1
# predefined length
length $I1, __ARG_1
.annotate 'line', 61
isgt $I2, $I1, 7
unless $I2 goto __label_2
# predefined substr
substr $S2, __ARG_1, -7
iseq $I2, $S2, '.winxed'
__label_2:
unless $I2 goto __label_0
.annotate 'line', 62
sub $I3, $I1, 7
# predefined substr
substr $S3, __ARG_1, 0, $I3
concat $S0, $S3, __ARG_2
set $S1, $S0
goto __label_1
__label_0: # else
concat $S0, __ARG_1, __ARG_2
set $S1, $S0
__label_1: # endif
.annotate 'line', 65
.return($S1)
# }
.annotate 'line', 66

.end # extname


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 68
# Body
# {
.annotate 'line', 70
# var optionset: $P1
new $P12, [ 'Options' ]
$P12.'Options'(__ARG_1, 0)
set $P1, $P12
.annotate 'line', 71
# var options: $P2
$P2 = $P1.'get'()
.annotate 'line', 73
# var help: $P3
$P3 = $P2['help']
.annotate 'line', 74
# var compileonly: $P4
$P4 = $P2['c']
.annotate 'line', 75
# var eval: $P5
$P5 = $P2['e']
.annotate 'line', 77
if_null $P3, __label_0
# {
.annotate 'line', 78
$P1.'showhelp'()
.annotate 'line', 79
.return()
# }
__label_0: # endif
.annotate 'line', 82
# var compiler: $P6
# predefined load_language
load_language 'winxed'
compreg $P6, 'winxed'
.annotate 'line', 83
unless_null $P6, __label_1
# predefined die
.annotate 'line', 84
die "winxed: Cannot load language"
__label_1: # endif
.annotate 'line', 86
# var code: $P7
null $P7
.annotate 'line', 88
unless_null $P5, __label_2
# {
.annotate 'line', 89
# predefined elements
elements $I2, __ARG_1
ge $I2, 1, __label_4
# {
# predefined say
.annotate 'line', 90
say "ERROR: No program specified"
.annotate 'line', 91
$P1.'showhelp'()
.annotate 'line', 92
.return(1)
# }
__label_4: # endif
.annotate 'line', 94
# string srcfile: $S1
$S1 = __ARG_1[0]
.annotate 'line', 95
if_null $P4, __label_5
# {
.annotate 'line', 96
# var handleout: $P8
new $P8, [ 'StringHandle' ]
.annotate 'line', 97
$P8.'open'('', 'w')
.annotate 'line', 98
$P6.'compile_from_file_to_pir'($S1, $P8)
.annotate 'line', 99
$P8.'close'()
.annotate 'line', 100
# string pircode: $S2
$P12 = $P8.'read'(0)
null $S2
if_null $P12, __label_7
set $S2, $P12
__label_7:
.annotate 'line', 101
# string pirfile: $S3
$P13 = 'extname'($S1, '.pir')
null $S3
if_null $P13, __label_8
set $S3, $P13
__label_8:
.annotate 'line', 102
# var outfile: $P9
# predefined open
root_new $P9, ['parrot';'FileHandle']
$P9.'open'($S3,'w')
.annotate 'line', 103
$P9.'print'($S2)
.annotate 'line', 104
$P9.'close'()
.annotate 'line', 105
.return(0)
# }
goto __label_6
__label_5: # else
.annotate 'line', 108
$P7 = $P6.'compile_from_file'($S1)
__label_6: # endif
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 111
if_null $P4, __label_9
# predefined die
.annotate 'line', 112
die 'option -c with -e not supported yet'
__label_9: # endif
.annotate 'line', 113
# string expr: $S4
# predefined string
$S6 = $P5
concat $S0, 'function main[main](argv){', $S6
concat $S0, ';}'
set $S4, $S0
.annotate 'line', 114
$P7 = $P6.'compile'($S4)
.annotate 'line', 115
__ARG_1.'unshift'('__EVAL__')
# }
__label_3: # endif
.annotate 'line', 119
# var sub: $P10
null $P10
# for loop
.annotate 'line', 120
# int i: $I1
null $I1
__label_12: # for condition
# {
.annotate 'line', 121
$P10 = $P7[$I1]
.annotate 'line', 122
unless_null $P10, __label_13
goto __label_11 # break
__label_13: # endif
.annotate 'line', 123
# predefined string
$S6 = $P10
ne $S6, 'main', __label_14
goto __label_11 # break
__label_14: # endif
# }
__label_10: # for iteration
.annotate 'line', 120
inc $I1
goto __label_12
__label_11: # for end
.annotate 'line', 126
# try: create handler
new $P13, 'ExceptionHandler'
set_label $P13, __label_15
push_eh $P13
# try: begin
# {
.annotate 'line', 127
$P10(__ARG_1)
# }
# try: end
goto __label_16
.annotate 'line', 126
# catch
__label_15:
.get_results($P11)
finalize $P11
pop_eh
# {
.annotate 'line', 130
# string msg: $S5
$S5 = $P11['message']
# predefined cry
.annotate 'line', 131
getstderr $P0
print $P0, $P11
print $P0, "\n"
.annotate 'line', 132
.return(1)
# }
# catch end
__label_16:
# }
.annotate 'line', 134

.end # main

# End generated code
