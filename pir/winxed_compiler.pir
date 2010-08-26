# Begin generated code

.namespace [ ]

.sub 'isspace'
.param string __ARG_1

.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 11
# Body
# {
.annotate 'line', 13
iseq $I1, __ARG_1, ' '
if $I1 goto __label_1
iseq $I1, __ARG_1, "\n"
__label_1:
if $I1 goto __label_0
iseq $I1, __ARG_1, "\t"
__label_0:
.return($I1)
# }
.annotate 'line', 14

.end # isspace


.sub 'isdigit'
.param string __ARG_1

.annotate 'line', 16
# Body
# {
# predefined indexof
.annotate 'line', 18
index $I2, '0123456789', __ARG_1
isgt $I1, $I2, -1
.return($I1)
# }
.annotate 'line', 19

.end # isdigit


.sub 'hexdigit'
.param string __ARG_1

.annotate 'line', 21
# Body
# {
.annotate 'line', 23
# int i: $I1
# predefined indexof
index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 24
isge $I2, $I1, 0
unless $I2 goto __label_0
mod $I1, $I1, 16
__label_0: # endif
.annotate 'line', 25
.return($I1)
# }
.annotate 'line', 26

.end # hexdigit


.sub 'isidentstart'
.param string __ARG_1

.annotate 'line', 28
# Body
# {
# predefined indexof
.annotate 'line', 30
index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 33
isgt $I1, $I2, -1
.annotate 'line', 30
.return($I1)
# }
.annotate 'line', 34

.end # isidentstart


.sub 'isident'
.param string __ARG_1

.annotate 'line', 36
# Body
# {
# predefined indexof
.annotate 'line', 38
index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
.annotate 'line', 42
isgt $I1, $I2, -1
.annotate 'line', 38
.return($I1)
# }
.annotate 'line', 43

.end # isident

# Constant ERRORinternal evaluated at compile time
# Constant ERRORtokenizer evaluated at compile time
# Constant ERRORparser evaluated at compile time

.sub 'Warn'
.param string __ARG_1
.param pmc __ARG_2 :optional
.param int __ARG_3 :opt_flag

.annotate 'line', 54
# Body
# {
.annotate 'line', 56
# var stderr: $P1
null $P1
.annotate 'line', 57
# pirop getstderr
getstderr $P1
.annotate 'line', 58
$P1.'print'('WARNING: ')
.annotate 'line', 59
$P1.'print'(__ARG_1)
.annotate 'line', 60
unless __ARG_3 goto __label_0
# {
.annotate 'line', 61
$P1.'print'(' near ')
.annotate 'line', 62
$P2 = __ARG_2.'show'()
$P1.'print'($P2)
# }
__label_0: # endif
.annotate 'line', 64
$P1.'print'("\n")
# }
.annotate 'line', 65

.end # Warn


.sub 'InternalError'
.param string __ARG_1
.param pmc __ARG_2 :optional
.param int __ARG_3 :opt_flag

.annotate 'line', 67
# Body
# {
.annotate 'line', 69
unless __ARG_3 goto __label_0
# {
.annotate 'line', 70
# string desc: $S1
$P2 = __ARG_2.'show'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, __ARG_1, ' near '
concat __ARG_1, $S2, $S1
.annotate 'line', 71
# }
__label_0: # endif
.annotate 'line', 73
# var ex: $P1
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = __ARG_1
$P1['severity'] = 2
$P1['type'] = 555
.annotate 'line', 74
throw $P1
# }
.annotate 'line', 75

.end # InternalError


.sub 'TokenError'
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 77
# Body
# {
.annotate 'line', 79
# string sline: $S1
set $I1, __ARG_3
set $S1, $I1
.annotate 'line', 80
# string file: $S2
getattribute $P2, __ARG_2, 'filename'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
.annotate 'line', 81
# string m: $S3
concat $S6, __ARG_1, ' in '
concat $S5, $S6, $S2
concat $S4, $S5, ' line '
concat $S3, $S4, $S1
.annotate 'line', 82
# var ex: $P1
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = $S3
$P1['severity'] = 2
$P1['type'] = 556
.annotate 'line', 83
throw $P1
# }
.annotate 'line', 84

.end # TokenError


.sub 'SyntaxError'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 86
# Body
# {
.annotate 'line', 88
# string sline: $S1
getattribute $P2, __ARG_2, 'line'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 89
# string file: $S2
getattribute $P2, __ARG_2, 'file'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 90
# string desc: $S3
$P3 = __ARG_2.'show'()
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 91
# string m: $S4
concat $S9, __ARG_1, ' in '
concat $S8, $S9, $S2
concat $S7, $S8, ' line '
concat $S6, $S7, $S1
concat $S5, $S6, ' near '
concat $S4, $S5, $S3
.annotate 'line', 92
# var ex: $P1
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = $S4
$P1['severity'] = 2
$P1['type'] = 557
.annotate 'line', 93
throw $P1
# }
.annotate 'line', 94

.end # SyntaxError


.sub 'Expected'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 96
# Body
# {
concat $S2, "Expected '", __ARG_1
concat $S1, $S2, "'"
.annotate 'line', 98
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 99

.end # Expected


.sub 'RequireOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 101
# Body
# {
.annotate 'line', 103
$P1 = __ARG_2.'isop'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 104
'Expected'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 105

.end # RequireOp


.sub 'RequireKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 107
# Body
# {
.annotate 'line', 109
$P1 = __ARG_2.'iskeyword'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 110
'Expected'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 111

.end # RequireKeyword


.sub 'ExpectOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 113
# Body
# {
.annotate 'line', 115
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 116
'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 117

.end # ExpectOp


.sub 'ExpectKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 119
# Body
# {
.annotate 'line', 121
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 122
'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 123

.end # ExpectKeyword

# Constant TypeEof evaluated at compile time
# Constant TypeComment evaluated at compile time
# Constant TypeOp evaluated at compile time
# Constant TypeQuoted evaluated at compile time
# Constant TypeSingleQuoted evaluated at compile time
# Constant TypeIdentifier evaluated at compile time
# Constant TypeInteger evaluated at compile time
# Constant TypeFloat evaluated at compile time
.namespace [ 'Token' ]

.sub 'get_bool' :method :vtable

.annotate 'line', 144
# Body
# {
.annotate 'line', 146
getattribute $P1, self, 'type'
set $I2, $P1
isne $I1, $I2, -1
.return($I1)
# }
.annotate 'line', 147

.end # get_bool


.sub 'iseof' :method

.annotate 'line', 148
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, -1
.return($I1)
# }

.end # iseof


.sub 'iscomment' :method

.annotate 'line', 149
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 0
.return($I1)
# }

.end # iscomment


.sub 'isint' :method

.annotate 'line', 150
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 5
.return($I1)
# }

.end # isint


.sub 'isfloat' :method

.annotate 'line', 151
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 6
.return($I1)
# }

.end # isfloat


.sub 'isstring' :method

.annotate 'line', 152
# Body
# {
.annotate 'line', 154
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 2
if $I1 goto __label_0
getattribute $P2, self, 'type'
set $I3, $P2
iseq $I1, $I3, 3
__label_0:
.return($I1)
# }
.annotate 'line', 155

.end # isstring


.sub 'isidentifier' :method

.annotate 'line', 156
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 4
.return($I1)
# }

.end # isidentifier


.sub 'getidentifier' :method

.annotate 'line', 157
# Body
# {
.annotate 'line', 159
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 4
unless $I1 goto __label_0
.annotate 'line', 160
getattribute $P2, self, 'str'
.return($P2)
goto __label_1
__label_0: # else
.annotate 'line', 162
'Expected'('Identifier', self)
__label_1: # endif
# }
.annotate 'line', 163

.end # getidentifier


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 164
# Body
# {
.annotate 'line', 166
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 4
unless $I1 goto __label_0
getattribute $P2, self, 'str'
$S1 = $P2
iseq $I1, $S1, __ARG_1
__label_0:
.return($I1)
# }
.annotate 'line', 167

.end # iskeyword


.sub 'checkkeyword' :method

.annotate 'line', 168
# Body
# {
.annotate 'line', 170
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 4
unless $I1 goto __label_1
getattribute $P2, self, 'str'
# predefined string
$S1 = $P2
goto __label_0
__label_1:
set $S1, ''
__label_0:
.return($S1)
# }
.annotate 'line', 171

.end # checkkeyword


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 172
# Body
# {
.annotate 'line', 174
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 1
unless $I1 goto __label_0
getattribute $P2, self, 'str'
$S1 = $P2
iseq $I1, $S1, __ARG_1
__label_0:
.return($I1)
# }
.annotate 'line', 175

.end # isop


.sub 'checkop' :method

.annotate 'line', 176
# Body
# {
.annotate 'line', 178
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 1
unless $I1 goto __label_1
getattribute $P2, self, 'str'
# predefined string
$S1 = $P2
goto __label_0
__label_1:
set $S1, ''
__label_0:
.return($S1)
# }
.annotate 'line', 179

.end # checkop


.sub 'rawstring' :method

.annotate 'line', 181
# Body
# {
.annotate 'line', 183
$P1 = self.'isstring'()
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 184
'InternalError'('Not a literal string', self)
__label_0: # endif
.annotate 'line', 185
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 186

.end # rawstring


.sub 'get_string' :method :vtable

.annotate 'line', 187
# Body
# {
.annotate 'line', 189
# string str: $S1
getattribute $P1, self, 'str'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 190
getattribute $P1, self, 'type'
set $I1, $P1
set $I2, 2
if $I1 == $I2 goto __label_3
set $I2, 3
if $I1 == $I2 goto __label_4
goto __label_2
# switch
__label_3: # case
concat $S2, '"', $S1
concat $S1, $S2, '"'
goto __label_1 # break
__label_4: # case
concat $S3, "'", $S1
concat $S1, $S3, "'"
goto __label_1 # break
__label_2: # default
__label_1: # switch end
.annotate 'line', 198
.return($S1)
# }
.annotate 'line', 199

.end # get_string


.sub 'show' :method

.annotate 'line', 201
# Body
# {
.annotate 'line', 203
# string str: $S1
getattribute $P1, self, 'str'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 204
# string r: $S2
null $S2
.annotate 'line', 205
getattribute $P1, self, 'type'
set $I1, $P1
set $I2, -1
if $I1 == $I2 goto __label_3
set $I2, 1
if $I1 == $I2 goto __label_4
set $I2, 4
if $I1 == $I2 goto __label_5
set $I2, 5
if $I1 == $I2 goto __label_6
set $I2, 6
if $I1 == $I2 goto __label_7
set $I2, 2
if $I1 == $I2 goto __label_8
set $I2, 3
if $I1 == $I2 goto __label_9
goto __label_2
# switch
__label_3: # case
set $S2, '(End of file)'
goto __label_1 # break
__label_4: # case
__label_5: # case
__label_6: # case
__label_7: # case
set $S2, $S1
goto __label_1 # break
__label_8: # case
concat $S3, '"', $S1
concat $S2, $S3, '"'
goto __label_1 # break
__label_9: # case
concat $S4, "'", $S1
concat $S2, $S4, "'"
goto __label_1 # break
__label_2: # default
set $S2, '(unknown)'
__label_1: # switch end
concat $S2, $S2, ' at '
.annotate 'line', 221
getattribute $P2, self, 'file'
$S3 = $P2
concat $S2, $S2, $S3
concat $S2, $S2, ' line '
.annotate 'line', 223
getattribute $P2, self, 'line'
$S4 = $P2
concat $S2, $S2, $S4
.annotate 'line', 224
.return($S2)
# }
.annotate 'line', 225

.end # show

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Token' ]
.annotate 'line', 140
addattribute $P0, 'type'
.annotate 'line', 141
addattribute $P0, 'str'
.annotate 'line', 142
addattribute $P0, 'file'
.annotate 'line', 143
addattribute $P0, 'line'
.end
.namespace [ ]

.sub 'newToken'
.param int __ARG_1
.param string __ARG_2
.param string __ARG_3
.param int __ARG_4

.annotate 'line', 228
# Body
# {
.annotate 'line', 230
# var t: $P1
new $P1, [  'Token' ]
box $P2, __ARG_1
.annotate 'line', 231
setattribute $P1, 'type', $P2
box $P2, __ARG_2
setattribute $P1, 'str', $P2
box $P3, __ARG_3
setattribute $P1, 'file', $P3
box $P3, __ARG_4
setattribute $P1, 'line', $P3
.annotate 'line', 232
.return($P1)
# }
.annotate 'line', 233

.end # newToken


.sub 'newTokenFrom'
.param int __ARG_1
.param string __ARG_2
.param pmc __ARG_3

.annotate 'line', 235
# Body
# {
.annotate 'line', 237
# var t: $P1
new $P1, [  'Token' ]
box $P2, __ARG_1
.annotate 'line', 238
setattribute $P1, 'type', $P2
box $P2, __ARG_2
setattribute $P1, 'str', $P2
getattribute $P4, __ARG_3, 'file'
setattribute $P1, 'file', $P4
getattribute $P4, __ARG_3, 'line'
setattribute $P1, 'line', $P4
.annotate 'line', 239
.return($P1)
# }
.annotate 'line', 240

.end # newTokenFrom


.sub 'getquoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 246
# Body
# {
.annotate 'line', 248
# string s: $S1
null $S1
.annotate 'line', 249
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 250
isne $I1, $S2, '"'
unless $I1 goto __label_1
# {
.annotate 'line', 251
iseq $I2, $S2, ''
if $I2 goto __label_4
iseq $I2, $S2, "\n"
__label_4:
unless $I2 goto __label_3
.annotate 'line', 252
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 254
iseq $I1, $S2, '\'
unless $I1 goto __label_5
# {
.annotate 'line', 255
# string c2: $S3
$P1 = __ARG_1.'getchar'()
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 256
iseq $I2, $S3, ''
if $I2 goto __label_9
iseq $I2, $S3, "\n"
__label_9:
unless $I2 goto __label_8
.annotate 'line', 257
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_8: # endif
concat $S1, $S1, $S2
concat $S1, $S1, $S3
.annotate 'line', 259
# }
goto __label_6
__label_5: # else
concat $S1, $S1, $S2
__label_6: # endif
.annotate 'line', 263
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 265
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(2, $S1, $P2, __ARG_3)
# }
.annotate 'line', 266

.end # getquoted


.sub 'getsinglequoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 268
# Body
# {
.annotate 'line', 270
# string s: $S1
null $S1
.annotate 'line', 271
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 272
isne $I1, $S2, "'"
unless $I1 goto __label_1
# {
.annotate 'line', 273
iseq $I2, $S2, ''
if $I2 goto __label_4
iseq $I2, $S2, "\n"
__label_4:
unless $I2 goto __label_3
.annotate 'line', 274
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
concat $S1, $S1, $S2
.annotate 'line', 276
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 278
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(3, $S1, $P2, __ARG_3)
# }
.annotate 'line', 279

.end # getsinglequoted


.sub 'getheredoc'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 281
# Body
# {
.annotate 'line', 283
# string mark: $S1
set $S1, ''
.annotate 'line', 284
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 285
isne $I1, $S2, "\n"
unless $I1 goto __label_3
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_1
# {
set $S5, $S2
set $S6, '"'
.annotate 'line', 288
if $S5 == $S6 goto __label_6
set $S6, '\'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
set $S2, '\"'
goto __label_4 # break
__label_7: # case
set $S2, '\\'
goto __label_4 # break
__label_5: # default
__label_4: # switch end
concat $S1, $S1, $S2
.annotate 'line', 297
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 299
iseq $I1, $S2, ''
unless $I1 goto __label_8
.annotate 'line', 300
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_8: # endif
concat $S1, $S1, ':>>'
.annotate 'line', 303
# string content: $S3
set $S3, ''
.annotate 'line', 304
# string line: $S4
null $S4
__label_9: # do
.annotate 'line', 305
# {
set $S4, ''
.annotate 'line', 307
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_13: # while
.annotate 'line', 308
isne $I2, $S2, "\n"
unless $I2 goto __label_14
isne $I2, $S2, ''
__label_14:
unless $I2 goto __label_12
# {
set $S5, $S2
set $S6, '"'
.annotate 'line', 309
if $S5 == $S6 goto __label_17
set $S6, '\'
if $S5 == $S6 goto __label_18
goto __label_16
# switch
__label_17: # case
set $S2, '\"'
goto __label_15 # break
__label_18: # case
set $S2, '\\'
goto __label_15 # break
__label_16: # default
__label_15: # switch end
concat $S4, $S4, $S2
.annotate 'line', 318
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_13
__label_12: # endwhile
.annotate 'line', 320
iseq $I2, $S2, ''
unless $I2 goto __label_19
.annotate 'line', 321
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_19: # endif
.annotate 'line', 322
isne $I3, $S4, $S1
unless $I3 goto __label_20
# {
concat $S3, $S3, $S4
concat $S3, $S3, '\n'
.annotate 'line', 324
# }
__label_20: # endif
# }
.annotate 'line', 326
isne $I3, $S4, $S1
if $I3 goto __label_9
__label_10: # enddo
.annotate 'line', 327
getattribute $P3, __ARG_1, 'filename'
.tailcall 'newToken'(2, $S3, $P3, __ARG_3)
# }
.annotate 'line', 328

.end # getheredoc


.sub 'getident'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 330
# Body
# {
.annotate 'line', 332
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 333
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 334
$P1 = 'isident'($S2)
if_null $P1, __label_1
unless $P1 goto __label_1
# {
concat $S1, $S1, $S2
.annotate 'line', 336
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 338
__ARG_1.'ungetchar'($S2)
.annotate 'line', 339
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(4, $S1, $P2, __ARG_3)
# }
.annotate 'line', 340

.end # getident


