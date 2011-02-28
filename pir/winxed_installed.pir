# Begin generated code


.sub initial_load_bytecode :anon :load :init
    load_bytecode 'Getopt/Obj.pbc'
.end

# end libs
.namespace [ 'WinxedDriverOptions' ]

.sub 'WinxedDriverOptions' :method
.param pmc __ARG_1

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
push $P4, $P5
box $P5, 'Compile to pir'
push $P4, $P5
.annotate 'line', 19
push $P1, $P4
.annotate 'line', 21
root_new $P6, ['parrot';'ResizablePMCArray']
box $P7, 'e=s'
push $P6, $P7
box $P7, 'Evaluate'
push $P6, $P7
.annotate 'line', 19
push $P1, $P6
.annotate 'line', 22
root_new $P8, ['parrot';'ResizablePMCArray']
box $P9, 'o=s'
push $P8, $P9
box $P9, 'Object name'
push $P8, $P9
.annotate 'line', 19
push $P1, $P8
.annotate 'line', 23
root_new $P10, ['parrot';'ResizablePMCArray']
box $P11, 'L=s'
push $P10, $P11
box $P11, 'Add to parrot library search path'
push $P10, $P11
.annotate 'line', 19
push $P1, $P10
.annotate 'line', 24
root_new $P12, ['parrot';'ResizablePMCArray']
box $P13, 'I=s'
push $P12, $P13
box $P13, 'Add to parrot include search path'
push $P12, $P13
.annotate 'line', 19
push $P1, $P12
.annotate 'line', 25
root_new $P14, ['parrot';'ResizablePMCArray']
box $P15, 'nowarn'
push $P14, $P15
box $P15, 'No warnings'
push $P14, $P15
.annotate 'line', 19
push $P1, $P14
.annotate 'line', 26
root_new $P16, ['parrot';'ResizablePMCArray']
box $P17, 'noan'
push $P16, $P17
box $P17, 'No code annotations'
push $P16, $P17
.annotate 'line', 19
push $P1, $P16
.annotate 'line', 27
root_new $P18, ['parrot';'ResizablePMCArray']
box $P19, 'help'
push $P18, $P19
box $P19, 'Show this help'
push $P18, $P19
.annotate 'line', 19
push $P1, $P18
.annotate 'line', 29
setattribute self, 'options', $P1
.annotate 'line', 30
iter $P20, $P1
set $P20, 0
__label_0: # for iteration
unless $P20 goto __label_1
shift $P2, $P20
.annotate 'line', 31
$P3 = $P2[0]
self.'push_string'($P3)
goto __label_0
__label_1: # endfor
.annotate 'line', 32
self.'notOptStop'(1)
.annotate 'line', 33
$P4 = __ARG_1.'shift'()
setattribute self, 'name', $P4
.annotate 'line', 34
$P4 = self.'get_options'(__ARG_1)
setattribute self, 'opts', $P4
# }
.annotate 'line', 35

.end # WinxedDriverOptions


.sub 'getbool' :method
.param string __ARG_1

.annotate 'line', 36
# Body
# {
.annotate 'line', 38
# var value: $P1
getattribute $P2, self, 'opts'
$P1 = $P2[__ARG_1]
.annotate 'line', 39
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 40

.end # getbool


.sub 'getstring' :method
.param string __ARG_1

.annotate 'line', 41
# Body
# {
.annotate 'line', 43
# var value: $P1
getattribute $P2, self, 'opts'
$P1 = $P2[__ARG_1]
.annotate 'line', 44
# string result: $S1
null $S1
.annotate 'line', 45
if_null $P1, __label_0
.annotate 'line', 46
set $S1, $P1
__label_0: # endif
.annotate 'line', 47
.return($S1)
# }
.annotate 'line', 48

.end # getstring


.sub 'showhelp' :method

.annotate 'line', 49
# Body
# {
.annotate 'line', 51
getattribute $P2, self, 'name'
# predefined say
print 'Usage: '
print $P2
say ' [options] [program] [args]'
# predefined say
.annotate 'line', 52
say '  Available options:'
.annotate 'line', 53
# int l: $I1
null $I1
.annotate 'line', 54
# int i: $I2
null $I2
.annotate 'line', 55
# var o: $P1
null $P1
.annotate 'line', 56
getattribute $P2, self, 'options'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 57
$P4 = $P1[0]
set $S2, $P4
# predefined length
length $I3, $S2
add $I2, $I3, 4
.annotate 'line', 58
le $I2, $I1, __label_2
set $I1, $I2
__label_2: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 60
getattribute $P2, self, 'options'
iter $P5, $P2
set $P5, 0
__label_3: # for iteration
unless $P5 goto __label_4
shift $P1, $P5
# {
.annotate 'line', 61
# string s: $S1
$S1 = $P1[0]
.annotate 'line', 62
# predefined length
length $I4, $S1
isgt $I3, $I4, 1
unless $I3 goto __label_7
# predefined substr
substr $S2, $S1, 1, 1
isne $I3, $S2, '='
__label_7:
unless $I3 goto __label_5
.annotate 'line', 63
concat $S0, '--', $S1
set $S1, $S0
goto __label_6
__label_5: # else
.annotate 'line', 65
concat $S0, '-', $S1
set $S1, $S0
__label_6: # endif
.annotate 'line', 66
# predefined length
length $I3, $S1
sub $I2, $I1, $I3
.annotate 'line', 67
repeat $S2, ' ', $I2
$P2 = $P1[1]
# predefined say
print '    '
print $S1
print $S2
print '->  '
say $P2
# }
goto __label_3
__label_4: # endfor
# }
.annotate 'line', 69

