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

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1253
addattribute $P0, 'start'
.annotate 'line', 1254
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1289
# Body
# {
.annotate 'line', 1291
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1292

.end # init


.sub 'numargs' :method

.annotate 'line', 1294
# Body
# {
.annotate 'line', 1296
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1297

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1298
# Body
# {
.annotate 'line', 1300
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1301
.return($P2)
# }
.annotate 'line', 1302

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1304
# Body
# {
.annotate 'line', 1306
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1307
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1308
# {
.annotate 'line', 1309
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1310
$P1.'push'($P3)
# }
.annotate 'line', 1311
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1312
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1313

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1315
# Body
# {
.annotate 'line', 1317
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1318
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 1319
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1320

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1321
# Body
# {
.annotate 'line', 1323
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1324
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1325
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1326
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 1327
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1328
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1329
$P2.'push'($S1)
# }
goto __label_0 # for iteration
__label_1: # for end
.annotate 'line', 1331
.return($P2)
# }
.annotate 'line', 1332

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1333
# Body
# {
.annotate 'line', 1335
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1336
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1337

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1287
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1349
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1350
# Body
# {
.annotate 'line', 1352
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1353
.return($I1)
# }
.annotate 'line', 1354

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1355
# Body
# {
.annotate 'line', 1357
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1358
$P2 = $P1.'numargs'()
set $I2, $P2
islt $I1, __ARG_1, $I2
unless $I1 goto __label_0
.annotate 'line', 1359
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1361
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1362

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1363
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1365
setattribute self, 'name', $P1
.annotate 'line', 1366
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
.annotate 'line', 1367
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1368

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1369
# Body
# {
.annotate 'line', 1371
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1372

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1346
addattribute $P0, 'name'
.annotate 'line', 1347
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1379
# Body
# {
.annotate 'line', 1381
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1382
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1383
# {
.annotate 'line', 1384
$P2 = __ARG_1.'get'()
.annotate 'line', 1385
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1386
$P2 = __ARG_1.'get'()
.annotate 'line', 1387
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1388
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1389
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1390
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1392
new $P7, [ 'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1393
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1394
'RequireOp'(']', $P2)
.annotate 'line', 1395
setattribute self, 'list', $P1
# }
.annotate 'line', 1396

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1397
# Body
# {
.annotate 'line', 1399
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1400
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1401

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1402
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1403
# Body
# {
.annotate 'line', 1405
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1406
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1407
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 1408
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1409
$P3 = $P2.'getname'()
$S1 = $P3
iseq $I3, $S1, __ARG_1
unless $I3 goto __label_3
# {
.annotate 'line', 1410
.return($P2)
# }
__label_3: # endif
# }
goto __label_0 # for iteration
__label_1: # for end
null $P3
.annotate 'line', 1413
.return($P3)
# }
.annotate 'line', 1414

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1377
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1421
# Body
# {
.annotate 'line', 1423
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S3, "[ '", $S1
concat $S2, $S3, "' ]"
.annotate 'line', 1424
.return($S2)
# }
.annotate 'line', 1425

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1427
# Body
# {
.annotate 'line', 1429
# predefined elements
elements $I2, __ARG_1
iseq $I1, $I2, 0
unless $I1 goto __label_0
.annotate 'line', 1430
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1432
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S3, ".namespace [ '", $S1
concat $S2, $S3, "' ]"
.annotate 'line', 1433
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1435

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1437
# Body
# {
.annotate 'line', 1439
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1440
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1441
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1442
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1443
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1445
__ARG_2.'unget'($P1)
.annotate 'line', 1446
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1448

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1450
# Body
# {
.annotate 'line', 1452
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1453
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1454
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1455
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1456
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1457
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1458
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1460
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1461
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1462
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
.annotate 'line', 1464
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1466
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1469
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1471
new $P9, [ 'StringStatement' ]
$P9.'StringStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_10: # case
.annotate 'line', 1473
new $P11, [ 'IntStatement' ]
$P11.'IntStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_11: # case
.annotate 'line', 1475
new $P13, [ 'FloatStatement' ]
$P13.'FloatStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_12: # case
.annotate 'line', 1477
new $P15, [ 'ReturnStatement' ]
$P15.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_13: # case
.annotate 'line', 1479
new $P17, [ 'YieldStatement' ]
$P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_14: # case
.annotate 'line', 1481
new $P19, [ 'GotoStatement' ]
$P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_15: # case
.annotate 'line', 1483
new $P21, [ 'IfStatement' ]
$P21.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_16: # case
.annotate 'line', 1485
new $P23, [ 'WhileStatement' ]
$P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_17: # case
.annotate 'line', 1487
new $P25, [ 'DoStatement' ]
$P25.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_18: # case
.annotate 'line', 1489
new $P27, [ 'ContinueStatement' ]
$P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_19: # case
.annotate 'line', 1491
new $P29, [ 'BreakStatement' ]
$P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_20: # case
.annotate 'line', 1493
new $P31, [ 'SwitchStatement' ]
$P31.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P30, $P31
.return($P30)
__label_21: # case
.annotate 'line', 1495
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1497
new $P33, [ 'ThrowStatement' ]
$P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P32, $P33
.return($P32)
__label_23: # case
.annotate 'line', 1499
new $P35, [ 'TryStatement' ]
$P35.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P34, $P35
.return($P34)
__label_5: # default
.annotate 'line', 1501
$P36 = $P1.'isidentifier'()
if_null $P36, __label_24
unless $P36 goto __label_24
# {
.annotate 'line', 1502
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1503
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1504
new $P10, [ 'LabelStatement' ]
.tailcall $P10.'set'($P1, __ARG_2)
__label_25: # endif
.annotate 'line', 1505
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1507
__ARG_1.'unget'($P1)
.annotate 'line', 1508
new $P12, [ 'ExprStatement' ]
$P12.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P11, $P12
.return($P11)
__label_4: # switch end
.annotate 'line', 1510
isnull $I1, $P2
unless $I1 goto __label_26
.annotate 'line', 1511
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1512
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1513

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1521
# Body
# {
.annotate 'line', 1523
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1524

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1525
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1526
# Body
# {
.annotate 'line', 1528
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1529

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1530
# Body
# {
.annotate 'line', 1532
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1533

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1534
# Body
# {
.annotate 'line', 1536
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1537

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1538
# Body
# {
.annotate 'line', 1540
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1541

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1542
# Body
# {
.annotate 'line', 1544
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1545

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1546
# Body
# {
.annotate 'line', 1548
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1549

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1550
# Body
# {
.annotate 'line', 1552
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1553

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1554
# Body
# {
.annotate 'line', 1556
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1557

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1558
# Body
# {
.annotate 'line', 1560
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1561

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1562
# Body
# {
.annotate 'line', 1564
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1565

.end # checkclass


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1566
# Body
# {
.annotate 'line', 1568
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1569

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1570
# Body
# {
.annotate 'line', 1572
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1573

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1574
# Body
# {
.annotate 'line', 1576
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1578
.return(self)
# }
.annotate 'line', 1579

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1519
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1584
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1585
# Body
# {
.annotate 'line', 1587
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1588

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1589
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1590
# Body
# {
# }
.annotate 'line', 1593

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1582
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1600
# Body
# {
.annotate 'line', 1602
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1603
$P1.'push'(__ARG_1)
.annotate 'line', 1604
$P1.'push'(__ARG_2)
.annotate 'line', 1605
setattribute self, 'statements', $P1
# }
.annotate 'line', 1606

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1607
# Body
# {
.annotate 'line', 1609
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1610
.return(self)
# }
.annotate 'line', 1611

.end # push


.sub 'optimize' :method

.annotate 'line', 1612
# Body
# {
.annotate 'line', 1614
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1615
.return(self)
# }
.annotate 'line', 1616

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1617
# Body
# {
.annotate 'line', 1619
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1620
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1621

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1598
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1624
# Body
# {
.annotate 'line', 1626
isnull $I1, __ARG_1
unless $I1 goto __label_0
.annotate 'line', 1627
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1628
isa $I2, __ARG_1, 'MultiStatement'
unless $I2 goto __label_2
.annotate 'line', 1629
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1631
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1632

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1642
# Body
# {
.annotate 'line', 1644
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1645
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1646
# int dotted: $I1
null $I1
.annotate 'line', 1647
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1649
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1651
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1652
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S2, $S3, $S1
box $P3, $S2
setattribute self, 'opname', $P3
.annotate 'line', 1653
$P1 = __ARG_2.'get'()
.annotate 'line', 1654
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1655
__ARG_2.'unget'($P1)
.annotate 'line', 1656
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1658
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1659

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1660
# Body
# {
.annotate 'line', 1662
self.'optimizeargs'()
.annotate 'line', 1663
.return(self)
# }
.annotate 'line', 1664

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1665
# Body
# {
.annotate 'line', 1667
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1668
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1669
__ARG_1.'comment'($S2)
.annotate 'line', 1670
$P1 = self.'numargs'()
set $I2, $P1
iseq $I1, $I2, 0
unless $I1 goto __label_1
.annotate 'line', 1671
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1673
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1674
self.'emitargs'(__ARG_1)
.annotate 'line', 1675
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1677

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1638
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1640
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1687
# Body
# {
.annotate 'line', 1689
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1690
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1691
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1692
# {
.annotate 'line', 1693
$P2 = __ARG_2.'get'()
.annotate 'line', 1694
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1695
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1696
'RequireOp'(';', $P2)
.annotate 'line', 1697
setattribute self, 'path', $P1
.annotate 'line', 1698
.return(self)
# }
.annotate 'line', 1699

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1700
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1701
# Body
# {
.annotate 'line', 1703
self.'annotate'(__ARG_1)
.annotate 'line', 1704
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1705

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1684
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1686
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1715
# Body
# {
.annotate 'line', 1717
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1718
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1719
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1720
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1721

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1722
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1723
# Body
# {
.annotate 'line', 1725
self.'annotate'(__ARG_1)
.annotate 'line', 1726
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1727
getattribute $P3, self, 'symbol'
.annotate 'line', 1726
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1728

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1712
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1714
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1738
# Body
# {
.annotate 'line', 1740
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1741
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1742
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1743
# {
.annotate 'line', 1744
$P2 = __ARG_2.'get'()
.annotate 'line', 1745
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1746
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1747
'RequireOp'(';', $P2)
.annotate 'line', 1748
setattribute self, 'path', $P1
# }
.annotate 'line', 1749

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1750
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1751
# Body
# {
.annotate 'line', 1753
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1754
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1755
self.'annotate'(__ARG_1)
.annotate 'line', 1757
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1759
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1760
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1762
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1765
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1767

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1735
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1737
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1777
# Body
# {
.annotate 'line', 1779
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1780
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1781
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1782

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1783
# Body
# {
.annotate 'line', 1785
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1786
.return(self)
# }
.annotate 'line', 1787

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1788
# Body
# {
.annotate 'line', 1790
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1791

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1774
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1776
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1801
# Body
# {
.annotate 'line', 1803
setattribute self, 'name', __ARG_1
.annotate 'line', 1804
.return(self)
# }
.annotate 'line', 1805

.end # set


.sub 'get_string' :method :vtable

.annotate 'line', 1806
# Body
# {
# predefined Error
.annotate 'line', 1808
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1809

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1800
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1816
# Body
# {
.annotate 'line', 1818
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1819

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1820
# Body
# {
.annotate 'line', 1822
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1823
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1824
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1825
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S4, "Redeclared '", $S1
concat $S3, $S4, "'"
.annotate 'line', 1826
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1827
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1828
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1832
.return($S2)
# }
.annotate 'line', 1833

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1834
# Body
# {
.annotate 'line', 1836
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1837
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1838
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1839
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1840
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1841
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1845

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1846
# Body
# {
.annotate 'line', 1848
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1849
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1850
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1851
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1852
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1853
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1856
new $P5, [ 'ConstantInternalFail' ]
$P4 = $P5.'set'(__ARG_1)
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1858
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1859
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1860
$P1[$S1] = $P3
# }
.annotate 'line', 1861

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1862
# Body
# {
.annotate 'line', 1864
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1865
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1866
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1867
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1868
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1869
.return($P2)
# }
.annotate 'line', 1870

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1815
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 1879
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 1889
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 1890
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 1891
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 1892
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 1893
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 1894
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 1895
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 1896
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1897
# Body
# {
.annotate 'line', 1899
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 1900

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 1901
# Body
# {
.annotate 'line', 1903
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1904

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 1905
# Body
# {
.annotate 'line', 1908
.return(self)
# }
.annotate 'line', 1909

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 1910
# Body
# {
.annotate 'line', 1912
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1913
# string reg: $S2
iseq $I1, $S1, 'v'
unless $I1 goto __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 1914
self.'emit'(__ARG_1, $S2)
.annotate 'line', 1915
.return($S2)
# }
.annotate 'line', 1916

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1917
# Body
# {
.annotate 'line', 1919
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 1920

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 1887
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 1925
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 1923
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1933
# Body
# {
.annotate 'line', 1935
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 1936
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1937
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 1938
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 1939
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 1940

.end # FunctionExpr


.sub 'checkResult' :method

.annotate 'line', 1941
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 1942
# Body
# {
.annotate 'line', 1944
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 1945
.return(self)
# }
.annotate 'line', 1946

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1947
# Body
# {
.annotate 'line', 1949
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 1950
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
.annotate 'line', 1951
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
# }
.annotate 'line', 1952

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 1930
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 1932
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1967
# Body
# {
.annotate 'line', 1969
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 1970
.return(self)
# }
.annotate 'line', 1971

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 1972
# Body
# {
.annotate 'line', 1974
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 1975

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 1976
# Body
# {
.annotate 'line', 1978
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 1979
.return(self)
# }
.annotate 'line', 1980

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 1981
# Body
# {
.annotate 'line', 1983
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1984
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 1985
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1987
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 1988
iseq $I2, $I1, 0
unless $I2 goto __label_4
.annotate 'line', 1989
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 1991
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 1994
.return(0)
# }
.annotate 'line', 1995

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

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
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_3)
__label_6: # case
__label_7: # case
.annotate 'line', 2007
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2010
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2012

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2013
# Body
# {
.annotate 'line', 2015
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2016
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2017
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2018
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
.annotate 'line', 2021
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_2)
__label_6: # case
__label_7: # case
.annotate 'line', 2024
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2027
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2029

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 1966
addattribute $P0, 'condexpr'
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2037
# Body
# {
.annotate 'line', 2039
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2040
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2041

.end # StringLiteral


.sub 'isliteral' :method

.annotate 'line', 2042
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isstringliteral' :method

.annotate 'line', 2043
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2044
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2045
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getPirString' :method

.annotate 'line', 2046
# Body
# {
.annotate 'line', 2048
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2049
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2050
# int type: $I1
getattribute $P2, $P1, 'type'
set $I1, $P2
.annotate 'line', 2051
# int need_unicode: $I2
null $I2
box $P3, $S1
.annotate 'line', 2052
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $I3, $P4
# {
.annotate 'line', 2053
isgt $I7, $I3, 127
unless $I7 goto __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2055
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2058
unless $I2 goto __label_4
# {
.annotate 'line', 2059
iseq $I7, $I1, 3
unless $I7 goto __label_5
# {
set $I1, 2
.annotate 'line', 2061
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P3, $S2
.annotate 'line', 2063
iter $P5, $P3
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2064
iseq $I8, $S3, '\'
unless $I8 goto __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2066
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2069
# string result: $S4
set $S4, ''
.annotate 'line', 2070
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2071
# int i: $I5
null $I5
goto __label_11
__label_9: # for iteration
inc $I5
__label_11: # for condition
islt $I8, $I5, $I4
unless $I8 goto __label_10 # for end
# {
.annotate 'line', 2072
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2073
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2074
isgt $I9, $I6, 127
unless $I9 goto __label_12
# {
.annotate 'line', 2075
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
.annotate 'line', 2076
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2079
# }
goto __label_9 # for iteration
__label_10: # for end
set $S1, $S4
.annotate 'line', 2081
# }
__label_4: # endif
.annotate 'line', 2083
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
.annotate 'line', 2085
unless $I2 goto __label_17
concat $S1, 'unicode:', $S1
__label_17: # endif
.annotate 'line', 2087
.return($S1)
# }
.annotate 'line', 2088

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2089
# Body
# {
.annotate 'line', 2091
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2092
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2093
getattribute $P3, $P1, 'type'
set $I2, $P3
iseq $I1, $I2, 2
unless $I1 goto __label_1
# {
.annotate 'line', 2094
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2095
$P4 = $P2.'unescape'('utf8')
set $S1, $P4
# }
__label_1: # endif
.annotate 'line', 2097
.return($S1)
# }
.annotate 'line', 2098

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2099
# Body
# {
.annotate 'line', 2101
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2102

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2103
# Body
# {
.annotate 'line', 2105
.tailcall self.'getPirString'()
# }
.annotate 'line', 2106

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2034
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2036
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2115
# Body
# {
.annotate 'line', 2118
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2119
setattribute self, 'pos', __ARG_2
.annotate 'line', 2120
# int n: $I1
null $I1
.annotate 'line', 2121
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2122
# {
.annotate 'line', 2124
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2125
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2127
setattribute self, 'numval', $P2
# }
.annotate 'line', 2128

.end # IntegerLiteral


.sub 'isliteral' :method

.annotate 'line', 2129
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2130
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2131
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2132
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getIntegerValue' :method

.annotate 'line', 2133
# Body
# {
.annotate 'line', 2135
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2136
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2137
.return($I1)
# }
.annotate 'line', 2138

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2139
# Body
# {
.annotate 'line', 2141
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2142
iseq $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 2143
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2145
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2146

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2147
# Body
# {
.annotate 'line', 2149
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2150

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2111
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2113
addattribute $P0, 'pos'
.annotate 'line', 2114
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2158
# Body
# {
.annotate 'line', 2160
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2161
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2162

