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
.annotate 'line', 17
# Body
# {
.annotate 'line', 19
# var options: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 20
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, 'c'
$P4.'push'($P5)
box $P5, 'Compile only. Same as --target=pir'
$P4.'push'($P5)
.annotate 'line', 19
$P1.'push'($P4)
.annotate 'line', 21
root_new $P6, ['parrot';'ResizablePMCArray']
box $P7, 'e=s'
$P6.'push'($P7)
box $P7, 'Evaluate'
$P6.'push'($P7)
.annotate 'line', 19
$P1.'push'($P6)
.annotate 'line', 22
root_new $P8, ['parrot';'ResizablePMCArray']
box $P9, 'L=s'
$P8.'push'($P9)
box $P9, 'Add to parrot library search path'
$P8.'push'($P9)
.annotate 'line', 19
$P1.'push'($P8)
.annotate 'line', 23
root_new $P10, ['parrot';'ResizablePMCArray']
box $P11, 'I=s'
$P10.'push'($P11)
box $P11, 'Add to parrot include search path'
$P10.'push'($P11)
.annotate 'line', 19
$P1.'push'($P10)
.annotate 'line', 24
root_new $P12, ['parrot';'ResizablePMCArray']
box $P13, 'help'
$P12.'push'($P13)
box $P13, 'Show this help'
$P12.'push'($P13)
.annotate 'line', 19
$P1.'push'($P12)
.annotate 'line', 26
setattribute self, 'options', $P1
.annotate 'line', 27
iter $P14, $P1
set $P14, 0
__label_0: # for iteration
unless $P14 goto __label_1
shift $P2, $P14
.annotate 'line', 28
$P4 = $P2[0]
self.'push_string'($P4)
goto __label_0
__label_1: # endfor
.annotate 'line', 29
self.'notOptStop'(1)
.annotate 'line', 30
$P6 = __ARG_1.'shift'()
setattribute self, 'name', $P6
.annotate 'line', 31
$P8 = self.'get_options'(__ARG_1)
setattribute self, 'opts', $P8
# }
.annotate 'line', 32

.end # Options


.sub 'get' :method

.annotate 'line', 33
# Body
# {
.annotate 'line', 35
getattribute $P1, self, 'opts'
.return($P1)
# }
.annotate 'line', 36

.end # get


.sub 'showhelp' :method

.annotate 'line', 37
# Body
# {
.annotate 'line', 39
getattribute $P2, self, 'name'
# predefined say
print 'Usage: '
print $P2
say ' [options] [program] [args]'
# predefined say
.annotate 'line', 40
say '  Available options:'
.annotate 'line', 41
# int l: $I1
null $I1
.annotate 'line', 42
# int i: $I2
null $I2
.annotate 'line', 43
# var o: $P1
null $P1
.annotate 'line', 44
getattribute $P2, self, 'options'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 45
$S2 = $P1[0]
# predefined length
length $I3, $S2
add $I2, $I3, 4
.annotate 'line', 46
le $I2, $I1, __label_2
set $I1, $I2
__label_2: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 48
getattribute $P4, self, 'options'
iter $P5, $P4
set $P5, 0
__label_3: # for iteration
unless $P5 goto __label_4
shift $P1, $P5
# {
.annotate 'line', 49
# string s: $S1
$S1 = $P1[0]
.annotate 'line', 50
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
.annotate 'line', 54
# predefined length
length $I4, $S1
sub $I2, $I1, $I4
.annotate 'line', 55
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
.annotate 'line', 57

.end # showhelp

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Options' ]
.annotate 'line', 11
get_class $P1, [ 'Getopt'; 'Obj' ]
addparent $P0, $P1
.annotate 'line', 13
addattribute $P0, 'name'
.annotate 'line', 14
addattribute $P0, 'options'
.annotate 'line', 15
addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'extname'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 61
# Body
# {
.annotate 'line', 65
# string newname: $S1
null $S1
.annotate 'line', 66
# int l: $I1
# predefined length
length $I1, __ARG_1
.annotate 'line', 67
isgt $I2, $I1, 7
unless $I2 goto __label_2
# predefined substr
substr $S2, __ARG_1, -7
iseq $I2, $S2, '.winxed'
__label_2:
unless $I2 goto __label_0
.annotate 'line', 68
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
.annotate 'line', 71
.return($S1)
# }
.annotate 'line', 72