.end # showhelp

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedDriverOptions' ]
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

.annotate 'line', 73
# Body
# {
.annotate 'line', 77
# string newname: $S1
null $S1
.annotate 'line', 78
# int l: $I1
# predefined length
length $I1, __ARG_1
.annotate 'line', 79
isgt $I2, $I1, 7
unless $I2 goto __label_2
# predefined substr
substr $S2, __ARG_1, -7
iseq $I2, $S2, '.winxed'
__label_2:
unless $I2 goto __label_0
.annotate 'line', 80
sub $I3, $I1, 7
# predefined substr
substr $S3, __ARG_1, 0, $I3
concat $S0, $S3, __ARG_2
set $S1, $S0
goto __label_1
__label_0: # else
.annotate 'line', 82
concat $S0, __ARG_1, __ARG_2
set $S1, $S0
__label_1: # endif
.annotate 'line', 83
.return($S1)
# }
.annotate 'line', 84

.end # extname


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 86
# Body
# {
.annotate 'line', 88
# var optionset: $P1
new $P1, [ 'WinxedDriverOptions' ]
$P1.'WinxedDriverOptions'(__ARG_1)
.annotate 'line', 90
# int help: $I1
$P16 = $P1.'getbool'('help')
set $I1, $P16
.annotate 'line', 91
# int compileonly: $I2
$P16 = $P1.'getbool'('c')
set $I2, $P16
.annotate 'line', 92
# string eval: $S1
$P16 = $P1.'getstring'('e')
null $S1
if_null $P16, __label_0
set $S1, $P16
__label_0:
.annotate 'line', 93
# string object: $S2
$P16 = $P1.'getstring'('o')
null $S2
if_null $P16, __label_1
set $S2, $P16
__label_1:
.annotate 'line', 94
# string opt_L: $S3
$P16 = $P1.'getstring'('L')
null $S3
if_null $P16, __label_2
set $S3, $P16
__label_2:
.annotate 'line', 95
# string opt_I: $S4
$P16 = $P1.'getstring'('I')
null $S4
if_null $P16, __label_3
set $S4, $P16
__label_3:
.annotate 'line', 96
# int nowarn: $I3
$P16 = $P1.'getbool'('nowarn')
set $I3, $P16
.annotate 'line', 97
# int noan: $I4
$P16 = $P1.'getbool'('noan')
set $I4, $P16
.annotate 'line', 99
unless $I1 goto __label_4
# {
.annotate 'line', 100
$P1.'showhelp'()
# predefined exit
.annotate 'line', 101
exit 0
# }
__label_4: # endif
.annotate 'line', 104
isnull $I7, $S2
not $I7
unless $I7 goto __label_6
not $I7, $I2
__label_6:
unless $I7 goto __label_5
# predefined die
.annotate 'line', 105
die '-o without -c is not supported yet'
__label_5: # endif
.annotate 'line', 107
# var compiler: $P2
# predefined load_language
load_language 'winxed'
compreg $P2, 'winxed'
.annotate 'line', 108
unless_null $P2, __label_7
# predefined die
.annotate 'line', 109
die "winxed: Cannot load language"
__label_7: # endif
.annotate 'line', 111
if_null $S3, __label_8
# {
.annotate 'line', 112
# var interp: $P3
null $P3
.annotate 'line', 113
# pirop getinterp
getinterp $P3
.annotate 'line', 114
# var lpaths: $P4
$P4 = $P3[9]
.annotate 'line', 115
# var pathlib: $P5
$P5 = $P4[1]
.annotate 'line', 116
# predefined string
set $S10, $S3
$P5.'push'($S10)
# }
__label_8: # endif
.annotate 'line', 118
if_null $S4, __label_9
# {
.annotate 'line', 119
# var interp: $P6
null $P6
.annotate 'line', 120
# pirop getinterp
getinterp $P6
.annotate 'line', 121
# var lpaths: $P7
$P7 = $P6[9]
.annotate 'line', 122
# var pathlib: $P8
$P8 = $P7[0]
.annotate 'line', 123
# predefined string
set $S10, $S4
$P8.'push'($S10)
# }
__label_9: # endif
.annotate 'line', 126
# var code: $P9
null $P9
.annotate 'line', 127
# var compileoptions: $P10
root_new $P10, ['parrot';'Hash']
$P10["noan"] = $I4
$P10["nowarn"] = $I3
.annotate 'line', 129
unless_null $S1, __label_10
# {
.annotate 'line', 130
# predefined elements
elements $I7, __ARG_1
ge $I7, 1, __label_12
# {
# predefined say
.annotate 'line', 131
say "ERROR: No program specified"
.annotate 'line', 132
$P1.'showhelp'()
# predefined exit
.annotate 'line', 133
exit 1
# }
__label_12: # endif
.annotate 'line', 135
# string srcfile: $S5
$S5 = __ARG_1[0]
.annotate 'line', 136
unless $I2 goto __label_13
# {
.annotate 'line', 137
# var handleout: $P11
new $P11, [ 'StringHandle' ]
.annotate 'line', 138
$P11.'open'('', 'w')
.annotate 'line', 139
$P2.'compile_from_file_to_pir'($S5, $P11, $P10 :flat :named)
.annotate 'line', 141
$P11.'close'()
.annotate 'line', 142
# string pircode: $S6
$P16 = $P11.'read'(0)
null $S6
if_null $P16, __label_15
set $S6, $P16
__label_15:
.annotate 'line', 143
# string pirfile: $S7
if_null $S2, __label_17
set $S7, $S2
goto __label_16
__label_17:
# predefined string
$P16 = 'extname'($S5, '.pir')
set $S7, $P16
__label_16:
.annotate 'line', 144
# var outfile: $P12
# predefined open
root_new $P12, ['parrot';'FileHandle']
$P12.'open'($S7,'w')
.annotate 'line', 145
$P12.'print'($S6)
.annotate 'line', 146
$P12.'close'()
# predefined exit
.annotate 'line', 147
exit 0
# }
goto __label_14
__label_13: # else
.annotate 'line', 150
$P9 = $P2.'compile_from_file'($S5, $P10 :flat :named)
__label_14: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 154
# string expr: $S8
concat $S8, 'function main[main](argv){', $S1
concat $S8, $S8, ';}'
.annotate 'line', 155
unless $I2 goto __label_18
# {
.annotate 'line', 156
$P9 = $P2.'compile'($S8, "pir" :named("target"), $P10 :flat :named)
.annotate 'line', 158
# predefined print
print $P9
# predefined exit
.annotate 'line', 159
exit 0
# }
goto __label_19
__label_18: # else
# {
.annotate 'line', 162
$P9 = $P2.'compile'($S8, $P10 :flat :named)
.annotate 'line', 164
__ARG_1.'unshift'('__EVAL__')
# }
__label_19: # endif
# }
__label_11: # endif
.annotate 'line', 169
# var sub: $P13
null $P13
# for loop
.annotate 'line', 170
# int i: $I5
null $I5
__label_22: # for condition
# {
.annotate 'line', 171
$P13 = $P9[$I5]
.annotate 'line', 172
unless_null $P13, __label_23
goto __label_21 # break
__label_23: # endif
.annotate 'line', 173
# predefined string
set $S10, $P13
ne $S10, 'main', __label_24
goto __label_21 # break
__label_24: # endif
# }
__label_20: # for iteration
.annotate 'line', 170
inc $I5
goto __label_22
__label_21: # for end
.annotate 'line', 176
# int retval: $I6
null $I6
.annotate 'line', 177
# try: create handler
new $P16, 'ExceptionHandler'
set_label $P16, __label_25
$P16.'handle_types_except'(64)
push_eh $P16
# try: begin
# {
.annotate 'line', 178
# var retvalp: $P14
$P14 = $P13(__ARG_1)
.annotate 'line', 179
if_null $P14, __label_27
.annotate 'line', 180
set $I6, $P14
__label_27: # endif
# }
# try: end
pop_eh
goto __label_26
.annotate 'line', 177
# catch
__label_25:
.get_results($P15)
finalize $P15
pop_eh
# {
.annotate 'line', 183
# string msg: $S9
$S9 = $P15['message']
.annotate 'line', 184
isnull $I7, $S9
not $I7
unless $I7 goto __label_29
isne $I7, $S9, ''
__label_29:
unless $I7 goto __label_28
.annotate 'line', 185
# predefined cry
getstderr $P0
print $P0, $S9
print $P0, "\n"
__label_28: # endif
.annotate 'line', 186
set $I6, 1
# }
# catch end
__label_26:
.annotate 'line', 188
# predefined exit
exit $I6
# }
.annotate 'line', 189

.end # main

# End generated code
