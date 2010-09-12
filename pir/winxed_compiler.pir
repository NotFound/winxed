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

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
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
newclass $P0, [ 'SimpleArgList' ]
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
newclass $P0, [ 'Modifier' ]
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
new $P3, [ 'SimpleArgList' ]
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
new $P7, [ 'Modifier' ]
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
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1369
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1413
# Body
# {
.annotate 'line', 1415
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S3, "[ '", $S1
concat $S2, $S3, "' ]"
.annotate 'line', 1416
.return($S2)
# }
.annotate 'line', 1417

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1419
# Body
# {
.annotate 'line', 1421
# predefined elements
elements $I2, __ARG_1
iseq $I1, $I2, 0
unless $I1 goto __label_0
.annotate 'line', 1422
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1424
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S3, ".namespace [ '", $S1
concat $S2, $S3, "' ]"
.annotate 'line', 1425
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1427

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1429
# Body
# {
.annotate 'line', 1431
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1432
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1433
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1434
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1435
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1437
__ARG_2.'unget'($P1)
.annotate 'line', 1438
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1440

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1442
# Body
# {
.annotate 'line', 1444
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1445
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1446
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1447
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1448
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1449
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1450
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1452
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1453
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1454
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
.annotate 'line', 1456
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1458
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1461
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1463
new $P9, [ 'StringStatement' ]
$P9.'StringStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_10: # case
.annotate 'line', 1465
new $P11, [ 'IntStatement' ]
$P11.'IntStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_11: # case
.annotate 'line', 1467
new $P13, [ 'FloatStatement' ]
$P13.'FloatStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_12: # case
.annotate 'line', 1469
new $P15, [ 'ReturnStatement' ]
$P15.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_13: # case
.annotate 'line', 1471
new $P17, [ 'YieldStatement' ]
$P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_14: # case
.annotate 'line', 1473
new $P19, [ 'GotoStatement' ]
$P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_15: # case
.annotate 'line', 1475
new $P21, [ 'IfStatement' ]
$P21.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_16: # case
.annotate 'line', 1477
new $P23, [ 'WhileStatement' ]
$P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_17: # case
.annotate 'line', 1479
new $P25, [ 'DoStatement' ]
$P25.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_18: # case
.annotate 'line', 1481
new $P27, [ 'ContinueStatement' ]
$P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_19: # case
.annotate 'line', 1483
new $P29, [ 'BreakStatement' ]
$P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_20: # case
.annotate 'line', 1485
new $P31, [ 'SwitchStatement' ]
$P31.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P30, $P31
.return($P30)
__label_21: # case
.annotate 'line', 1487
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1489
new $P33, [ 'ThrowStatement' ]
$P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P32, $P33
.return($P32)
__label_23: # case
.annotate 'line', 1491
new $P35, [ 'TryStatement' ]
$P35.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P34, $P35
.return($P34)
__label_5: # default
.annotate 'line', 1493
$P36 = $P1.'isidentifier'()
if_null $P36, __label_24
unless $P36 goto __label_24
# {
.annotate 'line', 1494
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1495
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1496
new $P10, [ 'LabelStatement' ]
.tailcall $P10.'set'($P1, __ARG_2)
__label_25: # endif
.annotate 'line', 1497
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1499
__ARG_1.'unget'($P1)
.annotate 'line', 1500
new $P12, [ 'ExprStatement' ]
$P12.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P11, $P12
.return($P11)
__label_4: # switch end
.annotate 'line', 1502
isnull $I1, $P2
unless $I1 goto __label_26
.annotate 'line', 1503
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1504
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1505

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1513
# Body
# {
.annotate 'line', 1515
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1516

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1517
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1518
# Body
# {
.annotate 'line', 1520
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1521

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1522
# Body
# {
.annotate 'line', 1524
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1525

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1526
# Body
# {
.annotate 'line', 1528
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1529

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1530
# Body
# {
.annotate 'line', 1532
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1533

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1534
# Body
# {
.annotate 'line', 1536
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1537

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1538
# Body
# {
.annotate 'line', 1540
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1541

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1542
# Body
# {
.annotate 'line', 1544
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1545

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1546
# Body
# {
.annotate 'line', 1548
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1549

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1550
# Body
# {
.annotate 'line', 1552
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1553

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1554
# Body
# {
.annotate 'line', 1556
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1557

.end # checkclass


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1558
# Body
# {
.annotate 'line', 1560
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1561

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1562
# Body
# {
.annotate 'line', 1564
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1565

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1566
# Body
# {
.annotate 'line', 1568
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1570
.return(self)
# }
.annotate 'line', 1571

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1511
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1576
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1577
# Body
# {
.annotate 'line', 1579
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1580

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1581
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1582
# Body
# {
# }
.annotate 'line', 1585

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1574
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1592
# Body
# {
.annotate 'line', 1594
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1595
$P1.'push'(__ARG_1)
.annotate 'line', 1596
$P1.'push'(__ARG_2)
.annotate 'line', 1597
setattribute self, 'statements', $P1
# }
.annotate 'line', 1598

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1599
# Body
# {
.annotate 'line', 1601
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1602
.return(self)
# }
.annotate 'line', 1603

.end # push


.sub 'optimize' :method

.annotate 'line', 1604
# Body
# {
.annotate 'line', 1606
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1607
.return(self)
# }
.annotate 'line', 1608

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1609
# Body
# {
.annotate 'line', 1611
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1612
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1613

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1590
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1616
# Body
# {
.annotate 'line', 1618
isnull $I1, __ARG_1
unless $I1 goto __label_0
.annotate 'line', 1619
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1620
isa $I2, __ARG_1, 'MultiStatement'
unless $I2 goto __label_2
.annotate 'line', 1621
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1623
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1624

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1634
# Body
# {
.annotate 'line', 1636
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1637
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1638
# int dotted: $I1
null $I1
.annotate 'line', 1639
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1641
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1643
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1644
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S2, $S3, $S1
box $P3, $S2
setattribute self, 'opname', $P3
.annotate 'line', 1645
$P1 = __ARG_2.'get'()
.annotate 'line', 1646
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1647
__ARG_2.'unget'($P1)
.annotate 'line', 1648
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1650
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1651

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1652
# Body
# {
.annotate 'line', 1654
self.'optimizeargs'()
.annotate 'line', 1655
.return(self)
# }
.annotate 'line', 1656

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1657
# Body
# {
.annotate 'line', 1659
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1660
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1661
__ARG_1.'comment'($S2)
.annotate 'line', 1662
$P1 = self.'numargs'()
set $I2, $P1
iseq $I1, $I2, 0
unless $I1 goto __label_1
.annotate 'line', 1663
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1665
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1666
self.'emitargs'(__ARG_1)
.annotate 'line', 1667
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1669

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1630
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1632
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1679
# Body
# {
.annotate 'line', 1681
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1682
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1683
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1684
# {
.annotate 'line', 1685
$P2 = __ARG_2.'get'()
.annotate 'line', 1686
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1687
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1688
'RequireOp'(';', $P2)
.annotate 'line', 1689
setattribute self, 'path', $P1
.annotate 'line', 1690
.return(self)
# }
.annotate 'line', 1691

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1692
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1693
# Body
# {
.annotate 'line', 1695
self.'annotate'(__ARG_1)
.annotate 'line', 1696
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1697

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1676
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1678
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1707
# Body
# {
.annotate 'line', 1709
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1710
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1711
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1712
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1713

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1714
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1715
# Body
# {
.annotate 'line', 1717
self.'annotate'(__ARG_1)
.annotate 'line', 1718
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1719
getattribute $P3, self, 'symbol'
.annotate 'line', 1718
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1720

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1704
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1706
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1730
# Body
# {
.annotate 'line', 1732
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1733
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1734
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1735
# {
.annotate 'line', 1736
$P2 = __ARG_2.'get'()
.annotate 'line', 1737
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1738
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1739
'RequireOp'(';', $P2)
.annotate 'line', 1740
setattribute self, 'path', $P1
# }
.annotate 'line', 1741

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1742
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1743
# Body
# {
.annotate 'line', 1745
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1746
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1747
self.'annotate'(__ARG_1)
.annotate 'line', 1749
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1751
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1752
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1754
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1757
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1759

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1727
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1729
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1769
# Body
# {
.annotate 'line', 1771
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1772
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1773
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1774

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1775
# Body
# {
.annotate 'line', 1777
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1778
.return(self)
# }
.annotate 'line', 1779

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1780
# Body
# {
.annotate 'line', 1782
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1783

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1766
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1768
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1793
# Body
# {
.annotate 'line', 1795
setattribute self, 'name', __ARG_1
.annotate 'line', 1796
.return(self)
# }
.annotate 'line', 1797

.end # set


.sub 'get_string' :method :vtable

.annotate 'line', 1798
# Body
# {
# predefined Error
.annotate 'line', 1800
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1801

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1792
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1808
# Body
# {
.annotate 'line', 1810
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1811

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1812
# Body
# {
.annotate 'line', 1814
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1815
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1816
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1817
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S4, "Redeclared '", $S1
concat $S3, $S4, "'"
.annotate 'line', 1818
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1819
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1820
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1824
.return($S2)
# }
.annotate 'line', 1825

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1826
# Body
# {
.annotate 'line', 1828
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1829
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1830
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1831
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1832
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1833
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1837

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1838
# Body
# {
.annotate 'line', 1840
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1841
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
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
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1848
new $P5, [ 'ConstantInternalFail' ]
$P4 = $P5.'set'(__ARG_1)
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1850
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1851
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1852
$P1[$S1] = $P3
# }
.annotate 'line', 1853

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1854
# Body
# {
.annotate 'line', 1856
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1857
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1858
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1859
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1860
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1861
.return($P2)
# }
.annotate 'line', 1862

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1807
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 1871
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 1881
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 1882
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 1883
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 1884
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 1885
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 1886
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 1887
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 1888
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1889
# Body
# {
.annotate 'line', 1891
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 1892

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 1893
# Body
# {
.annotate 'line', 1895
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1896

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 1897
# Body
# {
.annotate 'line', 1900
.return(self)
# }
.annotate 'line', 1901

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 1902
# Body
# {
.annotate 'line', 1904
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1905
# string reg: $S2
iseq $I1, $S1, 'v'
unless $I1 goto __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 1906
self.'emit'(__ARG_1, $S2)
.annotate 'line', 1907
.return($S2)
# }
.annotate 'line', 1908

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1909
# Body
# {
.annotate 'line', 1911
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 1912

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 1879
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 1917
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 1915
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1932
# Body
# {
.annotate 'line', 1934
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 1935
.return(self)
# }
.annotate 'line', 1936

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 1937
# Body
# {
.annotate 'line', 1939
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 1940

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 1941
# Body
# {
.annotate 'line', 1943
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 1944
.return(self)
# }
.annotate 'line', 1945

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 1946
# Body
# {
.annotate 'line', 1948
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1949
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 1950
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1952
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 1953
iseq $I2, $I1, 0
unless $I2 goto __label_4
.annotate 'line', 1954
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 1956
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 1959
.return(0)
# }
.annotate 'line', 1960

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1961
# Body
# {
.annotate 'line', 1963
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1964
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1965
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 1966
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
.annotate 'line', 1969
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_3)
__label_6: # case
__label_7: # case
.annotate 'line', 1972
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 1975
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 1977

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1978
# Body
# {
.annotate 'line', 1980
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1981
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1982
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 1983
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
.annotate 'line', 1986
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_2)
__label_6: # case
__label_7: # case
.annotate 'line', 1989
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 1992
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 1994

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 1931
addattribute $P0, 'condexpr'
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2002
# Body
# {
.annotate 'line', 2004
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2005
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2006

.end # StringLiteral


.sub 'isliteral' :method

.annotate 'line', 2007
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isstringliteral' :method

.annotate 'line', 2008
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2009
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2010
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getPirString' :method

.annotate 'line', 2011
# Body
# {
.annotate 'line', 2013
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2014
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2015
# int type: $I1
getattribute $P2, $P1, 'type'
set $I1, $P2
.annotate 'line', 2016
# int need_unicode: $I2
null $I2
box $P3, $S1
.annotate 'line', 2017
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $I3, $P4
# {
.annotate 'line', 2018
isgt $I7, $I3, 127
unless $I7 goto __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2020
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2023
unless $I2 goto __label_4
# {
.annotate 'line', 2024
iseq $I7, $I1, 3
unless $I7 goto __label_5
# {
set $I1, 2
.annotate 'line', 2026
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P3, $S2
.annotate 'line', 2028
iter $P5, $P3
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2029
iseq $I8, $S3, '\'
unless $I8 goto __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2031
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2034
# string result: $S4
set $S4, ''
.annotate 'line', 2035
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2036
# int i: $I5
null $I5
goto __label_11
__label_9: # for iteration
inc $I5
__label_11: # for condition
islt $I8, $I5, $I4
unless $I8 goto __label_10 # for end
# {
.annotate 'line', 2037
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2038
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2039
isgt $I9, $I6, 127
unless $I9 goto __label_12
# {
.annotate 'line', 2040
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
.annotate 'line', 2041
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2044
# }
goto __label_9 # for iteration
__label_10: # for end
set $S1, $S4
.annotate 'line', 2046
# }
__label_4: # endif
.annotate 'line', 2048
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
.annotate 'line', 2050
unless $I2 goto __label_17
concat $S1, 'unicode:', $S1
__label_17: # endif
.annotate 'line', 2052
.return($S1)
# }
.annotate 'line', 2053

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2054
# Body
# {
.annotate 'line', 2056
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2057
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2058
getattribute $P3, $P1, 'type'
set $I2, $P3
iseq $I1, $I2, 2
unless $I1 goto __label_1
# {
.annotate 'line', 2059
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2060
$P4 = $P2.'unescape'('utf8')
set $S1, $P4
# }
__label_1: # endif
.annotate 'line', 2062
.return($S1)
# }
.annotate 'line', 2063

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2064
# Body
# {
.annotate 'line', 2066
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2067

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2068
# Body
# {
.annotate 'line', 2070
.tailcall self.'getPirString'()
# }
.annotate 'line', 2071

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 1999
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2001
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2080
# Body
# {
.annotate 'line', 2083
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2084
setattribute self, 'pos', __ARG_2
.annotate 'line', 2085
# int n: $I1
null $I1
.annotate 'line', 2086
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2087
# {
.annotate 'line', 2089
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2090
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2092
setattribute self, 'numval', $P2
# }
.annotate 'line', 2093

.end # IntegerLiteral


.sub 'isliteral' :method

.annotate 'line', 2094
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2095
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2096
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2097
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getIntegerValue' :method

.annotate 'line', 2098
# Body
# {
.annotate 'line', 2100
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2101
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2102
.return($I1)
# }
.annotate 'line', 2103

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2104
# Body
# {
.annotate 'line', 2106
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2107
iseq $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 2108
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2110
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2111

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2112
# Body
# {
.annotate 'line', 2114
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2115

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2076
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2078
addattribute $P0, 'pos'
.annotate 'line', 2079
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2123
# Body
# {
.annotate 'line', 2125
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2126
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2127

.end # FloatLiteral


.sub 'isliteral' :method

.annotate 'line', 2128
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2129
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2130
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2131
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getFloatValue' :method

.annotate 'line', 2132
# Body
# {
.annotate 'line', 2134
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2135
# var n: $P1
new $P1, ['Float']
assign $P1, $S1
.annotate 'line', 2137
.return($P1)
# }
.annotate 'line', 2138

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2139
# Body
# {
.annotate 'line', 2141
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2142
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2143

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2144
# Body
# {
.annotate 'line', 2148
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2149
# predefined indexof
index $I2, $S1, '.'
islt $I1, $I2, 0
unless $I1 goto __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2151
.return($S1)
# }
.annotate 'line', 2152

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2120
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2122
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2160
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2161
# Body
# {
.annotate 'line', 2163
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2164
setattribute self, 'name', __ARG_2
.annotate 'line', 2165
.return(self)
# }
.annotate 'line', 2166

.end # set


.sub 'isnull' :method