.end # FloatLiteral


.sub 'isliteral' :method

.annotate 'line', 2163
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2164
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2165
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2166
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getFloatValue' :method

.annotate 'line', 2167
# Body
# {
.annotate 'line', 2169
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2170
# var n: $P1
new $P1, ['Float']
assign $P1, $S1
.annotate 'line', 2172
.return($P1)
# }
.annotate 'line', 2173

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2174
# Body
# {
.annotate 'line', 2176
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2177
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2178

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2179
# Body
# {
.annotate 'line', 2183
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2184
# predefined indexof
index $I2, $S1, '.'
islt $I1, $I2, 0
unless $I1 goto __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2186
.return($S1)
# }
.annotate 'line', 2187

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2155
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2157
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2195
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2196
# Body
# {
.annotate 'line', 2198
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2199
setattribute self, 'name', __ARG_2
.annotate 'line', 2200
.return(self)
# }
.annotate 'line', 2201

.end # set


.sub 'isnull' :method

.annotate 'line', 2202
# Body
# {
.annotate 'line', 2204
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2205

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2206
# Body
# {
.annotate 'line', 2208
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2209
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
$P2 = $P1['type']
.annotate 'line', 2210
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2212
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
.annotate 'line', 2215
.return('P')
__label_3: # default
.annotate 'line', 2217
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2220

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2221
# Body
# {
.annotate 'line', 2223
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2224
.return($S1)
# }
.annotate 'line', 2225

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2226
# Body
# {
.annotate 'line', 2228
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2229
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 2230
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2231
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2232
# string s: $S1
null $S1
.annotate 'line', 2233
isnull $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 2234
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2235
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
.annotate 'line', 2241
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2245
$P4 = $P2['id']
isnull $I2, $P4
not $I2
unless $I2 goto __label_8
$P5 = $P2['id']
.annotate 'line', 2246
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2248
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2250
.return($S1)
# }
.annotate 'line', 2251

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2252
# Body
# {
.annotate 'line', 2254
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2255
$S2 = $P1
iseq $I1, $S2, ''
unless $I1 goto __label_0
# {
.annotate 'line', 2256
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S3, "Variable '", $S1
concat $S2, $S3, "' is not defined"
.annotate 'line', 2257
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2259
.return($P1)
# }
.annotate 'line', 2260

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2261
# Body
# {
.annotate 'line', 2263
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2264
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2265
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 2266
$I2 = $P2['const']
unless $I2 goto __label_2
$P3 = $P2['id']
isnull $I2, $P3
__label_2:
unless $I2 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2267
.return($P4)
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2269
.return(self)
# }
.annotate 'line', 2270

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2271
# Body
# {
.annotate 'line', 2273
self.'annotate'(__ARG_1)
.annotate 'line', 2274
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2275

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2276
# Body
# {
.annotate 'line', 2278
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2279

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2280
# Body
# {
.annotate 'line', 2282
self.'annotate'(__ARG_1)
.annotate 'line', 2283
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2284
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2285
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2286
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2289
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2292
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2295
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2296
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2298
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2299
iseq $I1, $S1, $S3
unless $I1 goto __label_11
# {
.annotate 'line', 2300
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2303
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2304
self.'annotate'(__ARG_1)
.annotate 'line', 2305
iseq $I2, $S1, 'P'
unless $I2 goto __label_16
isne $I2, $S3, 'P'
__label_16:
unless $I2 goto __label_14
.annotate 'line', 2306
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2308
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2311
.return($S2)
# }
.annotate 'line', 2312

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2192
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2194
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2319
# Body
# {
.annotate 'line', 2321
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2322

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2317
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2330
# Body
# {
.annotate 'line', 2332
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2333
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2334

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2335
# Body
# {
.annotate 'line', 2337
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2338

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2339
# Body
# {
.annotate 'line', 2341
self.'optimizearg'()
.annotate 'line', 2342
.return(self)
# }
.annotate 'line', 2343

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2327
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2329
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2352
# Body
# {
.annotate 'line', 2354
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2355
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2356
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2357

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2358
# Body
# {
.annotate 'line', 2360
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2361
.return(self)
# }
.annotate 'line', 2362

.end # set


.sub 'optimizearg' :method

.annotate 'line', 2363
# Body
# {
.annotate 'line', 2365
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2366
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2367

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2368
# Body
# {
.annotate 'line', 2370
self.'optimizearg'()
.annotate 'line', 2371
.return(self)
# }
.annotate 'line', 2372

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2348
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2350
addattribute $P0, 'lexpr'
.annotate 'line', 2351
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2379
# Body
# {
.annotate 'line', 2381
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2382

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2383
# Body
# {
.annotate 'line', 2385
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2386
.return(self)
# }
.annotate 'line', 2387

.end # set


.sub 'optimize' :method

.annotate 'line', 2388
# Body
# {
.annotate 'line', 2390
self.'optimizearg'()
.annotate 'line', 2391
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2392
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2393
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2394
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2397
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2398
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2399
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2400
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2403
.return(self)
# }
.annotate 'line', 2404

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2405
# Body
# {
.annotate 'line', 2407
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2408
self.'annotate'(__ARG_1)
.annotate 'line', 2409
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2410

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2377
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2417
# Body
# {
.annotate 'line', 2419
.return('I')
# }
.annotate 'line', 2420

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2421
# Body
# {
.annotate 'line', 2423
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2424
.return(self)
# }
.annotate 'line', 2425

.end # set


.sub 'optimize' :method

.annotate 'line', 2426
# Body
# {
.annotate 'line', 2428
self.'optimizearg'()
.annotate 'line', 2429
getattribute $P3, self, 'subexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2430
# var numval: $P1
getattribute $P4, self, 'subexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2431
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2432
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2434
.return(self)
# }
.annotate 'line', 2435

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2436
# Body
# {
.annotate 'line', 2438
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2439
self.'annotate'(__ARG_1)
.annotate 'line', 2440
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2441
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2443
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2446
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2449
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2451

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2415
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2458
# Body
# {
.annotate 'line', 2460
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2461

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2462
# Body
# {
.annotate 'line', 2464
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2465
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2466
.return(self)
# }
.annotate 'line', 2467

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2468
# Body
# {
.annotate 'line', 2470
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2471
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2472
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2473

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2474
# Body
# {
.annotate 'line', 2476
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2477
self.'annotate'(__ARG_1)
.annotate 'line', 2478
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2479
.return($S1)
# }
.annotate 'line', 2480

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2456
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2487
# Body
# {
.annotate 'line', 2489
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2490
.return(self)
# }
.annotate 'line', 2491

.end # set


.sub 'checkResult' :method

.annotate 'line', 2492
# Body
# {
.annotate 'line', 2494
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2495

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2496
# Body
# {
.annotate 'line', 2498
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2499
self.'annotate'(__ARG_1)
.annotate 'line', 2500
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2501
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2502
.return($S1)
# }
.annotate 'line', 2503

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2485
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2510
# Body
# {
.annotate 'line', 2512
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2513

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2514
# Body
# {
.annotate 'line', 2516
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2517
.return(self)
# }
.annotate 'line', 2518

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2519
# Body
# {
.annotate 'line', 2521
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2522
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2523
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2524

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2525
# Body
# {
.annotate 'line', 2527
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2528
self.'annotate'(__ARG_1)
.annotate 'line', 2529
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2530
.return($S1)
# }
.annotate 'line', 2531

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2508
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2538
# Body
# {
.annotate 'line', 2540
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2541
.return(self)
# }
.annotate 'line', 2542

.end # set


.sub 'checkResult' :method

.annotate 'line', 2543
# Body
# {
.annotate 'line', 2545
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2546

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2547
# Body
# {
.annotate 'line', 2549
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2550
self.'annotate'(__ARG_1)
.annotate 'line', 2551
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2552
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2553
.return($S1)
# }
.annotate 'line', 2554

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2536
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2563
# Body
# {
.annotate 'line', 2565
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2566
setattribute self, 'eleft', __ARG_3
.annotate 'line', 2567
setattribute self, 'eright', __ARG_4
.annotate 'line', 2568
.return(self)
# }
.annotate 'line', 2569

.end # set


.sub 'checkResult' :method

.annotate 'line', 2570
# Body
# {
.annotate 'line', 2572
getattribute $P2, self, 'eleft'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2573
getattribute $P3, self, 'eleft'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2575
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2576

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2577
# Body
# {
.annotate 'line', 2579
getattribute $P3, self, 'eleft'
$P2 = $P3.'optimize'()
setattribute self, 'eleft', $P2
.annotate 'line', 2580
getattribute $P3, self, 'eright'
$P2 = $P3.'optimize'()
setattribute self, 'eright', $P2
.annotate 'line', 2581
.return(self)
# }
.annotate 'line', 2582

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2583
# Body
# {
.annotate 'line', 2585
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2586

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2559
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2561
addattribute $P0, 'eleft'
.annotate 'line', 2562
addattribute $P0, 'eright'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2593
# Body
# {
.annotate 'line', 2595
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2596
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
# {
.annotate 'line', 2597
self.'annotate'(__ARG_1)
.annotate 'line', 2598
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2600

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2601
# Body
# {
.annotate 'line', 2603
self.'annotate'(__ARG_1)
.annotate 'line', 2604
# var eleft: $P1
getattribute $P1, self, 'eleft'
.annotate 'line', 2605
getattribute $P2, self, 'eright'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2606

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2591
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2613
# Body
# {
.annotate 'line', 2615
self.'annotate'(__ARG_1)
.annotate 'line', 2616
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2617
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2618
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2619

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2620
# Body
# {
.annotate 'line', 2622
self.'annotate'(__ARG_1)
.annotate 'line', 2623
# string reg: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2624
# string reg2: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2625
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2626
.return($S1)
# }
.annotate 'line', 2627

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2611
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2634
# Body
# {
.annotate 'line', 2636
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2637
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2638
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2639

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2640
# Body
# {
.annotate 'line', 2642
# string ltype: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2643
# string rtype: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2644
# string reg: $S3
getattribute $P4, self, 'eleft'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2645
# string reg2: $S4
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2646
self.'annotate'(__ARG_1)
.annotate 'line', 2647
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
# {
.annotate 'line', 2648
isne $I2, $S2, 'S'
unless $I2 goto __label_6
# {
.annotate 'line', 2649
# string aux: $S5
$P5 = self.'tempreg'('S')
null $S5
if_null $P5, __label_7
set $S5, $P5
__label_7:
.annotate 'line', 2650
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2651
# }
__label_6: # endif
.annotate 'line', 2653
__ARG_1.'emitconcat'($S3, $S3, $S4)
# }
goto __label_5
__label_4: # else
.annotate 'line', 2656
__ARG_1.'emitaddto'($S3, $S4)
__label_5: # endif
.annotate 'line', 2657
.return($S3)
# }
.annotate 'line', 2658

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2632
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2665
# Body
# {
.annotate 'line', 2667
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2668
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2669
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2670

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2671
# Body
# {
.annotate 'line', 2673
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2674
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2675
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2676
self.'annotate'(__ARG_1)
.annotate 'line', 2677
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2678
.return($S2)
# }
.annotate 'line', 2679

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2663
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2686
# Body
# {
.annotate 'line', 2688
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2689
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2690
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2691

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2692
# Body
# {
.annotate 'line', 2694
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2695
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2696
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2697
self.'annotate'(__ARG_1)
.annotate 'line', 2698
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2699
.return($S2)
# }
.annotate 'line', 2700

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2684
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2707
# Body
# {
.annotate 'line', 2709
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2710
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2711
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2712

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2713
# Body
# {
.annotate 'line', 2715
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2716
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2717
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2718
self.'annotate'(__ARG_1)
.annotate 'line', 2719
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2720
.return($S2)
# }
.annotate 'line', 2721

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2705
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2728
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2729
# Body
# {
.annotate 'line', 2731
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2732
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2733
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2734
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2735
self.'annotate'(__ARG_1)
.annotate 'line', 2736
# string aux: $S5
null $S5
.annotate 'line', 2737
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2739
iseq $I2, $S1, 'I'
unless $I2 goto __label_7
# {
.annotate 'line', 2740
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2741
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2742
# }
__label_7: # endif
.annotate 'line', 2744
iseq $I1, $S2, 'I'
unless $I1 goto __label_8
# {
.annotate 'line', 2745
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2746
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2747
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2750
iseq $I2, $S2, 'I'
unless $I2 goto __label_11
iseq $I2, $S1, 'P'
__label_11:
unless $I2 goto __label_9
# {
.annotate 'line', 2751
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2752
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2753
# }
goto __label_10
__label_9: # else
.annotate 'line', 2755
iseq $I3, $S2, 'P'
unless $I3 goto __label_14
iseq $I3, $S1, 'I'
__label_14:
unless $I3 goto __label_12
# {
.annotate 'line', 2756
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2757
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2758
# }
goto __label_13
__label_12: # else
.annotate 'line', 2760
iseq $I3, $S2, 'S'
unless $I3 goto __label_17
iseq $I3, $S1, 'P'
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 2761
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2762
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2763
# }
goto __label_16
__label_15: # else
.annotate 'line', 2765
iseq $I4, $S2, 'P'
unless $I4 goto __label_19
iseq $I4, $S1, 'S'
__label_19:
unless $I4 goto __label_18
# {
.annotate 'line', 2766
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2767
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2768
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 2771
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
# }
.annotate 'line', 2772

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2773
# Body
# {
.annotate 'line', 2775
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2776

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2726
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2788
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2789
# Body
# {
.annotate 'line', 2791
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2792
setattribute self, 'expr', __ARG_2
.annotate 'line', 2793
.return(self)
# }
.annotate 'line', 2794

