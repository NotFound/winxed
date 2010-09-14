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
newclass $P0, [ 'Token' ]
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
new $P1, [ 'Token' ]
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
new $P1, [ 'Token' ]
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
new $P2, [ 'Token' ]
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
newclass $P0, [ 'Tokenizer' ]
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
newclass $P0, [ 'Emit' ]
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
new $P2, [ 'IntegerLiteral' ]
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
new $P3, [ 'FloatLiteral' ]
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
newclass $P0, [ 'PredefFunction' ]
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
newclass $P0, [ 'Predef_say' ]
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
newclass $P0, [ 'Predef_cry' ]
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
newclass $P0, [ 'Predef_print' ]
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
new $P5, [ 'StringLiteral' ]
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
new $P1, [ 'Predef_say' ]
.annotate 'line', 955
# var predef_cry: $P2
new $P2, [ 'Predef_cry' ]
.annotate 'line', 956
# var predef_print: $P3
new $P3, [ 'Predef_print' ]
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
new $P13, [ 'PredefFunction' ]
$P12 = $P13.'set'('int', '{res} = {arg0}', 'I', '?')
.annotate 'line', 964
$P10.'push'($P12)
.annotate 'line', 969
new $P15, [ 'PredefFunction' ]
$P14 = $P15.'set'('float', '{res} = {arg0}', 'N', '?')
.annotate 'line', 964
$P10.'push'($P14)
.annotate 'line', 973
new $P17, [ 'PredefFunction' ]
$P16 = $P17.'set'('string', '{res} = {arg0}', 'S', '?')
.annotate 'line', 964
$P10.'push'($P16)
.annotate 'line', 977
new $P19, [ 'PredefFunction' ]
$P18 = $P19.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 964
$P10.'push'($P18)
.annotate 'line', 981
new $P21, [ 'PredefFunction' ]
$P20 = $P21.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 964
$P10.'push'($P20)
.annotate 'line', 985
new $P23, [ 'PredefFunction' ]
$P22 = $P23.'set'('time', 'time {res}', 'I')
.annotate 'line', 964
$P10.'push'($P22)
.annotate 'line', 989
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 964
$P10.'push'($P24)
.annotate 'line', 993
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 964
$P10.'push'($P26)
.annotate 'line', 997
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 964
$P10.'push'($P28)
.annotate 'line', 1002
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P30)
.annotate 'line', 1007
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 964
$P10.'push'($P32)
.annotate 'line', 1012
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 964
$P10.'push'($P34)
.annotate 'line', 1018
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 964
$P10.'push'($P36)
.annotate 'line', 1025
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 964
$P10.'push'($P38)
.annotate 'line', 1029
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set_eval'('length', $P5, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 964
$P10.'push'($P40)
.annotate 'line', 1034
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set_eval'('bytelength', $P6, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 964
$P10.'push'($P42)
.annotate 'line', 1039
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set_eval'('chr', $P7, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 964
$P10.'push'($P44)
.annotate 'line', 1046
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set_eval'('ord', $P8, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 964
$P10.'push'($P46)
.annotate 'line', 1051
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set_eval'('ord', $P9, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 964
$P10.'push'($P48)
.annotate 'line', 1056
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 964
$P10.'push'($P50)
.annotate 'line', 1060
new $P53, [ 'PredefFunction' ]
$P52 = $P53.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 964
$P10.'push'($P52)
.annotate 'line', 1064
new $P55, [ 'PredefFunction' ]
$P54 = $P55.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P54)
.annotate 'line', 1068
new $P57, [ 'PredefFunction' ]
$P56 = $P57.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 964
$P10.'push'($P56)
.annotate 'line', 1072
new $P59, [ 'PredefFunction' ]
$P58 = $P59.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 964
$P10.'push'($P58)
.annotate 'line', 1076
new $P61, [ 'PredefFunction' ]
$P60 = $P61.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P60)
.annotate 'line', 1080
new $P63, [ 'PredefFunction' ]
$P62 = $P63.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P62)
.annotate 'line', 1084
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P64)
.annotate 'line', 1088
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P66)
.annotate 'line', 1092
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 964
$P10.'push'($P68)
.annotate 'line', 1097
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P70)
.annotate 'line', 1102
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P72)
.annotate 'line', 1106
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P74)
.annotate 'line', 1110
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P76)
.annotate 'line', 1114
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P78)
.annotate 'line', 1118
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P80)
.annotate 'line', 1122
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P82)
.annotate 'line', 1126
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P84)
.annotate 'line', 1130
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P86)
.annotate 'line', 1134
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P88)
.annotate 'line', 1138
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P90)
.annotate 'line', 1142
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 964
$P10.'push'($P92)
.annotate 'line', 1146
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 964
$P10.'push'($P94)
.annotate 'line', 1150
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P96)
.annotate 'line', 1154
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P98)
.annotate 'line', 1158
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P100)
.annotate 'line', 1162
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 964
$P10.'push'($P102)
.annotate 'line', 1166
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 964
$P10.'push'($P104)
.annotate 'line', 1170
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P106)
.annotate 'line', 1174
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 964
$P10.'push'($P108)
.annotate 'line', 1178
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 964
$P10.'push'($P110)
.annotate 'line', 1183
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P112)
.annotate 'line', 1188
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 964
$P10.'push'($P114)
.annotate 'line', 1192
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 964
$P10.'push'($P116)
.annotate 'line', 1196
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 964
$P10.'push'($P118)
.annotate 'line', 1200
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 964
$P10.'push'($P120)
.annotate 'line', 1204
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 964
$P10.'push'($P122)
.annotate 'line', 1208
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('print', $P3, 'P', '*')
.annotate 'line', 964
$P10.'push'($P124)
.annotate 'line', 1212
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('say', $P1, 'P', '*')
.annotate 'line', 964
$P10.'push'($P126)
.annotate 'line', 1216
new $P129, [ 'PredefFunction' ]
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


.sub 'createsubid' :method

.annotate 'line', 1269
# Body
# {
.annotate 'line', 1271
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 1272

.end # createsubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1273
# Body
# {
.annotate 'line', 1275
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1276

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1277
# Body
# {
.annotate 'line', 1279
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1280

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1253
addattribute $P0, 'start'
.annotate 'line', 1254
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1293
# Body
# {
.annotate 'line', 1295
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1296

.end # init


.sub 'numargs' :method

.annotate 'line', 1298
# Body
# {
.annotate 'line', 1300
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1301

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1302
# Body
# {
.annotate 'line', 1304
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1305
.return($P2)
# }
.annotate 'line', 1306

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1308
# Body
# {
.annotate 'line', 1310
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1311
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1312
# {
.annotate 'line', 1313
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1314
$P1.'push'($P3)
# }
.annotate 'line', 1315
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1316
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1317

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1319
# Body
# {
.annotate 'line', 1321
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1322
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 1323
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1324

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1325
# Body
# {
.annotate 'line', 1327
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1328
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1329
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1330
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 1331
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1332
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1333
$P2.'push'($S1)
# }
goto __label_0 # for iteration
__label_1: # for end
.annotate 'line', 1335
.return($P2)
# }
.annotate 'line', 1336

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1337
# Body
# {
.annotate 'line', 1339
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1340
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1341

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1291
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1353
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1354
# Body
# {
.annotate 'line', 1356
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1357
.return($I1)
# }
.annotate 'line', 1358

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1359
# Body
# {
.annotate 'line', 1361
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1362
$P2 = $P1.'numargs'()
set $I2, $P2
islt $I1, __ARG_1, $I2
unless $I1 goto __label_0
.annotate 'line', 1363
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1365
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1366

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1367
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1369
setattribute self, 'name', $P1
.annotate 'line', 1370
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
.annotate 'line', 1371
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1372

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1373
# Body
# {
.annotate 'line', 1375
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1376

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1350
addattribute $P0, 'name'
.annotate 'line', 1351
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1383
# Body
# {
.annotate 'line', 1385
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1386
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1387
# {
.annotate 'line', 1388
$P2 = __ARG_1.'get'()
.annotate 'line', 1389
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1390
$P2 = __ARG_1.'get'()
.annotate 'line', 1391
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1392
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1393
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1394
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1396
new $P7, [ 'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1397
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1398
'RequireOp'(']', $P2)
.annotate 'line', 1399
setattribute self, 'list', $P1
# }
.annotate 'line', 1400

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1401
# Body
# {
.annotate 'line', 1403
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1404
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1405

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1406
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1407
# Body
# {
.annotate 'line', 1409
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1410
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1411
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 1412
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1413
$P3 = $P2.'getname'()
$S1 = $P3
iseq $I3, $S1, __ARG_1
unless $I3 goto __label_3
# {
.annotate 'line', 1414
.return($P2)
# }
__label_3: # endif
# }
goto __label_0 # for iteration
__label_1: # for end
null $P3
.annotate 'line', 1417
.return($P3)
# }
.annotate 'line', 1418

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1381
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1425
# Body
# {
.annotate 'line', 1427
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S3, "[ '", $S1
concat $S2, $S3, "' ]"
.annotate 'line', 1428
.return($S2)
# }
.annotate 'line', 1429

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1431
# Body
# {
.annotate 'line', 1433
# predefined elements
elements $I2, __ARG_1
iseq $I1, $I2, 0
unless $I1 goto __label_0
.annotate 'line', 1434
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1436
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S3, ".namespace [ '", $S1
concat $S2, $S3, "' ]"
.annotate 'line', 1437
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1439

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1441
# Body
# {
.annotate 'line', 1443
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1444
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1445
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1446
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1447
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1449
__ARG_2.'unget'($P1)
.annotate 'line', 1450
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1452

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1454
# Body
# {
.annotate 'line', 1456
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1457
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1458
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1459
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1460
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1461
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1462
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1464
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1465
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1466
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
.annotate 'line', 1468
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1470
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1473
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1475
new $P9, [ 'StringStatement' ]
$P9.'StringStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_10: # case
.annotate 'line', 1477
new $P11, [ 'IntStatement' ]
$P11.'IntStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_11: # case
.annotate 'line', 1479
new $P13, [ 'FloatStatement' ]
$P13.'FloatStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_12: # case
.annotate 'line', 1481
new $P15, [ 'ReturnStatement' ]
$P15.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_13: # case
.annotate 'line', 1483
new $P17, [ 'YieldStatement' ]
$P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_14: # case
.annotate 'line', 1485
new $P19, [ 'GotoStatement' ]
$P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_15: # case
.annotate 'line', 1487
new $P21, [ 'IfStatement' ]
$P21.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_16: # case
.annotate 'line', 1489
new $P23, [ 'WhileStatement' ]
$P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_17: # case
.annotate 'line', 1491
new $P25, [ 'DoStatement' ]
$P25.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_18: # case
.annotate 'line', 1493
new $P27, [ 'ContinueStatement' ]
$P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_19: # case
.annotate 'line', 1495
new $P29, [ 'BreakStatement' ]
$P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_20: # case
.annotate 'line', 1497
new $P31, [ 'SwitchStatement' ]
$P31.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P30, $P31
.return($P30)
__label_21: # case
.annotate 'line', 1499
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1501
new $P33, [ 'ThrowStatement' ]
$P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P32, $P33
.return($P32)
__label_23: # case
.annotate 'line', 1503
new $P35, [ 'TryStatement' ]
$P35.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P34, $P35
.return($P34)
__label_5: # default
.annotate 'line', 1505
$P36 = $P1.'isidentifier'()
if_null $P36, __label_24
unless $P36 goto __label_24
# {
.annotate 'line', 1506
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1507
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1508
new $P10, [ 'LabelStatement' ]
.tailcall $P10.'set'($P1, __ARG_2)
__label_25: # endif
.annotate 'line', 1509
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1511
__ARG_1.'unget'($P1)
.annotate 'line', 1512
new $P12, [ 'ExprStatement' ]
$P12.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P11, $P12
.return($P11)
__label_4: # switch end
.annotate 'line', 1514
isnull $I1, $P2
unless $I1 goto __label_26
.annotate 'line', 1515
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1516
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1517

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1525
# Body
# {
.annotate 'line', 1527
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1528

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1529
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1530
# Body
# {
.annotate 'line', 1532
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1533

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1534
# Body
# {
.annotate 'line', 1536
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1537

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1538
# Body
# {
.annotate 'line', 1540
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1541

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1542
# Body
# {
.annotate 'line', 1544
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1545

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1546
# Body
# {
.annotate 'line', 1548
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1549

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1550
# Body
# {
.annotate 'line', 1552
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1553

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1554
# Body
# {
.annotate 'line', 1556
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1557

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1558
# Body
# {
.annotate 'line', 1560
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1561

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1562
# Body
# {
.annotate 'line', 1564
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1565

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1566
# Body
# {
.annotate 'line', 1568
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1569

.end # checkclass


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1570
# Body
# {
.annotate 'line', 1572
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1573

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1574
# Body
# {
.annotate 'line', 1576
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1577

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1578
# Body
# {
.annotate 'line', 1580
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1582
.return(self)
# }
.annotate 'line', 1583

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1523
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1588
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1589
# Body
# {
.annotate 'line', 1591
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1592

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1593
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1594
# Body
# {
# }
.annotate 'line', 1597

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1586
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1604
# Body
# {
.annotate 'line', 1606
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1607
$P1.'push'(__ARG_1)
.annotate 'line', 1608
$P1.'push'(__ARG_2)
.annotate 'line', 1609
setattribute self, 'statements', $P1
# }
.annotate 'line', 1610

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1611
# Body
# {
.annotate 'line', 1613
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1614
.return(self)
# }
.annotate 'line', 1615

.end # push


.sub 'optimize' :method

.annotate 'line', 1616
# Body
# {
.annotate 'line', 1618
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1619
.return(self)
# }
.annotate 'line', 1620

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1621
# Body
# {
.annotate 'line', 1623
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1624
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1625

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1602
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1628
# Body
# {
.annotate 'line', 1630
isnull $I1, __ARG_1
unless $I1 goto __label_0
.annotate 'line', 1631
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1632
isa $I2, __ARG_1, 'MultiStatement'
unless $I2 goto __label_2
.annotate 'line', 1633
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1635
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1636

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1646
# Body
# {
.annotate 'line', 1648
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1649
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1650
# int dotted: $I1
null $I1
.annotate 'line', 1651
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1653
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1655
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1656
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S2, $S3, $S1
box $P3, $S2
setattribute self, 'opname', $P3
.annotate 'line', 1657
$P1 = __ARG_2.'get'()
.annotate 'line', 1658
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1659
__ARG_2.'unget'($P1)
.annotate 'line', 1660
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1662
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1663

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1664
# Body
# {
.annotate 'line', 1666
self.'optimizeargs'()
.annotate 'line', 1667
.return(self)
# }
.annotate 'line', 1668

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1669
# Body
# {
.annotate 'line', 1671
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1672
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1673
__ARG_1.'comment'($S2)
.annotate 'line', 1674
$P1 = self.'numargs'()
set $I2, $P1
iseq $I1, $I2, 0
unless $I1 goto __label_1
.annotate 'line', 1675
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1677
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1678
self.'emitargs'(__ARG_1)
.annotate 'line', 1679
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1681

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1642
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1644
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1691
# Body
# {
.annotate 'line', 1693
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1694
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1695
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1696
# {
.annotate 'line', 1697
$P2 = __ARG_2.'get'()
.annotate 'line', 1698
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1699
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1700
'RequireOp'(';', $P2)
.annotate 'line', 1701
setattribute self, 'path', $P1
.annotate 'line', 1702
.return(self)
# }
.annotate 'line', 1703

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1704
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1705
# Body
# {
.annotate 'line', 1707
self.'annotate'(__ARG_1)
.annotate 'line', 1708
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1709

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1688
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1690
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
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1716
get_class $P1, [ 'Statement' ]
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
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1771

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1739
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1741
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1781
# Body
# {
.annotate 'line', 1783
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1784
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1785
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1786

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1787
# Body
# {
.annotate 'line', 1789
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1790
.return(self)
# }
.annotate 'line', 1791

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1792
# Body
# {
.annotate 'line', 1794
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1795

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1778
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1780
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1805
# Body
# {
.annotate 'line', 1807
setattribute self, 'name', __ARG_1
.annotate 'line', 1808
.return(self)
# }
.annotate 'line', 1809

.end # set


.sub 'get_string' :method :vtable

.annotate 'line', 1810
# Body
# {
# predefined Error
.annotate 'line', 1812
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1813

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1804
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1820
# Body
# {
.annotate 'line', 1822
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1823

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1824
# Body
# {
.annotate 'line', 1826
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1827
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1828
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1829
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S4, "Redeclared '", $S1
concat $S3, $S4, "'"
.annotate 'line', 1830
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1831
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1832
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1836
.return($S2)
# }
.annotate 'line', 1837

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1838
# Body
# {
.annotate 'line', 1840
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1841
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1842
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1843
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1844
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1845
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1849

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1850
# Body
# {
.annotate 'line', 1852
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1853
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1854
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1855
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1856
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1857
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1860
new $P5, [ 'ConstantInternalFail' ]
$P4 = $P5.'set'(__ARG_1)
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1862
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1863
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1864
$P1[$S1] = $P3
# }
.annotate 'line', 1865

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1866
# Body
# {
.annotate 'line', 1868
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1869
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1870
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1871
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1872
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1873
.return($P2)
# }
.annotate 'line', 1874

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1819
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 1883
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 1893
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 1894
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 1895
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 1896
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 1897
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 1898
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 1899
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 1900
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1901
# Body
# {
.annotate 'line', 1903
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 1904

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 1905
# Body
# {
.annotate 'line', 1907
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1908

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 1909
# Body
# {
.annotate 'line', 1912
.return(self)
# }
.annotate 'line', 1913

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 1914
# Body
# {
.annotate 'line', 1916
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1917
# string reg: $S2
iseq $I1, $S1, 'v'
unless $I1 goto __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 1918
self.'emit'(__ARG_1, $S2)
.annotate 'line', 1919
.return($S2)
# }
.annotate 'line', 1920

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1921
# Body
# {
.annotate 'line', 1923
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 1924

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 1891
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 1929
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 1927
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1937
# Body
# {
.annotate 'line', 1939
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 1940
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1941
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 1942
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 1943
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 1944

.end # FunctionExpr


.sub 'checkResult' :method

.annotate 'line', 1945
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 1946
# Body
# {
.annotate 'line', 1948
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 1949
.return(self)
# }
.annotate 'line', 1950

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1951
# Body
# {
.annotate 'line', 1953
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 1954
# string reg: $S1
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
set $P2, __ARG_2
goto __label_0
__label_1:
$P2 = self.'tempreg'('P')
__label_0:
null $S1
if_null $P2, __label_2
set $S1, $P2
__label_2:
.annotate 'line', 1955
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
# }
.annotate 'line', 1956

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 1934
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 1936
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1971
# Body
# {
.annotate 'line', 1973
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 1974
.return(self)
# }
.annotate 'line', 1975

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 1976
# Body
# {
.annotate 'line', 1978
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 1979

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 1980
# Body
# {
.annotate 'line', 1982
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 1983
.return(self)
# }
.annotate 'line', 1984

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 1985
# Body
# {
.annotate 'line', 1987
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1988
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 1989
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1991
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 1992
iseq $I2, $I1, 0
unless $I2 goto __label_4
.annotate 'line', 1993
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 1995
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 1998
.return(0)
# }
.annotate 'line', 1999

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2000
# Body
# {
.annotate 'line', 2002
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2003
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2004
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2005
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
.annotate 'line', 2008
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_3)
__label_6: # case
__label_7: # case
.annotate 'line', 2011
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2014
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2016

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2017
# Body
# {
.annotate 'line', 2019
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2020
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2021
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2022
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
.annotate 'line', 2025
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_2)
__label_6: # case
__label_7: # case
.annotate 'line', 2028
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2031
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2033

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 1970
addattribute $P0, 'condexpr'
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2041
# Body
# {
.annotate 'line', 2043
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2044
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2045

