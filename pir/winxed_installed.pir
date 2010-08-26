# Begin generated code

.namespace [ ]

.sub 'showhelp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'file', 'winxed_installed.winxed'
.annotate 'line', 5
# Body
# {
# predefined say
.annotate 'line', 7
print 'Usage: '
print __ARG_1
say ' [options] [program] [args]'
# predefined say
.annotate 'line', 8
say '  Available options:'
.annotate 'line', 9
# int l: $I1
null $I1
.annotate 'line', 10
# int i: $I2
null $I2
.annotate 'line', 11
# var o: $P1
null $P1
.annotate 'line', 12
iter $P2, __ARG_2
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
# {
.annotate 'line', 13
$S2 = $P1[0]
# predefined length
length $I3, $S2
add $I2, $I3, 4
.annotate 'line', 14
isgt $I3, $I2, $I1
unless $I3 goto __label_2
set $I1, $I2
__label_2: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 16
iter $P3, __ARG_2
set $P3, 0
__label_3: # for iteration
unless $P3 goto __label_4
shift $P1, $P3
# {
.annotate 'line', 17
# string s: $S1
$S1 = $P1[0]
.annotate 'line', 18
# predefined length
length $I5, $S1
isgt $I4, $I5, 1
unless $I4 goto __label_7
# predefined substr
substr $S2, $S1, 1, 1
isne $I4, $S2, '='
__label_7:
unless $I4 goto __label_5
concat $S1, '--', $S1
goto __label_6
__label_5: # else
concat $S1, '-', $S1
__label_6: # endif
.annotate 'line', 22
# predefined length
length $I4, $S1
sub $I2, $I1, $I4
.annotate 'line', 23
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
.annotate 'line', 25

.end # showhelp


.sub 'extname'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 27
# Body
# {
.annotate 'line', 31
# string newname: $S1
null $S1
.annotate 'line', 32
# int l: $I1
# predefined length
length $I1, __ARG_1
.annotate 'line', 33
isgt $I2, $I1, 7
unless $I2 goto __label_2
# predefined substr
substr $S2, __ARG_1, -7
iseq $I2, $S2, '.winxed'
__label_2:
unless $I2 goto __label_0
.annotate 'line', 34
sub $I3, $I1, 7
# predefined substr
substr $S3, __ARG_1, 0, $I3
concat $S1, $S3, __ARG_2
goto __label_1
__label_0: # else
concat $S1, __ARG_1, __ARG_2
__label_1: # endif
.annotate 'line', 37
.return($S1)
# }
.annotate 'line', 38