.end # extname


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 74
# Body
# {
.annotate 'line', 76
# var optionset: $P1
new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1, 0)
.annotate 'line', 77
# var options: $P2
$P2 = $P1.'get'()
.annotate 'line', 79
# var help: $P3
$P3 = $P2['help']
.annotate 'line', 80
# var compileonly: $P4
$P4 = $P2['c']
.annotate 'line', 81
# var eval: $P5
$P5 = $P2['e']
.annotate 'line', 82
# var opt_L: $P6
$P6 = $P2['L']
.annotate 'line', 83
# var opt_I: $P7
$P7 = $P2['I']
.annotate 'line', 85
if_null $P3, __label_0
# {
.annotate 'line', 86
$P1.'showhelp'()
# predefined exit
.annotate 'line', 87
exit 0
# }
__label_0: # endif
.annotate 'line', 90
# var compiler: $P8
# predefined load_language
load_language 'winxed'
compreg $P8, 'winxed'
.annotate 'line', 91
unless_null $P8, __label_1
# predefined die
.annotate 'line', 92
die "winxed: Cannot load language"
__label_1: # endif
.annotate 'line', 94
if_null $P6, __label_2
# {
.annotate 'line', 95
# var interp: $P9
null $P9
.annotate 'line', 96
# pirop getinterp
getinterp $P9
.annotate 'line', 97
# var lpaths: $P10
$P10 = $P9[9]
.annotate 'line', 98
# var pathlib: $P11
$P11 = $P10[1]
.annotate 'line', 99
# predefined string
set $S6, $P6
$P11.'push'($S6)
# }
__label_2: # endif
.annotate 'line', 101
if_null $P7, __label_3
# {
.annotate 'line', 102
# var interp: $P12
null $P12
.annotate 'line', 103
# pirop getinterp
getinterp $P12
.annotate 'line', 104
# var lpaths: $P13
$P13 = $P12[9]
.annotate 'line', 105
# var pathlib: $P14
$P14 = $P13[0]
.annotate 'line', 106
# predefined string
set $S6, $P7
$P14.'push'($S6)
# }
__label_3: # endif
.annotate 'line', 109
# var code: $P15
null $P15
.annotate 'line', 111
unless_null $P5, __label_4
# {
.annotate 'line', 112
# predefined elements
elements $I3, __ARG_1
ge $I3, 1, __label_6
# {
# predefined say
.annotate 'line', 113
say "ERROR: No program specified"
.annotate 'line', 114
$P1.'showhelp'()
# predefined exit
.annotate 'line', 115
exit 1
# }
__label_6: # endif
.annotate 'line', 117
# string srcfile: $S1
$S1 = __ARG_1[0]
.annotate 'line', 118
if_null $P4, __label_7
# {
.annotate 'line', 119
# var handleout: $P16
new $P16, [ 'StringHandle' ]
.annotate 'line', 120
$P16.'open'('', 'w')
.annotate 'line', 121
$P8.'compile_from_file_to_pir'($S1, $P16)
.annotate 'line', 122
$P16.'close'()
.annotate 'line', 123
# string pircode: $S2
$P21 = $P16.'read'(0)
null $S2
if_null $P21, __label_9
set $S2, $P21
__label_9:
.annotate 'line', 124
# string pirfile: $S3
$P21 = 'extname'($S1, '.pir')
null $S3
if_null $P21, __label_10
set $S3, $P21
__label_10:
.annotate 'line', 125
# var outfile: $P17
# predefined open
root_new $P17, ['parrot';'FileHandle']
$P17.'open'($S3,'w')
.annotate 'line', 126
$P17.'print'($S2)
.annotate 'line', 127
$P17.'close'()
# predefined exit
.annotate 'line', 128
exit 0
# }
goto __label_8
__label_7: # else
.annotate 'line', 131
$P15 = $P8.'compile_from_file'($S1)
__label_8: # endif
# }
goto __label_5
__label_4: # else
# {
.annotate 'line', 134
# string expr: $S4
# predefined string
set $S7, $P5
concat $S4, 'function main[main](argv){', $S7
concat $S4, $S4, ';}'
.annotate 'line', 135
if_null $P4, __label_11
# {
.annotate 'line', 136
$P15 = $P8.'compile'($S4, "pir" :named("target"))
.annotate 'line', 137
# predefined print
print $P15
# predefined exit
.annotate 'line', 138
exit 0
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 141
$P15 = $P8.'compile'($S4)
.annotate 'line', 142
__ARG_1.'unshift'('__EVAL__')
# }
__label_12: # endif
# }
__label_5: # endif
.annotate 'line', 147
# var sub: $P18
null $P18
# for loop
.annotate 'line', 148
# int i: $I1
null $I1
__label_15: # for condition
# {
.annotate 'line', 149
$P18 = $P15[$I1]
.annotate 'line', 150
unless_null $P18, __label_16
goto __label_14 # break
__label_16: # endif
.annotate 'line', 151
# predefined string
set $S7, $P18
ne $S7, 'main', __label_17
goto __label_14 # break
__label_17: # endif
# }
__label_13: # for iteration
.annotate 'line', 148
inc $I1
goto __label_15
__label_14: # for end
.annotate 'line', 154
# int retval: $I2
null $I2
.annotate 'line', 155
# try: create handler
new $P22, 'ExceptionHandler'
set_label $P22, __label_18
$P22.'handle_types_except'(64)
push_eh $P22
# try: begin
# {
.annotate 'line', 156
# var retvalp: $P19
$P19 = $P18(__ARG_1)
.annotate 'line', 157
if_null $P19, __label_20
set $I2, $P19
__label_20: # endif
.annotate 'line', 158
# }
# try: end
pop_eh
goto __label_19
.annotate 'line', 155
# catch
__label_18:
.get_results($P20)
finalize $P20
pop_eh
# {
.annotate 'line', 161
# string msg: $S5
$S5 = $P20['message']
.annotate 'line', 162
isnull $I3, $S5
not $I3
unless $I3 goto __label_22
isne $I3, $S5, ''
__label_22:
unless $I3 goto __label_21
.annotate 'line', 163
# predefined cry
getstderr $P0
print $P0, $S5
print $P0, "\n"
__label_21: # endif
set $I2, 1
.annotate 'line', 164
# }
# catch end
__label_19:
.annotate 'line', 166
# predefined exit
exit $I2
# }
.annotate 'line', 167

.end # main

# End generated code