.annotate 'line', 2167
# Body
# {
.annotate 'line', 2169
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2170

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2171
# Body
# {
.annotate 'line', 2173
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2174
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
$P2 = $P1['type']
.annotate 'line', 2175
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2177
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
.annotate 'line', 2180
.return('P')
__label_3: # default
.annotate 'line', 2182
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2185

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2186
# Body
# {
.annotate 'line', 2188
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2189
.return($S1)
# }
.annotate 'line', 2190

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2191
# Body
# {
.annotate 'line', 2193
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2194
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 2195
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2196
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2197
# string s: $S1
null $S1
.annotate 'line', 2198
isnull $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 2199
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2200
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
.annotate 'line', 2206
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2210
$P4 = $P2['id']
isnull $I2, $P4
not $I2
unless $I2 goto __label_8
$P5 = $P2['id']
.annotate 'line', 2211
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2213
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2215
.return($S1)
# }
.annotate 'line', 2216

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2217
# Body
# {
.annotate 'line', 2219
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2220
$S2 = $P1
iseq $I1, $S2, ''
unless $I1 goto __label_0
# {
.annotate 'line', 2221
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S3, "Variable '", $S1
concat $S2, $S3, "' is not defined"
.annotate 'line', 2222
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2224
.return($P1)
# }
.annotate 'line', 2225

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2226
# Body
# {
.annotate 'line', 2228
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2229
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2230
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 2231
$I2 = $P2['const']
unless $I2 goto __label_2
$P3 = $P2['id']
isnull $I2, $P3
__label_2:
unless $I2 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2232
.return($P4)
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2234
.return(self)
# }
.annotate 'line', 2235

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2236
# Body
# {
.annotate 'line', 2238
self.'annotate'(__ARG_1)
.annotate 'line', 2239
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2240

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2241
# Body
# {
.annotate 'line', 2243
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2244

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2245
# Body
# {
.annotate 'line', 2247
self.'annotate'(__ARG_1)
.annotate 'line', 2248
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2249
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2250
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2251
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2254
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2257
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2260
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2261
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2263
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2264
iseq $I1, $S1, $S3
unless $I1 goto __label_11
# {
.annotate 'line', 2265
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2268
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2269
self.'annotate'(__ARG_1)
.annotate 'line', 2270
iseq $I2, $S1, 'P'
unless $I2 goto __label_16
isne $I2, $S3, 'P'
__label_16:
unless $I2 goto __label_14
.annotate 'line', 2271
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2273
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2276
.return($S2)
# }
.annotate 'line', 2277

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2157
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2159
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2284
# Body
# {
.annotate 'line', 2286
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2287

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2282
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2295
# Body
# {
.annotate 'line', 2297
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2298
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2299

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2300
# Body
# {
.annotate 'line', 2302
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2303

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2304
# Body
# {
.annotate 'line', 2306
self.'optimizearg'()
.annotate 'line', 2307
.return(self)
# }
.annotate 'line', 2308

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2292
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2294
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2317
# Body
# {
.annotate 'line', 2319
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2320
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2321
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2322

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2323
# Body
# {
.annotate 'line', 2325
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2326
.return(self)
# }
.annotate 'line', 2327

.end # set


.sub 'optimizearg' :method

.annotate 'line', 2328
# Body
# {
.annotate 'line', 2330
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2331
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2332

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2333
# Body
# {
.annotate 'line', 2335
self.'optimizearg'()
.annotate 'line', 2336
.return(self)
# }
.annotate 'line', 2337

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2313
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2315
addattribute $P0, 'lexpr'
.annotate 'line', 2316
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2344
# Body
# {
.annotate 'line', 2346
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2347

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2348
# Body
# {
.annotate 'line', 2350
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2351
.return(self)
# }
.annotate 'line', 2352

.end # set


.sub 'optimize' :method

.annotate 'line', 2353
# Body
# {
.annotate 'line', 2355
self.'optimizearg'()
.annotate 'line', 2356
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2357
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2358
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2359
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2362
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2363
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2364
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2365
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2368
.return(self)
# }
.annotate 'line', 2369

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2370
# Body
# {
.annotate 'line', 2372
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2373
self.'annotate'(__ARG_1)
.annotate 'line', 2374
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2375

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2342
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2382
# Body
# {
.annotate 'line', 2384
.return('I')
# }
.annotate 'line', 2385

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2386
# Body
# {
.annotate 'line', 2388
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2389
.return(self)
# }
.annotate 'line', 2390

.end # set


.sub 'optimize' :method

.annotate 'line', 2391
# Body
# {
.annotate 'line', 2393
self.'optimizearg'()
.annotate 'line', 2394
getattribute $P3, self, 'subexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2395
# var numval: $P1
getattribute $P4, self, 'subexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2396
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2397
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2399
.return(self)
# }
.annotate 'line', 2400

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2401
# Body
# {
.annotate 'line', 2403
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2404
self.'annotate'(__ARG_1)
.annotate 'line', 2405
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2406
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2408
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2411
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2414
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2416

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2380
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2423
# Body
# {
.annotate 'line', 2425
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2426

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2427
# Body
# {
.annotate 'line', 2429
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2430
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2431
.return(self)
# }
.annotate 'line', 2432

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2433
# Body
# {
.annotate 'line', 2435
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2436
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2437
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2438

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2439
# Body
# {
.annotate 'line', 2441
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2442
self.'annotate'(__ARG_1)
.annotate 'line', 2443
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2444
.return($S1)
# }
.annotate 'line', 2445

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2421
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2452
# Body
# {
.annotate 'line', 2454
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2455
.return(self)
# }
.annotate 'line', 2456

.end # set


.sub 'checkResult' :method

.annotate 'line', 2457
# Body
# {
.annotate 'line', 2459
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2460

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2461
# Body
# {
.annotate 'line', 2463
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2464
self.'annotate'(__ARG_1)
.annotate 'line', 2465
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2466
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2467
.return($S1)
# }
.annotate 'line', 2468

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2450
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

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


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2479
# Body
# {
.annotate 'line', 2481
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2482
.return(self)
# }
.annotate 'line', 2483

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2484
# Body
# {
.annotate 'line', 2486
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2487
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2488
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2489

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2490
# Body
# {
.annotate 'line', 2492
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2493
self.'annotate'(__ARG_1)
.annotate 'line', 2494
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2495
.return($S1)
# }
.annotate 'line', 2496

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2473
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2503
# Body
# {
.annotate 'line', 2505
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2506
.return(self)
# }
.annotate 'line', 2507

.end # set


.sub 'checkResult' :method

.annotate 'line', 2508
# Body
# {
.annotate 'line', 2510
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2511

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2512
# Body
# {
.annotate 'line', 2514
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2515
self.'annotate'(__ARG_1)
.annotate 'line', 2516
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2517
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2518
.return($S1)
# }
.annotate 'line', 2519

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2501
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2528
# Body
# {
.annotate 'line', 2530
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2531
setattribute self, 'eleft', __ARG_3
.annotate 'line', 2532
setattribute self, 'eright', __ARG_4
.annotate 'line', 2533
.return(self)
# }
.annotate 'line', 2534

.end # set


.sub 'checkResult' :method

.annotate 'line', 2535
# Body
# {
.annotate 'line', 2537
getattribute $P2, self, 'eleft'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2538
getattribute $P3, self, 'eleft'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2540
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2541

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2542
# Body
# {
.annotate 'line', 2544
getattribute $P3, self, 'eleft'
$P2 = $P3.'optimize'()
setattribute self, 'eleft', $P2
.annotate 'line', 2545
getattribute $P3, self, 'eright'
$P2 = $P3.'optimize'()
setattribute self, 'eright', $P2
.annotate 'line', 2546
.return(self)
# }
.annotate 'line', 2547

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2548
# Body
# {
.annotate 'line', 2550
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2551

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2524
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2526
addattribute $P0, 'eleft'
.annotate 'line', 2527
addattribute $P0, 'eright'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2558
# Body
# {
.annotate 'line', 2560
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2561
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
# {
.annotate 'line', 2562
self.'annotate'(__ARG_1)
.annotate 'line', 2563
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2565

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2566
# Body
# {
.annotate 'line', 2568
self.'annotate'(__ARG_1)
.annotate 'line', 2569
# var eleft: $P1
getattribute $P1, self, 'eleft'
.annotate 'line', 2570
getattribute $P2, self, 'eright'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2571

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2556
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2578
# Body
# {
.annotate 'line', 2580
self.'annotate'(__ARG_1)
.annotate 'line', 2581
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2582
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2583
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2584

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2585
# Body
# {
.annotate 'line', 2587
self.'annotate'(__ARG_1)
.annotate 'line', 2588
# string reg: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2589
# string reg2: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2590
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2591
.return($S1)
# }
.annotate 'line', 2592

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2576
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2599
# Body
# {
.annotate 'line', 2601
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2602
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2603
__ARG_1.'emitset'(__ARG_2, $S1)
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
# string ltype: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2608
# string rtype: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2609
# string reg: $S3
getattribute $P4, self, 'eleft'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2610
# string reg2: $S4
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2611
self.'annotate'(__ARG_1)
.annotate 'line', 2612
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
# {
.annotate 'line', 2613
isne $I2, $S2, 'S'
unless $I2 goto __label_6
# {
.annotate 'line', 2614
# string aux: $S5
$P5 = self.'tempreg'('S')
null $S5
if_null $P5, __label_7
set $S5, $P5
__label_7:
.annotate 'line', 2615
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2616
# }
__label_6: # endif
.annotate 'line', 2618
__ARG_1.'emitconcat'($S3, $S3, $S4)
# }
goto __label_5
__label_4: # else
.annotate 'line', 2621
__ARG_1.'emitaddto'($S3, $S4)
__label_5: # endif
.annotate 'line', 2622
.return($S3)
# }
.annotate 'line', 2623

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2597
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2630
# Body
# {
.annotate 'line', 2632
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2633
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2634
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2635

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2636
# Body
# {
.annotate 'line', 2638
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2639
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2640
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2641
self.'annotate'(__ARG_1)
.annotate 'line', 2642
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2643
.return($S2)
# }
.annotate 'line', 2644

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2628
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2651
# Body
# {
.annotate 'line', 2653
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2654
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2655
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2656

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2657
# Body
# {
.annotate 'line', 2659
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2660
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2661
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2662
self.'annotate'(__ARG_1)
.annotate 'line', 2663
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2664
.return($S2)
# }
.annotate 'line', 2665

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2649
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2672
# Body
# {
.annotate 'line', 2674
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2675
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2676
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2677

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2678
# Body
# {
.annotate 'line', 2680
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2681
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2682
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2683
self.'annotate'(__ARG_1)
.annotate 'line', 2684
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2685
.return($S2)
# }
.annotate 'line', 2686

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2670
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2693
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2694
# Body
# {
.annotate 'line', 2696
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2697
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2698
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2699
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2700
self.'annotate'(__ARG_1)
.annotate 'line', 2701
# string aux: $S5
null $S5
.annotate 'line', 2702
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2704
iseq $I2, $S1, 'I'
unless $I2 goto __label_7
# {
.annotate 'line', 2705
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2706
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2707
# }
__label_7: # endif
.annotate 'line', 2709
iseq $I1, $S2, 'I'
unless $I1 goto __label_8
# {
.annotate 'line', 2710
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2711
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2712
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2715
iseq $I2, $S2, 'I'
unless $I2 goto __label_11
iseq $I2, $S1, 'P'
__label_11:
unless $I2 goto __label_9
# {
.annotate 'line', 2716
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2717
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2718
# }
goto __label_10
__label_9: # else
.annotate 'line', 2720
iseq $I3, $S2, 'P'
unless $I3 goto __label_14
iseq $I3, $S1, 'I'
__label_14:
unless $I3 goto __label_12
# {
.annotate 'line', 2721
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2722
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2723
# }
goto __label_13
__label_12: # else
.annotate 'line', 2725
iseq $I3, $S2, 'S'
unless $I3 goto __label_17
iseq $I3, $S1, 'P'
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 2726
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2727
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2728
# }
goto __label_16
__label_15: # else
.annotate 'line', 2730
iseq $I4, $S2, 'P'
unless $I4 goto __label_19
iseq $I4, $S1, 'S'
__label_19:
unless $I4 goto __label_18
# {
.annotate 'line', 2731
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2732
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2733
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 2736
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
# }
.annotate 'line', 2737

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2738
# Body
# {
.annotate 'line', 2740
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2741

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2691
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2753
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2754
# Body
# {
.annotate 'line', 2756
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2757
setattribute self, 'expr', __ARG_2
.annotate 'line', 2758
.return(self)
# }
.annotate 'line', 2759