.end # StringLiteral


.sub 'isliteral' :method

.annotate 'line', 2046
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isstringliteral' :method

.annotate 'line', 2047
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2048
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2049
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getPirString' :method

.annotate 'line', 2050
# Body
# {
.annotate 'line', 2052
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2053
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2054
# int type: $I1
getattribute $P2, $P1, 'type'
set $I1, $P2
.annotate 'line', 2055
# int need_unicode: $I2
null $I2
box $P3, $S1
.annotate 'line', 2056
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $I3, $P4
# {
.annotate 'line', 2057
isgt $I7, $I3, 127
unless $I7 goto __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2059
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2062
unless $I2 goto __label_4
# {
.annotate 'line', 2063
iseq $I7, $I1, 3
unless $I7 goto __label_5
# {
set $I1, 2
.annotate 'line', 2065
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P3, $S2
.annotate 'line', 2067
iter $P5, $P3
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2068
iseq $I8, $S3, '\'
unless $I8 goto __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2070
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2073
# string result: $S4
set $S4, ''
.annotate 'line', 2074
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2075
# int i: $I5
null $I5
goto __label_11
__label_9: # for iteration
inc $I5
__label_11: # for condition
islt $I8, $I5, $I4
unless $I8 goto __label_10 # for end
# {
.annotate 'line', 2076
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2077
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2078
isgt $I9, $I6, 127
unless $I9 goto __label_12
# {
.annotate 'line', 2079
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
.annotate 'line', 2080
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2083
# }
goto __label_9 # for iteration
__label_10: # for end
set $S1, $S4
.annotate 'line', 2085
# }
__label_4: # endif
.annotate 'line', 2087
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
.annotate 'line', 2089
unless $I2 goto __label_17
concat $S1, 'unicode:', $S1
__label_17: # endif
.annotate 'line', 2091
.return($S1)
# }
.annotate 'line', 2092

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2093
# Body
# {
.annotate 'line', 2095
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2096
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2097
getattribute $P3, $P1, 'type'
set $I2, $P3
iseq $I1, $I2, 2
unless $I1 goto __label_1
# {
.annotate 'line', 2098
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2099
$P4 = $P2.'unescape'('utf8')
set $S1, $P4
# }
__label_1: # endif
.annotate 'line', 2101
.return($S1)
# }
.annotate 'line', 2102

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2103
# Body
# {
.annotate 'line', 2105
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2106

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2107
# Body
# {
.annotate 'line', 2109
.tailcall self.'getPirString'()
# }
.annotate 'line', 2110

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2038
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2040
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2119
# Body
# {
.annotate 'line', 2122
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2123
setattribute self, 'pos', __ARG_2
.annotate 'line', 2124
# int n: $I1
null $I1
.annotate 'line', 2125
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2126
# {
.annotate 'line', 2128
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2129
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2131
setattribute self, 'numval', $P2
# }
.annotate 'line', 2132

.end # IntegerLiteral


.sub 'isliteral' :method

.annotate 'line', 2133
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2134
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2135
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2136
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getIntegerValue' :method

.annotate 'line', 2137
# Body
# {
.annotate 'line', 2139
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2140
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2141
.return($I1)
# }
.annotate 'line', 2142

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2143
# Body
# {
.annotate 'line', 2145
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2146
iseq $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 2147
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2149
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2150

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2151
# Body
# {
.annotate 'line', 2153
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2154

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2115
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2117
addattribute $P0, 'pos'
.annotate 'line', 2118
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2162
# Body
# {
.annotate 'line', 2164
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2165
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2166

.end # FloatLiteral


.sub 'isliteral' :method

.annotate 'line', 2167
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2168
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2169
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2170
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getFloatValue' :method

.annotate 'line', 2171
# Body
# {
.annotate 'line', 2173
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2174
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2176
.return($P1)
# }
.annotate 'line', 2177

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2178
# Body
# {
.annotate 'line', 2180
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2181
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2182

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2183
# Body
# {
.annotate 'line', 2187
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2188
# predefined indexof
index $I2, $S1, '.'
islt $I1, $I2, 0
unless $I1 goto __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2190
.return($S1)
# }
.annotate 'line', 2191

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2159
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2161
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2199
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2200
# Body
# {
.annotate 'line', 2202
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2203
setattribute self, 'name', __ARG_2
.annotate 'line', 2204
.return(self)
# }
.annotate 'line', 2205

.end # set


.sub 'isnull' :method

.annotate 'line', 2206
# Body
# {
.annotate 'line', 2208
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2209

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2210
# Body
# {
.annotate 'line', 2212
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2213
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
$P2 = $P1['type']
.annotate 'line', 2214
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2216
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
.annotate 'line', 2219
.return('P')
__label_3: # default
.annotate 'line', 2221
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2224

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2225
# Body
# {
.annotate 'line', 2227
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2228
.return($S1)
# }
.annotate 'line', 2229

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2230
# Body
# {
.annotate 'line', 2232
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2233
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 2234
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2235
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2236
# string s: $S1
null $S1
.annotate 'line', 2237
isnull $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 2238
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2239
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
.annotate 'line', 2245
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2249
$P4 = $P2['id']
isnull $I2, $P4
not $I2
unless $I2 goto __label_8
$P5 = $P2['id']
.annotate 'line', 2250
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2252
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2254
.return($S1)
# }
.annotate 'line', 2255

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2256
# Body
# {
.annotate 'line', 2258
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2259
$S2 = $P1
iseq $I1, $S2, ''
unless $I1 goto __label_0
# {
.annotate 'line', 2260
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S3, "Variable '", $S1
concat $S2, $S3, "' is not defined"
.annotate 'line', 2261
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2263
.return($P1)
# }
.annotate 'line', 2264

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2265
# Body
# {
.annotate 'line', 2267
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2268
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2269
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 2270
$I2 = $P2['const']
unless $I2 goto __label_2
$P3 = $P2['id']
isnull $I2, $P3
__label_2:
unless $I2 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2271
.return($P4)
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2273
.return(self)
# }
.annotate 'line', 2274

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2275
# Body
# {
.annotate 'line', 2277
self.'annotate'(__ARG_1)
.annotate 'line', 2278
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2279

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2280
# Body
# {
.annotate 'line', 2282
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2283

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2284
# Body
# {
.annotate 'line', 2286
self.'annotate'(__ARG_1)
.annotate 'line', 2287
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2288
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2289
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2290
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2293
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2296
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2299
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2300
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2302
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2303
iseq $I1, $S1, $S3
unless $I1 goto __label_11
# {
.annotate 'line', 2304
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2307
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2308
self.'annotate'(__ARG_1)
.annotate 'line', 2309
iseq $I2, $S1, 'P'
unless $I2 goto __label_16
isne $I2, $S3, 'P'
__label_16:
unless $I2 goto __label_14
.annotate 'line', 2310
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2312
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2315
.return($S2)
# }
.annotate 'line', 2316

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2196
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2198
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2323
# Body
# {
.annotate 'line', 2325
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2326

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2321
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2334
# Body
# {
.annotate 'line', 2336
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2337
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2338

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2339
# Body
# {
.annotate 'line', 2341
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2342

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2343
# Body
# {
.annotate 'line', 2345
self.'optimizearg'()
.annotate 'line', 2346
.return(self)
# }
.annotate 'line', 2347

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2331
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2333
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2356
# Body
# {
.annotate 'line', 2358
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2359
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2360
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2361

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2362
# Body
# {
.annotate 'line', 2364
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2365
.return(self)
# }
.annotate 'line', 2366

.end # set


.sub 'optimizearg' :method

.annotate 'line', 2367
# Body
# {
.annotate 'line', 2369
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2370
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2371

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2372
# Body
# {
.annotate 'line', 2374
self.'optimizearg'()
.annotate 'line', 2375
.return(self)
# }
.annotate 'line', 2376

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2352
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2354
addattribute $P0, 'lexpr'
.annotate 'line', 2355
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2383
# Body
# {
.annotate 'line', 2385
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2386

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2387
# Body
# {
.annotate 'line', 2389
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2390
.return(self)
# }
.annotate 'line', 2391

.end # set


.sub 'optimize' :method

.annotate 'line', 2392
# Body
# {
.annotate 'line', 2394
self.'optimizearg'()
.annotate 'line', 2395
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2396
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2397
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2398
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2401
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2402
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2403
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2404
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2407
.return(self)
# }
.annotate 'line', 2408

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2409
# Body
# {
.annotate 'line', 2411
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2412
self.'annotate'(__ARG_1)
.annotate 'line', 2413
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2414

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2381
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2421
# Body
# {
.annotate 'line', 2423
.return('I')
# }
.annotate 'line', 2424

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2425
# Body
# {
.annotate 'line', 2427
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2428
.return(self)
# }
.annotate 'line', 2429

.end # set


.sub 'optimize' :method

.annotate 'line', 2430
# Body
# {
.annotate 'line', 2432
self.'optimizearg'()
.annotate 'line', 2433
getattribute $P3, self, 'subexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2434
# var numval: $P1
getattribute $P4, self, 'subexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2435
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2436
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2438
.return(self)
# }
.annotate 'line', 2439

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2440
# Body
# {
.annotate 'line', 2442
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2443
self.'annotate'(__ARG_1)
.annotate 'line', 2444
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2445
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2447
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2450
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2453
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2455

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2419
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2462
# Body
# {
.annotate 'line', 2464
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2465

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2466
# Body
# {
.annotate 'line', 2468
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2469
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2470
.return(self)
# }
.annotate 'line', 2471

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2472
# Body
# {
.annotate 'line', 2474
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2475
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2476
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2477

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2478
# Body
# {
.annotate 'line', 2480
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2481
self.'annotate'(__ARG_1)
.annotate 'line', 2482
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2483
.return($S1)
# }
.annotate 'line', 2484

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2460
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2491
# Body
# {
.annotate 'line', 2493
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2494
.return(self)
# }
.annotate 'line', 2495

.end # set


.sub 'checkResult' :method

.annotate 'line', 2496
# Body
# {
.annotate 'line', 2498
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2499

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2500
# Body
# {
.annotate 'line', 2502
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2503
self.'annotate'(__ARG_1)
.annotate 'line', 2504
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2505
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2506
.return($S1)
# }
.annotate 'line', 2507

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2489
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2514
# Body
# {
.annotate 'line', 2516
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2517

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2518
# Body
# {
.annotate 'line', 2520
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2521
.return(self)
# }
.annotate 'line', 2522

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2523
# Body
# {
.annotate 'line', 2525
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2526
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2527
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2528

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2529
# Body
# {
.annotate 'line', 2531
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2532
self.'annotate'(__ARG_1)
.annotate 'line', 2533
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2534
.return($S1)
# }
.annotate 'line', 2535

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2512
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2542
# Body
# {
.annotate 'line', 2544
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2545
.return(self)
# }
.annotate 'line', 2546

.end # set


.sub 'checkResult' :method

.annotate 'line', 2547
# Body
# {
.annotate 'line', 2549
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2550

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2551
# Body
# {
.annotate 'line', 2553
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2554
self.'annotate'(__ARG_1)
.annotate 'line', 2555
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2556
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2557
.return($S1)
# }
.annotate 'line', 2558

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2540
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2567
# Body
# {
.annotate 'line', 2569
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2570
setattribute self, 'eleft', __ARG_3
.annotate 'line', 2571
setattribute self, 'eright', __ARG_4
.annotate 'line', 2572
.return(self)
# }
.annotate 'line', 2573

.end # set


.sub 'checkResult' :method

.annotate 'line', 2574
# Body
# {
.annotate 'line', 2576
getattribute $P2, self, 'eleft'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2577
getattribute $P3, self, 'eleft'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2579
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2580

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2581
# Body
# {
.annotate 'line', 2583
getattribute $P3, self, 'eleft'
$P2 = $P3.'optimize'()
setattribute self, 'eleft', $P2
.annotate 'line', 2584
getattribute $P3, self, 'eright'
$P2 = $P3.'optimize'()
setattribute self, 'eright', $P2
.annotate 'line', 2585
.return(self)
# }
.annotate 'line', 2586

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2587
# Body
# {
.annotate 'line', 2589
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2590

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2563
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2565
addattribute $P0, 'eleft'
.annotate 'line', 2566
addattribute $P0, 'eright'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2597
# Body
# {
.annotate 'line', 2599
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2600
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
# {
.annotate 'line', 2601
self.'annotate'(__ARG_1)
.annotate 'line', 2602
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2604

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2605
# Body
# {
.annotate 'line', 2607
self.'annotate'(__ARG_1)
.annotate 'line', 2608
# var eleft: $P1
getattribute $P1, self, 'eleft'
.annotate 'line', 2609
getattribute $P2, self, 'eright'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2610

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2595
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2617
# Body
# {
.annotate 'line', 2619
self.'annotate'(__ARG_1)
.annotate 'line', 2620
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2621
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2622
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2623

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2624
# Body
# {
.annotate 'line', 2626
self.'annotate'(__ARG_1)
.annotate 'line', 2627
# string reg: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2628
# string reg2: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2629
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2630
.return($S1)
# }
.annotate 'line', 2631

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2615
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2638
# Body
# {
.annotate 'line', 2640
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2641
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2642
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2643

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2644
# Body
# {
.annotate 'line', 2646
# string ltype: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2647
# string rtype: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2648
# string reg: $S3
getattribute $P4, self, 'eleft'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2649
# string reg2: $S4
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2650
self.'annotate'(__ARG_1)
.annotate 'line', 2651
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
# {
.annotate 'line', 2652
isne $I2, $S2, 'S'
unless $I2 goto __label_6
# {
.annotate 'line', 2653
# string aux: $S5
$P5 = self.'tempreg'('S')
null $S5
if_null $P5, __label_7
set $S5, $P5
__label_7:
.annotate 'line', 2654
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2655
# }
__label_6: # endif
.annotate 'line', 2657
__ARG_1.'emitconcat'($S3, $S3, $S4)
# }
goto __label_5
__label_4: # else
.annotate 'line', 2660
__ARG_1.'emitaddto'($S3, $S4)
__label_5: # endif
.annotate 'line', 2661
.return($S3)
# }
.annotate 'line', 2662

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2636
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

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
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2682
.return($S2)
# }
.annotate 'line', 2683

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2667
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

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
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2703
.return($S2)
# }
.annotate 'line', 2704

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2688
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2711
# Body
# {
.annotate 'line', 2713
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2714
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2715
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2716

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2717
# Body
# {
.annotate 'line', 2719
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2720
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2721
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2722
self.'annotate'(__ARG_1)
.annotate 'line', 2723
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2724
.return($S2)
# }
.annotate 'line', 2725

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2709
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2732
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2733
# Body
# {
.annotate 'line', 2735
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2736
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2737
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2738
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2739
self.'annotate'(__ARG_1)
.annotate 'line', 2740
# string aux: $S5
null $S5
.annotate 'line', 2741
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2743
iseq $I2, $S1, 'I'
unless $I2 goto __label_7
# {
.annotate 'line', 2744
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2745
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2746
# }
__label_7: # endif
.annotate 'line', 2748
iseq $I1, $S2, 'I'
unless $I1 goto __label_8
# {
.annotate 'line', 2749
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2750
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2751
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2754
iseq $I2, $S2, 'I'
unless $I2 goto __label_11
iseq $I2, $S1, 'P'
__label_11:
unless $I2 goto __label_9
# {
.annotate 'line', 2755
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2756
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2757
# }
goto __label_10
__label_9: # else
.annotate 'line', 2759
iseq $I3, $S2, 'P'
unless $I3 goto __label_14
iseq $I3, $S1, 'I'
__label_14:
unless $I3 goto __label_12
# {
.annotate 'line', 2760
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2761
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2762
# }
goto __label_13
__label_12: # else
.annotate 'line', 2764
iseq $I3, $S2, 'S'
unless $I3 goto __label_17
iseq $I3, $S1, 'P'
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 2765
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2766
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2767
# }
goto __label_16
__label_15: # else
.annotate 'line', 2769
iseq $I4, $S2, 'P'
unless $I4 goto __label_19
iseq $I4, $S1, 'S'
__label_19:
unless $I4 goto __label_18
# {
.annotate 'line', 2770
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2771
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2772
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 2775
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
# }
.annotate 'line', 2776

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2777
# Body
# {
.annotate 'line', 2779
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2780

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2730
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2792
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2793
# Body
# {
.annotate 'line', 2795
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2796
setattribute self, 'expr', __ARG_2
.annotate 'line', 2797
.return(self)
# }
.annotate 'line', 2798

