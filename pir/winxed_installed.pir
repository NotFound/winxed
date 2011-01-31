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
box $P13, 'nowarn'
$P12.'push'($P13)
box $P13, 'No warnings'
$P12.'push'($P13)
.annotate 'line', 19
$P1.'push'($P12)
.annotate 'line', 25
root_new $P14, ['parrot';'ResizablePMCArray']
box $P15, 'help'
$P14.'push'($P15)
box $P15, 'Show this help'
$P14.'push'($P15)
.annotate 'line', 19
$P1.'push'($P14)
.annotate 'line', 27
setattribute self, 'options', $P1
.annotate 'line', 28
iter $P16, $P1
set $P16, 0
__label_0: # for iteration
unless $P16 goto __label_1
shift $P2, $P16
.annotate 'line', 29
$P4 = $P2[0]
self.'push_string'($P4)
goto __label_0
__label_1: # endfor
.annotate 'line', 30
self.'notOptStop'(1)
.annotate 'line', 31
$P6 = __ARG_1.'shift'()
setattribute self, 'name', $P6
.annotate 'line', 32
$P8 = self.'get_options'(__ARG_1)
setattribute self, 'opts', $P8
# }
.annotate 'line', 33

.end # Options


.sub 'get' :method

.annotate 'line', 34
# Body
# {
.annotate 'line', 36
getattribute $P1, self, 'opts'
.return($P1)
# }
.annotate 'line', 37

.end # get


.sub 'showhelp' :method

.annotate 'line', 38
# Body
# {
.annotate 'line', 40
getattribute $P2, self, 'name'
# predefined say
print 'Usage: '
print $P2
say ' [options] [program] [args]'
# predefined say
say '  Available options:'
.annotate 'line', 42
# int l: $I1
null $I1
.annotate 'line', 43
# int i: $I2
null $I2
.annotate 'line', 44
# var o: $P1
null $P1
.annotate 'line', 45
getattribute $P2, self, 'options'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 46
$S2 = $P1[0]
# predefined length
length $I3, $S2
add $I2, $I3, 4
.annotate 'line', 47
le $I2, $I1, __label_2
set $I1, $I2
__label_2: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 49
getattribute $P4, self, 'options'
iter $P5, $P4
set $P5, 0
__label_3: # for iteration
unless $P5 goto __label_4
shift $P1, $P5
# {
.annotate 'line', 50
# string s: $S1
$S1 = $P1[0]
.annotate 'line', 51
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
.annotate 'line', 55
# predefined length
length $I4, $S1
sub $I2, $I1, $I4
.annotate 'line', 56
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
.annotate 'line', 58

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

.annotate 'line', 62
# Body
# {
.annotate 'line', 66
# string newname: $S1
null $S1
.annotate 'line', 67
# int l: $I1
# predefined length
length $I1, __ARG_1
.annotate 'line', 68
isgt $I2, $I1, 7
unless $I2 goto __label_2
# predefined substr
substr $S2, __ARG_1, -7
iseq $I2, $S2, '.winxed'
__label_2:
unless $I2 goto __label_0
.annotate 'line', 69
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
.annotate 'line', 72
.return($S1)
# }
.annotate 'line', 73