.end # set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 2784
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2786
addattribute $P0, 'expr'
.end
.namespace [ 'OpIsNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2799
# Body
# {
.annotate 'line', 2801
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2802
self.'annotate'(__ARG_1)
.annotate 'line', 2803
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2804

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpIsNullExpr' ]
.annotate 'line', 2797
get_class $P1, [ 'NullCheckerExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2809
# Body
# {
.annotate 'line', 2811
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2812
self.'annotate'(__ARG_1)
.annotate 'line', 2813
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2814
__ARG_1.'say'('not ', __ARG_2)
# }
.annotate 'line', 2815

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotNullExpr' ]
.annotate 'line', 2807
get_class $P1, [ 'NullCheckerExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2822
# Body
# {
.annotate 'line', 2824
self.'optimizearg'()
.annotate 'line', 2825
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2826
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2827
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2828
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2829
unless $I1 goto __label_0
# {
.annotate 'line', 2830
unless $I2 goto __label_1
.annotate 'line', 2831
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 2833
new $P6, [ 'OpIsNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2835
unless $I2 goto __label_3
.annotate 'line', 2836
new $P4, [ 'OpIsNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2837
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2838
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2839
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2840
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2841
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2842
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2843
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2846
.return(self)
# }
.annotate 'line', 2847

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2848
# Body
# {
.annotate 'line', 2850
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2851

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2852
# Body
# {
.annotate 'line', 2854
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2855

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 2820
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2862
# Body
# {
.annotate 'line', 2864
self.'optimizearg'()
.annotate 'line', 2865
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2866
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2867
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2868
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2869
unless $I1 goto __label_0
# {
.annotate 'line', 2870
unless $I2 goto __label_1
.annotate 'line', 2871
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 2873
new $P6, [ 'OpNotNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2875
unless $I2 goto __label_3
.annotate 'line', 2876
new $P4, [ 'OpNotNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2877
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2878
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2879
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2880
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2881
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2882
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2883
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2886
.return(self)
# }
.annotate 'line', 2887

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2888
# Body
# {
.annotate 'line', 2890
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2891

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2892
# Body
# {
.annotate 'line', 2894
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2895

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 2860
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2902
# Body
# {
.annotate 'line', 2904
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2905

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 2900
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2912
# Body
# {
.annotate 'line', 2914
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2915

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 2910
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2922
# Body
# {
.annotate 'line', 2924
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2925

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 2920
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2932
# Body
# {
.annotate 'line', 2934
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2935

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 2930
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2942
# Body
# {
.annotate 'line', 2944
.return('I')
# }
.annotate 'line', 2945

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 2940
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 2952
# Body
# {
.annotate 'line', 2954
self.'optimizearg'()
.annotate 'line', 2955
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2956
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2957
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2958
isne $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2959
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2961
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2963
.return(self)
# }
.annotate 'line', 2964

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2965
# Body
# {
.annotate 'line', 2967
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
.annotate 'line', 2968
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 2969
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 2970
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 2971
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 2972
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 2973
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 2976
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 2977
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 2978
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 2979
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 2980
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 2982

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 2950
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 2989
# Body
# {
.annotate 'line', 2991
self.'optimizearg'()
.annotate 'line', 2992
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2993
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2994
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2995
iseq $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2996
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2998
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3000
.return(self)
# }
.annotate 'line', 3001

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3002
# Body
# {
.annotate 'line', 3004
# string res: $S1
null $S1
.annotate 'line', 3005
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3008
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3009
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3010
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3011
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3012
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3013
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3014
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3017
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3018
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3019
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3020
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3021
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3023

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 2987
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3030
# Body
# {
.annotate 'line', 3032
.return('I')
# }
.annotate 'line', 3033

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3028
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3040
# Body
# {
.annotate 'line', 3042
self.'optimizearg'()
.annotate 'line', 3043
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3044
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3045
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3046
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3047
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3048
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3050
.return(self)
# }
.annotate 'line', 3051

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3052
# Body
# {
.annotate 'line', 3054
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
.annotate 'line', 3055
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3056
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3057
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3058
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3059
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3060

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3038
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3067
# Body
# {
.annotate 'line', 3069
self.'optimizearg'()
.annotate 'line', 3070
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3071
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3072
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3073
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3074
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3075
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3077
.return(self)
# }
.annotate 'line', 3078

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3079
# Body
# {
.annotate 'line', 3081
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
.annotate 'line', 3082
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3083
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3084
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3085
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3086
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3087

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3065
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3094
# Body
# {
.annotate 'line', 3096
self.'optimizearg'()
.annotate 'line', 3097
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3098
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3099
$I4 = $P1.'isliteral'()
unless $I4 goto __label_1
$I4 = $P2.'isliteral'()
__label_1:
unless $I4 goto __label_0
# {
.annotate 'line', 3100
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_2
set $S1, $P10
__label_2:
.annotate 'line', 3101
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_3
set $S2, $P10
__label_3:
.annotate 'line', 3102
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3103
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3104
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3105
# var t: $P5
null $P5
.annotate 'line', 3106
# int newtype: $I1
null $I1
.annotate 'line', 3107
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
.annotate 'line', 3111
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_9
set $S3, $P11
__label_9:
.annotate 'line', 3112
# string rs: $S4
getattribute $P12, $P4, 'str'
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
concat $S5, $S3, $S4
.annotate 'line', 3113
$P5 = 'newTokenFrom'($I1, $S5, $P3)
.annotate 'line', 3114
new $P14, [ 'StringLiteral' ]
getattribute $P15, self, 'owner'
$P14.'StringLiteral'($P15, $P5)
set $P13, $P14
.return($P13)
# }
__label_4: # endif
.annotate 'line', 3116
iseq $I5, $S1, 'I'
unless $I5 goto __label_12
iseq $I5, $S2, 'I'
__label_12:
unless $I5 goto __label_11
# {
.annotate 'line', 3117
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3118
# int ln: $I2
set $P13, $P6
set $I2, $P13
.annotate 'line', 3119
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3120
# int rn: $I3
set $P14, $P7
set $I3, $P14
.annotate 'line', 3121
getattribute $P15, self, 'owner'
getattribute $P16, self, 'start'
add $I6, $I2, $I3
.tailcall 'integerValue'($P15, $P16, $I6)
# }
__label_11: # endif
# {
.annotate 'line', 3124
$P16 = 'floatresult'($S1, $S2)
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 3125
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3126
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3127
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3128
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3129
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P17, $P18, $N3)
# }
__label_13: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3133
.return(self)
# }
.annotate 'line', 3134

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3135
# Body
# {
.annotate 'line', 3137
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3138
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3139
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3140
.return($S1)
__label_2: # endif
.annotate 'line', 3141
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3142
.return('S')
__label_3: # endif
.annotate 'line', 3143
iseq $I2, $S1, 'S'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3144
.return('S')
__label_5: # endif
.annotate 'line', 3145
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3146
.return('N')
__label_7: # endif
.annotate 'line', 3147
.return('I')
# }
.annotate 'line', 3148

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3149
# Body
# {
.annotate 'line', 3151
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3152
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3153
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3154
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3155
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3157
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3158
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3159
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
# {
.annotate 'line', 3160
isne $I2, $S2, 'S'
if $I2 goto __label_8
isne $I2, $S3, 'S'
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 3161
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3162
isne $I1, $S2, 'S'
unless $I1 goto __label_10
# {
.annotate 'line', 3163
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3164
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3167
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3168
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3171
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3174
iseq $I2, $S1, 'I'
unless $I2 goto __label_14
isne $I2, $S2, 'I'
if $I2 goto __label_15
isne $I2, $S3, 'I'
__label_15:
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3175
# string l: $S7
null $S7
.annotate 'line', 3176
iseq $I3, $S2, 'I'
unless $I3 goto __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3178
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3179
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3181
# string r: $S8
null $S8
.annotate 'line', 3182
iseq $I3, $S3, 'I'
unless $I3 goto __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3184
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3185
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3187
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3190
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3192

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3092
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3199
# Body
# {
.annotate 'line', 3201
self.'optimizearg'()
.annotate 'line', 3202
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3203
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3204
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3205
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3206
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3207
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3208
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3209
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3210
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3211
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3212
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3215
.return(self)
# }
.annotate 'line', 3216

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3217
# Body
# {
.annotate 'line', 3219
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3220
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3221
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3222
.return($S1)
__label_2: # endif
.annotate 'line', 3223
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3224
.return('N')
__label_3: # endif
.annotate 'line', 3225
iseq $I2, $S1, 'N'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3226
.return('N')
__label_5: # endif
.annotate 'line', 3227
.return('I')
# }
.annotate 'line', 3228

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3229
# Body
# {
.annotate 'line', 3231
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3232
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3233
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3234

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3197
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3241
# Body
# {
.annotate 'line', 3243
self.'optimizearg'()
.annotate 'line', 3244
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3245
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3246
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3247
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3248
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3249
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3250
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3251
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3252
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3253
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3254
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
set $I5, $I1
set $I6, $I2
mul $I4, $I5, $I6
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3257
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3258
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3259
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3260
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3261
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3262
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3266
.return(self)
# }
.annotate 'line', 3267

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3268
# Body
# {
.annotate 'line', 3270
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3271
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3272
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3273
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3274
.return($S1)
__label_2: # endif
.annotate 'line', 3275
iseq $I1, $S1, 'S'
unless $I1 goto __label_3
.annotate 'line', 3276
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3278
.return('N')
__label_4: # endif
# }
.annotate 'line', 3279

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3280
# Body
# {
.annotate 'line', 3282
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3283
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3284
# var ltype: $P3
$P3 = $P1.'checkResult'()
.annotate 'line', 3285
$S10 = $P3
iseq $I3, $S10, 'S'
unless $I3 goto __label_0
# {
.annotate 'line', 3286
# string lreg: $S1
$P4 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 3287
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 3288
# string rval: $S3
null $S3
.annotate 'line', 3289
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
.annotate 'line', 3294
$P6 = self.'tempreg'('I')
set $S3, $P6
.annotate 'line', 3295
__ARG_1.'emitset'($S3, $S2)
__label_3: # switch end
.annotate 'line', 3297
self.'annotate'(__ARG_1)
.annotate 'line', 3298
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S1, ', ', $S3)
.annotate 'line', 3299
.return()
# }
__label_0: # endif
.annotate 'line', 3304
$S11 = $P3
iseq $I3, $S11, 'N'
unless $I3 goto __label_6
# {
.annotate 'line', 3305
# string lreg: $S4
$P5 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_7
set $S4, $P5
__label_7:
.annotate 'line', 3306
# string rreg: $S5
$P6 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P6, __label_8
set $S5, $P6
__label_8:
.annotate 'line', 3307
# string rval: $S6
null $S6
.annotate 'line', 3308
$P7 = $P2.'checkResult'()
set $S12, $P7
set $S13, 'I'
if $S12 == $S13 goto __label_11
set $S13, 'N'
if $S12 == $S13 goto __label_12
goto __label_10
# switch
__label_11: # case
.annotate 'line', 3310
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3311
__ARG_1.'emitset'($S6, $S5)
set $S6, $S5
goto __label_9 # break
__label_12: # case
set $S6, $S5
goto __label_9 # break
__label_10: # default
.annotate 'line', 3318
$P9 = self.'tempreg'('N')
set $S6, $P9
.annotate 'line', 3319
__ARG_1.'emitset'($S6, $S5)
__label_9: # switch end
.annotate 'line', 3321
self.'annotate'(__ARG_1)
.annotate 'line', 3322
__ARG_1.'say'('mul ', __ARG_2, ', ', $S4, ', ', $S6)
.annotate 'line', 3323
.return()
# }
__label_6: # endif
.annotate 'line', 3326
# string rleft: $S7
null $S7
.annotate 'line', 3327
# string rright: $S8
null $S8
.annotate 'line', 3328
# int nleft: $I1
null $I1
.annotate 'line', 3329
# int nright: $I2
null $I2
.annotate 'line', 3330
$P7 = $P1.'issimple'()
isfalse $I4, $P7
if $I4 goto __label_15
$I4 = $P1.'isidentifier'()
__label_15:
unless $I4 goto __label_13
# {
.annotate 'line', 3331
$P9 = self.'checkResult'()
$P8 = self.'tempreg'($P9)
set $S7, $P8
.annotate 'line', 3332
$P1.'emit'(__ARG_1, $S7)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 3335
$P10 = $P1.'getIntegerValue'()
set $I1, $P10
set $S7, $I1
.annotate 'line', 3336
# }
__label_14: # endif
.annotate 'line', 3338
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_18
$I4 = $P2.'isidentifier'()
__label_18:
unless $I4 goto __label_16
# {
.annotate 'line', 3339
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S8, $P11
.annotate 'line', 3340
$P2.'emit'(__ARG_1, $S8)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 3343
# string type: $S9
$P11 = $P2.'checkResult'()
null $S9
if_null $P11, __label_19
set $S9, $P11
__label_19:
set $S12, $S9
set $S13, 'S'
.annotate 'line', 3344
if $S12 == $S13 goto __label_22
set $S13, 'I'
if $S12 == $S13 goto __label_23
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3346
$P13 = self.'checkResult'()
$P12 = self.'tempreg'($P13)
set $S8, $P12
.annotate 'line', 3347
$P2.'emit'(__ARG_1, $S8)
goto __label_20 # break
__label_23: # case
__label_21: # default
.annotate 'line', 3351
$P14 = $P2.'getIntegerValue'()
set $I2, $P14
set $S8, $I2
goto __label_20 # break
__label_20: # switch end
.annotate 'line', 3353
# }
__label_17: # endif
.annotate 'line', 3356
self.'annotate'(__ARG_1)
.annotate 'line', 3357
__ARG_1.'say'('mul ', __ARG_2, ', ', $S7, ', ', $S8)
# }
.annotate 'line', 3358

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3239
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3365
# Body
# {
.annotate 'line', 3367
self.'optimizearg'()
.annotate 'line', 3368
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3369
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3370
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3371
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3372
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3373
# var lval: $P3
null $P3
.annotate 'line', 3374
# var rval: $P4
null $P4
.annotate 'line', 3375
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3376
getattribute $P3, $P1, 'numval'
.annotate 'line', 3377
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3378
getattribute $P4, $P2, 'numval'
.annotate 'line', 3379
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3380
isne $I4, $I2, 0
unless $I4 goto __label_6
.annotate 'line', 3381
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
.annotate 'line', 3384
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3385
getattribute $P3, $P1, 'numval'
.annotate 'line', 3386
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3387
getattribute $P4, $P2, 'numval'
.annotate 'line', 3388
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3389
isne $I4, $N2, $N3
unless $I4 goto __label_8
.annotate 'line', 3390
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
.annotate 'line', 3394
.return(self)
# }
.annotate 'line', 3395

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3396
# Body
# {
.annotate 'line', 3398
.return('N')
# }
.annotate 'line', 3399

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3400
# Body
# {
.annotate 'line', 3402
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3403
# var lreg: $P2
null $P2
.annotate 'line', 3404
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_0
.annotate 'line', 3405
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3407
$P2 = self.'tempreg'('N')
.annotate 'line', 3408
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3410
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3411
# var rreg: $P4
null $P4
.annotate 'line', 3412
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_2
.annotate 'line', 3413
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3415
$P4 = self.'tempreg'('N')
.annotate 'line', 3416
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3418
self.'annotate'(__ARG_1)
.annotate 'line', 3419
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3420

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3363
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3427
# Body
# {
.annotate 'line', 3429
.return('I')
# }
.annotate 'line', 3430

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3431
# Body
# {
.annotate 'line', 3433
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3434
# var lreg: $P2
null $P2
.annotate 'line', 3435
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3436
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3438
$P2 = self.'tempreg'('I')
.annotate 'line', 3439
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3441
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3442
# var rreg: $P4
null $P4
.annotate 'line', 3443
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3444
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3446
$P4 = self.'tempreg'('I')
.annotate 'line', 3447
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3449
self.'annotate'(__ARG_1)
.annotate 'line', 3450
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3451

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3425
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3458
# Body
# {
.annotate 'line', 3460
.return('I')
# }
.annotate 'line', 3461

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3462
# Body
# {
.annotate 'line', 3464
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3465
# var lreg: $P2
null $P2
.annotate 'line', 3466
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3467
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3469
$P2 = self.'tempreg'('I')
.annotate 'line', 3470
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3472
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3473
# var rreg: $P4
null $P4
.annotate 'line', 3474
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3475
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3477
$P4 = self.'tempreg'('I')
.annotate 'line', 3478
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3480
self.'annotate'(__ARG_1)
.annotate 'line', 3485
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3486

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3456
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3495
# Body
# {
.annotate 'line', 3497
setattribute self, 'arg', __ARG_1
.annotate 'line', 3498
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3499

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3500
# Body
# {
.annotate 'line', 3502
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3503
.return(self)
# }
.annotate 'line', 3504

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3505
# Body
# {
.annotate 'line', 3507
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3508

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3493
addattribute $P0, 'arg'
.annotate 'line', 3494
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3511
# Body
# {
.annotate 'line', 3513
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3514
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3515
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3516
.return(1)
# }
.annotate 'line', 3517

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3526
# Body
# {
.annotate 'line', 3528
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3529
setattribute self, 'predef', __ARG_3
.annotate 'line', 3530
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3531

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3532
# Body
# {
.annotate 'line', 3534
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3535

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3536
# Body
# {
.annotate 'line', 3538
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3539
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3540
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3541
# var arg: $P4
null $P4
.annotate 'line', 3542
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3543
iseq $I4, $I1, -1
unless $I4 goto __label_0
# {
.annotate 'line', 3544
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3545
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3546
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3550
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3551
# int i: $I3
null $I3
goto __label_7
__label_5: # for iteration
inc $I3
__label_7: # for condition
islt $I4, $I3, $I2
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 3552
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3553
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3554
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3555
# string argr: $S4
null $S4
.annotate 'line', 3556
iseq $I5, $S2, $S3
if $I5 goto __label_12
iseq $I5, $S3, '?'
__label_12:
unless $I5 goto __label_10
.annotate 'line', 3557
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3559
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3560
iseq $I5, $S3, 'P'
unless $I5 goto __label_13
# {
.annotate 'line', 3561
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3562
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
.annotate 'line', 3567
isne $I6, $S5, ''
unless $I6 goto __label_19
.annotate 'line', 3568
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3570
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3572
$P3.'push'($S4)
# }
goto __label_5 # for iteration
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3575
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3576

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3521
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3523
addattribute $P0, 'predef'
.annotate 'line', 3524
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3586
# Body
# {
.annotate 'line', 3588
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3589
setattribute self, 'funref', __ARG_4
.annotate 'line', 3590
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3591
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3592
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3593
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3594
# {
.annotate 'line', 3595
# var modifier: $P2
null $P2
.annotate 'line', 3596
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3597
$P1 = __ARG_1.'get'()
.annotate 'line', 3598
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3599
$P1 = __ARG_1.'get'()
.annotate 'line', 3600
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3601
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3602
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3605
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3608
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3609
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3610
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3611
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3613

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3614
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3615
# Body
# {
.annotate 'line', 3617
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3618
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3619
'optimize_array'($P1)
.annotate 'line', 3622
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3623
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3624
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3625
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3626
isnull $I1, $P3
not $I1
unless $I1 goto __label_2
# {
.annotate 'line', 3627
self.'use_predef'($S1)
.annotate 'line', 3630
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3631
isnull $I2, $P4
not $I2
unless $I2 goto __label_3
# {
.annotate 'line', 3632
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3633
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3636
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
.annotate 'line', 3640
.return(self)
# }
.annotate 'line', 3641

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3642
# Body
# {
.annotate 'line', 3644
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3645
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3646
# string call: $S1
null $S1
.annotate 'line', 3647
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3648
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 3649
iseq $I6, $S1, ''
unless $I6 goto __label_2
# {
.annotate 'line', 3650
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S8, "'", $S2
concat $S1, $S8, "'"
.annotate 'line', 3651
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3655
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 3657
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3658
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 3659
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 3660
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 3661
# string reg: $S3
null $S3
.annotate 'line', 3662
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 3663
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 3664
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 3667
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 3668
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 3670
self.'annotate'(__ARG_1)
.annotate 'line', 3672
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 3673
$S9 = __ARG_2
iseq $I7, $S9, '.tailcall'
unless $I7 goto __label_12
.annotate 'line', 3674
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 3676
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 3679
unless $I1 goto __label_14
.annotate 'line', 3680
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 3682
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 3684
__ARG_1.'print'('(')
.annotate 'line', 3686
# string sep: $S4
set $S4, ''
.annotate 'line', 3687
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 3688
# int i: $I3
null $I3
goto __label_18
__label_16: # for iteration
inc $I3
__label_18: # for condition
islt $I7, $I3, $I2
unless $I7 goto __label_17 # for end
# {
.annotate 'line', 3689
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 3690
__ARG_1.'print'($S4, $S5)
.annotate 'line', 3691
# int isflat: $I4
null $I4
.annotate 'line', 3692
# int isnamed: $I5
null $I5
.annotate 'line', 3693
# string setname: $S6
set $S6, ''
.annotate 'line', 3694
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 3695
isnull $I8, $P6
not $I8
unless $I8 goto __label_19
# {
.annotate 'line', 3696
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 3697
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 3698
iseq $I8, $S7, 'flat'
unless $I8 goto __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 3700
iseq $I9, $S7, 'named'
unless $I9 goto __label_24
# {
set $I5, 1
.annotate 'line', 3702
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
.annotate 'line', 3706
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 3707
$P17 = $P8.'isstringliteral'()
isfalse $I11, $P17
unless $I11 goto __label_29
.annotate 'line', 3708
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 3709
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 3712
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
.annotate 'line', 3717
and $I10, $I11, $I12
unless $I10 goto __label_30
.annotate 'line', 3718
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 3719
unless $I4 goto __label_32
.annotate 'line', 3720
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 3721
unless $I5 goto __label_34
# {
.annotate 'line', 3722
__ARG_1.'print'(' :named')
.annotate 'line', 3723
isne $I12, $S6, ''
unless $I12 goto __label_35
.annotate 'line', 3724
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 3726
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 3728
__ARG_1.'say'(')')
# }
.annotate 'line', 3729

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 3581
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3583
addattribute $P0, 'funref'
.annotate 'line', 3584
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3739
# Body
# {
.annotate 'line', 3741
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3742
setattribute self, 'left', __ARG_4
.annotate 'line', 3743
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 3744

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 3745
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3746
# Body
# {
.annotate 'line', 3748
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3749
.return(self)
# }
.annotate 'line', 3750

.end # optimize


.sub 'get_member' :method

.annotate 'line', 3751
# Body
# {
.annotate 'line', 3753
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 3754

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 3755
# Body
# {
.annotate 'line', 3757
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 3758
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3759
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3760
isne $I1, $S1, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3761
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 3762
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 3763
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 3765
.return($S2)
# }
.annotate 'line', 3766

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3767
# Body
# {
.annotate 'line', 3769
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3770
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3771
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3772
self.'annotate'(__ARG_1)
.annotate 'line', 3773
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 3774
.return($S3)
# }
.annotate 'line', 3775

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3776
# Body
# {
.annotate 'line', 3778
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3779
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3780
self.'annotate'(__ARG_1)
.annotate 'line', 3781
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 3782

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3783
# Body
# {
.annotate 'line', 3785
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3786
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3787
# string value: $S3
null $S3
.annotate 'line', 3788
iseq $I1, __ARG_2, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3790
iseq $I2, __ARG_3, 'null'
unless $I2 goto __label_4
# {
.annotate 'line', 3791
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 3792
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 3794
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3797
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 3798
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 3800
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 3801

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3802
# Body
# {
.annotate 'line', 3804
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3805
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3806
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3807
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 3808
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3810
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 3811
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
isne $I1, $S5, 'P'
unless $I1 goto __label_6
.annotate 'line', 3812
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 3814
# }
__label_4: # endif
.annotate 'line', 3816
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 3817
.return($S3)
# }
.annotate 'line', 3818

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 3734
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3736
addattribute $P0, 'left'
.annotate 'line', 3737
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3827
# Body
# {
.annotate 'line', 3829
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3830
setattribute self, 'left', __ARG_4
.annotate 'line', 3831
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 3832

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 3833
# Body
# {
.annotate 'line', 3835
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
iseq $I1, $S1, 'S'
unless $I1 goto __label_0
.annotate 'line', 3836
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 3838
.return('P')
__label_1: # endif
# }
.annotate 'line', 3839

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3840
# Body
# {
.annotate 'line', 3842
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3843
self.'optimizeargs'()
.annotate 'line', 3844
.return(self)
# }
.annotate 'line', 3845

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3846
# Body
# {
.annotate 'line', 3848
# var regleft: $P1
null $P1
.annotate 'line', 3849
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 3850
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 3852
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 3853
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 3854
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3855
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 3856
iseq $I2, $S1, 'S'
unless $I2 goto __label_3
# {
.annotate 'line', 3857
isne $I3, $I1, 1
unless $I3 goto __label_5
.annotate 'line', 3858
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 3859
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3862
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 3863
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3864
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 3866

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3867
# Body
# {
.annotate 'line', 3869
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3870
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3871
self.'annotate'(__ARG_1)
.annotate 'line', 3872
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3873
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 3874
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 3875

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3876
# Body
# {
.annotate 'line', 3878
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3879
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3880
# string rreg: $S1
null $S1
.annotate 'line', 3881
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3882
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 3883
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 3886
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 3887
self.'annotate'(__ARG_1)
.annotate 'line', 3888
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3889
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3890
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 3891
.return($S1)
# }
.annotate 'line', 3892

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 3823
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 3825
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3901
# Body
# {
.annotate 'line', 3903
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3904
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 3905
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3906
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 3907
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3908
# {
.annotate 'line', 3909
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3910
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 3911
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 3912
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 3913
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3915

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 3916
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3917
# Body
# {
.annotate 'line', 3919
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3920
.return(self)
# }
.annotate 'line', 3921

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3922
# Body
# {
.annotate 'line', 3924
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3925
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3926

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3927
# Body
# {
.annotate 'line', 3929
self.'annotate'(__ARG_1)
.annotate 'line', 3930
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3931
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 3932
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3933
# string itemreg: $S3
null $S3
.annotate 'line', 3934
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 3935
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 3936
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
.annotate 'line', 3938
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 3939
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 3943
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 3945
self.'annotate'(__ARG_1)
.annotate 'line', 3946
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 3948
.return($S1)
# }
.annotate 'line', 3949

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 3897
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3899
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3959
# Body
# {
.annotate 'line', 3961
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3962
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3963
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 3964
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 3965
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 3966
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3967
# {
.annotate 'line', 3975
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3976
'ExpectOp'(':', __ARG_1)
.annotate 'line', 3977
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3978
$P2.'push'($P4)
.annotate 'line', 3979
$P3.'push'($P5)
# }
.annotate 'line', 3981
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 3982
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 3983
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3985
setattribute self, 'keys', $P2
.annotate 'line', 3986
setattribute self, 'values', $P3
# }
.annotate 'line', 3987

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 3988
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3989
# Body
# {
.annotate 'line', 3991
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 3992
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3993
.return(self)
# }
.annotate 'line', 3994

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3995
# Body
# {
.annotate 'line', 3997
self.'annotate'(__ARG_1)
.annotate 'line', 3998
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 3999
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4000
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4001
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4002
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 4003
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4004
# string item: $S1
null $S1
.annotate 'line', 4005
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 4006
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 4007
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4008
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 4011
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4013
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4014
# string itemreg: $S3
null $S3
.annotate 'line', 4015
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4016
# string id: $S4
$P8 = $P4.'getName'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4017
getattribute $P9, self, 'owner'
$P8 = $P9.'getvar'($S4)
isnull $I3, $P8
unless $I3 goto __label_9
# {
.annotate 'line', 4018
$P10 = self.'tempreg'('P')
set $S3, $P10
.annotate 'line', 4019
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S4, "'")
# }
goto __label_10
__label_9: # else
.annotate 'line', 4022
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4025
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4026
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 4048

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4049
# Body
# {
.annotate 'line', 4051
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4052
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4053
.return($S1)
# }
.annotate 'line', 4054

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 3954
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3956
addattribute $P0, 'keys'
.annotate 'line', 3957
addattribute $P0, 'values'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4064
# Body
# {
.annotate 'line', 4066
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4068
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4069
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4070
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4071
$P6 = __ARG_4.'isidentifier'()
if_null $P6, __label_2
unless $P6 goto __label_2
# {
.annotate 'line', 4072
$P7 = $P1.'isop'('.')
if_null $P7, __label_4
unless $P7 goto __label_4
# {
.annotate 'line', 4073
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4074
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4075
# {
.annotate 'line', 4076
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4077
$P6 = $P3.'isidentifier'()
isfalse $I1, $P6
unless $I1 goto __label_9
.annotate 'line', 4078
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4079
$P2.'push'($P3)
# }
.annotate 'line', 4080
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'('.')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 4081
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4084
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4087
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4089
$P9 = $P1.'isop'('(')
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 4090
$P1 = __ARG_1.'get'()
.annotate 'line', 4091
$P10 = $P1.'isop'(')')
isfalse $I2, $P10
unless $I2 goto __label_12
# {
.annotate 'line', 4092
__ARG_1.'unget'($P1)
.annotate 'line', 4093
# var initializer: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
set $P4, $P10
__label_13: # do
.annotate 'line', 4094
# {
.annotate 'line', 4095
# var auxinit: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4096
$P4.'push'($P5)
# }
.annotate 'line', 4097
$P1 = __ARG_1.'get'()
$P11 = $P1.'isop'(',')
if_null $P11, __label_14
if $P11 goto __label_13
__label_14: # enddo
.annotate 'line', 4098
setattribute self, 'initializer', $P4
.annotate 'line', 4099
'RequireOp'(')', $P1)
# }
__label_12: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4103
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4104

.end # NewExpr


.sub 'checkResult' :method

.annotate 'line', 4105
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4106
# Body
# {
.annotate 'line', 4108
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4109
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4112
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4113
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4114
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4115
$P5 = $P3['id']
isnull $I2, $P5
not $I2
unless $I2 goto __label_4
# {
.annotate 'line', 4116
$P1 = $P3['value']
.annotate 'line', 4117
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4118
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4119
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4122
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4126
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4127
isnull $I3, $P4
not $I3
unless $I3 goto __label_7
.annotate 'line', 4128
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4129
.return(self)
# }
.annotate 'line', 4130

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4131
# Body
# {
.annotate 'line', 4133
self.'annotate'(__ARG_1)
.annotate 'line', 4135
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4136
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
.annotate 'line', 4141
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4142
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4143
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
.annotate 'line', 4145
# string reginit: $S1
set $S1, ''
.annotate 'line', 4146
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4147
# string constructor: $S3
null $S3
set $I4, $I1
null $I5
.annotate 'line', 4148
if $I4 == $I5 goto __label_11
set $I5, 1
if $I4 == $I5 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4152
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4153
$P10 = $P2.'emit_get'(__ARG_1)
set $S1, $P10
concat $S1, ', ', $S1
goto __label_9 # break
__label_10: # default
.annotate 'line', 4157
isne $I6, $I2, 1
unless $I6 goto __label_14
isne $I6, $I2, 2
__label_14:
unless $I6 goto __label_13
.annotate 'line', 4158
getattribute $P11, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P11)
__label_13: # endif
.annotate 'line', 4159
$P12 = self.'tempreg'('P')
set $S2, $P12
__label_9: # switch end
set $I4, $I2
null $I5
.annotate 'line', 4162
if $I4 == $I5 goto __label_17
set $I5, 2
if $I4 == $I5 goto __label_18
set $I5, 1
if $I4 == $I5 goto __label_19
goto __label_16
# switch
__label_17: # case
.annotate 'line', 4165
# string name: $S4
getattribute $P14, self, 'value'
$P13 = $P14.'rawstring'()
null $S4
if_null $P13, __label_20
set $S4, $P13
__label_20:
.annotate 'line', 4166
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4167
isnull $I6, $P3
unless $I6 goto __label_21
concat $S7, "Can't locate class ", $S4
concat $S6, $S7, " at compile time"
.annotate 'line', 4168
getattribute $P15, self, 'value'
'Warn'($S6, $P15)
__label_21: # endif
.annotate 'line', 4172
getattribute $P16, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P16, " ]", $S1)
.annotate 'line', 4173
isgt $I7, $I1, 1
unless $I7 goto __label_22
# {
.annotate 'line', 4174
getattribute $P17, self, 'value'
__ARG_1.'say'($S2, ".'", $P17, "'()")
# }
__label_22: # endif
goto __label_15 # break
__label_18: # case
.annotate 'line', 4178
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4179
# predefined elements
elements $I8, $P4
sub $I7, $I8, 1
$S3 = $P4[$I7]
.annotate 'line', 4180
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_15 # break
__label_19: # case
.annotate 'line', 4183
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4184
isnull $I9, $P5
unless $I9 goto __label_23
# {
.annotate 'line', 4186
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4187
isnull $I8, $P6
not $I8
unless $I8 goto __label_25
# {
.annotate 'line', 4188
$P18 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P18, $S1)
# }
goto __label_26
__label_25: # else
# {
.annotate 'line', 4191
'Warn'('Checking: new unknown type')
.annotate 'line', 4192
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_26: # endif
.annotate 'line', 4194
getattribute $P19, self, 'value'
set $S3, $P19
# }
goto __label_24
__label_23: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4198
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_24: # endif
goto __label_15 # break
__label_16: # default
.annotate 'line', 4202
'InternalError'('Unexpected type in new')
__label_15: # switch end
.annotate 'line', 4204
isgt $I9, $I1, 1
unless $I9 goto __label_27
# {
.annotate 'line', 4205
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4206
iter $P21, $P1
set $P21, 0
__label_28: # for iteration
unless $P21 goto __label_29
shift $P8, $P21
# {
.annotate 'line', 4207
# string reg: $S5
$P20 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P20, __label_30
set $S5, $P20
__label_30:
.annotate 'line', 4208
$P7.'push'($S5)
# }
goto __label_28
__label_29: # endfor
.annotate 'line', 4210
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4211
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4212
__ARG_1.'say'(")")
.annotate 'line', 4213
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_27: # endif
# }
.annotate 'line', 4215

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4059
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4061
addattribute $P0, 'value'
.annotate 'line', 4062
addattribute $P0, 'initializer'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4225
# Body
# {
.annotate 'line', 4227
# var first: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4228
$P4 = $P1.'isstring'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 4229
'SyntaxError'('Expected string literal', $P1)
__label_0: # endif
.annotate 'line', 4230
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4231
$P4 = $P2.'isop'(':')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 4232
setattribute self, 'hll', $P1
.annotate 'line', 4233
$P1 = __ARG_1.'get'()
.annotate 'line', 4234
$P5 = $P1.'isstring'()
isfalse $I1, $P5
unless $I1 goto __label_2
.annotate 'line', 4235
'SyntaxError'('Expected string literal', $P1)
__label_2: # endif
.annotate 'line', 4236
$P2 = __ARG_1.'get'()
# }
__label_1: # endif
.annotate 'line', 4238
# var nskey: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4239
$P3.'push'($P1)
__label_4: # while
.annotate 'line', 4240
$P6 = $P2.'isop'(',')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 4241
$P1 = __ARG_1.'get'()
.annotate 'line', 4242
$P7 = $P1.'isstring'()
isfalse $I2, $P7
unless $I2 goto __label_5
.annotate 'line', 4243
'SyntaxError'('Expected string literal', $P1)
__label_5: # endif
.annotate 'line', 4244
$P3.'push'($P1)
.annotate 'line', 4245
$P2 = __ARG_1.'get'()
# }
goto __label_4
__label_3: # endwhile
.annotate 'line', 4247
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_6
.annotate 'line', 4248
'SyntaxError'("Expected ']' in keyed new", $P2)
__label_6: # endif
.annotate 'line', 4249
setattribute self, 'nskey', $P3
# }
.annotate 'line', 4250

.end # NewIndexedExpr


.sub 'checkResult' :method

.annotate 'line', 4251
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4252
# Body
# {
.annotate 'line', 4254
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 4255
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4256
__ARG_1.'print'("root_new ", __ARG_2, ", [", $P1, "; ")
goto __label_1
__label_0: # else
.annotate 'line', 4258
__ARG_1.'print'("new ", __ARG_2, ", [")
__label_1: # endif
.annotate 'line', 4259
# var nskey: $P2
getattribute $P2, self, 'nskey'
# predefined join
.annotate 'line', 4260
join $S1, ";", $P2
__ARG_1.'print'($S1)
.annotate 'line', 4262
__ARG_1.'say'("]")
# }
.annotate 'line', 4263

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4220
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4222
addattribute $P0, 'hll'
.annotate 'line', 4223
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4268
# Body
# {
.annotate 'line', 4270
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4271
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 4272
new $P4, [ 'NewIndexedExpr' ]
$P4.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 4273
$P5 = $P1.'isop'('(')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4274
new $P7, [ 'CallExpr' ]
.annotate 'line', 4275
new $P9, [ 'StringLiteral' ]
$P9.'StringLiteral'(__ARG_2, __ARG_3)
set $P8, $P9
$P7.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P8)
set $P6, $P7
.annotate 'line', 4274
.return($P6)
goto __label_3
__label_2: # else
.annotate 'line', 4277
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4278

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4287
# Body
# {
.annotate 'line', 4289
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4290
setattribute self, 'eleft', __ARG_3
.annotate 'line', 4291
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4292

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4293
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4294
# Body
# {
.annotate 'line', 4296
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4297
# string checkedval: $S1
null $S1
.annotate 'line', 4298
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4299
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S3, "'", $S1
concat $S1, $S3, "'"
.annotate 'line', 4300
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4304
# string r: $S2
getattribute $P3, self, 'eleft'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4305
self.'annotate'(__ARG_1)
.annotate 'line', 4306
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4307

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4282
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4284
addattribute $P0, 'eleft'
.annotate 'line', 4285
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4322
# Body
# {
.annotate 'line', 4324
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4325
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4326
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4327
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4328
.return(self)
# }
.annotate 'line', 4329