.sub 'getnumber'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 342
# Body
# {
.annotate 'line', 344
# string s: $S1
null $S1
.annotate 'line', 345
# string c: $S2
set $S2, __ARG_2
__label_0: # do
.annotate 'line', 346
# {
concat $S1, $S1, $S2
.annotate 'line', 348
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
.annotate 'line', 349
$P1 = 'isdigit'($S2)
if_null $P1, __label_1
if $P1 goto __label_0
__label_1: # enddo
.annotate 'line', 350
iseq $I3, $S1, '0'
unless $I3 goto __label_4
iseq $I3, $S2, 'x'
if $I3 goto __label_5
iseq $I3, $S2, 'X'
__label_5:
__label_4:
unless $I3 goto __label_3
# {
.annotate 'line', 351
# int hexval: $I1
null $I1
.annotate 'line', 352
# int h: $I2
null $I2
.annotate 'line', 353
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_7: # while
.annotate 'line', 354
$P2 = 'hexdigit'($S2)
set $I2, $P2
isge $I3, $I2, 0
unless $I3 goto __label_6
# {
set $I5, $I1
.annotate 'line', 355
mul $I4, $I5, 16
add $I1, $I4, $I2
concat $S1, $S1, $S2
.annotate 'line', 357
$P3 = __ARG_1.'getchar'()
set $S2, $P3
# }
goto __label_7
__label_6: # endwhile
.annotate 'line', 359
__ARG_1.'ungetchar'($S2)
set $S1, $I1
.annotate 'line', 361
getattribute $P3, __ARG_1, 'filename'
.tailcall 'newToken'(5, $S1, $P3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 363
iseq $I4, $S2, '.'
unless $I4 goto __label_8
# {
__label_10: # do
.annotate 'line', 364
# {
concat $S1, $S1, $S2
.annotate 'line', 366
$P4 = __ARG_1.'getchar'()
set $S2, $P4
# }
.annotate 'line', 367
$P4 = 'isdigit'($S2)
if_null $P4, __label_11
if $P4 goto __label_10
__label_11: # enddo
.annotate 'line', 368
iseq $I5, $S2, 'e'
if $I5 goto __label_14
iseq $I5, $S2, 'E'
__label_14:
unless $I5 goto __label_13
# {
concat $S1, $S1, 'E'
.annotate 'line', 370
$P5 = __ARG_1.'getchar'()
set $S2, $P5
iseq $I6, $S2, '+'
if $I6 goto __label_16
iseq $I6, $S2, '-'
__label_16:
unless $I6 goto __label_15
# {
concat $S1, $S1, $S2
.annotate 'line', 372
$P5 = __ARG_1.'getchar'()
set $S2, $P5
# }
__label_15: # endif
__label_18: # while
.annotate 'line', 374
$P6 = 'isdigit'($S2)
if_null $P6, __label_17
unless $P6 goto __label_17
# {
concat $S1, $S1, $S2
.annotate 'line', 376
$P6 = __ARG_1.'getchar'()
set $S2, $P6
# }
goto __label_18
__label_17: # endwhile
# }
__label_13: # endif
.annotate 'line', 379
__ARG_1.'ungetchar'($S2)
.annotate 'line', 380
getattribute $P7, __ARG_1, 'filename'
.tailcall 'newToken'(6, $S1, $P7, __ARG_3)
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 383
iseq $I6, $S2, 'e'
if $I6 goto __label_21
iseq $I6, $S2, 'E'
__label_21:
unless $I6 goto __label_19
# {
concat $S1, $S1, 'E'
.annotate 'line', 385
$P7 = __ARG_1.'getchar'()
set $S2, $P7
iseq $I7, $S2, '+'
if $I7 goto __label_23
iseq $I7, $S2, '-'
__label_23:
unless $I7 goto __label_22
# {
concat $S1, $S1, $S2
.annotate 'line', 387
$P8 = __ARG_1.'getchar'()
set $S2, $P8
# }
__label_22: # endif
__label_25: # while
.annotate 'line', 389
$P8 = 'isdigit'($S2)
if_null $P8, __label_24
unless $P8 goto __label_24
# {
concat $S1, $S1, $S2
.annotate 'line', 391
$P9 = __ARG_1.'getchar'()
set $S2, $P9
# }
goto __label_25
__label_24: # endwhile
.annotate 'line', 393
__ARG_1.'ungetchar'($S2)
.annotate 'line', 394
getattribute $P9, __ARG_1, 'filename'
.tailcall 'newToken'(6, $S1, $P9, __ARG_3)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 397
__ARG_1.'ungetchar'($S2)
.annotate 'line', 398
getattribute $P10, __ARG_1, 'filename'
.tailcall 'newToken'(5, $S1, $P10, __ARG_3)
# }
__label_20: # endif
# }
__label_9: # endif
# }
.annotate 'line', 401

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 403
# Body
# {
.annotate 'line', 405
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 406
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 407
isne $I1, $S2, ''
unless $I1 goto __label_3
isne $I1, $S2, "\n"
__label_3:
unless $I1 goto __label_1
# {
concat $S1, $S1, $S2
.annotate 'line', 409
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 411
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(0, $S1, $P2, __ARG_3)
# }
.annotate 'line', 412

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 414
# Body
# {
.annotate 'line', 416
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 417
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_1: # do
.annotate 'line', 418
# {
__label_5: # while
.annotate 'line', 419
isne $I1, $S2, ''
unless $I1 goto __label_6
isne $I1, $S2, '*'
__label_6:
unless $I1 goto __label_4
# {
concat $S1, $S1, $S2
.annotate 'line', 420
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_5
__label_4: # endwhile
.annotate 'line', 421
iseq $I1, $S2, ''
unless $I1 goto __label_7
.annotate 'line', 422
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_7: # endif
concat $S1, $S1, $S2
.annotate 'line', 424
$P2 = __ARG_1.'getchar'()
set $S2, $P2
.annotate 'line', 425
iseq $I2, $S2, ''
unless $I2 goto __label_8
.annotate 'line', 426
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_8: # endif
# }
.annotate 'line', 427
isne $I2, $S2, '/'
if $I2 goto __label_1
__label_2: # enddo
concat $S1, $S1, '/'
.annotate 'line', 429
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(0, $S1, $P2, __ARG_3)
# }
.annotate 'line', 430

.end # getcomment


.sub 'getop'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 432
# Body
# {
.annotate 'line', 434
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 435
getattribute $P1, __ARG_1, 'filename'
.tailcall 'newToken'(1, $S1, $P1, __ARG_3)
# }
.annotate 'line', 436

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 450
# Body
# {
.annotate 'line', 452
.const 'Sub' $P2 = 'getop'
.annotate 'line', 454
setattribute self, 'h', __ARG_1
box $P3, ''
.annotate 'line', 455
setattribute self, 'pending', $P3
.annotate 'line', 456
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'stacked', $P5
box $P4, __ARG_2
.annotate 'line', 457
setattribute self, 'filename', $P4
box $P5, 1
.annotate 'line', 458
setattribute self, 'line', $P5
.annotate 'line', 459
# var select: $P1
root_new $P1, ['parrot';'Hash']
.annotate 'line', 460
root_new $P6, ['parrot';'Hash']
get_hll_global $P7, 'getident'
$P6[''] = $P7
$P6['{'] = $P2
$P1['$'] = $P6
get_hll_global $P8, 'getquoted'
$P1['"'] = $P8
get_hll_global $P9, 'getsinglequoted'
$P1["'"] = $P9
.annotate 'line', 463
root_new $P10, ['parrot';'Hash']
$P10['='] = $P2
$P10[':'] = $P2
$P1['='] = $P10
.annotate 'line', 464
root_new $P11, ['parrot';'Hash']
$P11['+'] = $P2
$P11['='] = $P2
$P1['+'] = $P11
.annotate 'line', 465
root_new $P12, ['parrot';'Hash']
$P12['-'] = $P2
$P12['='] = $P2
$P1['-'] = $P12
.annotate 'line', 466
root_new $P13, ['parrot';'Hash']
$P13['='] = $P2
$P1['*'] = $P13
.annotate 'line', 467
root_new $P14, ['parrot';'Hash']
$P14['|'] = $P2
$P1['|'] = $P14
.annotate 'line', 468
root_new $P15, ['parrot';'Hash']
$P15['&'] = $P2
$P1['&'] = $P15
.annotate 'line', 469
root_new $P16, ['parrot';'Hash']
.annotate 'line', 470
root_new $P17, ['parrot';'Hash']
$P17[''] = $P2
get_hll_global $P18, 'getheredoc'
$P17[':'] = $P18
$P16['<'] = $P17
$P16['='] = $P2
$P1['<'] = $P16
.annotate 'line', 473
root_new $P19, ['parrot';'Hash']
$P19['>'] = $P2
$P19['='] = $P2
$P1['>'] = $P19
.annotate 'line', 474
root_new $P20, ['parrot';'Hash']
$P20['='] = $P2
$P1['!'] = $P20
.annotate 'line', 475
root_new $P21, ['parrot';'Hash']
$P21['%'] = $P2
$P1['%'] = $P21
.annotate 'line', 476
root_new $P22, ['parrot';'Hash']
$P22['='] = $P2
get_hll_global $P23, 'getlinecomment'
$P22['/'] = $P23
get_hll_global $P24, 'getcomment'
$P22['*'] = $P24
$P1['/'] = $P22
get_hll_global $P25, 'getlinecomment'
$P1['#'] = $P25
.annotate 'line', 479
setattribute self, 'select', $P1
# }
.annotate 'line', 480

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 481
# Body
# {
.annotate 'line', 483
# string pending: $S1
getattribute $P2, self, 'pending'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 484
isne $I2, $S1, ''
unless $I2 goto __label_1
# {
box $P2, ''
.annotate 'line', 485
setattribute self, 'pending', $P2
.annotate 'line', 486
.return($S1)
# }
__label_1: # endif
.annotate 'line', 488
# var h: $P1
getattribute $P1, self, 'h'
.annotate 'line', 489
# string c: $S2
$P3 = $P1.'read'(1)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 490
iseq $I2, $S2, "\n"
unless $I2 goto __label_3
# {
.annotate 'line', 491
# int l: $I1
getattribute $P3, self, 'line'
set $I1, $P3
.annotate 'line', 492
inc $I1
box $P4, $I1
.annotate 'line', 493
setattribute self, 'line', $P4
# }
__label_3: # endif
.annotate 'line', 495
.return($S2)
# }
.annotate 'line', 496

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 497
# Body
# {
box $P1, __ARG_1
.annotate 'line', 499
setattribute self, 'pending', $P1
# }
.annotate 'line', 500

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 501
# Body
# {
.annotate 'line', 503
.const 'Sub' $P5 = 'isspace'
.annotate 'line', 504
.const 'Sub' $P6 = 'isidentstart'
.annotate 'line', 505
.const 'Sub' $P7 = 'isdigit'
.annotate 'line', 506
.const 'Sub' $P8 = 'getop'
.annotate 'line', 507
.const 'Sub' $P9 = 'getident'
.annotate 'line', 508
.const 'Sub' $P10 = 'getnumber'
.annotate 'line', 510
getattribute $P11, self, 'stacked'
if_null $P11, __label_0
unless $P11 goto __label_0
# {
.annotate 'line', 511
# var t: $P1
getattribute $P12, self, 'stacked'
$P1 = $P12.'pop'()
.annotate 'line', 512
.return($P1)
# }
__label_0: # endif
.annotate 'line', 514
# string c: $S1
$P11 = self.'getchar'()
null $S1
if_null $P11, __label_1
set $S1, $P11
__label_1:
__label_3: # while
.annotate 'line', 515
$P12 = $P5($S1)
if_null $P12, __label_2
unless $P12 goto __label_2
.annotate 'line', 516
$P13 = self.'getchar'()
set $S1, $P13
goto __label_3
__label_2: # endwhile
.annotate 'line', 517
# int line: $I1
getattribute $P13, self, 'line'
set $I1, $P13
.annotate 'line', 518
iseq $I2, $S1, ''
unless $I2 goto __label_4
# {
.annotate 'line', 519
# var t: $P2
new $P2, [  'Token' ]
box $P14, -1
.annotate 'line', 520
setattribute $P2, 'type', $P14
.annotate 'line', 521
.return($P2)
# }
__label_4: # endif
.annotate 'line', 523
$P14 = $P6($S1)
if_null $P14, __label_5
unless $P14 goto __label_5
.annotate 'line', 524
.tailcall $P9(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 525
$P15 = $P7($S1)
if_null $P15, __label_6
unless $P15 goto __label_6
.annotate 'line', 526
.tailcall $P10(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 528
# string op: $S2
set $S2, $S1
.annotate 'line', 529
# var select: $P3
getattribute $P3, self, 'select'
.annotate 'line', 530
# var current: $P4
$P4 = $P3[$S1]
__label_8: # while
.annotate 'line', 532
isnull $I2, $P4
not $I2
unless $I2 goto __label_9
isa $I2, $P4, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 533
$P15 = self.'getchar'()
set $S1, $P15
set $P3, $P4
.annotate 'line', 535
$P4 = $P3[$S1]
.annotate 'line', 536
isnull $I3, $P4
unless $I3 goto __label_10
# {
.annotate 'line', 537
self.'ungetchar'($S1)
.annotate 'line', 538
$P4 = $P3['']
# }
goto __label_11
__label_10: # else
concat $S2, $S2, $S1
__label_11: # endif
.annotate 'line', 541
# }
goto __label_8
__label_7: # endwhile
.annotate 'line', 543
if_null $P4, __label_12
unless $P4 goto __label_12
.annotate 'line', 544
.tailcall $P4(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 545
.tailcall $P8(self, $S2, $I1)
# }
.annotate 'line', 546

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 547
# Body
# {
.annotate 'line', 549
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 550
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 551
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 552
.return($P1)
# }
.annotate 'line', 553

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 554
# Body
# {
getattribute $P1, self, 'stacked'
$P1.'push'(__ARG_1)
# }

.end # unget

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Tokenizer' ]
.annotate 'line', 444
addattribute $P0, 'h'
.annotate 'line', 445
addattribute $P0, 'pending'
.annotate 'line', 446
addattribute $P0, 'select'
.annotate 'line', 447
addattribute $P0, 'stacked'
.annotate 'line', 448
addattribute $P0, 'filename'
.annotate 'line', 449
addattribute $P0, 'line'
.end
.namespace [ ]
# Constant REGint evaluated at compile time
# Constant REGfloat evaluated at compile time
# Constant REGstring evaluated at compile time
# Constant REGvar evaluated at compile time
# Constant REGarglist evaluated at compile time
# Constant REGany evaluated at compile time
# Constant REGnone evaluated at compile time

.sub 'typetoregcheck'
.param string __ARG_1

.annotate 'line', 571
# Body
# {
set $S1, __ARG_1
set $S2, 'int'
.annotate 'line', 573
if $S1 == $S2 goto __label_2
set $S2, 'float'
if $S1 == $S2 goto __label_3
set $S2, 'string'
if $S1 == $S2 goto __label_4
set $S2, 'var'
if $S1 == $S2 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 574
.return('I')
__label_3: # case
.annotate 'line', 575
.return('N')
__label_4: # case
.annotate 'line', 576
.return('S')
__label_5: # case
.annotate 'line', 577
.return('P')
__label_1: # default
.annotate 'line', 578
.return('')
__label_0: # switch end
# }
.annotate 'line', 580

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 582
# Body
# {
set $S1, __ARG_1
set $S2, 'I'
.annotate 'line', 584
if $S1 == $S2 goto __label_2
set $S2, 'N'
if $S1 == $S2 goto __label_3
set $S2, 'S'
if $S1 == $S2 goto __label_4
set $S2, 'P'
if $S1 == $S2 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 585
.return('int')
__label_3: # case
.annotate 'line', 586
.return('num')
__label_4: # case
.annotate 'line', 587
.return('string')
__label_5: # case
.annotate 'line', 588
.return('pmc')
__label_1: # default
.annotate 'line', 589
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 591

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 605
# Body
# {
.annotate 'line', 607
setattribute self, 'handle', __ARG_1
box $P1, ''
.annotate 'line', 608
setattribute self, 'file', $P1
box $P2, 0
.annotate 'line', 609
setattribute self, 'line', $P2
box $P2, 0
.annotate 'line', 610
setattribute self, 'pendingf', $P2
box $P3, 0
.annotate 'line', 611
setattribute self, 'pendingl', $P3
# }
.annotate 'line', 612

.end # initialize


.sub 'close' :method

.annotate 'line', 613
# Body
# {
null $P1
.annotate 'line', 615
setattribute self, 'handle', $P1
# }
.annotate 'line', 616

.end # close


.sub 'updateannot' :method

.annotate 'line', 617
# Body
# {
.annotate 'line', 619
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 620
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 621
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 622
getattribute $P3, self, 'handle'
$P3.'print'("'")
.annotate 'line', 623
getattribute $P3, self, 'handle'
$P3.'print'("\n")
box $P4, 0
.annotate 'line', 624
setattribute self, 'pendingf', $P4
# }
__label_0: # endif
.annotate 'line', 626
getattribute $P4, self, 'pendingl'
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 627
getattribute $P5, self, 'handle'
$P5.'print'(".annotate 'line', ")
.annotate 'line', 628
getattribute $P5, self, 'handle'
getattribute $P6, self, 'line'
$P5.'print'($P6)
.annotate 'line', 629
getattribute $P6, self, 'handle'
$P6.'print'("\n")
box $P7, 0
.annotate 'line', 630
setattribute self, 'pendingl', $P7
# }
__label_1: # endif
# }
.annotate 'line', 632

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 633
# Body
# {
.annotate 'line', 635
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 636
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 637

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 638
# Body
# {
.annotate 'line', 640
self.'updateannot'()
.annotate 'line', 641
self.'vprint'(__ARG_1)
# }
.annotate 'line', 642

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 643
# Body
# {
.annotate 'line', 645
self.'updateannot'()
.annotate 'line', 646
self.'vprint'(__ARG_1)
.annotate 'line', 647
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 648

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 649
# Body
# {
.annotate 'line', 651
getattribute $P1, self, 'file'
getattribute $P2, __ARG_1, 'file'
isne $I1, $P1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 652
getattribute $P4, __ARG_1, 'file'
setattribute self, 'file', $P4
box $P1, 1
.annotate 'line', 653
setattribute self, 'pendingf', $P1
box $P2, 0
.annotate 'line', 654
setattribute self, 'line', $P2
# }
__label_0: # endif
.annotate 'line', 656
getattribute $P3, self, 'line'
getattribute $P4, __ARG_1, 'line'
isne $I1, $P3, $P4
unless $I1 goto __label_1
# {
.annotate 'line', 657
getattribute $P6, __ARG_1, 'line'
setattribute self, 'line', $P6
box $P5, 1
.annotate 'line', 658
setattribute self, 'pendingl', $P5
# }
__label_1: # endif
# }
.annotate 'line', 660

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 661
# Body
# {
.annotate 'line', 663
self.'updateannot'()
.annotate 'line', 664
getattribute $P1, self, 'handle'
concat $S2, '# ', __ARG_1
concat $S1, $S2, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 665

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 666
# Body
# {
.annotate 'line', 668
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 669
$P1.'print'(__ARG_1)
.annotate 'line', 670
$P1.'print'(':')
.annotate 'line', 671
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 672
$P1.'print'(' # ')
.annotate 'line', 673
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 675
$P1.'print'("\n")
# }
.annotate 'line', 676

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 677
# Body
# {
.annotate 'line', 679
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 680
$P1.'print'('goto ')
.annotate 'line', 681
$P1.'print'(__ARG_1)
.annotate 'line', 682
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 683
$P1.'print'(' # ')
.annotate 'line', 684
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 686
$P1.'print'("\n")
# }
.annotate 'line', 687

.end # emitgoto


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 688
# Body
# {
.annotate 'line', 690
# string ins: $S1
concat $S2, "null ", __ARG_1
concat $S1, $S2, "\n"
.annotate 'line', 691
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 692

.end # emitnull


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 693
# Body
# {
.annotate 'line', 695
# string ins: $S1
concat $S4, "set ", __ARG_1
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_2
concat $S1, $S2, "\n"
.annotate 'line', 696
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 697

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 698
# Body
# {
.annotate 'line', 700
# string ins: $S1
concat $S4, "assign ", __ARG_1
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_2
concat $S1, $S2, "\n"
.annotate 'line', 701
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 702

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 703
# Body
# {
.annotate 'line', 705
# string ins: $S1
concat $S4, "box ", __ARG_1
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_2
concat $S1, $S2, "\n"
.annotate 'line', 706
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 707

.end # emitbox


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 708
# Body
# {
.annotate 'line', 710
# string ins: $S1
concat $S4, "add ", __ARG_1
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_2
concat $S1, $S2, "\n"
.annotate 'line', 711
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 712

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 713
# Body
# {
.annotate 'line', 715
# string ins: $S1
concat $S6, "add ", __ARG_1
concat $S5, $S6, ", "
concat $S4, $S5, __ARG_2
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_3
concat $S1, $S2, "\n"
.annotate 'line', 716
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 717

.end # emitadd


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 718
# Body
# {
.annotate 'line', 720
# string ins: $S1
concat $S6, "concat ", __ARG_1
concat $S5, $S6, ", "
concat $S4, $S5, __ARG_2
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_3
concat $S1, $S2, "\n"
.annotate 'line', 721
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 722

.end # emitconcat

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Emit' ]
.annotate 'line', 599
addattribute $P0, 'handle'
.annotate 'line', 600
addattribute $P0, 'file'
.annotate 'line', 601
addattribute $P0, 'line'
.annotate 'line', 602
addattribute $P0, 'pendingf'
.annotate 'line', 603
addattribute $P0, 'pendingl'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 729
# Body
# {
.annotate 'line', 731
new $P2, [  'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 732

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 734
# Body
# {
.annotate 'line', 736
# var t: $P1
$P1 = 'newTokenFrom'(6, __ARG_3, __ARG_2)
.annotate 'line', 737
new $P3, [  'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 738

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 740
# Body
# {
.annotate 'line', 746
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 747
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 748
.return($I1)
# }
.annotate 'line', 749

.end # floatresult

.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 766
# Body
# {
.annotate 'line', 768
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 769
.return($S1)
# }
.annotate 'line', 770

.end # name


.sub 'result' :method

.annotate 'line', 771
# Body
# {
.annotate 'line', 773
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 774

.end # result


.sub 'params' :method

.annotate 'line', 775
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 776
# Body
# {
.annotate 'line', 778
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 779
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 780
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 781
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 782
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 784
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 786
.return($S1)
# }
.annotate 'line', 787

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 788
# Body
# {
box $P1, __ARG_1
.annotate 'line', 794
setattribute self, 'name', $P1
.annotate 'line', 795
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 796
setattribute self, 'typeresult', $P2
.annotate 'line', 797
# int n: $I1
null $I1
.annotate 'line', 798
isnull $I2, __ARG_4
not $I2
unless $I2 goto __label_0
# {
box $P2, __ARG_4
.annotate 'line', 799
setattribute self, 'type0', $P2
.annotate 'line', 800
iseq $I2, __ARG_4, '*'
unless $I2 goto __label_1
set $I1, -1
goto __label_2
__label_1: # else
.annotate 'line', 801
# {
set $I1, 1
.annotate 'line', 804
isnull $I3, __ARG_5
not $I3
unless $I3 goto __label_3
# {
box $P3, __ARG_5
.annotate 'line', 805
setattribute self, 'type1', $P3
.annotate 'line', 806
inc $I1
# }
__label_3: # endif
.annotate 'line', 808
isnull $I3, __ARG_6
not $I3
unless $I3 goto __label_4
# {
box $P3, __ARG_6
.annotate 'line', 809
setattribute self, 'type2', $P3
.annotate 'line', 810
inc $I1
# }
__label_4: # endif
# }
__label_2: # endif
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 814
setattribute self, 'nparams', $P4
.annotate 'line', 815
.return(self)
# }
.annotate 'line', 816

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 817
# Body
# {
.annotate 'line', 825
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 826
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 827
.return(self)
# }
.annotate 'line', 828

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 829
# Body
# {
.annotate 'line', 831
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 832
# string typeresult: $S2
getattribute $P2, self, 'typeresult'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 833
__ARG_1.'comment'($S6)
.annotate 'line', 835
getattribute $P3, self, 'body'
isa $I4, $P3, 'String'
unless $I4 goto __label_2
# {
.annotate 'line', 836
# string body: $S3
getattribute $P4, self, 'body'
null $S3
if_null $P4, __label_4
set $S3, $P4
__label_4:
.annotate 'line', 837
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 838
iseq $I4, $S2, 'v'
unless $I4 goto __label_5
# {
.annotate 'line', 839
isnull $I5, __ARG_4
not $I5
unless $I5 goto __label_8
isne $I5, __ARG_4, ''
__label_8:
unless $I5 goto __label_7
.annotate 'line', 840
'SyntaxError'('using return value from void predef')
__label_7: # endif
.annotate 'line', 841
isne $I5, $I1, -1
unless $I5 goto __label_9
.annotate 'line', 842
'InternalError'('void predef with {res}')
__label_9: # endif
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 845
iseq $I6, $I1, -1
unless $I6 goto __label_10
.annotate 'line', 846
'InternalError'('non void predef without {res}')
__label_10: # endif
.annotate 'line', 847
isne $I6, $S2, 'v'
unless $I6 goto __label_12
isnull $I6, __ARG_4
if $I6 goto __label_13
iseq $I6, __ARG_4, ''
__label_13:
__label_12:
unless $I6 goto __label_11
.annotate 'line', 848
$P3 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P3
__label_11: # endif
__label_14: # do
.annotate 'line', 849
# {
.annotate 'line', 850
# predefined substr
substr $S7, $S3, 0, $I1
concat $S6, $S7, __ARG_4
add $I7, $I1, 5
# predefined substr
substr $S8, $S3, $I7
concat $S3, $S6, $S8
# }
.annotate 'line', 851
# predefined indexof
index $I1, $S3, '{res}'
isne $I7, $I1, -1
if $I7 goto __label_14
__label_15: # enddo
# }
__label_6: # endif
.annotate 'line', 854
# int n: $I2
set $P4, __ARG_5
set $I2, $P4
# for loop
.annotate 'line', 855
# int i: $I3
null $I3
goto __label_19
__label_17: # for iteration
inc $I3
__label_19: # for condition
islt $I8, $I3, $I2
unless $I8 goto __label_18 # for end
# {
.annotate 'line', 856
# string argmark: $S4
$S8 = $I3
concat $S7, '{arg', $S8
concat $S4, $S7, '}'
.annotate 'line', 857
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_21: # while
.annotate 'line', 858
# predefined indexof
index $I1, $S3, $S4
isne $I8, $I1, -1
unless $I8 goto __label_20
.annotate 'line', 859
# predefined substr
substr $S10, $S3, 0, $I1
concat $S9, $S10, $S5
add $I9, $I1, 6
# predefined substr
substr $S11, $S3, $I9
concat $S3, $S9, $S11
goto __label_21
__label_20: # endwhile
# }
goto __label_17 # for iteration
__label_18: # for end
.annotate 'line', 861
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 862
__ARG_1.'say'($S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 865
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 866
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_3: # endif
# }
.annotate 'line', 868

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'PredefFunction' ]
.annotate 'line', 757
addattribute $P0, 'name'
.annotate 'line', 758
addattribute $P0, 'body'
.annotate 'line', 759
addattribute $P0, 'evalfun'
.annotate 'line', 760
addattribute $P0, 'typeresult'
.annotate 'line', 761
addattribute $P0, 'type0'
.annotate 'line', 762
addattribute $P0, 'type1'
.annotate 'line', 763
addattribute $P0, 'type2'
.annotate 'line', 764
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 873
# Body
# {
.annotate 'line', 875
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 876
# int n: $I1
# predefined int
$I3 = __ARG_4
sub $I1, $I3, 1
.annotate 'line', 877
isge $I3, $I1, 0
unless $I3 goto __label_0
# {
# for loop
.annotate 'line', 878
# int i: $I2
null $I2
goto __label_4
__label_2: # for iteration
inc $I2
__label_4: # for condition
islt $I4, $I2, $I1
unless $I4 goto __label_3 # for end
$P1 = __ARG_4[$I2]
.annotate 'line', 879
__ARG_1.'say'('print ', $P1)
goto __label_2 # for iteration
__label_3: # for end
$P1 = __ARG_4[$I1]
.annotate 'line', 880
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 883
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 884

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Predef_say' ]
.end
.namespace [ 'Predef_cry' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 889
# Body
# {
.annotate 'line', 891
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 892
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 893
# int n: $I1
# predefined int
$I1 = __ARG_4
# for loop
.annotate 'line', 894
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
$P1 = __ARG_4[$I2]
.annotate 'line', 895
__ARG_1.'say'("print $P0, ", $P1)
goto __label_0 # for iteration
__label_1: # for end
.annotate 'line', 896
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 897

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Predef_cry' ]
.end
.namespace [ 'Predef_print' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 902
# Body
# {
.annotate 'line', 904
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 905
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 906
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
$P1 = __ARG_4[$I2]
.annotate 'line', 907
__ARG_1.'say'('print ', $P1)
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 908

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 911
# Body
# {
.annotate 'line', 913
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 914
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 915
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 916

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 918
# Body
# {
.annotate 'line', 920
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 921
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 922
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 923

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 925
# Body
# {
.annotate 'line', 927
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 928
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 929
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 930

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 932
# Body
# {
.annotate 'line', 934
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 935
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 936
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 937
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 938
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 939

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 941
# Body
# {
.annotate 'line', 943
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 945
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 946
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 948
# var t: $P2
$P2 = 'newTokenFrom'(2, $S1, __ARG_2)
.annotate 'line', 949
new $P5, [  'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 950

.end # predefeval_chr


.sub 'getpredefs'

.annotate 'line', 952
# Body
# {
.annotate 'line', 954
# var predef_say: $P1
new $P1, [  'Predef_say' ]
.annotate 'line', 955
# var predef_cry: $P2
new $P2, [  'Predef_cry' ]
.annotate 'line', 956
# var predef_print: $P3
new $P3, [  'Predef_print' ]
.annotate 'line', 958
get_hll_global $P5, 'predefeval_length'
.annotate 'line', 959
get_hll_global $P6, 'predefeval_bytelength'
.annotate 'line', 960
get_hll_global $P7, 'predefeval_chr'
.annotate 'line', 961
get_hll_global $P8, 'predefeval_ord'
.annotate 'line', 962
get_hll_global $P9, 'predefeval_ord_n'
.annotate 'line', 964
# var predefs: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
.annotate 'line', 965
new $P13, [  'PredefFunction' ]
$P12 = $P13.'set'('int', '{res} = {arg0}', 'I', '?')
.annotate 'line', 964
$P10.'push'($P12)
.annotate 'line', 969
new $P15, [  'PredefFunction' ]
$P14 = $P15.'set'('float', '{res} = {arg0}', 'N', '?')
.annotate 'line', 964
$P10.'push'($P14)
.annotate 'line', 973
new $P17, [  'PredefFunction' ]
$P16 = $P17.'set'('string', '{res} = {arg0}', 'S', '?')
.annotate 'line', 964
$P10.'push'($P16)
.annotate 'line', 977
new $P19, [  'PredefFunction' ]
$P18 = $P19.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 964
$P10.'push'($P18)
.annotate 'line', 981
new $P21, [  'PredefFunction' ]
$P20 = $P21.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 964
$P10.'push'($P20)
.annotate 'line', 985
new $P23, [  'PredefFunction' ]
$P22 = $P23.'set'('time', 'time {res}', 'I')
.annotate 'line', 964
$P10.'push'($P22)
.annotate 'line', 989
new $P25, [  'PredefFunction' ]
$P24 = $P25.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 964
$P10.'push'($P24)
.annotate 'line', 993
new $P27, [  'PredefFunction' ]
$P26 = $P27.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 964
$P10.'push'($P26)
.annotate 'line', 997
new $P29, [  'PredefFunction' ]
$P28 = $P29.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 964
$P10.'push'($P28)
.annotate 'line', 1002
new $P31, [  'PredefFunction' ]
$P30 = $P31.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P30)
.annotate 'line', 1007
new $P33, [  'PredefFunction' ]
$P32 = $P33.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 964
$P10.'push'($P32)
.annotate 'line', 1012
new $P35, [  'PredefFunction' ]
$P34 = $P35.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 964
$P10.'push'($P34)
.annotate 'line', 1018
new $P37, [  'PredefFunction' ]
$P36 = $P37.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 964
$P10.'push'($P36)
.annotate 'line', 1025
new $P39, [  'PredefFunction' ]
$P38 = $P39.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 964
$P10.'push'($P38)
.annotate 'line', 1029
new $P41, [  'PredefFunction' ]
$P40 = $P41.'set_eval'('length', $P5, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 964
$P10.'push'($P40)
.annotate 'line', 1034
new $P43, [  'PredefFunction' ]
$P42 = $P43.'set_eval'('bytelength', $P6, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 964
$P10.'push'($P42)
.annotate 'line', 1039
new $P45, [  'PredefFunction' ]
$P44 = $P45.'set_eval'('chr', $P7, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 964
$P10.'push'($P44)
.annotate 'line', 1046
new $P47, [  'PredefFunction' ]
$P46 = $P47.'set_eval'('ord', $P8, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 964
$P10.'push'($P46)
.annotate 'line', 1051
new $P49, [  'PredefFunction' ]
$P48 = $P49.'set_eval'('ord', $P9, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 964
$P10.'push'($P48)
.annotate 'line', 1056
new $P51, [  'PredefFunction' ]
$P50 = $P51.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 964
$P10.'push'($P50)
.annotate 'line', 1060
new $P53, [  'PredefFunction' ]
$P52 = $P53.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 964
$P10.'push'($P52)
.annotate 'line', 1064
new $P55, [  'PredefFunction' ]
$P54 = $P55.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P54)
.annotate 'line', 1068
new $P57, [  'PredefFunction' ]
$P56 = $P57.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 964
$P10.'push'($P56)
.annotate 'line', 1072
new $P59, [  'PredefFunction' ]
$P58 = $P59.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 964
$P10.'push'($P58)
.annotate 'line', 1076
new $P61, [  'PredefFunction' ]
$P60 = $P61.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P60)
.annotate 'line', 1080
new $P63, [  'PredefFunction' ]
$P62 = $P63.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P62)
.annotate 'line', 1084
new $P65, [  'PredefFunction' ]
$P64 = $P65.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P64)
.annotate 'line', 1088
new $P67, [  'PredefFunction' ]
$P66 = $P67.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P66)
.annotate 'line', 1092
new $P69, [  'PredefFunction' ]
$P68 = $P69.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 964
$P10.'push'($P68)
.annotate 'line', 1097
new $P71, [  'PredefFunction' ]
$P70 = $P71.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P70)
.annotate 'line', 1102
new $P73, [  'PredefFunction' ]
$P72 = $P73.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P72)
.annotate 'line', 1106
new $P75, [  'PredefFunction' ]
$P74 = $P75.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P74)
.annotate 'line', 1110
new $P77, [  'PredefFunction' ]
$P76 = $P77.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P76)
.annotate 'line', 1114
new $P79, [  'PredefFunction' ]
$P78 = $P79.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P78)
.annotate 'line', 1118
new $P81, [  'PredefFunction' ]
$P80 = $P81.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P80)
.annotate 'line', 1122
new $P83, [  'PredefFunction' ]
$P82 = $P83.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P82)
.annotate 'line', 1126
new $P85, [  'PredefFunction' ]
$P84 = $P85.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P84)
.annotate 'line', 1130
new $P87, [  'PredefFunction' ]
$P86 = $P87.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P86)
.annotate 'line', 1134
new $P89, [  'PredefFunction' ]
$P88 = $P89.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P88)
.annotate 'line', 1138
new $P91, [  'PredefFunction' ]
$P90 = $P91.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P90)
.annotate 'line', 1142
new $P93, [  'PredefFunction' ]
$P92 = $P93.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P92)
.annotate 'line', 1146
new $P95, [  'PredefFunction' ]
$P94 = $P95.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 964
$P10.'push'($P94)
.annotate 'line', 1150
new $P97, [  'PredefFunction' ]
$P96 = $P97.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P96)
.annotate 'line', 1154
new $P99, [  'PredefFunction' ]
$P98 = $P99.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P98)
.annotate 'line', 1158
new $P101, [  'PredefFunction' ]
$P100 = $P101.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P100)
.annotate 'line', 1162
new $P103, [  'PredefFunction' ]
$P102 = $P103.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 964
$P10.'push'($P102)
.annotate 'line', 1166
new $P105, [  'PredefFunction' ]
$P104 = $P105.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 964
$P10.'push'($P104)
.annotate 'line', 1170
new $P107, [  'PredefFunction' ]
$P106 = $P107.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P106)
.annotate 'line', 1174
new $P109, [  'PredefFunction' ]
$P108 = $P109.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 964
$P10.'push'($P108)
.annotate 'line', 1178
new $P111, [  'PredefFunction' ]
$P110 = $P111.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 964
$P10.'push'($P110)
.annotate 'line', 1183
new $P113, [  'PredefFunction' ]
$P112 = $P113.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P112)
.annotate 'line', 1188
new $P115, [  'PredefFunction' ]
$P114 = $P115.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P114)
.annotate 'line', 1192
new $P117, [  'PredefFunction' ]
$P116 = $P117.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 964
$P10.'push'($P116)
.annotate 'line', 1196
new $P119, [  'PredefFunction' ]
$P118 = $P119.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P118)
.annotate 'line', 1200
new $P121, [  'PredefFunction' ]
$P120 = $P121.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 964
$P10.'push'($P120)
.annotate 'line', 1204
new $P123, [  'PredefFunction' ]
$P122 = $P123.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 964
$P10.'push'($P122)
.annotate 'line', 1208
new $P125, [  'PredefFunction' ]
$P124 = $P125.'set'('print', $P3, 'P', '*')
.annotate 'line', 964
$P10.'push'($P124)
.annotate 'line', 1212
new $P127, [  'PredefFunction' ]
$P126 = $P127.'set'('say', $P1, 'P', '*')
.annotate 'line', 964
$P10.'push'($P126)
.annotate 'line', 1216
new $P129, [  'PredefFunction' ]
$P128 = $P129.'set'('cry', $P2, 'P', '*')
.annotate 'line', 964
$P10.'push'($P128)
set $P4, $P10
__label_1: # Infinite loop
.annotate 'line', 1222
.yield($P4)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1223

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1225
# Body
# {
.annotate 'line', 1227
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1228
getattribute $P4, $P1, 'name'
$S1 = $P4
iseq $I2, $S1, __ARG_1
unless $I2 goto __label_2
# {
.annotate 'line', 1229
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1230
iseq $I2, $I1, -1
if $I2 goto __label_4
iseq $I2, $I1, __ARG_2
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1231
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1233
.return($P2)
# }
.annotate 'line', 1234

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1240
# Body
# {
.annotate 'line', 1242
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1243
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
.annotate 'line', 1244
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 1245

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1256
# Body
# {
.annotate 'line', 1258
setattribute self, 'start', __ARG_1
.annotate 'line', 1259
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1260

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1261
# Body
# {
.annotate 'line', 1263
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1264

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1265
# Body
# {
.annotate 'line', 1267
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1268

