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
.annotate 'line', 15
# Body
# {
.annotate 'line', 17
# var options: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 18
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, 'c'
$P4.'push'($P5)
box $P5, 'Compile only. Same as --target=pir'
$P4.'push'($P5)
.annotate 'line', 17
$P1.'push'($P4)
.annotate 'line', 19
root_new $P6, ['parrot';'ResizablePMCArray']
box $P7, 'e=s'
$P6.'push'($P7)
box $P7, 'Evaluate'
$P6.'push'($P7)
.annotate 'line', 17
$P1.'push'($P6)
.annotate 'line', 20
root_new $P8, ['parrot';'ResizablePMCArray']
box $P9, 'L=s'
$P8.'push'($P9)
box $P9, 'Add to parrot library search path'
$P8.'push'($P9)
.annotate 'line', 17
$P1.'push'($P8)
.annotate 'line', 21
root_new $P10, ['parrot';'ResizablePMCArray']
box $P11, 'I=s'
$P10.'push'($P11)
box $P11, 'Add to parrot include search path'
$P10.'push'($P11)
.annotate 'line', 17
$P1.'push'($P10)
.annotate 'line', 22
root_new $P12, ['parrot';'ResizablePMCArray']
box $P13, 'help'
$P12.'push'($P13)
box $P13, 'Show this help'
$P12.'push'($P13)
.annotate 'line', 17
$P1.'push'($P12)
.annotate 'line', 24
setattribute self, 'options', $P1
.annotate 'line', 25
iter $P14, $P1
set $P14, 0
__label_0: # for iteration
unless $P14 goto __label_1
shift $P2, $P14
$P4 = $P2[0]
.annotate 'line', 26
self.'push_string'($P4)
goto __label_0
__label_1: # endfor
.annotate 'line', 27
self.'notOptStop'(1)
.annotate 'line', 28
$P6 = __ARG_1.'shift'()
setattribute self, 'name', $P6
.annotate 'line', 29
$P8 = self.'get_options'(__ARG_1)
setattribute self, 'opts', $P8
# }
.annotate 'line', 30

.end # Options


.sub 'get' :method

.annotate 'line', 31
# Body
# {
.annotate 'line', 33
getattribute $P1, self, 'opts'
.return($P1)
# }
.annotate 'line', 34

.end # get


.sub 'showhelp' :method

.annotate 'line', 35
# Body
# {
.annotate 'line', 37
getattribute $P2, self, 'name'
# predefined say
print 'Usage: '
print $P2
say ' [options] [program] [args]'
# predefined say
.annotate 'line', 38
say '  Available options:'
.annotate 'line', 39
# int l: $I1
null $I1
.annotate 'line', 40
# int i: $I2
null $I2
.annotate 'line', 41
# var o: $P1
null $P1
.annotate 'line', 42
getattribute $P2, self, 'options'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 43
$S2 = $P1[0]
# predefined length
length $I3, $S2
add $I2, $I3, 4
.annotate 'line', 44
le $I2, $I1, __label_2
set $I1, $I2
__label_2: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 46
getattribute $P4, self, 'options'
iter $P5, $P4
set $P5, 0
__label_3: # for iteration
unless $P5 goto __label_4
shift $P1, $P5
# {
.annotate 'line', 47
# string s: $S1
$S1 = $P1[0]
.annotate 'line', 48
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
.annotate 'line', 52
# predefined length
length $I4, $S1
sub $I2, $I1, $I4
.annotate 'line', 53
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
.annotate 'line', 55

.end # showhelp

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Options' ]
.annotate 'line', 9
get_class $P1, [ 'Getopt'; 'Obj' ]
addparent $P0, $P1
.annotate 'line', 11
addattribute $P0, 'name'
.annotate 'line', 12
addattribute $P0, 'options'
.annotate 'line', 13
addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'extname'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 59
# Body
# {
.annotate 'line', 63
# string newname: $S1
null $S1
.annotate 'line', 64
# int l: $I1
# predefined length
length $I1, __ARG_1
.annotate 'line', 65
isgt $I2, $I1, 7
unless $I2 goto __label_2
# predefined substr
substr $S2, __ARG_1, -7
iseq $I2, $S2, '.winxed'
__label_2:
unless $I2 goto __label_0
.annotate 'line', 66
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
.annotate 'line', 69
.return($S1)
# }
.annotate 'line', 70