.end # set


.sub 'optimize' :method

.annotate 'line', 4330
# Body
# {
.annotate 'line', 4332
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4333
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
.annotate 'line', 4335
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4337
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4339
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4340
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4341
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4343

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4344
# Body
# {
.annotate 'line', 4346
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4347

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4348
# Body
# {
.annotate 'line', 4350
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4351
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4352
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4353
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4354
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4355
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4356
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4357
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4358

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4312
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4318
addattribute $P0, 'condition'
.annotate 'line', 4319
addattribute $P0, 'etrue'
.annotate 'line', 4320
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

.annotate 'line', 4391
# Body
# {
.annotate 'line', 4393
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
.annotate 'line', 4394
.return(1)
__label_3: # case
.annotate 'line', 4395
.return(2)
__label_4: # case
.annotate 'line', 4396
.return(3)
__label_1: # default
.annotate 'line', 4397
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4399

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4401
# Body
# {
.annotate 'line', 4403
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
.annotate 'line', 4404
.return(8)
__label_3: # case
.annotate 'line', 4405
.return(11)
__label_4: # case
.annotate 'line', 4406
.return(9)
__label_5: # case
.annotate 'line', 4407
.return(10)
__label_1: # default
.annotate 'line', 4408
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4410

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4412
# Body
# {
.annotate 'line', 4414
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
.annotate 'line', 4415
.return(19)
__label_3: # case
.annotate 'line', 4416
.return(20)
__label_4: # case
.annotate 'line', 4417
.return(21)
__label_5: # case
.annotate 'line', 4418
.return(22)
__label_1: # default
.annotate 'line', 4419
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4421