.end # set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 2749
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2751
addattribute $P0, 'expr'
.end
.namespace [ 'OpIsNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2764
# Body
# {
.annotate 'line', 2766
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2767
self.'annotate'(__ARG_1)
.annotate 'line', 2768
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2769

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpIsNullExpr' ]
.annotate 'line', 2762
get_class $P1, [ 'NullCheckerExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2774
# Body
# {
.annotate 'line', 2776
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2777
self.'annotate'(__ARG_1)
.annotate 'line', 2778
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2779
__ARG_1.'say'('not ', __ARG_2)
# }
.annotate 'line', 2780

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotNullExpr' ]
.annotate 'line', 2772
get_class $P1, [ 'NullCheckerExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2787
# Body
# {
.annotate 'line', 2789
self.'optimizearg'()
.annotate 'line', 2790
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2791
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2792
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2793
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2794
unless $I1 goto __label_0
# {
.annotate 'line', 2795
unless $I2 goto __label_1
.annotate 'line', 2796
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 2798
new $P6, [ 'OpIsNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2800
unless $I2 goto __label_3
.annotate 'line', 2801
new $P4, [ 'OpIsNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2802
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2803
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2804
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2805
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2806
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2807
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2808
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2811
.return(self)
# }
.annotate 'line', 2812

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2813
# Body
# {
.annotate 'line', 2815
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2816

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2817
# Body
# {
.annotate 'line', 2819
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2820

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 2785
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2827
# Body
# {
.annotate 'line', 2829
self.'optimizearg'()
.annotate 'line', 2830
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2831
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2832
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2833
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2834
unless $I1 goto __label_0
# {
.annotate 'line', 2835
unless $I2 goto __label_1
.annotate 'line', 2836
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 2838
new $P6, [ 'OpNotNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2840
unless $I2 goto __label_3
.annotate 'line', 2841
new $P4, [ 'OpNotNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2842
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2843
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2844
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2845
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2846
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2847
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2848
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2851
.return(self)
# }
.annotate 'line', 2852

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2853
# Body
# {
.annotate 'line', 2855
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2856

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2857
# Body
# {
.annotate 'line', 2859
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2860

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 2825
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2867
# Body
# {
.annotate 'line', 2869
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2870

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 2865
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2877
# Body
# {
.annotate 'line', 2879
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2880

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 2875
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2887
# Body
# {
.annotate 'line', 2889
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2890

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 2885
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2897
# Body
# {
.annotate 'line', 2899
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2900

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 2895
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2907
# Body
# {
.annotate 'line', 2909
.return('I')
# }
.annotate 'line', 2910

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 2905
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 2917
# Body
# {
.annotate 'line', 2919
self.'optimizearg'()
.annotate 'line', 2920
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2921
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2922
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2923
isne $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2924
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2926
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2928
.return(self)
# }
.annotate 'line', 2929

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2930
# Body
# {
.annotate 'line', 2932
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
.annotate 'line', 2933
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 2934
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 2935
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 2936
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 2937
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 2938
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 2941
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 2942
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 2943
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 2944
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 2945
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 2947

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 2915
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 2954
# Body
# {
.annotate 'line', 2956
self.'optimizearg'()
.annotate 'line', 2957
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2958
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2959
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2960
iseq $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2961
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2963
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2965
.return(self)
# }
.annotate 'line', 2966

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2967
# Body
# {
.annotate 'line', 2969
# string res: $S1
null $S1
.annotate 'line', 2970
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 2973
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 2974
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 2975
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 2976
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 2977
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 2978
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 2979
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 2982
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 2983
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 2984
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 2985
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 2986
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 2988

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 2952
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2995
# Body
# {
.annotate 'line', 2997
.return('I')
# }
.annotate 'line', 2998

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 2993
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3005
# Body
# {
.annotate 'line', 3007
self.'optimizearg'()
.annotate 'line', 3008
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3009
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3010
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3011
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3012
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3013
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3015
.return(self)
# }
.annotate 'line', 3016

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3017
# Body
# {
.annotate 'line', 3019
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
.annotate 'line', 3020
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3021
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3022
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3023
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3024
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3025

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3003
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3032
# Body
# {
.annotate 'line', 3034
self.'optimizearg'()
.annotate 'line', 3035
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3036
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3037
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3038
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3039
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3040
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3042
.return(self)
# }
.annotate 'line', 3043

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3044
# Body
# {
.annotate 'line', 3046
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
.annotate 'line', 3047
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3048
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3049
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3050
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3051
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3052

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3030
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3059
# Body
# {
.annotate 'line', 3061
self.'optimizearg'()
.annotate 'line', 3062
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3063
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3064
$I4 = $P1.'isliteral'()
unless $I4 goto __label_1
$I4 = $P2.'isliteral'()
__label_1:
unless $I4 goto __label_0
# {
.annotate 'line', 3065
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_2
set $S1, $P10
__label_2:
.annotate 'line', 3066
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_3
set $S2, $P10
__label_3:
.annotate 'line', 3067
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3068
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3069
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3070
# var t: $P5
null $P5
.annotate 'line', 3071
# int newtype: $I1
null $I1
.annotate 'line', 3072
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
.annotate 'line', 3076
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_9
set $S3, $P11
__label_9:
.annotate 'line', 3077
# string rs: $S4
getattribute $P12, $P4, 'str'
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
concat $S5, $S3, $S4
.annotate 'line', 3078
$P5 = 'newTokenFrom'($I1, $S5, $P3)
.annotate 'line', 3079
new $P14, [ 'StringLiteral' ]
getattribute $P15, self, 'owner'
$P14.'StringLiteral'($P15, $P5)
set $P13, $P14
.return($P13)
# }
__label_4: # endif
.annotate 'line', 3081
iseq $I5, $S1, 'I'
unless $I5 goto __label_12
iseq $I5, $S2, 'I'
__label_12:
unless $I5 goto __label_11
# {
.annotate 'line', 3082
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3083
# int ln: $I2
set $P13, $P6
set $I2, $P13
.annotate 'line', 3084
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3085
# int rn: $I3
set $P14, $P7
set $I3, $P14
.annotate 'line', 3086
getattribute $P15, self, 'owner'
getattribute $P16, self, 'start'
add $I6, $I2, $I3
.tailcall 'integerValue'($P15, $P16, $I6)
# }
__label_11: # endif
# {
.annotate 'line', 3089
$P16 = 'floatresult'($S1, $S2)
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 3090
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3091
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3092
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3093
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3094
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P17, $P18, $N3)
# }
__label_13: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3098
.return(self)
# }
.annotate 'line', 3099

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3100
# Body
# {
.annotate 'line', 3102
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3103
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3104
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3105
.return($S1)
__label_2: # endif
.annotate 'line', 3106
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3107
.return('S')
__label_3: # endif
.annotate 'line', 3108
iseq $I2, $S1, 'S'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3109
.return('S')
__label_5: # endif
.annotate 'line', 3110
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3111
.return('N')
__label_7: # endif
.annotate 'line', 3112
.return('I')
# }
.annotate 'line', 3113

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3114
# Body
# {
.annotate 'line', 3116
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3117
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3118
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3119
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3120
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3122
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3123
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3124
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
# {
.annotate 'line', 3125
isne $I2, $S2, 'S'
if $I2 goto __label_8
isne $I2, $S3, 'S'
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 3126
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3127
isne $I1, $S2, 'S'
unless $I1 goto __label_10
# {
.annotate 'line', 3128
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3129
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3132
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3133
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3136
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3139
iseq $I2, $S1, 'I'
unless $I2 goto __label_14
isne $I2, $S2, 'I'
if $I2 goto __label_15
isne $I2, $S3, 'I'
__label_15:
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3140
# string l: $S7
null $S7
.annotate 'line', 3141
iseq $I3, $S2, 'I'
unless $I3 goto __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3143
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3144
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3146
# string r: $S8
null $S8
.annotate 'line', 3147
iseq $I3, $S3, 'I'
unless $I3 goto __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3149
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3150
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3152
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3155
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3157

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3057
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3164
# Body
# {
.annotate 'line', 3166
self.'optimizearg'()
.annotate 'line', 3167
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3168
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3169
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3170
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3171
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3172
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3173
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3174
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3175
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3176
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3177
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3180
.return(self)
# }
.annotate 'line', 3181

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3182
# Body
# {
.annotate 'line', 3184
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3185
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3186
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3187
.return($S1)
__label_2: # endif
.annotate 'line', 3188
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3189
.return('N')
__label_3: # endif
.annotate 'line', 3190
iseq $I2, $S1, 'N'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3191
.return('N')
__label_5: # endif
.annotate 'line', 3192
.return('I')
# }
.annotate 'line', 3193

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3194
# Body
# {
.annotate 'line', 3196
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3197
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3198
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3199

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3162
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3206
# Body
# {
.annotate 'line', 3208
self.'optimizearg'()
.annotate 'line', 3209
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3210
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3211
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3212
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3213
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3214
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3215
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3216
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3217
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3218
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3219
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
set $I5, $I1
set $I6, $I2
mul $I4, $I5, $I6
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3222
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3223
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3224
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3225
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3226
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3227
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3231
.return(self)
# }
.annotate 'line', 3232

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3233
# Body
# {
.annotate 'line', 3235
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3236
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3237
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3238
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3239
.return($S1)
__label_2: # endif
.annotate 'line', 3240
iseq $I1, $S1, 'S'
unless $I1 goto __label_3
.annotate 'line', 3241
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3243
.return('N')
__label_4: # endif
# }
.annotate 'line', 3244

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3245
# Body
# {
.annotate 'line', 3247
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3248
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3249
# var ltype: $P3
$P3 = $P1.'checkResult'()
.annotate 'line', 3250
$S10 = $P3
iseq $I3, $S10, 'S'
unless $I3 goto __label_0
# {
.annotate 'line', 3251
# string lreg: $S1
$P4 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 3252
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 3253
# string rval: $S3
null $S3
.annotate 'line', 3254
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
.annotate 'line', 3259
$P6 = self.'tempreg'('I')
set $S3, $P6
.annotate 'line', 3260
__ARG_1.'emitset'($S3, $S2)
__label_3: # switch end
.annotate 'line', 3262
self.'annotate'(__ARG_1)
.annotate 'line', 3263
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S1, ', ', $S3)
.annotate 'line', 3264
.return()
# }
__label_0: # endif
.annotate 'line', 3269
$S11 = $P3
iseq $I3, $S11, 'N'
unless $I3 goto __label_6
# {
.annotate 'line', 3270
# string lreg: $S4
$P5 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_7
set $S4, $P5
__label_7:
.annotate 'line', 3271
# string rreg: $S5
$P6 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P6, __label_8
set $S5, $P6
__label_8:
.annotate 'line', 3272
# string rval: $S6
null $S6
.annotate 'line', 3273
$P7 = $P2.'checkResult'()
set $S12, $P7
set $S13, 'I'
if $S12 == $S13 goto __label_11
set $S13, 'N'
if $S12 == $S13 goto __label_12
goto __label_10
# switch
__label_11: # case
.annotate 'line', 3275
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3276
__ARG_1.'emitset'($S6, $S5)
set $S6, $S5
goto __label_9 # break
__label_12: # case
set $S6, $S5
goto __label_9 # break
__label_10: # default
.annotate 'line', 3283
$P9 = self.'tempreg'('N')
set $S6, $P9
.annotate 'line', 3284
__ARG_1.'emitset'($S6, $S5)
__label_9: # switch end
.annotate 'line', 3286
self.'annotate'(__ARG_1)
.annotate 'line', 3287
__ARG_1.'say'('mul ', __ARG_2, ', ', $S4, ', ', $S6)
.annotate 'line', 3288
.return()
# }
__label_6: # endif
.annotate 'line', 3291
# string rleft: $S7
null $S7
.annotate 'line', 3292
# string rright: $S8
null $S8
.annotate 'line', 3293
# int nleft: $I1
null $I1
.annotate 'line', 3294
# int nright: $I2
null $I2
.annotate 'line', 3295
$P7 = $P1.'issimple'()
isfalse $I4, $P7
if $I4 goto __label_15
$I4 = $P1.'isidentifier'()
__label_15:
unless $I4 goto __label_13
# {
.annotate 'line', 3296
$P9 = self.'checkResult'()
$P8 = self.'tempreg'($P9)
set $S7, $P8
.annotate 'line', 3297
$P1.'emit'(__ARG_1, $S7)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 3300
$P10 = $P1.'getIntegerValue'()
set $I1, $P10
set $S7, $I1
.annotate 'line', 3301
# }
__label_14: # endif
.annotate 'line', 3303
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_18
$I4 = $P2.'isidentifier'()
__label_18:
unless $I4 goto __label_16
# {
.annotate 'line', 3304
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S8, $P11
.annotate 'line', 3305
$P2.'emit'(__ARG_1, $S8)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 3308
# string type: $S9
$P11 = $P2.'checkResult'()
null $S9
if_null $P11, __label_19
set $S9, $P11
__label_19:
set $S12, $S9
set $S13, 'S'
.annotate 'line', 3309
if $S12 == $S13 goto __label_22
set $S13, 'I'
if $S12 == $S13 goto __label_23
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3311
$P13 = self.'checkResult'()
$P12 = self.'tempreg'($P13)
set $S8, $P12
.annotate 'line', 3312
$P2.'emit'(__ARG_1, $S8)
goto __label_20 # break
__label_23: # case
__label_21: # default
.annotate 'line', 3316
$P14 = $P2.'getIntegerValue'()
set $I2, $P14
set $S8, $I2
goto __label_20 # break
__label_20: # switch end
.annotate 'line', 3318
# }
__label_17: # endif
.annotate 'line', 3321
self.'annotate'(__ARG_1)
.annotate 'line', 3322
__ARG_1.'say'('mul ', __ARG_2, ', ', $S7, ', ', $S8)
# }
.annotate 'line', 3323

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3204
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3330
# Body
# {
.annotate 'line', 3332
self.'optimizearg'()
.annotate 'line', 3333
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3334
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3335
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3336
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3337
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3338
# var lval: $P3
null $P3
.annotate 'line', 3339
# var rval: $P4
null $P4
.annotate 'line', 3340
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3341
getattribute $P3, $P1, 'numval'
.annotate 'line', 3342
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3343
getattribute $P4, $P2, 'numval'
.annotate 'line', 3344
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3345
isne $I4, $I2, 0
unless $I4 goto __label_6
.annotate 'line', 3346
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
.annotate 'line', 3349
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3350
getattribute $P3, $P1, 'numval'
.annotate 'line', 3351
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3352
getattribute $P4, $P2, 'numval'
.annotate 'line', 3353
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3354
isne $I4, $N2, $N3
unless $I4 goto __label_8
.annotate 'line', 3355
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
.annotate 'line', 3359
.return(self)
# }
.annotate 'line', 3360

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3361
# Body
# {
.annotate 'line', 3363
.return('N')
# }
.annotate 'line', 3364

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3365
# Body
# {
.annotate 'line', 3367
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3368
# var lreg: $P2
null $P2
.annotate 'line', 3369
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_0
.annotate 'line', 3370
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3372
$P2 = self.'tempreg'('N')
.annotate 'line', 3373
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3375
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3376
# var rreg: $P4
null $P4
.annotate 'line', 3377
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_2
.annotate 'line', 3378
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3380
$P4 = self.'tempreg'('N')
.annotate 'line', 3381
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3383
self.'annotate'(__ARG_1)
.annotate 'line', 3384
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3385

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3328
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3392
# Body
# {
.annotate 'line', 3394
.return('I')
# }
.annotate 'line', 3395

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3396
# Body
# {
.annotate 'line', 3398
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3399
# var lreg: $P2
null $P2
.annotate 'line', 3400
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3401
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3403
$P2 = self.'tempreg'('I')
.annotate 'line', 3404
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3406
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3407
# var rreg: $P4
null $P4
.annotate 'line', 3408
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3409
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3411
$P4 = self.'tempreg'('I')
.annotate 'line', 3412
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3414
self.'annotate'(__ARG_1)
.annotate 'line', 3415
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3416

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3390
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3423
# Body
# {
.annotate 'line', 3425
.return('I')
# }
.annotate 'line', 3426

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3427
# Body
# {
.annotate 'line', 3429
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3430
# var lreg: $P2
null $P2
.annotate 'line', 3431
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3432
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3434
$P2 = self.'tempreg'('I')
.annotate 'line', 3435
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3437
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3438
# var rreg: $P4
null $P4
.annotate 'line', 3439
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3440
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3442
$P4 = self.'tempreg'('I')
.annotate 'line', 3443
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3445
self.'annotate'(__ARG_1)
.annotate 'line', 3450
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3451

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3421
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3460
# Body
# {
.annotate 'line', 3462
setattribute self, 'arg', __ARG_1
.annotate 'line', 3463
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3464

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3465
# Body
# {
.annotate 'line', 3467
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3468
.return(self)
# }
.annotate 'line', 3469

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3470
# Body
# {
.annotate 'line', 3472
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3473

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3458
addattribute $P0, 'arg'
.annotate 'line', 3459
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3476
# Body
# {
.annotate 'line', 3478
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3479
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3480
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3481
.return(1)
# }
.annotate 'line', 3482

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3491
# Body
# {
.annotate 'line', 3493
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3494
setattribute self, 'predef', __ARG_3
.annotate 'line', 3495
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3496

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3497
# Body
# {
.annotate 'line', 3499
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3500

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3501
# Body
# {
.annotate 'line', 3503
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3504
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3505
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3506
# var arg: $P4
null $P4
.annotate 'line', 3507
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3508
iseq $I4, $I1, -1
unless $I4 goto __label_0
# {
.annotate 'line', 3509
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3510
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3511
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3515
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3516
# int i: $I3
null $I3
goto __label_7
__label_5: # for iteration
inc $I3
__label_7: # for condition
islt $I4, $I3, $I2
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 3517
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3518
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3519
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3520
# string argr: $S4
null $S4
.annotate 'line', 3521
iseq $I5, $S2, $S3
if $I5 goto __label_12
iseq $I5, $S3, '?'
__label_12:
unless $I5 goto __label_10
.annotate 'line', 3522
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3524
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3525
iseq $I5, $S3, 'P'
unless $I5 goto __label_13
# {
.annotate 'line', 3526
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3527
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
.annotate 'line', 3532
isne $I6, $S5, ''
unless $I6 goto __label_19
.annotate 'line', 3533
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3535
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3537
$P3.'push'($S4)
# }
goto __label_5 # for iteration
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3540
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3541

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3486
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3488
addattribute $P0, 'predef'
.annotate 'line', 3489
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3551
# Body
# {
.annotate 'line', 3553
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3554
setattribute self, 'funref', __ARG_4
.annotate 'line', 3555
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3556
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3557
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3558
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3559
# {
.annotate 'line', 3560
# var modifier: $P2
null $P2
.annotate 'line', 3561
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3562
$P1 = __ARG_1.'get'()
.annotate 'line', 3563
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3564
$P1 = __ARG_1.'get'()
.annotate 'line', 3565
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3566
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3567
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3570
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3573
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3574
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3575
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3576
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3578

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3579
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3580
# Body
# {
.annotate 'line', 3582
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3583
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3584
'optimize_array'($P1)
.annotate 'line', 3587
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3588
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3589
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3590
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3591
isnull $I1, $P3
not $I1
unless $I1 goto __label_2
# {
.annotate 'line', 3592
self.'use_predef'($S1)
.annotate 'line', 3595
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3596
isnull $I2, $P4
not $I2
unless $I2 goto __label_3
# {
.annotate 'line', 3597
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3598
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3601
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
.annotate 'line', 3605
.return(self)
# }
.annotate 'line', 3606

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3607
# Body
# {
.annotate 'line', 3609
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3610
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3611
# string call: $S1
null $S1
.annotate 'line', 3612
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3613
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 3614
iseq $I6, $S1, ''
unless $I6 goto __label_2
# {
.annotate 'line', 3615
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S8, "'", $S2
concat $S1, $S8, "'"
.annotate 'line', 3616
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3620
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 3622
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3623
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 3624
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 3625
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 3626
# string reg: $S3
null $S3
.annotate 'line', 3627
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 3628
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 3629
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 3632
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 3633
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 3635
self.'annotate'(__ARG_1)
.annotate 'line', 3637
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 3638
$S9 = __ARG_2
iseq $I7, $S9, '.tailcall'
unless $I7 goto __label_12
.annotate 'line', 3639
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 3641
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 3644
unless $I1 goto __label_14
.annotate 'line', 3645
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 3647
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 3649
__ARG_1.'print'('(')
.annotate 'line', 3651
# string sep: $S4
set $S4, ''
.annotate 'line', 3652
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 3653
# int i: $I3
null $I3
goto __label_18
__label_16: # for iteration
inc $I3
__label_18: # for condition
islt $I7, $I3, $I2
unless $I7 goto __label_17 # for end
# {
.annotate 'line', 3654
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 3655
__ARG_1.'print'($S4, $S5)
.annotate 'line', 3656
# int isflat: $I4
null $I4
.annotate 'line', 3657
# int isnamed: $I5
null $I5
.annotate 'line', 3658
# string setname: $S6
set $S6, ''
.annotate 'line', 3659
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 3660
isnull $I8, $P6
not $I8
unless $I8 goto __label_19
# {
.annotate 'line', 3661
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 3662
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 3663
iseq $I8, $S7, 'flat'
unless $I8 goto __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 3665
iseq $I9, $S7, 'named'
unless $I9 goto __label_24
# {
set $I5, 1
.annotate 'line', 3667
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
.annotate 'line', 3671
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 3672
$P17 = $P8.'isstringliteral'()
isfalse $I11, $P17
unless $I11 goto __label_29
.annotate 'line', 3673
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 3674
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 3677
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
.annotate 'line', 3682
and $I10, $I11, $I12
unless $I10 goto __label_30
.annotate 'line', 3683
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 3684
unless $I4 goto __label_32
.annotate 'line', 3685
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 3686
unless $I5 goto __label_34
# {
.annotate 'line', 3687
__ARG_1.'print'(' :named')
.annotate 'line', 3688
isne $I12, $S6, ''
unless $I12 goto __label_35
.annotate 'line', 3689
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 3691
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 3693
__ARG_1.'say'(')')
# }
.annotate 'line', 3694

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 3546
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3548
addattribute $P0, 'funref'
.annotate 'line', 3549
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3704
# Body
# {
.annotate 'line', 3706
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3707
setattribute self, 'left', __ARG_4
.annotate 'line', 3708
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 3709

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 3710
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3711
# Body
# {
.annotate 'line', 3713
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3714
.return(self)
# }
.annotate 'line', 3715

.end # optimize


.sub 'get_member' :method

.annotate 'line', 3716
# Body
# {
.annotate 'line', 3718
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 3719

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 3720
# Body
# {
.annotate 'line', 3722
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 3723
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3724
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3725
isne $I1, $S1, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3726
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 3727
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 3728
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 3730
.return($S2)
# }
.annotate 'line', 3731

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3732
# Body
# {
.annotate 'line', 3734
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3735
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3736
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3737
self.'annotate'(__ARG_1)
.annotate 'line', 3738
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 3739
.return($S3)
# }
.annotate 'line', 3740

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3741
# Body
# {
.annotate 'line', 3743
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3744
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3745
self.'annotate'(__ARG_1)
.annotate 'line', 3746
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 3747

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3748
# Body
# {
.annotate 'line', 3750
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3751
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3752
# string value: $S3
null $S3
.annotate 'line', 3753
iseq $I1, __ARG_2, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3755
iseq $I2, __ARG_3, 'null'
unless $I2 goto __label_4
# {
.annotate 'line', 3756
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 3757
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 3759
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3762
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 3763
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 3765
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 3766

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

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
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3772
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 3773
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3775
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 3776
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
isne $I1, $S5, 'P'
unless $I1 goto __label_6
.annotate 'line', 3777
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 3779
# }
__label_4: # endif
.annotate 'line', 3781
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 3782
.return($S3)
# }
.annotate 'line', 3783

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 3699
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3701
addattribute $P0, 'left'
.annotate 'line', 3702
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3792
# Body
# {
.annotate 'line', 3794
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3795
setattribute self, 'left', __ARG_4
.annotate 'line', 3796
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 3797

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 3798
# Body
# {
.annotate 'line', 3800
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
iseq $I1, $S1, 'S'
unless $I1 goto __label_0
.annotate 'line', 3801
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 3803
.return('P')
__label_1: # endif
# }
.annotate 'line', 3804

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3805
# Body
# {
.annotate 'line', 3807
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3808
self.'optimizeargs'()
.annotate 'line', 3809
.return(self)
# }
.annotate 'line', 3810

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3811
# Body
# {
.annotate 'line', 3813
# var regleft: $P1
null $P1
.annotate 'line', 3814
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 3815
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 3817
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 3818
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 3819
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3820
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 3821
iseq $I2, $S1, 'S'
unless $I2 goto __label_3
# {
.annotate 'line', 3822
isne $I3, $I1, 1
unless $I3 goto __label_5
.annotate 'line', 3823
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 3824
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3827
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 3828
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3829
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 3831

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3832
# Body
# {
.annotate 'line', 3834
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3835
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3836
self.'annotate'(__ARG_1)
.annotate 'line', 3837
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3838
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 3839
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 3840

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3841
# Body
# {
.annotate 'line', 3843
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3844
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3845
# string rreg: $S1
null $S1
.annotate 'line', 3846
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3847
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 3848
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 3851
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 3852
self.'annotate'(__ARG_1)
.annotate 'line', 3853
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3854
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3855
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 3856
.return($S1)
# }
.annotate 'line', 3857

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 3788
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 3790
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3866
# Body
# {
.annotate 'line', 3868
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3869
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 3870
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3871
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 3872
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3873
# {
.annotate 'line', 3874
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3875
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 3876
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 3877
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 3878
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3880

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 3881
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3882
# Body
# {
.annotate 'line', 3884
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3885
.return(self)
# }
.annotate 'line', 3886

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3887
# Body
# {
.annotate 'line', 3889
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3890
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3891

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3892
# Body
# {
.annotate 'line', 3894
self.'annotate'(__ARG_1)
.annotate 'line', 3895
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3896
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 3897
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3898
# string itemreg: $S3
null $S3
.annotate 'line', 3899
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 3900
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 3901
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
.annotate 'line', 3903
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 3904
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 3908
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 3910
self.'annotate'(__ARG_1)
.annotate 'line', 3911
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 3913
.return($S1)
# }
.annotate 'line', 3914

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 3862
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3864
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3924
# Body
# {
.annotate 'line', 3926
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3927
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3928
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 3929
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 3930
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 3931
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3932
# {
.annotate 'line', 3940
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3941
'ExpectOp'(':', __ARG_1)
.annotate 'line', 3942
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3943
$P2.'push'($P4)
.annotate 'line', 3944
$P3.'push'($P5)
# }
.annotate 'line', 3946
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 3947
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 3948
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3950
setattribute self, 'keys', $P2
.annotate 'line', 3951
setattribute self, 'values', $P3
# }
.annotate 'line', 3952

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 3953
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3954
# Body
# {
.annotate 'line', 3956
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 3957
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3958
.return(self)
# }
.annotate 'line', 3959

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3960
# Body
# {
.annotate 'line', 3962
self.'annotate'(__ARG_1)
.annotate 'line', 3963
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 3964
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 3965
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 3966
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 3967
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 3968
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 3969
# string item: $S1
null $S1
.annotate 'line', 3970
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 3971
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 3972
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 3973
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 3976
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 3978
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 3979
# string itemreg: $S3
null $S3
.annotate 'line', 3980
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 3981
# string id: $S4
$P8 = $P4.'getName'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 3982
getattribute $P9, self, 'owner'
$P8 = $P9.'getvar'($S4)
isnull $I3, $P8
unless $I3 goto __label_9
# {
.annotate 'line', 3983
$P10 = self.'tempreg'('P')
set $S3, $P10
.annotate 'line', 3984
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S4, "'")
# }
goto __label_10
__label_9: # else
.annotate 'line', 3987
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 3990
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 3991
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 4013

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4014
# Body
# {
.annotate 'line', 4016
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4017
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4018
.return($S1)
# }
.annotate 'line', 4019

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 3919
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3921
addattribute $P0, 'keys'
.annotate 'line', 3922
addattribute $P0, 'values'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4029
# Body
# {
.annotate 'line', 4031
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4033
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4034
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4035
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4036
$P6 = __ARG_4.'isidentifier'()
if_null $P6, __label_2
unless $P6 goto __label_2
# {
.annotate 'line', 4037
$P7 = $P1.'isop'('.')
if_null $P7, __label_4
unless $P7 goto __label_4
# {
.annotate 'line', 4038
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4039
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4040
# {
.annotate 'line', 4041
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4042
$P6 = $P3.'isidentifier'()
isfalse $I1, $P6
unless $I1 goto __label_9
.annotate 'line', 4043
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4044
$P2.'push'($P3)
# }
.annotate 'line', 4045
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'('.')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 4046
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4049
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4052
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4054
$P9 = $P1.'isop'('(')
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 4055
$P1 = __ARG_1.'get'()
.annotate 'line', 4056
$P10 = $P1.'isop'(')')
isfalse $I2, $P10
unless $I2 goto __label_12
# {
.annotate 'line', 4057
__ARG_1.'unget'($P1)
.annotate 'line', 4058
# var initializer: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
set $P4, $P10
__label_13: # do
.annotate 'line', 4059
# {
.annotate 'line', 4060
# var auxinit: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4061
$P4.'push'($P5)
# }
.annotate 'line', 4062
$P1 = __ARG_1.'get'()
$P11 = $P1.'isop'(',')
if_null $P11, __label_14
if $P11 goto __label_13
__label_14: # enddo
.annotate 'line', 4063
setattribute self, 'initializer', $P4
.annotate 'line', 4064
'RequireOp'(')', $P1)
# }
__label_12: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4068
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4069

.end # NewExpr


.sub 'checkResult' :method

.annotate 'line', 4070
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4071
# Body
# {
.annotate 'line', 4073
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4074
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4077
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4078
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4079
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4080
$P5 = $P3['id']
isnull $I2, $P5
not $I2
unless $I2 goto __label_4
# {
.annotate 'line', 4081
$P1 = $P3['value']
.annotate 'line', 4082
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4083
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4084
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4087
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4091
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4092
isnull $I3, $P4
not $I3
unless $I3 goto __label_7
.annotate 'line', 4093
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4094
.return(self)
# }
.annotate 'line', 4095

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4096
# Body
# {
.annotate 'line', 4098
self.'annotate'(__ARG_1)
.annotate 'line', 4100
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4101
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
.annotate 'line', 4106
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4107
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4108
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
.annotate 'line', 4110
# string reginit: $S1
set $S1, ''
.annotate 'line', 4111
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4112
# string constructor: $S3
null $S3
set $I4, $I1
null $I5
.annotate 'line', 4113
if $I4 == $I5 goto __label_11
set $I5, 1
if $I4 == $I5 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4117
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4118
$P10 = $P2.'emit_get'(__ARG_1)
set $S1, $P10
concat $S1, ', ', $S1
goto __label_9 # break
__label_10: # default
.annotate 'line', 4122
isne $I6, $I2, 1
unless $I6 goto __label_14
isne $I6, $I2, 2
__label_14:
unless $I6 goto __label_13
.annotate 'line', 4123
getattribute $P11, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P11)
__label_13: # endif
.annotate 'line', 4124
$P12 = self.'tempreg'('P')
set $S2, $P12
__label_9: # switch end
set $I4, $I2
null $I5
.annotate 'line', 4127
if $I4 == $I5 goto __label_17
set $I5, 2
if $I4 == $I5 goto __label_18
set $I5, 1
if $I4 == $I5 goto __label_19
goto __label_16
# switch
__label_17: # case
.annotate 'line', 4130
# string name: $S4
getattribute $P14, self, 'value'
$P13 = $P14.'rawstring'()
null $S4
if_null $P13, __label_20
set $S4, $P13
__label_20:
.annotate 'line', 4131
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4132
isnull $I6, $P3
unless $I6 goto __label_21
concat $S7, "Can't locate class ", $S4
concat $S6, $S7, " at compile time"
.annotate 'line', 4133
getattribute $P15, self, 'value'
'Warn'($S6, $P15)
__label_21: # endif
.annotate 'line', 4137
getattribute $P16, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P16, " ]", $S1)
.annotate 'line', 4138
isgt $I7, $I1, 1
unless $I7 goto __label_22
# {
.annotate 'line', 4139
getattribute $P17, self, 'value'
__ARG_1.'say'($S2, ".'", $P17, "'()")
# }
__label_22: # endif
goto __label_15 # break
__label_18: # case
.annotate 'line', 4143
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4144
# predefined elements
elements $I8, $P4
sub $I7, $I8, 1
$S3 = $P4[$I7]
.annotate 'line', 4145
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_15 # break
__label_19: # case
.annotate 'line', 4148
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4149
isnull $I9, $P5
unless $I9 goto __label_23
# {
.annotate 'line', 4151
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4152
isnull $I8, $P6
not $I8
unless $I8 goto __label_25
# {
.annotate 'line', 4153
$P18 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P18, $S1)
# }
goto __label_26
__label_25: # else
# {
.annotate 'line', 4156
'Warn'('Checking: new unknown type')
.annotate 'line', 4157
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_26: # endif
.annotate 'line', 4159
getattribute $P19, self, 'value'
set $S3, $P19
# }
goto __label_24
__label_23: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4163
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_24: # endif
goto __label_15 # break
__label_16: # default
.annotate 'line', 4167
'InternalError'('Unexpected type in new')
__label_15: # switch end
.annotate 'line', 4169
isgt $I9, $I1, 1
unless $I9 goto __label_27
# {
.annotate 'line', 4170
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4171
iter $P21, $P1
set $P21, 0
__label_28: # for iteration
unless $P21 goto __label_29
shift $P8, $P21
# {
.annotate 'line', 4172
# string reg: $S5
$P20 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P20, __label_30
set $S5, $P20
__label_30:
.annotate 'line', 4173
$P7.'push'($S5)
# }
goto __label_28
__label_29: # endfor
.annotate 'line', 4175
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4176
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4177
__ARG_1.'say'(")")
.annotate 'line', 4178
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_27: # endif
# }
.annotate 'line', 4180

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4024
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4026
addattribute $P0, 'value'
.annotate 'line', 4027
addattribute $P0, 'initializer'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4190
# Body
# {
.annotate 'line', 4192
# var first: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4193
$P4 = $P1.'isstring'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 4194
'SyntaxError'('Expected string literal', $P1)
__label_0: # endif
.annotate 'line', 4195
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4196
$P4 = $P2.'isop'(':')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 4197
setattribute self, 'hll', $P1
.annotate 'line', 4198
$P1 = __ARG_1.'get'()
.annotate 'line', 4199
$P5 = $P1.'isstring'()
isfalse $I1, $P5
unless $I1 goto __label_2
.annotate 'line', 4200
'SyntaxError'('Expected string literal', $P1)
__label_2: # endif
.annotate 'line', 4201
$P2 = __ARG_1.'get'()
# }
__label_1: # endif
.annotate 'line', 4203
# var nskey: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4204
$P3.'push'($P1)
__label_4: # while
.annotate 'line', 4205
$P6 = $P2.'isop'(',')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 4206
$P1 = __ARG_1.'get'()
.annotate 'line', 4207
$P7 = $P1.'isstring'()
isfalse $I2, $P7
unless $I2 goto __label_5
.annotate 'line', 4208
'SyntaxError'('Expected string literal', $P1)
__label_5: # endif
.annotate 'line', 4209
$P3.'push'($P1)
.annotate 'line', 4210
$P2 = __ARG_1.'get'()
# }
goto __label_4
__label_3: # endwhile
.annotate 'line', 4212
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_6
.annotate 'line', 4213
'SyntaxError'("Expected ']' in keyed new", $P2)
__label_6: # endif
.annotate 'line', 4214
setattribute self, 'nskey', $P3
# }
.annotate 'line', 4215

.end # NewIndexedExpr


.sub 'checkResult' :method

.annotate 'line', 4216
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4217
# Body
# {
.annotate 'line', 4219
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 4220
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4221
__ARG_1.'print'("root_new ", __ARG_2, ", [", $P1, "; ")
goto __label_1
__label_0: # else
.annotate 'line', 4223
__ARG_1.'print'("new ", __ARG_2, ", [")
__label_1: # endif
.annotate 'line', 4224
# var nskey: $P2
getattribute $P2, self, 'nskey'
# predefined join
.annotate 'line', 4225
join $S1, ";", $P2
__ARG_1.'print'($S1)
.annotate 'line', 4227
__ARG_1.'say'("]")
# }
.annotate 'line', 4228

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4185
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4187
addattribute $P0, 'hll'
.annotate 'line', 4188
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4233
# Body
# {
.annotate 'line', 4235
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4236
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 4237
new $P4, [ 'NewIndexedExpr' ]
$P4.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 4238
$P5 = $P1.'isop'('(')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4239
new $P7, [ 'CallExpr' ]
.annotate 'line', 4240
new $P9, [ 'StringLiteral' ]
$P9.'StringLiteral'(__ARG_2, __ARG_3)
set $P8, $P9
$P7.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P8)
set $P6, $P7
.annotate 'line', 4239
.return($P6)
goto __label_3
__label_2: # else
.annotate 'line', 4242
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4243

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4252
# Body
# {
.annotate 'line', 4254
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4255
setattribute self, 'eleft', __ARG_3
.annotate 'line', 4256
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4257

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4258
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4259
# Body
# {
.annotate 'line', 4261
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4262
# string checkedval: $S1
null $S1
.annotate 'line', 4263
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4264
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S3, "'", $S1
concat $S1, $S3, "'"
.annotate 'line', 4265
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4269
# string r: $S2
getattribute $P3, self, 'eleft'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4270
self.'annotate'(__ARG_1)
.annotate 'line', 4271
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4272

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4247
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4249
addattribute $P0, 'eleft'
.annotate 'line', 4250
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4287
# Body
# {
.annotate 'line', 4289
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4290
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4291
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4292
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4293
.return(self)
# }
.annotate 'line', 4294