.end # use_predef

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'CommonBase' ]
.annotate 'line', 1253
addattribute $P0, 'start'
.annotate 'line', 1254
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1281
# Body
# {
.annotate 'line', 1283
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1284

.end # init


.sub 'numargs' :method

.annotate 'line', 1286
# Body
# {
.annotate 'line', 1288
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1289

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1290
# Body
# {
.annotate 'line', 1292
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1293
.return($P2)
# }
.annotate 'line', 1294

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1296
# Body
# {
.annotate 'line', 1298
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1299
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1300
# {
.annotate 'line', 1301
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1302
$P1.'push'($P3)
# }
.annotate 'line', 1303
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1304
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1305

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1307
# Body
# {
.annotate 'line', 1309
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1310
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 1311
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1312

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1313
# Body
# {
.annotate 'line', 1315
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1316
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1317
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1318
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 1319
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1320
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1321
$P2.'push'($S1)
# }
goto __label_0 # for iteration
__label_1: # for end
.annotate 'line', 1323
.return($P2)
# }
.annotate 'line', 1324

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1325
# Body
# {
.annotate 'line', 1327
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1328
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1329

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'SimpleArgList' ]
.annotate 'line', 1279
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1341
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1342
# Body
# {
.annotate 'line', 1344
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1345
.return($I1)
# }
.annotate 'line', 1346

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1347
# Body
# {
.annotate 'line', 1349
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1350
$P2 = $P1.'numargs'()
set $I2, $P2
islt $I1, __ARG_1, $I2
unless $I1 goto __label_0
.annotate 'line', 1351
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1353
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1354

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1355
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1357
setattribute self, 'name', $P1
.annotate 'line', 1358
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
.annotate 'line', 1359
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1360

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1361
# Body
# {
.annotate 'line', 1363
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1364

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Modifier' ]
.annotate 'line', 1338
addattribute $P0, 'name'
.annotate 'line', 1339
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1371
# Body
# {
.annotate 'line', 1373
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1374
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1375
# {
.annotate 'line', 1376
$P2 = __ARG_1.'get'()
.annotate 'line', 1377
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1378
$P2 = __ARG_1.'get'()
.annotate 'line', 1379
# var args: $P3
new $P3, [  'SimpleArgList' ]
.annotate 'line', 1380
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1381
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1382
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1384
new $P7, [  'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1385
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1386
'RequireOp'(']', $P2)
.annotate 'line', 1387
setattribute self, 'list', $P1
# }
.annotate 'line', 1388

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1389
# Body
# {
.annotate 'line', 1391
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1392
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1393

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1394
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1395
# Body
# {
.annotate 'line', 1397
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1398
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1399
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 1400
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1401
$P3 = $P2.'getname'()
$S1 = $P3
iseq $I3, $S1, __ARG_1
unless $I3 goto __label_3
# {
.annotate 'line', 1402
.return($P2)
# }
__label_3: # endif
# }
goto __label_0 # for iteration
__label_1: # for end
null $P3
.annotate 'line', 1405
.return($P3)
# }
.annotate 'line', 1406

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ModifierList' ]
.annotate 'line', 1369
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getkey'
.param pmc __ARG_1

.annotate 'line', 1413
# Body
# {
.annotate 'line', 1415
# string s: $S1
set $S1, "[ "
.annotate 'line', 1416
# string sep: $S2
set $S2, " '"
.annotate 'line', 1417
iter $P1, __ARG_1
set $P1, 0
__label_0: # for iteration
unless $P1 goto __label_1
shift $S3, $P1
# {
concat $S1, $S1, $S2
set $S2, " ; '"
concat $S4, $S3, "'"
concat $S1, $S1, $S4
.annotate 'line', 1420
# }
goto __label_0
__label_1: # endfor
concat $S1, $S1, " ]"
.annotate 'line', 1423
.return($S1)
# }
.annotate 'line', 1424

.end # getkey


.sub 'namespacekey'
.param pmc __ARG_1

.annotate 'line', 1426
# Body
# {
.annotate 'line', 1428
# string s: $S1
set $S1, '.namespace ['
.annotate 'line', 1429
# string sep: $S2
set $S2, " '"
.annotate 'line', 1430
iter $P1, __ARG_1
set $P1, 0
__label_0: # for iteration
unless $P1 goto __label_1
shift $S3, $P1
# {
concat $S1, $S1, $S2
set $S2, " ; '"
concat $S4, $S3, "'"
concat $S1, $S1, $S4
.annotate 'line', 1433
# }
goto __label_0
__label_1: # endfor
concat $S1, $S1, " ]"
.annotate 'line', 1436
.return($S1)
# }
.annotate 'line', 1437

.end # namespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1439
# Body
# {
.annotate 'line', 1441
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1442
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1443
new $P4, [  'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1444
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1445
new $P7, [  'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1447
__ARG_2.'unget'($P1)
.annotate 'line', 1448
new $P3, [  'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1450

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1452
# Body
# {
.annotate 'line', 1454
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1455
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1456
new $P5, [  'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1457
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1458
new $P6, [  'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1459
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1460
new $P8, [  'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1462
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1463
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1464
if $S2 == $S3 goto __label_6
set $S3, 'const'
if $S2 == $S3 goto __label_7
set $S3, 'var'
if $S2 == $S3 goto __label_8
set $S3, 'string'
if $S2 == $S3 goto __label_9
set $S3, 'int'
if $S2 == $S3 goto __label_10
set $S3, 'float'
if $S2 == $S3 goto __label_11
set $S3, 'return'
if $S2 == $S3 goto __label_12
set $S3, 'yield'
if $S2 == $S3 goto __label_13
set $S3, 'goto'
if $S2 == $S3 goto __label_14
set $S3, 'if'
if $S2 == $S3 goto __label_15
set $S3, 'while'
if $S2 == $S3 goto __label_16
set $S3, 'do'
if $S2 == $S3 goto __label_17
set $S3, 'continue'
if $S2 == $S3 goto __label_18
set $S3, 'break'
if $S2 == $S3 goto __label_19
set $S3, 'switch'
if $S2 == $S3 goto __label_20
set $S3, 'for'
if $S2 == $S3 goto __label_21
set $S3, 'throw'
if $S2 == $S3 goto __label_22
set $S3, 'try'
if $S2 == $S3 goto __label_23
goto __label_5
# switch
__label_6: # case
.annotate 'line', 1466
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1468
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1471
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1473
new $P9, [  'StringStatement' ]
$P9.'StringStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_10: # case
.annotate 'line', 1475
new $P11, [  'IntStatement' ]
$P11.'IntStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_11: # case
.annotate 'line', 1477
new $P13, [  'FloatStatement' ]
$P13.'FloatStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_12: # case
.annotate 'line', 1479
new $P15, [  'ReturnStatement' ]
$P15.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_13: # case
.annotate 'line', 1481
new $P17, [  'YieldStatement' ]
$P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_14: # case
.annotate 'line', 1483
new $P19, [  'GotoStatement' ]
$P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_15: # case
.annotate 'line', 1485
new $P21, [  'IfStatement' ]
$P21.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_16: # case
.annotate 'line', 1487
new $P23, [  'WhileStatement' ]
$P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_17: # case
.annotate 'line', 1489
new $P25, [  'DoStatement' ]
$P25.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_18: # case
.annotate 'line', 1491
new $P27, [  'ContinueStatement' ]
$P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_19: # case
.annotate 'line', 1493
new $P29, [  'BreakStatement' ]
$P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_20: # case
.annotate 'line', 1495
new $P31, [  'SwitchStatement' ]
$P31.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P30, $P31
.return($P30)
__label_21: # case
.annotate 'line', 1497
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1499
new $P33, [  'ThrowStatement' ]
$P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P32, $P33
.return($P32)
__label_23: # case
.annotate 'line', 1501
new $P35, [  'TryStatement' ]
$P35.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P34, $P35
.return($P34)
__label_5: # default
.annotate 'line', 1503
$P36 = $P1.'isidentifier'()
if_null $P36, __label_24
unless $P36 goto __label_24
# {
.annotate 'line', 1504
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1505
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1506
new $P10, [  'LabelStatement' ]
.tailcall $P10.'set'($P1, __ARG_2)
__label_25: # endif
.annotate 'line', 1507
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1509
__ARG_1.'unget'($P1)
.annotate 'line', 1510
new $P12, [  'ExprStatement' ]
$P12.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P11, $P12
.return($P11)
__label_4: # switch end
.annotate 'line', 1512
isnull $I1, $P2
unless $I1 goto __label_26
.annotate 'line', 1513
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1514
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1515

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1523
# Body
# {
.annotate 'line', 1525
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1526

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1527
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1528
# Body
# {
.annotate 'line', 1530
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1531

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1532
# Body
# {
.annotate 'line', 1534
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1535

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1536
# Body
# {
.annotate 'line', 1538
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1539

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1540
# Body
# {
.annotate 'line', 1542
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1543

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1544
# Body
# {
.annotate 'line', 1546
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1547

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1548
# Body
# {
.annotate 'line', 1550
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1551

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1552
# Body
# {
.annotate 'line', 1554
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1555

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1556
# Body
# {
.annotate 'line', 1558
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1559

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1560
# Body
# {
.annotate 'line', 1562
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1563

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1564
# Body
# {
.annotate 'line', 1566
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1567

.end # checkclass


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1568
# Body
# {
.annotate 'line', 1570
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1571

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1572
# Body
# {
.annotate 'line', 1574
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1575

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1576
# Body
# {
.annotate 'line', 1578
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1580
.return(self)
# }
.annotate 'line', 1581

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Statement' ]
get_class $P1, [  'CommonBase' ]
# CommonBase
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1586
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1587
# Body
# {
.annotate 'line', 1589
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1590

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1591
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1592
# Body
# {
# }
.annotate 'line', 1595

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'EmptyStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1602
# Body
# {
.annotate 'line', 1604
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1605
$P1.'push'(__ARG_1)
.annotate 'line', 1606
$P1.'push'(__ARG_2)
.annotate 'line', 1607
setattribute self, 'statements', $P1
# }
.annotate 'line', 1608

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1609
# Body
# {
.annotate 'line', 1611
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1612
.return(self)
# }
.annotate 'line', 1613

.end # push


.sub 'optimize' :method

.annotate 'line', 1614
# Body
# {
.annotate 'line', 1616
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1617
.return(self)
# }
.annotate 'line', 1618

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1619
# Body
# {
.annotate 'line', 1621
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1622
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1623

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'MultiStatement' ]
.annotate 'line', 1600
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1626
# Body
# {
.annotate 'line', 1628
isnull $I1, __ARG_1
unless $I1 goto __label_0
.annotate 'line', 1629
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1630
isa $I2, __ARG_1, 'MultiStatement'
unless $I2 goto __label_2
.annotate 'line', 1631
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1633
new $P2, [  'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1634

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1644
# Body
# {
.annotate 'line', 1646
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1647
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1648
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
box $P2, $S1
.annotate 'line', 1649
setattribute self, 'opname', $P2
.annotate 'line', 1650
$P1 = __ARG_2.'get'()
.annotate 'line', 1651
$P3 = $P1.'isop'('}')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 1652
__ARG_2.'unget'($P1)
.annotate 'line', 1653
self.'parseargs'(__ARG_2, self, '}')
# }
__label_1: # endif
.annotate 'line', 1655
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1656

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1657
# Body
# {
.annotate 'line', 1659
self.'optimizeargs'()
.annotate 'line', 1660
.return(self)
# }
.annotate 'line', 1661

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1662
# Body
# {
.annotate 'line', 1664
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1665
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1666
__ARG_1.'comment'($S2)
.annotate 'line', 1667
$P1 = self.'numargs'()
set $I2, $P1
iseq $I1, $I2, 0
unless $I1 goto __label_1
.annotate 'line', 1668
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1670
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1671
self.'emitargs'(__ARG_1)
.annotate 'line', 1672
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1674

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'PiropStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
get_class $P2, [  'SimpleArgList' ]
# SimpleArgList
addparent $P0, $P2
.annotate 'line', 1642
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1684
# Body
# {
.annotate 'line', 1686
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1687
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1688
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1689
# {
.annotate 'line', 1690
$P2 = __ARG_2.'get'()
.annotate 'line', 1691
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1692
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1693
'RequireOp'(';', $P2)
.annotate 'line', 1694
setattribute self, 'path', $P1
.annotate 'line', 1695
.return(self)
# }
.annotate 'line', 1696

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1697
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1698
# Body
# {
.annotate 'line', 1700
# string file: $S1
null $S1
.annotate 'line', 1701
# string sep: $S2
set $S2, ''
.annotate 'line', 1702
getattribute $P1, self, 'path'
iter $P2, $P1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $S3, $P2
# {
concat $S1, $S1, $S2
concat $S1, $S1, $S3
set $S2, '/'
.annotate 'line', 1705
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 1707
self.'annotate'(__ARG_1)
.annotate 'line', 1708
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1709

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ExternStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 1683
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1719
# Body
# {
.annotate 'line', 1721
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1722
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1723
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1724
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1725

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1726
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1727
# Body
# {
.annotate 'line', 1729
self.'annotate'(__ARG_1)
.annotate 'line', 1730
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1731
getattribute $P3, self, 'symbol'
.annotate 'line', 1730
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1732

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'StaticStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 1718
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1742
# Body
# {
.annotate 'line', 1744
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1745
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1746
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1747
# {
.annotate 'line', 1748
$P2 = __ARG_2.'get'()
.annotate 'line', 1749
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1750
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1751
'RequireOp'(';', $P2)
.annotate 'line', 1752
setattribute self, 'path', $P1
# }
.annotate 'line', 1753

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1754
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1755
# Body
# {
.annotate 'line', 1757
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1758
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1759
self.'annotate'(__ARG_1)
.annotate 'line', 1761
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1763
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1764
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1766
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1769
__ARG_1.'print'('[')
.annotate 'line', 1770
# string sep: $S2
set $S2, ''
.annotate 'line', 1771
iter $P4, $P1
set $P4, 0
__label_4: # for iteration
unless $P4 goto __label_5
shift $S3, $P4
# {
.annotate 'line', 1772
__ARG_1.'print'($S2, "'", $S3, "'")
set $S2, '; '
.annotate 'line', 1773
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 1775
__ARG_1.'say'(" ], '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1777

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'UsingStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 1741
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1787
# Body
# {
.annotate 'line', 1789
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1790
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1791
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1792

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1793
# Body
# {
.annotate 'line', 1795
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1796
.return(self)
# }
.annotate 'line', 1797

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1798
# Body
# {
.annotate 'line', 1800
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1801

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ExprStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 1786
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1811
# Body
# {
.annotate 'line', 1813
setattribute self, 'name', __ARG_1
.annotate 'line', 1814
.return(self)
# }
.annotate 'line', 1815

.end # set


.sub 'get_string' :method :vtable

.annotate 'line', 1816
# Body
# {
# predefined Error
.annotate 'line', 1818
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1819

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ConstantInternalFail' ]
.annotate 'line', 1810
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1826
# Body
# {
.annotate 'line', 1828
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1829

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1830
# Body
# {
.annotate 'line', 1832
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1833
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1834
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1835
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S4, "Redeclared '", $S1
concat $S3, $S4, "'"
.annotate 'line', 1836
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1837
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1838
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1842
.return($S2)
# }
.annotate 'line', 1843

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1844
# Body
# {
.annotate 'line', 1846
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1847
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1848
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1849
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1850
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1851
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1855

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1856
# Body
# {
.annotate 'line', 1858
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1859
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1860
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1861
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1862
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1863
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1866
new $P5, [  'ConstantInternalFail' ]
$P4 = $P5.'set'(__ARG_1)
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1868
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1869
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1870
$P1[$S1] = $P3
# }
.annotate 'line', 1871

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1872
# Body
# {
.annotate 'line', 1874
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1875
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1876
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1877
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1878
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1879
.return($P2)
# }
.annotate 'line', 1880

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'VarContainer' ]
.annotate 'line', 1825
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [  'BlockStatement' ]
get_class $P1, [  'VarContainer' ]
# VarContainer
addparent $P0, $P1
get_class $P2, [  'Statement' ]
# Statement
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 1899
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 1900
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 1901
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 1902
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 1903
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 1904
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 1905
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 1906
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1907
# Body
# {
.annotate 'line', 1909
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 1910

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 1911
# Body
# {
.annotate 'line', 1913
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1914

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 1915
# Body
# {
.annotate 'line', 1918
.return(self)
# }
.annotate 'line', 1919

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 1920
# Body
# {
.annotate 'line', 1922
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1923
# string reg: $S2
iseq $I1, $S1, 'v'
unless $I1 goto __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 1924
self.'emit'(__ARG_1, $S2)
.annotate 'line', 1925
.return($S2)
# }
.annotate 'line', 1926

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1927
# Body
# {
.annotate 'line', 1929
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 1930

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Expr' ]
get_class $P1, [  'CommonBase' ]
# CommonBase
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 1935
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'SimpleExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1950
# Body
# {
.annotate 'line', 1952
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 1953
.return(self)
# }
.annotate 'line', 1954

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 1955
# Body
# {
.annotate 'line', 1957
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 1958

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 1959
# Body
# {
.annotate 'line', 1961
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 1962
.return(self)
# }
.annotate 'line', 1963

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 1964
# Body
# {
.annotate 'line', 1966
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1967
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 1968
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1970
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 1971
iseq $I2, $I1, 0
unless $I2 goto __label_4
.annotate 'line', 1972
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 1974
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 1977
.return(0)
# }
.annotate 'line', 1978

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1979
# Body
# {
.annotate 'line', 1981
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1982
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1983
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 1984
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
set $S4, 'I'
if $S3 == $S4 goto __label_6
set $S4, 'N'
if $S3 == $S4 goto __label_7
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 1987
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_3)
__label_6: # case
__label_7: # case
.annotate 'line', 1990
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 1993
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 1995

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1996
# Body
# {
.annotate 'line', 1998
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1999
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2000
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2001
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
set $S4, 'I'
if $S3 == $S4 goto __label_6
set $S4, 'N'
if $S3 == $S4 goto __label_7
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 2004
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_2)
__label_6: # case
__label_7: # case
.annotate 'line', 2007
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2010
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2012

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Condition' ]
.annotate 'line', 1949
addattribute $P0, 'condexpr'
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2020
# Body
# {
.annotate 'line', 2022
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2023
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2024

.end # StringLiteral


.sub 'isliteral' :method

.annotate 'line', 2025
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isstringliteral' :method

.annotate 'line', 2026
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2027
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2028
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getPirString' :method

.annotate 'line', 2029
# Body
# {
.annotate 'line', 2031
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2032
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2033
# int type: $I1
getattribute $P2, $P1, 'type'
set $I1, $P2
.annotate 'line', 2034
# int need_unicode: $I2
null $I2
box $P3, $S1
.annotate 'line', 2035
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $I3, $P4
# {
.annotate 'line', 2036
isgt $I7, $I3, 127
unless $I7 goto __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2038
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2041
unless $I2 goto __label_4
# {
.annotate 'line', 2042
iseq $I7, $I1, 3
unless $I7 goto __label_5
# {
set $I1, 2
.annotate 'line', 2044
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P3, $S2
.annotate 'line', 2046
iter $P5, $P3
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2047
iseq $I8, $S3, '\'
unless $I8 goto __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2049
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2052
# string result: $S4
set $S4, ''
.annotate 'line', 2053
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2054
# int i: $I5
null $I5
goto __label_11
__label_9: # for iteration
inc $I5
__label_11: # for condition
islt $I8, $I5, $I4
unless $I8 goto __label_10 # for end
# {
.annotate 'line', 2055
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2056
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2057
isgt $I9, $I6, 127
unless $I9 goto __label_12
# {
.annotate 'line', 2058
# string h: $S6
box $P7, $I6
$P6 = $P7.'get_as_base'(16)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
concat $S9, '\x{', $S6
concat $S8, $S9, '}'
concat $S4, $S4, $S8
.annotate 'line', 2059
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2062
# }
goto __label_9 # for iteration
__label_10: # for end
set $S1, $S4
.annotate 'line', 2064
# }
__label_4: # endif
.annotate 'line', 2066
# string q: $S7
iseq $I9, $I1, 3
unless $I9 goto __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
concat $S8, $S7, $S1
concat $S1, $S8, $S7
.annotate 'line', 2068
unless $I2 goto __label_17
concat $S1, 'unicode:', $S1
__label_17: # endif
.annotate 'line', 2070
.return($S1)
# }
.annotate 'line', 2071

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2072
# Body
# {
.annotate 'line', 2074
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2075
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2076
getattribute $P3, $P1, 'type'
set $I2, $P3
iseq $I1, $I2, 2
unless $I1 goto __label_1
# {
.annotate 'line', 2077
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2078
$P4 = $P2.'unescape'('unicode', 'utf8')
set $S1, $P4
# }
__label_1: # endif
.annotate 'line', 2080
.return($S1)
# }
.annotate 'line', 2081

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2082
# Body
# {
.annotate 'line', 2084
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2085

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2086
# Body
# {
.annotate 'line', 2088
.tailcall self.'getPirString'()
# }
.annotate 'line', 2089

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'StringLiteral' ]
get_class $P1, [  'SimpleExpr' ]
# SimpleExpr
addparent $P0, $P1
.annotate 'line', 2019
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2098
# Body
# {
.annotate 'line', 2101
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2102
setattribute self, 'pos', __ARG_2
.annotate 'line', 2103
# int n: $I1
null $I1
.annotate 'line', 2104
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2105
# {
.annotate 'line', 2107
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2108
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2110
setattribute self, 'numval', $P2
# }
.annotate 'line', 2111

.end # IntegerLiteral


.sub 'isliteral' :method

.annotate 'line', 2112
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2113
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2114
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2115
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getIntegerValue' :method

.annotate 'line', 2116
# Body
# {
.annotate 'line', 2118
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2119
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2120
.return($I1)
# }
.annotate 'line', 2121

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2122
# Body
# {
.annotate 'line', 2124
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2125
iseq $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 2126
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2128
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2129

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2130
# Body
# {
.annotate 'line', 2132
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2133

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IntegerLiteral' ]
get_class $P1, [  'SimpleExpr' ]
# SimpleExpr
addparent $P0, $P1
.annotate 'line', 2096
addattribute $P0, 'pos'
.annotate 'line', 2097
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2141
# Body
# {
.annotate 'line', 2143
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2144
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2145

.end # FloatLiteral


.sub 'isliteral' :method

.annotate 'line', 2146
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2147
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2148
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2149
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getFloatValue' :method

.annotate 'line', 2150
# Body
# {
.annotate 'line', 2152
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2153
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2155
.return($P1)
# }
.annotate 'line', 2156

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2157
# Body
# {
.annotate 'line', 2159
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2160
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2161

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2162
# Body
# {
.annotate 'line', 2166
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2167
# predefined indexof
index $I2, $S1, '.'
islt $I1, $I2, 0
unless $I1 goto __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2169
.return($S1)
# }
.annotate 'line', 2170

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'FloatLiteral' ]
get_class $P1, [  'SimpleExpr' ]
# SimpleExpr
addparent $P0, $P1
.annotate 'line', 2140
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2178
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2179
# Body
# {
.annotate 'line', 2181
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2182
setattribute self, 'name', __ARG_2
.annotate 'line', 2183
.return(self)
# }
.annotate 'line', 2184

.end # set


.sub 'isnull' :method

.annotate 'line', 2185
# Body
# {
.annotate 'line', 2187
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2188

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2189
# Body
# {
.annotate 'line', 2191
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2192
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
$P2 = $P1['type']
.annotate 'line', 2193
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2195
getattribute $P3, self, 'name'
set $S1, $P3
set $S2, 'self'
if $S1 == $S2 goto __label_4
set $S2, 'null'
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 2198
.return('P')
__label_3: # default
.annotate 'line', 2200
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2203

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2204
# Body
# {
.annotate 'line', 2206
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2207
.return($S1)
# }
.annotate 'line', 2208

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2209
# Body
# {
.annotate 'line', 2211
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2212
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 2213
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2214
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2215
# string s: $S1
null $S1
.annotate 'line', 2216
isnull $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 2217
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2218
if $S3 == $S4 goto __label_6
set $S4, 'null'
if $S3 == $S4 goto __label_7
goto __label_5
# switch
__label_6: # case
set $S1, 'self'
goto __label_4 # break
__label_7: # case
set $S1, 'null'
goto __label_4 # break
__label_5: # default
set $S1, ''
__label_4: # switch end
.annotate 'line', 2224
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2228
$P4 = $P2['id']
isnull $I2, $P4
not $I2
unless $I2 goto __label_8
$P5 = $P2['id']
.annotate 'line', 2229
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2231
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2233
.return($S1)
# }
.annotate 'line', 2234

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2235
# Body
# {
.annotate 'line', 2237
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2238
$S2 = $P1
iseq $I1, $S2, ''
unless $I1 goto __label_0
# {
.annotate 'line', 2239
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S3, "Variable '", $S1
concat $S2, $S3, "' is not defined"
.annotate 'line', 2240
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2242
.return($P1)
# }
.annotate 'line', 2243

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2244
# Body
# {
.annotate 'line', 2246
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2247
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2248
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 2249
$I2 = $P2['const']
unless $I2 goto __label_2
$P3 = $P2['id']
isnull $I2, $P3
__label_2:
unless $I2 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2250
.return($P4)
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2252
.return(self)
# }
.annotate 'line', 2253

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2254
# Body
# {
.annotate 'line', 2256
self.'annotate'(__ARG_1)
.annotate 'line', 2257
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2258

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2259
# Body
# {
.annotate 'line', 2261
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2262

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2263
# Body
# {
.annotate 'line', 2265
self.'annotate'(__ARG_1)
.annotate 'line', 2266
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2267
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2268
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2269
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2272
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2275
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2278
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2279
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2281
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2282
iseq $I1, $S1, $S3
unless $I1 goto __label_11
# {
.annotate 'line', 2283
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2286
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2287
self.'annotate'(__ARG_1)
.annotate 'line', 2288
iseq $I2, $S1, 'P'
unless $I2 goto __label_16
isne $I2, $S3, 'P'
__label_16:
unless $I2 goto __label_14
.annotate 'line', 2289
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2291
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2294
.return($S2)
# }
.annotate 'line', 2295

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IdentifierExpr' ]
get_class $P1, [  'SimpleExpr' ]
# SimpleExpr
addparent $P0, $P1
.annotate 'line', 2177
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2302
# Body
# {
.annotate 'line', 2304
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2305

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2313
# Body
# {
.annotate 'line', 2315
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2316
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2317

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2318
# Body
# {
.annotate 'line', 2320
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2321

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2322
# Body
# {
.annotate 'line', 2324
self.'optimizearg'()
.annotate 'line', 2325
.return(self)
# }
.annotate 'line', 2326

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpUnaryExpr' ]
get_class $P1, [  'OpExpr' ]
# OpExpr
addparent $P0, $P1
.annotate 'line', 2312
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2335
# Body
# {
.annotate 'line', 2337
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2338
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2339
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2340

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2341
# Body
# {
.annotate 'line', 2343
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2344
.return(self)
# }
.annotate 'line', 2345

.end # set


.sub 'optimizearg' :method

.annotate 'line', 2346
# Body
# {
.annotate 'line', 2348
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2349
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2350

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2351
# Body
# {
.annotate 'line', 2353
self.'optimizearg'()
.annotate 'line', 2354
.return(self)
# }
.annotate 'line', 2355

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBinaryExpr' ]
get_class $P1, [  'OpExpr' ]
# OpExpr
addparent $P0, $P1
.annotate 'line', 2333
addattribute $P0, 'lexpr'
.annotate 'line', 2334
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2362
# Body
# {
.annotate 'line', 2364
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2365

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2366
# Body
# {
.annotate 'line', 2368
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2369
.return(self)
# }
.annotate 'line', 2370

.end # set


.sub 'optimize' :method

.annotate 'line', 2371
# Body
# {
.annotate 'line', 2373
self.'optimizearg'()
.annotate 'line', 2374
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2375
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2376
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2377
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2380
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2381
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2382
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2383
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2386
.return(self)
# }
.annotate 'line', 2387

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2388
# Body
# {
.annotate 'line', 2390
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2391
self.'annotate'(__ARG_1)
.annotate 'line', 2392
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2393

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpUnaryMinusExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2400
# Body
# {
.annotate 'line', 2402
.return('I')
# }
.annotate 'line', 2403

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2404
# Body
# {
.annotate 'line', 2406
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2407
.return(self)
# }
.annotate 'line', 2408

.end # set


.sub 'optimize' :method

.annotate 'line', 2409
# Body
# {
.annotate 'line', 2411
self.'optimizearg'()
.annotate 'line', 2412
getattribute $P3, self, 'subexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2413
# var numval: $P1
getattribute $P4, self, 'subexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2414
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2415
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2417
.return(self)
# }
.annotate 'line', 2418

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2419
# Body
# {
.annotate 'line', 2421
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2422
self.'annotate'(__ARG_1)
.annotate 'line', 2423
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2424
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2426
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2429
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2432
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2434

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpNotExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2441
# Body
# {
.annotate 'line', 2443
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2444

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2445
# Body
# {
.annotate 'line', 2447
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2448
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2449
.return(self)
# }
.annotate 'line', 2450

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2451
# Body
# {
.annotate 'line', 2453
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2454
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2455
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2456

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2457
# Body
# {
.annotate 'line', 2459
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2460
self.'annotate'(__ARG_1)
.annotate 'line', 2461
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2462
.return($S1)
# }
.annotate 'line', 2463

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpPreIncExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2470
# Body
# {
.annotate 'line', 2472
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2473
.return(self)
# }
.annotate 'line', 2474

.end # set


.sub 'checkResult' :method

.annotate 'line', 2475
# Body
# {
.annotate 'line', 2477
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2478

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2479
# Body
# {
.annotate 'line', 2481
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2482
self.'annotate'(__ARG_1)
.annotate 'line', 2483
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2484
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2485
.return($S1)
# }
.annotate 'line', 2486

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpPostIncExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2493
# Body
# {
.annotate 'line', 2495
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2496

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2497
# Body
# {
.annotate 'line', 2499
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2500
.return(self)
# }
.annotate 'line', 2501

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2502
# Body
# {
.annotate 'line', 2504
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2505
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2506
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2507

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2508
# Body
# {
.annotate 'line', 2510
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2511
self.'annotate'(__ARG_1)
.annotate 'line', 2512
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2513
.return($S1)
# }
.annotate 'line', 2514

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpPreDecExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2521
# Body
# {
.annotate 'line', 2523
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2524
.return(self)
# }
.annotate 'line', 2525

.end # set


.sub 'checkResult' :method

.annotate 'line', 2526
# Body
# {
.annotate 'line', 2528
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2529

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2530
# Body
# {
.annotate 'line', 2532
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2533
self.'annotate'(__ARG_1)
.annotate 'line', 2534
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2535
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2536
.return($S1)
# }
.annotate 'line', 2537

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpPostDecExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2546
# Body
# {
.annotate 'line', 2548
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2549
setattribute self, 'eleft', __ARG_3
.annotate 'line', 2550
setattribute self, 'eright', __ARG_4
.annotate 'line', 2551
.return(self)
# }
.annotate 'line', 2552

.end # set


.sub 'checkResult' :method

.annotate 'line', 2553
# Body
# {
.annotate 'line', 2555
getattribute $P2, self, 'eleft'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2556
getattribute $P3, self, 'eleft'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2558
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2559

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2560
# Body
# {
.annotate 'line', 2562
getattribute $P3, self, 'eleft'
$P2 = $P3.'optimize'()
setattribute self, 'eleft', $P2
.annotate 'line', 2563
getattribute $P3, self, 'eright'
$P2 = $P3.'optimize'()
setattribute self, 'eright', $P2
.annotate 'line', 2564
.return(self)
# }
.annotate 'line', 2565

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2566
# Body
# {
.annotate 'line', 2568
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2569

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBaseAssignExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 2544
addattribute $P0, 'eleft'
.annotate 'line', 2545
addattribute $P0, 'eright'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2576
# Body
# {
.annotate 'line', 2578
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2579
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
# {
.annotate 'line', 2580
self.'annotate'(__ARG_1)
.annotate 'line', 2581
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2583

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2584
# Body
# {
.annotate 'line', 2586
self.'annotate'(__ARG_1)
.annotate 'line', 2587
# var eleft: $P1
getattribute $P1, self, 'eleft'
.annotate 'line', 2588
getattribute $P2, self, 'eright'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2589

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpAssignExpr' ]
get_class $P1, [  'OpBaseAssignExpr' ]
# OpBaseAssignExpr
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2596
# Body
# {
.annotate 'line', 2598
self.'annotate'(__ARG_1)
.annotate 'line', 2599
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2600
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2601
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2602

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2603
# Body
# {
.annotate 'line', 2605
self.'annotate'(__ARG_1)
.annotate 'line', 2606
# string reg: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2607
# string reg2: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2608
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2609
.return($S1)
# }
.annotate 'line', 2610

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpAssignToExpr' ]
get_class $P1, [  'OpBaseAssignExpr' ]
# OpBaseAssignExpr
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2617
# Body
# {
.annotate 'line', 2619
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2620
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2621
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2622

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2623
# Body
# {
.annotate 'line', 2625
# string ltype: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2626
# string rtype: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2627
# string reg: $S3
getattribute $P4, self, 'eleft'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2628
# string reg2: $S4
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2629
self.'annotate'(__ARG_1)
.annotate 'line', 2630
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
# {
.annotate 'line', 2631
isne $I2, $S2, 'S'
unless $I2 goto __label_6
# {
.annotate 'line', 2632
# string aux: $S5
$P5 = self.'tempreg'('S')
null $S5
if_null $P5, __label_7
set $S5, $P5
__label_7:
.annotate 'line', 2633
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2634
# }
__label_6: # endif
.annotate 'line', 2636
__ARG_1.'emitconcat'($S3, $S3, $S4)
# }
goto __label_5
__label_4: # else
.annotate 'line', 2639
__ARG_1.'emitaddto'($S3, $S4)
__label_5: # endif
.annotate 'line', 2640
.return($S3)
# }
.annotate 'line', 2641

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpAddToExpr' ]
get_class $P1, [  'OpBaseAssignExpr' ]
# OpBaseAssignExpr
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2648
# Body
# {
.annotate 'line', 2650
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2651
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2652
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2653

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2654
# Body
# {
.annotate 'line', 2656
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2657
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2658
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2659
self.'annotate'(__ARG_1)
.annotate 'line', 2660
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2661
.return($S2)
# }
.annotate 'line', 2662

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpSubToExpr' ]
get_class $P1, [  'OpBaseAssignExpr' ]
# OpBaseAssignExpr
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2669
# Body
# {
.annotate 'line', 2671
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2672
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2673
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2674

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2675
# Body
# {
.annotate 'line', 2677
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2678
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2679
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2680
self.'annotate'(__ARG_1)
.annotate 'line', 2681
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2682
.return($S2)
# }
.annotate 'line', 2683

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpMulToExpr' ]
get_class $P1, [  'OpBaseAssignExpr' ]
# OpBaseAssignExpr
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2690
# Body
# {
.annotate 'line', 2692
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2693
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2694
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2695

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2696
# Body
# {
.annotate 'line', 2698
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2699
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2700
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2701
self.'annotate'(__ARG_1)
.annotate 'line', 2702
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2703
.return($S2)
# }
.annotate 'line', 2704

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpDivToExpr' ]
get_class $P1, [  'OpBaseAssignExpr' ]
# OpBaseAssignExpr
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2711
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2712
# Body
# {
.annotate 'line', 2714
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2715
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2716
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2717
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2718
self.'annotate'(__ARG_1)
.annotate 'line', 2719
# string aux: $S5
null $S5
.annotate 'line', 2720
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2722
iseq $I2, $S1, 'I'
unless $I2 goto __label_7
# {
.annotate 'line', 2723
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2724
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2725
# }
__label_7: # endif
.annotate 'line', 2727
iseq $I1, $S2, 'I'
unless $I1 goto __label_8
# {
.annotate 'line', 2728
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2729
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2730
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2733
iseq $I2, $S2, 'I'
unless $I2 goto __label_11
iseq $I2, $S1, 'P'
__label_11:
unless $I2 goto __label_9
# {
.annotate 'line', 2734
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2735
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2736
# }
goto __label_10
__label_9: # else
.annotate 'line', 2738
iseq $I3, $S2, 'P'
unless $I3 goto __label_14
iseq $I3, $S1, 'I'
__label_14:
unless $I3 goto __label_12
# {
.annotate 'line', 2739
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2740
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2741
# }
goto __label_13
__label_12: # else
.annotate 'line', 2743
iseq $I3, $S2, 'S'
unless $I3 goto __label_17
iseq $I3, $S1, 'P'
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 2744
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2745
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2746
# }
goto __label_16
__label_15: # else
.annotate 'line', 2748
iseq $I4, $S2, 'P'
unless $I4 goto __label_19
iseq $I4, $S1, 'S'
__label_19:
unless $I4 goto __label_18
# {
.annotate 'line', 2749
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2750
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2751
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 2754
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
# }
.annotate 'line', 2755

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2756
# Body
# {
.annotate 'line', 2758
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2759

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ComparatorBaseExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2771
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2772
# Body
# {
.annotate 'line', 2774
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2775
setattribute self, 'expr', __ARG_2
.annotate 'line', 2776
.return(self)
# }
.annotate 'line', 2777

.end # set

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NullCheckerExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 2769
addattribute $P0, 'expr'
.end
.namespace [ 'OpIsNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2782
# Body
# {
.annotate 'line', 2784
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2785
self.'annotate'(__ARG_1)
.annotate 'line', 2786
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2787

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpIsNullExpr' ]
get_class $P1, [  'NullCheckerExpr' ]
# NullCheckerExpr
addparent $P0, $P1
.end
.namespace [ 'OpNotNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2792
# Body
# {
.annotate 'line', 2794
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2795
self.'annotate'(__ARG_1)
.annotate 'line', 2796
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2797
__ARG_1.'say'('not ', __ARG_2)
# }
.annotate 'line', 2798

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpNotNullExpr' ]
get_class $P1, [  'NullCheckerExpr' ]
# NullCheckerExpr
addparent $P0, $P1
.end
.namespace [ 'OpEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2805
# Body
# {
.annotate 'line', 2807
self.'optimizearg'()
.annotate 'line', 2808
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2809
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2810
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2811
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2812
unless $I1 goto __label_0
# {
.annotate 'line', 2813
unless $I2 goto __label_1
.annotate 'line', 2814
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 2816
new $P6, [  'OpIsNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2818
unless $I2 goto __label_3
.annotate 'line', 2819
new $P4, [  'OpIsNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2820
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2821
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2822
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2823
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2824
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2825
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2826
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2829
.return(self)
# }
.annotate 'line', 2830

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2831
# Body
# {
.annotate 'line', 2833
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2834

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2835
# Body
# {
.annotate 'line', 2837
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2838

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpEqualExpr' ]
get_class $P1, [  'ComparatorBaseExpr' ]
# ComparatorBaseExpr
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2845
# Body
# {
.annotate 'line', 2847
self.'optimizearg'()
.annotate 'line', 2848
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2849
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2850
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2851
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2852
unless $I1 goto __label_0
# {
.annotate 'line', 2853
unless $I2 goto __label_1
.annotate 'line', 2854
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 2856
new $P6, [  'OpNotNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2858
unless $I2 goto __label_3
.annotate 'line', 2859
new $P4, [  'OpNotNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2860
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2861
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2862
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2863
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2864
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2865
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2866
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2869
.return(self)
# }
.annotate 'line', 2870

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2871
# Body
# {
.annotate 'line', 2873
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2874

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2875
# Body
# {
.annotate 'line', 2877
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2878

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpNotEqualExpr' ]
get_class $P1, [  'ComparatorBaseExpr' ]
# ComparatorBaseExpr
addparent $P0, $P1
.end
.namespace [ 'OpLessExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2885
# Body
# {
.annotate 'line', 2887
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2888

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpLessExpr' ]
get_class $P1, [  'ComparatorBaseExpr' ]
# ComparatorBaseExpr
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2895
# Body
# {
.annotate 'line', 2897
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2898

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpGreaterExpr' ]
get_class $P1, [  'ComparatorBaseExpr' ]
# ComparatorBaseExpr
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2905
# Body
# {
.annotate 'line', 2907
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2908

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpLessEqualExpr' ]
get_class $P1, [  'ComparatorBaseExpr' ]
# ComparatorBaseExpr
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2915
# Body
# {
.annotate 'line', 2917
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2918

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpGreaterEqualExpr' ]
get_class $P1, [  'ComparatorBaseExpr' ]
# ComparatorBaseExpr
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2925
# Body
# {
.annotate 'line', 2927
.return('I')
# }
.annotate 'line', 2928

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBaseBoolExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 2935
# Body
# {
.annotate 'line', 2937
self.'optimizearg'()
.annotate 'line', 2938
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2939
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2940
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2941
isne $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2942
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2944
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2946
.return(self)
# }
.annotate 'line', 2947

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2948
# Body
# {
.annotate 'line', 2950
# string res: $S1
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_1
set $P1, __ARG_2
goto __label_0
__label_1:
$P1 = self.'tempreg'('I')
__label_0:
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 2951
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 2952
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 2953
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 2954
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 2955
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 2956
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 2959
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 2960
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 2961
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 2962
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 2963
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 2965

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBoolAndExpr' ]
get_class $P1, [  'OpBaseBoolExpr' ]
# OpBaseBoolExpr
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 2972
# Body
# {
.annotate 'line', 2974
self.'optimizearg'()
.annotate 'line', 2975
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2976
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2977
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2978
iseq $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2979
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2981
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2983
.return(self)
# }
.annotate 'line', 2984

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2985
# Body
# {
.annotate 'line', 2987
# string res: $S1
null $S1
.annotate 'line', 2988
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 2991
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 2992
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 2993
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 2994
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 2995
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 2996
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 2997
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3000
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3001
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3002
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3003
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3004
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3006

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBoolOrExpr' ]
get_class $P1, [  'OpBaseBoolExpr' ]
# OpBaseBoolExpr
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3013
# Body
# {
.annotate 'line', 3015
.return('I')
# }
.annotate 'line', 3016

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBaseBinExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3023
# Body
# {
.annotate 'line', 3025
self.'optimizearg'()
.annotate 'line', 3026
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3027
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3028
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3029
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3030
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3031
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3033
.return(self)
# }
.annotate 'line', 3034

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3035
# Body
# {
.annotate 'line', 3037
# string res: $S1
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_1
set $P1, __ARG_2
goto __label_0
__label_1:
$P1 = self.'tempreg'('I')
__label_0:
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 3038
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3039
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3040
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3041
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3042
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3043

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBinAndExpr' ]
get_class $P1, [  'OpBaseBinExpr' ]
# OpBaseBinExpr
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3050
# Body
# {
.annotate 'line', 3052
self.'optimizearg'()
.annotate 'line', 3053
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3054
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3055
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3056
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3057
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3058
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3060
.return(self)
# }
.annotate 'line', 3061

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3062
# Body
# {
.annotate 'line', 3064
# string res: $S1
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_1
set $P1, __ARG_2
goto __label_0
__label_1:
$P1 = self.'tempreg'('I')
__label_0:
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 3065
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3066
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3067
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3068
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3069
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3070

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBinOrExpr' ]
get_class $P1, [  'OpBaseBinExpr' ]
# OpBaseBinExpr
addparent $P0, $P1
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3077
# Body
# {
.annotate 'line', 3079
self.'optimizearg'()
.annotate 'line', 3080
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3081
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3082
$I4 = $P1.'isliteral'()
unless $I4 goto __label_1
$I4 = $P2.'isliteral'()
__label_1:
unless $I4 goto __label_0
# {
.annotate 'line', 3083
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_2
set $S1, $P10
__label_2:
.annotate 'line', 3084
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_3
set $S2, $P10
__label_3:
.annotate 'line', 3085
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3086
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3087
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3088
# var t: $P5
null $P5
.annotate 'line', 3089
# int newtype: $I1
null $I1
.annotate 'line', 3090
getattribute $P11, $P3, 'type'
set $I6, $P11
iseq $I5, $I6, 3
unless $I5 goto __label_8
getattribute $P12, $P4, 'type'
set $I7, $P12
iseq $I5, $I7, 3
__label_8:
unless $I5 goto __label_6
set $I1, 3
goto __label_7
__label_6: # else
set $I1, 2
__label_7: # endif
.annotate 'line', 3094
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_9
set $S3, $P11
__label_9:
.annotate 'line', 3095
# string rs: $S4
getattribute $P12, $P4, 'str'
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
concat $S5, $S3, $S4
.annotate 'line', 3096
$P5 = 'newTokenFrom'($I1, $S5, $P3)
.annotate 'line', 3097
new $P14, [  'StringLiteral' ]
getattribute $P15, self, 'owner'
$P14.'StringLiteral'($P15, $P5)
set $P13, $P14
.return($P13)
# }
__label_4: # endif
.annotate 'line', 3099
iseq $I5, $S1, 'I'
unless $I5 goto __label_12
iseq $I5, $S2, 'I'
__label_12:
unless $I5 goto __label_11
# {
.annotate 'line', 3100
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3101
# int ln: $I2
set $P13, $P6
set $I2, $P13
.annotate 'line', 3102
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3103
# int rn: $I3
set $P14, $P7
set $I3, $P14
.annotate 'line', 3104
getattribute $P15, self, 'owner'
getattribute $P16, self, 'start'
add $I6, $I2, $I3
.tailcall 'integerValue'($P15, $P16, $I6)
# }
__label_11: # endif
# {
.annotate 'line', 3107
$P16 = 'floatresult'($S1, $S2)
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 3108
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3109
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3110
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3111
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3112
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P17, $P18, $N3)
# }
__label_13: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3116
.return(self)
# }
.annotate 'line', 3117

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3118
# Body
# {
.annotate 'line', 3120
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3121
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3122
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3123
.return($S1)
__label_2: # endif
.annotate 'line', 3124
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3125
.return('S')
__label_3: # endif
.annotate 'line', 3126
iseq $I2, $S1, 'S'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3127
.return('S')
__label_5: # endif
.annotate 'line', 3128
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3129
.return('N')
__label_7: # endif
.annotate 'line', 3130
.return('I')
# }
.annotate 'line', 3131

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3132
# Body
# {
.annotate 'line', 3134
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3135
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3136
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3137
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3138
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3140
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3141
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3142
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
# {
.annotate 'line', 3143
isne $I2, $S2, 'S'
if $I2 goto __label_8
isne $I2, $S3, 'S'
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 3144
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3145
isne $I1, $S2, 'S'
unless $I1 goto __label_10
# {
.annotate 'line', 3146
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3147
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3150
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3151
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3154
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3157
iseq $I2, $S1, 'I'
unless $I2 goto __label_14
isne $I2, $S2, 'I'
if $I2 goto __label_15
isne $I2, $S3, 'I'
__label_15:
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3158
# string l: $S7
null $S7
.annotate 'line', 3159
iseq $I3, $S2, 'I'
unless $I3 goto __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3161
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3162
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3164
# string r: $S8
null $S8
.annotate 'line', 3165
iseq $I3, $S3, 'I'
unless $I3 goto __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3167
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3168
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3170
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3173
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3175

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpAddExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3182
# Body
# {
.annotate 'line', 3184
self.'optimizearg'()
.annotate 'line', 3185
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3186
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3187
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3188
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3189
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3190
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3191
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3192
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3193
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3194
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3195
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3198
.return(self)
# }
.annotate 'line', 3199

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3200
# Body
# {
.annotate 'line', 3202
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3203
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3204
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3205
.return($S1)
__label_2: # endif
.annotate 'line', 3206
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3207
.return('N')
__label_3: # endif
.annotate 'line', 3208
iseq $I2, $S1, 'N'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3209
.return('N')
__label_5: # endif
.annotate 'line', 3210
.return('I')
# }
.annotate 'line', 3211

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3212
# Body
# {
.annotate 'line', 3214
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3215
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3216
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3217

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpSubExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3224
# Body
# {
.annotate 'line', 3226
self.'optimizearg'()
.annotate 'line', 3227
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3228
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3229
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3230
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3231
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3232
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3233
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3234
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3235
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3236
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3237
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
set $I5, $I1
set $I6, $I2
mul $I4, $I5, $I6
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3240
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3241
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3242
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3243
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3244
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3245
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3249
.return(self)
# }
.annotate 'line', 3250

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3251
# Body
# {
.annotate 'line', 3253
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3254
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3255
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3256
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3257
.return($S1)
__label_2: # endif
.annotate 'line', 3258
iseq $I1, $S1, 'S'
unless $I1 goto __label_3
.annotate 'line', 3259
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3261
.return('N')
__label_4: # endif
# }
.annotate 'line', 3262

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3263
# Body
# {
.annotate 'line', 3265
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3266
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3267
# var ltype: $P3
$P3 = $P1.'checkResult'()
.annotate 'line', 3268
$S10 = $P3
iseq $I3, $S10, 'S'
unless $I3 goto __label_0
# {
.annotate 'line', 3269
# string lreg: $S1
$P4 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 3270
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 3271
# string rval: $S3
null $S3
.annotate 'line', 3272
$P5 = $P2.'checkResult'()
set $S10, $P5
set $S11, 'I'
if $S10 == $S11 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S3, $S2
goto __label_3 # break
__label_4: # default
.annotate 'line', 3277
$P6 = self.'tempreg'('I')
set $S3, $P6
.annotate 'line', 3278
__ARG_1.'emitset'($S3, $S2)
__label_3: # switch end
.annotate 'line', 3280
self.'annotate'(__ARG_1)
.annotate 'line', 3281
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S1, ', ', $S3)
.annotate 'line', 3282
.return()
# }
__label_0: # endif
.annotate 'line', 3287
$S11 = $P3
iseq $I3, $S11, 'N'
unless $I3 goto __label_6
# {
.annotate 'line', 3288
# string lreg: $S4
$P5 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_7
set $S4, $P5
__label_7:
.annotate 'line', 3289
# string rreg: $S5
$P6 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P6, __label_8
set $S5, $P6
__label_8:
.annotate 'line', 3290
# string rval: $S6
null $S6
.annotate 'line', 3291
$P7 = $P2.'checkResult'()
set $S12, $P7
set $S13, 'I'
if $S12 == $S13 goto __label_11
set $S13, 'N'
if $S12 == $S13 goto __label_12
goto __label_10
# switch
__label_11: # case
.annotate 'line', 3293
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3294
__ARG_1.'emitset'($S6, $S5)
set $S6, $S5
goto __label_9 # break
__label_12: # case
set $S6, $S5
goto __label_9 # break
__label_10: # default
.annotate 'line', 3301
$P9 = self.'tempreg'('N')
set $S6, $P9
.annotate 'line', 3302
__ARG_1.'emitset'($S6, $S5)
__label_9: # switch end
.annotate 'line', 3304
self.'annotate'(__ARG_1)
.annotate 'line', 3305
__ARG_1.'say'('mul ', __ARG_2, ', ', $S4, ', ', $S6)
.annotate 'line', 3306
.return()
# }
__label_6: # endif
.annotate 'line', 3309
# string rleft: $S7
null $S7
.annotate 'line', 3310
# string rright: $S8
null $S8
.annotate 'line', 3311
# int nleft: $I1
null $I1
.annotate 'line', 3312
# int nright: $I2
null $I2
.annotate 'line', 3313
$P7 = $P1.'issimple'()
isfalse $I4, $P7
if $I4 goto __label_15
$I4 = $P1.'isidentifier'()
__label_15:
unless $I4 goto __label_13
# {
.annotate 'line', 3314
$P9 = self.'checkResult'()
$P8 = self.'tempreg'($P9)
set $S7, $P8
.annotate 'line', 3315
$P1.'emit'(__ARG_1, $S7)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 3318
$P10 = $P1.'getIntegerValue'()
set $I1, $P10
set $S7, $I1
.annotate 'line', 3319
# }
__label_14: # endif
.annotate 'line', 3321
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_18
$I4 = $P2.'isidentifier'()
__label_18:
unless $I4 goto __label_16
# {
.annotate 'line', 3322
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S8, $P11
.annotate 'line', 3323
$P2.'emit'(__ARG_1, $S8)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 3326
# string type: $S9
$P11 = $P2.'checkResult'()
null $S9
if_null $P11, __label_19
set $S9, $P11
__label_19:
set $S12, $S9
set $S13, 'S'
.annotate 'line', 3327
if $S12 == $S13 goto __label_22
set $S13, 'I'
if $S12 == $S13 goto __label_23
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3329
$P13 = self.'checkResult'()
$P12 = self.'tempreg'($P13)
set $S8, $P12
.annotate 'line', 3330
$P2.'emit'(__ARG_1, $S8)
goto __label_20 # break
__label_23: # case
__label_21: # default
.annotate 'line', 3334
$P14 = $P2.'getIntegerValue'()
set $I2, $P14
set $S8, $I2
goto __label_20 # break
__label_20: # switch end
.annotate 'line', 3336
# }
__label_17: # endif
.annotate 'line', 3339
self.'annotate'(__ARG_1)
.annotate 'line', 3340
__ARG_1.'say'('mul ', __ARG_2, ', ', $S7, ', ', $S8)
# }
.annotate 'line', 3341

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpMulExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3348
# Body
# {
.annotate 'line', 3350
self.'optimizearg'()
.annotate 'line', 3351
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3352
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3353
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3354
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3355
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3356
# var lval: $P3
null $P3
.annotate 'line', 3357
# var rval: $P4
null $P4
.annotate 'line', 3358
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3359
getattribute $P3, $P1, 'numval'
.annotate 'line', 3360
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3361
getattribute $P4, $P2, 'numval'
.annotate 'line', 3362
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3363
isne $I4, $I2, 0
unless $I4 goto __label_6
.annotate 'line', 3364
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
set $N4, $I1
set $N5, $I2
div $N3, $N4, $N5
.tailcall 'integerValue'($P7, $P8, $N3)
__label_6: # endif
# }
__label_4: # endif
# {
.annotate 'line', 3367
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3368
getattribute $P3, $P1, 'numval'
.annotate 'line', 3369
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3370
getattribute $P4, $P2, 'numval'
.annotate 'line', 3371
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3372
isne $I4, $N2, $N3
unless $I4 goto __label_8
.annotate 'line', 3373
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
div $N4, $N1, $N2
.tailcall 'floatValue'($P8, $P9, $N4)
__label_8: # endif
# }
__label_7: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3377
.return(self)
# }
.annotate 'line', 3378

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3379
# Body
# {
.annotate 'line', 3381
.return('N')
# }
.annotate 'line', 3382

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3383
# Body
# {
.annotate 'line', 3385
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3386
# var lreg: $P2
null $P2
.annotate 'line', 3387
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_0
.annotate 'line', 3388
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3390
$P2 = self.'tempreg'('N')
.annotate 'line', 3391
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3393
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3394
# var rreg: $P4
null $P4
.annotate 'line', 3395
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_2
.annotate 'line', 3396
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3398
$P4 = self.'tempreg'('N')
.annotate 'line', 3399
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3401
self.'annotate'(__ARG_1)
.annotate 'line', 3402
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3403

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpDivExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3410
# Body
# {
.annotate 'line', 3412
.return('I')
# }
.annotate 'line', 3413

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3414
# Body
# {
.annotate 'line', 3416
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3417
# var lreg: $P2
null $P2
.annotate 'line', 3418
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3419
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3421
$P2 = self.'tempreg'('I')
.annotate 'line', 3422
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3424
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3425
# var rreg: $P4
null $P4
.annotate 'line', 3426
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3427
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3429
$P4 = self.'tempreg'('I')
.annotate 'line', 3430
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3432
self.'annotate'(__ARG_1)
.annotate 'line', 3433
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3434

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpModExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3441
# Body
# {
.annotate 'line', 3443
.return('I')
# }
.annotate 'line', 3444

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3445
# Body
# {
.annotate 'line', 3447
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3448
# var lreg: $P2
null $P2
.annotate 'line', 3449
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3450
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3452
$P2 = self.'tempreg'('I')
.annotate 'line', 3453
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3455
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3456
# var rreg: $P4
null $P4
.annotate 'line', 3457
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3458
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3460
$P4 = self.'tempreg'('I')
.annotate 'line', 3461
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3463
self.'annotate'(__ARG_1)
.annotate 'line', 3468
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3469

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpCModExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3478
# Body
# {
.annotate 'line', 3480
setattribute self, 'arg', __ARG_1
.annotate 'line', 3481
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3482

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3483
# Body
# {
.annotate 'line', 3485
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3486
.return(self)
# }
.annotate 'line', 3487

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3488
# Body
# {
.annotate 'line', 3490
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3491

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Argument' ]
.annotate 'line', 3476
addattribute $P0, 'arg'
.annotate 'line', 3477
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3494
# Body
# {
.annotate 'line', 3496
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3497
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3498
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3499
.return(1)
# }
.annotate 'line', 3500

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3509
# Body
# {
.annotate 'line', 3511
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3512
setattribute self, 'predef', __ARG_3
.annotate 'line', 3513
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3514

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3515
# Body
# {
.annotate 'line', 3517
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3518

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3519
# Body
# {
.annotate 'line', 3521
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3522
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3523
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3524
# var arg: $P4
null $P4
.annotate 'line', 3525
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3526
iseq $I4, $I1, -1
unless $I4 goto __label_0
# {
.annotate 'line', 3527
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3528
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3529
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3533
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3534
# int i: $I3
null $I3
goto __label_7
__label_5: # for iteration
inc $I3
__label_7: # for condition
islt $I4, $I3, $I2
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 3535
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3536
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3537
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3538
# string argr: $S4
null $S4
.annotate 'line', 3539
iseq $I5, $S2, $S3
if $I5 goto __label_12
iseq $I5, $S3, '?'
__label_12:
unless $I5 goto __label_10
.annotate 'line', 3540
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3542
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3543
iseq $I5, $S3, 'P'
unless $I5 goto __label_13
# {
.annotate 'line', 3544
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3545
if $S6 == $S7 goto __label_16
set $S7, 'N'
if $S6 == $S7 goto __label_17
set $S7, 'S'
if $S6 == $S7 goto __label_18
goto __label_15
# switch
__label_16: # case
set $S5, 'Integer'
goto __label_14 # break
__label_17: # case
set $S5, 'Float'
goto __label_14 # break
__label_18: # case
set $S5, 'String'
goto __label_14 # break
__label_15: # default
__label_14: # switch end
.annotate 'line', 3550
isne $I6, $S5, ''
unless $I6 goto __label_19
.annotate 'line', 3551
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3553
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3555
$P3.'push'($S4)
# }
goto __label_5 # for iteration
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3558
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3559

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'CallPredefExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3506
addattribute $P0, 'predef'
.annotate 'line', 3507
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3569
# Body
# {
.annotate 'line', 3571
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3572
setattribute self, 'funref', __ARG_4
.annotate 'line', 3573
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3574
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3575
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3576
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3577
# {
.annotate 'line', 3578
# var modifier: $P2
null $P2
.annotate 'line', 3579
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3580
$P1 = __ARG_1.'get'()
.annotate 'line', 3581
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3582
$P1 = __ARG_1.'get'()
.annotate 'line', 3583
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3584
new $P8, [  'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3585
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3588
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3591
getattribute $P7, self, 'args'
new $P9, [  'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3592
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3593
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3594
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3596

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3597
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3598
# Body
# {
.annotate 'line', 3600
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3601
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3602
'optimize_array'($P1)
.annotate 'line', 3605
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3606
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3607
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3608
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3609
isnull $I1, $P3
not $I1
unless $I1 goto __label_2
# {
.annotate 'line', 3610
self.'use_predef'($S1)
.annotate 'line', 3613
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3614
isnull $I2, $P4
not $I2
unless $I2 goto __label_3
# {
.annotate 'line', 3615
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3616
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3619
new $P9, [  'CallPredefExpr' ]
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
$P9.'CallPredefExpr'($P10, $P11, $P3, $P1)
set $P8, $P9
.return($P8)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3623
.return(self)
# }
.annotate 'line', 3624

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3625
# Body
# {
.annotate 'line', 3627
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3628
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3629
# string call: $S1
null $S1
.annotate 'line', 3630
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3631
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 3632
iseq $I6, $S1, ''
unless $I6 goto __label_2
# {
.annotate 'line', 3633
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S8, "'", $S2
concat $S1, $S8, "'"
.annotate 'line', 3634
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3638
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 3640
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3641
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 3642
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 3643
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 3644
# string reg: $S3
null $S3
.annotate 'line', 3645
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 3646
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 3647
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 3650
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 3651
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 3653
self.'annotate'(__ARG_1)
.annotate 'line', 3655
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 3656
$S9 = __ARG_2
iseq $I7, $S9, '.tailcall'
unless $I7 goto __label_12
.annotate 'line', 3657
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 3659
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 3662
unless $I1 goto __label_14
.annotate 'line', 3663
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 3665
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 3667
__ARG_1.'print'('(')
.annotate 'line', 3669
# string sep: $S4
set $S4, ''
.annotate 'line', 3670
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 3671
# int i: $I3
null $I3
goto __label_18
__label_16: # for iteration
inc $I3
__label_18: # for condition
islt $I7, $I3, $I2
unless $I7 goto __label_17 # for end
# {
.annotate 'line', 3672
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 3673
__ARG_1.'print'($S4, $S5)
.annotate 'line', 3674
# int isflat: $I4
null $I4
.annotate 'line', 3675
# int isnamed: $I5
null $I5
.annotate 'line', 3676
# string setname: $S6
set $S6, ''
.annotate 'line', 3677
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 3678
isnull $I8, $P6
not $I8
unless $I8 goto __label_19
# {
.annotate 'line', 3679
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 3680
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 3681
iseq $I8, $S7, 'flat'
unless $I8 goto __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 3683
iseq $I9, $S7, 'named'
unless $I9 goto __label_24
# {
set $I5, 1
.annotate 'line', 3685
$P15 = $P7.'numargs'()
set $I9, $P15
null $I10
if $I9 == $I10 goto __label_27
set $I10, 1
if $I9 == $I10 goto __label_28
goto __label_26
# switch
__label_27: # case
goto __label_25 # break
__label_28: # case
.annotate 'line', 3689
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 3690
$P17 = $P8.'isstringliteral'()
isfalse $I11, $P17
unless $I11 goto __label_29
.annotate 'line', 3691
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 3692
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 3695
getattribute $P20, self, 'start'
'SyntaxError'('Invalid modifier', $P20)
__label_25: # switch end
# }
__label_24: # endif
# }
goto __label_20
__label_21: # endfor
# }
__label_19: # endif
set $I11, $I4
set $I12, $I5
.annotate 'line', 3700
and $I10, $I11, $I12
unless $I10 goto __label_30
.annotate 'line', 3701
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 3702
unless $I4 goto __label_32
.annotate 'line', 3703
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 3704
unless $I5 goto __label_34
# {
.annotate 'line', 3705
__ARG_1.'print'(' :named')
.annotate 'line', 3706
isne $I12, $S6, ''
unless $I12 goto __label_35
.annotate 'line', 3707
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 3709
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 3711
__ARG_1.'say'(')')
# }
.annotate 'line', 3712

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'CallExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3566
addattribute $P0, 'funref'
.annotate 'line', 3567
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3722
# Body
# {
.annotate 'line', 3724
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3725
setattribute self, 'left', __ARG_4
.annotate 'line', 3726
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 3727

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 3728
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3729
# Body
# {
.annotate 'line', 3731
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3732
.return(self)
# }
.annotate 'line', 3733

.end # optimize


.sub 'get_member' :method

.annotate 'line', 3734
# Body
# {
.annotate 'line', 3736
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 3737

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 3738
# Body
# {
.annotate 'line', 3740
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 3741
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3742
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3743
isne $I1, $S1, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3744
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 3745
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 3746
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 3748
.return($S2)
# }
.annotate 'line', 3749

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3750
# Body
# {
.annotate 'line', 3752
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3753
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3754
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3755
self.'annotate'(__ARG_1)
.annotate 'line', 3756
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 3757
.return($S3)
# }
.annotate 'line', 3758

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3759
# Body
# {
.annotate 'line', 3761
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3762
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3763
self.'annotate'(__ARG_1)
.annotate 'line', 3764
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 3765

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3766
# Body
# {
.annotate 'line', 3768
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3769
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3770
# string value: $S3
null $S3
.annotate 'line', 3771
iseq $I1, __ARG_2, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3773
iseq $I2, __ARG_3, 'null'
unless $I2 goto __label_4
# {
.annotate 'line', 3774
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 3775
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 3777
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3780
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 3781
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 3783
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 3784

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3785
# Body
# {
.annotate 'line', 3787
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3788
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3789
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3790
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 3791
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3793
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 3794
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
isne $I1, $S5, 'P'
unless $I1 goto __label_6
.annotate 'line', 3795
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 3797
# }
__label_4: # endif
.annotate 'line', 3799
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 3800
.return($S3)
# }
.annotate 'line', 3801

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'MemberExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3719
addattribute $P0, 'left'
.annotate 'line', 3720
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3810
# Body
# {
.annotate 'line', 3812
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3813
setattribute self, 'left', __ARG_4
.annotate 'line', 3814
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 3815

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 3816
# Body
# {
.annotate 'line', 3818
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
iseq $I1, $S1, 'S'
unless $I1 goto __label_0
.annotate 'line', 3819
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 3821
.return('P')
__label_1: # endif
# }
.annotate 'line', 3822

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3823
# Body
# {
.annotate 'line', 3825
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3826
self.'optimizeargs'()
.annotate 'line', 3827
.return(self)
# }
.annotate 'line', 3828

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3829
# Body
# {
.annotate 'line', 3831
# var regleft: $P1
null $P1
.annotate 'line', 3832
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 3833
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 3835
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 3836
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 3837
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3838
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 3839
iseq $I2, $S1, 'S'
unless $I2 goto __label_3
# {
.annotate 'line', 3840
isne $I3, $I1, 1
unless $I3 goto __label_5
.annotate 'line', 3841
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 3842
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3845
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 3846
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3847
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 3849

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3850
# Body
# {
.annotate 'line', 3852
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3853
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3854
self.'annotate'(__ARG_1)
.annotate 'line', 3855
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3856
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 3857
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 3858

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3859
# Body
# {
.annotate 'line', 3861
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3862
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3863
# string rreg: $S1
null $S1
.annotate 'line', 3864
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3865
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 3866
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 3869
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 3870
self.'annotate'(__ARG_1)
.annotate 'line', 3871
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3872
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3873
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 3874
.return($S1)
# }
.annotate 'line', 3875

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IndexExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
get_class $P2, [  'SimpleArgList' ]
# SimpleArgList
addparent $P0, $P2
.annotate 'line', 3808
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3884
# Body
# {
.annotate 'line', 3886
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3887
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 3888
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3889
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 3890
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3891
# {
.annotate 'line', 3892
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3893
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 3894
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 3895
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 3896
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3898

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 3899
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3900
# Body
# {
.annotate 'line', 3902
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3903
.return(self)
# }
.annotate 'line', 3904

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3905
# Body
# {
.annotate 'line', 3907
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3908
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3909

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3910
# Body
# {
.annotate 'line', 3912
self.'annotate'(__ARG_1)
.annotate 'line', 3913
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3914
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 3915
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3916
# string itemreg: $S3
null $S3
.annotate 'line', 3917
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 3918
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 3919
if $S6 == $S7 goto __label_7
set $S7, 'N'
if $S6 == $S7 goto __label_8
set $S7, 'S'
if $S6 == $S7 goto __label_9
goto __label_6
# switch
__label_7: # case
__label_8: # case
__label_9: # case
.annotate 'line', 3921
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 3922
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 3926
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 3928
self.'annotate'(__ARG_1)
.annotate 'line', 3929
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 3931
.return($S1)
# }
.annotate 'line', 3932

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ArrayExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3882
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3942
# Body
# {
.annotate 'line', 3944
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3945
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3946
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 3947
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 3948
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 3949
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3950
# {
.annotate 'line', 3958
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3959
'ExpectOp'(':', __ARG_1)
.annotate 'line', 3960
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3961
$P2.'push'($P4)
.annotate 'line', 3962
$P3.'push'($P5)
# }
.annotate 'line', 3964
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 3965
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 3966
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3968
setattribute self, 'keys', $P2
.annotate 'line', 3969
setattribute self, 'values', $P3
# }
.annotate 'line', 3970

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 3971
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3972
# Body
# {
.annotate 'line', 3974
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 3975
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3976
.return(self)
# }
.annotate 'line', 3977

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3978
# Body
# {
.annotate 'line', 3980
self.'annotate'(__ARG_1)
.annotate 'line', 3981
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 3982
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 3983
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 3984
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 3985
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 3986
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 3987
# string item: $S1
null $S1
.annotate 'line', 3988
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 3989
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 3990
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 3991
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 3994
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 3996
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 3997
# string itemreg: $S3
null $S3
.annotate 'line', 3998
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 3999
# string id: $S4
$P8 = $P4.'getName'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4000
getattribute $P9, self, 'owner'
$P8 = $P9.'getvar'($S4)
isnull $I3, $P8
unless $I3 goto __label_9
# {
.annotate 'line', 4001
$P10 = self.'tempreg'('P')
set $S3, $P10
.annotate 'line', 4002
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S4, "'")
# }
goto __label_10
__label_9: # else
.annotate 'line', 4005
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4008
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4009
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 4031

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4032
# Body
# {
.annotate 'line', 4034
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4035
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4036
.return($S1)
# }
.annotate 'line', 4037

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'HashExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3939
addattribute $P0, 'keys'
.annotate 'line', 3940
addattribute $P0, 'values'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4047
# Body
# {
.annotate 'line', 4049
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4051
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4052
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4053
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4054
$P6 = __ARG_4.'isidentifier'()
if_null $P6, __label_2
unless $P6 goto __label_2
# {
.annotate 'line', 4055
$P7 = $P1.'isop'('.')
if_null $P7, __label_4
unless $P7 goto __label_4
# {
.annotate 'line', 4056
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4057
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4058
# {
.annotate 'line', 4059
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4060
$P6 = $P3.'isidentifier'()
isfalse $I1, $P6
unless $I1 goto __label_9
.annotate 'line', 4061
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4062
$P2.'push'($P3)
# }
.annotate 'line', 4063
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'('.')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 4064
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4067
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4070
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4072
$P9 = $P1.'isop'('(')
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 4073
$P1 = __ARG_1.'get'()
.annotate 'line', 4074
$P10 = $P1.'isop'(')')
isfalse $I2, $P10
unless $I2 goto __label_12
# {
.annotate 'line', 4075
__ARG_1.'unget'($P1)
.annotate 'line', 4076
# var initializer: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
set $P4, $P10
__label_13: # do
.annotate 'line', 4077
# {
.annotate 'line', 4078
# var auxinit: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4079
$P4.'push'($P5)
# }
.annotate 'line', 4080
$P1 = __ARG_1.'get'()
$P11 = $P1.'isop'(',')
if_null $P11, __label_14
if $P11 goto __label_13
__label_14: # enddo
.annotate 'line', 4081
setattribute self, 'initializer', $P4
.annotate 'line', 4082
'RequireOp'(')', $P1)
# }
__label_12: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4086
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4087

.end # NewExpr


.sub 'checkResult' :method

.annotate 'line', 4088
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4089
# Body
# {
.annotate 'line', 4091
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4092
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4095
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4096
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4097
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4098
$P5 = $P3['id']
isnull $I2, $P5
not $I2
unless $I2 goto __label_4
# {
.annotate 'line', 4099
$P1 = $P3['value']
.annotate 'line', 4100
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4101
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4102
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4105
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4109
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4110
isnull $I3, $P4
not $I3
unless $I3 goto __label_7
.annotate 'line', 4111
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4112
.return(self)
# }
.annotate 'line', 4113

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4114
# Body
# {
.annotate 'line', 4116
self.'annotate'(__ARG_1)
.annotate 'line', 4118
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4119
# int numinits: $I1
isnull $I3, $P1
unless $I3 goto __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
# Constant BYMULTI evaluated at compile time
.annotate 'line', 4124
# int type: $I2
getattribute $P8, self, 'value'
isa $I3, $P8, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4125
getattribute $P10, self, 'value'
$P9 = $P10.'isstring'()
if_null $P9, __label_5
unless $P9 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4126
getattribute $P12, self, 'value'
$P11 = $P12.'isidentifier'()
if_null $P11, __label_7
unless $P11 goto __label_7
set $I2, 1
goto __label_6
__label_7:
set $I2, -1
__label_6:
__label_4:
__label_2:
.annotate 'line', 4128
# string reginit: $S1
set $S1, ''
.annotate 'line', 4129
# string regnew: $S2
set $P8, __ARG_2
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 4130
# string constructor: $S3
null $S3
set $I4, $I1
null $I5
.annotate 'line', 4131
if $I4 == $I5 goto __label_11
set $I5, 1
if $I4 == $I5 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4135
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4136
$P9 = $P2.'emit_get'(__ARG_1)
set $S1, $P9
concat $S1, ', ', $S1
goto __label_9 # break
__label_10: # default
.annotate 'line', 4140
isne $I6, $I2, 1
unless $I6 goto __label_14
isne $I6, $I2, 2
__label_14:
unless $I6 goto __label_13
.annotate 'line', 4141
getattribute $P10, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P10)
__label_13: # endif
.annotate 'line', 4142
$P11 = self.'tempreg'('P')
set $S2, $P11
__label_9: # switch end
set $I4, $I2
null $I5
.annotate 'line', 4145
if $I4 == $I5 goto __label_17
set $I5, 2
if $I4 == $I5 goto __label_18
set $I5, 1
if $I4 == $I5 goto __label_19
goto __label_16
# switch
__label_17: # case
.annotate 'line', 4148
# string name: $S4
getattribute $P13, self, 'value'
$P12 = $P13.'rawstring'()
null $S4
if_null $P12, __label_20
set $S4, $P12
__label_20:
.annotate 'line', 4149
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4150
isnull $I6, $P3
unless $I6 goto __label_21
concat $S9, "Can't locate class ", $S4
concat $S8, $S9, " at compile time"
.annotate 'line', 4151
getattribute $P14, self, 'value'
'Warn'($S8, $P14)
__label_21: # endif
.annotate 'line', 4155
getattribute $P15, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P15, " ]", $S1)
.annotate 'line', 4156
isgt $I7, $I1, 1
unless $I7 goto __label_22
# {
.annotate 'line', 4157
getattribute $P16, self, 'value'
__ARG_1.'say'($S2, ".'", $P16, "'()")
# }
__label_22: # endif
goto __label_15 # break
__label_18: # case
.annotate 'line', 4161
__ARG_1.'print'('new ', $S2, ", [")
.annotate 'line', 4162
# string sep: $S5
set $S5, ''
.annotate 'line', 4163
getattribute $P13, self, 'value'
iter $P17, $P13
set $P17, 0
__label_23: # for iteration
unless $P17 goto __label_24
shift $S6, $P17
# {
.annotate 'line', 4164
__ARG_1.'print'($S5, "'", $S6, "'")
set $S5, ';'
set $S3, $S6
.annotate 'line', 4166
# }
goto __label_23
__label_24: # endfor
.annotate 'line', 4168
__ARG_1.'say'("]", $S1)
goto __label_15 # break
__label_19: # case
.annotate 'line', 4171
# var id: $P4
getattribute $P14, self, 'owner'
getattribute $P15, self, 'value'
$P4 = $P14.'getvar'($P15)
.annotate 'line', 4172
isnull $I7, $P4
unless $I7 goto __label_25
# {
.annotate 'line', 4174
# var cl: $P5
getattribute $P16, self, 'owner'
getattribute $P18, self, 'value'
$P5 = $P16.'checkclass'($P18)
.annotate 'line', 4175
isnull $I8, $P5
not $I8
unless $I8 goto __label_27
# {
.annotate 'line', 4176
$P18 = $P5.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P18, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4179
'Warn'('Checking: new unknown type')
.annotate 'line', 4180
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4182
getattribute $P19, self, 'value'
set $S3, $P19
# }
goto __label_26
__label_25: # else
# {
$P20 = $P4['reg']
.annotate 'line', 4186
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_15 # break
__label_16: # default
.annotate 'line', 4190
'InternalError'('Unexpected type in new')
__label_15: # switch end
.annotate 'line', 4192
isgt $I8, $I1, 1
unless $I8 goto __label_29
# {
.annotate 'line', 4193
# string argregs: $P6
root_new $P6, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4194
iter $P21, $P1
set $P21, 0
__label_30: # for iteration
unless $P21 goto __label_31
shift $P7, $P21
# {
.annotate 'line', 4195
# string reg: $S7
$P20 = $P7.'emit_get'(__ARG_1)
null $S7
if_null $P20, __label_32
set $S7, $P20
__label_32:
.annotate 'line', 4196
$P6.'push'($S7)
# }
goto __label_30
__label_31: # endfor
.annotate 'line', 4198
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4199
join $S8, ", ", $P6
__ARG_1.'print'($S8)
.annotate 'line', 4200
__ARG_1.'say'(")")
.annotate 'line', 4201
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4203

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NewExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 4044
addattribute $P0, 'value'
.annotate 'line', 4045
addattribute $P0, 'initializer'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4213
# Body
# {
.annotate 'line', 4215
# var first: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4216
$P4 = $P1.'isstring'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 4217
'SyntaxError'('Expected string literal', $P1)
__label_0: # endif
.annotate 'line', 4218
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4219
$P4 = $P2.'isop'(':')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 4220
setattribute self, 'hll', $P1
.annotate 'line', 4221
$P1 = __ARG_1.'get'()
.annotate 'line', 4222
$P5 = $P1.'isstring'()
isfalse $I1, $P5
unless $I1 goto __label_2
.annotate 'line', 4223
'SyntaxError'('Expected string literal', $P1)
__label_2: # endif
.annotate 'line', 4224
$P2 = __ARG_1.'get'()
# }
__label_1: # endif
.annotate 'line', 4226
# var nskey: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4227
$P3.'push'($P1)
__label_4: # while
.annotate 'line', 4228
$P6 = $P2.'isop'(',')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 4229
$P1 = __ARG_1.'get'()
.annotate 'line', 4230
$P7 = $P1.'isstring'()
isfalse $I2, $P7
unless $I2 goto __label_5
.annotate 'line', 4231
'SyntaxError'('Expected string literal', $P1)
__label_5: # endif
.annotate 'line', 4232
$P3.'push'($P1)
.annotate 'line', 4233
$P2 = __ARG_1.'get'()
# }
goto __label_4
__label_3: # endwhile
.annotate 'line', 4235
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_6
.annotate 'line', 4236
'SyntaxError'("Expected ']' in keyed new", $P2)
__label_6: # endif
.annotate 'line', 4237
setattribute self, 'nskey', $P3
# }
.annotate 'line', 4238

.end # NewIndexedExpr


.sub 'checkResult' :method

.annotate 'line', 4239
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4240
# Body
# {
.annotate 'line', 4242
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 4243
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4244
__ARG_1.'print'("root_new ", __ARG_2, ", [", $P1, "; ")
goto __label_1
__label_0: # else
.annotate 'line', 4246
__ARG_1.'print'("new ", __ARG_2, ", [")
__label_1: # endif
.annotate 'line', 4247
# var nskey: $P2
getattribute $P2, self, 'nskey'
# predefined join
.annotate 'line', 4248
join $S1, ";", $P2
__ARG_1.'print'($S1)
.annotate 'line', 4250
__ARG_1.'say'("]")
# }
.annotate 'line', 4251

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NewIndexedExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 4210
addattribute $P0, 'hll'
.annotate 'line', 4211
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4256
# Body
# {
.annotate 'line', 4258
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4259
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 4260
new $P4, [  'NewIndexedExpr' ]
$P4.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 4262
new $P6, [  'NewExpr' ]
$P6.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
# }
.annotate 'line', 4263

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4272
# Body
# {
.annotate 'line', 4274
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4275
setattribute self, 'eleft', __ARG_3
.annotate 'line', 4276
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4277

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4278
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4279
# Body
# {
.annotate 'line', 4281
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4282
# string checkedval: $S1
null $S1
.annotate 'line', 4283
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4284
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S3, "'", $S1
concat $S1, $S3, "'"
.annotate 'line', 4285
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4289
# string r: $S2
getattribute $P3, self, 'eleft'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4290
self.'annotate'(__ARG_1)
.annotate 'line', 4291
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4292

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpInstanceOfExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 4269
addattribute $P0, 'eleft'
.annotate 'line', 4270
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4307
# Body
# {
.annotate 'line', 4309
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4310
new $P3, [  'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4311
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4312
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4313
.return(self)
# }
.annotate 'line', 4314

.end # set


.sub 'optimize' :method

.annotate 'line', 4315
# Body
# {
.annotate 'line', 4317
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4318
getattribute $P2, self, 'condition'
$P1 = $P2.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4320
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4322
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4324
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4325
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4326
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4328

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4329
# Body
# {
.annotate 'line', 4331
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4332

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4333
# Body
# {
.annotate 'line', 4335
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4336
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4337
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4338
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4339
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4340
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4341
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4342
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4343

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpConditionalExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 4303
addattribute $P0, 'condition'
.annotate 'line', 4304
addattribute $P0, 'etrue'
.annotate 'line', 4305
addattribute $P0, 'efalse'
.end
.namespace [ ]
# Constant Code_none evaluated at compile time
# Constant Code_paren evaluated at compile time
# Constant Code_bracket evaluated at compile time
# Constant Code_dot evaluated at compile time
# Constant Code_assign evaluated at compile time
# Constant Code_assign_to evaluated at compile time
# Constant Code_add_assign evaluated at compile time
# Constant Code_add evaluated at compile time
# Constant Code_minus evaluated at compile time
# Constant Code_inc evaluated at compile time
# Constant Code_dec evaluated at compile time
# Constant Code_not evaluated at compile time
# Constant Code_equal evaluated at compile time
# Constant Code_not_equal evaluated at compile time
# Constant Code_less evaluated at compile time
# Constant Code_less_equal evaluated at compile time
# Constant Code_greater evaluated at compile time
# Constant Code_greater_equal evaluated at compile time
# Constant Code_sub_assign evaluated at compile time
# Constant Code_mul evaluated at compile time
# Constant Code_div evaluated at compile time
# Constant Code_mod evaluated at compile time
# Constant Code_cmod evaluated at compile time
# Constant Code_mul_assign evaluated at compile time
# Constant Code_div_assign evaluated at compile time

.sub 'getOpCode_2'
.param pmc __ARG_1

.annotate 'line', 4376
# Body
# {
.annotate 'line', 4378
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '('
if $S1 == $S2 goto __label_2
set $S2, '['
if $S1 == $S2 goto __label_3
set $S2, '.'
if $S1 == $S2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4379
.return(1)
__label_3: # case
.annotate 'line', 4380
.return(2)
__label_4: # case
.annotate 'line', 4381
.return(3)
__label_1: # default
.annotate 'line', 4382
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4384

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4386
# Body
# {
.annotate 'line', 4388
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '-'
if $S1 == $S2 goto __label_2
set $S2, '!'
if $S1 == $S2 goto __label_3
set $S2, '++'
if $S1 == $S2 goto __label_4
set $S2, '--'
if $S1 == $S2 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4389
.return(8)
__label_3: # case
.annotate 'line', 4390
.return(11)
__label_4: # case
.annotate 'line', 4391
.return(9)
__label_5: # case
.annotate 'line', 4392
.return(10)
__label_1: # default
.annotate 'line', 4393
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4395

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4397
# Body
# {
.annotate 'line', 4399
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '*'
if $S1 == $S2 goto __label_2
set $S2, '/'
if $S1 == $S2 goto __label_3
set $S2, '%'
if $S1 == $S2 goto __label_4
set $S2, '%%'
if $S1 == $S2 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4400
.return(19)
__label_3: # case
.annotate 'line', 4401
.return(20)
__label_4: # case
.annotate 'line', 4402
.return(21)
__label_5: # case
.annotate 'line', 4403
.return(22)
__label_1: # default
.annotate 'line', 4404
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4406

.end # getOpCode_5


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4408
# Body
# {
.annotate 'line', 4410
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '<'
if $S1 == $S2 goto __label_2
set $S2, '>'
if $S1 == $S2 goto __label_3
set $S2, '<='
if $S1 == $S2 goto __label_4
set $S2, '>='
if $S1 == $S2 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4411
.return(14)
__label_3: # case
.annotate 'line', 4412
.return(16)
__label_4: # case
.annotate 'line', 4413
.return(15)
__label_5: # case
.annotate 'line', 4414
.return(17)
__label_1: # default
.annotate 'line', 4415
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4417

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4419
# Body
# {
.annotate 'line', 4421
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '='
if $S1 == $S2 goto __label_2
set $S2, '=:'
if $S1 == $S2 goto __label_3
set $S2, '+='
if $S1 == $S2 goto __label_4
set $S2, '-='
if $S1 == $S2 goto __label_5
set $S2, '*='
if $S1 == $S2 goto __label_6
set $S2, '/='
if $S1 == $S2 goto __label_7
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4422
.return(4)
__label_3: # case
.annotate 'line', 4423
.return(5)
__label_4: # case
.annotate 'line', 4424
.return(6)
__label_5: # case
.annotate 'line', 4425
.return(18)
__label_6: # case
.annotate 'line', 4426
.return(23)
__label_7: # case
.annotate 'line', 4427
.return(24)
__label_1: # default
.annotate 'line', 4428
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4430

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4432
# Body
# {
.annotate 'line', 4434
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4436
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4437
# var expr: $P2
null $P2
.annotate 'line', 4438
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4439
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4440
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4441
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4443
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4444
new $P6, [  'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4445
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4446
new $P7, [  'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4447
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4448
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4449
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4450
new $P10, [  'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4451
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4452
new $P10, [  'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4453
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4454
new $P13, [  'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4455
$P11 = $P1.'isidentifier'()
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4456
new $P12, [  'IdentifierExpr' ]
.tailcall $P12.'set'(__ARG_2, $P1)
__label_7: # endif
.annotate 'line', 4457
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4458

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4460
# Body
# {
.annotate 'line', 4462
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4463
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4465
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4466
# var t: $P2
null $P2
.annotate 'line', 4467
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4468
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
set $I3, $I1
set $I4, 1
.annotate 'line', 4469
if $I3 == $I4 goto __label_4
set $I4, 2
if $I3 == $I4 goto __label_5
set $I4, 3
if $I3 == $I4 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4471
new $P6, [  'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4474
new $P7, [  'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4477
new $P8, [  'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4480
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4483
__ARG_1.'unget'($P2)
.annotate 'line', 4484
.return($P1)
# }
.annotate 'line', 4485

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4487
# Body
# {
.annotate 'line', 4489
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4491
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4492
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4493
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4494
new $P5, [  'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4495
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4496
new $P7, [  'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4499
__ARG_1.'unget'($P2)
.annotate 'line', 4500
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4502

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4504
# Body
# {
.annotate 'line', 4506
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4507
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4508
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4510
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4511
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4512
# var subexpr: $P2
null $P2
.annotate 'line', 4513
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4514
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4515
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4516
if $I2 == $I3 goto __label_4
set $I3, 11
if $I2 == $I3 goto __label_5
set $I3, 9
if $I2 == $I3 goto __label_6
set $I3, 10
if $I2 == $I3 goto __label_7
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4518
new $P3, [  'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4521
new $P3, [  'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4524
new $P3, [  'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4527
new $P3, [  'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4530
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4532
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4535
__ARG_1.'unget'($P1)
.annotate 'line', 4536
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4538
.return($P2)
# }
.annotate 'line', 4539

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4541
# Body
# {
.annotate 'line', 4543
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4544
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4546
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4547
# var t: $P2
null $P2
.annotate 'line', 4548
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4549
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4550
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4551
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4552
if $I2 == $I3 goto __label_4
set $I3, 20
if $I2 == $I3 goto __label_5
set $I3, 21
if $I2 == $I3 goto __label_6
set $I3, 22
if $I2 == $I3 goto __label_7
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4554
new $P4, [  'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4557
new $P4, [  'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4560
new $P4, [  'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4563
new $P4, [  'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4566
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 4568
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4569
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4571
__ARG_1.'unget'($P2)
.annotate 'line', 4572
.return($P1)
# }
.annotate 'line', 4573

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4575
# Body
# {
.annotate 'line', 4577
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 4579
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4580
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4581
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 4582
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4583
# var expr: $P4
null $P4
.annotate 'line', 4584
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 4585
new $P7, [  'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 4587
new $P8, [  'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 4588
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4590
__ARG_1.'unget'($P2)
.annotate 'line', 4591
.return($P1)
# }
.annotate 'line', 4592

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4594
# Body
# {
.annotate 'line', 4596
.const 'Sub' $P5 = 'parseExpr_6'
.annotate 'line', 4598
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4599
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4600
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('==')
if $I1 goto __label_3
$I1 = $P2.'isop'('!=')
__label_3:
if $I1 goto __label_2
$I1 = $P2.'iskeyword'('instanceof')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 4601
$P6 = $P2.'isop'('==')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4602
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4603
new $P6, [  'OpEqualExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 4605
$P7 = $P2.'isop'('!=')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4606
# var eright: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4607
new $P7, [  'OpNotEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4610
new $P8, [  'OpInstanceOfExpr' ]
$P8.'OpInstanceOfExpr'(__ARG_2, $P2, $P1, __ARG_1)
set $P1, $P8
# }
__label_7: # endif
__label_5: # endif
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4613
__ARG_1.'unget'($P2)
.annotate 'line', 4614
.return($P1)
# }
.annotate 'line', 4615

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4617
# Body
# {
.annotate 'line', 4619
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 4620
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 4622
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4623
# var t: $P2
null $P2
.annotate 'line', 4624
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4625
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4626
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 4627
if $I2 == $I3 goto __label_4
set $I3, 16
if $I2 == $I3 goto __label_5
set $I3, 15
if $I2 == $I3 goto __label_6
set $I3, 17
if $I2 == $I3 goto __label_7
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4629
new $P6, [  'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 4632
new $P7, [  'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 4635
new $P8, [  'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 4638
new $P9, [  'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 4641
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4644
__ARG_1.'unget'($P2)
.annotate 'line', 4645
.return($P1)
# }
.annotate 'line', 4646

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4648
# Body
# {
.annotate 'line', 4650
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 4652
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4653
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4654
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4655
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4656
new $P5, [  'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4658
__ARG_1.'unget'($P2)
.annotate 'line', 4659
.return($P1)
# }
.annotate 'line', 4660

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4662
# Body
# {
.annotate 'line', 4664
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 4666
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4667
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4668
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4669
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4670
new $P5, [  'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4672
__ARG_1.'unget'($P2)
.annotate 'line', 4673
.return($P1)
# }
.annotate 'line', 4674

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4676
# Body
# {
.annotate 'line', 4678
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 4680
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4681
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4682
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4683
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4684
new $P5, [  'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4686
__ARG_1.'unget'($P2)
.annotate 'line', 4687
.return($P1)
# }
.annotate 'line', 4688

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4690
# Body
# {
.annotate 'line', 4692
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 4694
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4695
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4696
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4697
# var eright: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 4698
new $P5, [  'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4700
__ARG_1.'unget'($P2)
.annotate 'line', 4701
.return($P1)
# }
.annotate 'line', 4702

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4704
# Body
# {
.annotate 'line', 4706
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4707
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 4709
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4710
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4711
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 4712
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4713
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4714
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4715
new $P7, [  'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4718
__ARG_1.'unget'($P2)
.annotate 'line', 4719
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 4721

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4723
# Body
# {
.annotate 'line', 4725
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4726
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 4727
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 4729
# var eleft: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4730
# var t: $P2
null $P2
.annotate 'line', 4731
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4732
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4733
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4734
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 4735
if $I2 == $I3 goto __label_4
set $I3, 5
if $I2 == $I3 goto __label_5
set $I3, 6
if $I2 == $I3 goto __label_6
set $I3, 18
if $I2 == $I3 goto __label_7
set $I3, 23
if $I2 == $I3 goto __label_8
set $I3, 24
if $I2 == $I3 goto __label_9
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4737
new $P4, [  'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4740
new $P4, [  'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4743
new $P4, [  'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4746
new $P4, [  'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 4749
new $P4, [  'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 4752
new $P4, [  'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4755
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 4757
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4758
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4760
__ARG_1.'unget'($P2)
.annotate 'line', 4761
.return($P1)
# }
.annotate 'line', 4762

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4764
# Body
# {
.annotate 'line', 4766
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 4768
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 4769

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 4782
# Body
# {
.annotate 'line', 4784
getattribute $P1, self, 'brlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4785
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 4786
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4787
setattribute self, 'brlabel', $P2
.annotate 'line', 4788
.return($S1)
# }
.annotate 'line', 4789

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 4790
# Body
# {
.annotate 'line', 4792
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 4793
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4794
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 4795
.return($P1)
# }
.annotate 'line', 4796

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Breakable' ]
.annotate 'line', 4780
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 4803
# Body
# {
.annotate 'line', 4805
getattribute $P1, self, 'cntlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4806
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 4807
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4808
setattribute self, 'cntlabel', $P2
.annotate 'line', 4809
.return($S1)
# }
.annotate 'line', 4810

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 4811
# Body
# {
.annotate 'line', 4813
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 4814
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4815
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 4816
.return($P1)
# }
.annotate 'line', 4817

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Continuable' ]
get_class $P1, [  'Breakable' ]
# Breakable
addparent $P0, $P1
.annotate 'line', 4801
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4831
# Body
# {
.annotate 'line', 4833
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4834
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4835
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 4836
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 4837
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 4838
# {
.annotate 'line', 4839
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 4840
$P2.'push'($P3)
# }
.annotate 'line', 4841
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 4843
'RequireOp'(';', $P1)
.annotate 'line', 4844
setattribute self, 'values', $P2
# }
.annotate 'line', 4845

.end # parse


.sub 'optimize' :method

.annotate 'line', 4846
# Body
# {
.annotate 'line', 4848
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4849
.return(self)
# }
.annotate 'line', 4850

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4851
# Body
# {
.annotate 'line', 4853
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 4854
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4855
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 4858
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4859
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 4861
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 4862
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 4863
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 4864
self.'annotate'(__ARG_1)
.annotate 'line', 4865
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 4869
# int i: $I2
null $I2
goto __label_7
__label_5: # for iteration
inc $I2
__label_7: # for condition
islt $I4, $I2, $I1
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 4870
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 4871
# string reg: $S1
null $S1
.annotate 'line', 4872
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 4873
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 4874
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4877
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 4878
$P1.'push'($S1)
# }
goto __label_5 # for iteration
__label_6: # for end
.annotate 'line', 4880
self.'annotate'(__ARG_1)
.annotate 'line', 4881
self.'emitret'(__ARG_1)
.annotate 'line', 4882
# string sep: $S2
set $S2, ''
.annotate 'line', 4883
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 4884
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 4885
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 4887
__ARG_1.'say'(')')
# }
.annotate 'line', 4888

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ReturnYieldStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 4829
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4893
# Body
# {
.annotate 'line', 4895
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4896

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4897
# Body
# {
.annotate 'line', 4899
__ARG_1.'print'('.return(')
# }
.annotate 'line', 4900

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ReturnStatement' ]
get_class $P1, [  'ReturnYieldStatement' ]
# ReturnYieldStatement
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4905
# Body
# {
.annotate 'line', 4907
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4908

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4909
# Body
# {
.annotate 'line', 4911
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 4912

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'YieldStatement' ]
get_class $P1, [  'ReturnYieldStatement' ]
# ReturnYieldStatement
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4923
# Body
# {
.annotate 'line', 4925
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 4926
setattribute self, 'name', __ARG_1
.annotate 'line', 4927
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 4928
setattribute self, 'value', $P2
.annotate 'line', 4929
.return(self)
# }
.annotate 'line', 4930

.end # set


.sub 'optimize' :method

.annotate 'line', 4931
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4932
# Body
# {
.annotate 'line', 4934
self.'annotate'(__ARG_1)
.annotate 'line', 4935
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4936
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 4937
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 4938

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'LabelStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 4921
addattribute $P0, 'name'
.annotate 'line', 4922
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4949
# Body
# {
.annotate 'line', 4951
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4952
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4953
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 4954
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 4955
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 4956
setattribute self, 'label', $P1
.annotate 'line', 4957
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 4958

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 4959
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4960
# Body
# {
.annotate 'line', 4962
self.'annotate'(__ARG_1)
.annotate 'line', 4963
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4964
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 4965
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 4966

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'GotoStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 4947
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 4975
# Body
# {
.annotate 'line', 4977
'ExpectOp'('(', __ARG_1)
.annotate 'line', 4978
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 4979
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 4980

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ConditionalStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
get_class $P2, [  'Condition' ]
# Condition
addparent $P0, $P2
.end
.namespace [ 'IfStatement' ]

.sub 'IfStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4991
# Body
# {
.annotate 'line', 4993
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4994
self.'parsecondition'(__ARG_2)
.annotate 'line', 4995
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 4996
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4997
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 4998
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5000
new $P6, [  'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5001
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5003

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5004
# Body
# {
.annotate 'line', 5006
self.'optimize_condition'()
.annotate 'line', 5007
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5008
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5009
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5010
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5012
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5014
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5016
.return(self)
# }
.annotate 'line', 5017

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5018
# Body
# {
.annotate 'line', 5020
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5021
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5022
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5023
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5024
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5025
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5026
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5027
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5028
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5029
self.'annotate'(__ARG_1)
.annotate 'line', 5030
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5031
$P1.'emit'(__ARG_1)
.annotate 'line', 5033
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5034
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5035
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5036
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5038
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5039

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IfStatement' ]
get_class $P1, [  'ConditionalStatement' ]
# ConditionalStatement
addparent $P0, $P1
.annotate 'line', 4989
addattribute $P0, 'truebranch'
.annotate 'line', 4990
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5049
# Body
# {
.annotate 'line', 5051
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5052

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5053
# Body
# {
.annotate 'line', 5055
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5056
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5058
self.'annotate'(__ARG_1)
.annotate 'line', 5059
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5060
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5061
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5062
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5063

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'LoopStatement' ]
get_class $P1, [  'Continuable' ]
# Continuable
addparent $P0, $P1
.annotate 'line', 5048
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5072
# Body
# {
.annotate 'line', 5074
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5075
self.'parsecondition'(__ARG_2)
.annotate 'line', 5076
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5077

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5078
# Body
# {
.annotate 'line', 5080
self.'optimize_condition'()
.annotate 'line', 5081
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5082
.return(self)
# }
.annotate 'line', 5083

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5084
# Body
# {
.annotate 'line', 5086
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5088
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5091
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5094
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5095
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5097
self.'annotate'(__ARG_1)
.annotate 'line', 5098
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5099
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5100
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5101
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5102
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5104

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'WhileStatement' ]
get_class $P1, [  'LoopStatement' ]
# LoopStatement
addparent $P0, $P1
get_class $P2, [  'ConditionalStatement' ]
# ConditionalStatement
addparent $P0, $P2
.end
.namespace [ 'DoStatement' ]

.sub 'DoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5113
# Body
# {
.annotate 'line', 5115
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5116
self.'parsebody'(__ARG_2)
.annotate 'line', 5117
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5118
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5119

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5120
# Body
# {
.annotate 'line', 5122
self.'optimize_condition'()
.annotate 'line', 5123
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5124
.return(self)
# }
.annotate 'line', 5125

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5126
# Body
# {
.annotate 'line', 5128
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5130
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5133
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5134
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5135
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5137
self.'annotate'(__ARG_1)
.annotate 'line', 5138
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5140
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5141
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5142
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5144

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'DoStatement' ]
get_class $P1, [  'LoopStatement' ]
# LoopStatement
addparent $P0, $P1
get_class $P2, [  'ConditionalStatement' ]
# ConditionalStatement
addparent $P0, $P2
.end
.namespace [ 'ContinueStatement' ]

.sub 'ContinueStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5153
# Body
# {
.annotate 'line', 5155
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5156
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5157

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5158
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5159
# Body
# {
.annotate 'line', 5161
self.'annotate'(__ARG_1)
.annotate 'line', 5162
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5163
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5164

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ContinueStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5173
# Body
# {
.annotate 'line', 5175
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5176
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5177

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5178
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5179
# Body
# {
.annotate 'line', 5181
self.'annotate'(__ARG_1)
.annotate 'line', 5182
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5183
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5184

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'BreakStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5198
# Body
# {
.annotate 'line', 5200
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5201
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5202
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5203
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5204
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5205
$P1 = __ARG_2.'get'()
.annotate 'line', 5206
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5207
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5208
$P1 = __ARG_2.'get'()
.annotate 'line', 5209
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5210
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5211
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5212
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5213
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5214
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5215
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5216
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5217
$P1 = __ARG_2.'get'()
.annotate 'line', 5218
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5219
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5220
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5221
$P1 = __ARG_2.'get'()
$I4 = $P1.'isop'('}')
if $I4 goto __label_12
$I4 = $P1.'iskeyword'('case')
__label_12:
if $I4 goto __label_11
$I4 = $P1.'iskeyword'('default')
__label_11:
not $I3, $I4
unless $I3 goto __label_9
# {
.annotate 'line', 5222
__ARG_2.'unget'($P1)
.annotate 'line', 5223
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5225
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5226
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5229
$P1 = __ARG_2.'get'()
.annotate 'line', 5230
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5231
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5232
$P1 = __ARG_2.'get'()
$I6 = $P1.'isop'('}')
if $I6 goto __label_17
$I6 = $P1.'iskeyword'('case')
__label_17:
if $I6 goto __label_16
$I6 = $P1.'iskeyword'('default')
__label_16:
not $I5, $I6
unless $I5 goto __label_14
# {
.annotate 'line', 5233
__ARG_2.'unget'($P1)
.annotate 'line', 5234
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5236
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5239

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5240
# Body
# {
.annotate 'line', 5242
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5243
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5244
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5245
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5246
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5247
.return(self)
# }
.annotate 'line', 5248

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5249
# Body
# {
.annotate 'line', 5252
# string type: $S1
set $S1, ''
.annotate 'line', 5253
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5254
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5255
iseq $I3, $S2, 'N'
unless $I3 goto __label_3
.annotate 'line', 5256
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5257
iseq $I3, $S1, ''
unless $I3 goto __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5259
isne $I4, $S1, $S2
unless $I4 goto __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5260
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5263
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5264
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
iseq $I4, $S9, $S1
unless $I4 goto __label_8
.annotate 'line', 5265
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5267
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5268
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5272
self.'genbreaklabel'()
.annotate 'line', 5273
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5274
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5275
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5276
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5277
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5278
$P2.'push'($S7)
.annotate 'line', 5279
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5280
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5282
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5285
__ARG_1.'comment'('switch')
.annotate 'line', 5286
self.'annotate'(__ARG_1)
.annotate 'line', 5287
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5288
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5289
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5290
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5291
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5292
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5293
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5294
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5297
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5298
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5299
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5301
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5302

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'SwitchStatement' ]
get_class $P1, [  'Breakable' ]
# Breakable
addparent $P0, $P1
get_class $P2, [  'Statement' ]
# Statement
addparent $P0, $P2
.annotate 'line', 5193
addattribute $P0, 'condition'
.annotate 'line', 5194
addattribute $P0, 'case_value'
.annotate 'line', 5195
addattribute $P0, 'case_st'
.annotate 'line', 5196
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5315
# Body
# {
.annotate 'line', 5317
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5318
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5319
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5320
__ARG_2.'unget'($P1)
.annotate 'line', 5321
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5323
$P1 = __ARG_2.'get'()
.annotate 'line', 5324
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5325
__ARG_2.'unget'($P1)
.annotate 'line', 5326
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P5
.annotate 'line', 5327
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5329
$P1 = __ARG_2.'get'()
.annotate 'line', 5330
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5331
__ARG_2.'unget'($P1)
.annotate 'line', 5332
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P6
.annotate 'line', 5333
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5335
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5336

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5337
# Body
# {
.annotate 'line', 5339
getattribute $P1, self, 'initializer'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5340
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5341
getattribute $P1, self, 'condition'
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 5342
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
__label_1: # endif
.annotate 'line', 5343
getattribute $P5, self, 'iteration'
isnull $I2, $P5
not $I2
unless $I2 goto __label_2
.annotate 'line', 5344
getattribute $P8, self, 'iteration'
$P7 = $P8.'optimize'()
setattribute self, 'iteration', $P7
__label_2: # endif
.annotate 'line', 5345
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5346
.return(self)
# }
.annotate 'line', 5347

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5348
# Body
# {
.annotate 'line', 5350
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5351
getattribute $P2, self, 'condition'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5352
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5353
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5354
.return()
# }
__label_0: # endif
.annotate 'line', 5356
__ARG_1.'comment'('for loop')
.annotate 'line', 5357
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5358
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5359
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5360
getattribute $P4, self, 'initializer'
isnull $I1, $P4
not $I1
unless $I1 goto __label_6
.annotate 'line', 5361
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5362
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5364
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5365
getattribute $P4, self, 'iteration'
isnull $I2, $P4
not $I2
unless $I2 goto __label_7
.annotate 'line', 5366
# string unused: $S4
getattribute $P6, self, 'iteration'
$P5 = $P6.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
__label_7: # endif
.annotate 'line', 5368
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5369
getattribute $P6, self, 'condition'
isnull $I2, $P6
not $I2
unless $I2 goto __label_9
# {
.annotate 'line', 5370
# string regcond: $S5
getattribute $P8, self, 'condition'
$P7 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P7, __label_10
set $S5, $P7
__label_10:
.annotate 'line', 5371
__ARG_1.'say'('unless ', $S5, ' goto ', $S2, ' # for end')
# }
__label_9: # endif
.annotate 'line', 5374
getattribute $P7, self, 'body'
$P7.'emit'(__ARG_1)
.annotate 'line', 5375
__ARG_1.'emitgoto'($S1, 'for iteration')
.annotate 'line', 5377
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5378

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ForStatement' ]
get_class $P1, [  'LoopStatement' ]
# LoopStatement
addparent $P0, $P1
get_class $P2, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P2
.annotate 'line', 5311
addattribute $P0, 'initializer'
.annotate 'line', 5312
addattribute $P0, 'condition'
.annotate 'line', 5313
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5390
# Body
# {
.annotate 'line', 5392
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5393
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5394
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5395
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5396
isne $I1, $S2, ''
unless $I1 goto __label_2
# {
.annotate 'line', 5397
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5399
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5401
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5402
setattribute self, 'varname', $P1
.annotate 'line', 5403
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5404
$P2 = __ARG_2.'get'()
.annotate 'line', 5405
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5406
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5407
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5408

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5409
# Body
# {
.annotate 'line', 5411
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5412
.return(self)
# }
.annotate 'line', 5413

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5414
# Body
# {
.annotate 'line', 5416
self.'annotate'(__ARG_1)
.annotate 'line', 5417
# string regcont: $S1
null $S1
.annotate 'line', 5418
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
iseq $I1, $S6, 'S'
unless $I1 goto __label_0
# {
.annotate 'line', 5419
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5420
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5421
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5424
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5425
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5426
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5427
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5428
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5429
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5430
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5431
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5432
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5433
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5434
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5435
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5436
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5437

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ForeachStatement' ]
get_class $P1, [  'LoopStatement' ]
# LoopStatement
addparent $P0, $P1
get_class $P2, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P2
.annotate 'line', 5387
addattribute $P0, 'varname'
.annotate 'line', 5388
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5442
# Body
# {
.annotate 'line', 5444
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5445
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5446
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5447
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5448
__ARG_2.'unget'($P3)
.annotate 'line', 5449
__ARG_2.'unget'($P2)
.annotate 'line', 5450
__ARG_2.'unget'($P1)
.annotate 'line', 5451
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5452
new $P5, [  'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5454
new $P7, [  'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5455

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5465
# Body
# {
.annotate 'line', 5467
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5468
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5469

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5470
# Body
# {
.annotate 'line', 5472
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5473
.return(self)
# }
.annotate 'line', 5474

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5475
# Body
# {
.annotate 'line', 5477
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5478
self.'annotate'(__ARG_1)
.annotate 'line', 5479
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5480

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ThrowStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 5463
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5494
# Body
# {
.annotate 'line', 5496
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5497
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5498
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5499
new $P5, [  'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5502
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5504
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5505
$P1 = __ARG_2.'get'()
.annotate 'line', 5506
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5507
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5508
$P1 = __ARG_2.'get'()
.annotate 'line', 5509
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5510
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5511
$P1 = __ARG_2.'get'()
.annotate 'line', 5512
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5513
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5514
setattribute self, 'exname', $P1
.annotate 'line', 5515
self.'createvar'($S1, 'P')
.annotate 'line', 5516
$P1 = __ARG_2.'get'()
.annotate 'line', 5517
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5518
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5520
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5521

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5522
# Body
# {
.annotate 'line', 5524
getattribute $P1, self, 'modifiers'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5525
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5526
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5527
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 5528
.return(self)
# }
.annotate 'line', 5529

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5530
# Body
# {
.annotate 'line', 5532
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5533
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5534
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5535
# string exreg: $S4
null $S4
.annotate 'line', 5536
getattribute $P8, self, 'exname'
isnull $I3, $P8
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 5537
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5538
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5541
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5543
self.'annotate'(__ARG_1)
.annotate 'line', 5544
__ARG_1.'comment'('try: create handler')
.annotate 'line', 5546
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 5547
__ARG_1.'say'('set_addr ', $S1, ', ', $S2)
.annotate 'line', 5549
getattribute $P10, self, 'modifiers'
isnull $I3, $P10
not $I3
unless $I3 goto __label_5
# {
.annotate 'line', 5550
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 5551
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 5552
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 5553
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 5554
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 5557
isne $I4, $I1, 1
unless $I4 goto __label_14
.annotate 'line', 5558
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 5559
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 5560
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 5561
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 5564
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 5565
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5566
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 5567
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5569
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 5570
# string sep: $S7
set $S7, ''
.annotate 'line', 5571
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 5572
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 5573
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 5575
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 5578
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 5583
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 5584
__ARG_1.'comment'('try: begin')
.annotate 'line', 5585
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 5586
__ARG_1.'comment'('try: end')
.annotate 'line', 5588
self.'annotate'(__ARG_1)
.annotate 'line', 5589
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5591
__ARG_1.'comment'('catch')
.annotate 'line', 5592
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5593
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 5594
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 5595
__ARG_1.'say'('pop_eh')
.annotate 'line', 5596
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 5598
__ARG_1.'comment'('catch end')
.annotate 'line', 5599
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 5600

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'TryStatement' ]
get_class $P1, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P1
.annotate 'line', 5489
addattribute $P0, 'stry'
.annotate 'line', 5490
addattribute $P0, 'modifiers'
.annotate 'line', 5491
addattribute $P0, 'exname'
.annotate 'line', 5492
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5611
# Body
# {
.annotate 'line', 5613
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5614
setattribute self, 'name', __ARG_3
.annotate 'line', 5615
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5616
setattribute self, 'reg', $P2
# }
.annotate 'line', 5617

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'VarBaseStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 5609
addattribute $P0, 'name'
.annotate 'line', 5610
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5634
# Body
# {
.annotate 'line', 5636
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5637
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5638
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5639
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5640
setattribute self, 'name', $P1
.annotate 'line', 5641
# string reg: $S1
null $S1
.annotate 'line', 5643
$P1 = __ARG_2.'get'()
.annotate 'line', 5644
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 5646
setattribute self, 'typearray', $P5
.annotate 'line', 5647
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 5648
$P1 = __ARG_2.'get'()
.annotate 'line', 5649
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 5651
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 5654
__ARG_2.'unget'($P1)
.annotate 'line', 5655
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 5656
$P1 = __ARG_2.'get'()
.annotate 'line', 5657
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 5658
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 5659
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 5664
setattribute self, 'typearray', $P8
.annotate 'line', 5665
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 5666
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5668
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 5669
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 5673
setattribute self, 'reg', $P11
.annotate 'line', 5674
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 5676
$P1 = __ARG_2.'get'()
.annotate 'line', 5677
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 5678
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 5679
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 5680
$P1 = __ARG_2.'get'()
.annotate 'line', 5681
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 5682
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 5683
# {
.annotate 'line', 5684
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5685
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 5686
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 5687
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 5688
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 5690
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 5692
$P16 = $P1.'isop'(';')
isfalse $I3, $P16
unless $I3 goto __label_14
.annotate 'line', 5693
'SyntaxError'("Expected ';'", $P1)
__label_14: # endif
# }
.annotate 'line', 5694

.end # parse


.sub 'optimize' :method

.annotate 'line', 5695
# Body
# {
.annotate 'line', 5697
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 5698
getattribute $P2, self, 'size'
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
.annotate 'line', 5699
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 5700
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
# {
.annotate 'line', 5701
getattribute $P2, self, 'typearray'
set $I3, $P2
iseq $I2, $I3, 0
unless $I2 goto __label_2
.annotate 'line', 5702
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 5704
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 5706
.return(self)
# }
.annotate 'line', 5707

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5708
# Body
# {
.annotate 'line', 5710
self.'annotate'(__ARG_1)
.annotate 'line', 5711
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 5712
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5713
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 5714
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 5715
# var init: $P1
getattribute $P1, self, 'init'
concat $S13, $S1, ' '
concat $S12, $S13, $S2
concat $S11, $S12, ': '
concat $S10, $S11, $S3
.annotate 'line', 5716
__ARG_1.'comment'($S10)
.annotate 'line', 5718
getattribute $P6, self, 'typearray'
set $I4, $P6
iseq $I3, $I4, 0
unless $I3 goto __label_4
# {
.annotate 'line', 5719
isnull $I5, $P1
if $I5 goto __label_8
$I5 = $P1.'isnull'()
__label_8:
unless $I5 goto __label_6
.annotate 'line', 5720
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 5722
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 5723
iseq $I3, $S5, $S4
unless $I3 goto __label_10
# {
.annotate 'line', 5724
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 5727
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_12
# {
.annotate 'line', 5729
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 5732
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 5733
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 5734
iseq $I5, $S4, 'S'
unless $I5 goto __label_17
iseq $I5, $S5, 'P'
__label_17:
unless $I5 goto __label_15
# {
.annotate 'line', 5735
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 5736
__ARG_1.'emitnull'($S3)
.annotate 'line', 5737
__ARG_1.'say'('if_null ', $S6, ', ', $S7)
.annotate 'line', 5738
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 5739
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 5742
__ARG_1.'emitset'($S3, $S6)
__label_16: # endif
# }
__label_13: # endif
# }
__label_11: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_4: # else
# {
.annotate 'line', 5748
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 5749
isnull $I6, $P2
not $I6
unless $I6 goto __label_19
# {
.annotate 'line', 5751
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 5752
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 5756
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 5758
isnull $I6, $P1
not $I6
unless $I6 goto __label_22
# {
.annotate 'line', 5759
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 5760
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 5761
isnull $I7, $P2
unless $I7 goto __label_24
# {
.annotate 'line', 5762
isgt $I8, $I1, 0
unless $I8 goto __label_25
# {
.annotate 'line', 5764
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 5767
# int i: $I2
null $I2
.annotate 'line', 5768
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 5769
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 5770
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 5771
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 5775

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5776
# Body
# {
.annotate 'line', 5778
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 5779

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'DeclareStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 5626
addattribute $P0, 'name'
.annotate 'line', 5627
addattribute $P0, 't_reg'
.annotate 'line', 5628
addattribute $P0, 't_name'
.annotate 'line', 5629
addattribute $P0, 't_array'
.annotate 'line', 5630
addattribute $P0, 'reg'
.annotate 'line', 5631
addattribute $P0, 'typearray'
.annotate 'line', 5632
addattribute $P0, 'size'
.annotate 'line', 5633
addattribute $P0, 'init'
.end
.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5792
# Body
# {
.annotate 'line', 5795
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 5796
setattribute self, 'type', $P1
.annotate 'line', 5797
setattribute self, 'name', __ARG_4
.annotate 'line', 5798
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 5799

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 5800
# Body
# {
.annotate 'line', 5802
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5803
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 5804
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5805
$P1 = $P1.'optimize'()
.annotate 'line', 5806
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5808
getattribute $P4, self, 'start'
.annotate 'line', 5807
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 5810
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 5811
setattribute self, 'value', $P1
.annotate 'line', 5812
.return(self)
# }
.annotate 'line', 5813

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 5814
# Body
# {
.annotate 'line', 5816
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 5817

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5818
# Body
# {
.annotate 'line', 5820
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S3, 'Constant ', $S1
concat $S2, $S3, ' evaluated at compile time'
.annotate 'line', 5821
__ARG_1.'comment'($S2)
# }
.annotate 'line', 5822

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ConstStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 5788
addattribute $P0, 'type'
.annotate 'line', 5789
addattribute $P0, 'name'
.annotate 'line', 5790
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5825
# Body
# {
.annotate 'line', 5827
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5828
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 5829
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5830
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 5832
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 5833
# {
.annotate 'line', 5834
$P1 = __ARG_2.'get'()
.annotate 'line', 5835
# var name: $P3
set $P3, $P1
.annotate 'line', 5836
'ExpectOp'('=', __ARG_2)
.annotate 'line', 5837
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 5839
new $P6, [  'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 5838
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 5840
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 5841
.return($P2)
# }
.annotate 'line', 5842

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5851
# Body
# {
.annotate 'line', 5853
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5854
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5855
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5856
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 5857
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 5859
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 5860
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5861

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 5862
# Body
# {
.annotate 'line', 5864
getattribute $P1, self, 'init'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5865
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 5866
.return(self)
# }
.annotate 'line', 5867

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 5868
# Body
# {
.annotate 'line', 5870
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5871

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5872
# Body
# {
.annotate 'line', 5874
self.'annotate'(__ARG_1)
.annotate 'line', 5875
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 5876
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 5877
# var init: $P1
getattribute $P1, self, 'init'
concat $S7, 'var ', $S1
concat $S6, $S7, ': '
concat $S5, $S6, $S2
.annotate 'line', 5878
__ARG_1.'comment'($S5)
.annotate 'line', 5879
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
.annotate 'line', 5880
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 5882
isnull $I1, $P1
not $I1
unless $I1 goto __label_4
# {
.annotate 'line', 5883
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 5884
if $S5 == $S6 goto __label_9
set $S6, 'S'
if $S5 == $S6 goto __label_10
set $S6, 'I'
if $S5 == $S6 goto __label_11
set $S6, 'N'
if $S5 == $S6 goto __label_12
goto __label_8
# switch
__label_9: # case
.annotate 'line', 5886
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 5891
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 5892
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 5893
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 5896
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 5900
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 5901

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'VarStatement' ]
get_class $P1, [  'VarBaseStatement' ]
# VarBaseStatement
addparent $P0, $P1
.annotate 'line', 5850
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5906
# Body
# {
.annotate 'line', 5908
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5909
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5910
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5911
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 5912

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5913
# Body
# {
.annotate 'line', 5915
self.'annotate'(__ARG_1)
.annotate 'line', 5916
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5917
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S5, 'var ', $S1
concat $S4, $S5, '[] : '
concat $S3, $S4, $S2
.annotate 'line', 5918
__ARG_1.'comment'($S3)
.annotate 'line', 5919
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 5920

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ResizableVarStatement' ]
get_class $P1, [  'VarStatement' ]
# VarStatement
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5927
# Body
# {
.annotate 'line', 5929
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5930
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 5931
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5932
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5933
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 5934
$P1 = __ARG_2.'get'()
.annotate 'line', 5935
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 5936
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5937

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 5938
# Body
# {
.annotate 'line', 5940
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 5941
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5942

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5943
# Body
# {
.annotate 'line', 5945
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5946
self.'annotate'(__ARG_1)
.annotate 'line', 5947
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5948
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S6, 'var ', $S2
concat $S5, $S6, '[] : '
concat $S4, $S5, $S3
.annotate 'line', 5949
__ARG_1.'comment'($S4)
.annotate 'line', 5950
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 5951

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'FixedVarStatement' ]
get_class $P1, [  'VarStatement' ]
# VarStatement
addparent $P0, $P1
.annotate 'line', 5925
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5954
# Body
# {
.annotate 'line', 5956
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5957
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5958
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5959
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5960
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 5961
$P2 = __ARG_2.'get'()
.annotate 'line', 5962
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5963
new $P6, [  'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 5965
__ARG_2.'unget'($P2)
.annotate 'line', 5966
new $P5, [  'FixedVarStatement' ]
$P5.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 5970
__ARG_2.'unget'($P2)
.annotate 'line', 5971
new $P7, [  'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 5973

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5981
# Body
# {
box $P1, 'S'
.annotate 'line', 5983
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 5984
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 5985
setattribute self, 't_array', $P2
.annotate 'line', 5986
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5987

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5988
# Body
# {
.annotate 'line', 5990
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 5991

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'StringStatement' ]
get_class $P1, [  'DeclareStatement' ]
# DeclareStatement
addparent $P0, $P1
.end
.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6000
# Body
# {
box $P1, 'I'
.annotate 'line', 6002
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6003
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6004
setattribute self, 't_array', $P2
.annotate 'line', 6005
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6006

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6007
# Body
# {
.annotate 'line', 6009
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6010

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IntStatement' ]
get_class $P1, [  'DeclareStatement' ]
# DeclareStatement
addparent $P0, $P1
.end
.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6019
# Body
# {
box $P1, 'N'
.annotate 'line', 6021
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6022
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6023
setattribute self, 't_array', $P2
.annotate 'line', 6024
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6025

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6026
# Body
# {
.annotate 'line', 6028
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6029

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'FloatStatement' ]
get_class $P1, [  'DeclareStatement' ]
# DeclareStatement
addparent $P0, $P1
.end
.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6043
# Body
# {
.annotate 'line', 6045
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6046
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6047
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6048
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6049
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6050
__ARG_2.'unget'($P1)
.annotate 'line', 6051
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6052
isnull $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6053
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6054
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6056
setattribute self, 'end', $P1
# }
.annotate 'line', 6057

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6058
# Body
# {
.annotate 'line', 6060
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6061
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6062
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6063
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6064
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6065
.return($S2)
# }
.annotate 'line', 6066

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6067
# Body
# {
.annotate 'line', 6069
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6070
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6071
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6072
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6073
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6074
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6075
$P1[$S1] = $S3
.annotate 'line', 6076
.return($S3)
# }
.annotate 'line', 6077

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6078
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6079
# Body
# {
.annotate 'line', 6081
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6082
.return(self)
# }
.annotate 'line', 6083

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6084
# Body
# {
.annotate 'line', 6086
__ARG_1.'comment'('{')
.annotate 'line', 6087
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6088
$P1.'emit'(__ARG_1)
.annotate 'line', 6089
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6091
__ARG_1.'comment'('}')
# }
.annotate 'line', 6092

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'CompoundStatement' ]
get_class $P1, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P1
.annotate 'line', 6038
addattribute $P0, 'statements'
.annotate 'line', 6039
addattribute $P0, 'end'
.annotate 'line', 6040
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6105
# Body
# {
box $P3, 1
.annotate 'line', 6108
setattribute self, 'nreg', $P3
.annotate 'line', 6109
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6110
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6111
setattribute self, 'tempreg', $P1
.annotate 'line', 6112
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6113

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6114
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6116
setattribute self, 'type', $P1
.annotate 'line', 6117
.return(self)
# }
.annotate 'line', 6118

.end # settype


.sub 'createreg' :method

.annotate 'line', 6119
# Body
# {
.annotate 'line', 6121
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6122
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6123
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6125
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S3, '$', $S2
concat $S1, $S3, $S1
.annotate 'line', 6127
.return($S1)
# }
.annotate 'line', 6128

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6129
# Body
# {
.annotate 'line', 6131
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6132
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6133
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6134
# string reg: $S1
null $S1
.annotate 'line', 6135
isgt $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 6136
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6138
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6139
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6141
.return($S1)
# }
.annotate 'line', 6142

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6143
# Body
# {
.annotate 'line', 6145
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6146
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6147
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6148
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6149

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'RegisterStore' ]
.annotate 'line', 6101
addattribute $P0, 'type'
.annotate 'line', 6102
addattribute $P0, 'nreg'
.annotate 'line', 6103
addattribute $P0, 'tempreg'
.annotate 'line', 6104
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6168
# Body
# {
.annotate 'line', 6170
new $P3, [  'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6171
new $P3, [  'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6172
new $P6, [  'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6173
new $P6, [  'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6174
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6175

.end # init


.sub 'ismethod' :method

.annotate 'line', 6176
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6177
# Body
# {
.annotate 'line', 6179
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6180
if $S2 == $S3 goto __label_2
set $S3, 'N'
if $S2 == $S3 goto __label_3
set $S3, 'S'
if $S2 == $S3 goto __label_4
set $S3, 'P'
if $S2 == $S3 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6182
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6184
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6186
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6188
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6190
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6192
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6193
.return($S1)
# }
.annotate 'line', 6194

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6195
# Body
# {
.annotate 'line', 6197
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6198
if $S2 == $S3 goto __label_2
set $S3, 'N'
if $S2 == $S3 goto __label_3
set $S3, 'S'
if $S2 == $S3 goto __label_4
set $S3, 'P'
if $S2 == $S3 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6200
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6202
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6204
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6206
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6208
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6210
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6211
.return($S1)
# }
.annotate 'line', 6212

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6213
# Body
# {
.annotate 'line', 6215
root_new $P2, ['parrot';'ResizablePMCArray']
getattribute $P4, self, 'regstI'
$P2.'push'($P4)
getattribute $P5, self, 'regstN'
$P2.'push'($P5)
getattribute $P6, self, 'regstS'
$P2.'push'($P6)
getattribute $P7, self, 'regstP'
$P2.'push'($P7)
iter $P8, $P2
set $P8, 0
__label_0: # for iteration
unless $P8 goto __label_1
shift $P1, $P8
.annotate 'line', 6216
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6217

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6218
# Body
# {
.annotate 'line', 6220
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6221
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6222
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6224
.return($S1)
# }
.annotate 'line', 6225

.end # genlabel


.sub 'optimize' :method

.annotate 'line', 6227
# Body
# {
.annotate 'line', 6229
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6230
.return(self)
# }
.annotate 'line', 6231

.end # optimize


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6233
# Body
# {
.annotate 'line', 6235
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6236
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6237
setattribute self, 'name', $P1
.annotate 'line', 6238
$P1 = __ARG_2.'get'()
.annotate 'line', 6239
$P5 = $P1.'isop'('[')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6240
# var modifiers: $P2
new $P6, [  'ModifierList' ]
$P6.'ModifierList'(__ARG_2, self)
set $P2, $P6
.annotate 'line', 6241
setattribute self, 'modifiers', $P2
.annotate 'line', 6242
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6244
$P7 = $P1.'isop'('(')
isfalse $I2, $P7
unless $I2 goto __label_1
.annotate 'line', 6245
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6246
root_new $P8, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P8
.annotate 'line', 6247
$P1 = __ARG_2.'get'()
.annotate 'line', 6248
$P8 = $P1.'isop'(')')
isfalse $I2, $P8
unless $I2 goto __label_2
# {
.annotate 'line', 6249
__ARG_2.'unget'($P1)
.annotate 'line', 6250
# int argnum: $I1
null $I1
__label_3: # do
.annotate 'line', 6251
# {
.annotate 'line', 6252
$P1 = __ARG_2.'get'()
.annotate 'line', 6253
# string type: $S1
$P10 = $P1.'checkkeyword'()
$P9 = 'typetoregcheck'($P10)
null $S1
if_null $P9, __label_6
set $S1, $P9
__label_6:
.annotate 'line', 6254
isne $I3, $S1, ''
unless $I3 goto __label_7
.annotate 'line', 6255
$P1 = __ARG_2.'get'()
goto __label_8
__label_7: # else
set $S1, 'P'
__label_8: # endif
.annotate 'line', 6258
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S2, '__ARG_', $S4
.annotate 'line', 6259
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6261
# string varname: $S3
set $P10, $P1
null $S3
if_null $P10, __label_9
set $S3, $P10
__label_9:
.annotate 'line', 6262
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 6263
$P3['name'] = $S3
.annotate 'line', 6264
$P1 = __ARG_2.'get'()
.annotate 'line', 6265
$P11 = $P1.'isop'('[')
if_null $P11, __label_10
unless $P11 goto __label_10
# {
.annotate 'line', 6266
# var modifiers: $P4
new $P12, [  'ModifierList' ]
$P12.'ModifierList'(__ARG_2, self)
set $P4, $P12
.annotate 'line', 6267
$P3['modifiers'] = $P4
.annotate 'line', 6268
$P1 = __ARG_2.'get'()
# }
__label_10: # endif
.annotate 'line', 6270
getattribute $P11, self, 'args'
$P11.'push'($P3)
# }
.annotate 'line', 6271
$P12 = $P1.'isop'(',')
if_null $P12, __label_4
if $P12 goto __label_3
__label_4: # enddo
.annotate 'line', 6272
$P13 = $P1.'isop'(')')
isfalse $I3, $P13
unless $I3 goto __label_11
.annotate 'line', 6273
'SyntaxError'("Expected ')'", $P1)
__label_11: # endif
# }
__label_2: # endif
.annotate 'line', 6276
$P1 = __ARG_2.'get'()
.annotate 'line', 6277
$P13 = $P1.'isop'('{')
isfalse $I4, $P13
unless $I4 goto __label_12
.annotate 'line', 6278
'Expected'('{', $P1)
__label_12: # endif
.annotate 'line', 6279
new $P16, [  'CompoundStatement' ]
$P16.'CompoundStatement'($P1, __ARG_2, self)
set $P15, $P16
setattribute self, 'body', $P15
.annotate 'line', 6280
.return(self)
# }
.annotate 'line', 6281

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6282
# Body
# {
.annotate 'line', 6284
# string name: $S1
getattribute $P13, self, 'name'
null $S1
if_null $P13, __label_0
set $S1, $P13
__label_0:
.annotate 'line', 6285
__ARG_1.'say'()
.annotate 'line', 6286
__ARG_1.'print'(".sub '", $S1, "'")
.annotate 'line', 6287
$P13 = self.'ismethod'()
if_null $P13, __label_1
unless $P13 goto __label_1
.annotate 'line', 6288
__ARG_1.'print'(' :method')
__label_1: # endif
.annotate 'line', 6289
# var modifiers: $P1
getattribute $P1, self, 'modifiers'
.annotate 'line', 6290
isnull $I2, $P1
not $I2
unless $I2 goto __label_2
# {
.annotate 'line', 6291
# var mlist: $P2
$P2 = $P1.'getlist'()
.annotate 'line', 6292
iter $P14, $P2
set $P14, 0
__label_4: # for iteration
unless $P14 goto __label_5
shift $P3, $P14
.annotate 'line', 6293
$P15 = $P3.'getname'()
__ARG_1.'print'(' :', $P15)
goto __label_4
__label_5: # endfor
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 6296
iseq $I2, $S1, 'main'
unless $I2 goto __label_6
.annotate 'line', 6297
__ARG_1.'print'(' :main')
__label_6: # endif
# }
__label_3: # endif
.annotate 'line', 6299
__ARG_1.'say'()
.annotate 'line', 6300
# var args: $P4
getattribute $P4, self, 'args'
.annotate 'line', 6301
# var arg: $P5
null $P5
.annotate 'line', 6302
# string argname: $S2
null $S2
.annotate 'line', 6303
# var a: $P6
null $P6
.annotate 'line', 6304
iter $P16, $P4
set $P16, 0
__label_7: # for iteration
unless $P16 goto __label_8
shift $P5, $P16
# {
.annotate 'line', 6305
$S2 = $P5['name']
.annotate 'line', 6306
$P6 = self.'getvar'($S2)
.annotate 'line', 6307
# string ptype: $S3
$P17 = $P6['type']
$P15 = 'typetopirname'($P17)
null $S3
if_null $P15, __label_9
set $S3, $P15
__label_9:
$P17 = $P6['reg']
.annotate 'line', 6308
__ARG_1.'print'('.param ', $S3, ' ', $P17)
.annotate 'line', 6309
# var modarg: $P7
$P7 = $P5['modifiers']
.annotate 'line', 6310
isnull $I3, $P7
not $I3
unless $I3 goto __label_10
# {
.annotate 'line', 6311
# var named: $P8
null $P8
.annotate 'line', 6312
# var slurpy: $P9
null $P9
.annotate 'line', 6313
# var modarglist: $P10
$P10 = $P7.'getlist'()
.annotate 'line', 6314
iter $P18, $P10
set $P18, 0
__label_11: # for iteration
unless $P18 goto __label_12
shift $P11, $P18
# {
.annotate 'line', 6315
# string modname: $S4
$P19 = $P11.'getname'()
null $S4
if_null $P19, __label_13
set $S4, $P19
__label_13:
set $S6, $S4
set $S7, 'named'
.annotate 'line', 6316
if $S6 == $S7 goto __label_16
set $S7, 'slurpy'
if $S6 == $S7 goto __label_17
goto __label_15
# switch
__label_16: # case
set $P8, $P11
goto __label_14 # break
__label_17: # case
set $P9, $P11
goto __label_14 # break
__label_15: # default
.annotate 'line', 6324
__ARG_1.'print'(' :', $S4)
__label_14: # switch end
# }
goto __label_11
__label_12: # endfor
.annotate 'line', 6327
isnull $I3, $P8
not $I3
unless $I3 goto __label_20
isnull $I3, $P9
not $I3
__label_20:
unless $I3 goto __label_18
# {
.annotate 'line', 6332
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_19
__label_18: # else
# {
.annotate 'line', 6335
isnull $I4, $P8
not $I4
unless $I4 goto __label_21
# {
.annotate 'line', 6336
# string setname: $S5
null $S5
.annotate 'line', 6337
# int nargs: $I1
$P19 = $P8.'numargs'()
set $I1, $P19
set $I4, $I1
null $I5
.annotate 'line', 6338
if $I4 == $I5 goto __label_25
set $I5, 1
if $I4 == $I5 goto __label_26
goto __label_24
# switch
__label_25: # case
concat $S6, "'", $S2
concat $S5, $S6, "'"
goto __label_23 # break
__label_26: # case
.annotate 'line', 6343
# var argmod: $P12
$P12 = $P8.'getarg'(0)
.annotate 'line', 6344
$P20 = $P12.'isstringliteral'()
isfalse $I6, $P20
unless $I6 goto __label_27
.annotate 'line', 6345
getattribute $P21, self, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_27: # endif
.annotate 'line', 6346
$P22 = $P12.'getPirString'()
set $S5, $P22
goto __label_23 # break
__label_24: # default
.annotate 'line', 6349
getattribute $P23, self, 'start'
'SyntaxError'('Invalid modifier', $P23)
__label_23: # switch end
.annotate 'line', 6351
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_22
__label_21: # else
.annotate 'line', 6353
isnull $I5, $P9
not $I5
unless $I5 goto __label_28
# {
.annotate 'line', 6354
__ARG_1.'print'(" :slurpy")
# }
__label_28: # endif
__label_22: # endif
# }
__label_19: # endif
# }
__label_10: # endif
.annotate 'line', 6358
__ARG_1.'say'('')
# }
goto __label_7
__label_8: # endfor
.annotate 'line', 6360
__ARG_1.'say'()
.annotate 'line', 6361
getattribute $P20, self, 'name'
__ARG_1.'annotate'($P20)
.annotate 'line', 6362
__ARG_1.'comment'('Body')
.annotate 'line', 6363
getattribute $P21, self, 'body'
$P21.'emit'(__ARG_1)
.annotate 'line', 6365
getattribute $P23, self, 'body'
$P22 = $P23.'getend'()
__ARG_1.'annotate'($P22)
.annotate 'line', 6366
__ARG_1.'say'("\n.end # ", $S1, "\n")
# }
.annotate 'line', 6367

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6368
# Body
# {
.annotate 'line', 6370
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6371

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6372
# Body
# {
.annotate 'line', 6374
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6375

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'FunctionStatement' ]
get_class $P1, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P1
.annotate 'line', 6158
addattribute $P0, 'name'
.annotate 'line', 6159
addattribute $P0, 'modifiers'
.annotate 'line', 6160
addattribute $P0, 'args'
.annotate 'line', 6161
addattribute $P0, 'body'
.annotate 'line', 6162
addattribute $P0, 'regstI'
.annotate 'line', 6163
addattribute $P0, 'regstN'
.annotate 'line', 6164
addattribute $P0, 'regstS'
.annotate 'line', 6165
addattribute $P0, 'regstP'
.annotate 'line', 6166
addattribute $P0, 'nlabel'
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 6384
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'MethodStatement' ]
get_class $P1, [  'FunctionStatement' ]
# FunctionStatement
addparent $P0, $P1
.end
.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6402
# Body
# {
.annotate 'line', 6404
setattribute self, 'parent', __ARG_2
.annotate 'line', 6405
setattribute self, 'owner', __ARG_2
.annotate 'line', 6406
root_new $P11, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P11
.annotate 'line', 6407
root_new $P11, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P11
.annotate 'line', 6408
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P14
.annotate 'line', 6409
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P14
.annotate 'line', 6411
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6412
setattribute self, 'name', $P1
.annotate 'line', 6413
$P1 = __ARG_1.'get'()
.annotate 'line', 6414
$P16 = $P1.'isop'(':')
if_null $P16, __label_0
unless $P16 goto __label_0
# {
.annotate 'line', 6415
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 6416
# {
.annotate 'line', 6417
$P1 = __ARG_1.'get'()
.annotate 'line', 6418
$P2.'push'($P1)
.annotate 'line', 6419
$P1 = __ARG_1.'get'()
.annotate 'line', 6420
$P17 = $P1.'isop'(',')
isfalse $I1, $P17
unless $I1 goto __label_3
goto __label_1 # break
__label_3: # endif
# }
goto __label_2
__label_1: # Infinite loop end
# }
__label_0: # endif
.annotate 'line', 6423
$P17 = $P1.'isop'('{')
isfalse $I1, $P17
unless $I1 goto __label_4
.annotate 'line', 6424
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 6425
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 6426
$P18 = $P1.'isop'('}')
isfalse $I2, $P18
unless $I2 goto __label_5
# {
.annotate 'line', 6427
$P19 = $P1.'iskeyword'('function')
if_null $P19, __label_7
unless $P19 goto __label_7
# {
.annotate 'line', 6428
# var f: $P3
new $P20, [  'MethodStatement' ]
$P3 = $P20.'parse'($P1, __ARG_1, self)
.annotate 'line', 6429
# var functions: $P4
getattribute $P4, self, 'functions'
.annotate 'line', 6430
$P4.'push'($P3)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6432
$P18 = $P1.'iskeyword'('var')
if_null $P18, __label_9
unless $P18 goto __label_9
# {
.annotate 'line', 6433
# var name: $P5
$P5 = __ARG_1.'get'()
.annotate 'line', 6434
$P19 = $P5.'isidentifier'()
isfalse $I2, $P19
unless $I2 goto __label_11
.annotate 'line', 6435
'SyntaxError'("Expected member identifier", $P5)
__label_11: # endif
.annotate 'line', 6436
getattribute $P20, self, 'members'
$P20.'push'($P5)
.annotate 'line', 6437
$P1 = __ARG_1.'get'()
.annotate 'line', 6438
$P21 = $P1.'isop'(';')
isfalse $I3, $P21
unless $I3 goto __label_12
.annotate 'line', 6439
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 6441
$P21 = $P1.'iskeyword'('const')
if_null $P21, __label_13
unless $P21 goto __label_13
# {
.annotate 'line', 6442
# var cst: $P6
$P6 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6443
# var constants: $P7
getattribute $P7, self, 'constants'
.annotate 'line', 6444
$P7.'push'($P6)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6447
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 6448
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 6450
# var classns: $P8
getattribute $P22, self, 'parent'
$P8 = $P22.'getpath'()
.annotate 'line', 6451
getattribute $P22, self, 'name'
$P8.'push'($P22)
.annotate 'line', 6452
setattribute self, 'classns', $P8
# }
.annotate 'line', 6453

.end # ClassStatement


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6454
# Body
# {
.annotate 'line', 6456
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 6457

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6458
# Body
# {
.annotate 'line', 6460
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6461

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 6462
# Body
# {
.annotate 'line', 6464
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 6465
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 6466
.return(self)
# }
.annotate 'line', 6467

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 6468
# Body
# {
.annotate 'line', 6470
getattribute $P1, self, 'classns'
.tailcall 'getkey'($P1)
# }
.annotate 'line', 6471

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6472
# Body
# {
.annotate 'line', 6474
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 6475
$P6 = 'namespacekey'($P1)
__ARG_1.'say'($P6)
.annotate 'line', 6476
getattribute $P6, self, 'functions'
iter $P7, $P6
set $P7, 0
__label_0: # for iteration
unless $P7 goto __label_1
shift $P2, $P7
.annotate 'line', 6477
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6479
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 6482
$P8 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P8)
.annotate 'line', 6483
# int n: $I1
set $I1, 1
.annotate 'line', 6484
getattribute $P8, self, 'bases'
iter $P9, $P8
set $P9, 0
__label_2: # for iteration
unless $P9 goto __label_3
shift $P3, $P9
# {
.annotate 'line', 6485
# string reg: $S1
set $I2, $I1
inc $I1
$S3 = $I2
concat $S1, "$P", $S3
.annotate 'line', 6486
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 6487
$P10 = $P3.'isstring'()
if_null $P10, __label_4
unless $P10 goto __label_4
.annotate 'line', 6488
__ARG_1.'say'($P3)
goto __label_5
__label_4: # else
# {
.annotate 'line', 6490
# string name: $S2
set $P11, $P3
null $S2
if_null $P11, __label_6
set $S2, $P11
__label_6:
.annotate 'line', 6491
# var cl: $P4
$P4 = self.'checkclass'($S2)
.annotate 'line', 6492
isnull $I2, $P4
unless $I2 goto __label_7
.annotate 'line', 6493
'InternalError'('No such class')
__label_7: # endif
.annotate 'line', 6495
$P10 = $P4.'getclasskey'()
__ARG_1.'say'($P10)
# }
__label_5: # endif
.annotate 'line', 6497
__ARG_1.'comment'($P3)
.annotate 'line', 6498
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 6500
getattribute $P11, self, 'members'
iter $P12, $P11
set $P12, 0
__label_8: # for iteration
unless $P12 goto __label_9
shift $P5, $P12
# {
.annotate 'line', 6501
__ARG_1.'annotate'($P5)
.annotate 'line', 6502
__ARG_1.'say'("addattribute $P0, '", $P5, "'")
# }
goto __label_8
__label_9: # endfor
.annotate 'line', 6505
__ARG_1.'say'('.end')
# }
.annotate 'line', 6506

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ClassStatement' ]
get_class $P1, [  'VarContainer' ]
# VarContainer
addparent $P0, $P1
.annotate 'line', 6393
addattribute $P0, 'parent'
.annotate 'line', 6394
addattribute $P0, 'owner'
.annotate 'line', 6395
addattribute $P0, 'name'
.annotate 'line', 6396
addattribute $P0, 'bases'
.annotate 'line', 6397
addattribute $P0, 'constants'
.annotate 'line', 6398
addattribute $P0, 'functions'
.annotate 'line', 6399
addattribute $P0, 'members'
.annotate 'line', 6400
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6513
# Body
# {
.annotate 'line', 6515
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6516
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 6517
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 6518
'ExpectOp'(';', __ARG_2)
.annotate 'line', 6519
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 6520
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 6525
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 6526
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 6527
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 6528
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 6529
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 6530
# try: create handler
new $P11, 'ExceptionHandler'
set_addr $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 6531
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 6532
# }
# try: end
goto __label_5
.annotate 'line', 6530
# catch
__label_4:
.get_results($P12)
finalize $P12
pop_eh
# {
# }
# catch end
__label_5:
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 6537
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 6538
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 6543
load_bytecode 'PGE.pbc'
.annotate 'line', 6544
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 6545
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 6547
# string line: $S4
$P12 = $P5.'readline'()
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
goto __label_9
__label_7: # for iteration
$P13 = $P5.'readline'()
set $S4, $P13
__label_9: # for condition
$P14 = $P5.'eof'()
isfalse $I2, $P14
unless $I2 goto __label_8 # for end
# {
.annotate 'line', 6548
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6549
$P8 = $P7($S4)
.annotate 'line', 6550
# predefined elements
elements $I4, $P8
isgt $I3, $I4, 0
unless $I3 goto __label_11
# {
.annotate 'line', 6551
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 6552
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 6553
# int ivalue: $I1
null $I1
.annotate 'line', 6554
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6555
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 6560
$P16 = 'newTokenFrom'(5, $S5, __ARG_1)
.annotate 'line', 6559
$P15 = 'integerValue'(__ARG_3, $P16, $I1)
.annotate 'line', 6558
__ARG_3.'createconst'($S5, 'I', $P15, '')
# }
__label_11: # endif
# }
goto __label_7 # for iteration
__label_8: # for end
.annotate 'line', 6564
$P5.'close'()
# }
.annotate 'line', 6565

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 6577
# Body
# {
.annotate 'line', 6579
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 6580
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 6581
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 6582
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 6583

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 6584
# Body
# {
.annotate 'line', 6586
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 6587
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 6588
getattribute $P4, $P2, 'name'
$S1 = $P4
iseq $I1, $S1, __ARG_1
unless $I1 goto __label_2
.annotate 'line', 6589
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 6590
.return($P4)
# }
.annotate 'line', 6591

.end # checkclass_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 6592
# Body
# {
.annotate 'line', 6594
# string namespace: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6595
# int balance1: $I1
null $I1
.annotate 'line', 6596
# int balance2: $I2
null $I2
.annotate 'line', 6597
# int balance3: $I3
null $I3
.annotate 'line', 6598
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6599
$P2 = __ARG_1.'get'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6601
$P11 = $P2.'iskeyword'('namespace')
if_null $P11, __label_2
unless $P11 goto __label_2
# {
.annotate 'line', 6603
# var start: $P3
set $P3, $P2
.annotate 'line', 6604
$P2 = __ARG_1.'get'()
.annotate 'line', 6605
# string name: $S1
set $P11, $P2
null $S1
if_null $P11, __label_4
set $S1, $P11
__label_4:
.annotate 'line', 6606
$P1.'push'($S1)
.annotate 'line', 6607
$P2 = __ARG_1.'get'()
.annotate 'line', 6609
# var modifier: $P4
null $P4
.annotate 'line', 6610
$P12 = $P2.'isop'('[')
if_null $P12, __label_5
unless $P12 goto __label_5
# {
.annotate 'line', 6611
new $P13, [  'ModifierList' ]
$P13.'ModifierList'(__ARG_1, self)
set $P4, $P13
.annotate 'line', 6612
$P2 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 6615
$P12 = $P2.'isop'('{')
isfalse $I5, $P12
unless $I5 goto __label_6
.annotate 'line', 6616
'Expected'('{', $P2)
__label_6: # endif
.annotate 'line', 6617
# var child: $P5
new $P13, [  'NamespaceStatement' ]
$P13.'NamespaceStatement'(self, $P3, $S1, $P4)
set $P5, $P13
.annotate 'line', 6618
getattribute $P14, self, 'namespaces'
$P14.'push'($P5)
.annotate 'line', 6619
getattribute $P14, self, 'items'
$P14.'push'($P5)
.annotate 'line', 6620
$P5.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 6622
$P15 = $P2.'iskeyword'('const')
if_null $P15, __label_7
unless $P15 goto __label_7
# {
.annotate 'line', 6623
# var cst: $P6
$P6 = 'parseConst'($P2, __ARG_1, self)
.annotate 'line', 6624
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6626
$P16 = $P2.'iskeyword'('function')
if_null $P16, __label_9
unless $P16 goto __label_9
# {
.annotate 'line', 6627
# var f: $P7
new $P17, [  'FunctionStatement' ]
$P7 = $P17.'parse'($P2, __ARG_1, self)
.annotate 'line', 6628
# var functions: $P8
getattribute $P8, self, 'functions'
.annotate 'line', 6629
$P8.'push'($P7)
.annotate 'line', 6630
getattribute $P16, self, 'items'
$P16.'push'($P7)
# }
goto __label_10
__label_9: # else
.annotate 'line', 6632
$P17 = $P2.'iskeyword'('class')
if_null $P17, __label_11
unless $P17 goto __label_11
# {
.annotate 'line', 6633
# var c: $P9
new $P18, [  'ClassStatement' ]
$P18.'ClassStatement'(__ARG_1, self)
set $P9, $P18
.annotate 'line', 6634
# var classes: $P10
getattribute $P10, self, 'classes'
.annotate 'line', 6635
$P10.'push'($P9)
.annotate 'line', 6636
getattribute $P18, self, 'items'
$P18.'push'($P9)
# }
goto __label_12
__label_11: # else
.annotate 'line', 6638
$P19 = $P2.'iskeyword'('using')
if_null $P19, __label_13
unless $P19 goto __label_13
# {
.annotate 'line', 6639
$P2 = __ARG_1.'get'()
.annotate 'line', 6640
$P19 = $P2.'iskeyword'('extern')
isfalse $I5, $P19
unless $I5 goto __label_15
.annotate 'line', 6641
'SyntaxError'('Unsupported at nmaespace level', $P2)
__label_15: # endif
.annotate 'line', 6642
$P2 = __ARG_1.'get'()
.annotate 'line', 6643
$P20 = $P2.'isstring'()
isfalse $I6, $P20
unless $I6 goto __label_16
.annotate 'line', 6644
'Expected'('string literal', $P2)
__label_16: # endif
.annotate 'line', 6645
# string reqlib: $S2
set $P20, $P2
null $S2
if_null $P20, __label_17
set $S2, $P20
__label_17:
.annotate 'line', 6646
self.'addlib'($S2)
.annotate 'line', 6647
$P2 = __ARG_1.'get'()
.annotate 'line', 6648
'RequireOp'(';', $P2)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6650
$P21 = $P2.'iskeyword'('$include_const')
if_null $P21, __label_18
unless $P21 goto __label_18
# {
.annotate 'line', 6651
'include_parrot'($P2, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6653
$P21 = $P2.'isop'('}')
if_null $P21, __label_20
unless $P21 goto __label_20
# {
.annotate 'line', 6654
# int n: $I4
set $P22, $P1
set $I4, $P22
.annotate 'line', 6655
islt $I6, $I4, 1
unless $I6 goto __label_22
# {
.annotate 'line', 6656
getattribute $P22, self, 'parent'
isnull $I7, $P22
not $I7
unless $I7 goto __label_23
.return()
__label_23: # endif
.annotate 'line', 6657
# string line: $S3
getattribute $P23, $P2, 'line'
null $S3
if_null $P23, __label_24
set $S3, $P23
__label_24:
.annotate 'line', 6658
'SyntaxError'('Unclosed namespace', $P2)
# }
__label_22: # endif
.annotate 'line', 6660
$P1.'pop'()
# }
goto __label_21
__label_20: # else
.annotate 'line', 6663
'SyntaxError'("Unexpected token", $P2)
__label_21: # endif
__label_19: # endif
__label_14: # endif
__label_12: # endif
__label_10: # endif
__label_8: # endif
__label_3: # endif
# }
goto __label_1
__label_0: # endwhile
# }
.annotate 'line', 6665

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 6666
# Body
# {
.annotate 'line', 6668
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 6669

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 6670
# Body
# {
.annotate 'line', 6672
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 6673
# string s: $S1
$P3 = 'namespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6675
# int activate: $I1
set $I1, 1
.annotate 'line', 6676
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 6677
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 6678
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 6681
unless $I1 goto __label_6
# {
.annotate 'line', 6682
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 6683
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 6685
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 6687

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NamespaceBase' ]
get_class $P1, [  'VarContainer' ]
# VarContainer
addparent $P0, $P1
.annotate 'line', 6571
addattribute $P0, 'namespaces'
.annotate 'line', 6572
addattribute $P0, 'classes'
.annotate 'line', 6573
addattribute $P0, 'functions'
.annotate 'line', 6574
addattribute $P0, 'items'
.annotate 'line', 6575
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 6701
# Body
# {
.annotate 'line', 6704
setattribute self, 'parent', __ARG_1
.annotate 'line', 6705
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 6706
setattribute self, 'name', $P2
.annotate 'line', 6707
setattribute self, 'modifier', __ARG_4
.annotate 'line', 6708
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 6709
$P3 = __ARG_4.'pick'('HLL')
isnull $I2, $P3
not $I2
unless $I2 goto __label_1
.annotate 'line', 6710
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6712

.end # NamespaceStatement


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6713
# Body
# {
.annotate 'line', 6715
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6716

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 6717
# Body
# {
.annotate 'line', 6719
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 6720
getattribute $P2, self, 'hll'
isnull $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6721
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 6722
.return($P1)
# }
.annotate 'line', 6723

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6724
# Body
# {
.annotate 'line', 6726
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 6727

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6728
# Body
# {
.annotate 'line', 6730
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 6731
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6732
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 6734
.return($P1)
__label_1: # endif
# }
.annotate 'line', 6735

.end # checkclass


.sub 'optimize' :method

.annotate 'line', 6736
# Body
# {
.annotate 'line', 6738
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 6739
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 6740
$P1 = $P1.'optimize'()
.annotate 'line', 6741
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 6743
self.'optimize_base'()
.annotate 'line', 6744
.return(self)
# }
.annotate 'line', 6745

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6746
# Body
# {
.annotate 'line', 6748
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 6749
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 6750
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 6752
self.'emit_base'(__ARG_1)
.annotate 'line', 6754
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 6755
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 6756

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NamespaceStatement' ]
get_class $P1, [  'NamespaceBase' ]
# NamespaceBase
addparent $P0, $P1
.annotate 'line', 6696
addattribute $P0, 'parent'
.annotate 'line', 6697
addattribute $P0, 'name'
.annotate 'line', 6698
addattribute $P0, 'modifier'
.annotate 'line', 6699
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 6768
# Body
# {
.annotate 'line', 6770
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
# }
.annotate 'line', 6771

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6772
# Body
# {
.annotate 'line', 6774
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 6775
$P1[__ARG_1] = 1
# }
.annotate 'line', 6776

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 6777
# Body
# {
.annotate 'line', 6779
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 6780
isnull $I2, $P2
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 6781

.end # predef_is_used


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6783
# Body
# {
.annotate 'line', 6785
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 6786
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6787
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6788
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 6790
$P1[__ARG_1] = 1
# }
.annotate 'line', 6791

.end # addlib


.sub 'getpath' :method

.annotate 'line', 6792
# Body
# {
.annotate 'line', 6794
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6795
.return($P1)
# }
.annotate 'line', 6796

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6797
# Body
# {
.annotate 'line', 6799
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 6800

.end # checkclass


.sub 'optimize' :method

.annotate 'line', 6801
# Body
# {
.annotate 'line', 6803
self.'optimize_base'()
.annotate 'line', 6804
.return(self)
# }
.annotate 'line', 6805

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6806
# Body
# {
.annotate 'line', 6808
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 6809
# int somelib: $I1
null $I1
.annotate 'line', 6810
$P4 = $P1['chomp']
isnull $I3, $P4
not $I3
unless $I3 goto __label_0
# {
set $I1, 1
.annotate 'line', 6812
__ARG_1.'say'(".sub 'initialize' :load :init :anon\n  load_bytecode 'String/Utils.pbc'\n.end\n")
# }
__label_0: # endif
.annotate 'line', 6818
# int trans: $I2
null $I2
.annotate 'line', 6819
# string trfuncs: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
set $P2, 9
set $S3, 'acos'
$P2[0] = $S3
set $S3, 'asin'
$P2[1] = $S3
set $S3, 'atan'
$P2[2] = $S3
set $S3, 'cos'
$P2[3] = $S3
set $S3, 'exp'
$P2[4] = $S3
set $S3, 'ln'
$P2[5] = $S3
set $S3, 'sin'
$P2[6] = $S3
set $S3, 'tan'
$P2[7] = $S3
set $S3, 'pow'
$P2[8] = $S3
.annotate 'line', 6822
iter $P5, $P2
set $P5, 0
__label_1: # for iteration
unless $P5 goto __label_2
shift $S1, $P5
.annotate 'line', 6823
$P4 = $P1[$S1]
isnull $I3, $P4
not $I3
unless $I3 goto __label_3
set $I2, 1
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 6825
unless $I2 goto __label_4
# {
set $I1, 1
.annotate 'line', 6827
__ARG_1.'say'(".loadlib 'trans_ops'")
# }
__label_4: # endif
.annotate 'line', 6830
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 6831
isnull $I4, $P3
not $I4
unless $I4 goto __label_5
# {
set $I1, 1
.annotate 'line', 6833
iter $P6, $P3
set $P6, 0
__label_6: # for iteration
unless $P6 goto __label_7
shift $S2, $P6
.annotate 'line', 6834
__ARG_1.'say'('.loadlib ', $S2)
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6836
unless $I1 goto __label_8
.annotate 'line', 6837
__ARG_1.'comment'('end libs')
__label_8: # endif
.annotate 'line', 6838
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 6839

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'RootNamespace' ]
get_class $P1, [  'NamespaceBase' ]
# NamespaceBase
addparent $P0, $P1
.annotate 'line', 6765
addattribute $P0, 'predefs_used'
.annotate 'line', 6766
addattribute $P0, 'libs'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 6851
# Body
# {
.annotate 'line', 6853
# var rootns: $P1
new $P1, [  'RootNamespace' ]
.annotate 'line', 6856
# var taux: $P2
$P2 = 'newToken'(4, 'predefconst', 0, '__predefconst__')
.annotate 'line', 6860
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 6859
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 6858
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 6864
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 6863
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 6862
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 6870
new $P6, [  'StringLiteral' ]
# predefined int
.annotate 'line', 6871
$I2 = "2"
add $I1, $I2, 1
# predefined string
$S1 = $I1
$P7 = 'newTokenFrom'(2, $S1, $P2)
$P6.'StringLiteral'($P1, $P7)
set $P5, $P6
.annotate 'line', 6869
$P1.'createconst'('__STAGE__', 'S', $P5, '')
.annotate 'line', 6874
setattribute self, 'rootns', $P1
# }
.annotate 'line', 6875

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 6876
# Body
# {
.annotate 'line', 6878
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 6879

.end # parse


.sub 'optimize' :method

.annotate 'line', 6880
# Body
# {
.annotate 'line', 6882
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 6883

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6884
# Body
# {
.annotate 'line', 6886
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 6887
__ARG_1.'say'('')
.annotate 'line', 6889
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 6891
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 6892

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'WinxedCompiler' ]
.annotate 'line', 6850
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 6899
# Body
# {
.annotate 'line', 6901
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 6903
$P1.'open'('__eval__', 'w')
.annotate 'line', 6904
$P1.'puts'(__ARG_1)
.annotate 'line', 6905
$P1.'close'()
.annotate 'line', 6906
$P1.'open'('__eval__', 'r')
.annotate 'line', 6907
# var tk: $P2
new $P8, [  'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 6908
# var winxed: $P3
new $P3, [  'WinxedCompiler' ]
.annotate 'line', 6909
$P3.'parse'($P2)
.annotate 'line', 6910
$P1.'close'()
.annotate 'line', 6911
$P3.'optimize'()
.annotate 'line', 6912
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 6913
$P4.'open'('__eval__', 'w')
.annotate 'line', 6914
# var emit: $P5
new $P5, [  'Emit' ]
.annotate 'line', 6915
$P5.'initialize'($P4)
.annotate 'line', 6916
$P3.'emit'($P5)
.annotate 'line', 6917
$P5.'close'()
.annotate 'line', 6918
$P4.'close'()
.annotate 'line', 6919
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 6920
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 6921
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 6922
.return($P7)
# }
.annotate 'line', 6923

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 6924
# Body
# {
.annotate 'line', 6926
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 6927
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 6928
$P1.'encoding'('utf8')
.annotate 'line', 6929
# var tk: $P2
new $P5, [  'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 6930
# var winxed: $P3
new $P3, [  'WinxedCompiler' ]
.annotate 'line', 6931
$P3.'parse'($P2)
.annotate 'line', 6932
$P1.'close'()
.annotate 'line', 6933
$P3.'optimize'()
.annotate 'line', 6934
# var emit: $P4
new $P4, [  'Emit' ]
.annotate 'line', 6935
$P4.'initialize'(__ARG_2)
.annotate 'line', 6936
$P3.'emit'($P4)
.annotate 'line', 6937
$P4.'close'()
# }
.annotate 'line', 6938

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 6939
# Body
# {
.annotate 'line', 6941
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 6942
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 6943
$P1.'encoding'('utf8')
.annotate 'line', 6944
# var tk: $P2
new $P8, [  'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 6945
# var winxed: $P3
new $P3, [  'WinxedCompiler' ]
.annotate 'line', 6946
$P3.'parse'($P2)
.annotate 'line', 6947
$P1.'close'()
.annotate 'line', 6948
$P3.'optimize'()
.annotate 'line', 6949
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 6950
$P4.'open'('__eval__', 'w')
.annotate 'line', 6951
# var emit: $P5
new $P5, [  'Emit' ]
.annotate 'line', 6952
$P5.'initialize'($P4)
.annotate 'line', 6953
$P3.'emit'($P5)
.annotate 'line', 6954
$P5.'close'()
.annotate 'line', 6955
$P4.'close'()
.annotate 'line', 6956
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 6957
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 6958
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 6959
.return($P7)
# }
.annotate 'line', 6960

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 6965
# Body
# {
.annotate 'line', 6967
# var winxed: $P1
new $P1, [  'WinxedCompiler' ]
.annotate 'line', 6968
$P1.'parse'(__ARG_1)
.annotate 'line', 6970
$P1.'optimize'()
.annotate 'line', 6972
# var handle: $P2
null $P2
.annotate 'line', 6973
iseq $I1, __ARG_2, '-'
unless $I1 goto __label_0
.annotate 'line', 6974
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 6976
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 6977
# var emit: $P3
new $P3, [  'Emit' ]
.annotate 'line', 6978
$P3.'initialize'($P2)
.annotate 'line', 6979
$P1.'emit'($P3)
.annotate 'line', 6980
$P3.'close'()
.annotate 'line', 6981
$P2.'close'()
# }
.annotate 'line', 6982

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 6988
# Body
# {
.annotate 'line', 6990
# var comp: $P1
new $P1, [  'WinxedHLL' ]
# predefined compreg
.annotate 'line', 6991
compreg 'winxed', $P1
# }
.annotate 'line', 6992

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 6994
# Body
# {
.annotate 'line', 6996
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 6997
# var getopts: $P1
new $P1, ['Getopt';'Obj']
.annotate 'line', 6998
$P1.'notOptStop'(1)
.annotate 'line', 6999
$P1.'push_string'('o=s')
.annotate 'line', 7000
$P1.'push_string'('e=s')
.annotate 'line', 7001
$P1.'push_string'('c')
.annotate 'line', 7002
$P1.'push_string'('noan')
.annotate 'line', 7004
__ARG_1.'shift'()
.annotate 'line', 7005
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7006
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7007
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7008
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7009
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7011
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7012
# string filename: $S1
null $S1
.annotate 'line', 7013
# string expr: $S2
null $S2
.annotate 'line', 7014
# var file: $P7
null $P7
.annotate 'line', 7015
isnull $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 7016
iseq $I3, $I1, 0
unless $I3 goto __label_2
# predefined Error
.annotate 'line', 7017
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7019
$S1 = __ARG_1[0]
.annotate 'line', 7020
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7021
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S4, 'function main[main](argv){', $S2
concat $S2, $S4, ';}'
.annotate 'line', 7026
new $P7, [ 'StringHandle' ]
.annotate 'line', 7027
$P7.'open'('__eval__', 'w')
.annotate 'line', 7028
$P7.'puts'($S2)
.annotate 'line', 7029
$P7.'close'()
.annotate 'line', 7030
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7033
# var t: $P8
new $P10, [  'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7035
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7036
isnull $I2, $P3
not $I2
unless $I2 goto __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7038
'winxed_parser'($P8, $S3)
.annotate 'line', 7040
$P7.'close'()
# }
.annotate 'line', 7041

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7043
# Body
# {
.annotate 'line', 7045
# try: create handler
new $P6, 'ExceptionHandler'
set_addr $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7051
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7045
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7054
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7055
print 'Error: '
say $S1
.annotate 'line', 7056
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7057
# int i: $I1
set $I1, 1
.annotate 'line', 7058
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7059
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7060
# string subname: $S2
null $S2
.annotate 'line', 7061
isnull $I3, $P4
not $I3
unless $I3 goto __label_4
# {
set $S2, $P4
.annotate 'line', 7063
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7064
isne $I3, $S3, ''
unless $I3 goto __label_7
isne $I3, $S3, 'parrot'
__label_7:
unless $I3 goto __label_6
concat $S5, $S3, '.'
concat $S2, $S5, $S2
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 7066
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7067
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7068
isne $I4, $S4, ''
unless $I4 goto __label_8
# {
.annotate 'line', 7069
# int line: $I2
$I2 = $P5['line']
set $I5, $I1
.annotate 'line', 7070
inc $I1
mul $I4, 2, $I5
repeat $S5, ' ', $I4
# predefined say
print $S5
print "at "
print $S2
print " in '"
print $S4
print "' line "
say $I2
# }
__label_8: # endif
# }
goto __label_2
__label_3: # endfor
# }
# catch end
__label_1:
# }
.annotate 'line', 7074

.end # main

# End generated code