.end # getOpCode_5


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4423
# Body
# {
.annotate 'line', 4425
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
.annotate 'line', 4426
.return(14)
__label_3: # case
.annotate 'line', 4427
.return(16)
__label_4: # case
.annotate 'line', 4428
.return(15)
__label_5: # case
.annotate 'line', 4429
.return(17)
__label_1: # default
.annotate 'line', 4430
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4432

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4434
# Body
# {
.annotate 'line', 4436
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
.annotate 'line', 4437
.return(4)
__label_3: # case
.annotate 'line', 4438
.return(5)
__label_4: # case
.annotate 'line', 4439
.return(6)
__label_5: # case
.annotate 'line', 4440
.return(18)
__label_6: # case
.annotate 'line', 4441
.return(23)
__label_7: # case
.annotate 'line', 4442
.return(24)
__label_1: # default
.annotate 'line', 4443
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4445

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4447
# Body
# {
.annotate 'line', 4449
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4451
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4452
# var expr: $P2
null $P2
.annotate 'line', 4453
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4454
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4455
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4456
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4458
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4459
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4460
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4461
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4462
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4463
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4464
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4465
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4466
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4467
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4468
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4469
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4470
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4471
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 4472
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 4473
new $P15, [ 'IdentifierExpr' ]
.tailcall $P15.'set'(__ARG_2, $P1)
__label_8: # endif
.annotate 'line', 4474
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4475

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4477
# Body
# {
.annotate 'line', 4479
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4480
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4482
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4483
# var t: $P2
null $P2
.annotate 'line', 4484
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4485
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
set $I3, $I1
set $I4, 1
.annotate 'line', 4486
if $I3 == $I4 goto __label_4
set $I4, 2
if $I3 == $I4 goto __label_5
set $I4, 3
if $I3 == $I4 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4488
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4491
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4494
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4497
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4500
__ARG_1.'unget'($P2)
.annotate 'line', 4501
.return($P1)
# }
.annotate 'line', 4502

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4504
# Body
# {
.annotate 'line', 4506
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4508
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4509
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4510
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4511
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4512
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4513
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4516
__ARG_1.'unget'($P2)
.annotate 'line', 4517
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4519

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4521
# Body
# {
.annotate 'line', 4523
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4524
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4525
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4527
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4528
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4529
# var subexpr: $P2
null $P2
.annotate 'line', 4530
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4531
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4532
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4533
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
.annotate 'line', 4535
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4538
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4541
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4544
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4547
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4549
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4552
__ARG_1.'unget'($P1)
.annotate 'line', 4553
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4555
.return($P2)
# }
.annotate 'line', 4556

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4558
# Body
# {
.annotate 'line', 4560
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4561
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4563
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4564
# var t: $P2
null $P2
.annotate 'line', 4565
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4566
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4567
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4568
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4569
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
.annotate 'line', 4571
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4574
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4577
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4580
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4583
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 4585
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4586
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4588
__ARG_1.'unget'($P2)
.annotate 'line', 4589
.return($P1)
# }
.annotate 'line', 4590

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4592
# Body
# {
.annotate 'line', 4594
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 4596
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4597
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4598
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 4599
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4600
# var expr: $P4
null $P4
.annotate 'line', 4601
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 4602
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 4604
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 4605
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4607
__ARG_1.'unget'($P2)
.annotate 'line', 4608
.return($P1)
# }
.annotate 'line', 4609

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4611
# Body
# {
.annotate 'line', 4613
.const 'Sub' $P5 = 'parseExpr_6'
.annotate 'line', 4615
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4616
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4617
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
.annotate 'line', 4618
$P6 = $P2.'isop'('==')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4619
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4620
new $P6, [ 'OpEqualExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 4622
$P7 = $P2.'isop'('!=')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4623
# var eright: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4624
new $P7, [ 'OpNotEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4627
new $P8, [ 'OpInstanceOfExpr' ]
$P8.'OpInstanceOfExpr'(__ARG_2, $P2, $P1, __ARG_1)
set $P1, $P8
# }
__label_7: # endif
__label_5: # endif
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4630
__ARG_1.'unget'($P2)
.annotate 'line', 4631
.return($P1)
# }
.annotate 'line', 4632

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4634
# Body
# {
.annotate 'line', 4636
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 4637
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 4639
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4640
# var t: $P2
null $P2
.annotate 'line', 4641
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4642
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4643
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 4644
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
.annotate 'line', 4646
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 4649
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 4652
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 4655
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 4658
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4661
__ARG_1.'unget'($P2)
.annotate 'line', 4662
.return($P1)
# }
.annotate 'line', 4663

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4665
# Body
# {
.annotate 'line', 4667
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 4669
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4670
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4671
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4672
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4673
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4675
__ARG_1.'unget'($P2)
.annotate 'line', 4676
.return($P1)
# }
.annotate 'line', 4677

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4679
# Body
# {
.annotate 'line', 4681
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 4683
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4684
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4685
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4686
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4687
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4689
__ARG_1.'unget'($P2)
.annotate 'line', 4690
.return($P1)
# }
.annotate 'line', 4691

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4693
# Body
# {
.annotate 'line', 4695
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 4697
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4698
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4699
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4700
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4701
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4703
__ARG_1.'unget'($P2)
.annotate 'line', 4704
.return($P1)
# }
.annotate 'line', 4705

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4707
# Body
# {
.annotate 'line', 4709
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 4711
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4712
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4713
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4714
# var eright: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 4715
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4717
__ARG_1.'unget'($P2)
.annotate 'line', 4718
.return($P1)
# }
.annotate 'line', 4719

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4721
# Body
# {
.annotate 'line', 4723
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4724
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 4726
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4727
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4728
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 4729
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4730
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4731
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4732
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4735
__ARG_1.'unget'($P2)
.annotate 'line', 4736
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 4738

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4740
# Body
# {
.annotate 'line', 4742
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4743
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 4744
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 4746
# var eleft: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4747
# var t: $P2
null $P2
.annotate 'line', 4748
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4749
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4750
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4751
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 4752
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
.annotate 'line', 4754
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4757
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4760
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4763
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 4766
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 4769
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4772
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 4774
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4775
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4777
__ARG_1.'unget'($P2)
.annotate 'line', 4778
.return($P1)
# }
.annotate 'line', 4779

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4781
# Body
# {
.annotate 'line', 4783
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 4785
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 4786

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 4799
# Body
# {
.annotate 'line', 4801
getattribute $P1, self, 'brlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4802
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 4803
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4804
setattribute self, 'brlabel', $P2
.annotate 'line', 4805
.return($S1)
# }
.annotate 'line', 4806

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 4807
# Body
# {
.annotate 'line', 4809
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 4810
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4811
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 4812
.return($P1)
# }
.annotate 'line', 4813

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 4797
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 4820
# Body
# {
.annotate 'line', 4822
getattribute $P1, self, 'cntlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4823
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 4824
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4825
setattribute self, 'cntlabel', $P2
.annotate 'line', 4826
.return($S1)
# }
.annotate 'line', 4827

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 4828
# Body
# {
.annotate 'line', 4830
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 4831
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4832
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 4833
.return($P1)
# }
.annotate 'line', 4834

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 4816
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 4818
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4848
# Body
# {
.annotate 'line', 4850
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4851
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4852
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 4853
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 4854
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 4855
# {
.annotate 'line', 4856
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 4857
$P2.'push'($P3)
# }
.annotate 'line', 4858
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 4860
'RequireOp'(';', $P1)
.annotate 'line', 4861
setattribute self, 'values', $P2
# }
.annotate 'line', 4862

.end # parse


.sub 'optimize' :method

.annotate 'line', 4863
# Body
# {
.annotate 'line', 4865
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4866
.return(self)
# }
.annotate 'line', 4867

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4868
# Body
# {
.annotate 'line', 4870
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 4871
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4872
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 4875
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4876
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 4878
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 4879
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 4880
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 4881
self.'annotate'(__ARG_1)
.annotate 'line', 4882
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 4886
# int i: $I2
null $I2
goto __label_7
__label_5: # for iteration
inc $I2
__label_7: # for condition
islt $I4, $I2, $I1
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 4887
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 4888
# string reg: $S1
null $S1
.annotate 'line', 4889
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 4890
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 4891
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4894
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 4895
$P1.'push'($S1)
# }
goto __label_5 # for iteration
__label_6: # for end
.annotate 'line', 4897
self.'annotate'(__ARG_1)
.annotate 'line', 4898
self.'emitret'(__ARG_1)
.annotate 'line', 4899
# string sep: $S2
set $S2, ''
.annotate 'line', 4900
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 4901
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 4902
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 4904
__ARG_1.'say'(')')
# }
.annotate 'line', 4905

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 4844
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 4846
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4910
# Body
# {
.annotate 'line', 4912
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4913

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4914
# Body
# {
.annotate 'line', 4916
__ARG_1.'print'('.return(')
# }
.annotate 'line', 4917

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 4908
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4922
# Body
# {
.annotate 'line', 4924
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4925

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4926
# Body
# {
.annotate 'line', 4928
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 4929

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 4920
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4940
# Body
# {
.annotate 'line', 4942
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 4943
setattribute self, 'name', __ARG_1
.annotate 'line', 4944
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 4945
setattribute self, 'value', $P2
.annotate 'line', 4946
.return(self)
# }
.annotate 'line', 4947

.end # set


.sub 'optimize' :method

.annotate 'line', 4948
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4949
# Body
# {
.annotate 'line', 4951
self.'annotate'(__ARG_1)
.annotate 'line', 4952
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4953
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 4954
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 4955

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 4936
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 4938
addattribute $P0, 'name'
.annotate 'line', 4939
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4966
# Body
# {
.annotate 'line', 4968
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4969
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4970
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 4971
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 4972
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 4973
setattribute self, 'label', $P1
.annotate 'line', 4974
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 4975

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 4976
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4977
# Body
# {
.annotate 'line', 4979
self.'annotate'(__ARG_1)
.annotate 'line', 4980
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4981
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 4982
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 4983

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 4962
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 4964
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 4992
# Body
# {
.annotate 'line', 4994
'ExpectOp'('(', __ARG_1)
.annotate 'line', 4995
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 4996
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 4997

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 4990
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

.annotate 'line', 5008
# Body
# {
.annotate 'line', 5010
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5011
self.'parsecondition'(__ARG_2)
.annotate 'line', 5012
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5013
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5014
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5015
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5017
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5018
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5020

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5021
# Body
# {
.annotate 'line', 5023
self.'optimize_condition'()
.annotate 'line', 5024
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5025
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5026
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5027
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5029
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5031
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5033
.return(self)
# }
.annotate 'line', 5034

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5035
# Body
# {
.annotate 'line', 5037
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5038
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5039
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5040
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5041
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5042
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5043
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5044
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5045
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5046
self.'annotate'(__ARG_1)
.annotate 'line', 5047
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5048
$P1.'emit'(__ARG_1)
.annotate 'line', 5050
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5051
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5052
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5053
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5055
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5056

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5004
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5006
addattribute $P0, 'truebranch'
.annotate 'line', 5007
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5066
# Body
# {
.annotate 'line', 5068
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5069

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5070
# Body
# {
.annotate 'line', 5072
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5073
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5075
self.'annotate'(__ARG_1)
.annotate 'line', 5076
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5077
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5078
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5079
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5080

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5063
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5065
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5089
# Body
# {
.annotate 'line', 5091
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5092
self.'parsecondition'(__ARG_2)
.annotate 'line', 5093
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5094

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5095
# Body
# {
.annotate 'line', 5097
self.'optimize_condition'()
.annotate 'line', 5098
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5099
.return(self)
# }
.annotate 'line', 5100

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5101
# Body
# {
.annotate 'line', 5103
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5105
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5108
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5111
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5112
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5114
self.'annotate'(__ARG_1)
.annotate 'line', 5115
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5116
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5117
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5118
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5119
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5121

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5087
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

.annotate 'line', 5130
# Body
# {
.annotate 'line', 5132
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5133
self.'parsebody'(__ARG_2)
.annotate 'line', 5134
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5135
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5136

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5137
# Body
# {
.annotate 'line', 5139
self.'optimize_condition'()
.annotate 'line', 5140
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5141
.return(self)
# }
.annotate 'line', 5142

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5143
# Body
# {
.annotate 'line', 5145
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5147
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5150
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5151
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5152
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5154
self.'annotate'(__ARG_1)
.annotate 'line', 5155
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5157
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5158
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5159
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5161

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5128
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

.annotate 'line', 5170
# Body
# {
.annotate 'line', 5172
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5173
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5174

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5175
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5176
# Body
# {
.annotate 'line', 5178
self.'annotate'(__ARG_1)
.annotate 'line', 5179
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5180
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5181

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5168
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5190
# Body
# {
.annotate 'line', 5192
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5193
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5194

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5195
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5196
# Body
# {
.annotate 'line', 5198
self.'annotate'(__ARG_1)
.annotate 'line', 5199
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5200
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5201

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5188
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5215
# Body
# {
.annotate 'line', 5217
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5218
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5219
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5220
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5221
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5222
$P1 = __ARG_2.'get'()
.annotate 'line', 5223
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5224
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5225
$P1 = __ARG_2.'get'()
.annotate 'line', 5226
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5227
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5228
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5229
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5230
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5231
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5232
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5233
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5234
$P1 = __ARG_2.'get'()
.annotate 'line', 5235
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5236
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5237
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5238
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
.annotate 'line', 5239
__ARG_2.'unget'($P1)
.annotate 'line', 5240
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5242
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5243
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5246
$P1 = __ARG_2.'get'()
.annotate 'line', 5247
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5248
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5249
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
.annotate 'line', 5250
__ARG_2.'unget'($P1)
.annotate 'line', 5251
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5253
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5256

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5257
# Body
# {
.annotate 'line', 5259
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5260
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5261
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5262
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5263
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5264
.return(self)
# }
.annotate 'line', 5265

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5266
# Body
# {
.annotate 'line', 5269
# string type: $S1
set $S1, ''
.annotate 'line', 5270
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5271
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5272
iseq $I3, $S2, 'N'
unless $I3 goto __label_3
.annotate 'line', 5273
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5274
iseq $I3, $S1, ''
unless $I3 goto __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5276
isne $I4, $S1, $S2
unless $I4 goto __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5277
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5280
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5281
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
iseq $I4, $S9, $S1
unless $I4 goto __label_8
.annotate 'line', 5282
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5284
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5285
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5289
self.'genbreaklabel'()
.annotate 'line', 5290
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5291
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5292
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5293
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5294
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5295
$P2.'push'($S7)
.annotate 'line', 5296
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5297
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5299
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5302
__ARG_1.'comment'('switch')
.annotate 'line', 5303
self.'annotate'(__ARG_1)
.annotate 'line', 5304
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5305
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5306
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5307
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5308
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5309
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5310
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5311
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5314
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5315
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5316
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5318
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5319

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5208
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5210
addattribute $P0, 'condition'
.annotate 'line', 5211
addattribute $P0, 'case_value'
.annotate 'line', 5212
addattribute $P0, 'case_st'
.annotate 'line', 5213
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5332
# Body
# {
.annotate 'line', 5334
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5335
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5336
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5337
__ARG_2.'unget'($P1)
.annotate 'line', 5338
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5340
$P1 = __ARG_2.'get'()
.annotate 'line', 5341
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5342
__ARG_2.'unget'($P1)
.annotate 'line', 5343
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P5
.annotate 'line', 5344
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5346
$P1 = __ARG_2.'get'()
.annotate 'line', 5347
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5348
__ARG_2.'unget'($P1)
.annotate 'line', 5349
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P6
.annotate 'line', 5350
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5352
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5353

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5354
# Body
# {
.annotate 'line', 5356
getattribute $P1, self, 'initializer'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5357
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5358
getattribute $P1, self, 'condition'
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 5359
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
__label_1: # endif
.annotate 'line', 5360
getattribute $P5, self, 'iteration'
isnull $I2, $P5
not $I2
unless $I2 goto __label_2
.annotate 'line', 5361
getattribute $P8, self, 'iteration'
$P7 = $P8.'optimize'()
setattribute self, 'iteration', $P7
__label_2: # endif
.annotate 'line', 5362
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5363
.return(self)
# }
.annotate 'line', 5364

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5365
# Body
# {
.annotate 'line', 5367
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5368
getattribute $P2, self, 'condition'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5369
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5370
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5371
.return()
# }
__label_0: # endif
.annotate 'line', 5373
__ARG_1.'comment'('for loop')
.annotate 'line', 5374
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5375
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5376
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5377
getattribute $P4, self, 'initializer'
isnull $I1, $P4
not $I1
unless $I1 goto __label_6
.annotate 'line', 5378
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5379
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5381
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5382
getattribute $P4, self, 'iteration'
isnull $I2, $P4
not $I2
unless $I2 goto __label_7
.annotate 'line', 5383
# string unused: $S4
getattribute $P6, self, 'iteration'
$P5 = $P6.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
__label_7: # endif
.annotate 'line', 5385
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5386
getattribute $P6, self, 'condition'
isnull $I2, $P6
not $I2
unless $I2 goto __label_9
# {
.annotate 'line', 5387
# string regcond: $S5
getattribute $P8, self, 'condition'
$P7 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P7, __label_10
set $S5, $P7
__label_10:
.annotate 'line', 5388
__ARG_1.'say'('unless ', $S5, ' goto ', $S2, ' # for end')
# }
__label_9: # endif
.annotate 'line', 5391
getattribute $P7, self, 'body'
$P7.'emit'(__ARG_1)
.annotate 'line', 5392
__ARG_1.'emitgoto'($S1, 'for iteration')
.annotate 'line', 5394
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5395

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5326
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5328
addattribute $P0, 'initializer'
.annotate 'line', 5329
addattribute $P0, 'condition'
.annotate 'line', 5330
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5407
# Body
# {
.annotate 'line', 5409
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5410
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5411
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5412
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5413
isne $I1, $S2, ''
unless $I1 goto __label_2
# {
.annotate 'line', 5414
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5416
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5418
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5419
setattribute self, 'varname', $P1
.annotate 'line', 5420
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5421
$P2 = __ARG_2.'get'()
.annotate 'line', 5422
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5423
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5424
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5425

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5426
# Body
# {
.annotate 'line', 5428
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5429
.return(self)
# }
.annotate 'line', 5430

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5431
# Body
# {
.annotate 'line', 5433
self.'annotate'(__ARG_1)
.annotate 'line', 5434
# string regcont: $S1
null $S1
.annotate 'line', 5435
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
iseq $I1, $S6, 'S'
unless $I1 goto __label_0
# {
.annotate 'line', 5436
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5437
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5438
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5441
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5442
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5443
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5444
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5445
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5446
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5447
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5448
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5449
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5450
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5451
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5452
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5453
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5454

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5402
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5404
addattribute $P0, 'varname'
.annotate 'line', 5405
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5459
# Body
# {
.annotate 'line', 5461
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5462
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5463
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5464
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5465
__ARG_2.'unget'($P3)
.annotate 'line', 5466
__ARG_2.'unget'($P2)
.annotate 'line', 5467
__ARG_2.'unget'($P1)
.annotate 'line', 5468
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5469
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5471
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5472

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5482
# Body
# {
.annotate 'line', 5484
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5485
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5486

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5487
# Body
# {
.annotate 'line', 5489
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5490
.return(self)
# }
.annotate 'line', 5491

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5492
# Body
# {
.annotate 'line', 5494
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5495
self.'annotate'(__ARG_1)
.annotate 'line', 5496
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5497

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5478
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5480
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5511
# Body
# {
.annotate 'line', 5513
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5514
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5515
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5516
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5519
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5521
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5522
$P1 = __ARG_2.'get'()
.annotate 'line', 5523
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5524
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5525
$P1 = __ARG_2.'get'()
.annotate 'line', 5526
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5527
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5528
$P1 = __ARG_2.'get'()
.annotate 'line', 5529
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5530
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5531
setattribute self, 'exname', $P1
.annotate 'line', 5532
self.'createvar'($S1, 'P')
.annotate 'line', 5533
$P1 = __ARG_2.'get'()
.annotate 'line', 5534
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5535
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5537
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5538

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5539
# Body
# {
.annotate 'line', 5541
getattribute $P1, self, 'modifiers'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5542
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5543
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5544
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 5545
.return(self)
# }
.annotate 'line', 5546

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5547
# Body
# {
.annotate 'line', 5549
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5550
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5551
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5552
# string exreg: $S4
null $S4
.annotate 'line', 5553
getattribute $P8, self, 'exname'
isnull $I3, $P8
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 5554
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5555
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5558
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5560
self.'annotate'(__ARG_1)
.annotate 'line', 5561
__ARG_1.'comment'('try: create handler')
.annotate 'line', 5563
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 5564
__ARG_1.'say'('set_addr ', $S1, ', ', $S2)
.annotate 'line', 5566
getattribute $P10, self, 'modifiers'
isnull $I3, $P10
not $I3
unless $I3 goto __label_5
# {
.annotate 'line', 5567
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 5568
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 5569
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 5570
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 5571
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 5574
isne $I4, $I1, 1
unless $I4 goto __label_14
.annotate 'line', 5575
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 5576
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 5577
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 5578
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 5581
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 5582
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5583
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 5584
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5586
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 5587
# string sep: $S7
set $S7, ''
.annotate 'line', 5588
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 5589
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 5590
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 5592
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 5595
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 5600
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 5601
__ARG_1.'comment'('try: begin')
.annotate 'line', 5602
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 5603
__ARG_1.'comment'('try: end')
.annotate 'line', 5605
self.'annotate'(__ARG_1)
.annotate 'line', 5606
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5608
__ARG_1.'comment'('catch')
.annotate 'line', 5609
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5610
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 5611
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 5612
__ARG_1.'say'('pop_eh')
.annotate 'line', 5613
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 5615
__ARG_1.'comment'('catch end')
.annotate 'line', 5616
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 5617

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 5504
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 5506
addattribute $P0, 'stry'
.annotate 'line', 5507
addattribute $P0, 'modifiers'
.annotate 'line', 5508
addattribute $P0, 'exname'
.annotate 'line', 5509
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5628
# Body
# {
.annotate 'line', 5630
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5631
setattribute self, 'name', __ARG_3
.annotate 'line', 5632
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5633
setattribute self, 'reg', $P2
# }
.annotate 'line', 5634

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 5624
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5626
addattribute $P0, 'name'
.annotate 'line', 5627
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5651
# Body
# {
.annotate 'line', 5653
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5654
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5655
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5656
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5657
setattribute self, 'name', $P1
.annotate 'line', 5658
# string reg: $S1
null $S1
.annotate 'line', 5660
$P1 = __ARG_2.'get'()
.annotate 'line', 5661
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 5663
setattribute self, 'typearray', $P5
.annotate 'line', 5664
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 5665
$P1 = __ARG_2.'get'()
.annotate 'line', 5666
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 5668
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 5671
__ARG_2.'unget'($P1)
.annotate 'line', 5672
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 5673
$P1 = __ARG_2.'get'()
.annotate 'line', 5674
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 5675
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 5676
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 5681
setattribute self, 'typearray', $P8
.annotate 'line', 5682
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 5683
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5685
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 5686
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 5690
setattribute self, 'reg', $P11
.annotate 'line', 5691
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 5693
$P1 = __ARG_2.'get'()
.annotate 'line', 5694
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 5695
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 5696
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 5697
$P1 = __ARG_2.'get'()
.annotate 'line', 5698
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 5699
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 5700
# {
.annotate 'line', 5701
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5702
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 5703
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 5704
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 5705
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 5707
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 5709
$P16 = $P1.'isop'(';')
isfalse $I3, $P16
unless $I3 goto __label_14
.annotate 'line', 5710
'SyntaxError'("Expected ';'", $P1)
__label_14: # endif
# }
.annotate 'line', 5711

.end # parse


.sub 'optimize' :method

.annotate 'line', 5712
# Body
# {
.annotate 'line', 5714
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 5715
getattribute $P2, self, 'size'
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
.annotate 'line', 5716
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 5717
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
# {
.annotate 'line', 5718
getattribute $P2, self, 'typearray'
set $I3, $P2
iseq $I2, $I3, 0
unless $I2 goto __label_2
.annotate 'line', 5719
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 5721
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 5723
.return(self)
# }
.annotate 'line', 5724

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5725
# Body
# {
.annotate 'line', 5727
self.'annotate'(__ARG_1)
.annotate 'line', 5728
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 5729
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5730
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 5731
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 5732
# var init: $P1
getattribute $P1, self, 'init'
concat $S13, $S1, ' '
concat $S12, $S13, $S2
concat $S11, $S12, ': '
concat $S10, $S11, $S3
.annotate 'line', 5733
__ARG_1.'comment'($S10)
.annotate 'line', 5735
getattribute $P6, self, 'typearray'
set $I4, $P6
iseq $I3, $I4, 0
unless $I3 goto __label_4
# {
.annotate 'line', 5736
isnull $I5, $P1
if $I5 goto __label_8
$I5 = $P1.'isnull'()
__label_8:
unless $I5 goto __label_6
.annotate 'line', 5737
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 5739
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 5740
iseq $I3, $S5, $S4
unless $I3 goto __label_10
# {
.annotate 'line', 5741
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 5744
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_12
# {
.annotate 'line', 5746
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 5749
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 5750
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 5751
iseq $I5, $S4, 'S'
unless $I5 goto __label_17
iseq $I5, $S5, 'P'
__label_17:
unless $I5 goto __label_15
# {
.annotate 'line', 5752
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 5753
__ARG_1.'emitnull'($S3)
.annotate 'line', 5754
__ARG_1.'say'('if_null ', $S6, ', ', $S7)
.annotate 'line', 5755
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 5756
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 5759
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
.annotate 'line', 5765
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 5766
isnull $I6, $P2
not $I6
unless $I6 goto __label_19
# {
.annotate 'line', 5768
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 5769
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 5773
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 5775
isnull $I6, $P1
not $I6
unless $I6 goto __label_22
# {
.annotate 'line', 5776
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 5777
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 5778
isnull $I7, $P2
unless $I7 goto __label_24
# {
.annotate 'line', 5779
isgt $I8, $I1, 0
unless $I8 goto __label_25
# {
.annotate 'line', 5781
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 5784
# int i: $I2
null $I2
.annotate 'line', 5785
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 5786
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 5787
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 5788
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 5792

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5793
# Body
# {
.annotate 'line', 5795
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 5796

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 5641
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5643
addattribute $P0, 'name'
.annotate 'line', 5644
addattribute $P0, 't_reg'
.annotate 'line', 5645
addattribute $P0, 't_name'
.annotate 'line', 5646
addattribute $P0, 't_array'
.annotate 'line', 5647
addattribute $P0, 'reg'
.annotate 'line', 5648
addattribute $P0, 'typearray'
.annotate 'line', 5649
addattribute $P0, 'size'
.annotate 'line', 5650
addattribute $P0, 'init'
.end
.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5809
# Body
# {
.annotate 'line', 5812
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 5813
setattribute self, 'type', $P1
.annotate 'line', 5814
setattribute self, 'name', __ARG_4
.annotate 'line', 5815
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 5816

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 5817
# Body
# {
.annotate 'line', 5819
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5820
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 5821
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5822
$P1 = $P1.'optimize'()
.annotate 'line', 5823
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5825
getattribute $P4, self, 'start'
.annotate 'line', 5824
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 5827
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 5828
setattribute self, 'value', $P1
.annotate 'line', 5829
.return(self)
# }
.annotate 'line', 5830

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 5831
# Body
# {
.annotate 'line', 5833
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 5834

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5835
# Body
# {
.annotate 'line', 5837
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S3, 'Constant ', $S1
concat $S2, $S3, ' evaluated at compile time'
.annotate 'line', 5838
__ARG_1.'comment'($S2)
# }
.annotate 'line', 5839

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 5803
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5805
addattribute $P0, 'type'
.annotate 'line', 5806
addattribute $P0, 'name'
.annotate 'line', 5807
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5842
# Body
# {
.annotate 'line', 5844
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5845
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 5846
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5847
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 5849
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 5850
# {
.annotate 'line', 5851
$P1 = __ARG_2.'get'()
.annotate 'line', 5852
# var name: $P3
set $P3, $P1
.annotate 'line', 5853
'ExpectOp'('=', __ARG_2)
.annotate 'line', 5854
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 5856
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 5855
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 5857
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 5858
.return($P2)
# }
.annotate 'line', 5859

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5868
# Body
# {
.annotate 'line', 5870
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5871
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5872
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5873
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 5874
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 5876
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 5877
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5878

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 5879
# Body
# {
.annotate 'line', 5881
getattribute $P1, self, 'init'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5882
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 5883
.return(self)
# }
.annotate 'line', 5884

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 5885
# Body
# {
.annotate 'line', 5887
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5888

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5889
# Body
# {
.annotate 'line', 5891
self.'annotate'(__ARG_1)
.annotate 'line', 5892
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 5893
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 5894
# var init: $P1
getattribute $P1, self, 'init'
concat $S7, 'var ', $S1
concat $S6, $S7, ': '
concat $S5, $S6, $S2
.annotate 'line', 5895
__ARG_1.'comment'($S5)
.annotate 'line', 5896
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
.annotate 'line', 5897
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 5899
isnull $I1, $P1
not $I1
unless $I1 goto __label_4
# {
.annotate 'line', 5900
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 5901
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
.annotate 'line', 5903
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 5908
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 5909
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 5910
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 5913
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 5917
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 5918

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 5865
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 5867
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5923
# Body
# {
.annotate 'line', 5925
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5926
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5927
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5928
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 5929

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5930
# Body
# {
.annotate 'line', 5932
self.'annotate'(__ARG_1)
.annotate 'line', 5933
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5934
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S5, 'var ', $S1
concat $S4, $S5, '[] : '
concat $S3, $S4, $S2
.annotate 'line', 5935
__ARG_1.'comment'($S3)
.annotate 'line', 5936
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 5937

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 5921
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5944
# Body
# {
.annotate 'line', 5946
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5947
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 5948
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5949
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5950
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 5951
$P1 = __ARG_2.'get'()
.annotate 'line', 5952
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 5953
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5954

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 5955
# Body
# {
.annotate 'line', 5957
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 5958
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5959

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5960
# Body
# {
.annotate 'line', 5962
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5963
self.'annotate'(__ARG_1)
.annotate 'line', 5964
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5965
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S6, 'var ', $S2
concat $S5, $S6, '[] : '
concat $S4, $S5, $S3
.annotate 'line', 5966
__ARG_1.'comment'($S4)
.annotate 'line', 5967
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 5968

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 5940
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 5942
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5971
# Body
# {
.annotate 'line', 5973
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5974
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5975
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5976
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5977
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 5978
$P2 = __ARG_2.'get'()
.annotate 'line', 5979
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5980
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 5982
__ARG_2.'unget'($P2)
.annotate 'line', 5983
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
.annotate 'line', 5987
__ARG_2.'unget'($P2)
.annotate 'line', 5988
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 5990

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5998
# Body
# {
box $P1, 'S'
.annotate 'line', 6000
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6001
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6002
setattribute self, 't_array', $P2
.annotate 'line', 6003
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6004

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6005
# Body
# {
.annotate 'line', 6007
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6008

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 5996
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6017
# Body
# {
box $P1, 'I'
.annotate 'line', 6019
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6020
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6021
setattribute self, 't_array', $P2
.annotate 'line', 6022
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6023

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6024
# Body
# {
.annotate 'line', 6026
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6027

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6015
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6036
# Body
# {
box $P1, 'N'
.annotate 'line', 6038
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6039
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6040
setattribute self, 't_array', $P2
.annotate 'line', 6041
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6042

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6043
# Body
# {
.annotate 'line', 6045
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6046

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6034
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6060
# Body
# {
.annotate 'line', 6062
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6063
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6064
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6065
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6066
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6067
__ARG_2.'unget'($P1)
.annotate 'line', 6068
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6069
isnull $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6070
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6071
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6073
setattribute self, 'end', $P1
# }
.annotate 'line', 6074

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6075
# Body
# {
.annotate 'line', 6077
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6078
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6079
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6080
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6081
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6082
.return($S2)
# }
.annotate 'line', 6083

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6084
# Body
# {
.annotate 'line', 6086
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6087
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6088
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6089
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6090
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6091
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6092
$P1[$S1] = $S3
.annotate 'line', 6093
.return($S3)
# }
.annotate 'line', 6094

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6095
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6096
# Body
# {
.annotate 'line', 6098
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6099
.return(self)
# }
.annotate 'line', 6100

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6101
# Body
# {
.annotate 'line', 6103
__ARG_1.'comment'('{')
.annotate 'line', 6104
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6105
$P1.'emit'(__ARG_1)
.annotate 'line', 6106
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6108
__ARG_1.'comment'('}')
# }
.annotate 'line', 6109

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6053
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6055
addattribute $P0, 'statements'
.annotate 'line', 6056
addattribute $P0, 'end'
.annotate 'line', 6057
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6122
# Body
# {
box $P3, 1
.annotate 'line', 6125
setattribute self, 'nreg', $P3
.annotate 'line', 6126
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6127
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6128
setattribute self, 'tempreg', $P1
.annotate 'line', 6129
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6130

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6131
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6133
setattribute self, 'type', $P1
.annotate 'line', 6134
.return(self)
# }
.annotate 'line', 6135

.end # settype


.sub 'createreg' :method

.annotate 'line', 6136
# Body
# {
.annotate 'line', 6138
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6139
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6140
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6142
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S3, '$', $S2
concat $S1, $S3, $S1
.annotate 'line', 6144
.return($S1)
# }
.annotate 'line', 6145

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6146
# Body
# {
.annotate 'line', 6148
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6149
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6150
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6151
# string reg: $S1
null $S1
.annotate 'line', 6152
isgt $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 6153
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6155
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6156
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6158
.return($S1)
# }
.annotate 'line', 6159

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6160
# Body
# {
.annotate 'line', 6162
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6163
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6164
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6165
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6166

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6118
addattribute $P0, 'type'
.annotate 'line', 6119
addattribute $P0, 'nreg'
.annotate 'line', 6120
addattribute $P0, 'tempreg'
.annotate 'line', 6121
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6188
# Body
# {
.annotate 'line', 6190
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6191
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6192
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6193
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6194
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6195

.end # init


.sub 'ismethod' :method

.annotate 'line', 6196
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6197
# Body
# {
.annotate 'line', 6199
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6200
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
.annotate 'line', 6202
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6204
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6206
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6208
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6210
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6212
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6213
.return($S1)
# }
.annotate 'line', 6214

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6215
# Body
# {
.annotate 'line', 6217
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6218
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
.annotate 'line', 6220
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6222
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6224
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6226
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6228
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6230
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6231
.return($S1)
# }
.annotate 'line', 6232

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6233
# Body
# {
.annotate 'line', 6235
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
.annotate 'line', 6236
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6237

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6238
# Body
# {
.annotate 'line', 6240
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6241
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6242
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6244
.return($S1)
# }
.annotate 'line', 6245

.end # genlabel


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6246
# Body
# {
.annotate 'line', 6248
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6249
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6250
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6252
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6253

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6255
# Body
# {
.annotate 'line', 6257
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6258
.return(self)
# }
.annotate 'line', 6259

.end # optimize


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6261
# Body
# {
.annotate 'line', 6263
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 6264
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6265
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 6266
__ARG_1.'unget'($P1)
.annotate 'line', 6267
# int argnum: $I1
null $I1
__label_1: # do
.annotate 'line', 6268
# {
.annotate 'line', 6269
$P1 = __ARG_1.'get'()
.annotate 'line', 6270
# string type: $S1
$P6 = $P1.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6271
isne $I2, $S1, ''
unless $I2 goto __label_5
.annotate 'line', 6272
$P1 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6275
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S2, '__ARG_', $S4
.annotate 'line', 6276
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6278
# string varname: $S3
set $P7, $P1
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6279
# var arg: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 6280
$P2['name'] = $S3
.annotate 'line', 6281
$P1 = __ARG_1.'get'()
.annotate 'line', 6282
$P7 = $P1.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6283
# var modifiers: $P3
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, self)
set $P3, $P8
.annotate 'line', 6284
$P2['modifiers'] = $P3
.annotate 'line', 6285
$P1 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6287
getattribute $P8, self, 'args'
$P8.'push'($P2)
# }
.annotate 'line', 6288
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 6289
$P9 = $P1.'isop'(')')
isfalse $I3, $P9
unless $I3 goto __label_9
.annotate 'line', 6290
'SyntaxError'("Expected ')'", $P1)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6292

.end # parse_parameters


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6294
# Body
# {
.annotate 'line', 6296
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6297
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6298
setattribute self, 'name', $P1
box $P3, 0
.annotate 'line', 6299
setattribute self, 'isanon', $P3
.annotate 'line', 6300
$P1 = __ARG_2.'get'()
.annotate 'line', 6301
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6302
# var modifiers: $P2
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 6303
setattribute self, 'modifiers', $P2
.annotate 'line', 6304
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6306
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 6307
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6308
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6310
$P1 = __ARG_2.'get'()
.annotate 'line', 6311
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_2
.annotate 'line', 6312
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 6313
new $P8, [ 'CompoundStatement' ]
$P8.'CompoundStatement'($P1, __ARG_2, self)
set $P7, $P8
setattribute self, 'body', $P7
.annotate 'line', 6314
.return(self)
# }
.annotate 'line', 6315

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6316
# Body
# {
.annotate 'line', 6318
# string name: $S1
getattribute $P16, self, 'name'
null $S1
if_null $P16, __label_0
set $S1, $P16
__label_0:
.annotate 'line', 6319
__ARG_1.'say'()
.annotate 'line', 6320
__ARG_1.'print'(".sub ")
.annotate 'line', 6321
getattribute $P16, self, 'isanon'
isfalse $I5, $P16
unless $I5 goto __label_1
.annotate 'line', 6322
__ARG_1.'print'("'", $S1, "'")
goto __label_2
__label_1: # else
.annotate 'line', 6324
__ARG_1.'print'("'' :anon")
__label_2: # endif
.annotate 'line', 6325
getattribute $P17, self, 'subid'
isnull $I5, $P17
not $I5
unless $I5 goto __label_3
.annotate 'line', 6326
getattribute $P18, self, 'subid'
__ARG_1.'print'(" :subid('", $P18, "')")
__label_3: # endif
.annotate 'line', 6329
$P17 = self.'ismethod'()
if_null $P17, __label_4
unless $P17 goto __label_4
.annotate 'line', 6330
__ARG_1.'print'(' :method')
__label_4: # endif
.annotate 'line', 6331
# var modifiers: $P1
getattribute $P1, self, 'modifiers'
.annotate 'line', 6332
isnull $I6, $P1
not $I6
unless $I6 goto __label_5
# {
.annotate 'line', 6333
# var mlist: $P2
$P2 = $P1.'getlist'()
.annotate 'line', 6334
iter $P19, $P2
set $P19, 0
__label_7: # for iteration
unless $P19 goto __label_8
shift $P3, $P19
# {
.annotate 'line', 6335
# int nargmods: $I1
$P18 = $P3.'numargs'()
set $I1, $P18
.annotate 'line', 6336
$P20 = $P3.'getname'()
__ARG_1.'print'(' :', $P20)
.annotate 'line', 6337
isgt $I6, $I1, 0
unless $I6 goto __label_9
# {
.annotate 'line', 6338
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6339
# int iargmod: $I2
null $I2
goto __label_12
__label_10: # for iteration
inc $I2
__label_12: # for condition
islt $I7, $I2, $I1
unless $I7 goto __label_11 # for end
# {
.annotate 'line', 6340
# var argmod: $P4
$P4 = $P3.'getarg'($I2)
.annotate 'line', 6341
$P20 = $P4.'isstringliteral'()
isfalse $I7, $P20
unless $I7 goto __label_13
.annotate 'line', 6342
getattribute $P21, $P4, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_13: # endif
.annotate 'line', 6343
$P21 = $P4.'getPirString'()
__ARG_1.'print'($P21)
# }
goto __label_10 # for iteration
__label_11: # for end
.annotate 'line', 6345
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
.annotate 'line', 6350
iseq $I8, $S1, 'main'
unless $I8 goto __label_14
.annotate 'line', 6351
__ARG_1.'print'(' :main')
__label_14: # endif
# }
__label_6: # endif
.annotate 'line', 6353
__ARG_1.'say'()
.annotate 'line', 6355
# var args: $P5
getattribute $P5, self, 'args'
.annotate 'line', 6356
# var arg: $P6
null $P6
.annotate 'line', 6357
# string argname: $S2
null $S2
.annotate 'line', 6358
# var a: $P7
null $P7
.annotate 'line', 6360
iter $P22, $P5
set $P22, 0
__label_15: # for iteration
unless $P22 goto __label_16
shift $P6, $P22
# {
.annotate 'line', 6361
$S2 = $P6['name']
.annotate 'line', 6362
$P7 = self.'getvar'($S2)
.annotate 'line', 6363
# string ptype: $S3
$P24 = $P7['type']
$P23 = 'typetopirname'($P24)
null $S3
if_null $P23, __label_17
set $S3, $P23
__label_17:
$P23 = $P7['reg']
.annotate 'line', 6364
__ARG_1.'print'('.param ', $S3, ' ', $P23)
.annotate 'line', 6365
# var modarg: $P8
$P8 = $P6['modifiers']
.annotate 'line', 6366
isnull $I8, $P8
not $I8
unless $I8 goto __label_18
# {
.annotate 'line', 6367
# var named: $P9
null $P9
.annotate 'line', 6368
# var slurpy: $P10
null $P10
.annotate 'line', 6369
# var modarglist: $P11
$P11 = $P8.'getlist'()
.annotate 'line', 6370
iter $P25, $P11
set $P25, 0
__label_19: # for iteration
unless $P25 goto __label_20
shift $P12, $P25
# {
.annotate 'line', 6371
# string modname: $S4
$P24 = $P12.'getname'()
null $S4
if_null $P24, __label_21
set $S4, $P24
__label_21:
set $S6, $S4
set $S7, 'named'
.annotate 'line', 6372
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
.annotate 'line', 6380
__ARG_1.'print'(' :', $S4)
__label_22: # switch end
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6383
isnull $I9, $P9
not $I9
unless $I9 goto __label_28
isnull $I9, $P10
not $I9
__label_28:
unless $I9 goto __label_26
# {
.annotate 'line', 6388
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_27
__label_26: # else
# {
.annotate 'line', 6391
isnull $I9, $P9
not $I9
unless $I9 goto __label_29
# {
.annotate 'line', 6392
# string setname: $S5
null $S5
.annotate 'line', 6393
# int nargs: $I3
$P26 = $P9.'numargs'()
set $I3, $P26
set $I10, $I3
null $I11
.annotate 'line', 6394
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
.annotate 'line', 6399
# var argmod: $P13
$P13 = $P9.'getarg'(0)
.annotate 'line', 6400
$P26 = $P13.'isstringliteral'()
isfalse $I12, $P26
unless $I12 goto __label_35
.annotate 'line', 6401
getattribute $P27, self, 'start'
'SyntaxError'('Invalid modifier', $P27)
__label_35: # endif
.annotate 'line', 6402
$P28 = $P13.'getPirString'()
set $S5, $P28
goto __label_31 # break
__label_32: # default
.annotate 'line', 6405
getattribute $P29, self, 'start'
'SyntaxError'('Invalid modifier', $P29)
__label_31: # switch end
.annotate 'line', 6407
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_30
__label_29: # else
.annotate 'line', 6409
isnull $I10, $P10
not $I10
unless $I10 goto __label_36
# {
.annotate 'line', 6410
__ARG_1.'print'(" :slurpy")
# }
__label_36: # endif
__label_30: # endif
# }
__label_27: # endif
# }
__label_18: # endif
.annotate 'line', 6414
__ARG_1.'say'('')
# }
goto __label_15
__label_16: # endfor
.annotate 'line', 6416
__ARG_1.'say'()
.annotate 'line', 6417
getattribute $P27, self, 'start'
__ARG_1.'annotate'($P27)
.annotate 'line', 6418
__ARG_1.'comment'('Body')
.annotate 'line', 6419
getattribute $P28, self, 'body'
$P28.'emit'(__ARG_1)
.annotate 'line', 6421
getattribute $P30, self, 'body'
$P29 = $P30.'getend'()
__ARG_1.'annotate'($P29)
.annotate 'line', 6422
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 6425
# var localfun: $P14
getattribute $P14, self, 'localfun'
.annotate 'line', 6426
isnull $I11, $P14
not $I11
unless $I11 goto __label_37
# {
# for loop
.annotate 'line', 6428
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
.annotate 'line', 6429
# var fn: $P15
$P15 = $P14[$I4]
.annotate 'line', 6430
$P15.'emit'(__ARG_1)
# }
goto __label_38 # for iteration
__label_39: # for end
# }
__label_37: # endif
# }
.annotate 'line', 6433

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6434
# Body
# {
.annotate 'line', 6436
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6437

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6438
# Body
# {
.annotate 'line', 6440
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6441

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6173
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6175
addattribute $P0, 'name'
.annotate 'line', 6176
addattribute $P0, 'subid'
.annotate 'line', 6177
addattribute $P0, 'isanon'
.annotate 'line', 6178
addattribute $P0, 'modifiers'
.annotate 'line', 6179
addattribute $P0, 'args'
.annotate 'line', 6180
addattribute $P0, 'body'
.annotate 'line', 6181
addattribute $P0, 'regstI'
.annotate 'line', 6182
addattribute $P0, 'regstN'
.annotate 'line', 6183
addattribute $P0, 'regstS'
.annotate 'line', 6184
addattribute $P0, 'regstP'
.annotate 'line', 6185
addattribute $P0, 'nlabel'
.annotate 'line', 6186
addattribute $P0, 'localfun'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6450
# Body
# {
.annotate 'line', 6452
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6453
# string subid: $S1
$P2 = __ARG_3.'createsubid'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
box $P2, $S1
.annotate 'line', 6454
setattribute self, 'subid', $P2
box $P3, $S1
.annotate 'line', 6455
setattribute self, 'name', $P3
box $P3, 1
.annotate 'line', 6456
setattribute self, 'isanon', $P3
.annotate 'line', 6457
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6458
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6459
$P4 = $P1.'isop'('{')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 6460
'Expected'('{', $P1)
__label_1: # endif
.annotate 'line', 6461
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_2, self)
set $P5, $P6
setattribute self, 'body', $P5
.annotate 'line', 6462
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 6463