.end # set


.sub 'optimize' :method

.annotate 'line', 4295
# Body
# {
.annotate 'line', 4297
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4298
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
.annotate 'line', 4300
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4302
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4304
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4305
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4306
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4308

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4309
# Body
# {
.annotate 'line', 4311
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4312

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4313
# Body
# {
.annotate 'line', 4315
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4316
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4317
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4318
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4319
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4320
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4321
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4322
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4323

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4277
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4283
addattribute $P0, 'condition'
.annotate 'line', 4284
addattribute $P0, 'etrue'
.annotate 'line', 4285
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

.annotate 'line', 4356
# Body
# {
.annotate 'line', 4358
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
.annotate 'line', 4359
.return(1)
__label_3: # case
.annotate 'line', 4360
.return(2)
__label_4: # case
.annotate 'line', 4361
.return(3)
__label_1: # default
.annotate 'line', 4362
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4364

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4366
# Body
# {
.annotate 'line', 4368
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
.annotate 'line', 4369
.return(8)
__label_3: # case
.annotate 'line', 4370
.return(11)
__label_4: # case
.annotate 'line', 4371
.return(9)
__label_5: # case
.annotate 'line', 4372
.return(10)
__label_1: # default
.annotate 'line', 4373
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4375

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4377
# Body
# {
.annotate 'line', 4379
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
.annotate 'line', 4380
.return(19)
__label_3: # case
.annotate 'line', 4381
.return(20)
__label_4: # case
.annotate 'line', 4382
.return(21)
__label_5: # case
.annotate 'line', 4383
.return(22)
__label_1: # default
.annotate 'line', 4384
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4386