.end # extname


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 75
# Body
# {
.annotate 'line', 77
# var optionset: $P1
new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1, 0)
.annotate 'line', 78
# var options: $P2
$P2 = $P1.'get'()
.annotate 'line', 80
# var help: $P3
$P3 = $P2['help']
.annotate 'line', 81
# var compileonly: $P4
$P4 = $P2['c']
.annotate 'line', 82
# var eval: $P5
$P5 = $P2['e']
.annotate 'line', 83
# var opt_L: $P6
$P6 = $P2['L']
.annotate 'line', 84
# var opt_I: $P7
$P7 = $P2['I']
.annotate 'line', 85
# var opt_nowarn: $P8
$P8 = $P2['nowarn']
.annotate 'line', 86
# int nowarn: $I1
null $I1
.annotate 'line', 87
if_null $P8, __label_0
set $I1, 1
__label_0: # endif
.annotate 'line', 90
if_null $P3, __label_1
# {
.annotate 'line', 91
$P1.'showhelp'()
# predefined exit
.annotate 'line', 92
exit 0
# }
__label_1: # endif
.annotate 'line', 95
# var compiler: $P9
# predefined load_language
load_language 'winxed'
compreg $P9, 'winxed'
.annotate 'line', 96
unless_null $P9, __label_2
# predefined die
.annotate 'line', 97
die "winxed: Cannot load language"
__label_2: # endif
.annotate 'line', 99
if_null $P6, __label_3
# {
.annotate 'line', 100
# var interp: $P10
null $P10
.annotate 'line', 101
# pirop getinterp
getinterp $P10
.annotate 'line', 102
# var lpaths: $P11
$P11 = $P10[9]
.annotate 'line', 103
# var pathlib: $P12
$P12 = $P11[1]
.annotate 'line', 104
# predefined string
set $S6, $P6
$P12.'push'($S6)
# }
__label_3: # endif
.annotate 'line', 106
if_null $P7, __label_4
# {
.annotate 'line', 107
# var interp: $P13
null $P13
.annotate 'line', 108
# pirop getinterp
getinterp $P13
.annotate 'line', 109
# var lpaths: $P14
$P14 = $P13[9]
.annotate 'line', 110
# var pathlib: $P15
$P15 = $P14[0]
.annotate 'line', 111
# predefined string
set $S6, $P7
$P15.'push'($S6)
# }
__label_4: # endif
.annotate 'line', 114
# var code: $P16
null $P16
.annotate 'line', 116
unless_null $P5, __label_5
# {
.annotate 'line', 117
# predefined elements
elements $I4, __ARG_1
ge $I4, 1, __label_7
# {
# predefined say
say "ERROR: No program specified"
.annotate 'line', 119
$P1.'showhelp'()
# predefined exit
.annotate 'line', 120
exit 1
# }
__label_7: # endif
.annotate 'line', 122
# string srcfile: $S1
$S1 = __ARG_1[0]
.annotate 'line', 123
if_null $P4, __label_8
# {
.annotate 'line', 124
# var handleout: $P17
new $P17, [ 'StringHandle' ]
.annotate 'line', 125
$P17.'open'('', 'w')
.annotate 'line', 126
$P9.'compile_from_file_to_pir'($S1, $P17, $I1 :named("nowarn"))
.annotate 'line', 128
$P17.'close'()
.annotate 'line', 129
# string pircode: $S2
$P22 = $P17.'read'(0)
null $S2
if_null $P22, __label_10
set $S2, $P22
__label_10:
.annotate 'line', 130
# string pirfile: $S3
$P22 = 'extname'($S1, '.pir')
null $S3
if_null $P22, __label_11
set $S3, $P22
__label_11:
.annotate 'line', 131
# var outfile: $P18
# predefined open
root_new $P18, ['parrot';'FileHandle']
$P18.'open'($S3,'w')
.annotate 'line', 132
$P18.'print'($S2)
.annotate 'line', 133
$P18.'close'()
# predefined exit
.annotate 'line', 134
exit 0
# }
goto __label_9
__label_8: # else
.annotate 'line', 137
$P16 = $P9.'compile_from_file'($S1, $I1 :named("nowarn"))
__label_9: # endif
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 141
# string expr: $S4
# predefined string
set $S7, $P5
concat $S4, 'function main[main](argv){', $S7
concat $S4, $S4, ';}'
.annotate 'line', 142
if_null $P4, __label_12
# {
.annotate 'line', 143
$P16 = $P9.'compile'($S4, "pir" :named("target"), $I1 :named("nowarn"))
.annotate 'line', 145
# predefined print
print $P16
# predefined exit
.annotate 'line', 146
exit 0
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 149
$P16 = $P9.'compile'($S4, $I1 :named("nowarn"))
.annotate 'line', 151
__ARG_1.'unshift'('__EVAL__')
# }
__label_13: # endif
# }
__label_6: # endif
.annotate 'line', 156
# var sub: $P19
null $P19
# for loop
.annotate 'line', 157
# int i: $I2
null $I2
__label_16: # for condition
# {
.annotate 'line', 158
$P19 = $P16[$I2]
.annotate 'line', 159
unless_null $P19, __label_17
goto __label_15 # break
__label_17: # endif
.annotate 'line', 160
# predefined string
set $S7, $P19
ne $S7, 'main', __label_18
goto __label_15 # break
__label_18: # endif
# }
__label_14: # for iteration
inc $I2
goto __label_16
__label_15: # for end
.annotate 'line', 163
# int retval: $I3
null $I3
.annotate 'line', 164
# try: create handler
new $P23, 'ExceptionHandler'
set_label $P23, __label_19
$P23.'handle_types_except'(64)
push_eh $P23
# try: begin
# {
.annotate 'line', 165
# var retvalp: $P20
$P20 = $P19(__ARG_1)
.annotate 'line', 166
if_null $P20, __label_21
set $I3, $P20
__label_21: # endif
.annotate 'line', 167
# }
# try: end
pop_eh
goto __label_20
.annotate 'line', 164
# catch
__label_19:
.get_results($P21)
finalize $P21
pop_eh
# {
.annotate 'line', 170
# string msg: $S5
$S5 = $P21['message']
.annotate 'line', 171
isnull $I4, $S5
not $I4
unless $I4 goto __label_23
isne $I4, $S5, ''
__label_23:
unless $I4 goto __label_22
.annotate 'line', 172
# predefined cry
getstderr $P0
print $P0, $S5
print $P0, "\n"
__label_22: # endif
set $I3, 1
.annotate 'line', 173
# }
# catch end
__label_20:
.annotate 'line', 175
# predefined exit
exit $I3
# }
.annotate 'line', 176

.end # main

# End generated code