.end # LocalFunctionStatement


.sub 'getsubid' :method

.annotate 'line', 6464
# Body
# {
.annotate 'line', 6466
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 6467

.end # getsubid

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 6448
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 6476
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 6474
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ ]
# Constant CLASSBASE_invalid evaluated at compile time
# Constant CLASSBASE_str evaluated at compile time
# Constant CLASSBASE_parrotkey evaluated at compile time
# Constant CLASSBASE_id evaluated at compile time
.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6492
# Body
# {
.annotate 'line', 6494
setattribute self, 'owner', __ARG_1
.annotate 'line', 6495
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 6496

.end # ClassBase


.sub 'reftype' :method

.annotate 'line', 6497
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 6499
# Body
# {
.annotate 'line', 6501
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 6502

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassBase' ]
.annotate 'line', 6490
addattribute $P0, 'owner'
.annotate 'line', 6491
addattribute $P0, 'start'
.end
.namespace [ 'ClassBaseStr' ]

.sub 'ClassBaseStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6508
# Body
# {
.annotate 'line', 6510
self.'ClassBase'(__ARG_1, __ARG_2)
.annotate 'line', 6511
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 6512

.end # ClassBaseStr


.sub 'reftype' :method

.annotate 'line', 6513
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6515
# Body
# {
.annotate 'line', 6517
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6518
__ARG_1.'print'($S1)
# }
.annotate 'line', 6519

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassBaseStr' ]
.annotate 'line', 6505
get_class $P1, [ 'ClassBase' ]
addparent $P0, $P1
.annotate 'line', 6507
addattribute $P0, 'name'
.end
.namespace [ 'ClassBaseParrotKey' ]