.end # extname


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 72
# Body
# {
.annotate 'line', 74
# var optionset: $P1
new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1, 0)
.annotate 'line', 75
# var options: $P2
$P2 = $P1.'get'()
.annotate 'line', 77
# var help: $P3
$P3 = $P2['help']
.annotate 'line', 78
# var compileonly: $P4
$P4 = $P2['c']
.annotate 'line', 79
# var eval: $P5
$P5 = $P2['e']
.annotate 'line', 80
# var opt_L: $P6
$P6 = $P2['L']
.annotate 'line', 81
# var opt_I: $P7
$P7 = $P2['I']
.annotate 'line', 83
if_null $P3, __label_0
# {
.annotate 'line', 84
$P1.'showhelp'()
.annotate 'line', 85
.return()
# }
__label_0: # endif
.annotate 'line', 88
# var compiler: $P8
# predefined load_language
load_language 'winxed'
compreg $P8, 'winxed'
.annotate 'line', 89
unless_null $P8, __label_1
# predefined die
.annotate 'line', 90
die "winxed: Cannot load language"
__label_1: # endif
.annotate 'line', 92
if_null $P6, __label_2
# {
.annotate 'line', 93
# var interp: $P9
null $P9
.annotate 'line', 94
# pirop getinterp
getinterp $P9
.annotate 'line', 95
# var lpaths: $P10
$P10 = $P9[9]
.annotate 'line', 96
# var pathlib: $P11
$P11 = $P10[1]
# predefined string
set $S6, $P6
.annotate 'line', 97
$P11.'push'($S6)
# }
__label_2: # endif
.annotate 'line', 99
if_null $P7, __label_3
# {
.annotate 'line', 100
# var interp: $P12
null $P12
.annotate 'line', 101
# pirop getinterp
getinterp $P12
.annotate 'line', 102
# var lpaths: $P13
$P13 = $P12[9]
.annotate 'line', 103
# var pathlib: $P14
$P14 = $P13[0]
# predefined string
set $S6, $P7
.annotate 'line', 104
$P14.'push'($S6)
# }
__label_3: # endif
.annotate 'line', 107
# var code: $P15
null $P15
.annotate 'line', 109
unless_null $P5, __label_4
# {
.annotate 'line', 110
# predefined elements
elements $I2, __ARG_1
ge $I2, 1, __label_6
# {
# predefined say
.annotate 'line', 111
say "ERROR: No program specified"
.annotate 'line', 112
$P1.'showhelp'()
.annotate 'line', 113
.return(1)
# }
__label_6: # endif
.annotate 'line', 115
# string srcfile: $S1
$S1 = __ARG_1[0]
.annotate 'line', 116
if_null $P4, __label_7
# {
.annotate 'line', 117
# var handleout: $P16
new $P16, [ 'StringHandle' ]
.annotate 'line', 118
$P16.'open'('', 'w')
.annotate 'line', 119
$P8.'compile_from_file_to_pir'($S1, $P16)
.annotate 'line', 120
$P16.'close'()
.annotate 'line', 121
# string pircode: $S2
$P20 = $P16.'read'(0)
null $S2
if_null $P20, __label_9
set $S2, $P20
__label_9:
.annotate 'line', 122
# string pirfile: $S3
$P20 = 'extname'($S1, '.pir')
null $S3
if_null $P20, __label_10
set $S3, $P20
__label_10:
.annotate 'line', 123
# var outfile: $P17
# predefined open
root_new $P17, ['parrot';'FileHandle']
$P17.'open'($S3,'w')
.annotate 'line', 124
$P17.'print'($S2)
.annotate 'line', 125
$P17.'close'()
.annotate 'line', 126
.return(0)
# }
goto __label_8
__label_7: # else
.annotate 'line', 129
$P15 = $P8.'compile_from_file'($S1)
__label_8: # endif
# }
goto __label_5
__label_4: # else
# {
.annotate 'line', 132
if_null $P4, __label_11
# predefined die
.annotate 'line', 133
die 'option -c with -e not supported yet'
__label_11: # endif
.annotate 'line', 134
# string expr: $S4
# predefined string
set $S7, $P5
concat $S4, 'function main[main](argv){', $S7
concat $S4, ';}'
.annotate 'line', 135
$P15 = $P8.'compile'($S4)
.annotate 'line', 136
__ARG_1.'unshift'('__EVAL__')
# }
__label_5: # endif
.annotate 'line', 140
# var sub: $P18
null $P18
# for loop
.annotate 'line', 141
# int i: $I1
null $I1
__label_14: # for condition
# {
.annotate 'line', 142
$P18 = $P15[$I1]
.annotate 'line', 143
unless_null $P18, __label_15
goto __label_13 # break
__label_15: # endif
.annotate 'line', 144
# predefined string
set $S7, $P18
ne $S7, 'main', __label_16
goto __label_13 # break
__label_16: # endif
# }
__label_12: # for iteration
.annotate 'line', 141
inc $I1
goto __label_14
__label_13: # for end
.annotate 'line', 147
# try: create handler
new $P21, 'ExceptionHandler'
set_label $P21, __label_17
push_eh $P21
# try: begin
# {
.annotate 'line', 148
$P18(__ARG_1)
# }
# try: end
goto __label_18
.annotate 'line', 147
# catch
__label_17:
.get_results($P19)
finalize $P19
pop_eh
# {
.annotate 'line', 151
# string msg: $S5
$S5 = $P19['message']
# predefined cry
.annotate 'line', 152
getstderr $P0
print $P0, $P19
print $P0, "\n"
.annotate 'line', 153
.return(1)
# }
# catch end
__label_18:
# }
.annotate 'line', 155

.end # main

# End generated code