.end # set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 2788
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2790
addattribute $P0, 'expr'
.end
.namespace [ 'OpIsNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2803
# Body
# {
.annotate 'line', 2805
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2806
self.'annotate'(__ARG_1)
.annotate 'line', 2807
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2808

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpIsNullExpr' ]
.annotate 'line', 2801
get_class $P1, [ 'NullCheckerExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2813
# Body
# {
.annotate 'line', 2815
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2816
self.'annotate'(__ARG_1)
.annotate 'line', 2817
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2818
__ARG_1.'say'('not ', __ARG_2)
# }
.annotate 'line', 2819

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotNullExpr' ]
.annotate 'line', 2811
get_class $P1, [ 'NullCheckerExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2826
# Body
# {
.annotate 'line', 2828
self.'optimizearg'()
.annotate 'line', 2829
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2830
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2831
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2832
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2833
unless $I1 goto __label_0
# {
.annotate 'line', 2834
unless $I2 goto __label_1
.annotate 'line', 2835
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 2837
new $P6, [ 'OpIsNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2839
unless $I2 goto __label_3
.annotate 'line', 2840
new $P4, [ 'OpIsNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2841
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2842
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2843
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2844
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2845
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2846
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2847
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2850
.return(self)
# }
.annotate 'line', 2851

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2852
# Body
# {
.annotate 'line', 2854
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2855

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2856
# Body
# {
.annotate 'line', 2858
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2859

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 2824
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2866
# Body
# {
.annotate 'line', 2868
self.'optimizearg'()
.annotate 'line', 2869
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2870
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2871
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2872
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2873
unless $I1 goto __label_0
# {
.annotate 'line', 2874
unless $I2 goto __label_1
.annotate 'line', 2875
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 2877
new $P6, [ 'OpNotNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2879
unless $I2 goto __label_3
.annotate 'line', 2880
new $P4, [ 'OpNotNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2881
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2882
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2883
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2884
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2885
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2886
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2887
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2890
.return(self)
# }
.annotate 'line', 2891

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2892
# Body
# {
.annotate 'line', 2894
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2895

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2896
# Body
# {
.annotate 'line', 2898
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2899

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 2864
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2906
# Body
# {
.annotate 'line', 2908
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2909

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 2904
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2916
# Body
# {
.annotate 'line', 2918
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2919

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 2914
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2926
# Body
# {
.annotate 'line', 2928
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2929

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 2924
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2936
# Body
# {
.annotate 'line', 2938
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2939

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 2934
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2946
# Body
# {
.annotate 'line', 2948
.return('I')
# }
.annotate 'line', 2949

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 2944
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 2956
# Body
# {
.annotate 'line', 2958
self.'optimizearg'()
.annotate 'line', 2959
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2960
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2961
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2962
isne $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2963
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2965
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2967
.return(self)
# }
.annotate 'line', 2968

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2969
# Body
# {
.annotate 'line', 2971
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
.annotate 'line', 2972
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 2973
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 2974
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 2975
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 2976
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 2977
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 2980
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 2981
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 2982
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 2983
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 2984
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 2986

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 2954
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 2993
# Body
# {
.annotate 'line', 2995
self.'optimizearg'()
.annotate 'line', 2996
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2997
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2998
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2999
iseq $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 3000
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3002
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3004
.return(self)
# }
.annotate 'line', 3005

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3006
# Body
# {
.annotate 'line', 3008
# string res: $S1
null $S1
.annotate 'line', 3009
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3012
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3013
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3014
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3015
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3016
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3017
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3018
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3021
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3022
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3023
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3024
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3025
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3027

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 2991
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3034
# Body
# {
.annotate 'line', 3036
.return('I')
# }
.annotate 'line', 3037

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3032
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3044
# Body
# {
.annotate 'line', 3046
self.'optimizearg'()
.annotate 'line', 3047
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3048
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3049
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3050
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3051
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3052
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3054
.return(self)
# }
.annotate 'line', 3055

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3056
# Body
# {
.annotate 'line', 3058
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
.annotate 'line', 3059
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3060
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3061
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3062
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3063
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3064

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3042
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3071
# Body
# {
.annotate 'line', 3073
self.'optimizearg'()
.annotate 'line', 3074
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3075
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3076
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3077
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3078
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3079
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3081
.return(self)
# }
.annotate 'line', 3082

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3083
# Body
# {
.annotate 'line', 3085
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
.annotate 'line', 3086
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3087
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3088
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3089
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3090
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3091

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3069
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3098
# Body
# {
.annotate 'line', 3100
self.'optimizearg'()
.annotate 'line', 3101
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3102
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3103
$I4 = $P1.'isliteral'()
unless $I4 goto __label_1
$I4 = $P2.'isliteral'()
__label_1:
unless $I4 goto __label_0
# {
.annotate 'line', 3104
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_2
set $S1, $P10
__label_2:
.annotate 'line', 3105
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_3
set $S2, $P10
__label_3:
.annotate 'line', 3106
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3107
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3108
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3109
# var t: $P5
null $P5
.annotate 'line', 3110
# int newtype: $I1
null $I1
.annotate 'line', 3111
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
.annotate 'line', 3115
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_9
set $S3, $P11
__label_9:
.annotate 'line', 3116
# string rs: $S4
getattribute $P12, $P4, 'str'
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
concat $S5, $S3, $S4
.annotate 'line', 3117
$P5 = 'newTokenFrom'($I1, $S5, $P3)
.annotate 'line', 3118
new $P14, [ 'StringLiteral' ]
getattribute $P15, self, 'owner'
$P14.'StringLiteral'($P15, $P5)
set $P13, $P14
.return($P13)
# }
__label_4: # endif
.annotate 'line', 3120
iseq $I5, $S1, 'I'
unless $I5 goto __label_12
iseq $I5, $S2, 'I'
__label_12:
unless $I5 goto __label_11
# {
.annotate 'line', 3121
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3122
# int ln: $I2
set $P13, $P6
set $I2, $P13
.annotate 'line', 3123
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3124
# int rn: $I3
set $P14, $P7
set $I3, $P14
.annotate 'line', 3125
getattribute $P15, self, 'owner'
getattribute $P16, self, 'start'
add $I6, $I2, $I3
.tailcall 'integerValue'($P15, $P16, $I6)
# }
__label_11: # endif
# {
.annotate 'line', 3128
$P16 = 'floatresult'($S1, $S2)
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 3129
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3130
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3131
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3132
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3133
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P17, $P18, $N3)
# }
__label_13: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3137
.return(self)
# }
.annotate 'line', 3138

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3139
# Body
# {
.annotate 'line', 3141
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3142
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3143
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3144
.return($S1)
__label_2: # endif
.annotate 'line', 3145
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3146
.return('S')
__label_3: # endif
.annotate 'line', 3147
iseq $I2, $S1, 'S'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3148
.return('S')
__label_5: # endif
.annotate 'line', 3149
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3150
.return('N')
__label_7: # endif
.annotate 'line', 3151
.return('I')
# }
.annotate 'line', 3152

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3153
# Body
# {
.annotate 'line', 3155
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3156
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3157
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3158
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3159
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3161
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3162
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3163
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
# {
.annotate 'line', 3164
isne $I2, $S2, 'S'
if $I2 goto __label_8
isne $I2, $S3, 'S'
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 3165
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3166
isne $I1, $S2, 'S'
unless $I1 goto __label_10
# {
.annotate 'line', 3167
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3168
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3171
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3172
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3175
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3178
iseq $I2, $S1, 'I'
unless $I2 goto __label_14
isne $I2, $S2, 'I'
if $I2 goto __label_15
isne $I2, $S3, 'I'
__label_15:
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3179
# string l: $S7
null $S7
.annotate 'line', 3180
iseq $I3, $S2, 'I'
unless $I3 goto __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3182
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3183
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3185
# string r: $S8
null $S8
.annotate 'line', 3186
iseq $I3, $S3, 'I'
unless $I3 goto __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3188
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3189
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3191
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3194
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3196

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3096
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3203
# Body
# {
.annotate 'line', 3205
self.'optimizearg'()
.annotate 'line', 3206
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3207
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3208
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3209
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3210
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3211
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3212
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3213
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3214
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3215
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3216
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3219
.return(self)
# }
.annotate 'line', 3220

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3221
# Body
# {
.annotate 'line', 3223
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3224
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3225
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3226
.return($S1)
__label_2: # endif
.annotate 'line', 3227
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3228
.return('N')
__label_3: # endif
.annotate 'line', 3229
iseq $I2, $S1, 'N'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3230
.return('N')
__label_5: # endif
.annotate 'line', 3231
.return('I')
# }
.annotate 'line', 3232

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3233
# Body
# {
.annotate 'line', 3235
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3236
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3237
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3238

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3201
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3245
# Body
# {
.annotate 'line', 3247
self.'optimizearg'()
.annotate 'line', 3248
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3249
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3250
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3251
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3252
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3253
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3254
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3255
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3256
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3257
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3258
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
set $I5, $I1
set $I6, $I2
mul $I4, $I5, $I6
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3261
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3262
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3263
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3264
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3265
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3266
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3270
.return(self)
# }
.annotate 'line', 3271

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3272
# Body
# {
.annotate 'line', 3274
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3275
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3276
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3277
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3278
.return($S1)
__label_2: # endif
.annotate 'line', 3279
iseq $I1, $S1, 'S'
unless $I1 goto __label_3
.annotate 'line', 3280
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3282
.return('N')
__label_4: # endif
# }
.annotate 'line', 3283

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3284
# Body
# {
.annotate 'line', 3286
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3287
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3288
# var ltype: $P3
$P3 = $P1.'checkResult'()
.annotate 'line', 3289
$S10 = $P3
iseq $I3, $S10, 'S'
unless $I3 goto __label_0
# {
.annotate 'line', 3290
# string lreg: $S1
$P4 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 3291
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 3292
# string rval: $S3
null $S3
.annotate 'line', 3293
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
.annotate 'line', 3298
$P6 = self.'tempreg'('I')
set $S3, $P6
.annotate 'line', 3299
__ARG_1.'emitset'($S3, $S2)
__label_3: # switch end
.annotate 'line', 3301
self.'annotate'(__ARG_1)
.annotate 'line', 3302
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S1, ', ', $S3)
.annotate 'line', 3303
.return()
# }
__label_0: # endif
.annotate 'line', 3308
$S11 = $P3
iseq $I3, $S11, 'N'
unless $I3 goto __label_6
# {
.annotate 'line', 3309
# string lreg: $S4
$P5 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_7
set $S4, $P5
__label_7:
.annotate 'line', 3310
# string rreg: $S5
$P6 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P6, __label_8
set $S5, $P6
__label_8:
.annotate 'line', 3311
# string rval: $S6
null $S6
.annotate 'line', 3312
$P7 = $P2.'checkResult'()
set $S12, $P7
set $S13, 'I'
if $S12 == $S13 goto __label_11
set $S13, 'N'
if $S12 == $S13 goto __label_12
goto __label_10
# switch
__label_11: # case
.annotate 'line', 3314
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3315
__ARG_1.'emitset'($S6, $S5)
set $S6, $S5
goto __label_9 # break
__label_12: # case
set $S6, $S5
goto __label_9 # break
__label_10: # default
.annotate 'line', 3322
$P9 = self.'tempreg'('N')
set $S6, $P9
.annotate 'line', 3323
__ARG_1.'emitset'($S6, $S5)
__label_9: # switch end
.annotate 'line', 3325
self.'annotate'(__ARG_1)
.annotate 'line', 3326
__ARG_1.'say'('mul ', __ARG_2, ', ', $S4, ', ', $S6)
.annotate 'line', 3327
.return()
# }
__label_6: # endif
.annotate 'line', 3330
# string rleft: $S7
null $S7
.annotate 'line', 3331
# string rright: $S8
null $S8
.annotate 'line', 3332
# int nleft: $I1
null $I1
.annotate 'line', 3333
# int nright: $I2
null $I2
.annotate 'line', 3334
$P7 = $P1.'issimple'()
isfalse $I4, $P7
if $I4 goto __label_15
$I4 = $P1.'isidentifier'()
__label_15:
unless $I4 goto __label_13
# {
.annotate 'line', 3335
$P9 = self.'checkResult'()
$P8 = self.'tempreg'($P9)
set $S7, $P8
.annotate 'line', 3336
$P1.'emit'(__ARG_1, $S7)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 3339
$P10 = $P1.'getIntegerValue'()
set $I1, $P10
set $S7, $I1
.annotate 'line', 3340
# }
__label_14: # endif
.annotate 'line', 3342
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_18
$I4 = $P2.'isidentifier'()
__label_18:
unless $I4 goto __label_16
# {
.annotate 'line', 3343
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S8, $P11
.annotate 'line', 3344
$P2.'emit'(__ARG_1, $S8)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 3347
# string type: $S9
$P11 = $P2.'checkResult'()
null $S9
if_null $P11, __label_19
set $S9, $P11
__label_19:
set $S12, $S9
set $S13, 'S'
.annotate 'line', 3348
if $S12 == $S13 goto __label_22
set $S13, 'I'
if $S12 == $S13 goto __label_23
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3350
$P13 = self.'checkResult'()
$P12 = self.'tempreg'($P13)
set $S8, $P12
.annotate 'line', 3351
$P2.'emit'(__ARG_1, $S8)
goto __label_20 # break
__label_23: # case
__label_21: # default
.annotate 'line', 3355
$P14 = $P2.'getIntegerValue'()
set $I2, $P14
set $S8, $I2
goto __label_20 # break
__label_20: # switch end
.annotate 'line', 3357
# }
__label_17: # endif
.annotate 'line', 3360
self.'annotate'(__ARG_1)
.annotate 'line', 3361
__ARG_1.'say'('mul ', __ARG_2, ', ', $S7, ', ', $S8)
# }
.annotate 'line', 3362

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3243
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3369
# Body
# {
.annotate 'line', 3371
self.'optimizearg'()
.annotate 'line', 3372
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3373
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3374
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3375
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3376
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3377
# var lval: $P3
null $P3
.annotate 'line', 3378
# var rval: $P4
null $P4
.annotate 'line', 3379
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3380
getattribute $P3, $P1, 'numval'
.annotate 'line', 3381
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3382
getattribute $P4, $P2, 'numval'
.annotate 'line', 3383
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3384
isne $I4, $I2, 0
unless $I4 goto __label_6
.annotate 'line', 3385
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
.annotate 'line', 3388
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3389
getattribute $P3, $P1, 'numval'
.annotate 'line', 3390
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3391
getattribute $P4, $P2, 'numval'
.annotate 'line', 3392
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3393
isne $I4, $N2, $N3
unless $I4 goto __label_8
.annotate 'line', 3394
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
.annotate 'line', 3398
.return(self)
# }
.annotate 'line', 3399

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3400
# Body
# {
.annotate 'line', 3402
.return('N')
# }
.annotate 'line', 3403

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3404
# Body
# {
.annotate 'line', 3406
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3407
# var lreg: $P2
null $P2
.annotate 'line', 3408
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_0
.annotate 'line', 3409
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3411
$P2 = self.'tempreg'('N')
.annotate 'line', 3412
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3414
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3415
# var rreg: $P4
null $P4
.annotate 'line', 3416
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_2
.annotate 'line', 3417
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3419
$P4 = self.'tempreg'('N')
.annotate 'line', 3420
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3422
self.'annotate'(__ARG_1)
.annotate 'line', 3423
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3424

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3367
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3431
# Body
# {
.annotate 'line', 3433
.return('I')
# }
.annotate 'line', 3434

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3435
# Body
# {
.annotate 'line', 3437
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3438
# var lreg: $P2
null $P2
.annotate 'line', 3439
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3440
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3442
$P2 = self.'tempreg'('I')
.annotate 'line', 3443
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3445
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3446
# var rreg: $P4
null $P4
.annotate 'line', 3447
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3448
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3450
$P4 = self.'tempreg'('I')
.annotate 'line', 3451
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3453
self.'annotate'(__ARG_1)
.annotate 'line', 3454
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3455

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3429
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3462
# Body
# {
.annotate 'line', 3464
.return('I')
# }
.annotate 'line', 3465

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3466
# Body
# {
.annotate 'line', 3468
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3469
# var lreg: $P2
null $P2
.annotate 'line', 3470
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3471
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3473
$P2 = self.'tempreg'('I')
.annotate 'line', 3474
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3476
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3477
# var rreg: $P4
null $P4
.annotate 'line', 3478
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3479
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3481
$P4 = self.'tempreg'('I')
.annotate 'line', 3482
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3484
self.'annotate'(__ARG_1)
.annotate 'line', 3489
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3490

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3460
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3499
# Body
# {
.annotate 'line', 3501
setattribute self, 'arg', __ARG_1
.annotate 'line', 3502
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3503

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3504
# Body
# {
.annotate 'line', 3506
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3507
.return(self)
# }
.annotate 'line', 3508

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3509
# Body
# {
.annotate 'line', 3511
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3512

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3497
addattribute $P0, 'arg'
.annotate 'line', 3498
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3515
# Body
# {
.annotate 'line', 3517
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3518
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3519
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3520
.return(1)
# }
.annotate 'line', 3521

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3530
# Body
# {
.annotate 'line', 3532
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3533
setattribute self, 'predef', __ARG_3
.annotate 'line', 3534
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3535

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3536
# Body
# {
.annotate 'line', 3538
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3539

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3540
# Body
# {
.annotate 'line', 3542
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3543
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3544
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3545
# var arg: $P4
null $P4
.annotate 'line', 3546
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3547
iseq $I4, $I1, -1
unless $I4 goto __label_0
# {
.annotate 'line', 3548
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3549
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3550
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3554
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3555
# int i: $I3
null $I3
goto __label_7
__label_5: # for iteration
inc $I3
__label_7: # for condition
islt $I4, $I3, $I2
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 3556
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3557
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3558
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3559
# string argr: $S4
null $S4
.annotate 'line', 3560
iseq $I5, $S2, $S3
if $I5 goto __label_12
iseq $I5, $S3, '?'
__label_12:
unless $I5 goto __label_10
.annotate 'line', 3561
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3563
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3564
iseq $I5, $S3, 'P'
unless $I5 goto __label_13
# {
.annotate 'line', 3565
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3566
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
.annotate 'line', 3571
isne $I6, $S5, ''
unless $I6 goto __label_19
.annotate 'line', 3572
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3574
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3576
$P3.'push'($S4)
# }
goto __label_5 # for iteration
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3579
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3580

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3525
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3527
addattribute $P0, 'predef'
.annotate 'line', 3528
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3590
# Body
# {
.annotate 'line', 3592
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3593
setattribute self, 'funref', __ARG_4
.annotate 'line', 3594
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3595
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3596
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3597
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3598
# {
.annotate 'line', 3599
# var modifier: $P2
null $P2
.annotate 'line', 3600
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3601
$P1 = __ARG_1.'get'()
.annotate 'line', 3602
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3603
$P1 = __ARG_1.'get'()
.annotate 'line', 3604
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3605
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3606
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3609
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3612
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3613
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3614
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3615
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3617

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3618
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3619
# Body
# {
.annotate 'line', 3621
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3622
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3623
'optimize_array'($P1)
.annotate 'line', 3626
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3627
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3628
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3629
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3630
isnull $I1, $P3
not $I1
unless $I1 goto __label_2
# {
.annotate 'line', 3631
self.'use_predef'($S1)
.annotate 'line', 3634
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3635
isnull $I2, $P4
not $I2
unless $I2 goto __label_3
# {
.annotate 'line', 3636
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3637
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3640
new $P9, [ 'CallPredefExpr' ]
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
$P9.'CallPredefExpr'($P10, $P11, $P3, $P1)
set $P8, $P9
.return($P8)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3644
.return(self)
# }
.annotate 'line', 3645

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3646
# Body
# {
.annotate 'line', 3648
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3649
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3650
# string call: $S1
null $S1
.annotate 'line', 3651
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3652
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 3653
iseq $I6, $S1, ''
unless $I6 goto __label_2
# {
.annotate 'line', 3654
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S8, "'", $S2
concat $S1, $S8, "'"
.annotate 'line', 3655
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3659
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 3661
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3662
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 3663
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 3664
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 3665
# string reg: $S3
null $S3
.annotate 'line', 3666
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 3667
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 3668
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 3671
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 3672
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 3674
self.'annotate'(__ARG_1)
.annotate 'line', 3676
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 3677
$S9 = __ARG_2
iseq $I7, $S9, '.tailcall'
unless $I7 goto __label_12
.annotate 'line', 3678
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 3680
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 3683
unless $I1 goto __label_14
.annotate 'line', 3684
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 3686
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 3688
__ARG_1.'print'('(')
.annotate 'line', 3690
# string sep: $S4
set $S4, ''
.annotate 'line', 3691
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 3692
# int i: $I3
null $I3
goto __label_18
__label_16: # for iteration
inc $I3
__label_18: # for condition
islt $I7, $I3, $I2
unless $I7 goto __label_17 # for end
# {
.annotate 'line', 3693
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 3694
__ARG_1.'print'($S4, $S5)
.annotate 'line', 3695
# int isflat: $I4
null $I4
.annotate 'line', 3696
# int isnamed: $I5
null $I5
.annotate 'line', 3697
# string setname: $S6
set $S6, ''
.annotate 'line', 3698
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 3699
isnull $I8, $P6
not $I8
unless $I8 goto __label_19
# {
.annotate 'line', 3700
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 3701
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 3702
iseq $I8, $S7, 'flat'
unless $I8 goto __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 3704
iseq $I9, $S7, 'named'
unless $I9 goto __label_24
# {
set $I5, 1
.annotate 'line', 3706
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
.annotate 'line', 3710
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 3711
$P17 = $P8.'isstringliteral'()
isfalse $I11, $P17
unless $I11 goto __label_29
.annotate 'line', 3712
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 3713
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 3716
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
.annotate 'line', 3721
and $I10, $I11, $I12
unless $I10 goto __label_30
.annotate 'line', 3722
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 3723
unless $I4 goto __label_32
.annotate 'line', 3724
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 3725
unless $I5 goto __label_34
# {
.annotate 'line', 3726
__ARG_1.'print'(' :named')
.annotate 'line', 3727
isne $I12, $S6, ''
unless $I12 goto __label_35
.annotate 'line', 3728
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 3730
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 3732
__ARG_1.'say'(')')
# }
.annotate 'line', 3733

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 3585
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3587
addattribute $P0, 'funref'
.annotate 'line', 3588
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3743
# Body
# {
.annotate 'line', 3745
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3746
setattribute self, 'left', __ARG_4
.annotate 'line', 3747
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 3748

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 3749
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3750
# Body
# {
.annotate 'line', 3752
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3753
.return(self)
# }
.annotate 'line', 3754

.end # optimize


.sub 'get_member' :method

.annotate 'line', 3755
# Body
# {
.annotate 'line', 3757
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 3758

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 3759
# Body
# {
.annotate 'line', 3761
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 3762
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3763
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3764
isne $I1, $S1, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3765
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 3766
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 3767
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 3769
.return($S2)
# }
.annotate 'line', 3770

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3771
# Body
# {
.annotate 'line', 3773
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3774
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3775
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3776
self.'annotate'(__ARG_1)
.annotate 'line', 3777
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 3778
.return($S3)
# }
.annotate 'line', 3779

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3780
# Body
# {
.annotate 'line', 3782
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3783
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3784
self.'annotate'(__ARG_1)
.annotate 'line', 3785
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 3786

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3787
# Body
# {
.annotate 'line', 3789
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3790
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3791
# string value: $S3
null $S3
.annotate 'line', 3792
iseq $I1, __ARG_2, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3794
iseq $I2, __ARG_3, 'null'
unless $I2 goto __label_4
# {
.annotate 'line', 3795
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 3796
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 3798
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3801
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 3802
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 3804
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 3805

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3806
# Body
# {
.annotate 'line', 3808
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3809
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3810
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3811
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 3812
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3814
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 3815
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
isne $I1, $S5, 'P'
unless $I1 goto __label_6
.annotate 'line', 3816
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 3818
# }
__label_4: # endif
.annotate 'line', 3820
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 3821
.return($S3)
# }
.annotate 'line', 3822

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 3738
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3740
addattribute $P0, 'left'
.annotate 'line', 3741
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3831
# Body
# {
.annotate 'line', 3833
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3834
setattribute self, 'left', __ARG_4
.annotate 'line', 3835
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 3836

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 3837
# Body
# {
.annotate 'line', 3839
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
iseq $I1, $S1, 'S'
unless $I1 goto __label_0
.annotate 'line', 3840
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 3842
.return('P')
__label_1: # endif
# }
.annotate 'line', 3843

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3844
# Body
# {
.annotate 'line', 3846
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3847
self.'optimizeargs'()
.annotate 'line', 3848
.return(self)
# }
.annotate 'line', 3849

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3850
# Body
# {
.annotate 'line', 3852
# var regleft: $P1
null $P1
.annotate 'line', 3853
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 3854
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 3856
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 3857
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 3858
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3859
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 3860
iseq $I2, $S1, 'S'
unless $I2 goto __label_3
# {
.annotate 'line', 3861
isne $I3, $I1, 1
unless $I3 goto __label_5
.annotate 'line', 3862
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 3863
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3866
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 3867
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3868
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 3870

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3871
# Body
# {
.annotate 'line', 3873
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3874
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3875
self.'annotate'(__ARG_1)
.annotate 'line', 3876
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3877
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 3878
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 3879

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3880
# Body
# {
.annotate 'line', 3882
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3883
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3884
# string rreg: $S1
null $S1
.annotate 'line', 3885
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3886
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 3887
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 3890
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 3891
self.'annotate'(__ARG_1)
.annotate 'line', 3892
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3893
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3894
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 3895
.return($S1)
# }
.annotate 'line', 3896

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 3827
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 3829
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3905
# Body
# {
.annotate 'line', 3907
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3908
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 3909
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3910
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 3911
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3912
# {
.annotate 'line', 3913
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3914
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 3915
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 3916
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 3917
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3919

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 3920
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3921
# Body
# {
.annotate 'line', 3923
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3924
.return(self)
# }
.annotate 'line', 3925

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3926
# Body
# {
.annotate 'line', 3928
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3929
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3930

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3931
# Body
# {
.annotate 'line', 3933
self.'annotate'(__ARG_1)
.annotate 'line', 3934
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3935
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 3936
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3937
# string itemreg: $S3
null $S3
.annotate 'line', 3938
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 3939
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 3940
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
.annotate 'line', 3942
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 3943
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 3947
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 3949
self.'annotate'(__ARG_1)
.annotate 'line', 3950
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 3952
.return($S1)
# }
.annotate 'line', 3953

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 3901
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3903
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3963
# Body
# {
.annotate 'line', 3965
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3966
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3967
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 3968
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 3969
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 3970
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3971
# {
.annotate 'line', 3979
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3980
'ExpectOp'(':', __ARG_1)
.annotate 'line', 3981
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3982
$P2.'push'($P4)
.annotate 'line', 3983
$P3.'push'($P5)
# }
.annotate 'line', 3985
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 3986
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 3987
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3989
setattribute self, 'keys', $P2
.annotate 'line', 3990
setattribute self, 'values', $P3
# }
.annotate 'line', 3991

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 3992
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3993
# Body
# {
.annotate 'line', 3995
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 3996
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3997
.return(self)
# }
.annotate 'line', 3998

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3999
# Body
# {
.annotate 'line', 4001
self.'annotate'(__ARG_1)
.annotate 'line', 4002
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 4003
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4004
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4005
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4006
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 4007
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4008
# string item: $S1
null $S1
.annotate 'line', 4009
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 4010
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 4011
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4012
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 4015
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4017
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4018
# string itemreg: $S3
null $S3
.annotate 'line', 4019
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4020
# string id: $S4
$P8 = $P4.'getName'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4021
getattribute $P9, self, 'owner'
$P8 = $P9.'getvar'($S4)
isnull $I3, $P8
unless $I3 goto __label_9
# {
.annotate 'line', 4022
$P10 = self.'tempreg'('P')
set $S3, $P10
.annotate 'line', 4023
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S4, "'")
# }
goto __label_10
__label_9: # else
.annotate 'line', 4026
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4029
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4030
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 4052

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4053
# Body
# {
.annotate 'line', 4055
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4056
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4057
.return($S1)
# }
.annotate 'line', 4058

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 3958
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3960
addattribute $P0, 'keys'
.annotate 'line', 3961
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 4067
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4068
# Body
# {
.annotate 'line', 4072
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4073
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4074
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4075
__ARG_1.'unget'($P2)
.annotate 'line', 4076
# var initializer: $P3
root_new $P5, ['parrot';'ResizablePMCArray']
set $P3, $P5
__label_1: # do
.annotate 'line', 4077
# {
.annotate 'line', 4078
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4079
$P3.'push'($P4)
# }
.annotate 'line', 4080
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4081
setattribute self, 'initializer', $P3
.annotate 'line', 4082
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4084

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4063
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4065
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4093
# Body
# {
.annotate 'line', 4095
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4097
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4098
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4099
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4100
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4101
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4102
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4103
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4104
# {
.annotate 'line', 4105
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4106
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4107
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4108
$P2.'push'($P3)
# }
.annotate 'line', 4109
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4110
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4113
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4116
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4118
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4119
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4121
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4122

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4123
# Body
# {
.annotate 'line', 4125
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4126
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4129
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4130
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4131
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4132
$P5 = $P3['id']
isnull $I2, $P5
not $I2
unless $I2 goto __label_4
# {
.annotate 'line', 4133
$P1 = $P3['value']
.annotate 'line', 4134
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4135
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4136
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4139
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4143
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4144
isnull $I3, $P4
not $I3
unless $I3 goto __label_7
.annotate 'line', 4145
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4146
.return(self)
# }
.annotate 'line', 4147

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4148
# Body
# {
.annotate 'line', 4150
self.'annotate'(__ARG_1)
.annotate 'line', 4152
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4153
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
.annotate 'line', 4158
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4159
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4160
getattribute $P13, self, 'value'
$P12 = $P13.'isidentifier'()
if_null $P12, __label_7
unless $P12 goto __label_7
set $I2, 1
goto __label_6
__label_7:
set $I2, -1
__label_6:
__label_4:
__label_2:
.annotate 'line', 4162
# string reginit: $S1
set $S1, ''
.annotate 'line', 4163
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4164
# string constructor: $S3
null $S3
set $I4, $I1
null $I5
.annotate 'line', 4165
if $I4 == $I5 goto __label_11
set $I5, 1
if $I4 == $I5 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4169
iseq $I6, $I2, 1
unless $I6 goto __label_13
.annotate 'line', 4170
$P10 = self.'tempreg'('P')
set $S2, $P10
goto __label_14
__label_13: # else
# {
.annotate 'line', 4172
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4173
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S1, ', ', $S1
.annotate 'line', 4174
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4178
isne $I4, $I2, 1
unless $I4 goto __label_16
isne $I4, $I2, 2
__label_16:
unless $I4 goto __label_15
.annotate 'line', 4179
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_15: # endif
.annotate 'line', 4180
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_9: # switch end
set $I5, $I2
null $I6
.annotate 'line', 4183
if $I5 == $I6 goto __label_19
set $I6, 2
if $I5 == $I6 goto __label_20
set $I6, 1
if $I5 == $I6 goto __label_21
goto __label_18
# switch
__label_19: # case
.annotate 'line', 4186
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_22
set $S4, $P14
__label_22:
.annotate 'line', 4187
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4188
isnull $I7, $P3
unless $I7 goto __label_23
concat $S7, "Can't locate class ", $S4
concat $S6, $S7, " at compile time"
.annotate 'line', 4189
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_23: # endif
.annotate 'line', 4193
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4194
isgt $I8, $I1, 1
unless $I8 goto __label_24
# {
.annotate 'line', 4195
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_24: # endif
goto __label_17 # break
__label_20: # case
.annotate 'line', 4199
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4200
# predefined elements
elements $I8, $P4
sub $I7, $I8, 1
$S3 = $P4[$I7]
.annotate 'line', 4201
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_17 # break
__label_21: # case
.annotate 'line', 4204
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4205
isnull $I9, $P5
unless $I9 goto __label_25
# {
.annotate 'line', 4207
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4208
isnull $I9, $P6
not $I9
unless $I9 goto __label_27
# {
.annotate 'line', 4209
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4212
'Warn'('Checking: new unknown type')
.annotate 'line', 4213
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4215
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_26
__label_25: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4219
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_17 # break
__label_18: # default
.annotate 'line', 4223
'InternalError'('Unexpected type in new')
__label_17: # switch end
.annotate 'line', 4225
isgt $I10, $I1, 1
if $I10 goto __label_30
isgt $I10, $I1, 0
unless $I10 goto __label_31
iseq $I10, $I2, 1
__label_31:
__label_30:
unless $I10 goto __label_29
# {
.annotate 'line', 4226
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4227
iter $P21, $P1
set $P21, 0
__label_32: # for iteration
unless $P21 goto __label_33
shift $P8, $P21
# {
.annotate 'line', 4228
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_34
set $S5, $P22
__label_34:
.annotate 'line', 4229
$P7.'push'($S5)
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 4231
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4232
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4233
__ARG_1.'say'(")")
.annotate 'line', 4234
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4236

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4089
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4091
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4245
# Body
# {
.annotate 'line', 4247
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4248
setattribute self, 'owner', __ARG_2
.annotate 'line', 4249
# var nskey: $P1
new $P3, [ 'ClassSpecifierParrotKey' ]
$P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4250
setattribute self, 'nskey', $P1
.annotate 'line', 4251
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4252
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4253
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4255
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4256

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4257
# Body
# {
.annotate 'line', 4259
# string reginit: $S1
null $S1
.annotate 'line', 4260
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4261
# int numinits: $I1
isnull $I2, $P1
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
set $I2, $I1
null $I3
.annotate 'line', 4262
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4266
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4267
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4270
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4272
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4273
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4274
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4275
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4276
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4277
isnull $I3, $S1
not $I3
unless $I3 goto __label_7
.annotate 'line', 4278
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4279
__ARG_1.'say'()
# }
.annotate 'line', 4280

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4241
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4243
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4289
# Body
# {
.annotate 'line', 4291
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4292
setattribute self, 'owner', __ARG_2
.annotate 'line', 4293
# var nskey: $P1
new $P3, [ 'ClassSpecifierId' ]
$P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4294
setattribute self, 'nskey', $P1
.annotate 'line', 4295
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4296
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4297
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4299
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4300

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4301
# Body
# {
.annotate 'line', 4303
# string reginit: $S1
null $S1
.annotate 'line', 4304
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4306
# int numinits: $I1
isnull $I2, $P1
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4307
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4308
isgt $I2, $I1, 0
unless $I2 goto __label_3
.annotate 'line', 4309
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4310
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4311
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4312
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4313
__ARG_1.'say'()
.annotate 'line', 4315
isgt $I3, $I1, 0
unless $I3 goto __label_4
# {
.annotate 'line', 4316
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4317
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4318
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4319
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4321
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4322
__ARG_1.'print'($S2, ".'", $S4, "'(")
# predefined join
.annotate 'line', 4323
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4324
__ARG_1.'say'(")")
.annotate 'line', 4325
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4327

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4285
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4287
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4332
# Body
# {
.annotate 'line', 4334
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4336
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4338
new $P5, [ 'CallExpr' ]
.annotate 'line', 4339
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4338
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4341
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4343
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4345
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4348
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4349
__ARG_1.'unget'($P2)
.annotate 'line', 4350
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4352
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4356
new $P9, [ 'NewExpr' ]
$P9.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P8, $P9
.return($P8)
# }
__label_7: # endif
# }
goto __label_5
__label_4: # else
# {
.annotate 'line', 4361
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4363

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4372
# Body
# {
.annotate 'line', 4374
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4375
setattribute self, 'eleft', __ARG_3
.annotate 'line', 4376
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4377

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4378
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4379
# Body
# {
.annotate 'line', 4381
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4382
# string checkedval: $S1
null $S1
.annotate 'line', 4383
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4384
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S3, "'", $S1
concat $S1, $S3, "'"
.annotate 'line', 4385
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4389
# string r: $S2
getattribute $P3, self, 'eleft'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4390
self.'annotate'(__ARG_1)
.annotate 'line', 4391
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4392

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4367
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4369
addattribute $P0, 'eleft'
.annotate 'line', 4370
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4407
# Body
# {
.annotate 'line', 4409
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4410
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4411
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4412
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4413
.return(self)
# }
.annotate 'line', 4414

.end # set


.sub 'optimize' :method

.annotate 'line', 4415
# Body
# {
.annotate 'line', 4417
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4418
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
.annotate 'line', 4420
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4422
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4424
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4425
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4426
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4428

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4429
# Body
# {
.annotate 'line', 4431
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4432

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4433
# Body
# {
.annotate 'line', 4435
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4436
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4437
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4438
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4439
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4440
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4441
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4442
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4443

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4397
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4403
addattribute $P0, 'condition'
.annotate 'line', 4404
addattribute $P0, 'etrue'
.annotate 'line', 4405
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

.annotate 'line', 4476
# Body
# {
.annotate 'line', 4478
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
.annotate 'line', 4479
.return(1)
__label_3: # case
.annotate 'line', 4480
.return(2)
__label_4: # case
.annotate 'line', 4481
.return(3)
__label_1: # default
.annotate 'line', 4482
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4484

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4486
# Body
# {
.annotate 'line', 4488
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
.annotate 'line', 4489
.return(8)
__label_3: # case
.annotate 'line', 4490
.return(11)
__label_4: # case
.annotate 'line', 4491
.return(9)
__label_5: # case
.annotate 'line', 4492
.return(10)
__label_1: # default
.annotate 'line', 4493
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4495

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4497
# Body
# {
.annotate 'line', 4499
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
.annotate 'line', 4500
.return(19)
__label_3: # case
.annotate 'line', 4501
.return(20)
__label_4: # case
.annotate 'line', 4502
.return(21)
__label_5: # case
.annotate 'line', 4503
.return(22)
__label_1: # default
.annotate 'line', 4504
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4506

.end # getOpCode_5


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4508
# Body
# {
.annotate 'line', 4510
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
.annotate 'line', 4511
.return(14)
__label_3: # case
.annotate 'line', 4512
.return(16)
__label_4: # case
.annotate 'line', 4513
.return(15)
__label_5: # case
.annotate 'line', 4514
.return(17)
__label_1: # default
.annotate 'line', 4515
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4517

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4519
# Body
# {
.annotate 'line', 4521
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
.annotate 'line', 4522
.return(4)
__label_3: # case
.annotate 'line', 4523
.return(5)
__label_4: # case
.annotate 'line', 4524
.return(6)
__label_5: # case
.annotate 'line', 4525
.return(18)
__label_6: # case
.annotate 'line', 4526
.return(23)
__label_7: # case
.annotate 'line', 4527
.return(24)
__label_1: # default
.annotate 'line', 4528
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4530

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4532
# Body
# {
.annotate 'line', 4534
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4536
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4537
# var expr: $P2
null $P2
.annotate 'line', 4538
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4539
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4540
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4541
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4543
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4544
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4545
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4546
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4547
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4548
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4549
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4550
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4551
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4552
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4553
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4554
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4555
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4556
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 4557
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 4558
new $P15, [ 'IdentifierExpr' ]
.tailcall $P15.'set'(__ARG_2, $P1)
__label_8: # endif
.annotate 'line', 4559
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4560

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4562
# Body
# {
.annotate 'line', 4564
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4565
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4567
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4568
# var t: $P2
null $P2
.annotate 'line', 4569
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4570
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
set $I3, $I1
set $I4, 1
.annotate 'line', 4571
if $I3 == $I4 goto __label_4
set $I4, 2
if $I3 == $I4 goto __label_5
set $I4, 3
if $I3 == $I4 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4573
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4576
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4579
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4582
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4585
__ARG_1.'unget'($P2)
.annotate 'line', 4586
.return($P1)
# }
.annotate 'line', 4587

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4589
# Body
# {
.annotate 'line', 4591
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4593
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4594
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4595
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4596
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4597
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4598
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4601
__ARG_1.'unget'($P2)
.annotate 'line', 4602
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4604

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4606
# Body
# {
.annotate 'line', 4608
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4609
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4610
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4612
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4613
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4614
# var subexpr: $P2
null $P2
.annotate 'line', 4615
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4616
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4617
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4618
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
.annotate 'line', 4620
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4623
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4626
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4629
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4632
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4634
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4637
__ARG_1.'unget'($P1)
.annotate 'line', 4638
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4640
.return($P2)
# }
.annotate 'line', 4641

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4643
# Body
# {
.annotate 'line', 4645
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4646
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4648
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4649
# var t: $P2
null $P2
.annotate 'line', 4650
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4651
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4652
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4653
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4654
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
.annotate 'line', 4656
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4659
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4662
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4665
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4668
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 4670
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4671
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4673
__ARG_1.'unget'($P2)
.annotate 'line', 4674
.return($P1)
# }
.annotate 'line', 4675

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4677
# Body
# {
.annotate 'line', 4679
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 4681
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4682
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4683
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 4684
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4685
# var expr: $P4
null $P4
.annotate 'line', 4686
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 4687
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 4689
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 4690
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4692
__ARG_1.'unget'($P2)
.annotate 'line', 4693
.return($P1)
# }
.annotate 'line', 4694

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4696
# Body
# {
.annotate 'line', 4698
.const 'Sub' $P5 = 'parseExpr_6'
.annotate 'line', 4700
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4701
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4702
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
.annotate 'line', 4703
$P6 = $P2.'isop'('==')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4704
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4705
new $P6, [ 'OpEqualExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 4707
$P7 = $P2.'isop'('!=')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4708
# var eright: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4709
new $P7, [ 'OpNotEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4712
new $P8, [ 'OpInstanceOfExpr' ]
$P8.'OpInstanceOfExpr'(__ARG_2, $P2, $P1, __ARG_1)
set $P1, $P8
# }
__label_7: # endif
__label_5: # endif
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4715
__ARG_1.'unget'($P2)
.annotate 'line', 4716
.return($P1)
# }
.annotate 'line', 4717

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4719
# Body
# {
.annotate 'line', 4721
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 4722
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 4724
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4725
# var t: $P2
null $P2
.annotate 'line', 4726
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4727
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4728
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 4729
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
.annotate 'line', 4731
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 4734
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 4737
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 4740
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 4743
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4746
__ARG_1.'unget'($P2)
.annotate 'line', 4747
.return($P1)
# }
.annotate 'line', 4748

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4750
# Body
# {
.annotate 'line', 4752
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 4754
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4755
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4756
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4757
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4758
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4760
__ARG_1.'unget'($P2)
.annotate 'line', 4761
.return($P1)
# }
.annotate 'line', 4762

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4764
# Body
# {
.annotate 'line', 4766
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 4768
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4769
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4770
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4771
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4772
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4774
__ARG_1.'unget'($P2)
.annotate 'line', 4775
.return($P1)
# }
.annotate 'line', 4776

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4778
# Body
# {
.annotate 'line', 4780
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 4782
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4783
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4784
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4785
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4786
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4788
__ARG_1.'unget'($P2)
.annotate 'line', 4789
.return($P1)
# }
.annotate 'line', 4790

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4792
# Body
# {
.annotate 'line', 4794
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 4796
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4797
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4798
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4799
# var eright: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 4800
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4802
__ARG_1.'unget'($P2)
.annotate 'line', 4803
.return($P1)
# }
.annotate 'line', 4804

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4806
# Body
# {
.annotate 'line', 4808
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4809
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 4811
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4812
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4813
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 4814
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4815
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4816
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4817
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4820
__ARG_1.'unget'($P2)
.annotate 'line', 4821
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 4823

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4825
# Body
# {
.annotate 'line', 4827
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4828
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 4829
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 4831
# var eleft: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4832
# var t: $P2
null $P2
.annotate 'line', 4833
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4834
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4835
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4836
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 4837
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
.annotate 'line', 4839
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4842
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4845
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4848
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 4851
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 4854
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4857
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 4859
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4860
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4862
__ARG_1.'unget'($P2)
.annotate 'line', 4863
.return($P1)
# }
.annotate 'line', 4864

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4866
# Body
# {
.annotate 'line', 4868
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 4870
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 4871

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 4884
# Body
# {
.annotate 'line', 4886
getattribute $P1, self, 'brlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4887
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 4888
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4889
setattribute self, 'brlabel', $P2
.annotate 'line', 4890
.return($S1)
# }
.annotate 'line', 4891

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 4892
# Body
# {
.annotate 'line', 4894
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 4895
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4896
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 4897
.return($P1)
# }
.annotate 'line', 4898

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 4882
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 4905
# Body
# {
.annotate 'line', 4907
getattribute $P1, self, 'cntlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4908
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 4909
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4910
setattribute self, 'cntlabel', $P2
.annotate 'line', 4911
.return($S1)
# }
.annotate 'line', 4912

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 4913
# Body
# {
.annotate 'line', 4915
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 4916
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4917
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 4918
.return($P1)
# }
.annotate 'line', 4919

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 4901
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 4903
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4933
# Body
# {
.annotate 'line', 4935
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4936
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4937
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 4938
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 4939
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 4940
# {
.annotate 'line', 4941
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 4942
$P2.'push'($P3)
# }
.annotate 'line', 4943
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 4945
'RequireOp'(';', $P1)
.annotate 'line', 4946
setattribute self, 'values', $P2
# }
.annotate 'line', 4947

.end # parse


.sub 'optimize' :method

.annotate 'line', 4948
# Body
# {
.annotate 'line', 4950
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4951
.return(self)
# }
.annotate 'line', 4952

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4953
# Body
# {
.annotate 'line', 4955
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 4956
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4957
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 4960
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4961
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 4963
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 4964
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 4965
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 4966
self.'annotate'(__ARG_1)
.annotate 'line', 4967
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 4971
# int i: $I2
null $I2
goto __label_7
__label_5: # for iteration
inc $I2
__label_7: # for condition
islt $I4, $I2, $I1
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 4972
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 4973
# string reg: $S1
null $S1
.annotate 'line', 4974
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 4975
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 4976
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4979
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 4980
$P1.'push'($S1)
# }
goto __label_5 # for iteration
__label_6: # for end
.annotate 'line', 4982
self.'annotate'(__ARG_1)
.annotate 'line', 4983
self.'emitret'(__ARG_1)
.annotate 'line', 4984
# string sep: $S2
set $S2, ''
.annotate 'line', 4985
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 4986
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 4987
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 4989
__ARG_1.'say'(')')
# }
.annotate 'line', 4990

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 4929
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 4931
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4995
# Body
# {
.annotate 'line', 4997
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4998

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4999
# Body
# {
.annotate 'line', 5001
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5002

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 4993
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5007
# Body
# {
.annotate 'line', 5009
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5010

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5011
# Body
# {
.annotate 'line', 5013
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5014

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5005
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5025
# Body
# {
.annotate 'line', 5027
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5028
setattribute self, 'name', __ARG_1
.annotate 'line', 5029
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5030
setattribute self, 'value', $P2
.annotate 'line', 5031
.return(self)
# }
.annotate 'line', 5032

.end # set


.sub 'optimize' :method

.annotate 'line', 5033
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5034
# Body
# {
.annotate 'line', 5036
self.'annotate'(__ARG_1)
.annotate 'line', 5037
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5038
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 5039
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5040

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5021
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5023
addattribute $P0, 'name'
.annotate 'line', 5024
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5051
# Body
# {
.annotate 'line', 5053
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5054
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5055
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5056
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5057
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5058
setattribute self, 'label', $P1
.annotate 'line', 5059
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5060

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5061
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5062
# Body
# {
.annotate 'line', 5064
self.'annotate'(__ARG_1)
.annotate 'line', 5065
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5066
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5067
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5068

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5047
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5049
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5077
# Body
# {
.annotate 'line', 5079
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5080
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5081
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5082

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5075
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'Condition' ]
addparent $P0, $P2
.end
.namespace [ 'IfStatement' ]

.sub 'IfStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5093
# Body
# {
.annotate 'line', 5095
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5096
self.'parsecondition'(__ARG_2)
.annotate 'line', 5097
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5098
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5099
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5100
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5102
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5103
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5105

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5106
# Body
# {
.annotate 'line', 5108
self.'optimize_condition'()
.annotate 'line', 5109
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5110
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5111
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5112
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5114
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5116
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5118
.return(self)
# }
.annotate 'line', 5119

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5120
# Body
# {
.annotate 'line', 5122
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5123
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5124
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5125
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5126
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5127
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5128
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5129
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5130
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5131
self.'annotate'(__ARG_1)
.annotate 'line', 5132
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5133
$P1.'emit'(__ARG_1)
.annotate 'line', 5135
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5136
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5137
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5138
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5140
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5141

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5089
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5091
addattribute $P0, 'truebranch'
.annotate 'line', 5092
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5151
# Body
# {
.annotate 'line', 5153
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5154

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5155
# Body
# {
.annotate 'line', 5157
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5158
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5160
self.'annotate'(__ARG_1)
.annotate 'line', 5161
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5162
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5163
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5164
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5165

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5148
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5150
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5174
# Body
# {
.annotate 'line', 5176
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5177
self.'parsecondition'(__ARG_2)
.annotate 'line', 5178
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5179

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5180
# Body
# {
.annotate 'line', 5182
self.'optimize_condition'()
.annotate 'line', 5183
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5184
.return(self)
# }
.annotate 'line', 5185

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5186
# Body
# {
.annotate 'line', 5188
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5190
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5193
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5196
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5197
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5199
self.'annotate'(__ARG_1)
.annotate 'line', 5200
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5201
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5202
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5203
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5204
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5206

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5172
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'ConditionalStatement' ]
addparent $P0, $P2
.end
.namespace [ 'DoStatement' ]

.sub 'DoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5215
# Body
# {
.annotate 'line', 5217
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5218
self.'parsebody'(__ARG_2)
.annotate 'line', 5219
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5220
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5221

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5222
# Body
# {
.annotate 'line', 5224
self.'optimize_condition'()
.annotate 'line', 5225
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5226
.return(self)
# }
.annotate 'line', 5227

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5228
# Body
# {
.annotate 'line', 5230
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5232
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5235
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5236
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5237
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5239
self.'annotate'(__ARG_1)
.annotate 'line', 5240
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5242
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5243
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5244
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5246

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5213
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'ConditionalStatement' ]
addparent $P0, $P2
.end
.namespace [ 'ContinueStatement' ]

.sub 'ContinueStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5255
# Body
# {
.annotate 'line', 5257
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5258
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5259

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5260
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5261
# Body
# {
.annotate 'line', 5263
self.'annotate'(__ARG_1)
.annotate 'line', 5264
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5265
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5266

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5253
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5275
# Body
# {
.annotate 'line', 5277
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5278
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5279

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5280
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5281
# Body
# {
.annotate 'line', 5283
self.'annotate'(__ARG_1)
.annotate 'line', 5284
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5285
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5286

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5273
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5300
# Body
# {
.annotate 'line', 5302
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5303
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5304
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5305
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5306
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5307
$P1 = __ARG_2.'get'()
.annotate 'line', 5308
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5309
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5310
$P1 = __ARG_2.'get'()
.annotate 'line', 5311
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5312
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5313
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5314
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5315
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5316
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5317
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5318
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5319
$P1 = __ARG_2.'get'()
.annotate 'line', 5320
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5321
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5322
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5323
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
.annotate 'line', 5324
__ARG_2.'unget'($P1)
.annotate 'line', 5325
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5327
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5328
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5331
$P1 = __ARG_2.'get'()
.annotate 'line', 5332
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5333
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5334
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
.annotate 'line', 5335
__ARG_2.'unget'($P1)
.annotate 'line', 5336
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5338
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5341

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5342
# Body
# {
.annotate 'line', 5344
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5345
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5346
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5347
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5348
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5349
.return(self)
# }
.annotate 'line', 5350

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5351
# Body
# {
.annotate 'line', 5354
# string type: $S1
set $S1, ''
.annotate 'line', 5355
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5356
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5357
iseq $I3, $S2, 'N'
unless $I3 goto __label_3
.annotate 'line', 5358
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5359
iseq $I3, $S1, ''
unless $I3 goto __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5361
isne $I4, $S1, $S2
unless $I4 goto __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5362
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5365
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5366
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
iseq $I4, $S9, $S1
unless $I4 goto __label_8
.annotate 'line', 5367
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5369
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5370
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5374
self.'genbreaklabel'()
.annotate 'line', 5375
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5376
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5377
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5378
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5379
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5380
$P2.'push'($S7)
.annotate 'line', 5381
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5382
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5384
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5387
__ARG_1.'comment'('switch')
.annotate 'line', 5388
self.'annotate'(__ARG_1)
.annotate 'line', 5389
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5390
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5391
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5392
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5393
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5394
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5395
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5396
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5399
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5400
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5401
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5403
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5404

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5293
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5295
addattribute $P0, 'condition'
.annotate 'line', 5296
addattribute $P0, 'case_value'
.annotate 'line', 5297
addattribute $P0, 'case_st'
.annotate 'line', 5298
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5417
# Body
# {
.annotate 'line', 5419
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5420
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5421
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5422
__ARG_2.'unget'($P1)
.annotate 'line', 5423
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5425
$P1 = __ARG_2.'get'()
.annotate 'line', 5426
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5427
__ARG_2.'unget'($P1)
.annotate 'line', 5428
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P5
.annotate 'line', 5429
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5431
$P1 = __ARG_2.'get'()
.annotate 'line', 5432
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5433
__ARG_2.'unget'($P1)
.annotate 'line', 5434
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P6
.annotate 'line', 5435
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5437
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5438

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5439
# Body
# {
.annotate 'line', 5441
getattribute $P1, self, 'initializer'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5442
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5443
getattribute $P1, self, 'condition'
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 5444
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
__label_1: # endif
.annotate 'line', 5445
getattribute $P5, self, 'iteration'
isnull $I2, $P5
not $I2
unless $I2 goto __label_2
.annotate 'line', 5446
getattribute $P8, self, 'iteration'
$P7 = $P8.'optimize'()
setattribute self, 'iteration', $P7
__label_2: # endif
.annotate 'line', 5447
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5448
.return(self)
# }
.annotate 'line', 5449

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5450
# Body
# {
.annotate 'line', 5452
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5453
getattribute $P2, self, 'condition'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5454
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5455
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5456
.return()
# }
__label_0: # endif
.annotate 'line', 5458
__ARG_1.'comment'('for loop')
.annotate 'line', 5459
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5460
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5461
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5462
getattribute $P4, self, 'initializer'
isnull $I1, $P4
not $I1
unless $I1 goto __label_6
.annotate 'line', 5463
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5464
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5466
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5467
getattribute $P4, self, 'iteration'
isnull $I2, $P4
not $I2
unless $I2 goto __label_7
.annotate 'line', 5468
# string unused: $S4
getattribute $P6, self, 'iteration'
$P5 = $P6.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
__label_7: # endif
.annotate 'line', 5470
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5471
getattribute $P6, self, 'condition'
isnull $I2, $P6
not $I2
unless $I2 goto __label_9
# {
.annotate 'line', 5472
# string regcond: $S5
getattribute $P8, self, 'condition'
$P7 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P7, __label_10
set $S5, $P7
__label_10:
.annotate 'line', 5473
__ARG_1.'say'('unless ', $S5, ' goto ', $S2, ' # for end')
# }
__label_9: # endif
.annotate 'line', 5476
getattribute $P7, self, 'body'
$P7.'emit'(__ARG_1)
.annotate 'line', 5477
__ARG_1.'emitgoto'($S1, 'for iteration')
.annotate 'line', 5479
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5480

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5411
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5413
addattribute $P0, 'initializer'
.annotate 'line', 5414
addattribute $P0, 'condition'
.annotate 'line', 5415
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5492
# Body
# {
.annotate 'line', 5494
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5495
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5496
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5497
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5498
isne $I1, $S2, ''
unless $I1 goto __label_2
# {
.annotate 'line', 5499
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5501
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5503
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5504
setattribute self, 'varname', $P1
.annotate 'line', 5505
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5506
$P2 = __ARG_2.'get'()
.annotate 'line', 5507
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5508
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5509
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5510

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5511
# Body
# {
.annotate 'line', 5513
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 5514
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5515
.return(self)
# }
.annotate 'line', 5516

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5517
# Body
# {
.annotate 'line', 5519
self.'annotate'(__ARG_1)
.annotate 'line', 5520
# string regcont: $S1
null $S1
.annotate 'line', 5521
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
iseq $I1, $S6, 'S'
unless $I1 goto __label_0
# {
.annotate 'line', 5522
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5523
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5524
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5527
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5528
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5529
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5530
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5531
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5532
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5533
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5534
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5535
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5536
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5537
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5538
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5539
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5540

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5487
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5489
addattribute $P0, 'varname'
.annotate 'line', 5490
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5545
# Body
# {
.annotate 'line', 5547
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5548
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5549
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5550
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5551
__ARG_2.'unget'($P3)
.annotate 'line', 5552
__ARG_2.'unget'($P2)
.annotate 'line', 5553
__ARG_2.'unget'($P1)
.annotate 'line', 5554
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5555
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5557
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5558

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5568
# Body
# {
.annotate 'line', 5570
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5571
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5572

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5573
# Body
# {
.annotate 'line', 5575
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5576
.return(self)
# }
.annotate 'line', 5577

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5578
# Body
# {
.annotate 'line', 5580
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5581
self.'annotate'(__ARG_1)
.annotate 'line', 5582
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5583

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5564
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5566
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5597
# Body
# {
.annotate 'line', 5599
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5600
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5601
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5602
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5605
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5607
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5608
$P1 = __ARG_2.'get'()
.annotate 'line', 5609
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5610
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5611
$P1 = __ARG_2.'get'()
.annotate 'line', 5612
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5613
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5614
$P1 = __ARG_2.'get'()
.annotate 'line', 5615
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5616
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5617
setattribute self, 'exname', $P1
.annotate 'line', 5618
self.'createvar'($S1, 'P')
.annotate 'line', 5619
$P1 = __ARG_2.'get'()
.annotate 'line', 5620
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5621
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5623
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5624

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5625
# Body
# {
.annotate 'line', 5627
getattribute $P1, self, 'modifiers'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5628
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5629
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5630
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 5631
.return(self)
# }
.annotate 'line', 5632

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5633
# Body
# {
.annotate 'line', 5635
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5636
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5637
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5638
# string exreg: $S4
null $S4
.annotate 'line', 5639
getattribute $P8, self, 'exname'
isnull $I3, $P8
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 5640
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5641
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5644
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5646
self.'annotate'(__ARG_1)
.annotate 'line', 5647
__ARG_1.'comment'('try: create handler')
.annotate 'line', 5649
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 5650
__ARG_1.'say'('set_addr ', $S1, ', ', $S2)
.annotate 'line', 5652
getattribute $P10, self, 'modifiers'
isnull $I3, $P10
not $I3
unless $I3 goto __label_5
# {
.annotate 'line', 5653
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 5654
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 5655
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 5656
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 5657
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 5660
isne $I4, $I1, 1
unless $I4 goto __label_14
.annotate 'line', 5661
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 5662
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 5663
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 5664
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 5667
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 5668
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5669
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 5670
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5672
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 5673
# string sep: $S7
set $S7, ''
.annotate 'line', 5674
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 5675
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 5676
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 5678
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 5681
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 5686
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 5687
__ARG_1.'comment'('try: begin')
.annotate 'line', 5688
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 5689
__ARG_1.'comment'('try: end')
.annotate 'line', 5691
self.'annotate'(__ARG_1)
.annotate 'line', 5692
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5694
__ARG_1.'comment'('catch')
.annotate 'line', 5695
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5696
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 5697
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 5698
__ARG_1.'say'('pop_eh')
.annotate 'line', 5699
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 5701
__ARG_1.'comment'('catch end')
.annotate 'line', 5702
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 5703

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 5590
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 5592
addattribute $P0, 'stry'
.annotate 'line', 5593
addattribute $P0, 'modifiers'
.annotate 'line', 5594
addattribute $P0, 'exname'
.annotate 'line', 5595
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5714
# Body
# {
.annotate 'line', 5716
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5717
setattribute self, 'name', __ARG_3
.annotate 'line', 5718
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5719
setattribute self, 'reg', $P2
# }
.annotate 'line', 5720

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 5710
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5712
addattribute $P0, 'name'
.annotate 'line', 5713
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5737
# Body
# {
.annotate 'line', 5739
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5740
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5741
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5742
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5743
setattribute self, 'name', $P1
.annotate 'line', 5744
# string reg: $S1
null $S1
.annotate 'line', 5746
$P1 = __ARG_2.'get'()
.annotate 'line', 5747
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 5749
setattribute self, 'typearray', $P5
.annotate 'line', 5750
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 5751
$P1 = __ARG_2.'get'()
.annotate 'line', 5752
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 5754
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 5757
__ARG_2.'unget'($P1)
.annotate 'line', 5758
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 5759
$P1 = __ARG_2.'get'()
.annotate 'line', 5760
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 5761
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 5762
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 5767
setattribute self, 'typearray', $P8
.annotate 'line', 5768
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 5769
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5771
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 5772
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 5776
setattribute self, 'reg', $P11
.annotate 'line', 5777
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 5779
$P1 = __ARG_2.'get'()
.annotate 'line', 5780
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 5781
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 5782
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 5783
$P1 = __ARG_2.'get'()
.annotate 'line', 5784
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 5785
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 5786
# {
.annotate 'line', 5787
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5788
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 5789
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 5790
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 5791
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 5793
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 5795
$P16 = $P1.'isop'(';')
isfalse $I3, $P16
unless $I3 goto __label_14
.annotate 'line', 5796
'SyntaxError'("Expected ';'", $P1)
__label_14: # endif
# }
.annotate 'line', 5797

.end # parse


.sub 'optimize' :method

.annotate 'line', 5798
# Body
# {
.annotate 'line', 5800
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 5801
getattribute $P2, self, 'size'
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
.annotate 'line', 5802
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 5803
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
# {
.annotate 'line', 5804
getattribute $P2, self, 'typearray'
set $I3, $P2
iseq $I2, $I3, 0
unless $I2 goto __label_2
.annotate 'line', 5805
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 5807
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 5809
.return(self)
# }
.annotate 'line', 5810

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5811
# Body
# {
.annotate 'line', 5813
self.'annotate'(__ARG_1)
.annotate 'line', 5814
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 5815
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5816
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 5817
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 5818
# var init: $P1
getattribute $P1, self, 'init'
concat $S13, $S1, ' '
concat $S12, $S13, $S2
concat $S11, $S12, ': '
concat $S10, $S11, $S3
.annotate 'line', 5819
__ARG_1.'comment'($S10)
.annotate 'line', 5821
getattribute $P6, self, 'typearray'
set $I4, $P6
iseq $I3, $I4, 0
unless $I3 goto __label_4
# {
.annotate 'line', 5822
isnull $I5, $P1
if $I5 goto __label_8
$I5 = $P1.'isnull'()
__label_8:
unless $I5 goto __label_6
.annotate 'line', 5823
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 5825
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 5826
iseq $I3, $S5, $S4
unless $I3 goto __label_10
# {
.annotate 'line', 5827
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 5830
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_12
# {
.annotate 'line', 5832
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 5835
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 5836
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 5837
iseq $I5, $S4, 'S'
unless $I5 goto __label_17
iseq $I5, $S5, 'P'
__label_17:
unless $I5 goto __label_15
# {
.annotate 'line', 5838
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 5839
__ARG_1.'emitnull'($S3)
.annotate 'line', 5840
__ARG_1.'say'('if_null ', $S6, ', ', $S7)
.annotate 'line', 5841
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 5842
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 5845
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
.annotate 'line', 5851
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 5852
isnull $I6, $P2
not $I6
unless $I6 goto __label_19
# {
.annotate 'line', 5854
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 5855
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 5859
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 5861
isnull $I6, $P1
not $I6
unless $I6 goto __label_22
# {
.annotate 'line', 5862
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 5863
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 5864
isnull $I7, $P2
unless $I7 goto __label_24
# {
.annotate 'line', 5865
isgt $I8, $I1, 0
unless $I8 goto __label_25
# {
.annotate 'line', 5867
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 5870
# int i: $I2
null $I2
.annotate 'line', 5871
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 5872
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 5873
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 5874
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 5878

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5879
# Body
# {
.annotate 'line', 5881
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 5882

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 5727
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5729
addattribute $P0, 'name'
.annotate 'line', 5730
addattribute $P0, 't_reg'
.annotate 'line', 5731
addattribute $P0, 't_name'
.annotate 'line', 5732
addattribute $P0, 't_array'
.annotate 'line', 5733
addattribute $P0, 'reg'
.annotate 'line', 5734
addattribute $P0, 'typearray'
.annotate 'line', 5735
addattribute $P0, 'size'
.annotate 'line', 5736
addattribute $P0, 'init'
.end
.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5895
# Body
# {
.annotate 'line', 5898
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 5899
setattribute self, 'type', $P1
.annotate 'line', 5900
setattribute self, 'name', __ARG_4
.annotate 'line', 5901
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 5902

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 5903
# Body
# {
.annotate 'line', 5905
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5906
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 5907
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5908
$P1 = $P1.'optimize'()
.annotate 'line', 5909
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5911
getattribute $P4, self, 'start'
.annotate 'line', 5910
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 5913
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 5914
setattribute self, 'value', $P1
.annotate 'line', 5915
.return(self)
# }
.annotate 'line', 5916

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 5917
# Body
# {
.annotate 'line', 5919
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 5920

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5921
# Body
# {
.annotate 'line', 5923
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S3, 'Constant ', $S1
concat $S2, $S3, ' evaluated at compile time'
.annotate 'line', 5924
__ARG_1.'comment'($S2)
# }
.annotate 'line', 5925

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 5889
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5891
addattribute $P0, 'type'
.annotate 'line', 5892
addattribute $P0, 'name'
.annotate 'line', 5893
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5928
# Body
# {
.annotate 'line', 5930
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5931
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 5932
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5933
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 5935
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 5936
# {
.annotate 'line', 5937
$P1 = __ARG_2.'get'()
.annotate 'line', 5938
# var name: $P3
set $P3, $P1
.annotate 'line', 5939
'ExpectOp'('=', __ARG_2)
.annotate 'line', 5940
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 5942
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 5941
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 5943
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 5944
.return($P2)
# }
.annotate 'line', 5945

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5954
# Body
# {
.annotate 'line', 5956
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5957
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5958
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5959
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 5960
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 5962
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 5963
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5964

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 5965
# Body
# {
.annotate 'line', 5967
getattribute $P1, self, 'init'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5968
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 5969
.return(self)
# }
.annotate 'line', 5970

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 5971
# Body
# {
.annotate 'line', 5973
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5974

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5975
# Body
# {
.annotate 'line', 5977
self.'annotate'(__ARG_1)
.annotate 'line', 5978
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 5979
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 5980
# var init: $P1
getattribute $P1, self, 'init'
concat $S7, 'var ', $S1
concat $S6, $S7, ': '
concat $S5, $S6, $S2
.annotate 'line', 5981
__ARG_1.'comment'($S5)
.annotate 'line', 5982
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
.annotate 'line', 5983
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 5985
isnull $I1, $P1
not $I1
unless $I1 goto __label_4
# {
.annotate 'line', 5986
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 5987
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
.annotate 'line', 5989
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 5994
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 5995
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 5996
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 5999
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6003
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6004

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 5951
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 5953
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6009
# Body
# {
.annotate 'line', 6011
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6012
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6013
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6014
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6015

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6016
# Body
# {
.annotate 'line', 6018
self.'annotate'(__ARG_1)
.annotate 'line', 6019
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6020
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S5, 'var ', $S1
concat $S4, $S5, '[] : '
concat $S3, $S4, $S2
.annotate 'line', 6021
__ARG_1.'comment'($S3)
.annotate 'line', 6022
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6023

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6007
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6030
# Body
# {
.annotate 'line', 6032
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6033
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6034
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6035
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6036
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6037
$P1 = __ARG_2.'get'()
.annotate 'line', 6038
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6039
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6040

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6041
# Body
# {
.annotate 'line', 6043
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6044
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6045

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6046
# Body
# {
.annotate 'line', 6048
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6049
self.'annotate'(__ARG_1)
.annotate 'line', 6050
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6051
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S6, 'var ', $S2
concat $S5, $S6, '[] : '
concat $S4, $S5, $S3
.annotate 'line', 6052
__ARG_1.'comment'($S4)
.annotate 'line', 6053
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6054

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6026
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6028
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6057
# Body
# {
.annotate 'line', 6059
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6060
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6061
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6062
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6063
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6064
$P2 = __ARG_2.'get'()
.annotate 'line', 6065
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6066
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6068
__ARG_2.'unget'($P2)
.annotate 'line', 6069
new $P5, [ 'FixedVarStatement' ]
$P5.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 6073
__ARG_2.'unget'($P2)
.annotate 'line', 6074
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6076

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6084
# Body
# {
box $P1, 'S'
.annotate 'line', 6086
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6087
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6088
setattribute self, 't_array', $P2
.annotate 'line', 6089
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6090

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6091
# Body
# {
.annotate 'line', 6093
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6094

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6082
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6103
# Body
# {
box $P1, 'I'
.annotate 'line', 6105
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6106
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6107
setattribute self, 't_array', $P2
.annotate 'line', 6108
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6109

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6110
# Body
# {
.annotate 'line', 6112
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6113

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6101
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6122
# Body
# {
box $P1, 'N'
.annotate 'line', 6124
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6125
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6126
setattribute self, 't_array', $P2
.annotate 'line', 6127
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6128

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6129
# Body
# {
.annotate 'line', 6131
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6132

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6120
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6146
# Body
# {
.annotate 'line', 6148
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6149
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6150
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6151
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6152
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6153
__ARG_2.'unget'($P1)
.annotate 'line', 6154
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6155
isnull $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6156
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6157
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6159
setattribute self, 'end', $P1
# }
.annotate 'line', 6160

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6161
# Body
# {
.annotate 'line', 6163
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6164
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6165
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6166
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6167
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6168
.return($S2)
# }
.annotate 'line', 6169

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6170
# Body
# {
.annotate 'line', 6172
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6173
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6174
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6175
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6176
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6177
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6178
$P1[$S1] = $S3
.annotate 'line', 6179
.return($S3)
# }
.annotate 'line', 6180

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6181
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6182
# Body
# {
.annotate 'line', 6184
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6185
.return(self)
# }
.annotate 'line', 6186

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6187
# Body
# {
.annotate 'line', 6189
__ARG_1.'comment'('{')
.annotate 'line', 6190
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6191
$P1.'emit'(__ARG_1)
.annotate 'line', 6192
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6194
__ARG_1.'comment'('}')
# }
.annotate 'line', 6195

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6139
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6141
addattribute $P0, 'statements'
.annotate 'line', 6142
addattribute $P0, 'end'
.annotate 'line', 6143
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6208
# Body
# {
box $P3, 1
.annotate 'line', 6211
setattribute self, 'nreg', $P3
.annotate 'line', 6212
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6213
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6214
setattribute self, 'tempreg', $P1
.annotate 'line', 6215
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6216

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6217
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6219
setattribute self, 'type', $P1
.annotate 'line', 6220
.return(self)
# }
.annotate 'line', 6221

.end # settype


.sub 'createreg' :method

.annotate 'line', 6222
# Body
# {
.annotate 'line', 6224
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6225
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6226
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6228
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S3, '$', $S2
concat $S1, $S3, $S1
.annotate 'line', 6230
.return($S1)
# }
.annotate 'line', 6231

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6232
# Body
# {
.annotate 'line', 6234
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6235
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6236
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6237
# string reg: $S1
null $S1
.annotate 'line', 6238
isgt $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 6239
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6241
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6242
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6244
.return($S1)
# }
.annotate 'line', 6245

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6246
# Body
# {
.annotate 'line', 6248
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6249
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6250
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6251
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6252

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6204
addattribute $P0, 'type'
.annotate 'line', 6205
addattribute $P0, 'nreg'
.annotate 'line', 6206
addattribute $P0, 'tempreg'
.annotate 'line', 6207
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6274
# Body
# {
.annotate 'line', 6276
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6277
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6278
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6279
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6280
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6281

.end # init


.sub 'ismethod' :method

.annotate 'line', 6282
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6283
# Body
# {
.annotate 'line', 6285
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6286
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
.annotate 'line', 6288
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6290
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6292
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6294
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6296
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6298
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6299
.return($S1)
# }
.annotate 'line', 6300

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6301
# Body
# {
.annotate 'line', 6303
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6304
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
.annotate 'line', 6306
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6308
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6310
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6312
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6314
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6316
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6317
.return($S1)
# }
.annotate 'line', 6318

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6319
# Body
# {
.annotate 'line', 6321
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
.annotate 'line', 6322
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6323

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6324
# Body
# {
.annotate 'line', 6326
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6327
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6328
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6330
.return($S1)
# }
.annotate 'line', 6331

.end # genlabel


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6332
# Body
# {
.annotate 'line', 6334
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6335
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6336
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6338
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6339

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6341
# Body
# {
.annotate 'line', 6343
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6344
.return(self)
# }
.annotate 'line', 6345

.end # optimize


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6347
# Body
# {
.annotate 'line', 6349
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 6350
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6351
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 6352
__ARG_1.'unget'($P1)
.annotate 'line', 6353
# int argnum: $I1
null $I1
__label_1: # do
.annotate 'line', 6354
# {
.annotate 'line', 6355
$P1 = __ARG_1.'get'()
.annotate 'line', 6356
# string type: $S1
$P6 = $P1.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6357
isne $I2, $S1, ''
unless $I2 goto __label_5
.annotate 'line', 6358
$P1 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6361
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S2, '__ARG_', $S4
.annotate 'line', 6362
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6364
# string varname: $S3
set $P7, $P1
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6365
# var arg: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 6366
$P2['name'] = $S3
.annotate 'line', 6367
$P1 = __ARG_1.'get'()
.annotate 'line', 6368
$P7 = $P1.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6369
# var modifiers: $P3
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, self)
set $P3, $P8
.annotate 'line', 6370
$P2['modifiers'] = $P3
.annotate 'line', 6371
$P1 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6373
getattribute $P8, self, 'args'
$P8.'push'($P2)
# }
.annotate 'line', 6374
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 6375
$P9 = $P1.'isop'(')')
isfalse $I3, $P9
unless $I3 goto __label_9
.annotate 'line', 6376
'SyntaxError'("Expected ')'", $P1)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6378

.end # parse_parameters


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6380
# Body
# {
.annotate 'line', 6382
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6383
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6384
setattribute self, 'name', $P1
box $P3, 0
.annotate 'line', 6385
setattribute self, 'isanon', $P3
.annotate 'line', 6386
$P1 = __ARG_2.'get'()
.annotate 'line', 6387
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6388
# var modifiers: $P2
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 6389
setattribute self, 'modifiers', $P2
.annotate 'line', 6390
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6392
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 6393
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6394
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6396
$P1 = __ARG_2.'get'()
.annotate 'line', 6397
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_2
.annotate 'line', 6398
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 6399
new $P8, [ 'CompoundStatement' ]
$P8.'CompoundStatement'($P1, __ARG_2, self)
set $P7, $P8
setattribute self, 'body', $P7
.annotate 'line', 6400
.return(self)
# }
.annotate 'line', 6401

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6402
# Body
# {
.annotate 'line', 6404
# string name: $S1
getattribute $P16, self, 'name'
null $S1
if_null $P16, __label_0
set $S1, $P16
__label_0:
.annotate 'line', 6405
__ARG_1.'say'()
.annotate 'line', 6406
__ARG_1.'print'(".sub ")
.annotate 'line', 6407
getattribute $P16, self, 'isanon'
isfalse $I5, $P16
unless $I5 goto __label_1
.annotate 'line', 6408
__ARG_1.'print'("'", $S1, "'")
goto __label_2
__label_1: # else
.annotate 'line', 6410
__ARG_1.'print'("'' :anon")
__label_2: # endif
.annotate 'line', 6411
getattribute $P17, self, 'subid'
isnull $I5, $P17
not $I5
unless $I5 goto __label_3
.annotate 'line', 6412
getattribute $P18, self, 'subid'
__ARG_1.'print'(" :subid('", $P18, "')")
__label_3: # endif
.annotate 'line', 6415
$P17 = self.'ismethod'()
if_null $P17, __label_4
unless $P17 goto __label_4
.annotate 'line', 6416
__ARG_1.'print'(' :method')
__label_4: # endif
.annotate 'line', 6417
# var modifiers: $P1
getattribute $P1, self, 'modifiers'
.annotate 'line', 6418
isnull $I6, $P1
not $I6
unless $I6 goto __label_5
# {
.annotate 'line', 6419
# var mlist: $P2
$P2 = $P1.'getlist'()
.annotate 'line', 6420
iter $P19, $P2
set $P19, 0
__label_7: # for iteration
unless $P19 goto __label_8
shift $P3, $P19
# {
.annotate 'line', 6421
# int nargmods: $I1
$P18 = $P3.'numargs'()
set $I1, $P18
.annotate 'line', 6422
$P20 = $P3.'getname'()
__ARG_1.'print'(' :', $P20)
.annotate 'line', 6423
isgt $I6, $I1, 0
unless $I6 goto __label_9
# {
.annotate 'line', 6424
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6425
# int iargmod: $I2
null $I2
goto __label_12
__label_10: # for iteration
inc $I2
__label_12: # for condition
islt $I7, $I2, $I1
unless $I7 goto __label_11 # for end
# {
.annotate 'line', 6426
# var argmod: $P4
$P4 = $P3.'getarg'($I2)
.annotate 'line', 6427
$P20 = $P4.'isstringliteral'()
isfalse $I7, $P20
unless $I7 goto __label_13
.annotate 'line', 6428
getattribute $P21, $P4, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_13: # endif
.annotate 'line', 6429
$P21 = $P4.'getPirString'()
__ARG_1.'print'($P21)
# }
goto __label_10 # for iteration
__label_11: # for end
.annotate 'line', 6431
__ARG_1.'print'(')')
# }
__label_9: # endif
# }
goto __label_7
__label_8: # endfor
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 6436
iseq $I8, $S1, 'main'
unless $I8 goto __label_14
.annotate 'line', 6437
__ARG_1.'print'(' :main')
__label_14: # endif
# }
__label_6: # endif
.annotate 'line', 6439
__ARG_1.'say'()
.annotate 'line', 6441
# var args: $P5
getattribute $P5, self, 'args'
.annotate 'line', 6442
# var arg: $P6
null $P6
.annotate 'line', 6443
# string argname: $S2
null $S2
.annotate 'line', 6444
# var a: $P7
null $P7
.annotate 'line', 6446
iter $P22, $P5
set $P22, 0
__label_15: # for iteration
unless $P22 goto __label_16
shift $P6, $P22
# {
.annotate 'line', 6447
$S2 = $P6['name']
.annotate 'line', 6448
$P7 = self.'getvar'($S2)
.annotate 'line', 6449
# string ptype: $S3
$P24 = $P7['type']
$P23 = 'typetopirname'($P24)
null $S3
if_null $P23, __label_17
set $S3, $P23
__label_17:
$P23 = $P7['reg']
.annotate 'line', 6450
__ARG_1.'print'('.param ', $S3, ' ', $P23)
.annotate 'line', 6451
# var modarg: $P8
$P8 = $P6['modifiers']
.annotate 'line', 6452
isnull $I8, $P8
not $I8
unless $I8 goto __label_18
# {
.annotate 'line', 6453
# var named: $P9
null $P9
.annotate 'line', 6454
# var slurpy: $P10
null $P10
.annotate 'line', 6455
# var modarglist: $P11
$P11 = $P8.'getlist'()
.annotate 'line', 6456
iter $P25, $P11
set $P25, 0
__label_19: # for iteration
unless $P25 goto __label_20
shift $P12, $P25
# {
.annotate 'line', 6457
# string modname: $S4
$P24 = $P12.'getname'()
null $S4
if_null $P24, __label_21
set $S4, $P24
__label_21:
set $S6, $S4
set $S7, 'named'
.annotate 'line', 6458
if $S6 == $S7 goto __label_24
set $S7, 'slurpy'
if $S6 == $S7 goto __label_25
goto __label_23
# switch
__label_24: # case
set $P9, $P12
goto __label_22 # break
__label_25: # case
set $P10, $P12
goto __label_22 # break
__label_23: # default
.annotate 'line', 6466
__ARG_1.'print'(' :', $S4)
__label_22: # switch end
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6469
isnull $I9, $P9
not $I9
unless $I9 goto __label_28
isnull $I9, $P10
not $I9
__label_28:
unless $I9 goto __label_26
# {
.annotate 'line', 6474
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_27
__label_26: # else
# {
.annotate 'line', 6477
isnull $I9, $P9
not $I9
unless $I9 goto __label_29
# {
.annotate 'line', 6478
# string setname: $S5
null $S5
.annotate 'line', 6479
# int nargs: $I3
$P26 = $P9.'numargs'()
set $I3, $P26
set $I10, $I3
null $I11
.annotate 'line', 6480
if $I10 == $I11 goto __label_33
set $I11, 1
if $I10 == $I11 goto __label_34
goto __label_32
# switch
__label_33: # case
concat $S6, "'", $S2
concat $S5, $S6, "'"
goto __label_31 # break
__label_34: # case
.annotate 'line', 6485
# var argmod: $P13
$P13 = $P9.'getarg'(0)
.annotate 'line', 6486
$P26 = $P13.'isstringliteral'()
isfalse $I12, $P26
unless $I12 goto __label_35
.annotate 'line', 6487
getattribute $P27, self, 'start'
'SyntaxError'('Invalid modifier', $P27)
__label_35: # endif
.annotate 'line', 6488
$P28 = $P13.'getPirString'()
set $S5, $P28
goto __label_31 # break
__label_32: # default
.annotate 'line', 6491
getattribute $P29, self, 'start'
'SyntaxError'('Invalid modifier', $P29)
__label_31: # switch end
.annotate 'line', 6493
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_30
__label_29: # else
.annotate 'line', 6495
isnull $I10, $P10
not $I10
unless $I10 goto __label_36
# {
.annotate 'line', 6496
__ARG_1.'print'(" :slurpy")
# }
__label_36: # endif
__label_30: # endif
# }
__label_27: # endif
# }
__label_18: # endif
.annotate 'line', 6500
__ARG_1.'say'('')
# }
goto __label_15
__label_16: # endfor
.annotate 'line', 6502
__ARG_1.'say'()
.annotate 'line', 6503
getattribute $P27, self, 'start'
__ARG_1.'annotate'($P27)
.annotate 'line', 6504
__ARG_1.'comment'('Body')
.annotate 'line', 6505
getattribute $P28, self, 'body'
$P28.'emit'(__ARG_1)
.annotate 'line', 6507
getattribute $P30, self, 'body'
$P29 = $P30.'getend'()
__ARG_1.'annotate'($P29)
.annotate 'line', 6508
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 6511
# var localfun: $P14
getattribute $P14, self, 'localfun'
.annotate 'line', 6512
isnull $I11, $P14
not $I11
unless $I11 goto __label_37
# {
# for loop
.annotate 'line', 6514
# int ifn: $I4
null $I4
goto __label_40
__label_38: # for iteration
inc $I4
__label_40: # for condition
# predefined elements
elements $I13, $P14
islt $I12, $I4, $I13
unless $I12 goto __label_39 # for end
# {
.annotate 'line', 6515
# var fn: $P15
$P15 = $P14[$I4]
.annotate 'line', 6516
$P15.'emit'(__ARG_1)
# }
goto __label_38 # for iteration
__label_39: # for end
# }
__label_37: # endif
# }
.annotate 'line', 6519

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6520
# Body
# {
.annotate 'line', 6522
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6523

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6524
# Body
# {
.annotate 'line', 6526
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6527

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6259
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6261
addattribute $P0, 'name'
.annotate 'line', 6262
addattribute $P0, 'subid'
.annotate 'line', 6263
addattribute $P0, 'isanon'
.annotate 'line', 6264
addattribute $P0, 'modifiers'
.annotate 'line', 6265
addattribute $P0, 'args'
.annotate 'line', 6266
addattribute $P0, 'body'
.annotate 'line', 6267
addattribute $P0, 'regstI'
.annotate 'line', 6268
addattribute $P0, 'regstN'
.annotate 'line', 6269
addattribute $P0, 'regstS'
.annotate 'line', 6270
addattribute $P0, 'regstP'
.annotate 'line', 6271
addattribute $P0, 'nlabel'
.annotate 'line', 6272
addattribute $P0, 'localfun'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6536
# Body
# {
.annotate 'line', 6538
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6539
# string subid: $S1
$P2 = __ARG_3.'createsubid'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
box $P2, $S1
.annotate 'line', 6540
setattribute self, 'subid', $P2
box $P3, $S1
.annotate 'line', 6541
setattribute self, 'name', $P3
box $P3, 1
.annotate 'line', 6542
setattribute self, 'isanon', $P3
.annotate 'line', 6543
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6544
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6545
$P4 = $P1.'isop'('{')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 6546
'Expected'('{', $P1)
__label_1: # endif
.annotate 'line', 6547
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_2, self)
set $P5, $P6
setattribute self, 'body', $P5
.annotate 'line', 6548
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 6549

.end # LocalFunctionStatement


.sub 'getsubid' :method

.annotate 'line', 6550
# Body
# {
.annotate 'line', 6552
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 6553

.end # getsubid

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 6534
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 6562
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 6560
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ ]
# Constant CLASSSPECIFIER_invalid evaluated at compile time
# Constant CLASSSPECIFIER_str evaluated at compile time
# Constant CLASSSPECIFIER_parrotkey evaluated at compile time
# Constant CLASSSPECIFIER_id evaluated at compile time
.namespace [ 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6578
# Body
# {
.annotate 'line', 6580
setattribute self, 'owner', __ARG_1
.annotate 'line', 6581
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 6582

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 6583
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 6585
# Body
# {
.annotate 'line', 6587
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 6588

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 6576
addattribute $P0, 'owner'
.annotate 'line', 6577
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6594
# Body
# {
.annotate 'line', 6596
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 6597
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 6598

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 6599
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6601
# Body
# {
.annotate 'line', 6603
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6604
__ARG_1.'print'($S1)
# }
.annotate 'line', 6605

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 6591
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 6593
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6612
# Body
# {
.annotate 'line', 6614
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 6615
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 6616
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 6617
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6618
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 6619
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 6620
$P2 = __ARG_1.'get'()
.annotate 'line', 6621
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_1
# {
.annotate 'line', 6622
$P6 = $P2.'checkop'()
set $S1, $P6
set $S2, ':'
if $S1 == $S2 goto __label_4
set $S2, ','
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
box $P7, 1
.annotate 'line', 6624
setattribute self, 'hll', $P7
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 6628
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 6630
# {
.annotate 'line', 6631
$P2 = __ARG_1.'get'()
.annotate 'line', 6632
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 6633
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 6634
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 6635
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 6636
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_10
.annotate 'line', 6637
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 6639
setattribute self, 'key', $P1
# }
.annotate 'line', 6640

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 6641
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 6642
# Body
# {
.annotate 'line', 6644
getattribute $P1, self, 'hll'
isnull $I2, $P1
not $I2
# predefined int
$I1 = $I2
.return($I1)
# }
.annotate 'line', 6645

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6647
# Body
# {
.annotate 'line', 6649
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 6650

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 6608
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 6610
addattribute $P0, 'key'
.annotate 'line', 6611
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6656
# Body
# {
.annotate 'line', 6658
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 6659
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
$S1 = __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 6660
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6661
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 6662
$P2 = __ARG_1.'get'()
# predefined string
.annotate 'line', 6663
$S1 = $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6665
__ARG_1.'unget'($P2)
.annotate 'line', 6666
setattribute self, 'key', $P1
# }
.annotate 'line', 6667

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 6668
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 6670
# Body
# {
.annotate 'line', 6672
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 6673
.return($P2)
# }
.annotate 'line', 6674

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6676
# Body
# {
.annotate 'line', 6678
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 6679
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6680
getattribute $P2, self, 'key'
# predefined join
join $S3, ".", $P2
concat $S2, "class ", $S3
concat $S1, $S2, " not found at compile time"
'Warn'($S1)
.annotate 'line', 6681
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6683
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 6684

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 6653
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 6655
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6687
# Body
# {
.annotate 'line', 6689
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6690
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6691
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 6692
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 6693
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 6694
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 6695
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 6696
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 6697

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6714
# Body
# {
.annotate 'line', 6716
setattribute self, 'parent', __ARG_2
.annotate 'line', 6717
setattribute self, 'owner', __ARG_2
.annotate 'line', 6718
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 6719
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 6720
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 6721
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 6723
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6724
setattribute self, 'name', $P1
.annotate 'line', 6725
$P1 = __ARG_1.'get'()
.annotate 'line', 6726
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 6727
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 6728
# {
.annotate 'line', 6729
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 6730
$P2.'push'($P3)
.annotate 'line', 6731
$P1 = __ARG_1.'get'()
.annotate 'line', 6732
$P18 = $P1.'isop'(',')
isfalse $I1, $P18
unless $I1 goto __label_3
goto __label_1 # break
__label_3: # endif
# }
goto __label_2
__label_1: # Infinite loop end
# }
__label_0: # endif
.annotate 'line', 6735
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 6736
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 6737
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 6738
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 6739
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 6740
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 6741
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 6742
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6744
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 6745
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 6746
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 6747
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 6748
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 6749
$P1 = __ARG_1.'get'()
.annotate 'line', 6750
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 6751
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 6753
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 6754
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6755
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 6756
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6759
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 6760
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 6762
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 6763
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 6764
setattribute self, 'classns', $P9
# }
.annotate 'line', 6765

.end # ClassStatement


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6766
# Body
# {
.annotate 'line', 6768
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 6769

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6770
# Body
# {
.annotate 'line', 6772
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6773

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 6774
# Body
# {
.annotate 'line', 6776
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 6777
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 6778
.return(self)
# }
.annotate 'line', 6779

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 6780
# Body
# {
.annotate 'line', 6782
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 6783

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6784
# Body
# {
.annotate 'line', 6786
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 6787
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 6788
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 6789
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6791
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 6793
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 6794
# int n: $I1
set $I1, 1
.annotate 'line', 6795
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 6796
$P3.'annotate'(__ARG_1)
.annotate 'line', 6797
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 6798
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 6799
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 6800
__ARG_1.'say'()
.annotate 'line', 6801
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 6803
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 6804
__ARG_1.'annotate'($P4)
.annotate 'line', 6805
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 6808
__ARG_1.'say'('.end')
# }
.annotate 'line', 6809

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 6703
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 6705
addattribute $P0, 'parent'
.annotate 'line', 6706
addattribute $P0, 'owner'
.annotate 'line', 6707
addattribute $P0, 'name'
.annotate 'line', 6708
addattribute $P0, 'bases'
.annotate 'line', 6709
addattribute $P0, 'constants'
.annotate 'line', 6710
addattribute $P0, 'functions'
.annotate 'line', 6711
addattribute $P0, 'members'
.annotate 'line', 6712
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6816
# Body
# {
.annotate 'line', 6818
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6819
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 6820
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 6821
'ExpectOp'(';', __ARG_2)
.annotate 'line', 6822
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 6823
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 6828
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 6829
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 6830
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 6831
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 6832
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 6833
# try: create handler
new $P11, 'ExceptionHandler'
set_addr $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 6834
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 6835
# }
# try: end
goto __label_5
.annotate 'line', 6833
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
.annotate 'line', 6840
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 6841
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 6846
load_bytecode 'PGE.pbc'
.annotate 'line', 6847
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 6848
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 6850
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
.annotate 'line', 6851
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6852
$P8 = $P7($S4)
.annotate 'line', 6853
# predefined elements
elements $I4, $P8
isgt $I3, $I4, 0
unless $I3 goto __label_11
# {
.annotate 'line', 6854
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 6855
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 6856
# int ivalue: $I1
null $I1
.annotate 'line', 6857
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6858
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 6863
$P16 = 'newTokenFrom'(5, $S5, __ARG_1)
.annotate 'line', 6862
$P15 = 'integerValue'(__ARG_3, $P16, $I1)
.annotate 'line', 6861
__ARG_3.'createconst'($S5, 'I', $P15, '')
# }
__label_11: # endif
# }
goto __label_7 # for iteration
__label_8: # for end
.annotate 'line', 6867
$P5.'close'()
# }
.annotate 'line', 6868

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 6880
# Body
# {
.annotate 'line', 6882
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 6883
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 6884
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 6885
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 6886

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 6887
# Body
# {
.annotate 'line', 6889
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 6890
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 6891
getattribute $P4, $P2, 'name'
$S1 = $P4
iseq $I1, $S1, __ARG_1
unless $I1 goto __label_2
.annotate 'line', 6892
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 6893
.return($P4)
# }
.annotate 'line', 6894

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 6895
# Body
# {
# predefined elements
.annotate 'line', 6899
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 6901
.return($P5)
__label_3: # case
.annotate 'line', 6904
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 6909
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 6910
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 6911
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 6912
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 6913
getattribute $P9, $P3, 'name'
$S2 = $P9
iseq $I3, $S2, $S1
unless $I3 goto __label_7
# {
.annotate 'line', 6915
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 6916
isnull $I1, $P4
not $I1
unless $I1 goto __label_8
.annotate 'line', 6917
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 6921
.return($P5)
# }
.annotate 'line', 6922

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 6923
# Body
# {
.annotate 'line', 6925
# int balance1: $I1
null $I1
.annotate 'line', 6926
# int balance2: $I2
null $I2
.annotate 'line', 6927
# int balance3: $I3
null $I3
.annotate 'line', 6928
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6929
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 6931
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 6933
# var start: $P2
set $P2, $P1
.annotate 'line', 6934
$P1 = __ARG_1.'get'()
.annotate 'line', 6935
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 6936
$P1 = __ARG_1.'get'()
.annotate 'line', 6938
# var modifier: $P3
null $P3
.annotate 'line', 6939
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 6940
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 6941
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 6944
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 6945
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 6946
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 6947
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 6948
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 6949
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 6951
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 6952
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6953
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6955
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 6956
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 6957
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 6958
$P7.'push'($P6)
.annotate 'line', 6959
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 6961
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 6962
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 6963
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 6964
$P9.'push'($P8)
.annotate 'line', 6965
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 6967
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 6968
$P1 = __ARG_1.'get'()
.annotate 'line', 6969
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 6970
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 6971
$P1 = __ARG_1.'get'()
.annotate 'line', 6972
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 6973
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 6974
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 6975
self.'addlib'($S2)
.annotate 'line', 6976
$P1 = __ARG_1.'get'()
.annotate 'line', 6977
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6979
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 6980
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6982
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 6983
$P1 = __ARG_1.'get'()
.annotate 'line', 6984
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 6985
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 6986
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 6987
self.'addload'($S3)
.annotate 'line', 6988
$P1 = __ARG_1.'get'()
.annotate 'line', 6989
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 6991
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 6992
self.'close_ns'($P1)
.annotate 'line', 6993
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 6996
'SyntaxError'("Unexpected token", $P1)
__label_25: # endif
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
.annotate 'line', 6998
self.'unclosed_ns'()
# }
.annotate 'line', 6999

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7000
# Body
# {
.annotate 'line', 7002
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7003

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7004
# Body
# {
.annotate 'line', 7006
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7007
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7009
# int activate: $I1
set $I1, 1
.annotate 'line', 7010
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7011
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7012
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 7015
unless $I1 goto __label_6
# {
.annotate 'line', 7016
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7017
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7019
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7021

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 6872
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 6874
addattribute $P0, 'namespaces'
.annotate 'line', 6875
addattribute $P0, 'classes'
.annotate 'line', 6876
addattribute $P0, 'functions'
.annotate 'line', 6877
addattribute $P0, 'items'
.annotate 'line', 6878
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7036
# Body
# {
.annotate 'line', 7039
setattribute self, 'parent', __ARG_1
.annotate 'line', 7040
setattribute self, 'start', __ARG_2
.annotate 'line', 7041
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7042
setattribute self, 'name', $P2
.annotate 'line', 7043
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7044
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 7045
$P3 = __ARG_4.'pick'('HLL')
isnull $I2, $P3
not $I2
unless $I2 goto __label_1
.annotate 'line', 7046
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7048

.end # NamespaceStatement


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7049
# Body
# {
.annotate 'line', 7051
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7052

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7053
# Body
# {
.annotate 'line', 7055
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7056
getattribute $P2, self, 'hll'
isnull $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 7057
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7058
.return($P1)
# }
.annotate 'line', 7059

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7060
# Body
# {
.annotate 'line', 7062
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7063

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7064
# Body
# {
.annotate 'line', 7066
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7067

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7068
# Body
# {
.annotate 'line', 7070
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7071
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 7072
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7074
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7075

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7076
# Body
# {
.annotate 'line', 7080
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7081
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 7082
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7083
.return($P1)
# }
.annotate 'line', 7084

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7085
# Body
# {
.annotate 'line', 7087
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7088

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7089
# Body
# {
# }
.annotate 'line', 7092

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7093
# Body
# {
.annotate 'line', 7095
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7096
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 7097
$P1 = $P1.'optimize'()
.annotate 'line', 7098
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7100
self.'optimize_base'()
.annotate 'line', 7101
.return(self)
# }
.annotate 'line', 7102

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7103
# Body
# {
.annotate 'line', 7105
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7106
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 7107
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7109
self.'emit_base'(__ARG_1)
.annotate 'line', 7111
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 7112
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7113

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7028
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7030
addattribute $P0, 'parent'
.annotate 'line', 7031
addattribute $P0, 'start'
.annotate 'line', 7032
addattribute $P0, 'name'
.annotate 'line', 7033
addattribute $P0, 'modifier'
.annotate 'line', 7034
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7127
# Body
# {
.annotate 'line', 7129
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7130
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7131

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7132
# Body
# {
.annotate 'line', 7134
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7135
$P1[__ARG_1] = 1
# }
.annotate 'line', 7136

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7137
# Body
# {
.annotate 'line', 7139
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7140
isnull $I2, $P2
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7141

.end # predef_is_used


.sub 'createsubid' :method

.annotate 'line', 7143
# Body
# {
.annotate 'line', 7145
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7146
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7147
inc $I1
assign $P1, $I1
.annotate 'line', 7149
# string id: $S1
# predefined string
$S2 = $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 7150
.return($S1)
# }
.annotate 'line', 7151

.end # createsubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7153
# Body
# {
.annotate 'line', 7155
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7156
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 7157
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7158
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7160
$P1[__ARG_1] = 1
# }
.annotate 'line', 7161

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7162
# Body
# {
.annotate 'line', 7164
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7165
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 7166
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7167
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7169
$P1[__ARG_1] = 1
# }
.annotate 'line', 7170

.end # addload


.sub 'getpath' :method

.annotate 'line', 7171
# Body
# {
.annotate 'line', 7173
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7174
.return($P1)
# }
.annotate 'line', 7175

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7176
# Body
# {
.annotate 'line', 7178
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7179

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7180
# Body
# {
.annotate 'line', 7183
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7184

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7185
# Body
# {
# }
.annotate 'line', 7188

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7189
# Body
# {
.annotate 'line', 7191
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7192

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7193
# Body
# {
.annotate 'line', 7195
self.'optimize_base'()
.annotate 'line', 7196
.return(self)
# }
.annotate 'line', 7197

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7198
# Body
# {
.annotate 'line', 7200
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7203
$P5 = $P1['chomp']
isnull $I3, $P5
not $I3
unless $I3 goto __label_0
.annotate 'line', 7204
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 7207
# string trfuncs: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
set $P2, 9
set $S4, 'acos'
$P2[0] = $S4
set $S4, 'asin'
$P2[1] = $S4
set $S4, 'atan'
$P2[2] = $S4
set $S4, 'cos'
$P2[3] = $S4
set $S4, 'exp'
$P2[4] = $S4
set $S4, 'ln'
$P2[5] = $S4
set $S4, 'sin'
$P2[6] = $S4
set $S4, 'tan'
$P2[7] = $S4
set $S4, 'pow'
$P2[8] = $S4
.annotate 'line', 7210
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7211
$P5 = $P1[$S1]
isnull $I3, $P5
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 7212
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7213
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7216
# int somelib: $I1
null $I1
.annotate 'line', 7217
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7218
isnull $I4, $P3
not $I4
unless $I4 goto __label_4
# {
set $I1, 1
.annotate 'line', 7220
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7221
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7224
# int someload: $I2
null $I2
.annotate 'line', 7225
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7226
isnull $I4, $P4
not $I4
unless $I4 goto __label_7
# {
set $I2, 1
.annotate 'line', 7228
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7229
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7230
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7231
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I6, $I1
set $I7, $I2
.annotate 'line', 7233
or $I5, $I6, $I7
unless $I5 goto __label_10
.annotate 'line', 7234
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7236
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7237

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7120
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7122
addattribute $P0, 'predefs_used'
.annotate 'line', 7123
addattribute $P0, 'libs'
.annotate 'line', 7124
addattribute $P0, 'loads'
.annotate 'line', 7125
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7249
# Body
# {
.annotate 'line', 7251
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7254
# var taux: $P2
$P2 = 'newToken'(4, 'predefconst', 0, '__predefconst__')
.annotate 'line', 7258
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7257
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7256
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7262
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7261
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 7260
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 7268
new $P6, [ 'StringLiteral' ]
# predefined int
.annotate 'line', 7269
$I2 = "2"
add $I1, $I2, 1
# predefined string
$S1 = $I1
$P7 = 'newTokenFrom'(2, $S1, $P2)
$P6.'StringLiteral'($P1, $P7)
set $P5, $P6
.annotate 'line', 7267
$P1.'createconst'('__STAGE__', 'S', $P5, '')
.annotate 'line', 7272
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7273

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7274
# Body
# {
.annotate 'line', 7276
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7277

.end # parse


.sub 'optimize' :method

.annotate 'line', 7278
# Body
# {
.annotate 'line', 7280
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7281

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7282
# Body
# {
.annotate 'line', 7284
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7285
__ARG_1.'say'('')
.annotate 'line', 7287
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7289
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7290

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7248
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7297
# Body
# {
.annotate 'line', 7299
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 7301
$P1.'open'('__eval__', 'w')
.annotate 'line', 7302
$P1.'puts'(__ARG_1)
.annotate 'line', 7303
$P1.'close'()
.annotate 'line', 7304
$P1.'open'('__eval__', 'r')
.annotate 'line', 7305
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7306
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7307
$P3.'parse'($P2)
.annotate 'line', 7308
$P1.'close'()
.annotate 'line', 7309
$P3.'optimize'()
.annotate 'line', 7310
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7311
$P4.'open'('__eval__', 'w')
.annotate 'line', 7312
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7313
$P5.'initialize'($P4)
.annotate 'line', 7314
$P3.'emit'($P5)
.annotate 'line', 7315
$P5.'close'()
.annotate 'line', 7316
$P4.'close'()
.annotate 'line', 7317
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7318
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7319
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7320
.return($P7)
# }
.annotate 'line', 7321

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7322
# Body
# {
.annotate 'line', 7324
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7325
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7326
$P1.'encoding'('utf8')
.annotate 'line', 7327
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7328
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7329
$P3.'parse'($P2)
.annotate 'line', 7330
$P1.'close'()
.annotate 'line', 7331
$P3.'optimize'()
.annotate 'line', 7332
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7333
$P4.'initialize'(__ARG_2)
.annotate 'line', 7334
$P3.'emit'($P4)
.annotate 'line', 7335
$P4.'close'()
# }
.annotate 'line', 7336

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7337
# Body
# {
.annotate 'line', 7339
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7340
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7341
$P1.'encoding'('utf8')
.annotate 'line', 7342
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7343
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7344
$P3.'parse'($P2)
.annotate 'line', 7345
$P1.'close'()
.annotate 'line', 7346
$P3.'optimize'()
.annotate 'line', 7347
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7348
$P4.'open'('__eval__', 'w')
.annotate 'line', 7349
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7350
$P5.'initialize'($P4)
.annotate 'line', 7351
$P3.'emit'($P5)
.annotate 'line', 7352
$P5.'close'()
.annotate 'line', 7353
$P4.'close'()
.annotate 'line', 7354
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7355
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7356
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7357
.return($P7)
# }
.annotate 'line', 7358

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7363
# Body
# {
.annotate 'line', 7365
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7366
$P1.'parse'(__ARG_1)
.annotate 'line', 7368
$P1.'optimize'()
.annotate 'line', 7370
# var handle: $P2
null $P2
.annotate 'line', 7371
iseq $I1, __ARG_2, '-'
unless $I1 goto __label_0
.annotate 'line', 7372
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 7374
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7375
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 7376
$P3.'initialize'($P2)
.annotate 'line', 7377
$P1.'emit'($P3)
.annotate 'line', 7378
$P3.'close'()
.annotate 'line', 7379
$P2.'close'()
# }
.annotate 'line', 7380

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7386
# Body
# {
.annotate 'line', 7388
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7389
compreg 'winxed', $P1
# }
.annotate 'line', 7390

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7392
# Body
# {
.annotate 'line', 7394
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7395
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 7396
$P1.'notOptStop'(1)
.annotate 'line', 7397
$P1.'push_string'('o=s')
.annotate 'line', 7398
$P1.'push_string'('e=s')
.annotate 'line', 7399
$P1.'push_string'('c')
.annotate 'line', 7400
$P1.'push_string'('noan')
.annotate 'line', 7402
__ARG_1.'shift'()
.annotate 'line', 7403
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7404
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7405
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7406
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7407
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7409
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7410
# string filename: $S1
null $S1
.annotate 'line', 7411
# string expr: $S2
null $S2
.annotate 'line', 7412
# var file: $P7
null $P7
.annotate 'line', 7413
isnull $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 7414
iseq $I3, $I1, 0
unless $I3 goto __label_2
# predefined Error
.annotate 'line', 7415
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7417
$S1 = __ARG_1[0]
.annotate 'line', 7418
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7419
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S4, 'function main[main](argv){', $S2
concat $S2, $S4, ';}'
.annotate 'line', 7424
new $P7, [ 'StringHandle' ]
.annotate 'line', 7425
$P7.'open'('__eval__', 'w')
.annotate 'line', 7426
$P7.'puts'($S2)
.annotate 'line', 7427
$P7.'close'()
.annotate 'line', 7428
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7431
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7433
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7434
isnull $I2, $P3
not $I2
unless $I2 goto __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7436
'winxed_parser'($P8, $S3)
.annotate 'line', 7438
$P7.'close'()
# }
.annotate 'line', 7439

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7441
# Body
# {
.annotate 'line', 7443
# try: create handler
new $P6, 'ExceptionHandler'
set_addr $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7449
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7443
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7452
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7453
print 'Error: '
say $S1
.annotate 'line', 7454
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7455
# int i: $I1
set $I1, 1
.annotate 'line', 7456
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7457
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7458
# string subname: $S2
null $S2
.annotate 'line', 7459
isnull $I3, $P4
not $I3
unless $I3 goto __label_4
# {
set $S2, $P4
.annotate 'line', 7461
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7462
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
.annotate 'line', 7464
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7465
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7466
isne $I4, $S4, ''
unless $I4 goto __label_8
# {
.annotate 'line', 7467
# int line: $I2
$I2 = $P5['line']
set $I5, $I1
.annotate 'line', 7468
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
.annotate 'line', 7472

.end # main

# End generated code