.sub 'ClassBaseParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6525
# Body
# {
.annotate 'line', 6527
self.'ClassBase'(__ARG_2, __ARG_3)
.annotate 'line', 6528
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 6529
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 6530
# {
.annotate 'line', 6531
$P2 = __ARG_1.'get'()
.annotate 'line', 6532
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_3
.annotate 'line', 6533
'SyntaxError'('literal string expected', $P2)
__label_3: # endif
.annotate 'line', 6534
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
# }
.annotate 'line', 6535
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'(',')
if_null $P5, __label_1
if $P5 goto __label_0
__label_1: # enddo
.annotate 'line', 6536
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_4
.annotate 'line', 6537
'SyntaxError'("Expected ']'", $P2)
__label_4: # endif
.annotate 'line', 6538
setattribute self, 'key', $P1
# }
.annotate 'line', 6539

.end # ClassBaseParrotKey


.sub 'reftype' :method

.annotate 'line', 6540
# Body
# {
.return(2)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6542
# Body
# {
.annotate 'line', 6544
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 6545

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassBaseParrotKey' ]
.annotate 'line', 6522
get_class $P1, [ 'ClassBase' ]
addparent $P0, $P1
.annotate 'line', 6524
addattribute $P0, 'key'
.end
.namespace [ 'ClassBaseId' ]

.sub 'ClassBaseId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6551
# Body
# {
.annotate 'line', 6553
self.'ClassBase'(__ARG_2, __ARG_3)
.annotate 'line', 6554
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
$S1 = __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 6555
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6556
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 6557
$P2 = __ARG_1.'get'()
# predefined string
.annotate 'line', 6558
$S1 = $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6560
__ARG_1.'unget'($P2)
.annotate 'line', 6561
setattribute self, 'key', $P1
# }
.annotate 'line', 6562

.end # ClassBaseId


.sub 'reftype' :method

.annotate 'line', 6563
# Body
# {
.return(3)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6565
# Body
# {
.annotate 'line', 6567
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 6568
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6569
getattribute $P2, self, 'key'
# predefined join
join $S3, ".", $P2
concat $S2, "class ", $S3
concat $S1, $S2, " not found at compile time"
'Warn'($S1)
.annotate 'line', 6570
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6572
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 6573

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassBaseId' ]
.annotate 'line', 6548
get_class $P1, [ 'ClassBase' ]
addparent $P0, $P1
.annotate 'line', 6550
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassBase'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6576
# Body
# {
.annotate 'line', 6578
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6579
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6580
new $P4, [ 'ClassBaseStr' ]
$P4.'ClassBaseStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 6581
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 6582
new $P4, [ 'ClassBaseParrotKey' ]
$P4.'ClassBaseParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 6583
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 6584
new $P7, [ 'ClassBaseId' ]
$P7.'ClassBaseId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 6585
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 6586

.end # parseClassBase

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6603
# Body
# {
.annotate 'line', 6605
setattribute self, 'parent', __ARG_2
.annotate 'line', 6606
setattribute self, 'owner', __ARG_2
.annotate 'line', 6607
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 6608
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 6609
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 6610
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 6612
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6613
setattribute self, 'name', $P1
.annotate 'line', 6614
$P1 = __ARG_1.'get'()
.annotate 'line', 6615
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 6616
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 6617
# {
.annotate 'line', 6618
# var base: $P3
$P3 = 'parseClassBase'(__ARG_1, self)
.annotate 'line', 6619
$P2.'push'($P3)
.annotate 'line', 6620
$P1 = __ARG_1.'get'()
.annotate 'line', 6621
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
.annotate 'line', 6624
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 6625
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 6626
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 6627
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 6628
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 6629
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 6630
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 6631
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6633
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 6634
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 6635
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 6636
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 6637
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 6638
$P1 = __ARG_1.'get'()
.annotate 'line', 6639
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 6640
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 6642
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 6643
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6644
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 6645
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6648
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 6649
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 6651
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 6652
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 6653
setattribute self, 'classns', $P9
# }
.annotate 'line', 6654