.end # getOpCode_5


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4388
# Body
# {
.annotate 'line', 4390
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
.annotate 'line', 4391
.return(14)
__label_3: # case
.annotate 'line', 4392
.return(16)
__label_4: # case
.annotate 'line', 4393
.return(15)
__label_5: # case
.annotate 'line', 4394
.return(17)
__label_1: # default
.annotate 'line', 4395
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4397

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4399
# Body
# {
.annotate 'line', 4401
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
.annotate 'line', 4402
.return(4)
__label_3: # case
.annotate 'line', 4403
.return(5)
__label_4: # case
.annotate 'line', 4404
.return(6)
__label_5: # case
.annotate 'line', 4405
.return(18)
__label_6: # case
.annotate 'line', 4406
.return(23)
__label_7: # case
.annotate 'line', 4407
.return(24)
__label_1: # default
.annotate 'line', 4408
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4410

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4412
# Body
# {
.annotate 'line', 4414
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4416
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4417
# var expr: $P2
null $P2
.annotate 'line', 4418
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4419
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4420
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4421
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4423
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4424
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4425
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4426
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4427
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4428
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4429
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4430
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4431
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4432
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4433
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4434
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4435
$P11 = $P1.'isidentifier'()
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4436
new $P12, [ 'IdentifierExpr' ]
.tailcall $P12.'set'(__ARG_2, $P1)
__label_7: # endif
.annotate 'line', 4437
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4438

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4440
# Body
# {
.annotate 'line', 4442
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4443
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4445
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4446
# var t: $P2
null $P2
.annotate 'line', 4447
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4448
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
set $I3, $I1
set $I4, 1
.annotate 'line', 4449
if $I3 == $I4 goto __label_4
set $I4, 2
if $I3 == $I4 goto __label_5
set $I4, 3
if $I3 == $I4 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4451
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4454
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4457
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4460
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4463
__ARG_1.'unget'($P2)
.annotate 'line', 4464
.return($P1)
# }
.annotate 'line', 4465

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4467
# Body
# {
.annotate 'line', 4469
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4471
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4472
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4473
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4474
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4475
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4476
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4479
__ARG_1.'unget'($P2)
.annotate 'line', 4480
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4482

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4484
# Body
# {
.annotate 'line', 4486
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4487
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4488
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4490
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4491
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4492
# var subexpr: $P2
null $P2
.annotate 'line', 4493
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4494
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4495
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4496
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
.annotate 'line', 4498
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4501
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4504
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4507
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4510
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4512
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4515
__ARG_1.'unget'($P1)
.annotate 'line', 4516
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4518
.return($P2)
# }
.annotate 'line', 4519

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4521
# Body
# {
.annotate 'line', 4523
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4524
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4526
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4527
# var t: $P2
null $P2
.annotate 'line', 4528
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4529
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4530
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4531
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4532
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
.annotate 'line', 4534
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4537
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4540
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4543
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4546
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 4548
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4549
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4551
__ARG_1.'unget'($P2)
.annotate 'line', 4552
.return($P1)
# }
.annotate 'line', 4553

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4555
# Body
# {
.annotate 'line', 4557
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 4559
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4560
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4561
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 4562
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4563
# var expr: $P4
null $P4
.annotate 'line', 4564
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 4565
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 4567
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 4568
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4570
__ARG_1.'unget'($P2)
.annotate 'line', 4571
.return($P1)
# }
.annotate 'line', 4572

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4574
# Body
# {
.annotate 'line', 4576
.const 'Sub' $P5 = 'parseExpr_6'
.annotate 'line', 4578
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4579
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4580
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
.annotate 'line', 4581
$P6 = $P2.'isop'('==')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4582
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4583
new $P6, [ 'OpEqualExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 4585
$P7 = $P2.'isop'('!=')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4586
# var eright: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4587
new $P7, [ 'OpNotEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4590
new $P8, [ 'OpInstanceOfExpr' ]
$P8.'OpInstanceOfExpr'(__ARG_2, $P2, $P1, __ARG_1)
set $P1, $P8
# }
__label_7: # endif
__label_5: # endif
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4593
__ARG_1.'unget'($P2)
.annotate 'line', 4594
.return($P1)
# }
.annotate 'line', 4595

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4597
# Body
# {
.annotate 'line', 4599
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 4600
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 4602
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4603
# var t: $P2
null $P2
.annotate 'line', 4604
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4605
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4606
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 4607
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
.annotate 'line', 4609
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 4612
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 4615
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 4618
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 4621
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4624
__ARG_1.'unget'($P2)
.annotate 'line', 4625
.return($P1)
# }
.annotate 'line', 4626

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4628
# Body
# {
.annotate 'line', 4630
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 4632
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4633
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4634
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4635
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4636
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4638
__ARG_1.'unget'($P2)
.annotate 'line', 4639
.return($P1)
# }
.annotate 'line', 4640

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4642
# Body
# {
.annotate 'line', 4644
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 4646
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4647
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4648
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4649
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4650
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4652
__ARG_1.'unget'($P2)
.annotate 'line', 4653
.return($P1)
# }
.annotate 'line', 4654

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4656
# Body
# {
.annotate 'line', 4658
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 4660
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4661
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4662
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4663
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4664
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4666
__ARG_1.'unget'($P2)
.annotate 'line', 4667
.return($P1)
# }
.annotate 'line', 4668

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4670
# Body
# {
.annotate 'line', 4672
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 4674
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4675
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4676
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4677
# var eright: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 4678
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4680
__ARG_1.'unget'($P2)
.annotate 'line', 4681
.return($P1)
# }
.annotate 'line', 4682

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4684
# Body
# {
.annotate 'line', 4686
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4687
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 4689
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4690
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4691
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 4692
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4693
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4694
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4695
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4698
__ARG_1.'unget'($P2)
.annotate 'line', 4699
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 4701

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4703
# Body
# {
.annotate 'line', 4705
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4706
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 4707
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 4709
# var eleft: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4710
# var t: $P2
null $P2
.annotate 'line', 4711
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4712
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4713
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4714
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 4715
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
.annotate 'line', 4717
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4720
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4723
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4726
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 4729
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 4732
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4735
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 4737
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4738
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4740
__ARG_1.'unget'($P2)
.annotate 'line', 4741
.return($P1)
# }
.annotate 'line', 4742

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4744
# Body
# {
.annotate 'line', 4746
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 4748
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 4749

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 4762
# Body
# {
.annotate 'line', 4764
getattribute $P1, self, 'brlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4765
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 4766
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4767
setattribute self, 'brlabel', $P2
.annotate 'line', 4768
.return($S1)
# }
.annotate 'line', 4769

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 4770
# Body
# {
.annotate 'line', 4772
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 4773
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4774
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 4775
.return($P1)
# }
.annotate 'line', 4776

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 4760
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 4783
# Body
# {
.annotate 'line', 4785
getattribute $P1, self, 'cntlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4786
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 4787
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4788
setattribute self, 'cntlabel', $P2
.annotate 'line', 4789
.return($S1)
# }
.annotate 'line', 4790

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 4791
# Body
# {
.annotate 'line', 4793
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 4794
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4795
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 4796
.return($P1)
# }
.annotate 'line', 4797

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 4779
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 4781
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4811
# Body
# {
.annotate 'line', 4813
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4814
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4815
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 4816
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 4817
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 4818
# {
.annotate 'line', 4819
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 4820
$P2.'push'($P3)
# }
.annotate 'line', 4821
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 4823
'RequireOp'(';', $P1)
.annotate 'line', 4824
setattribute self, 'values', $P2
# }
.annotate 'line', 4825

.end # parse


.sub 'optimize' :method

.annotate 'line', 4826
# Body
# {
.annotate 'line', 4828
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4829
.return(self)
# }
.annotate 'line', 4830

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4831
# Body
# {
.annotate 'line', 4833
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 4834
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4835
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 4838
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4839
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 4841
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 4842
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 4843
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 4844
self.'annotate'(__ARG_1)
.annotate 'line', 4845
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 4849
# int i: $I2
null $I2
goto __label_7
__label_5: # for iteration
inc $I2
__label_7: # for condition
islt $I4, $I2, $I1
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 4850
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 4851
# string reg: $S1
null $S1
.annotate 'line', 4852
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 4853
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 4854
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4857
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 4858
$P1.'push'($S1)
# }
goto __label_5 # for iteration
__label_6: # for end
.annotate 'line', 4860
self.'annotate'(__ARG_1)
.annotate 'line', 4861
self.'emitret'(__ARG_1)
.annotate 'line', 4862
# string sep: $S2
set $S2, ''
.annotate 'line', 4863
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 4864
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 4865
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 4867
__ARG_1.'say'(')')
# }
.annotate 'line', 4868

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 4807
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 4809
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4873
# Body
# {
.annotate 'line', 4875
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4876

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4877
# Body
# {
.annotate 'line', 4879
__ARG_1.'print'('.return(')
# }
.annotate 'line', 4880

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 4871
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4885
# Body
# {
.annotate 'line', 4887
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4888

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4889
# Body
# {
.annotate 'line', 4891
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 4892

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 4883
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4903
# Body
# {
.annotate 'line', 4905
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 4906
setattribute self, 'name', __ARG_1
.annotate 'line', 4907
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 4908
setattribute self, 'value', $P2
.annotate 'line', 4909
.return(self)
# }
.annotate 'line', 4910

.end # set


.sub 'optimize' :method

.annotate 'line', 4911
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4912
# Body
# {
.annotate 'line', 4914
self.'annotate'(__ARG_1)
.annotate 'line', 4915
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4916
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 4917
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 4918

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 4899
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 4901
addattribute $P0, 'name'
.annotate 'line', 4902
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4929
# Body
# {
.annotate 'line', 4931
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4932
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4933
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 4934
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 4935
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 4936
setattribute self, 'label', $P1
.annotate 'line', 4937
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 4938

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 4939
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4940
# Body
# {
.annotate 'line', 4942
self.'annotate'(__ARG_1)
.annotate 'line', 4943
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4944
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 4945
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 4946

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 4925
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 4927
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 4955
# Body
# {
.annotate 'line', 4957
'ExpectOp'('(', __ARG_1)
.annotate 'line', 4958
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 4959
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 4960

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 4953
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

.annotate 'line', 4971
# Body
# {
.annotate 'line', 4973
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4974
self.'parsecondition'(__ARG_2)
.annotate 'line', 4975
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 4976
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4977
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 4978
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 4980
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 4981
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 4983

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 4984
# Body
# {
.annotate 'line', 4986
self.'optimize_condition'()
.annotate 'line', 4987
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 4988
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 4989
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 4990
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4992
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 4994
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 4996
.return(self)
# }
.annotate 'line', 4997

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4998
# Body
# {
.annotate 'line', 5000
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5001
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5002
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5003
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5004
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5005
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5006
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5007
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5008
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5009
self.'annotate'(__ARG_1)
.annotate 'line', 5010
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5011
$P1.'emit'(__ARG_1)
.annotate 'line', 5013
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5014
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5015
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5016
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5018
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5019

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 4967
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 4969
addattribute $P0, 'truebranch'
.annotate 'line', 4970
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5029
# Body
# {
.annotate 'line', 5031
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5032

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5033
# Body
# {
.annotate 'line', 5035
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5036
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5038
self.'annotate'(__ARG_1)
.annotate 'line', 5039
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5040
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5041
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5042
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5043

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5026
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5028
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5052
# Body
# {
.annotate 'line', 5054
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5055
self.'parsecondition'(__ARG_2)
.annotate 'line', 5056
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5057

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5058
# Body
# {
.annotate 'line', 5060
self.'optimize_condition'()
.annotate 'line', 5061
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5062
.return(self)
# }
.annotate 'line', 5063

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5064
# Body
# {
.annotate 'line', 5066
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5068
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5071
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5074
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5075
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5077
self.'annotate'(__ARG_1)
.annotate 'line', 5078
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5079
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5080
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5081
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5082
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5084

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5050
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

.annotate 'line', 5093
# Body
# {
.annotate 'line', 5095
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5096
self.'parsebody'(__ARG_2)
.annotate 'line', 5097
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5098
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5099

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5100
# Body
# {
.annotate 'line', 5102
self.'optimize_condition'()
.annotate 'line', 5103
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5104
.return(self)
# }
.annotate 'line', 5105

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5106
# Body
# {
.annotate 'line', 5108
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5110
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5113
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5114
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5115
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5117
self.'annotate'(__ARG_1)
.annotate 'line', 5118
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5120
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5121
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5122
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5124

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5091
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

.annotate 'line', 5133
# Body
# {
.annotate 'line', 5135
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5136
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5137

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5138
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5139
# Body
# {
.annotate 'line', 5141
self.'annotate'(__ARG_1)
.annotate 'line', 5142
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5143
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5144

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5131
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
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

.end # BreakStatement


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
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5163
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5164

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5151
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5178
# Body
# {
.annotate 'line', 5180
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5181
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5182
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5183
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5184
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5185
$P1 = __ARG_2.'get'()
.annotate 'line', 5186
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5187
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5188
$P1 = __ARG_2.'get'()
.annotate 'line', 5189
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5190
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5191
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5192
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5193
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5194
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5195
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5196
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5197
$P1 = __ARG_2.'get'()
.annotate 'line', 5198
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5199
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5200
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5201
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
.annotate 'line', 5202
__ARG_2.'unget'($P1)
.annotate 'line', 5203
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5205
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5206
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5209
$P1 = __ARG_2.'get'()
.annotate 'line', 5210
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5211
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5212
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
.annotate 'line', 5213
__ARG_2.'unget'($P1)
.annotate 'line', 5214
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5216
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5219

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5220
# Body
# {
.annotate 'line', 5222
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5223
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5224
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5225
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5226
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5227
.return(self)
# }
.annotate 'line', 5228

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5229
# Body
# {
.annotate 'line', 5232
# string type: $S1
set $S1, ''
.annotate 'line', 5233
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5234
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5235
iseq $I3, $S2, 'N'
unless $I3 goto __label_3
.annotate 'line', 5236
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5237
iseq $I3, $S1, ''
unless $I3 goto __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5239
isne $I4, $S1, $S2
unless $I4 goto __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5240
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5243
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5244
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
iseq $I4, $S9, $S1
unless $I4 goto __label_8
.annotate 'line', 5245
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5247
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5248
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5252
self.'genbreaklabel'()
.annotate 'line', 5253
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5254
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5255
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5256
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5257
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5258
$P2.'push'($S7)
.annotate 'line', 5259
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5260
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5262
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5265
__ARG_1.'comment'('switch')
.annotate 'line', 5266
self.'annotate'(__ARG_1)
.annotate 'line', 5267
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5268
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5269
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5270
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5271
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5272
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5273
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5274
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5277
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5278
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5279
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5281
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5282

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5171
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5173
addattribute $P0, 'condition'
.annotate 'line', 5174
addattribute $P0, 'case_value'
.annotate 'line', 5175
addattribute $P0, 'case_st'
.annotate 'line', 5176
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5295
# Body
# {
.annotate 'line', 5297
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5298
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5299
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5300
__ARG_2.'unget'($P1)
.annotate 'line', 5301
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5303
$P1 = __ARG_2.'get'()
.annotate 'line', 5304
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5305
__ARG_2.'unget'($P1)
.annotate 'line', 5306
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P5
.annotate 'line', 5307
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5309
$P1 = __ARG_2.'get'()
.annotate 'line', 5310
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5311
__ARG_2.'unget'($P1)
.annotate 'line', 5312
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P6
.annotate 'line', 5313
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5315
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5316

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5317
# Body
# {
.annotate 'line', 5319
getattribute $P1, self, 'initializer'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5320
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5321
getattribute $P1, self, 'condition'
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 5322
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
__label_1: # endif
.annotate 'line', 5323
getattribute $P5, self, 'iteration'
isnull $I2, $P5
not $I2
unless $I2 goto __label_2
.annotate 'line', 5324
getattribute $P8, self, 'iteration'
$P7 = $P8.'optimize'()
setattribute self, 'iteration', $P7
__label_2: # endif
.annotate 'line', 5325
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5326
.return(self)
# }
.annotate 'line', 5327

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5328
# Body
# {
.annotate 'line', 5330
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5331
getattribute $P2, self, 'condition'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5332
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5333
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5334
.return()
# }
__label_0: # endif
.annotate 'line', 5336
__ARG_1.'comment'('for loop')
.annotate 'line', 5337
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5338
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5339
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5340
getattribute $P4, self, 'initializer'
isnull $I1, $P4
not $I1
unless $I1 goto __label_6
.annotate 'line', 5341
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5342
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5344
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5345
getattribute $P4, self, 'iteration'
isnull $I2, $P4
not $I2
unless $I2 goto __label_7
.annotate 'line', 5346
# string unused: $S4
getattribute $P6, self, 'iteration'
$P5 = $P6.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
__label_7: # endif
.annotate 'line', 5348
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5349
getattribute $P6, self, 'condition'
isnull $I2, $P6
not $I2
unless $I2 goto __label_9
# {
.annotate 'line', 5350
# string regcond: $S5
getattribute $P8, self, 'condition'
$P7 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P7, __label_10
set $S5, $P7
__label_10:
.annotate 'line', 5351
__ARG_1.'say'('unless ', $S5, ' goto ', $S2, ' # for end')
# }
__label_9: # endif
.annotate 'line', 5354
getattribute $P7, self, 'body'
$P7.'emit'(__ARG_1)
.annotate 'line', 5355
__ARG_1.'emitgoto'($S1, 'for iteration')
.annotate 'line', 5357
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5358

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5289
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5291
addattribute $P0, 'initializer'
.annotate 'line', 5292
addattribute $P0, 'condition'
.annotate 'line', 5293
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5370
# Body
# {
.annotate 'line', 5372
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5373
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5374
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5375
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5376
isne $I1, $S2, ''
unless $I1 goto __label_2
# {
.annotate 'line', 5377
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5379
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5381
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5382
setattribute self, 'varname', $P1
.annotate 'line', 5383
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5384
$P2 = __ARG_2.'get'()
.annotate 'line', 5385
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5386
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5387
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5388

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5389
# Body
# {
.annotate 'line', 5391
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5392
.return(self)
# }
.annotate 'line', 5393

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5394
# Body
# {
.annotate 'line', 5396
self.'annotate'(__ARG_1)
.annotate 'line', 5397
# string regcont: $S1
null $S1
.annotate 'line', 5398
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
iseq $I1, $S6, 'S'
unless $I1 goto __label_0
# {
.annotate 'line', 5399
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5400
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5401
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5404
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5405
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5406
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5407
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5408
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5409
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5410
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5411
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5412
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5413
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5414
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5415
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5416
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5417

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5365
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5367
addattribute $P0, 'varname'
.annotate 'line', 5368
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5422
# Body
# {
.annotate 'line', 5424
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5425
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5426
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5427
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5428
__ARG_2.'unget'($P3)
.annotate 'line', 5429
__ARG_2.'unget'($P2)
.annotate 'line', 5430
__ARG_2.'unget'($P1)
.annotate 'line', 5431
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5432
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5434
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5435

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5445
# Body
# {
.annotate 'line', 5447
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5448
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5449

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5450
# Body
# {
.annotate 'line', 5452
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5453
.return(self)
# }
.annotate 'line', 5454

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5455
# Body
# {
.annotate 'line', 5457
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5458
self.'annotate'(__ARG_1)
.annotate 'line', 5459
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5460

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5441
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5443
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5474
# Body
# {
.annotate 'line', 5476
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5477
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5478
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5479
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5482
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5484
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5485
$P1 = __ARG_2.'get'()
.annotate 'line', 5486
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5487
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5488
$P1 = __ARG_2.'get'()
.annotate 'line', 5489
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5490
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5491
$P1 = __ARG_2.'get'()
.annotate 'line', 5492
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5493
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5494
setattribute self, 'exname', $P1
.annotate 'line', 5495
self.'createvar'($S1, 'P')
.annotate 'line', 5496
$P1 = __ARG_2.'get'()
.annotate 'line', 5497
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5498
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5500
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5501

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5502
# Body
# {
.annotate 'line', 5504
getattribute $P1, self, 'modifiers'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5505
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5506
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5507
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 5508
.return(self)
# }
.annotate 'line', 5509

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5510
# Body
# {
.annotate 'line', 5512
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5513
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5514
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5515
# string exreg: $S4
null $S4
.annotate 'line', 5516
getattribute $P8, self, 'exname'
isnull $I3, $P8
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 5517
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5518
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5521
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5523
self.'annotate'(__ARG_1)
.annotate 'line', 5524
__ARG_1.'comment'('try: create handler')
.annotate 'line', 5526
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 5527
__ARG_1.'say'('set_addr ', $S1, ', ', $S2)
.annotate 'line', 5529
getattribute $P10, self, 'modifiers'
isnull $I3, $P10
not $I3
unless $I3 goto __label_5
# {
.annotate 'line', 5530
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 5531
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 5532
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 5533
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 5534
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 5537
isne $I4, $I1, 1
unless $I4 goto __label_14
.annotate 'line', 5538
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 5539
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 5540
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 5541
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 5544
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 5545
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5546
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 5547
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5549
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 5550
# string sep: $S7
set $S7, ''
.annotate 'line', 5551
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 5552
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 5553
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 5555
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 5558
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 5563
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 5564
__ARG_1.'comment'('try: begin')
.annotate 'line', 5565
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 5566
__ARG_1.'comment'('try: end')
.annotate 'line', 5568
self.'annotate'(__ARG_1)
.annotate 'line', 5569
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5571
__ARG_1.'comment'('catch')
.annotate 'line', 5572
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5573
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 5574
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 5575
__ARG_1.'say'('pop_eh')
.annotate 'line', 5576
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 5578
__ARG_1.'comment'('catch end')
.annotate 'line', 5579
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 5580

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 5467
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 5469
addattribute $P0, 'stry'
.annotate 'line', 5470
addattribute $P0, 'modifiers'
.annotate 'line', 5471
addattribute $P0, 'exname'
.annotate 'line', 5472
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5591
# Body
# {
.annotate 'line', 5593
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5594
setattribute self, 'name', __ARG_3
.annotate 'line', 5595
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5596
setattribute self, 'reg', $P2
# }
.annotate 'line', 5597

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 5587
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5589
addattribute $P0, 'name'
.annotate 'line', 5590
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5614
# Body
# {
.annotate 'line', 5616
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5617
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5618
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5619
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5620
setattribute self, 'name', $P1
.annotate 'line', 5621
# string reg: $S1
null $S1
.annotate 'line', 5623
$P1 = __ARG_2.'get'()
.annotate 'line', 5624
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 5626
setattribute self, 'typearray', $P5
.annotate 'line', 5627
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 5628
$P1 = __ARG_2.'get'()
.annotate 'line', 5629
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 5631
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 5634
__ARG_2.'unget'($P1)
.annotate 'line', 5635
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 5636
$P1 = __ARG_2.'get'()
.annotate 'line', 5637
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 5638
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 5639
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 5644
setattribute self, 'typearray', $P8
.annotate 'line', 5645
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 5646
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5648
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 5649
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 5653
setattribute self, 'reg', $P11
.annotate 'line', 5654
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 5656
$P1 = __ARG_2.'get'()
.annotate 'line', 5657
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 5658
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 5659
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 5660
$P1 = __ARG_2.'get'()
.annotate 'line', 5661
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 5662
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 5663
# {
.annotate 'line', 5664
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5665
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 5666
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 5667
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 5668
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 5670
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 5672
$P16 = $P1.'isop'(';')
isfalse $I3, $P16
unless $I3 goto __label_14
.annotate 'line', 5673
'SyntaxError'("Expected ';'", $P1)
__label_14: # endif
# }
.annotate 'line', 5674

.end # parse


.sub 'optimize' :method

.annotate 'line', 5675
# Body
# {
.annotate 'line', 5677
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 5678
getattribute $P2, self, 'size'
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
.annotate 'line', 5679
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 5680
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
# {
.annotate 'line', 5681
getattribute $P2, self, 'typearray'
set $I3, $P2
iseq $I2, $I3, 0
unless $I2 goto __label_2
.annotate 'line', 5682
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 5684
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 5686
.return(self)
# }
.annotate 'line', 5687

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5688
# Body
# {
.annotate 'line', 5690
self.'annotate'(__ARG_1)
.annotate 'line', 5691
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 5692
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5693
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 5694
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 5695
# var init: $P1
getattribute $P1, self, 'init'
concat $S13, $S1, ' '
concat $S12, $S13, $S2
concat $S11, $S12, ': '
concat $S10, $S11, $S3
.annotate 'line', 5696
__ARG_1.'comment'($S10)
.annotate 'line', 5698
getattribute $P6, self, 'typearray'
set $I4, $P6
iseq $I3, $I4, 0
unless $I3 goto __label_4
# {
.annotate 'line', 5699
isnull $I5, $P1
if $I5 goto __label_8
$I5 = $P1.'isnull'()
__label_8:
unless $I5 goto __label_6
.annotate 'line', 5700
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 5702
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 5703
iseq $I3, $S5, $S4
unless $I3 goto __label_10
# {
.annotate 'line', 5704
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 5707
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_12
# {
.annotate 'line', 5709
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 5712
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 5713
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 5714
iseq $I5, $S4, 'S'
unless $I5 goto __label_17
iseq $I5, $S5, 'P'
__label_17:
unless $I5 goto __label_15
# {
.annotate 'line', 5715
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 5716
__ARG_1.'emitnull'($S3)
.annotate 'line', 5717
__ARG_1.'say'('if_null ', $S6, ', ', $S7)
.annotate 'line', 5718
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 5719
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 5722
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
.annotate 'line', 5728
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 5729
isnull $I6, $P2
not $I6
unless $I6 goto __label_19
# {
.annotate 'line', 5731
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 5732
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 5736
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 5738
isnull $I6, $P1
not $I6
unless $I6 goto __label_22
# {
.annotate 'line', 5739
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 5740
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 5741
isnull $I7, $P2
unless $I7 goto __label_24
# {
.annotate 'line', 5742
isgt $I8, $I1, 0
unless $I8 goto __label_25
# {
.annotate 'line', 5744
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 5747
# int i: $I2
null $I2
.annotate 'line', 5748
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 5749
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 5750
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 5751
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 5755

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5756
# Body
# {
.annotate 'line', 5758
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 5759

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 5604
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5606
addattribute $P0, 'name'
.annotate 'line', 5607
addattribute $P0, 't_reg'
.annotate 'line', 5608
addattribute $P0, 't_name'
.annotate 'line', 5609
addattribute $P0, 't_array'
.annotate 'line', 5610
addattribute $P0, 'reg'
.annotate 'line', 5611
addattribute $P0, 'typearray'
.annotate 'line', 5612
addattribute $P0, 'size'
.annotate 'line', 5613
addattribute $P0, 'init'
.end
.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5772
# Body
# {
.annotate 'line', 5775
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 5776
setattribute self, 'type', $P1
.annotate 'line', 5777
setattribute self, 'name', __ARG_4
.annotate 'line', 5778
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 5779

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 5780
# Body
# {
.annotate 'line', 5782
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5783
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 5784
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5785
$P1 = $P1.'optimize'()
.annotate 'line', 5786
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5788
getattribute $P4, self, 'start'
.annotate 'line', 5787
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 5790
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 5791
setattribute self, 'value', $P1
.annotate 'line', 5792
.return(self)
# }
.annotate 'line', 5793

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 5794
# Body
# {
.annotate 'line', 5796
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 5797

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5798
# Body
# {
.annotate 'line', 5800
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S3, 'Constant ', $S1
concat $S2, $S3, ' evaluated at compile time'
.annotate 'line', 5801
__ARG_1.'comment'($S2)
# }
.annotate 'line', 5802

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 5766
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5768
addattribute $P0, 'type'
.annotate 'line', 5769
addattribute $P0, 'name'
.annotate 'line', 5770
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5805
# Body
# {
.annotate 'line', 5807
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5808
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 5809
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5810
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 5812
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 5813
# {
.annotate 'line', 5814
$P1 = __ARG_2.'get'()
.annotate 'line', 5815
# var name: $P3
set $P3, $P1
.annotate 'line', 5816
'ExpectOp'('=', __ARG_2)
.annotate 'line', 5817
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 5819
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 5818
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 5820
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 5821
.return($P2)
# }
.annotate 'line', 5822

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5831
# Body
# {
.annotate 'line', 5833
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5834
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5835
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5836
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 5837
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 5839
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 5840
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5841

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 5842
# Body
# {
.annotate 'line', 5844
getattribute $P1, self, 'init'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5845
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 5846
.return(self)
# }
.annotate 'line', 5847

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 5848
# Body
# {
.annotate 'line', 5850
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5851

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5852
# Body
# {
.annotate 'line', 5854
self.'annotate'(__ARG_1)
.annotate 'line', 5855
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 5856
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 5857
# var init: $P1
getattribute $P1, self, 'init'
concat $S7, 'var ', $S1
concat $S6, $S7, ': '
concat $S5, $S6, $S2
.annotate 'line', 5858
__ARG_1.'comment'($S5)
.annotate 'line', 5859
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
.annotate 'line', 5860
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 5862
isnull $I1, $P1
not $I1
unless $I1 goto __label_4
# {
.annotate 'line', 5863
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 5864
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
.annotate 'line', 5866
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 5871
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 5872
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 5873
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 5876
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 5880
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 5881

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 5828
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 5830
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5886
# Body
# {
.annotate 'line', 5888
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5889
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5890
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5891
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 5892

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5893
# Body
# {
.annotate 'line', 5895
self.'annotate'(__ARG_1)
.annotate 'line', 5896
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5897
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S5, 'var ', $S1
concat $S4, $S5, '[] : '
concat $S3, $S4, $S2
.annotate 'line', 5898
__ARG_1.'comment'($S3)
.annotate 'line', 5899
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 5900

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 5884
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5907
# Body
# {
.annotate 'line', 5909
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5910
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 5911
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5912
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5913
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 5914
$P1 = __ARG_2.'get'()
.annotate 'line', 5915
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 5916
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5917

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 5918
# Body
# {
.annotate 'line', 5920
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 5921
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5922

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5923
# Body
# {
.annotate 'line', 5925
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5926
self.'annotate'(__ARG_1)
.annotate 'line', 5927
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5928
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S6, 'var ', $S2
concat $S5, $S6, '[] : '
concat $S4, $S5, $S3
.annotate 'line', 5929
__ARG_1.'comment'($S4)
.annotate 'line', 5930
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 5931

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 5903
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 5905
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5934
# Body
# {
.annotate 'line', 5936
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5937
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5938
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5939
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5940
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 5941
$P2 = __ARG_2.'get'()
.annotate 'line', 5942
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5943
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 5945
__ARG_2.'unget'($P2)
.annotate 'line', 5946
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
.annotate 'line', 5950
__ARG_2.'unget'($P2)
.annotate 'line', 5951
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 5953

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5961
# Body
# {
box $P1, 'S'
.annotate 'line', 5963
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 5964
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 5965
setattribute self, 't_array', $P2
.annotate 'line', 5966
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5967

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5968
# Body
# {
.annotate 'line', 5970
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 5971

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 5959
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5980
# Body
# {
box $P1, 'I'
.annotate 'line', 5982
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 5983
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 5984
setattribute self, 't_array', $P2
.annotate 'line', 5985
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5986

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5987
# Body
# {
.annotate 'line', 5989
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 5990

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 5978
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5999
# Body
# {
box $P1, 'N'
.annotate 'line', 6001
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6002
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6003
setattribute self, 't_array', $P2
.annotate 'line', 6004
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6005

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6006
# Body
# {
.annotate 'line', 6008
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6009

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 5997
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6023
# Body
# {
.annotate 'line', 6025
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6026
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6027
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6028
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6029
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6030
__ARG_2.'unget'($P1)
.annotate 'line', 6031
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6032
isnull $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6033
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6034
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6036
setattribute self, 'end', $P1
# }
.annotate 'line', 6037

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6038
# Body
# {
.annotate 'line', 6040
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6041
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6042
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6043
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6044
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6045
.return($S2)
# }
.annotate 'line', 6046

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6047
# Body
# {
.annotate 'line', 6049
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6050
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6051
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6052
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6053
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6054
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6055
$P1[$S1] = $S3
.annotate 'line', 6056
.return($S3)
# }
.annotate 'line', 6057

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6058
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6059
# Body
# {
.annotate 'line', 6061
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6062
.return(self)
# }
.annotate 'line', 6063

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6064
# Body
# {
.annotate 'line', 6066
__ARG_1.'comment'('{')
.annotate 'line', 6067
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6068
$P1.'emit'(__ARG_1)
.annotate 'line', 6069
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6071
__ARG_1.'comment'('}')
# }
.annotate 'line', 6072

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6016
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6018
addattribute $P0, 'statements'
.annotate 'line', 6019
addattribute $P0, 'end'
.annotate 'line', 6020
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6085
# Body
# {
box $P3, 1
.annotate 'line', 6088
setattribute self, 'nreg', $P3
.annotate 'line', 6089
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6090
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6091
setattribute self, 'tempreg', $P1
.annotate 'line', 6092
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6093

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6094
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6096
setattribute self, 'type', $P1
.annotate 'line', 6097
.return(self)
# }
.annotate 'line', 6098

.end # settype


.sub 'createreg' :method

.annotate 'line', 6099
# Body
# {
.annotate 'line', 6101
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6102
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6103
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6105
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S3, '$', $S2
concat $S1, $S3, $S1
.annotate 'line', 6107
.return($S1)
# }
.annotate 'line', 6108

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6109
# Body
# {
.annotate 'line', 6111
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6112
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6113
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6114
# string reg: $S1
null $S1
.annotate 'line', 6115
isgt $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 6116
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6118
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6119
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6121
.return($S1)
# }
.annotate 'line', 6122

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6123
# Body
# {
.annotate 'line', 6125
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6126
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6127
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6128
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6129

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6081
addattribute $P0, 'type'
.annotate 'line', 6082
addattribute $P0, 'nreg'
.annotate 'line', 6083
addattribute $P0, 'tempreg'
.annotate 'line', 6084
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6148
# Body
# {
.annotate 'line', 6150
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6151
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6152
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6153
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6154
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6155

.end # init


.sub 'ismethod' :method

.annotate 'line', 6156
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6157
# Body
# {
.annotate 'line', 6159
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6160
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
.annotate 'line', 6162
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6164
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6166
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6168
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6170
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6172
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6173
.return($S1)
# }
.annotate 'line', 6174

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6175
# Body
# {
.annotate 'line', 6177
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6178
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
.annotate 'line', 6180
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6182
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6184
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6186
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6188
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6190
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6191
.return($S1)
# }
.annotate 'line', 6192

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6193
# Body
# {
.annotate 'line', 6195
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
.annotate 'line', 6196
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6197

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6198
# Body
# {
.annotate 'line', 6200
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6201
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6202
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6204
.return($S1)
# }
.annotate 'line', 6205

.end # genlabel


.sub 'optimize' :method

.annotate 'line', 6207
# Body
# {
.annotate 'line', 6209
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6210
.return(self)
# }
.annotate 'line', 6211

.end # optimize


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6213
# Body
# {
.annotate 'line', 6215
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6216
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6217
setattribute self, 'name', $P1
.annotate 'line', 6218
$P1 = __ARG_2.'get'()
.annotate 'line', 6219
$P5 = $P1.'isop'('[')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6220
# var modifiers: $P2
new $P6, [ 'ModifierList' ]
$P6.'ModifierList'(__ARG_2, self)
set $P2, $P6
.annotate 'line', 6221
setattribute self, 'modifiers', $P2
.annotate 'line', 6222
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6224
$P7 = $P1.'isop'('(')
isfalse $I2, $P7
unless $I2 goto __label_1
.annotate 'line', 6225
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6226
root_new $P8, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P8
.annotate 'line', 6227
$P1 = __ARG_2.'get'()
.annotate 'line', 6228
$P8 = $P1.'isop'(')')
isfalse $I2, $P8
unless $I2 goto __label_2
# {
.annotate 'line', 6229
__ARG_2.'unget'($P1)
.annotate 'line', 6230
# int argnum: $I1
null $I1
__label_3: # do
.annotate 'line', 6231
# {
.annotate 'line', 6232
$P1 = __ARG_2.'get'()
.annotate 'line', 6233
# string type: $S1
$P10 = $P1.'checkkeyword'()
$P9 = 'typetoregcheck'($P10)
null $S1
if_null $P9, __label_6
set $S1, $P9
__label_6:
.annotate 'line', 6234
isne $I3, $S1, ''
unless $I3 goto __label_7
.annotate 'line', 6235
$P1 = __ARG_2.'get'()
goto __label_8
__label_7: # else
set $S1, 'P'
__label_8: # endif
.annotate 'line', 6238
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S2, '__ARG_', $S4
.annotate 'line', 6239
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6241
# string varname: $S3
set $P10, $P1
null $S3
if_null $P10, __label_9
set $S3, $P10
__label_9:
.annotate 'line', 6242
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 6243
$P3['name'] = $S3
.annotate 'line', 6244
$P1 = __ARG_2.'get'()
.annotate 'line', 6245
$P11 = $P1.'isop'('[')
if_null $P11, __label_10
unless $P11 goto __label_10
# {
.annotate 'line', 6246
# var modifiers: $P4
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_2, self)
set $P4, $P12
.annotate 'line', 6247
$P3['modifiers'] = $P4
.annotate 'line', 6248
$P1 = __ARG_2.'get'()
# }
__label_10: # endif
.annotate 'line', 6250
getattribute $P11, self, 'args'
$P11.'push'($P3)
# }
.annotate 'line', 6251
$P12 = $P1.'isop'(',')
if_null $P12, __label_4
if $P12 goto __label_3
__label_4: # enddo
.annotate 'line', 6252
$P13 = $P1.'isop'(')')
isfalse $I3, $P13
unless $I3 goto __label_11
.annotate 'line', 6253
'SyntaxError'("Expected ')'", $P1)
__label_11: # endif
# }
__label_2: # endif
.annotate 'line', 6256
$P1 = __ARG_2.'get'()
.annotate 'line', 6257
$P13 = $P1.'isop'('{')
isfalse $I4, $P13
unless $I4 goto __label_12
.annotate 'line', 6258
'Expected'('{', $P1)
__label_12: # endif
.annotate 'line', 6259
new $P16, [ 'CompoundStatement' ]
$P16.'CompoundStatement'($P1, __ARG_2, self)
set $P15, $P16
setattribute self, 'body', $P15
.annotate 'line', 6260
.return(self)
# }
.annotate 'line', 6261

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6262
# Body
# {
.annotate 'line', 6264
# string name: $S1
getattribute $P14, self, 'name'
null $S1
if_null $P14, __label_0
set $S1, $P14
__label_0:
.annotate 'line', 6265
__ARG_1.'say'()
.annotate 'line', 6266
__ARG_1.'print'(".sub '", $S1, "'")
.annotate 'line', 6269
$P14 = self.'ismethod'()
if_null $P14, __label_1
unless $P14 goto __label_1
.annotate 'line', 6270
__ARG_1.'print'(' :method')
__label_1: # endif
.annotate 'line', 6271
# var modifiers: $P1
getattribute $P1, self, 'modifiers'
.annotate 'line', 6272
isnull $I4, $P1
not $I4
unless $I4 goto __label_2
# {
.annotate 'line', 6273
# var mlist: $P2
$P2 = $P1.'getlist'()
.annotate 'line', 6274
iter $P15, $P2
set $P15, 0
__label_4: # for iteration
unless $P15 goto __label_5
shift $P3, $P15
# {
.annotate 'line', 6275
# int nargmods: $I1
$P16 = $P3.'numargs'()
set $I1, $P16
.annotate 'line', 6276
$P16 = $P3.'getname'()
__ARG_1.'print'(' :', $P16)
.annotate 'line', 6277
isgt $I4, $I1, 0
unless $I4 goto __label_6
# {
.annotate 'line', 6278
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6279
# int iargmod: $I2
null $I2
goto __label_9
__label_7: # for iteration
inc $I2
__label_9: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_8 # for end
# {
.annotate 'line', 6280
# var argmod: $P4
$P4 = $P3.'getarg'($I2)
.annotate 'line', 6281
$P17 = $P4.'isstringliteral'()
isfalse $I5, $P17
unless $I5 goto __label_10
.annotate 'line', 6282
getattribute $P18, $P4, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_10: # endif
.annotate 'line', 6283
$P17 = $P4.'getPirString'()
__ARG_1.'print'($P17)
# }
goto __label_7 # for iteration
__label_8: # for end
.annotate 'line', 6285
__ARG_1.'print'(')')
# }
__label_6: # endif
# }
goto __label_4
__label_5: # endfor
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 6290
iseq $I6, $S1, 'main'
unless $I6 goto __label_11
.annotate 'line', 6291
__ARG_1.'print'(' :main')
__label_11: # endif
# }
__label_3: # endif
.annotate 'line', 6293
__ARG_1.'say'()
.annotate 'line', 6295
# var args: $P5
getattribute $P5, self, 'args'
.annotate 'line', 6296
# var arg: $P6
null $P6
.annotate 'line', 6297
# string argname: $S2
null $S2
.annotate 'line', 6298
# var a: $P7
null $P7
.annotate 'line', 6299
iter $P19, $P5
set $P19, 0
__label_12: # for iteration
unless $P19 goto __label_13
shift $P6, $P19
# {
.annotate 'line', 6300
$S2 = $P6['name']
.annotate 'line', 6301
$P7 = self.'getvar'($S2)
.annotate 'line', 6302
# string ptype: $S3
$P20 = $P7['type']
$P18 = 'typetopirname'($P20)
null $S3
if_null $P18, __label_14
set $S3, $P18
__label_14:
$P20 = $P7['reg']
.annotate 'line', 6303
__ARG_1.'print'('.param ', $S3, ' ', $P20)
.annotate 'line', 6304
# var modarg: $P8
$P8 = $P6['modifiers']
.annotate 'line', 6305
isnull $I6, $P8
not $I6
unless $I6 goto __label_15
# {
.annotate 'line', 6306
# var named: $P9
null $P9
.annotate 'line', 6307
# var slurpy: $P10
null $P10
.annotate 'line', 6308
# var modarglist: $P11
$P11 = $P8.'getlist'()
.annotate 'line', 6309
iter $P21, $P11
set $P21, 0
__label_16: # for iteration
unless $P21 goto __label_17
shift $P12, $P21
# {
.annotate 'line', 6310
# string modname: $S4
$P22 = $P12.'getname'()
null $S4
if_null $P22, __label_18
set $S4, $P22
__label_18:
set $S6, $S4
set $S7, 'named'
.annotate 'line', 6311
if $S6 == $S7 goto __label_21
set $S7, 'slurpy'
if $S6 == $S7 goto __label_22
goto __label_20
# switch
__label_21: # case
set $P9, $P12
goto __label_19 # break
__label_22: # case
set $P10, $P12
goto __label_19 # break
__label_20: # default
.annotate 'line', 6319
__ARG_1.'print'(' :', $S4)
__label_19: # switch end
# }
goto __label_16
__label_17: # endfor
.annotate 'line', 6322
isnull $I7, $P9
not $I7
unless $I7 goto __label_25
isnull $I7, $P10
not $I7
__label_25:
unless $I7 goto __label_23
# {
.annotate 'line', 6327
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_24
__label_23: # else
# {
.annotate 'line', 6330
isnull $I7, $P9
not $I7
unless $I7 goto __label_26
# {
.annotate 'line', 6331
# string setname: $S5
null $S5
.annotate 'line', 6332
# int nargs: $I3
$P22 = $P9.'numargs'()
set $I3, $P22
set $I8, $I3
null $I9
.annotate 'line', 6333
if $I8 == $I9 goto __label_30
set $I9, 1
if $I8 == $I9 goto __label_31
goto __label_29
# switch
__label_30: # case
concat $S6, "'", $S2
concat $S5, $S6, "'"
goto __label_28 # break
__label_31: # case
.annotate 'line', 6338
# var argmod: $P13
$P13 = $P9.'getarg'(0)
.annotate 'line', 6339
$P23 = $P13.'isstringliteral'()
isfalse $I10, $P23
unless $I10 goto __label_32
.annotate 'line', 6340
getattribute $P24, self, 'start'
'SyntaxError'('Invalid modifier', $P24)
__label_32: # endif
.annotate 'line', 6341
$P25 = $P13.'getPirString'()
set $S5, $P25
goto __label_28 # break
__label_29: # default
.annotate 'line', 6344
getattribute $P26, self, 'start'
'SyntaxError'('Invalid modifier', $P26)
__label_28: # switch end
.annotate 'line', 6346
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_27
__label_26: # else
.annotate 'line', 6348
isnull $I8, $P10
not $I8
unless $I8 goto __label_33
# {
.annotate 'line', 6349
__ARG_1.'print'(" :slurpy")
# }
__label_33: # endif
__label_27: # endif
# }
__label_24: # endif
# }
__label_15: # endif
.annotate 'line', 6353
__ARG_1.'say'('')
# }
goto __label_12
__label_13: # endfor
.annotate 'line', 6355
__ARG_1.'say'()
.annotate 'line', 6356
getattribute $P23, self, 'name'
__ARG_1.'annotate'($P23)
.annotate 'line', 6357
__ARG_1.'comment'('Body')
.annotate 'line', 6358
getattribute $P24, self, 'body'
$P24.'emit'(__ARG_1)
.annotate 'line', 6360
getattribute $P26, self, 'body'
$P25 = $P26.'getend'()
__ARG_1.'annotate'($P25)
.annotate 'line', 6361
__ARG_1.'say'("\n.end # ", $S1, "\n")
# }
.annotate 'line', 6362

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6363
# Body
# {
.annotate 'line', 6365
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6366

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6367
# Body
# {
.annotate 'line', 6369
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6370

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6136
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6138
addattribute $P0, 'name'
.annotate 'line', 6139
addattribute $P0, 'modifiers'
.annotate 'line', 6140
addattribute $P0, 'args'
.annotate 'line', 6141
addattribute $P0, 'body'
.annotate 'line', 6142
addattribute $P0, 'regstI'
.annotate 'line', 6143
addattribute $P0, 'regstN'
.annotate 'line', 6144
addattribute $P0, 'regstS'
.annotate 'line', 6145
addattribute $P0, 'regstP'
.annotate 'line', 6146
addattribute $P0, 'nlabel'
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 6379
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 6377
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

.annotate 'line', 6395
# Body
# {
.annotate 'line', 6397
setattribute self, 'owner', __ARG_1
.annotate 'line', 6398
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 6399

.end # ClassBase


.sub 'reftype' :method

.annotate 'line', 6400
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 6402
# Body
# {
.annotate 'line', 6404
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 6405

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassBase' ]
.annotate 'line', 6393
addattribute $P0, 'owner'
.annotate 'line', 6394
addattribute $P0, 'start'
.end
.namespace [ 'ClassBaseStr' ]

.sub 'ClassBaseStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6411
# Body
# {
.annotate 'line', 6413
self.'ClassBase'(__ARG_1, __ARG_2)
.annotate 'line', 6414
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 6415

.end # ClassBaseStr


.sub 'reftype' :method

.annotate 'line', 6416
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6418
# Body
# {
.annotate 'line', 6420
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6421
__ARG_1.'print'($S1)
# }
.annotate 'line', 6422

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassBaseStr' ]
.annotate 'line', 6408
get_class $P1, [ 'ClassBase' ]
addparent $P0, $P1
.annotate 'line', 6410
addattribute $P0, 'name'
.end
.namespace [ 'ClassBaseParrotKey' ]

.sub 'ClassBaseParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6428
# Body
# {
.annotate 'line', 6430
self.'ClassBase'(__ARG_2, __ARG_3)
.annotate 'line', 6431
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 6432
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 6433
# {
.annotate 'line', 6434
$P2 = __ARG_1.'get'()
.annotate 'line', 6435
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_3
.annotate 'line', 6436
'SyntaxError'('literal string expected', $P2)
__label_3: # endif
.annotate 'line', 6437
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
# }
.annotate 'line', 6438
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'(',')
if_null $P5, __label_1
if $P5 goto __label_0
__label_1: # enddo
.annotate 'line', 6439
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_4
.annotate 'line', 6440
'SyntaxError'("Expected ']'", $P2)
__label_4: # endif
.annotate 'line', 6441
setattribute self, 'key', $P1
# }
.annotate 'line', 6442

.end # ClassBaseParrotKey


.sub 'reftype' :method

.annotate 'line', 6443
# Body
# {
.return(2)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6445
# Body
# {
.annotate 'line', 6447
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 6448

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassBaseParrotKey' ]
.annotate 'line', 6425
get_class $P1, [ 'ClassBase' ]
addparent $P0, $P1
.annotate 'line', 6427
addattribute $P0, 'key'
.end
.namespace [ 'ClassBaseId' ]

.sub 'ClassBaseId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6454
# Body
# {
.annotate 'line', 6456
self.'ClassBase'(__ARG_2, __ARG_3)
.annotate 'line', 6457
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
$S1 = __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 6458
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6459
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 6460
$P2 = __ARG_1.'get'()
# predefined string
.annotate 'line', 6461
$S1 = $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6463
__ARG_1.'unget'($P2)
.annotate 'line', 6464
setattribute self, 'key', $P1
# }
.annotate 'line', 6465

.end # ClassBaseId


.sub 'reftype' :method

.annotate 'line', 6466
# Body
# {
.return(3)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6468
# Body
# {
.annotate 'line', 6470
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 6471
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6472
getattribute $P2, self, 'key'
# predefined join
join $S3, ".", $P2
concat $S2, "class ", $S3
concat $S1, $S2, " not found at compile time"
'Warn'($S1)
.annotate 'line', 6473
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6475
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 6476

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassBaseId' ]
.annotate 'line', 6451
get_class $P1, [ 'ClassBase' ]
addparent $P0, $P1
.annotate 'line', 6453
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassBase'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6479
# Body
# {
.annotate 'line', 6481
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6482
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6483
new $P4, [ 'ClassBaseStr' ]
$P4.'ClassBaseStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 6484
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 6485
new $P4, [ 'ClassBaseParrotKey' ]
$P4.'ClassBaseParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 6486
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 6487
new $P7, [ 'ClassBaseId' ]
$P7.'ClassBaseId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 6488
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 6489

.end # parseClassBase

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6506
# Body
# {
.annotate 'line', 6508
setattribute self, 'parent', __ARG_2
.annotate 'line', 6509
setattribute self, 'owner', __ARG_2
.annotate 'line', 6510
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 6511
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 6512
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 6513
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 6515
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6516
setattribute self, 'name', $P1
.annotate 'line', 6517
$P1 = __ARG_1.'get'()
.annotate 'line', 6518
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 6519
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 6520
# {
.annotate 'line', 6521
# var base: $P3
$P3 = 'parseClassBase'(__ARG_1, self)
.annotate 'line', 6522
$P2.'push'($P3)
.annotate 'line', 6523
$P1 = __ARG_1.'get'()
.annotate 'line', 6524
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
.annotate 'line', 6527
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 6528
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 6529
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 6530
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 6531
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 6532
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 6533
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 6534
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6536
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 6537
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 6538
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 6539
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 6540
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 6541
$P1 = __ARG_1.'get'()
.annotate 'line', 6542
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 6543
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 6545
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 6546
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6547
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 6548
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6551
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 6552
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 6554
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 6555
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 6556
setattribute self, 'classns', $P9
# }
.annotate 'line', 6557

.end # ClassStatement


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6558
# Body
# {
.annotate 'line', 6560
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 6561

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6562
# Body
# {
.annotate 'line', 6564
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6565

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 6566
# Body
# {
.annotate 'line', 6568
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 6569
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 6570
.return(self)
# }
.annotate 'line', 6571

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 6572
# Body
# {
.annotate 'line', 6574
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 6575

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6576
# Body
# {
.annotate 'line', 6578
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 6579
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 6580
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 6581
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6583
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 6585
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 6586
# int n: $I1
set $I1, 1
.annotate 'line', 6587
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 6588
$P3.'annotate'(__ARG_1)
.annotate 'line', 6589
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 6590
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 6591
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 6592
__ARG_1.'say'()
.annotate 'line', 6593
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 6595
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 6596
__ARG_1.'annotate'($P4)
.annotate 'line', 6597
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 6600
__ARG_1.'say'('.end')
# }
.annotate 'line', 6601

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 6495
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 6497
addattribute $P0, 'parent'
.annotate 'line', 6498
addattribute $P0, 'owner'
.annotate 'line', 6499
addattribute $P0, 'name'
.annotate 'line', 6500
addattribute $P0, 'bases'
.annotate 'line', 6501
addattribute $P0, 'constants'
.annotate 'line', 6502
addattribute $P0, 'functions'
.annotate 'line', 6503
addattribute $P0, 'members'
.annotate 'line', 6504
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6608
# Body
# {
.annotate 'line', 6610
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6611
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 6612
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 6613
'ExpectOp'(';', __ARG_2)
.annotate 'line', 6614
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 6615
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 6620
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 6621
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 6622
# var file: $P5
new $P5, ['FileHandle']
.annotate 'line', 6623
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 6624
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 6625
# try: create handler
new $P11, 'ExceptionHandler'
set_addr $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 6626
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 6627
# }
# try: end
goto __label_5
.annotate 'line', 6625
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
.annotate 'line', 6632
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 6633
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 6638
load_bytecode 'PGE.pbc'
.annotate 'line', 6639
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 6640
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 6642
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
.annotate 'line', 6643
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6644
$P8 = $P7($S4)
.annotate 'line', 6645
# predefined elements
elements $I4, $P8
isgt $I3, $I4, 0
unless $I3 goto __label_11
# {
.annotate 'line', 6646
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 6647
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 6648
# int ivalue: $I1
null $I1
.annotate 'line', 6649
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6650
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 6655
$P16 = 'newTokenFrom'(5, $S5, __ARG_1)
.annotate 'line', 6654
$P15 = 'integerValue'(__ARG_3, $P16, $I1)
.annotate 'line', 6653
__ARG_3.'createconst'($S5, 'I', $P15, '')
# }
__label_11: # endif
# }
goto __label_7 # for iteration
__label_8: # for end
.annotate 'line', 6659
$P5.'close'()
# }
.annotate 'line', 6660

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 6672
# Body
# {
.annotate 'line', 6674
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 6675
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 6676
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 6677
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 6678

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 6679
# Body
# {
.annotate 'line', 6681
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 6682
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 6683
getattribute $P4, $P2, 'name'
$S1 = $P4
iseq $I1, $S1, __ARG_1
unless $I1 goto __label_2
.annotate 'line', 6684
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 6685
.return($P4)
# }
.annotate 'line', 6686

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 6687
# Body
# {
# predefined elements
.annotate 'line', 6691
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 6693
.return($P5)
__label_3: # case
.annotate 'line', 6696
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 6701
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 6702
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 6703
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 6704
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 6705
getattribute $P9, $P3, 'name'
$S2 = $P9
iseq $I3, $S2, $S1
unless $I3 goto __label_7
# {
.annotate 'line', 6707
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 6708
isnull $I1, $P4
not $I1
unless $I1 goto __label_8
.annotate 'line', 6709
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 6713
.return($P5)
# }
.annotate 'line', 6714

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 6715
# Body
# {
.annotate 'line', 6717
# int balance1: $I1
null $I1
.annotate 'line', 6718
# int balance2: $I2
null $I2
.annotate 'line', 6719
# int balance3: $I3
null $I3
.annotate 'line', 6720
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6721
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 6723
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 6725
# var start: $P2
set $P2, $P1
.annotate 'line', 6726
$P1 = __ARG_1.'get'()
.annotate 'line', 6727
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 6728
$P1 = __ARG_1.'get'()
.annotate 'line', 6730
# var modifier: $P3
null $P3
.annotate 'line', 6731
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 6732
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 6733
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 6736
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 6737
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 6738
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 6739
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 6740
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 6741
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 6743
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 6744
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6745
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6747
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 6748
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 6749
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 6750
$P7.'push'($P6)
.annotate 'line', 6751
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 6753
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 6754
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 6755
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 6756
$P9.'push'($P8)
.annotate 'line', 6757
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 6759
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 6760
$P1 = __ARG_1.'get'()
.annotate 'line', 6761
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 6762
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 6763
$P1 = __ARG_1.'get'()
.annotate 'line', 6764
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 6765
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 6766
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 6767
self.'addlib'($S2)
.annotate 'line', 6768
$P1 = __ARG_1.'get'()
.annotate 'line', 6769
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6771
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 6772
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6774
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 6775
$P1 = __ARG_1.'get'()
.annotate 'line', 6776
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 6777
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 6778
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 6779
self.'addload'($S3)
.annotate 'line', 6780
$P1 = __ARG_1.'get'()
.annotate 'line', 6781
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 6783
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 6784
self.'close_ns'($P1)
.annotate 'line', 6785
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 6788
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
.annotate 'line', 6790
self.'unclosed_ns'()
# }
.annotate 'line', 6791

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 6792
# Body
# {
.annotate 'line', 6794
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 6795

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 6796
# Body
# {
.annotate 'line', 6798
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 6799
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6801
# int activate: $I1
set $I1, 1
.annotate 'line', 6802
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 6803
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 6804
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 6807
unless $I1 goto __label_6
# {
.annotate 'line', 6808
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 6809
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 6811
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 6813

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 6664
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 6666
addattribute $P0, 'namespaces'
.annotate 'line', 6667
addattribute $P0, 'classes'
.annotate 'line', 6668
addattribute $P0, 'functions'
.annotate 'line', 6669
addattribute $P0, 'items'
.annotate 'line', 6670
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 6828
# Body
# {
.annotate 'line', 6831
setattribute self, 'parent', __ARG_1
.annotate 'line', 6832
setattribute self, 'start', __ARG_2
.annotate 'line', 6833
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 6834
setattribute self, 'name', $P2
.annotate 'line', 6835
setattribute self, 'modifier', __ARG_4
.annotate 'line', 6836
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 6837
$P3 = __ARG_4.'pick'('HLL')
isnull $I2, $P3
not $I2
unless $I2 goto __label_1
.annotate 'line', 6838
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6840

.end # NamespaceStatement


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6841
# Body
# {
.annotate 'line', 6843
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6844

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 6845
# Body
# {
.annotate 'line', 6847
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 6848
getattribute $P2, self, 'hll'
isnull $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6849
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 6850
.return($P1)
# }
.annotate 'line', 6851

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6852
# Body
# {
.annotate 'line', 6854
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 6855

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6856
# Body
# {
.annotate 'line', 6858
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 6859

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6860
# Body
# {
.annotate 'line', 6862
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 6863
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6864
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 6866
.return($P1)
__label_1: # endif
# }
.annotate 'line', 6867

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 6868
# Body
# {
.annotate 'line', 6872
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 6873
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6874
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 6875
.return($P1)
# }
.annotate 'line', 6876

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 6877
# Body
# {
.annotate 'line', 6879
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 6880

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 6881
# Body
# {
# }
.annotate 'line', 6884

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 6885
# Body
# {
.annotate 'line', 6887
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 6888
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 6889
$P1 = $P1.'optimize'()
.annotate 'line', 6890
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 6892
self.'optimize_base'()
.annotate 'line', 6893
.return(self)
# }
.annotate 'line', 6894

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6895
# Body
# {
.annotate 'line', 6897
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 6898
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 6899
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 6901
self.'emit_base'(__ARG_1)
.annotate 'line', 6903
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 6904
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 6905

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 6820
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 6822
addattribute $P0, 'parent'
.annotate 'line', 6823
addattribute $P0, 'start'
.annotate 'line', 6824
addattribute $P0, 'name'
.annotate 'line', 6825
addattribute $P0, 'modifier'
.annotate 'line', 6826
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 6918
# Body
# {
.annotate 'line', 6920
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
# }
.annotate 'line', 6921

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6922
# Body
# {
.annotate 'line', 6924
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 6925
$P1[__ARG_1] = 1
# }
.annotate 'line', 6926

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 6927
# Body
# {
.annotate 'line', 6929
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 6930
isnull $I2, $P2
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 6931

.end # predef_is_used


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6933
# Body
# {
.annotate 'line', 6935
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 6936
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6937
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6938
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 6940
$P1[__ARG_1] = 1
# }
.annotate 'line', 6941

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 6942
# Body
# {
.annotate 'line', 6944
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 6945
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6946
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6947
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 6949
$P1[__ARG_1] = 1
# }
.annotate 'line', 6950

.end # addload


.sub 'getpath' :method

.annotate 'line', 6951
# Body
# {
.annotate 'line', 6953
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6954
.return($P1)
# }
.annotate 'line', 6955

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6956
# Body
# {
.annotate 'line', 6958
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 6959

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 6960
# Body
# {
.annotate 'line', 6963
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 6964

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 6965
# Body
# {
# }
.annotate 'line', 6968

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 6969
# Body
# {
.annotate 'line', 6971
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 6972

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 6973
# Body
# {
.annotate 'line', 6975
self.'optimize_base'()
.annotate 'line', 6976
.return(self)
# }
.annotate 'line', 6977

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6978
# Body
# {
.annotate 'line', 6980
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 6983
$P5 = $P1['chomp']
isnull $I3, $P5
not $I3
unless $I3 goto __label_0
.annotate 'line', 6984
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 6987
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
.annotate 'line', 6990
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 6991
$P5 = $P1[$S1]
isnull $I3, $P5
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 6992
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 6993
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 6996
# int somelib: $I1
null $I1
.annotate 'line', 6997
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 6998
isnull $I4, $P3
not $I4
unless $I4 goto __label_4
# {
set $I1, 1
.annotate 'line', 7000
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7001
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7004
# int someload: $I2
null $I2
.annotate 'line', 7005
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7006
isnull $I4, $P4
not $I4
unless $I4 goto __label_7
# {
set $I2, 1
.annotate 'line', 7008
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7009
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7010
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7011
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I6, $I1
set $I7, $I2
.annotate 'line', 7013
or $I5, $I6, $I7
unless $I5 goto __label_10
.annotate 'line', 7014
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7016
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7017

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 6912
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 6914
addattribute $P0, 'predefs_used'
.annotate 'line', 6915
addattribute $P0, 'libs'
.annotate 'line', 6916
addattribute $P0, 'loads'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7029
# Body
# {
.annotate 'line', 7031
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7034
# var taux: $P2
$P2 = 'newToken'(4, 'predefconst', 0, '__predefconst__')
.annotate 'line', 7038
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7037
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7036
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7042
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7041
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 7040
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 7048
new $P6, [ 'StringLiteral' ]
# predefined int
.annotate 'line', 7049
$I2 = "2"
add $I1, $I2, 1
# predefined string
$S1 = $I1
$P7 = 'newTokenFrom'(2, $S1, $P2)
$P6.'StringLiteral'($P1, $P7)
set $P5, $P6
.annotate 'line', 7047
$P1.'createconst'('__STAGE__', 'S', $P5, '')
.annotate 'line', 7052
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7053

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7054
# Body
# {
.annotate 'line', 7056
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7057

.end # parse


.sub 'optimize' :method

.annotate 'line', 7058
# Body
# {
.annotate 'line', 7060
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7061

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7062
# Body
# {
.annotate 'line', 7064
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7065
__ARG_1.'say'('')
.annotate 'line', 7067
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7069
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7070

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7028
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7077
# Body
# {
.annotate 'line', 7079
# var handlein: $P1
new $P1, ['StringHandle']
.annotate 'line', 7081
$P1.'open'('__eval__', 'w')
.annotate 'line', 7082
$P1.'puts'(__ARG_1)
.annotate 'line', 7083
$P1.'close'()
.annotate 'line', 7084
$P1.'open'('__eval__', 'r')
.annotate 'line', 7085
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7086
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7087
$P3.'parse'($P2)
.annotate 'line', 7088
$P1.'close'()
.annotate 'line', 7089
$P3.'optimize'()
.annotate 'line', 7090
# var handleout: $P4
new $P4, ['StringHandle']
.annotate 'line', 7091
$P4.'open'('__eval__', 'w')
.annotate 'line', 7092
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7093
$P5.'initialize'($P4)
.annotate 'line', 7094
$P3.'emit'($P5)
.annotate 'line', 7095
$P5.'close'()
.annotate 'line', 7096
$P4.'close'()
.annotate 'line', 7097
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7098
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7099
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7100
.return($P7)
# }
.annotate 'line', 7101

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7102
# Body
# {
.annotate 'line', 7104
# var handlein: $P1
new $P1, ['FileHandle']
.annotate 'line', 7105
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7106
$P1.'encoding'('utf8')
.annotate 'line', 7107
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7108
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7109
$P3.'parse'($P2)
.annotate 'line', 7110
$P1.'close'()
.annotate 'line', 7111
$P3.'optimize'()
.annotate 'line', 7112
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7113
$P4.'initialize'(__ARG_2)
.annotate 'line', 7114
$P3.'emit'($P4)
.annotate 'line', 7115
$P4.'close'()
# }
.annotate 'line', 7116

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7117
# Body
# {
.annotate 'line', 7119
# var handlein: $P1
new $P1, ['FileHandle']
.annotate 'line', 7120
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7121
$P1.'encoding'('utf8')
.annotate 'line', 7122
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7123
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7124
$P3.'parse'($P2)
.annotate 'line', 7125
$P1.'close'()
.annotate 'line', 7126
$P3.'optimize'()
.annotate 'line', 7127
# var handleout: $P4
new $P4, ['StringHandle']
.annotate 'line', 7128
$P4.'open'('__eval__', 'w')
.annotate 'line', 7129
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7130
$P5.'initialize'($P4)
.annotate 'line', 7131
$P3.'emit'($P5)
.annotate 'line', 7132
$P5.'close'()
.annotate 'line', 7133
$P4.'close'()
.annotate 'line', 7134
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7135
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7136
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7137
.return($P7)
# }
.annotate 'line', 7138

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7143
# Body
# {
.annotate 'line', 7145
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7146
$P1.'parse'(__ARG_1)
.annotate 'line', 7148
$P1.'optimize'()
.annotate 'line', 7150
# var handle: $P2
null $P2
.annotate 'line', 7151
iseq $I1, __ARG_2, '-'
unless $I1 goto __label_0
.annotate 'line', 7152
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 7154
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7155
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 7156
$P3.'initialize'($P2)
.annotate 'line', 7157
$P1.'emit'($P3)
.annotate 'line', 7158
$P3.'close'()
.annotate 'line', 7159
$P2.'close'()
# }
.annotate 'line', 7160

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7166
# Body
# {
.annotate 'line', 7168
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7169
compreg 'winxed', $P1
# }
.annotate 'line', 7170

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7172
# Body
# {
.annotate 'line', 7174
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7175
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 7176
$P1.'notOptStop'(1)
.annotate 'line', 7177
$P1.'push_string'('o=s')
.annotate 'line', 7178
$P1.'push_string'('e=s')
.annotate 'line', 7179
$P1.'push_string'('c')
.annotate 'line', 7180
$P1.'push_string'('noan')
.annotate 'line', 7182
__ARG_1.'shift'()
.annotate 'line', 7183
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7184
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7185
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7186
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7187
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7189
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7190
# string filename: $S1
null $S1
.annotate 'line', 7191
# string expr: $S2
null $S2
.annotate 'line', 7192
# var file: $P7
null $P7
.annotate 'line', 7193
isnull $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 7194
iseq $I3, $I1, 0
unless $I3 goto __label_2
# predefined Error
.annotate 'line', 7195
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7197
$S1 = __ARG_1[0]
.annotate 'line', 7198
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7199
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S4, 'function main[main](argv){', $S2
concat $S2, $S4, ';}'
.annotate 'line', 7204
new $P7, ['StringHandle']
.annotate 'line', 7205
$P7.'open'('__eval__', 'w')
.annotate 'line', 7206
$P7.'puts'($S2)
.annotate 'line', 7207
$P7.'close'()
.annotate 'line', 7208
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7211
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7213
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7214
isnull $I2, $P3
not $I2
unless $I2 goto __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7216
'winxed_parser'($P8, $S3)
.annotate 'line', 7218
$P7.'close'()
# }
.annotate 'line', 7219

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7221
# Body
# {
.annotate 'line', 7223
# try: create handler
new $P6, 'ExceptionHandler'
set_addr $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7229
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7223
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7232
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7233
print 'Error: '
say $S1
.annotate 'line', 7234
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7235
# int i: $I1
set $I1, 1
.annotate 'line', 7236
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7237
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7238
# string subname: $S2
null $S2
.annotate 'line', 7239
isnull $I3, $P4
not $I3
unless $I3 goto __label_4
# {
set $S2, $P4
.annotate 'line', 7241
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7242
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
.annotate 'line', 7244
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7245
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7246
isne $I4, $S4, ''
unless $I4 goto __label_8
# {
.annotate 'line', 7247
# int line: $I2
$I2 = $P5['line']
set $I5, $I1
.annotate 'line', 7248
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
.annotate 'line', 7252

.end # main

# End generated code