.end # extname


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 40
# Body
# {
.annotate 'line', 42
# var options: $P1
root_new $P14, ['parrot';'ResizablePMCArray']
.annotate 'line', 43
root_new $P16, ['parrot';'ResizablePMCArray']
box $P17, 'c'
$P16.'push'($P17)
box $P17, 'Compile only'
$P16.'push'($P17)
.annotate 'line', 42
$P14.'push'($P16)
.annotate 'line', 44
root_new $P18, ['parrot';'ResizablePMCArray']
box $P19, 'e=s'
$P18.'push'($P19)
box $P19, 'Evaluate'
$P18.'push'($P19)
.annotate 'line', 42
$P14.'push'($P18)
.annotate 'line', 45
root_new $P20, ['parrot';'ResizablePMCArray']
box $P21, 'help'
$P20.'push'($P21)
box $P21, 'Show this help'
$P20.'push'($P21)
.annotate 'line', 42
$P14.'push'($P20)
set $P1, $P14
.annotate 'line', 48
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 49
# var getopts: $P2
new $P2, ['Getopt';'Obj']
.annotate 'line', 50
$P2.'notOptStop'(1)
.annotate 'line', 51
iter $P22, $P1
set $P22, 0
__label_0: # for iteration
unless $P22 goto __label_1
shift $P3, $P22
$P14 = $P3[0]
.annotate 'line', 52
$P2.'push_string'($P14)
goto __label_0
__label_1: # endfor
.annotate 'line', 53
# string name: $S1
$P15 = __ARG_1.'shift'()
null $S1
if_null $P15, __label_2
set $S1, $P15
__label_2:
.annotate 'line', 54
# var opts: $P4
$P4 = $P2.'get_options'(__ARG_1)
.annotate 'line', 56
# var help: $P5
$P5 = $P4['help']
.annotate 'line', 57
# var compileonly: $P6
$P6 = $P4['c']
.annotate 'line', 58
# var eval: $P7
$P7 = $P4['e']
.annotate 'line', 60
isnull $I2, $P5
not $I2
unless $I2 goto __label_3
# {
.annotate 'line', 61
'showhelp'($S1, $P1)
.annotate 'line', 62
.return()
# }
__label_3: # endif
.annotate 'line', 65
# var compiler: $P8
# predefined load_language
load_language 'winxed'
compreg $P8, 'winxed'
.annotate 'line', 66
isnull $I2, $P8
unless $I2 goto __label_4
# predefined die
.annotate 'line', 67
die "winxed: Cannot load language"
__label_4: # endif
.annotate 'line', 69
# var code: $P9
null $P9
.annotate 'line', 70
# string srcfile: $S2
$S2 = __ARG_1[0]
.annotate 'line', 72
isnull $I3, $P7
unless $I3 goto __label_5
# {
.annotate 'line', 73
isnull $I4, $P6
not $I4
unless $I4 goto __label_7
# {
.annotate 'line', 74
# var handleout: $P10
new $P10, [ 'StringHandle' ]
.annotate 'line', 75
$P10.'open'('', 'w')
.annotate 'line', 76
$P8.'compile_from_file_to_pir'($S2, $P10)
.annotate 'line', 77
$P10.'close'()
.annotate 'line', 78
# string pircode: $S3
$P16 = $P10.'read'(0)
null $S3
if_null $P16, __label_9
set $S3, $P16
__label_9:
.annotate 'line', 79
# string pirfile: $S4
$P17 = 'extname'($S2, '.pir')
null $S4
if_null $P17, __label_10
set $S4, $P17
__label_10:
.annotate 'line', 80
# var outfile: $P11
# predefined open
root_new $P11, ['parrot';'FileHandle']
$P11.'open'($S4,'w')
.annotate 'line', 81
$P11.'print'($S3)
.annotate 'line', 82
$P11.'close'()
.annotate 'line', 83
.return(0)
# }
goto __label_8
__label_7: # else
.annotate 'line', 86
$P9 = $P8.'compile_from_file'($S2)
__label_8: # endif
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 89
isnull $I3, $P6
not $I3
unless $I3 goto __label_11
# predefined die
.annotate 'line', 90
die 'option -c with -e not supported yet'
__label_11: # endif
.annotate 'line', 91
# string expr: $S5
# predefined string
$S8 = $P7
concat $S7, 'function main[main](argv){', $S8
concat $S5, $S7, ';}'
.annotate 'line', 92
$P9 = $P8.'compile'($S5)
.annotate 'line', 93
__ARG_1.'unshift'('__EVAL__')
# }
__label_6: # endif
.annotate 'line', 97
# var sub: $P12
null $P12
# for loop
.annotate 'line', 98
# int i: $I1
null $I1
goto __label_14
__label_12: # for iteration
inc $I1
__label_14: # for condition
# {
.annotate 'line', 99
$P12 = $P9[$I1]
.annotate 'line', 100
isnull $I4, $P12
unless $I4 goto __label_15
goto __label_13 # break
__label_15: # endif
.annotate 'line', 101
# predefined string
$S7 = $P12
iseq $I5, $S7, 'main'
unless $I5 goto __label_16
goto __label_13 # break
__label_16: # endif
# }
goto __label_12 # for iteration
__label_13: # for end
.annotate 'line', 104
# try: create handler
new $P18, 'ExceptionHandler'
set_addr $P18, __label_17
push_eh $P18
# try: begin
# {
.annotate 'line', 105
$P12(__ARG_1)
# }
# try: end
goto __label_18
.annotate 'line', 104
# catch
__label_17:
.get_results($P13)
finalize $P13
pop_eh
# {
.annotate 'line', 108
# string msg: $S6
$S6 = $P13['message']
# predefined cry
.annotate 'line', 109
getstderr $P0
print $P0, $P13
print $P0, "\n"
.annotate 'line', 110
.return(1)
# }
# catch end
__label_18:
# }
.annotate 'line', 112

.end # main

# End generated code