.end # ClassStatement


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6655
# Body
# {
.annotate 'line', 6657
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 6658

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6659
# Body
# {
.annotate 'line', 6661
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6662

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 6663
# Body
# {
.annotate 'line', 6665
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 6666
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 6667
.return(self)
# }
.annotate 'line', 6668

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 6669
# Body
# {
.annotate 'line', 6671
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 6672

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6673
# Body
# {
.annotate 'line', 6675
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 6676
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 6677
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 6678
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6680
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 6682
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 6683
# int n: $I1
set $I1, 1
.annotate 'line', 6684
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 6685
$P3.'annotate'(__ARG_1)
.annotate 'line', 6686
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 6687
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 6688
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 6689
__ARG_1.'say'()
.annotate 'line', 6690
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 6692
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 6693
__ARG_1.'annotate'($P4)
.annotate 'line', 6694
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 6697
__ARG_1.'say'('.end')
# }
.annotate 'line', 6698

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 6592
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 6594
addattribute $P0, 'parent'
.annotate 'line', 6595
addattribute $P0, 'owner'
.annotate 'line', 6596
addattribute $P0, 'name'
.annotate 'line', 6597
addattribute $P0, 'bases'
.annotate 'line', 6598
addattribute $P0, 'constants'
.annotate 'line', 6599
addattribute $P0, 'functions'
.annotate 'line', 6600
addattribute $P0, 'members'
.annotate 'line', 6601
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6705
# Body
# {
.annotate 'line', 6707
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6708
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 6709
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 6710
'ExpectOp'(';', __ARG_2)
.annotate 'line', 6711
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 6712
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 6717
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 6718
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 6719
# var file: $P5
new $P5, ['FileHandle']
.annotate 'line', 6720
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 6721
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 6722
# try: create handler
new $P11, 'ExceptionHandler'
set_addr $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 6723
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 6724
# }
# try: end
goto __label_5
.annotate 'line', 6722
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
.annotate 'line', 6729
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 6730
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 6735
load_bytecode 'PGE.pbc'
.annotate 'line', 6736
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 6737
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 6739
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
.annotate 'line', 6740
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6741
$P8 = $P7($S4)
.annotate 'line', 6742
# predefined elements
elements $I4, $P8
isgt $I3, $I4, 0
unless $I3 goto __label_11
# {
.annotate 'line', 6743
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 6744
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 6745
# int ivalue: $I1
null $I1
.annotate 'line', 6746
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6747
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 6752
$P16 = 'newTokenFrom'(5, $S5, __ARG_1)
.annotate 'line', 6751
$P15 = 'integerValue'(__ARG_3, $P16, $I1)
.annotate 'line', 6750
__ARG_3.'createconst'($S5, 'I', $P15, '')
# }
__label_11: # endif
# }
goto __label_7 # for iteration
__label_8: # for end
.annotate 'line', 6756
$P5.'close'()
# }
.annotate 'line', 6757

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 6769
# Body
# {
.annotate 'line', 6771
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 6772
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 6773
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 6774
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 6775

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 6776
# Body
# {
.annotate 'line', 6778
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 6779
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 6780
getattribute $P4, $P2, 'name'
$S1 = $P4
iseq $I1, $S1, __ARG_1
unless $I1 goto __label_2
.annotate 'line', 6781
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 6782
.return($P4)
# }
.annotate 'line', 6783

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 6784
# Body
# {
# predefined elements
.annotate 'line', 6788
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 6790
.return($P5)
__label_3: # case
.annotate 'line', 6793
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 6798
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 6799
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 6800
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 6801
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 6802
getattribute $P9, $P3, 'name'
$S2 = $P9
iseq $I3, $S2, $S1
unless $I3 goto __label_7
# {
.annotate 'line', 6804
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 6805
isnull $I1, $P4
not $I1
unless $I1 goto __label_8
.annotate 'line', 6806
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 6810
.return($P5)
# }
.annotate 'line', 6811

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 6812
# Body
# {
.annotate 'line', 6814
# int balance1: $I1
null $I1
.annotate 'line', 6815
# int balance2: $I2
null $I2
.annotate 'line', 6816
# int balance3: $I3
null $I3
.annotate 'line', 6817
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6818
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 6820
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 6822
# var start: $P2
set $P2, $P1
.annotate 'line', 6823
$P1 = __ARG_1.'get'()
.annotate 'line', 6824
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 6825
$P1 = __ARG_1.'get'()
.annotate 'line', 6827
# var modifier: $P3
null $P3
.annotate 'line', 6828
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 6829
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 6830
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 6833
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 6834
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 6835
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 6836
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 6837
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 6838
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 6840
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 6841
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6842
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6844
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 6845
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 6846
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 6847
$P7.'push'($P6)
.annotate 'line', 6848
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 6850
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 6851
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 6852
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 6853
$P9.'push'($P8)
.annotate 'line', 6854
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 6856
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 6857
$P1 = __ARG_1.'get'()
.annotate 'line', 6858
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 6859
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 6860
$P1 = __ARG_1.'get'()
.annotate 'line', 6861
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 6862
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 6863
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 6864
self.'addlib'($S2)
.annotate 'line', 6865
$P1 = __ARG_1.'get'()
.annotate 'line', 6866
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6868
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 6869
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6871
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 6872
$P1 = __ARG_1.'get'()
.annotate 'line', 6873
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 6874
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 6875
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 6876
self.'addload'($S3)
.annotate 'line', 6877
$P1 = __ARG_1.'get'()
.annotate 'line', 6878
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 6880
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 6881
self.'close_ns'($P1)
.annotate 'line', 6882
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 6885
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
.annotate 'line', 6887
self.'unclosed_ns'()
# }
.annotate 'line', 6888

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 6889
# Body
# {
.annotate 'line', 6891
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 6892

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 6893
# Body
# {
.annotate 'line', 6895
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 6896
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6898
# int activate: $I1
set $I1, 1
.annotate 'line', 6899
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 6900
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 6901
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 6904
unless $I1 goto __label_6
# {
.annotate 'line', 6905
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 6906
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 6908
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 6910

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 6761
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 6763
addattribute $P0, 'namespaces'
.annotate 'line', 6764
addattribute $P0, 'classes'
.annotate 'line', 6765
addattribute $P0, 'functions'
.annotate 'line', 6766
addattribute $P0, 'items'
.annotate 'line', 6767
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 6925
# Body
# {
.annotate 'line', 6928
setattribute self, 'parent', __ARG_1
.annotate 'line', 6929
setattribute self, 'start', __ARG_2
.annotate 'line', 6930
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 6931
setattribute self, 'name', $P2
.annotate 'line', 6932
setattribute self, 'modifier', __ARG_4
.annotate 'line', 6933
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 6934
$P3 = __ARG_4.'pick'('HLL')
isnull $I2, $P3
not $I2
unless $I2 goto __label_1
.annotate 'line', 6935
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6937

.end # NamespaceStatement


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6938
# Body
# {
.annotate 'line', 6940
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6941

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 6942
# Body
# {
.annotate 'line', 6944
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 6945
getattribute $P2, self, 'hll'
isnull $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6946
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 6947
.return($P1)
# }
.annotate 'line', 6948

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6949
# Body
# {
.annotate 'line', 6951
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 6952

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6953
# Body
# {
.annotate 'line', 6955
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 6956

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6957
# Body
# {
.annotate 'line', 6959
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 6960
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6961
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 6963
.return($P1)
__label_1: # endif
# }
.annotate 'line', 6964

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 6965
# Body
# {
.annotate 'line', 6969
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 6970
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6971
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 6972
.return($P1)
# }
.annotate 'line', 6973

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 6974
# Body
# {
.annotate 'line', 6976
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 6977

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 6978
# Body
# {
# }
.annotate 'line', 6981

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 6982
# Body
# {
.annotate 'line', 6984
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 6985
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 6986
$P1 = $P1.'optimize'()
.annotate 'line', 6987
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 6989
self.'optimize_base'()
.annotate 'line', 6990
.return(self)
# }
.annotate 'line', 6991

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6992
# Body
# {
.annotate 'line', 6994
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 6995
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 6996
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 6998
self.'emit_base'(__ARG_1)
.annotate 'line', 7000
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 7001
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7002

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 6917
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 6919
addattribute $P0, 'parent'
.annotate 'line', 6920
addattribute $P0, 'start'
.annotate 'line', 6921
addattribute $P0, 'name'
.annotate 'line', 6922
addattribute $P0, 'modifier'
.annotate 'line', 6923
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7016
# Body
# {
.annotate 'line', 7018
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7019
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7020

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7021
# Body
# {
.annotate 'line', 7023
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7024
$P1[__ARG_1] = 1
# }
.annotate 'line', 7025

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7026
# Body
# {
.annotate 'line', 7028
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7029
isnull $I2, $P2
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7030

.end # predef_is_used


.sub 'createsubid' :method

.annotate 'line', 7032
# Body
# {
.annotate 'line', 7034
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7035
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7036
inc $I1
assign $P1, $I1
.annotate 'line', 7038
# string id: $S1
# predefined string
$S2 = $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 7039
.return($S1)
# }
.annotate 'line', 7040

.end # createsubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7042
# Body
# {
.annotate 'line', 7044
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7045
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 7046
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7047
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7049
$P1[__ARG_1] = 1
# }
.annotate 'line', 7050

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7051
# Body
# {
.annotate 'line', 7053
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7054
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 7055
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7056
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7058
$P1[__ARG_1] = 1
# }
.annotate 'line', 7059

.end # addload


.sub 'getpath' :method

.annotate 'line', 7060
# Body
# {
.annotate 'line', 7062
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7063
.return($P1)
# }
.annotate 'line', 7064

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7065
# Body
# {
.annotate 'line', 7067
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7068

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7069
# Body
# {
.annotate 'line', 7072
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7073

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7074
# Body
# {
# }
.annotate 'line', 7077

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7078
# Body
# {
.annotate 'line', 7080
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7081

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7082
# Body
# {
.annotate 'line', 7084
self.'optimize_base'()
.annotate 'line', 7085
.return(self)
# }
.annotate 'line', 7086

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7087
# Body
# {
.annotate 'line', 7089
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7092
$P5 = $P1['chomp']
isnull $I3, $P5
not $I3
unless $I3 goto __label_0
.annotate 'line', 7093
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 7096
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
.annotate 'line', 7099
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7100
$P5 = $P1[$S1]
isnull $I3, $P5
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 7101
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7102
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7105
# int somelib: $I1
null $I1
.annotate 'line', 7106
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7107
isnull $I4, $P3
not $I4
unless $I4 goto __label_4
# {
set $I1, 1
.annotate 'line', 7109
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7110
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7113
# int someload: $I2
null $I2
.annotate 'line', 7114
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7115
isnull $I4, $P4
not $I4
unless $I4 goto __label_7
# {
set $I2, 1
.annotate 'line', 7117
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7118
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7119
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7120
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I6, $I1
set $I7, $I2
.annotate 'line', 7122
or $I5, $I6, $I7
unless $I5 goto __label_10
.annotate 'line', 7123
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7125
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7126

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7009
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7011
addattribute $P0, 'predefs_used'
.annotate 'line', 7012
addattribute $P0, 'libs'
.annotate 'line', 7013
addattribute $P0, 'loads'
.annotate 'line', 7014
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7138
# Body
# {
.annotate 'line', 7140
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7143
# var taux: $P2
$P2 = 'newToken'(4, 'predefconst', 0, '__predefconst__')
.annotate 'line', 7147
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7146
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7145
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7151
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7150
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 7149
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 7157
new $P6, [ 'StringLiteral' ]
# predefined int
.annotate 'line', 7158
$I2 = "2"
add $I1, $I2, 1
# predefined string
$S1 = $I1
$P7 = 'newTokenFrom'(2, $S1, $P2)
$P6.'StringLiteral'($P1, $P7)
set $P5, $P6
.annotate 'line', 7156
$P1.'createconst'('__STAGE__', 'S', $P5, '')
.annotate 'line', 7161
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7162

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7163
# Body
# {
.annotate 'line', 7165
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7166

.end # parse


.sub 'optimize' :method

.annotate 'line', 7167
# Body
# {
.annotate 'line', 7169
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7170

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7171
# Body
# {
.annotate 'line', 7173
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7174
__ARG_1.'say'('')
.annotate 'line', 7176
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7178
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7179

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7137
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7186
# Body
# {
.annotate 'line', 7188
# var handlein: $P1
new $P1, ['StringHandle']
.annotate 'line', 7190
$P1.'open'('__eval__', 'w')
.annotate 'line', 7191
$P1.'puts'(__ARG_1)
.annotate 'line', 7192
$P1.'close'()
.annotate 'line', 7193
$P1.'open'('__eval__', 'r')
.annotate 'line', 7194
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7195
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7196
$P3.'parse'($P2)
.annotate 'line', 7197
$P1.'close'()
.annotate 'line', 7198
$P3.'optimize'()
.annotate 'line', 7199
# var handleout: $P4
new $P4, ['StringHandle']
.annotate 'line', 7200
$P4.'open'('__eval__', 'w')
.annotate 'line', 7201
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7202
$P5.'initialize'($P4)
.annotate 'line', 7203
$P3.'emit'($P5)
.annotate 'line', 7204
$P5.'close'()
.annotate 'line', 7205
$P4.'close'()
.annotate 'line', 7206
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7207
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7208
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7209
.return($P7)
# }
.annotate 'line', 7210

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7211
# Body
# {
.annotate 'line', 7213
# var handlein: $P1
new $P1, ['FileHandle']
.annotate 'line', 7214
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7215
$P1.'encoding'('utf8')
.annotate 'line', 7216
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7217
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7218
$P3.'parse'($P2)
.annotate 'line', 7219
$P1.'close'()
.annotate 'line', 7220
$P3.'optimize'()
.annotate 'line', 7221
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7222
$P4.'initialize'(__ARG_2)
.annotate 'line', 7223
$P3.'emit'($P4)
.annotate 'line', 7224
$P4.'close'()
# }
.annotate 'line', 7225

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7226
# Body
# {
.annotate 'line', 7228
# var handlein: $P1
new $P1, ['FileHandle']
.annotate 'line', 7229
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7230
$P1.'encoding'('utf8')
.annotate 'line', 7231
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7232
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7233
$P3.'parse'($P2)
.annotate 'line', 7234
$P1.'close'()
.annotate 'line', 7235
$P3.'optimize'()
.annotate 'line', 7236
# var handleout: $P4
new $P4, ['StringHandle']
.annotate 'line', 7237
$P4.'open'('__eval__', 'w')
.annotate 'line', 7238
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7239
$P5.'initialize'($P4)
.annotate 'line', 7240
$P3.'emit'($P5)
.annotate 'line', 7241
$P5.'close'()
.annotate 'line', 7242
$P4.'close'()
.annotate 'line', 7243
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7244
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7245
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7246
.return($P7)
# }
.annotate 'line', 7247

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7252
# Body
# {
.annotate 'line', 7254
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7255
$P1.'parse'(__ARG_1)
.annotate 'line', 7257
$P1.'optimize'()
.annotate 'line', 7259
# var handle: $P2
null $P2
.annotate 'line', 7260
iseq $I1, __ARG_2, '-'
unless $I1 goto __label_0
.annotate 'line', 7261
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 7263
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7264
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 7265
$P3.'initialize'($P2)
.annotate 'line', 7266
$P1.'emit'($P3)
.annotate 'line', 7267
$P3.'close'()
.annotate 'line', 7268
$P2.'close'()
# }
.annotate 'line', 7269

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7275
# Body
# {
.annotate 'line', 7277
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7278
compreg 'winxed', $P1
# }
.annotate 'line', 7279

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7281
# Body
# {
.annotate 'line', 7283
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7284
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 7285
$P1.'notOptStop'(1)
.annotate 'line', 7286
$P1.'push_string'('o=s')
.annotate 'line', 7287
$P1.'push_string'('e=s')
.annotate 'line', 7288
$P1.'push_string'('c')
.annotate 'line', 7289
$P1.'push_string'('noan')
.annotate 'line', 7291
__ARG_1.'shift'()
.annotate 'line', 7292
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7293
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7294
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7295
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7296
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7298
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7299
# string filename: $S1
null $S1
.annotate 'line', 7300
# string expr: $S2
null $S2
.annotate 'line', 7301
# var file: $P7
null $P7
.annotate 'line', 7302
isnull $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 7303
iseq $I3, $I1, 0
unless $I3 goto __label_2
# predefined Error
.annotate 'line', 7304
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7306
$S1 = __ARG_1[0]
.annotate 'line', 7307
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7308
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S4, 'function main[main](argv){', $S2
concat $S2, $S4, ';}'
.annotate 'line', 7313
new $P7, ['StringHandle']
.annotate 'line', 7314
$P7.'open'('__eval__', 'w')
.annotate 'line', 7315
$P7.'puts'($S2)
.annotate 'line', 7316
$P7.'close'()
.annotate 'line', 7317
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7320
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7322
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7323
isnull $I2, $P3
not $I2
unless $I2 goto __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7325
'winxed_parser'($P8, $S3)
.annotate 'line', 7327
$P7.'close'()
# }
.annotate 'line', 7328

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7330
# Body
# {
.annotate 'line', 7332
# try: create handler
new $P6, 'ExceptionHandler'
set_addr $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7338
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7332
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7341
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7342
print 'Error: '
say $S1
.annotate 'line', 7343
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7344
# int i: $I1
set $I1, 1
.annotate 'line', 7345
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7346
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7347
# string subname: $S2
null $S2
.annotate 'line', 7348
isnull $I3, $P4
not $I3
unless $I3 goto __label_4
# {
set $S2, $P4
.annotate 'line', 7350
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7351
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
.annotate 'line', 7353
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7354
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7355
isne $I4, $S4, ''
unless $I4 goto __label_8
# {
.annotate 'line', 7356
# int line: $I2
$I2 = $P5['line']
set $I5, $I1
.annotate 'line', 7357
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
.annotate 'line', 7361

.end # main

# End generated code
