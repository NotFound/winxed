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
.annotate 'line', 464
root_new $P11, ['parrot';'Hash']
$P11[''] = $P2
$P11['='] = $P2
$P10['='] = $P11
$P10[':'] = $P2
$P1['='] = $P10
.annotate 'line', 467
root_new $P12, ['parrot';'Hash']
$P12['+'] = $P2
$P12['='] = $P2
$P1['+'] = $P12
.annotate 'line', 468
root_new $P13, ['parrot';'Hash']
$P13['-'] = $P2
$P13['='] = $P2
$P1['-'] = $P13
.annotate 'line', 469
root_new $P14, ['parrot';'Hash']
$P14['='] = $P2
$P1['*'] = $P14
.annotate 'line', 470
root_new $P15, ['parrot';'Hash']
$P15['|'] = $P2
$P1['|'] = $P15
.annotate 'line', 471
root_new $P16, ['parrot';'Hash']
$P16['&'] = $P2
$P1['&'] = $P16
.annotate 'line', 472
root_new $P17, ['parrot';'Hash']
.annotate 'line', 473
root_new $P18, ['parrot';'Hash']
$P18[''] = $P2
get_hll_global $P19, 'getheredoc'
$P18[':'] = $P19
$P17['<'] = $P18
$P17['='] = $P2
$P1['<'] = $P17
.annotate 'line', 476
root_new $P20, ['parrot';'Hash']
$P20['>'] = $P2
$P20['='] = $P2
$P1['>'] = $P20
.annotate 'line', 477
root_new $P21, ['parrot';'Hash']
.annotate 'line', 478
root_new $P22, ['parrot';'Hash']
$P22[''] = $P2
$P22['='] = $P2
$P21['='] = $P22
$P1['!'] = $P21
.annotate 'line', 480
root_new $P23, ['parrot';'Hash']
$P23['%'] = $P2
$P1['%'] = $P23
.annotate 'line', 481
root_new $P24, ['parrot';'Hash']
$P24['='] = $P2
get_hll_global $P25, 'getlinecomment'
$P24['/'] = $P25
get_hll_global $P26, 'getcomment'
$P24['*'] = $P26
$P1['/'] = $P24
get_hll_global $P27, 'getlinecomment'
$P1['#'] = $P27
.annotate 'line', 484
setattribute self, 'select', $P1
# }
.annotate 'line', 485

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 486
# Body
# {
.annotate 'line', 488
# string pending: $S1
getattribute $P2, self, 'pending'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 489
isne $I2, $S1, ''
unless $I2 goto __label_1
# {
box $P2, ''
.annotate 'line', 490
setattribute self, 'pending', $P2
.annotate 'line', 491
.return($S1)
# }
__label_1: # endif
.annotate 'line', 493
# var h: $P1
getattribute $P1, self, 'h'
.annotate 'line', 494
# string c: $S2
$P3 = $P1.'read'(1)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 495
iseq $I2, $S2, "\n"
unless $I2 goto __label_3
# {
.annotate 'line', 496
# int l: $I1
getattribute $P3, self, 'line'
set $I1, $P3
.annotate 'line', 497
inc $I1
box $P4, $I1
.annotate 'line', 498
setattribute self, 'line', $P4
# }
__label_3: # endif
.annotate 'line', 500
.return($S2)
# }
.annotate 'line', 501

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 502
# Body
# {
box $P1, __ARG_1
.annotate 'line', 504
setattribute self, 'pending', $P1
# }
.annotate 'line', 505

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 506
# Body
# {
.annotate 'line', 508
.const 'Sub' $P5 = 'isspace'
.annotate 'line', 509
.const 'Sub' $P6 = 'isidentstart'
.annotate 'line', 510
.const 'Sub' $P7 = 'isdigit'
.annotate 'line', 511
.const 'Sub' $P8 = 'getop'
.annotate 'line', 512
.const 'Sub' $P9 = 'getident'
.annotate 'line', 513
.const 'Sub' $P10 = 'getnumber'
.annotate 'line', 515
getattribute $P11, self, 'stacked'
if_null $P11, __label_0
unless $P11 goto __label_0
# {
.annotate 'line', 516
# var t: $P1
getattribute $P12, self, 'stacked'
$P1 = $P12.'pop'()
.annotate 'line', 517
.return($P1)
# }
__label_0: # endif
.annotate 'line', 519
# string c: $S1
$P11 = self.'getchar'()
null $S1
if_null $P11, __label_1
set $S1, $P11
__label_1:
__label_3: # while
.annotate 'line', 520
$P12 = $P5($S1)
if_null $P12, __label_2
unless $P12 goto __label_2
.annotate 'line', 521
$P13 = self.'getchar'()
set $S1, $P13
goto __label_3
__label_2: # endwhile
.annotate 'line', 522
# int line: $I1
getattribute $P13, self, 'line'
set $I1, $P13
.annotate 'line', 523
iseq $I2, $S1, ''
unless $I2 goto __label_4
# {
.annotate 'line', 524
# var t: $P2
new $P2, [ 'Token' ]
box $P14, -1
.annotate 'line', 525
setattribute $P2, 'type', $P14
.annotate 'line', 526
.return($P2)
# }
__label_4: # endif
.annotate 'line', 528
$P14 = $P6($S1)
if_null $P14, __label_5
unless $P14 goto __label_5
.annotate 'line', 529
.tailcall $P9(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 530
$P15 = $P7($S1)
if_null $P15, __label_6
unless $P15 goto __label_6
.annotate 'line', 531
.tailcall $P10(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 533
# string op: $S2
set $S2, $S1
.annotate 'line', 534
# var select: $P3
getattribute $P3, self, 'select'
.annotate 'line', 535
# var current: $P4
$P4 = $P3[$S1]
__label_8: # while
.annotate 'line', 537
isnull $I2, $P4
not $I2
unless $I2 goto __label_9
isa $I2, $P4, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 538
$P15 = self.'getchar'()
set $S1, $P15
set $P3, $P4
.annotate 'line', 540
$P4 = $P3[$S1]
.annotate 'line', 541
isnull $I3, $P4
unless $I3 goto __label_10
# {
.annotate 'line', 542
self.'ungetchar'($S1)
.annotate 'line', 543
$P4 = $P3['']
# }
goto __label_11
__label_10: # else
concat $S2, $S2, $S1
__label_11: # endif
.annotate 'line', 546
# }
goto __label_8
__label_7: # endwhile
.annotate 'line', 548
if_null $P4, __label_12
unless $P4 goto __label_12
.annotate 'line', 549
.tailcall $P4(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 550
.tailcall $P8(self, $S2, $I1)
# }
.annotate 'line', 551

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 552
# Body
# {
.annotate 'line', 554
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 555
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 556
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 557
.return($P1)
# }
.annotate 'line', 558

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 559
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

.annotate 'line', 576
# Body
# {
set $S1, __ARG_1
set $S2, 'int'
.annotate 'line', 578
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
.annotate 'line', 579
.return('I')
__label_3: # case
.annotate 'line', 580
.return('N')
__label_4: # case
.annotate 'line', 581
.return('S')
__label_5: # case
.annotate 'line', 582
.return('P')
__label_1: # default
.annotate 'line', 583
.return('')
__label_0: # switch end
# }
.annotate 'line', 585

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 587
# Body
# {
set $S1, __ARG_1
set $S2, 'I'
.annotate 'line', 589
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
.annotate 'line', 590
.return('int')
__label_3: # case
.annotate 'line', 591
.return('num')
__label_4: # case
.annotate 'line', 592
.return('string')
__label_5: # case
.annotate 'line', 593
.return('pmc')
__label_1: # default
.annotate 'line', 594
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 596

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 610
# Body
# {
.annotate 'line', 612
setattribute self, 'handle', __ARG_1
box $P1, ''
.annotate 'line', 613
setattribute self, 'file', $P1
box $P2, 0
.annotate 'line', 614
setattribute self, 'line', $P2
box $P2, 0
.annotate 'line', 615
setattribute self, 'pendingf', $P2
box $P3, 0
.annotate 'line', 616
setattribute self, 'pendingl', $P3
# }
.annotate 'line', 617

.end # initialize


.sub 'close' :method

.annotate 'line', 618
# Body
# {
null $P1
.annotate 'line', 620
setattribute self, 'handle', $P1
# }
.annotate 'line', 621

.end # close


.sub 'updateannot' :method

.annotate 'line', 622
# Body
# {
.annotate 'line', 624
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 625
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 626
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 627
getattribute $P3, self, 'handle'
$P3.'print'("'")
.annotate 'line', 628
getattribute $P3, self, 'handle'
$P3.'print'("\n")
box $P4, 0
.annotate 'line', 629
setattribute self, 'pendingf', $P4
# }
__label_0: # endif
.annotate 'line', 631
getattribute $P4, self, 'pendingl'
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 632
getattribute $P5, self, 'handle'
$P5.'print'(".annotate 'line', ")
.annotate 'line', 633
getattribute $P5, self, 'handle'
getattribute $P6, self, 'line'
$P5.'print'($P6)
.annotate 'line', 634
getattribute $P6, self, 'handle'
$P6.'print'("\n")
box $P7, 0
.annotate 'line', 635
setattribute self, 'pendingl', $P7
# }
__label_1: # endif
# }
.annotate 'line', 637

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 638
# Body
# {
.annotate 'line', 640
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 641
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 642

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 643
# Body
# {
.annotate 'line', 645
self.'updateannot'()
.annotate 'line', 646
self.'vprint'(__ARG_1)
# }
.annotate 'line', 647

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 648
# Body
# {
.annotate 'line', 650
self.'updateannot'()
.annotate 'line', 651
self.'vprint'(__ARG_1)
.annotate 'line', 652
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 653

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 654
# Body
# {
.annotate 'line', 656
getattribute $P1, self, 'file'
getattribute $P2, __ARG_1, 'file'
isne $I1, $P1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 657
getattribute $P4, __ARG_1, 'file'
setattribute self, 'file', $P4
box $P1, 1
.annotate 'line', 658
setattribute self, 'pendingf', $P1
box $P2, 0
.annotate 'line', 659
setattribute self, 'line', $P2
# }
__label_0: # endif
.annotate 'line', 661
getattribute $P3, self, 'line'
getattribute $P4, __ARG_1, 'line'
isne $I1, $P3, $P4
unless $I1 goto __label_1
# {
.annotate 'line', 662
getattribute $P6, __ARG_1, 'line'
setattribute self, 'line', $P6
box $P5, 1
.annotate 'line', 663
setattribute self, 'pendingl', $P5
# }
__label_1: # endif
# }
.annotate 'line', 665

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 666
# Body
# {
.annotate 'line', 668
self.'updateannot'()
.annotate 'line', 669
getattribute $P1, self, 'handle'
concat $S2, '# ', __ARG_1
concat $S1, $S2, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 670

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 671
# Body
# {
.annotate 'line', 673
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 674
$P1.'print'(__ARG_1)
.annotate 'line', 675
$P1.'print'(':')
.annotate 'line', 676
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 677
$P1.'print'(' # ')
.annotate 'line', 678
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 680
$P1.'print'("\n")
# }
.annotate 'line', 681

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 682
# Body
# {
.annotate 'line', 684
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 685
$P1.'print'('goto ')
.annotate 'line', 686
$P1.'print'(__ARG_1)
.annotate 'line', 687
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 688
$P1.'print'(' # ')
.annotate 'line', 689
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 691
$P1.'print'("\n")
# }
.annotate 'line', 692

.end # emitgoto


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 693
# Body
# {
.annotate 'line', 695
# string ins: $S1
concat $S2, "null ", __ARG_1
concat $S1, $S2, "\n"
.annotate 'line', 696
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 697

.end # emitnull


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 698
# Body
# {
.annotate 'line', 700
# string ins: $S1
concat $S4, "set ", __ARG_1
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_2
concat $S1, $S2, "\n"
.annotate 'line', 701
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 702

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 703
# Body
# {
.annotate 'line', 705
# string ins: $S1
concat $S4, "assign ", __ARG_1
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_2
concat $S1, $S2, "\n"
.annotate 'line', 706
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 707

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 708
# Body
# {
.annotate 'line', 710
# string ins: $S1
concat $S4, "box ", __ARG_1
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_2
concat $S1, $S2, "\n"
.annotate 'line', 711
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 712

.end # emitbox


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 713
# Body
# {
.annotate 'line', 715
# string ins: $S1
concat $S4, "add ", __ARG_1
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_2
concat $S1, $S2, "\n"
.annotate 'line', 716
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 717

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 718
# Body
# {
.annotate 'line', 720
# string ins: $S1
concat $S6, "add ", __ARG_1
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

.end # emitadd


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 723
# Body
# {
.annotate 'line', 725
# string ins: $S1
concat $S6, "concat ", __ARG_1
concat $S5, $S6, ", "
concat $S4, $S5, __ARG_2
concat $S3, $S4, ", "
concat $S2, $S3, __ARG_3
concat $S1, $S2, "\n"
.annotate 'line', 726
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 727

.end # emitconcat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 604
addattribute $P0, 'handle'
.annotate 'line', 605
addattribute $P0, 'file'
.annotate 'line', 606
addattribute $P0, 'line'
.annotate 'line', 607
addattribute $P0, 'pendingf'
.annotate 'line', 608
addattribute $P0, 'pendingl'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 734
# Body
# {
.annotate 'line', 736
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 737

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 739
# Body
# {
.annotate 'line', 741
# var t: $P1
$P1 = 'newTokenFrom'(6, __ARG_3, __ARG_2)
.annotate 'line', 742
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 743

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 745
# Body
# {
.annotate 'line', 751
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 752
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 753
.return($I1)
# }
.annotate 'line', 754

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 774
# Body
# {
.annotate 'line', 776
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 777
.return($S1)
# }
.annotate 'line', 778

.end # name


.sub 'result' :method

.annotate 'line', 779
# Body
# {
.annotate 'line', 781
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 782

.end # result


.sub 'params' :method

.annotate 'line', 783
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 784
# Body
# {
.annotate 'line', 786
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 787
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 788
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 789
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 790
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 792
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 794
.return($S1)
# }
.annotate 'line', 795

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 796
# Body
# {
box $P1, __ARG_1
.annotate 'line', 802
setattribute self, 'name', $P1
.annotate 'line', 803
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 804
setattribute self, 'typeresult', $P2
.annotate 'line', 805
# int n: $I1
null $I1
.annotate 'line', 806
isnull $I2, __ARG_4
not $I2
unless $I2 goto __label_0
# {
box $P2, __ARG_4
.annotate 'line', 807
setattribute self, 'type0', $P2
.annotate 'line', 808
iseq $I2, __ARG_4, '*'
unless $I2 goto __label_1
set $I1, -1
goto __label_2
__label_1: # else
.annotate 'line', 809
# {
set $I1, 1
.annotate 'line', 812
isnull $I3, __ARG_5
not $I3
unless $I3 goto __label_3
# {
box $P3, __ARG_5
.annotate 'line', 813
setattribute self, 'type1', $P3
.annotate 'line', 814
inc $I1
# }
__label_3: # endif
.annotate 'line', 816
isnull $I3, __ARG_6
not $I3
unless $I3 goto __label_4
# {
box $P3, __ARG_6
.annotate 'line', 817
setattribute self, 'type2', $P3
.annotate 'line', 818
inc $I1
# }
__label_4: # endif
# }
__label_2: # endif
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 822
setattribute self, 'nparams', $P4
.annotate 'line', 823
.return(self)
# }
.annotate 'line', 824

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 825
# Body
# {
.annotate 'line', 833
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 834
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 835
.return(self)
# }
.annotate 'line', 836

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 837
# Body
# {
.annotate 'line', 839
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 840
# string typeresult: $S2
getattribute $P2, self, 'typeresult'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 841
__ARG_1.'comment'($S6)
.annotate 'line', 843
getattribute $P3, self, 'body'
isa $I4, $P3, 'String'
unless $I4 goto __label_2
# {
.annotate 'line', 844
# string body: $S3
getattribute $P4, self, 'body'
null $S3
if_null $P4, __label_4
set $S3, $P4
__label_4:
.annotate 'line', 845
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 846
iseq $I4, $S2, 'v'
unless $I4 goto __label_5
# {
.annotate 'line', 847
isnull $I5, __ARG_4
not $I5
unless $I5 goto __label_8
isne $I5, __ARG_4, ''
__label_8:
unless $I5 goto __label_7
.annotate 'line', 848
'SyntaxError'('using return value from void predef')
__label_7: # endif
.annotate 'line', 849
isne $I5, $I1, -1
unless $I5 goto __label_9
.annotate 'line', 850
'InternalError'('void predef with {res}')
__label_9: # endif
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 853
iseq $I6, $I1, -1
unless $I6 goto __label_10
.annotate 'line', 854
'InternalError'('non void predef without {res}')
__label_10: # endif
.annotate 'line', 855
isne $I6, $S2, 'v'
unless $I6 goto __label_12
isnull $I6, __ARG_4
if $I6 goto __label_13
iseq $I6, __ARG_4, ''
__label_13:
__label_12:
unless $I6 goto __label_11
.annotate 'line', 856
$P3 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P3
__label_11: # endif
__label_14: # do
.annotate 'line', 857
# {
.annotate 'line', 858
# predefined substr
substr $S7, $S3, 0, $I1
concat $S6, $S7, __ARG_4
add $I7, $I1, 5
# predefined substr
substr $S8, $S3, $I7
concat $S3, $S6, $S8
# }
.annotate 'line', 859
# predefined indexof
index $I1, $S3, '{res}'
isne $I7, $I1, -1
if $I7 goto __label_14
__label_15: # enddo
# }
__label_6: # endif
.annotate 'line', 862
# int n: $I2
set $P4, __ARG_5
set $I2, $P4
# for loop
.annotate 'line', 863
# int i: $I3
null $I3
goto __label_19
__label_17: # for iteration
inc $I3
__label_19: # for condition
islt $I8, $I3, $I2
unless $I8 goto __label_18 # for end
# {
.annotate 'line', 864
# string argmark: $S4
$S8 = $I3
concat $S7, '{arg', $S8
concat $S4, $S7, '}'
.annotate 'line', 865
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_21: # while
.annotate 'line', 866
# predefined indexof
index $I1, $S3, $S4
isne $I8, $I1, -1
unless $I8 goto __label_20
.annotate 'line', 867
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
.annotate 'line', 869
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 870
__ARG_1.'say'($S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 873
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 874
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_3: # endif
# }
.annotate 'line', 876

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 765
addattribute $P0, 'name'
.annotate 'line', 766
addattribute $P0, 'body'
.annotate 'line', 767
addattribute $P0, 'evalfun'
.annotate 'line', 768
addattribute $P0, 'typeresult'
.annotate 'line', 769
addattribute $P0, 'type0'
.annotate 'line', 770
addattribute $P0, 'type1'
.annotate 'line', 771
addattribute $P0, 'type2'
.annotate 'line', 772
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 881
# Body
# {
.annotate 'line', 883
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 884
# int n: $I1
# predefined int
$I3 = __ARG_4
sub $I1, $I3, 1
.annotate 'line', 885
isge $I3, $I1, 0
unless $I3 goto __label_0
# {
# for loop
.annotate 'line', 886
# int i: $I2
null $I2
goto __label_4
__label_2: # for iteration
inc $I2
__label_4: # for condition
islt $I4, $I2, $I1
unless $I4 goto __label_3 # for end
$P1 = __ARG_4[$I2]
.annotate 'line', 887
__ARG_1.'say'('print ', $P1)
goto __label_2 # for iteration
__label_3: # for end
$P1 = __ARG_4[$I1]
.annotate 'line', 888
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 891
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 892

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

.annotate 'line', 897
# Body
# {
.annotate 'line', 899
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 900
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 901
# int n: $I1
# predefined int
$I1 = __ARG_4
# for loop
.annotate 'line', 902
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
$P1 = __ARG_4[$I2]
.annotate 'line', 903
__ARG_1.'say'("print $P0, ", $P1)
goto __label_0 # for iteration
__label_1: # for end
.annotate 'line', 904
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 905

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

.annotate 'line', 910
# Body
# {
.annotate 'line', 912
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 913
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 914
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
$P1 = __ARG_4[$I2]
.annotate 'line', 915
__ARG_1.'say'('print ', $P1)
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 916

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 919
# Body
# {
.annotate 'line', 921
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 922
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 923
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 924

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 926
# Body
# {
.annotate 'line', 928
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 929
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 930
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 931

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 933
# Body
# {
.annotate 'line', 935
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 936
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 937
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 938

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 940
# Body
# {
.annotate 'line', 942
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 943
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 944
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 945
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 946
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 947

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 949
# Body
# {
.annotate 'line', 951
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 953
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 954
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 956
# var t: $P2
$P2 = 'newTokenFrom'(2, $S1, __ARG_2)
.annotate 'line', 957
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 958

.end # predefeval_chr


.sub 'getpredefs'

.annotate 'line', 960
# Body
# {
.annotate 'line', 962
# var predef_say: $P1
new $P1, [ 'Predef_say' ]
.annotate 'line', 963
# var predef_cry: $P2
new $P2, [ 'Predef_cry' ]
.annotate 'line', 964
# var predef_print: $P3
new $P3, [ 'Predef_print' ]
.annotate 'line', 966
get_hll_global $P5, 'predefeval_length'
.annotate 'line', 967
get_hll_global $P6, 'predefeval_bytelength'
.annotate 'line', 968
get_hll_global $P7, 'predefeval_chr'
.annotate 'line', 969
get_hll_global $P8, 'predefeval_ord'
.annotate 'line', 970
get_hll_global $P9, 'predefeval_ord_n'
.annotate 'line', 972
# var predefs: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
.annotate 'line', 973
new $P13, [ 'PredefFunction' ]
$P12 = $P13.'set'('int', '{res} = {arg0}', 'I', '?')
.annotate 'line', 972
$P10.'push'($P12)
.annotate 'line', 977
new $P15, [ 'PredefFunction' ]
$P14 = $P15.'set'('float', '{res} = {arg0}', 'N', '?')
.annotate 'line', 972
$P10.'push'($P14)
.annotate 'line', 981
new $P17, [ 'PredefFunction' ]
$P16 = $P17.'set'('string', '{res} = {arg0}', 'S', '?')
.annotate 'line', 972
$P10.'push'($P16)
.annotate 'line', 985
new $P19, [ 'PredefFunction' ]
$P18 = $P19.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 972
$P10.'push'($P18)
.annotate 'line', 989
new $P21, [ 'PredefFunction' ]
$P20 = $P21.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 972
$P10.'push'($P20)
.annotate 'line', 993
new $P23, [ 'PredefFunction' ]
$P22 = $P23.'set'('time', 'time {res}', 'I')
.annotate 'line', 972
$P10.'push'($P22)
.annotate 'line', 997
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 972
$P10.'push'($P24)
.annotate 'line', 1001
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 972
$P10.'push'($P26)
.annotate 'line', 1005
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 972
$P10.'push'($P28)
.annotate 'line', 1010
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P30)
.annotate 'line', 1015
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 972
$P10.'push'($P32)
.annotate 'line', 1020
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 972
$P10.'push'($P34)
.annotate 'line', 1026
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 972
$P10.'push'($P36)
.annotate 'line', 1033
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 972
$P10.'push'($P38)
.annotate 'line', 1037
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set_eval'('length', $P5, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 972
$P10.'push'($P40)
.annotate 'line', 1042
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set_eval'('bytelength', $P6, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 972
$P10.'push'($P42)
.annotate 'line', 1047
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set_eval'('chr', $P7, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 972
$P10.'push'($P44)
.annotate 'line', 1054
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set_eval'('ord', $P8, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 972
$P10.'push'($P46)
.annotate 'line', 1059
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set_eval'('ord', $P9, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 972
$P10.'push'($P48)
.annotate 'line', 1064
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 972
$P10.'push'($P50)
.annotate 'line', 1068
new $P53, [ 'PredefFunction' ]
$P52 = $P53.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 972
$P10.'push'($P52)
.annotate 'line', 1072
new $P55, [ 'PredefFunction' ]
$P54 = $P55.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P54)
.annotate 'line', 1076
new $P57, [ 'PredefFunction' ]
$P56 = $P57.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 972
$P10.'push'($P56)
.annotate 'line', 1080
new $P59, [ 'PredefFunction' ]
$P58 = $P59.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 972
$P10.'push'($P58)
.annotate 'line', 1084
new $P61, [ 'PredefFunction' ]
$P60 = $P61.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P60)
.annotate 'line', 1088
new $P63, [ 'PredefFunction' ]
$P62 = $P63.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P62)
.annotate 'line', 1092
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P64)
.annotate 'line', 1096
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P66)
.annotate 'line', 1100
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 972
$P10.'push'($P68)
.annotate 'line', 1105
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P70)
.annotate 'line', 1110
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P72)
.annotate 'line', 1114
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P74)
.annotate 'line', 1118
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P76)
.annotate 'line', 1122
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P78)
.annotate 'line', 1126
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P80)
.annotate 'line', 1130
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P82)
.annotate 'line', 1134
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P84)
.annotate 'line', 1138
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P86)
.annotate 'line', 1142
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P88)
.annotate 'line', 1146
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P90)
.annotate 'line', 1150
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 972
$P10.'push'($P92)
.annotate 'line', 1154
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 972
$P10.'push'($P94)
.annotate 'line', 1158
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 972
$P10.'push'($P96)
.annotate 'line', 1162
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 972
$P10.'push'($P98)
.annotate 'line', 1166
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 972
$P10.'push'($P100)
.annotate 'line', 1170
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 972
$P10.'push'($P102)
.annotate 'line', 1174
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 972
$P10.'push'($P104)
.annotate 'line', 1178
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 972
$P10.'push'($P106)
.annotate 'line', 1182
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 972
$P10.'push'($P108)
.annotate 'line', 1186
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 972
$P10.'push'($P110)
.annotate 'line', 1191
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P112)
.annotate 'line', 1196
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 972
$P10.'push'($P114)
.annotate 'line', 1200
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 972
$P10.'push'($P116)
.annotate 'line', 1204
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 972
$P10.'push'($P118)
.annotate 'line', 1208
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 972
$P10.'push'($P120)
.annotate 'line', 1212
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 972
$P10.'push'($P122)
.annotate 'line', 1216
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('print', $P3, 'P', '*')
.annotate 'line', 972
$P10.'push'($P124)
.annotate 'line', 1220
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('say', $P1, 'P', '*')
.annotate 'line', 972
$P10.'push'($P126)
.annotate 'line', 1224
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('cry', $P2, 'P', '*')
.annotate 'line', 972
$P10.'push'($P128)
set $P4, $P10
__label_1: # Infinite loop
.annotate 'line', 1230
.yield($P4)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1231

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1233
# Body
# {
.annotate 'line', 1235
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1236
getattribute $P4, $P1, 'name'
$S1 = $P4
iseq $I2, $S1, __ARG_1
unless $I2 goto __label_2
# {
.annotate 'line', 1237
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1238
iseq $I2, $I1, -1
if $I2 goto __label_4
iseq $I2, $I1, __ARG_2
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1239
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1241
.return($P2)
# }
.annotate 'line', 1242

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1248
# Body
# {
.annotate 'line', 1250
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1251
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
.annotate 'line', 1252
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 1253

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1264
# Body
# {
.annotate 'line', 1266
setattribute self, 'start', __ARG_1
.annotate 'line', 1267
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1268

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1269
# Body
# {
.annotate 'line', 1271
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1272

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1273
# Body
# {
.annotate 'line', 1275
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1276

.end # use_predef


.sub 'createsubid' :method

.annotate 'line', 1277
# Body
# {
.annotate 'line', 1279
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 1280

.end # createsubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1281
# Body
# {
.annotate 'line', 1283
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1284

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1285
# Body
# {
.annotate 'line', 1287
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1288

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1261
addattribute $P0, 'start'
.annotate 'line', 1262
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1301
# Body
# {
.annotate 'line', 1303
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1304

.end # init


.sub 'numargs' :method

.annotate 'line', 1306
# Body
# {
.annotate 'line', 1308
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1309

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1310
# Body
# {
.annotate 'line', 1312
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1313
.return($P2)
# }
.annotate 'line', 1314

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1316
# Body
# {
.annotate 'line', 1318
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1319
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1320
# {
.annotate 'line', 1321
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1322
$P1.'push'($P3)
# }
.annotate 'line', 1323
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1324
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1325

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1327
# Body
# {
.annotate 'line', 1329
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1330
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 1331
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1332

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1333
# Body
# {
.annotate 'line', 1335
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1336
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1337
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1338
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 1339
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1340
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1341
$P2.'push'($S1)
# }
goto __label_0 # for iteration
__label_1: # for end
.annotate 'line', 1343
.return($P2)
# }
.annotate 'line', 1344

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1345
# Body
# {
.annotate 'line', 1347
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1348
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1349

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1299
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1361
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1362
# Body
# {
.annotate 'line', 1364
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1365
.return($I1)
# }
.annotate 'line', 1366

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1367
# Body
# {
.annotate 'line', 1369
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1370
$P2 = $P1.'numargs'()
set $I2, $P2
islt $I1, __ARG_1, $I2
unless $I1 goto __label_0
.annotate 'line', 1371
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1373
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1374

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1375
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1377
setattribute self, 'name', $P1
.annotate 'line', 1378
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
.annotate 'line', 1379
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1380

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1381
# Body
# {
.annotate 'line', 1383
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1384

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1358
addattribute $P0, 'name'
.annotate 'line', 1359
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1391
# Body
# {
.annotate 'line', 1393
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1394
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1395
# {
.annotate 'line', 1396
$P2 = __ARG_1.'get'()
.annotate 'line', 1397
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1398
$P2 = __ARG_1.'get'()
.annotate 'line', 1399
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1400
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1401
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1402
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1404
new $P7, [ 'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1405
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1406
'RequireOp'(']', $P2)
.annotate 'line', 1407
setattribute self, 'list', $P1
# }
.annotate 'line', 1408

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1409
# Body
# {
.annotate 'line', 1411
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1412
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1413

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1414
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1415
# Body
# {
.annotate 'line', 1417
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1418
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1419
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 1420
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1421
$P3 = $P2.'getname'()
$S1 = $P3
iseq $I3, $S1, __ARG_1
unless $I3 goto __label_3
# {
.annotate 'line', 1422
.return($P2)
# }
__label_3: # endif
# }
goto __label_0 # for iteration
__label_1: # for end
null $P3
.annotate 'line', 1425
.return($P3)
# }
.annotate 'line', 1426

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1389
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1433
# Body
# {
.annotate 'line', 1435
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S3, "[ '", $S1
concat $S2, $S3, "' ]"
.annotate 'line', 1436
.return($S2)
# }
.annotate 'line', 1437

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1439
# Body
# {
.annotate 'line', 1441
# predefined elements
elements $I2, __ARG_1
iseq $I1, $I2, 0
unless $I1 goto __label_0
.annotate 'line', 1442
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1444
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S3, ".namespace [ '", $S1
concat $S2, $S3, "' ]"
.annotate 'line', 1445
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1447

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1449
# Body
# {
.annotate 'line', 1451
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1452
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1453
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1454
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1455
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1457
__ARG_2.'unget'($P1)
.annotate 'line', 1458
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1460

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1462
# Body
# {
.annotate 'line', 1464
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1465
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1466
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1467
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1468
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1469
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1470
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1472
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1473
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1474
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
.annotate 'line', 1476
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1478
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1481
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1483
new $P9, [ 'StringStatement' ]
$P9.'StringStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_10: # case
.annotate 'line', 1485
new $P11, [ 'IntStatement' ]
$P11.'IntStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_11: # case
.annotate 'line', 1487
new $P13, [ 'FloatStatement' ]
$P13.'FloatStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_12: # case
.annotate 'line', 1489
new $P15, [ 'ReturnStatement' ]
$P15.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_13: # case
.annotate 'line', 1491
new $P17, [ 'YieldStatement' ]
$P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_14: # case
.annotate 'line', 1493
new $P19, [ 'GotoStatement' ]
$P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_15: # case
.annotate 'line', 1495
new $P21, [ 'IfStatement' ]
$P21.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_16: # case
.annotate 'line', 1497
new $P23, [ 'WhileStatement' ]
$P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_17: # case
.annotate 'line', 1499
new $P25, [ 'DoStatement' ]
$P25.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_18: # case
.annotate 'line', 1501
new $P27, [ 'ContinueStatement' ]
$P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_19: # case
.annotate 'line', 1503
new $P29, [ 'BreakStatement' ]
$P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_20: # case
.annotate 'line', 1505
new $P31, [ 'SwitchStatement' ]
$P31.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P30, $P31
.return($P30)
__label_21: # case
.annotate 'line', 1507
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1509
new $P33, [ 'ThrowStatement' ]
$P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P32, $P33
.return($P32)
__label_23: # case
.annotate 'line', 1511
new $P35, [ 'TryStatement' ]
$P35.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P34, $P35
.return($P34)
__label_5: # default
.annotate 'line', 1513
$P36 = $P1.'isidentifier'()
if_null $P36, __label_24
unless $P36 goto __label_24
# {
.annotate 'line', 1514
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1515
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1516
new $P10, [ 'LabelStatement' ]
.tailcall $P10.'set'($P1, __ARG_2)
__label_25: # endif
.annotate 'line', 1517
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1519
__ARG_1.'unget'($P1)
.annotate 'line', 1520
new $P12, [ 'ExprStatement' ]
$P12.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P11, $P12
.return($P11)
__label_4: # switch end
.annotate 'line', 1522
isnull $I1, $P2
unless $I1 goto __label_26
.annotate 'line', 1523
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1524
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1525

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1533
# Body
# {
.annotate 'line', 1535
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1536

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1537
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1538
# Body
# {
.annotate 'line', 1540
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1541

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1542
# Body
# {
.annotate 'line', 1544
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1545

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1546
# Body
# {
.annotate 'line', 1548
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1549

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1550
# Body
# {
.annotate 'line', 1552
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1553

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1554
# Body
# {
.annotate 'line', 1556
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1557

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1558
# Body
# {
.annotate 'line', 1560
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1561

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1562
# Body
# {
.annotate 'line', 1564
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1565

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1566
# Body
# {
.annotate 'line', 1568
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1569

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1570
# Body
# {
.annotate 'line', 1572
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1573

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1574
# Body
# {
.annotate 'line', 1576
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1577

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1579
# Body
# {
.annotate 'line', 1584
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1585

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1586
# Body
# {
.annotate 'line', 1588
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1589

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1590
# Body
# {
.annotate 'line', 1592
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1593

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1594
# Body
# {
.annotate 'line', 1596
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1598
.return(self)
# }
.annotate 'line', 1599

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1531
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1604
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1605
# Body
# {
.annotate 'line', 1607
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1608

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1609
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1610
# Body
# {
# }
.annotate 'line', 1613

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1602
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1620
# Body
# {
.annotate 'line', 1622
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1623
$P1.'push'(__ARG_1)
.annotate 'line', 1624
$P1.'push'(__ARG_2)
.annotate 'line', 1625
setattribute self, 'statements', $P1
# }
.annotate 'line', 1626

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1627
# Body
# {
.annotate 'line', 1629
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1630
.return(self)
# }
.annotate 'line', 1631

.end # push


.sub 'optimize' :method

.annotate 'line', 1632
# Body
# {
.annotate 'line', 1634
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1635
.return(self)
# }
.annotate 'line', 1636

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1637
# Body
# {
.annotate 'line', 1639
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1640
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1641

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1618
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1644
# Body
# {
.annotate 'line', 1646
isnull $I1, __ARG_1
unless $I1 goto __label_0
.annotate 'line', 1647
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1648
isa $I2, __ARG_1, 'MultiStatement'
unless $I2 goto __label_2
.annotate 'line', 1649
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1651
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1652

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1662
# Body
# {
.annotate 'line', 1664
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1665
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1666
# int dotted: $I1
null $I1
.annotate 'line', 1667
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1669
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1671
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1672
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S2, $S3, $S1
box $P3, $S2
setattribute self, 'opname', $P3
.annotate 'line', 1673
$P1 = __ARG_2.'get'()
.annotate 'line', 1674
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1675
__ARG_2.'unget'($P1)
.annotate 'line', 1676
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1678
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1679

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1680
# Body
# {
.annotate 'line', 1682
self.'optimizeargs'()
.annotate 'line', 1683
.return(self)
# }
.annotate 'line', 1684

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1685
# Body
# {
.annotate 'line', 1687
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1688
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1689
__ARG_1.'comment'($S2)
.annotate 'line', 1690
$P1 = self.'numargs'()
set $I2, $P1
iseq $I1, $I2, 0
unless $I1 goto __label_1
.annotate 'line', 1691
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1693
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1694
self.'emitargs'(__ARG_1)
.annotate 'line', 1695
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1697

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1658
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1660
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1707
# Body
# {
.annotate 'line', 1709
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1710
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1711
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1712
# {
.annotate 'line', 1713
$P2 = __ARG_2.'get'()
.annotate 'line', 1714
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1715
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1716
'RequireOp'(';', $P2)
.annotate 'line', 1717
setattribute self, 'path', $P1
.annotate 'line', 1718
.return(self)
# }
.annotate 'line', 1719

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1720
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1721
# Body
# {
.annotate 'line', 1723
self.'annotate'(__ARG_1)
.annotate 'line', 1724
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1725

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1704
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1706
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1735
# Body
# {
.annotate 'line', 1737
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1738
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1739
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1740
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1741

.end # StaticStatement


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
self.'annotate'(__ARG_1)
.annotate 'line', 1746
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1747
getattribute $P3, self, 'symbol'
.annotate 'line', 1746
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1748

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1732
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1734
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1758
# Body
# {
.annotate 'line', 1760
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1761
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1762
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1763
# {
.annotate 'line', 1764
$P2 = __ARG_2.'get'()
.annotate 'line', 1765
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1766
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1767
'RequireOp'(';', $P2)
.annotate 'line', 1768
setattribute self, 'path', $P1
# }
.annotate 'line', 1769

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1770
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1771
# Body
# {
.annotate 'line', 1773
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1774
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1775
self.'annotate'(__ARG_1)
.annotate 'line', 1777
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1779
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1780
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1782
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1785
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1787

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1755
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1757
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1797
# Body
# {
.annotate 'line', 1799
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1800
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1801
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1802

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1803
# Body
# {
.annotate 'line', 1805
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1806
.return(self)
# }
.annotate 'line', 1807

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1808
# Body
# {
.annotate 'line', 1810
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1811

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1794
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1796
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1821
# Body
# {
.annotate 'line', 1823
setattribute self, 'name', __ARG_1
.annotate 'line', 1824
.return(self)
# }
.annotate 'line', 1825

.end # set


.sub 'get_string' :method :vtable

.annotate 'line', 1826
# Body
# {
# predefined Error
.annotate 'line', 1828
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1829

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1820
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1836
# Body
# {
.annotate 'line', 1838
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1839

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1840
# Body
# {
.annotate 'line', 1842
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1843
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1844
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1845
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S4, "Redeclared '", $S1
concat $S3, $S4, "'"
.annotate 'line', 1846
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1847
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1848
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['scope'] = self
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1853
.return($S2)
# }
.annotate 'line', 1854

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1855
# Body
# {
.annotate 'line', 1857
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1858
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1859
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1860
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1861
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1862
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['scope'] = self
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1867

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1868
# Body
# {
.annotate 'line', 1870
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1871
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1872
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1873
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1874
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1875
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1878
new $P5, [ 'ConstantInternalFail' ]
$P4 = $P5.'set'(__ARG_1)
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1880
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1881
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1882
$P1[$S1] = $P3
# }
.annotate 'line', 1883

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1884
# Body
# {
.annotate 'line', 1886
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1887
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1888
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1889
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1890
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1891
.return($P2)
# }
.annotate 'line', 1892

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 1893
# Body
# {
.annotate 'line', 1895
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1896
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1897
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1898
.return($P2)
# }
.annotate 'line', 1899

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 1900
# Body
# {
.annotate 'line', 1902
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 1903
# string lexname: $S1
$P3 = __ARG_1['reg']
$P2 = $P1.'createlex'($P3)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1904
.return($S1)
# }
.annotate 'line', 1905

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 1906
# Body
# {
.annotate 'line', 1908
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 1910
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 1911
.return('__WLEX_self')
# }
.annotate 'line', 1912

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1835
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 1921
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 1931
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 1932
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 1933
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 1934
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 1935
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 1936
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 1937
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 1938
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 1939
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1940
# Body
# {
.annotate 'line', 1942
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 1943

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 1944
# Body
# {
.annotate 'line', 1946
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1947

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 1948
# Body
# {
.annotate 'line', 1951
.return(self)
# }
.annotate 'line', 1952

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 1953
# Body
# {
.annotate 'line', 1955
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1956
# string reg: $S2
iseq $I1, $S1, 'v'
unless $I1 goto __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 1957
self.'emit'(__ARG_1, $S2)
.annotate 'line', 1958
.return($S2)
# }
.annotate 'line', 1959

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1960
# Body
# {
.annotate 'line', 1962
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 1963

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 1929
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 1968
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 1966
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1976
# Body
# {
.annotate 'line', 1978
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 1979
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1980
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 1981
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 1982
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 1983

.end # FunctionExpr


.sub 'checkResult' :method

.annotate 'line', 1984
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 1985
# Body
# {
.annotate 'line', 1987
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 1988
.return(self)
# }
.annotate 'line', 1989

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1990
# Body
# {
.annotate 'line', 1992
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 1993
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1994
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 1995
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 1996
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 1997

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 1973
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 1975
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2012
# Body
# {
.annotate 'line', 2014
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2015
.return(self)
# }
.annotate 'line', 2016

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2017
# Body
# {
.annotate 'line', 2019
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2020

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2021
# Body
# {
.annotate 'line', 2023
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2024
.return(self)
# }
.annotate 'line', 2025

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2026
# Body
# {
.annotate 'line', 2028
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2029
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2030
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2032
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2033
iseq $I2, $I1, 0
unless $I2 goto __label_4
.annotate 'line', 2034
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2036
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2039
.return(0)
# }
.annotate 'line', 2040

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2041
# Body
# {
.annotate 'line', 2043
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2044
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2045
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2046
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
.annotate 'line', 2049
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_3)
__label_6: # case
__label_7: # case
.annotate 'line', 2052
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2055
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2057

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2058
# Body
# {
.annotate 'line', 2060
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2061
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2062
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2063
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
.annotate 'line', 2066
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_2)
__label_6: # case
__label_7: # case
.annotate 'line', 2069
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2072
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2074

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2011
addattribute $P0, 'condexpr'
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2082
# Body
# {
.annotate 'line', 2084
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2085
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2086

.end # StringLiteral


.sub 'isliteral' :method

.annotate 'line', 2087
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isstringliteral' :method

.annotate 'line', 2088
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2089
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2090
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getPirString' :method

.annotate 'line', 2091
# Body
# {
.annotate 'line', 2093
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2094
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2095
# int type: $I1
getattribute $P2, $P1, 'type'
set $I1, $P2
.annotate 'line', 2096
# int need_unicode: $I2
null $I2
box $P3, $S1
.annotate 'line', 2097
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $I3, $P4
# {
.annotate 'line', 2098
isgt $I7, $I3, 127
unless $I7 goto __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2100
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2103
unless $I2 goto __label_4
# {
.annotate 'line', 2104
iseq $I7, $I1, 3
unless $I7 goto __label_5
# {
set $I1, 2
.annotate 'line', 2106
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P3, $S2
.annotate 'line', 2108
iter $P5, $P3
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2109
iseq $I8, $S3, '\'
unless $I8 goto __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2111
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2114
# string result: $S4
set $S4, ''
.annotate 'line', 2115
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2116
# int i: $I5
null $I5
goto __label_11
__label_9: # for iteration
inc $I5
__label_11: # for condition
islt $I8, $I5, $I4
unless $I8 goto __label_10 # for end
# {
.annotate 'line', 2117
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2118
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2119
isgt $I9, $I6, 127
unless $I9 goto __label_12
# {
.annotate 'line', 2120
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
.annotate 'line', 2121
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2124
# }
goto __label_9 # for iteration
__label_10: # for end
set $S1, $S4
.annotate 'line', 2126
# }
__label_4: # endif
.annotate 'line', 2128
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
.annotate 'line', 2130
unless $I2 goto __label_17
concat $S1, 'unicode:', $S1
__label_17: # endif
.annotate 'line', 2132
.return($S1)
# }
.annotate 'line', 2133

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2134
# Body
# {
.annotate 'line', 2136
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2137
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2138
getattribute $P3, $P1, 'type'
set $I2, $P3
iseq $I1, $I2, 2
unless $I1 goto __label_1
# {
.annotate 'line', 2139
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2140
$P4 = $P2.'unescape'('utf8')
set $S1, $P4
# }
__label_1: # endif
.annotate 'line', 2142
.return($S1)
# }
.annotate 'line', 2143

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2144
# Body
# {
.annotate 'line', 2146
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2147

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2148
# Body
# {
.annotate 'line', 2150
.tailcall self.'getPirString'()
# }
.annotate 'line', 2151

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2079
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2081
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2160
# Body
# {
.annotate 'line', 2163
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2164
setattribute self, 'pos', __ARG_2
.annotate 'line', 2165
# int n: $I1
null $I1
.annotate 'line', 2166
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2167
# {
.annotate 'line', 2169
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2170
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2172
setattribute self, 'numval', $P2
# }
.annotate 'line', 2173

.end # IntegerLiteral


.sub 'isliteral' :method

.annotate 'line', 2174
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2175
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2176
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2177
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getIntegerValue' :method

.annotate 'line', 2178
# Body
# {
.annotate 'line', 2180
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2181
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2182
.return($I1)
# }
.annotate 'line', 2183

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2184
# Body
# {
.annotate 'line', 2186
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2187
iseq $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 2188
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2190
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2191

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2192
# Body
# {
.annotate 'line', 2194
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2195

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2156
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2158
addattribute $P0, 'pos'
.annotate 'line', 2159
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2203
# Body
# {
.annotate 'line', 2205
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2206
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2207

.end # FloatLiteral


.sub 'isliteral' :method

.annotate 'line', 2208
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2209
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2210
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2211
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getFloatValue' :method

.annotate 'line', 2212
# Body
# {
.annotate 'line', 2214
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2215
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2217
.return($P1)
# }
.annotate 'line', 2218

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2219
# Body
# {
.annotate 'line', 2221
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2222
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2223

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2224
# Body
# {
.annotate 'line', 2228
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2229
# predefined indexof
index $I2, $S1, '.'
islt $I1, $I2, 0
unless $I1 goto __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2231
.return($S1)
# }
.annotate 'line', 2232

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2200
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2202
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2240
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2241
# Body
# {
.annotate 'line', 2243
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2244
setattribute self, 'name', __ARG_2
.annotate 'line', 2245
.return(self)
# }
.annotate 'line', 2246

.end # set


.sub 'isnull' :method

.annotate 'line', 2247
# Body
# {
.annotate 'line', 2249
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2250

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2251
# Body
# {
.annotate 'line', 2253
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2254
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
$P2 = $P1['type']
.annotate 'line', 2255
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2257
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
.annotate 'line', 2260
.return('P')
__label_3: # default
.annotate 'line', 2262
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2265

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2266
# Body
# {
.annotate 'line', 2268
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2269
.return($S1)
# }
.annotate 'line', 2270

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2271
# Body
# {
.annotate 'line', 2273
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2274
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 2275
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2276
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2277
# string s: $S1
null $S1
.annotate 'line', 2278
isnull $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 2279
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2280
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
.annotate 'line', 2286
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2290
$P4 = $P2['id']
isnull $I2, $P4
not $I2
unless $I2 goto __label_8
$P5 = $P2['id']
.annotate 'line', 2291
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2293
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2295
.return($S1)
# }
.annotate 'line', 2296

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2297
# Body
# {
.annotate 'line', 2299
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2300
$S2 = $P1
iseq $I1, $S2, ''
unless $I1 goto __label_0
# {
.annotate 'line', 2301
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S3, "Variable '", $S1
concat $S2, $S3, "' is not defined"
.annotate 'line', 2302
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2304
.return($P1)
# }
.annotate 'line', 2305

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2306
# Body
# {
.annotate 'line', 2308
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2309
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2310
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 2311
$I2 = $P2['const']
unless $I2 goto __label_2
$P3 = $P2['id']
isnull $I2, $P3
__label_2:
unless $I2 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2312
.return($P4)
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2314
.return(self)
# }
.annotate 'line', 2315

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2316
# Body
# {
.annotate 'line', 2318
self.'annotate'(__ARG_1)
.annotate 'line', 2319
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2320

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2321
# Body
# {
.annotate 'line', 2323
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2324

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2325
# Body
# {
.annotate 'line', 2327
self.'annotate'(__ARG_1)
.annotate 'line', 2328
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2329
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2330
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2331
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2334
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2337
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2340
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2341
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2343
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2344
iseq $I1, $S1, $S3
unless $I1 goto __label_11
# {
.annotate 'line', 2345
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2348
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2349
self.'annotate'(__ARG_1)
.annotate 'line', 2350
iseq $I2, $S1, 'P'
unless $I2 goto __label_16
isne $I2, $S3, 'P'
__label_16:
unless $I2 goto __label_14
.annotate 'line', 2351
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2353
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2356
.return($S2)
# }
.annotate 'line', 2357

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2237
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2239
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2364
# Body
# {
.annotate 'line', 2366
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2367

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2362
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2375
# Body
# {
.annotate 'line', 2377
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2378
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2379

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2380
# Body
# {
.annotate 'line', 2382
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2383

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2384
# Body
# {
.annotate 'line', 2386
self.'optimizearg'()
.annotate 'line', 2387
.return(self)
# }
.annotate 'line', 2388

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2372
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2374
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2397
# Body
# {
.annotate 'line', 2399
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2400
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2401
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2402

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2403
# Body
# {
.annotate 'line', 2405
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2406
.return(self)
# }
.annotate 'line', 2407

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2408
# Body
# {
.annotate 'line', 2410
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2411

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2412
# Body
# {
.annotate 'line', 2414
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2415
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2416

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2417
# Body
# {
.annotate 'line', 2419
self.'optimizearg'()
.annotate 'line', 2420
.return(self)
# }
.annotate 'line', 2421

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2393
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2395
addattribute $P0, 'lexpr'
.annotate 'line', 2396
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2428
# Body
# {
.annotate 'line', 2430
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2431

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2432
# Body
# {
.annotate 'line', 2434
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2435
.return(self)
# }
.annotate 'line', 2436

.end # set


.sub 'optimize' :method

.annotate 'line', 2437
# Body
# {
.annotate 'line', 2439
self.'optimizearg'()
.annotate 'line', 2440
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2441
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2442
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2443
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2446
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2447
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2448
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2449
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2452
.return(self)
# }
.annotate 'line', 2453

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2454
# Body
# {
.annotate 'line', 2456
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2457
self.'annotate'(__ARG_1)
.annotate 'line', 2458
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2459

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2426
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2466
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkResult' :method

.annotate 'line', 2467
# Body
# {
.annotate 'line', 2469
.return('I')
# }
.annotate 'line', 2470

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2471
# Body
# {
.annotate 'line', 2473
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2474
.return(self)
# }
.annotate 'line', 2475

.end # set


.sub 'optimize' :method

.annotate 'line', 2476
# Body
# {
.annotate 'line', 2478
self.'optimizearg'()
.annotate 'line', 2479
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2480
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2481
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2482
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2483
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2485
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2486
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2487
.return(self)
# }
.annotate 'line', 2488

.end # optimize


.sub 'negated' :method

.annotate 'line', 2489
# Body
# {
.annotate 'line', 2491
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2492

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2493
# Body
# {
.annotate 'line', 2495
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2496
self.'annotate'(__ARG_1)
.annotate 'line', 2497
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2498
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2500
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2503
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2506
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2508

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2464
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2515
# Body
# {
.annotate 'line', 2517
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2518

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2519
# Body
# {
.annotate 'line', 2521
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2522
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2523
.return(self)
# }
.annotate 'line', 2524

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2525
# Body
# {
.annotate 'line', 2527
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2528
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2529
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2530

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2531
# Body
# {
.annotate 'line', 2533
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2534
self.'annotate'(__ARG_1)
.annotate 'line', 2535
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2536
.return($S1)
# }
.annotate 'line', 2537

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2513
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2544
# Body
# {
.annotate 'line', 2546
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2547
.return(self)
# }
.annotate 'line', 2548

.end # set


.sub 'checkResult' :method

.annotate 'line', 2549
# Body
# {
.annotate 'line', 2551
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2552

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2553
# Body
# {
.annotate 'line', 2555
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2556
self.'annotate'(__ARG_1)
.annotate 'line', 2557
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2558
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2559
.return($S1)
# }
.annotate 'line', 2560

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2542
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2567
# Body
# {
.annotate 'line', 2569
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2570

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2571
# Body
# {
.annotate 'line', 2573
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2574
.return(self)
# }
.annotate 'line', 2575

.end # set


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
.annotate 'line', 2580
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2581

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2582
# Body
# {
.annotate 'line', 2584
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2585
self.'annotate'(__ARG_1)
.annotate 'line', 2586
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2587
.return($S1)
# }
.annotate 'line', 2588

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2565
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2595
# Body
# {
.annotate 'line', 2597
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2598
.return(self)
# }
.annotate 'line', 2599

.end # set


.sub 'checkResult' :method

.annotate 'line', 2600
# Body
# {
.annotate 'line', 2602
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2603

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2604
# Body
# {
.annotate 'line', 2606
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2607
self.'annotate'(__ARG_1)
.annotate 'line', 2608
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2609
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2610
.return($S1)
# }
.annotate 'line', 2611

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2593
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2620
# Body
# {
.annotate 'line', 2622
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2623
setattribute self, 'eleft', __ARG_3
.annotate 'line', 2624
setattribute self, 'eright', __ARG_4
.annotate 'line', 2625
.return(self)
# }
.annotate 'line', 2626

.end # set


.sub 'checkResult' :method

.annotate 'line', 2627
# Body
# {
.annotate 'line', 2629
getattribute $P2, self, 'eleft'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2630
getattribute $P3, self, 'eleft'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2632
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2633

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2634
# Body
# {
.annotate 'line', 2636
getattribute $P3, self, 'eleft'
$P2 = $P3.'optimize'()
setattribute self, 'eleft', $P2
.annotate 'line', 2637
getattribute $P3, self, 'eright'
$P2 = $P3.'optimize'()
setattribute self, 'eright', $P2
.annotate 'line', 2638
.return(self)
# }
.annotate 'line', 2639

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2640
# Body
# {
.annotate 'line', 2642
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2643

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2616
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2618
addattribute $P0, 'eleft'
.annotate 'line', 2619
addattribute $P0, 'eright'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2650
# Body
# {
.annotate 'line', 2652
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2653
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
# {
.annotate 'line', 2654
self.'annotate'(__ARG_1)
.annotate 'line', 2655
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2657

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2658
# Body
# {
.annotate 'line', 2660
self.'annotate'(__ARG_1)
.annotate 'line', 2661
# var eleft: $P1
getattribute $P1, self, 'eleft'
.annotate 'line', 2662
getattribute $P2, self, 'eright'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2663

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2648
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2670
# Body
# {
.annotate 'line', 2672
self.'annotate'(__ARG_1)
.annotate 'line', 2673
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2674
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2675
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2676

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2677
# Body
# {
.annotate 'line', 2679
self.'annotate'(__ARG_1)
.annotate 'line', 2680
# string reg: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2681
# string reg2: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2682
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2683
.return($S1)
# }
.annotate 'line', 2684

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2668
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2691
# Body
# {
.annotate 'line', 2693
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2694
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2695
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2696

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2697
# Body
# {
.annotate 'line', 2699
# string ltype: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2700
# string rtype: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2701
# string reg: $S3
getattribute $P4, self, 'eleft'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2702
# string reg2: $S4
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2703
self.'annotate'(__ARG_1)
.annotate 'line', 2704
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
# {
.annotate 'line', 2705
isne $I2, $S2, 'S'
unless $I2 goto __label_6
# {
.annotate 'line', 2706
# string aux: $S5
$P5 = self.'tempreg'('S')
null $S5
if_null $P5, __label_7
set $S5, $P5
__label_7:
.annotate 'line', 2707
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2708
# }
__label_6: # endif
.annotate 'line', 2710
__ARG_1.'emitconcat'($S3, $S3, $S4)
# }
goto __label_5
__label_4: # else
.annotate 'line', 2713
__ARG_1.'emitaddto'($S3, $S4)
__label_5: # endif
.annotate 'line', 2714
.return($S3)
# }
.annotate 'line', 2715

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2689
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2722
# Body
# {
.annotate 'line', 2724
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2725
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2726
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2727

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2728
# Body
# {
.annotate 'line', 2730
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2731
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2732
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2733
self.'annotate'(__ARG_1)
.annotate 'line', 2734
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2735
.return($S2)
# }
.annotate 'line', 2736

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2720
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2743
# Body
# {
.annotate 'line', 2745
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2746
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2747
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2748

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2749
# Body
# {
.annotate 'line', 2751
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2752
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2753
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2754
self.'annotate'(__ARG_1)
.annotate 'line', 2755
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2756
.return($S2)
# }
.annotate 'line', 2757

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2741
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2764
# Body
# {
.annotate 'line', 2766
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2767
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2768
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2769

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2770
# Body
# {
.annotate 'line', 2772
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2773
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2774
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2775
self.'annotate'(__ARG_1)
.annotate 'line', 2776
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2777
.return($S2)
# }
.annotate 'line', 2778

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2762
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2785
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2786
# Body
# {
.annotate 'line', 2788
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2789
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2790
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2791
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2792
self.'annotate'(__ARG_1)
.annotate 'line', 2793
# string aux: $S5
null $S5
.annotate 'line', 2794
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2796
iseq $I2, $S1, 'I'
unless $I2 goto __label_7
# {
.annotate 'line', 2797
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2798
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2799
# }
__label_7: # endif
.annotate 'line', 2801
iseq $I1, $S2, 'I'
unless $I1 goto __label_8
# {
.annotate 'line', 2802
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2803
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2804
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2807
iseq $I2, $S2, 'I'
unless $I2 goto __label_11
iseq $I2, $S1, 'P'
__label_11:
unless $I2 goto __label_9
# {
.annotate 'line', 2808
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2809
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2810
# }
goto __label_10
__label_9: # else
.annotate 'line', 2812
iseq $I3, $S2, 'P'
unless $I3 goto __label_14
iseq $I3, $S1, 'I'
__label_14:
unless $I3 goto __label_12
# {
.annotate 'line', 2813
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2814
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2815
# }
goto __label_13
__label_12: # else
.annotate 'line', 2817
iseq $I3, $S2, 'S'
unless $I3 goto __label_17
iseq $I3, $S1, 'P'
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 2818
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2819
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2820
# }
goto __label_16
__label_15: # else
.annotate 'line', 2822
iseq $I4, $S2, 'P'
unless $I4 goto __label_19
iseq $I4, $S1, 'S'
__label_19:
unless $I4 goto __label_18
# {
.annotate 'line', 2823
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2824
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2825
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 2828
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
# }
.annotate 'line', 2829

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2830
# Body
# {
.annotate 'line', 2832
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2833

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2783
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2845
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'isnegable' :method

.annotate 'line', 2846
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2847
# Body
# {
.annotate 'line', 2849
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2850
setattribute self, 'expr', __ARG_2
.annotate 'line', 2851
.return(self)
# }
.annotate 'line', 2852

.end # set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 2841
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2843
addattribute $P0, 'expr'
.end
.namespace [ 'OpIsNullExpr' ]

.sub 'negated' :method

.annotate 'line', 2857
# Body
# {
.annotate 'line', 2859
# var n: $P1
new $P1, [ 'OpNotNullExpr' ]
.annotate 'line', 2860
getattribute $P2, self, 'owner'
getattribute $P3, self, 'start'
$P1.'initexpr'($P2, $P3)
.annotate 'line', 2861
getattribute $P3, self, 'expr'
setattribute $P1, 'expr', $P3
.annotate 'line', 2862
.return($P1)
# }
.annotate 'line', 2863

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2864
# Body
# {
.annotate 'line', 2866
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2867
self.'annotate'(__ARG_1)
.annotate 'line', 2868
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2869

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpIsNullExpr' ]
.annotate 'line', 2855
get_class $P1, [ 'NullCheckerExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotNullExpr' ]

.sub 'negated' :method

.annotate 'line', 2874
# Body
# {
.annotate 'line', 2876
# var n: $P1
new $P1, [ 'OpIsNullExpr' ]
.annotate 'line', 2877
getattribute $P2, self, 'owner'
getattribute $P3, self, 'start'
$P1.'initexpr'($P2, $P3)
.annotate 'line', 2878
getattribute $P3, self, 'expr'
setattribute $P1, 'expr', $P3
.annotate 'line', 2879
.return($P1)
# }
.annotate 'line', 2880

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2881
# Body
# {
.annotate 'line', 2883
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2884
self.'annotate'(__ARG_1)
.annotate 'line', 2885
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2886
__ARG_1.'say'('not ', __ARG_2)
# }
.annotate 'line', 2887

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotNullExpr' ]
.annotate 'line', 2872
get_class $P1, [ 'NullCheckerExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2894
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2895
# Body
# {
.annotate 'line', 2897
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 2898

.end # negated


.sub 'optimize' :method

.annotate 'line', 2899
# Body
# {
.annotate 'line', 2901
self.'optimizearg'()
.annotate 'line', 2902
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2903
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2904
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2905
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2906
unless $I1 goto __label_0
# {
.annotate 'line', 2907
unless $I2 goto __label_1
.annotate 'line', 2908
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 2910
new $P6, [ 'OpIsNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2912
unless $I2 goto __label_3
.annotate 'line', 2913
new $P4, [ 'OpIsNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2914
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2915
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2916
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2917
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2918
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2919
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2920
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2923
.return(self)
# }
.annotate 'line', 2924

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2925
# Body
# {
.annotate 'line', 2927
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2928

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2929
# Body
# {
.annotate 'line', 2931
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2932

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 2892
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2939
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2940
# Body
# {
.annotate 'line', 2942
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 2943

.end # negated


.sub 'optimize' :method

.annotate 'line', 2944
# Body
# {
.annotate 'line', 2946
self.'optimizearg'()
.annotate 'line', 2947
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2948
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2949
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2950
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2951
unless $I1 goto __label_0
# {
.annotate 'line', 2952
unless $I2 goto __label_1
.annotate 'line', 2953
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 2955
new $P6, [ 'OpNotNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2957
unless $I2 goto __label_3
.annotate 'line', 2958
new $P4, [ 'OpNotNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2959
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2960
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2961
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2962
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2963
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2964
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2965
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2968
.return(self)
# }
.annotate 'line', 2969

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2970
# Body
# {
.annotate 'line', 2972
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2973

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2974
# Body
# {
.annotate 'line', 2976
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2977

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 2937
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSameExpr' ]

.sub 'OpSameExpr' :method
.param int __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 2985
# Body
# {
.annotate 'line', 2987
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 2988
setattribute self, 'positive', $P1
# }
.annotate 'line', 2989

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 2990
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2991
# Body
# {
.annotate 'line', 2993
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 2994
new $P2, [ 'OpSameExpr' ]
not $I2, $I1
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
getattribute $P5, self, 'lexpr'
getattribute $P6, self, 'rexpr'
$P2.'OpSameExpr'($I2, $P3, $P4, $P5, $P6)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 2995

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2996
# Body
# {
.annotate 'line', 2998
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 2999
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3000
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3001

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3002
# Body
# {
.annotate 'line', 3004
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3005

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 2982
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 2984
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3012
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3013
# Body
# {
.annotate 'line', 3015
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3016

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3017
# Body
# {
.annotate 'line', 3019
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3020

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3010
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3027
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3028
# Body
# {
.annotate 'line', 3030
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3031

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3032
# Body
# {
.annotate 'line', 3034
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3035

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3025
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3042
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3043
# Body
# {
.annotate 'line', 3045
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3046

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3047
# Body
# {
.annotate 'line', 3049
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3050

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3040
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3057
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3058
# Body
# {
.annotate 'line', 3060
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3061

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3062
# Body
# {
.annotate 'line', 3064
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3065

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3055
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3072
# Body
# {
.annotate 'line', 3074
.return('I')
# }
.annotate 'line', 3075

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3070
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3082
# Body
# {
.annotate 'line', 3084
self.'optimizearg'()
.annotate 'line', 3085
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3086
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3087
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3088
isne $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 3089
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3091
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3093
.return(self)
# }
.annotate 'line', 3094

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3095
# Body
# {
.annotate 'line', 3097
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
.annotate 'line', 3098
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3099
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3100
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3101
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3102
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3103
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3106
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3107
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3108
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 3109
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3110
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3112

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3080
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3119
# Body
# {
.annotate 'line', 3121
self.'optimizearg'()
.annotate 'line', 3122
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3123
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3124
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3125
iseq $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 3126
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3128
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3130
.return(self)
# }
.annotate 'line', 3131

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3132
# Body
# {
.annotate 'line', 3134
# string res: $S1
null $S1
.annotate 'line', 3135
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3138
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3139
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3140
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3141
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3142
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3143
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3144
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3147
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3148
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3149
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3150
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3151
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3153

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3117
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3160
# Body
# {
.annotate 'line', 3162
.return('I')
# }
.annotate 'line', 3163

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3158
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3170
# Body
# {
.annotate 'line', 3172
self.'optimizearg'()
.annotate 'line', 3173
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3174
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3175
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3176
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3177
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3178
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3180
.return(self)
# }
.annotate 'line', 3181

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3182
# Body
# {
.annotate 'line', 3184
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
.annotate 'line', 3185
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3186
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3187
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3188
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3189
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3190

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3168
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3197
# Body
# {
.annotate 'line', 3199
self.'optimizearg'()
.annotate 'line', 3200
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3201
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3202
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3203
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3204
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3205
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3207
.return(self)
# }
.annotate 'line', 3208

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3209
# Body
# {
.annotate 'line', 3211
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
.annotate 'line', 3212
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3213
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3214
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3215
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3216
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3217

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3195
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddExpr' ]

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
$I4 = $P1.'isliteral'()
unless $I4 goto __label_1
$I4 = $P2.'isliteral'()
__label_1:
unless $I4 goto __label_0
# {
.annotate 'line', 3230
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_2
set $S1, $P10
__label_2:
.annotate 'line', 3231
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_3
set $S2, $P10
__label_3:
.annotate 'line', 3232
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3233
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3234
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3235
# var t: $P5
null $P5
.annotate 'line', 3236
# int newtype: $I1
null $I1
.annotate 'line', 3237
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
.annotate 'line', 3241
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_9
set $S3, $P11
__label_9:
.annotate 'line', 3242
# string rs: $S4
getattribute $P12, $P4, 'str'
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
concat $S5, $S3, $S4
.annotate 'line', 3243
$P5 = 'newTokenFrom'($I1, $S5, $P3)
.annotate 'line', 3244
new $P14, [ 'StringLiteral' ]
getattribute $P15, self, 'owner'
$P14.'StringLiteral'($P15, $P5)
set $P13, $P14
.return($P13)
# }
__label_4: # endif
.annotate 'line', 3246
iseq $I5, $S1, 'I'
unless $I5 goto __label_12
iseq $I5, $S2, 'I'
__label_12:
unless $I5 goto __label_11
# {
.annotate 'line', 3247
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3248
# int ln: $I2
set $P13, $P6
set $I2, $P13
.annotate 'line', 3249
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3250
# int rn: $I3
set $P14, $P7
set $I3, $P14
.annotate 'line', 3251
getattribute $P15, self, 'owner'
getattribute $P16, self, 'start'
add $I6, $I2, $I3
.tailcall 'integerValue'($P15, $P16, $I6)
# }
__label_11: # endif
# {
.annotate 'line', 3254
$P16 = 'floatresult'($S1, $S2)
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 3255
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3256
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3257
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3258
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3259
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P17, $P18, $N3)
# }
__label_13: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3263
.return(self)
# }
.annotate 'line', 3264

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3265
# Body
# {
.annotate 'line', 3267
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3268
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3269
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3270
.return($S1)
__label_2: # endif
.annotate 'line', 3271
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3272
.return('S')
__label_3: # endif
.annotate 'line', 3273
iseq $I2, $S1, 'S'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3274
.return('S')
__label_5: # endif
.annotate 'line', 3275
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3276
.return('N')
__label_7: # endif
.annotate 'line', 3277
.return('I')
# }
.annotate 'line', 3278

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3279
# Body
# {
.annotate 'line', 3281
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3282
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3283
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3284
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3285
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3287
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3288
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3289
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
# {
.annotate 'line', 3290
isne $I2, $S2, 'S'
if $I2 goto __label_8
isne $I2, $S3, 'S'
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 3291
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3292
isne $I1, $S2, 'S'
unless $I1 goto __label_10
# {
.annotate 'line', 3293
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3294
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3297
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3298
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3301
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3304
iseq $I2, $S1, 'I'
unless $I2 goto __label_14
isne $I2, $S2, 'I'
if $I2 goto __label_15
isne $I2, $S3, 'I'
__label_15:
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3305
# string l: $S7
null $S7
.annotate 'line', 3306
iseq $I3, $S2, 'I'
unless $I3 goto __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3308
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3309
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3311
# string r: $S8
null $S8
.annotate 'line', 3312
iseq $I3, $S3, 'I'
unless $I3 goto __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3314
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3315
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3317
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3320
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3322

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3222
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3329
# Body
# {
.annotate 'line', 3331
self.'optimizearg'()
.annotate 'line', 3332
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3333
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3334
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3335
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3336
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3337
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3338
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3339
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3340
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3341
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3342
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3345
.return(self)
# }
.annotate 'line', 3346

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3347
# Body
# {
.annotate 'line', 3349
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3350
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3351
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3352
.return($S1)
__label_2: # endif
.annotate 'line', 3353
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3354
.return('N')
__label_3: # endif
.annotate 'line', 3355
iseq $I2, $S1, 'N'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3356
.return('N')
__label_5: # endif
.annotate 'line', 3357
.return('I')
# }
.annotate 'line', 3358

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3359
# Body
# {
.annotate 'line', 3361
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3362
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3363
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3364

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3327
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3371
# Body
# {
.annotate 'line', 3373
self.'optimizearg'()
.annotate 'line', 3374
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3375
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3376
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3377
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3378
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3379
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3380
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3381
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3382
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3383
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3384
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
set $I5, $I1
set $I6, $I2
mul $I4, $I5, $I6
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3387
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3388
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3389
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3390
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3391
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3392
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3396
.return(self)
# }
.annotate 'line', 3397

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3398
# Body
# {
.annotate 'line', 3400
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3401
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3402
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3403
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3404
.return($S1)
__label_2: # endif
.annotate 'line', 3405
iseq $I1, $S1, 'S'
unless $I1 goto __label_3
.annotate 'line', 3406
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3408
.return('N')
__label_4: # endif
# }
.annotate 'line', 3409

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3410
# Body
# {
.annotate 'line', 3412
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3413
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3414
# var ltype: $P3
$P3 = $P1.'checkResult'()
.annotate 'line', 3415
$S10 = $P3
iseq $I3, $S10, 'S'
unless $I3 goto __label_0
# {
.annotate 'line', 3416
# string lreg: $S1
$P4 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 3417
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 3418
# string rval: $S3
null $S3
.annotate 'line', 3419
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
.annotate 'line', 3424
$P6 = self.'tempreg'('I')
set $S3, $P6
.annotate 'line', 3425
__ARG_1.'emitset'($S3, $S2)
__label_3: # switch end
.annotate 'line', 3427
self.'annotate'(__ARG_1)
.annotate 'line', 3428
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S1, ', ', $S3)
.annotate 'line', 3429
.return()
# }
__label_0: # endif
.annotate 'line', 3434
$S11 = $P3
iseq $I3, $S11, 'N'
unless $I3 goto __label_6
# {
.annotate 'line', 3435
# string lreg: $S4
$P5 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_7
set $S4, $P5
__label_7:
.annotate 'line', 3436
# string rreg: $S5
$P6 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P6, __label_8
set $S5, $P6
__label_8:
.annotate 'line', 3437
# string rval: $S6
null $S6
.annotate 'line', 3438
$P7 = $P2.'checkResult'()
set $S12, $P7
set $S13, 'I'
if $S12 == $S13 goto __label_11
set $S13, 'N'
if $S12 == $S13 goto __label_12
goto __label_10
# switch
__label_11: # case
.annotate 'line', 3440
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3441
__ARG_1.'emitset'($S6, $S5)
set $S6, $S5
goto __label_9 # break
__label_12: # case
set $S6, $S5
goto __label_9 # break
__label_10: # default
.annotate 'line', 3448
$P9 = self.'tempreg'('N')
set $S6, $P9
.annotate 'line', 3449
__ARG_1.'emitset'($S6, $S5)
__label_9: # switch end
.annotate 'line', 3451
self.'annotate'(__ARG_1)
.annotate 'line', 3452
__ARG_1.'say'('mul ', __ARG_2, ', ', $S4, ', ', $S6)
.annotate 'line', 3453
.return()
# }
__label_6: # endif
.annotate 'line', 3456
# string rleft: $S7
null $S7
.annotate 'line', 3457
# string rright: $S8
null $S8
.annotate 'line', 3458
# int nleft: $I1
null $I1
.annotate 'line', 3459
# int nright: $I2
null $I2
.annotate 'line', 3460
$P7 = $P1.'issimple'()
isfalse $I4, $P7
if $I4 goto __label_15
$I4 = $P1.'isidentifier'()
__label_15:
unless $I4 goto __label_13
# {
.annotate 'line', 3461
$P9 = self.'checkResult'()
$P8 = self.'tempreg'($P9)
set $S7, $P8
.annotate 'line', 3462
$P1.'emit'(__ARG_1, $S7)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 3465
$P10 = $P1.'getIntegerValue'()
set $I1, $P10
set $S7, $I1
.annotate 'line', 3466
# }
__label_14: # endif
.annotate 'line', 3468
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_18
$I4 = $P2.'isidentifier'()
__label_18:
unless $I4 goto __label_16
# {
.annotate 'line', 3469
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S8, $P11
.annotate 'line', 3470
$P2.'emit'(__ARG_1, $S8)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 3473
# string type: $S9
$P11 = $P2.'checkResult'()
null $S9
if_null $P11, __label_19
set $S9, $P11
__label_19:
set $S12, $S9
set $S13, 'S'
.annotate 'line', 3474
if $S12 == $S13 goto __label_22
set $S13, 'I'
if $S12 == $S13 goto __label_23
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3476
$P13 = self.'checkResult'()
$P12 = self.'tempreg'($P13)
set $S8, $P12
.annotate 'line', 3477
$P2.'emit'(__ARG_1, $S8)
goto __label_20 # break
__label_23: # case
__label_21: # default
.annotate 'line', 3481
$P14 = $P2.'getIntegerValue'()
set $I2, $P14
set $S8, $I2
goto __label_20 # break
__label_20: # switch end
.annotate 'line', 3483
# }
__label_17: # endif
.annotate 'line', 3486
self.'annotate'(__ARG_1)
.annotate 'line', 3487
__ARG_1.'say'('mul ', __ARG_2, ', ', $S7, ', ', $S8)
# }
.annotate 'line', 3488

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3369
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3495
# Body
# {
.annotate 'line', 3497
self.'optimizearg'()
.annotate 'line', 3498
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3499
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3500
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3501
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3502
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3503
# var lval: $P3
null $P3
.annotate 'line', 3504
# var rval: $P4
null $P4
.annotate 'line', 3505
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3506
getattribute $P3, $P1, 'numval'
.annotate 'line', 3507
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3508
getattribute $P4, $P2, 'numval'
.annotate 'line', 3509
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3510
isne $I4, $I2, 0
unless $I4 goto __label_6
.annotate 'line', 3511
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
.annotate 'line', 3514
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3515
getattribute $P3, $P1, 'numval'
.annotate 'line', 3516
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3517
getattribute $P4, $P2, 'numval'
.annotate 'line', 3518
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3519
isne $I4, $N2, $N3
unless $I4 goto __label_8
.annotate 'line', 3520
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
.annotate 'line', 3524
.return(self)
# }
.annotate 'line', 3525

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3526
# Body
# {
.annotate 'line', 3528
.return('N')
# }
.annotate 'line', 3529

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3530
# Body
# {
.annotate 'line', 3532
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3533
# var lreg: $P2
null $P2
.annotate 'line', 3534
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_0
.annotate 'line', 3535
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3537
$P2 = self.'tempreg'('N')
.annotate 'line', 3538
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3540
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3541
# var rreg: $P4
null $P4
.annotate 'line', 3542
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_2
.annotate 'line', 3543
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3545
$P4 = self.'tempreg'('N')
.annotate 'line', 3546
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3548
self.'annotate'(__ARG_1)
.annotate 'line', 3549
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3550

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3493
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3557
# Body
# {
.annotate 'line', 3559
.return('I')
# }
.annotate 'line', 3560

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3561
# Body
# {
.annotate 'line', 3563
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3564
# var lreg: $P2
null $P2
.annotate 'line', 3565
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3566
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3568
$P2 = self.'tempreg'('I')
.annotate 'line', 3569
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3571
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3572
# var rreg: $P4
null $P4
.annotate 'line', 3573
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3574
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3576
$P4 = self.'tempreg'('I')
.annotate 'line', 3577
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3579
self.'annotate'(__ARG_1)
.annotate 'line', 3580
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3581

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3555
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3588
# Body
# {
.annotate 'line', 3590
.return('I')
# }
.annotate 'line', 3591

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3592
# Body
# {
.annotate 'line', 3594
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3595
# var lreg: $P2
null $P2
.annotate 'line', 3596
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3597
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3599
$P2 = self.'tempreg'('I')
.annotate 'line', 3600
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3602
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3603
# var rreg: $P4
null $P4
.annotate 'line', 3604
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3605
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3607
$P4 = self.'tempreg'('I')
.annotate 'line', 3608
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3610
self.'annotate'(__ARG_1)
.annotate 'line', 3615
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3616

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3586
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3625
# Body
# {
.annotate 'line', 3627
setattribute self, 'arg', __ARG_1
.annotate 'line', 3628
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3629

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3630
# Body
# {
.annotate 'line', 3632
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3633
.return(self)
# }
.annotate 'line', 3634

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3635
# Body
# {
.annotate 'line', 3637
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3638

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3623
addattribute $P0, 'arg'
.annotate 'line', 3624
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3641
# Body
# {
.annotate 'line', 3643
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3644
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3645
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3646
.return(1)
# }
.annotate 'line', 3647

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3656
# Body
# {
.annotate 'line', 3658
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3659
setattribute self, 'predef', __ARG_3
.annotate 'line', 3660
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3661

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3662
# Body
# {
.annotate 'line', 3664
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3665

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3666
# Body
# {
.annotate 'line', 3668
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3669
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3670
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3671
# var arg: $P4
null $P4
.annotate 'line', 3672
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3673
iseq $I4, $I1, -1
unless $I4 goto __label_0
# {
.annotate 'line', 3674
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3675
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3676
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3680
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3681
# int i: $I3
null $I3
goto __label_7
__label_5: # for iteration
inc $I3
__label_7: # for condition
islt $I4, $I3, $I2
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 3682
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3683
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3684
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3685
# string argr: $S4
null $S4
.annotate 'line', 3686
iseq $I5, $S2, $S3
if $I5 goto __label_12
iseq $I5, $S3, '?'
__label_12:
unless $I5 goto __label_10
.annotate 'line', 3687
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3689
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3690
iseq $I5, $S3, 'P'
unless $I5 goto __label_13
# {
.annotate 'line', 3691
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3692
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
.annotate 'line', 3697
isne $I6, $S5, ''
unless $I6 goto __label_19
.annotate 'line', 3698
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3700
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3702
$P3.'push'($S4)
# }
goto __label_5 # for iteration
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3705
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3706

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3651
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3653
addattribute $P0, 'predef'
.annotate 'line', 3654
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3716
# Body
# {
.annotate 'line', 3718
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3719
setattribute self, 'funref', __ARG_4
.annotate 'line', 3720
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3721
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3722
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3723
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3724
# {
.annotate 'line', 3725
# var modifier: $P2
null $P2
.annotate 'line', 3726
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3727
$P1 = __ARG_1.'get'()
.annotate 'line', 3728
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3729
$P1 = __ARG_1.'get'()
.annotate 'line', 3730
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3731
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3732
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3735
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3738
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3739
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3740
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3741
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3743

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3744
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3745
# Body
# {
.annotate 'line', 3747
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3748
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3749
'optimize_array'($P1)
.annotate 'line', 3752
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3753
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3754
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3755
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3756
isnull $I1, $P3
not $I1
unless $I1 goto __label_2
# {
.annotate 'line', 3757
self.'use_predef'($S1)
.annotate 'line', 3760
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3761
isnull $I2, $P4
not $I2
unless $I2 goto __label_3
# {
.annotate 'line', 3762
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3763
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3766
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
.annotate 'line', 3770
.return(self)
# }
.annotate 'line', 3771

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3772
# Body
# {
.annotate 'line', 3774
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3775
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3776
# string call: $S1
null $S1
.annotate 'line', 3777
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3778
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 3779
iseq $I6, $S1, ''
unless $I6 goto __label_2
# {
.annotate 'line', 3780
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S8, "'", $S2
concat $S1, $S8, "'"
.annotate 'line', 3781
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3785
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 3787
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3788
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 3789
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 3790
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 3791
# string reg: $S3
null $S3
.annotate 'line', 3792
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 3793
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 3794
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 3797
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 3798
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 3800
self.'annotate'(__ARG_1)
.annotate 'line', 3802
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 3803
$S9 = __ARG_2
iseq $I7, $S9, '.tailcall'
unless $I7 goto __label_12
.annotate 'line', 3804
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 3806
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 3809
unless $I1 goto __label_14
.annotate 'line', 3810
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 3812
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 3814
__ARG_1.'print'('(')
.annotate 'line', 3816
# string sep: $S4
set $S4, ''
.annotate 'line', 3817
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 3818
# int i: $I3
null $I3
goto __label_18
__label_16: # for iteration
inc $I3
__label_18: # for condition
islt $I7, $I3, $I2
unless $I7 goto __label_17 # for end
# {
.annotate 'line', 3819
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 3820
__ARG_1.'print'($S4, $S5)
.annotate 'line', 3821
# int isflat: $I4
null $I4
.annotate 'line', 3822
# int isnamed: $I5
null $I5
.annotate 'line', 3823
# string setname: $S6
set $S6, ''
.annotate 'line', 3824
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 3825
isnull $I8, $P6
not $I8
unless $I8 goto __label_19
# {
.annotate 'line', 3826
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 3827
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 3828
iseq $I8, $S7, 'flat'
unless $I8 goto __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 3830
iseq $I9, $S7, 'named'
unless $I9 goto __label_24
# {
set $I5, 1
.annotate 'line', 3832
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
.annotate 'line', 3836
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 3837
$P17 = $P8.'isstringliteral'()
isfalse $I11, $P17
unless $I11 goto __label_29
.annotate 'line', 3838
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 3839
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 3842
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
.annotate 'line', 3847
and $I10, $I11, $I12
unless $I10 goto __label_30
.annotate 'line', 3848
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 3849
unless $I4 goto __label_32
.annotate 'line', 3850
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 3851
unless $I5 goto __label_34
# {
.annotate 'line', 3852
__ARG_1.'print'(' :named')
.annotate 'line', 3853
isne $I12, $S6, ''
unless $I12 goto __label_35
.annotate 'line', 3854
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 3856
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 3858
__ARG_1.'say'(')')
# }
.annotate 'line', 3859

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 3711
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3713
addattribute $P0, 'funref'
.annotate 'line', 3714
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3869
# Body
# {
.annotate 'line', 3871
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3872
setattribute self, 'left', __ARG_4
.annotate 'line', 3873
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 3874

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 3875
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3876
# Body
# {
.annotate 'line', 3878
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3879
.return(self)
# }
.annotate 'line', 3880

.end # optimize


.sub 'get_member' :method

.annotate 'line', 3881
# Body
# {
.annotate 'line', 3883
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 3884

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 3885
# Body
# {
.annotate 'line', 3887
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 3888
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3889
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3890
isne $I1, $S1, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3891
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 3892
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 3893
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 3895
.return($S2)
# }
.annotate 'line', 3896

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3897
# Body
# {
.annotate 'line', 3899
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3900
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3901
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3902
self.'annotate'(__ARG_1)
.annotate 'line', 3903
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 3904
.return($S3)
# }
.annotate 'line', 3905

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3906
# Body
# {
.annotate 'line', 3908
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3909
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3910
self.'annotate'(__ARG_1)
.annotate 'line', 3911
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 3912

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3913
# Body
# {
.annotate 'line', 3915
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3916
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3917
# string value: $S3
null $S3
.annotate 'line', 3918
iseq $I1, __ARG_2, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3920
iseq $I2, __ARG_3, 'null'
unless $I2 goto __label_4
# {
.annotate 'line', 3921
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 3922
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 3924
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3927
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 3928
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 3930
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 3931

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3932
# Body
# {
.annotate 'line', 3934
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3935
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3936
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3937
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 3938
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3940
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 3941
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
isne $I1, $S5, 'P'
unless $I1 goto __label_6
.annotate 'line', 3942
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 3944
# }
__label_4: # endif
.annotate 'line', 3946
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 3947
.return($S3)
# }
.annotate 'line', 3948

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 3864
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3866
addattribute $P0, 'left'
.annotate 'line', 3867
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3957
# Body
# {
.annotate 'line', 3959
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3960
setattribute self, 'left', __ARG_4
.annotate 'line', 3961
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 3962

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 3963
# Body
# {
.annotate 'line', 3965
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
iseq $I1, $S1, 'S'
unless $I1 goto __label_0
.annotate 'line', 3966
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 3968
.return('P')
__label_1: # endif
# }
.annotate 'line', 3969

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3970
# Body
# {
.annotate 'line', 3972
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3973
self.'optimizeargs'()
.annotate 'line', 3974
.return(self)
# }
.annotate 'line', 3975

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3976
# Body
# {
.annotate 'line', 3978
# var regleft: $P1
null $P1
.annotate 'line', 3979
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 3980
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 3982
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 3983
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 3984
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3985
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 3986
iseq $I2, $S1, 'S'
unless $I2 goto __label_3
# {
.annotate 'line', 3987
isne $I3, $I1, 1
unless $I3 goto __label_5
.annotate 'line', 3988
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 3989
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3992
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 3993
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3994
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 3996

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3997
# Body
# {
.annotate 'line', 3999
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4000
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4001
self.'annotate'(__ARG_1)
.annotate 'line', 4002
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4003
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4004
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4005

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4006
# Body
# {
.annotate 'line', 4008
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4009
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4010
# string rreg: $S1
null $S1
.annotate 'line', 4011
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4012
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4013
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4016
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4017
self.'annotate'(__ARG_1)
.annotate 'line', 4018
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4019
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4020
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4021
.return($S1)
# }
.annotate 'line', 4022

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 3953
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 3955
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4031
# Body
# {
.annotate 'line', 4033
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4034
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4035
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4036
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4037
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4038
# {
.annotate 'line', 4039
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4040
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4041
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4042
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4043
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4045

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 4046
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4047
# Body
# {
.annotate 'line', 4049
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4050
.return(self)
# }
.annotate 'line', 4051

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4052
# Body
# {
.annotate 'line', 4054
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4055
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4056

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4057
# Body
# {
.annotate 'line', 4059
self.'annotate'(__ARG_1)
.annotate 'line', 4060
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4061
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4062
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4063
# string itemreg: $S3
null $S3
.annotate 'line', 4064
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 4065
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 4066
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
.annotate 'line', 4068
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 4069
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 4073
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 4075
self.'annotate'(__ARG_1)
.annotate 'line', 4076
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 4078
.return($S1)
# }
.annotate 'line', 4079

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4027
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4029
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4089
# Body
# {
.annotate 'line', 4091
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4092
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4093
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 4094
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4095
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 4096
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4097
# {
.annotate 'line', 4098
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4099
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4100
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4101
$P2.'push'($P4)
.annotate 'line', 4102
$P3.'push'($P5)
# }
.annotate 'line', 4104
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 4105
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 4106
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4108
setattribute self, 'keys', $P2
.annotate 'line', 4109
setattribute self, 'values', $P3
# }
.annotate 'line', 4110

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 4111
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4112
# Body
# {
.annotate 'line', 4114
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4115
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4116
.return(self)
# }
.annotate 'line', 4117

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4118
# Body
# {
.annotate 'line', 4120
self.'annotate'(__ARG_1)
.annotate 'line', 4121
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 4122
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4123
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4124
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4125
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 4126
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4127
# string item: $S1
null $S1
.annotate 'line', 4128
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 4129
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 4130
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4131
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 4134
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4136
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4137
# string itemreg: $S3
null $S3
.annotate 'line', 4138
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4139
# string s: $S4
$P8 = $P4.'checkIdentifier'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4140
isnull $I3, $S4
not $I3
unless $I3 goto __label_11
isne $I3, $S4, ''
__label_11:
unless $I3 goto __label_9
set $S3, $S4
goto __label_10
__label_9: # else
.annotate 'line', 4141
# {
.annotate 'line', 4143
# string id: $S5
$P8 = $P4.'getName'()
null $S5
if_null $P8, __label_12
set $S5, $P8
__label_12:
.annotate 'line', 4144
getattribute $P10, self, 'owner'
$P9 = $P10.'getvar'($S5)
isnull $I4, $P9
unless $I4 goto __label_13
# {
.annotate 'line', 4145
$P11 = self.'tempreg'('P')
set $S3, $P11
.annotate 'line', 4146
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_14
__label_13: # else
.annotate 'line', 4149
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_14: # endif
# }
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4153
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4154
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 4156

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4157
# Body
# {
.annotate 'line', 4159
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4160
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4161
.return($S1)
# }
.annotate 'line', 4162

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4084
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4086
addattribute $P0, 'keys'
.annotate 'line', 4087
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 4171
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4172
# Body
# {
.annotate 'line', 4176
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4177
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4178
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4179
__ARG_1.'unget'($P2)
.annotate 'line', 4180
# var initializer: $P3
root_new $P5, ['parrot';'ResizablePMCArray']
set $P3, $P5
__label_1: # do
.annotate 'line', 4181
# {
.annotate 'line', 4182
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4183
$P3.'push'($P4)
# }
.annotate 'line', 4184
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4185
setattribute self, 'initializer', $P3
.annotate 'line', 4186
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4188

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4167
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4169
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4197
# Body
# {
.annotate 'line', 4199
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4201
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4202
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4203
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4204
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4205
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4206
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4207
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4208
# {
.annotate 'line', 4209
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4210
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4211
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4212
$P2.'push'($P3)
# }
.annotate 'line', 4213
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4214
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4217
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4220
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4222
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4223
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4225
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4226

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4227
# Body
# {
.annotate 'line', 4229
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4230
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4233
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4234
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4235
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4236
$P5 = $P3['id']
isnull $I2, $P5
not $I2
unless $I2 goto __label_4
# {
.annotate 'line', 4237
$P1 = $P3['value']
.annotate 'line', 4238
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4239
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4240
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4243
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4247
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4248
isnull $I3, $P4
not $I3
unless $I3 goto __label_7
.annotate 'line', 4249
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4250
.return(self)
# }
.annotate 'line', 4251

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4252
# Body
# {
.annotate 'line', 4254
self.'annotate'(__ARG_1)
.annotate 'line', 4256
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4257
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
.annotate 'line', 4262
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4263
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4264
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
.annotate 'line', 4266
# string reginit: $S1
set $S1, ''
.annotate 'line', 4267
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4268
# string constructor: $S3
null $S3
set $I4, $I1
null $I5
.annotate 'line', 4269
if $I4 == $I5 goto __label_11
set $I5, 1
if $I4 == $I5 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4273
iseq $I6, $I2, 1
unless $I6 goto __label_13
.annotate 'line', 4274
$P10 = self.'tempreg'('P')
set $S2, $P10
goto __label_14
__label_13: # else
# {
.annotate 'line', 4276
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4277
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S1, ', ', $S1
.annotate 'line', 4278
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4282
isne $I4, $I2, 1
unless $I4 goto __label_16
isne $I4, $I2, 2
__label_16:
unless $I4 goto __label_15
.annotate 'line', 4283
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_15: # endif
.annotate 'line', 4284
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_9: # switch end
set $I5, $I2
null $I6
.annotate 'line', 4287
if $I5 == $I6 goto __label_19
set $I6, 2
if $I5 == $I6 goto __label_20
set $I6, 1
if $I5 == $I6 goto __label_21
goto __label_18
# switch
__label_19: # case
.annotate 'line', 4290
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_22
set $S4, $P14
__label_22:
.annotate 'line', 4291
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4292
isnull $I7, $P3
unless $I7 goto __label_23
concat $S7, "Can't locate class ", $S4
concat $S6, $S7, " at compile time"
.annotate 'line', 4293
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_23: # endif
.annotate 'line', 4297
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4298
isgt $I8, $I1, 1
unless $I8 goto __label_24
# {
.annotate 'line', 4299
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_24: # endif
goto __label_17 # break
__label_20: # case
.annotate 'line', 4303
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4304
# predefined elements
elements $I8, $P4
sub $I7, $I8, 1
$S3 = $P4[$I7]
.annotate 'line', 4305
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_17 # break
__label_21: # case
.annotate 'line', 4308
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4309
isnull $I9, $P5
unless $I9 goto __label_25
# {
.annotate 'line', 4311
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4312
isnull $I9, $P6
not $I9
unless $I9 goto __label_27
# {
.annotate 'line', 4313
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4316
'Warn'('Checking: new unknown type')
.annotate 'line', 4317
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4319
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_26
__label_25: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4323
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_17 # break
__label_18: # default
.annotate 'line', 4327
'InternalError'('Unexpected type in new')
__label_17: # switch end
.annotate 'line', 4329
isgt $I10, $I1, 1
if $I10 goto __label_30
isgt $I10, $I1, 0
unless $I10 goto __label_31
iseq $I10, $I2, 1
__label_31:
__label_30:
unless $I10 goto __label_29
# {
.annotate 'line', 4330
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4331
iter $P21, $P1
set $P21, 0
__label_32: # for iteration
unless $P21 goto __label_33
shift $P8, $P21
# {
.annotate 'line', 4332
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_34
set $S5, $P22
__label_34:
.annotate 'line', 4333
$P7.'push'($S5)
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 4335
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4336
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4337
__ARG_1.'say'(")")
.annotate 'line', 4338
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4340

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4193
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4195
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4349
# Body
# {
.annotate 'line', 4351
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4352
setattribute self, 'owner', __ARG_2
.annotate 'line', 4353
# var nskey: $P1
new $P3, [ 'ClassSpecifierParrotKey' ]
$P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4354
setattribute self, 'nskey', $P1
.annotate 'line', 4355
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4356
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4357
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4359
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4360

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4361
# Body
# {
.annotate 'line', 4363
# string reginit: $S1
null $S1
.annotate 'line', 4364
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4365
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
.annotate 'line', 4366
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4370
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4371
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4374
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4376
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4377
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4378
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4379
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4380
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4381
isnull $I3, $S1
not $I3
unless $I3 goto __label_7
.annotate 'line', 4382
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4383
__ARG_1.'say'()
# }
.annotate 'line', 4384

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4345
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4347
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4393
# Body
# {
.annotate 'line', 4395
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4396
setattribute self, 'owner', __ARG_2
.annotate 'line', 4397
# var nskey: $P1
new $P3, [ 'ClassSpecifierId' ]
$P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4398
setattribute self, 'nskey', $P1
.annotate 'line', 4399
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4400
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4401
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4403
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4404

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4405
# Body
# {
.annotate 'line', 4407
# string reginit: $S1
null $S1
.annotate 'line', 4408
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4410
# int numinits: $I1
isnull $I2, $P1
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4411
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4412
isgt $I2, $I1, 0
unless $I2 goto __label_3
.annotate 'line', 4413
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4414
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4415
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4416
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4417
__ARG_1.'say'()
.annotate 'line', 4419
isgt $I3, $I1, 0
unless $I3 goto __label_4
# {
.annotate 'line', 4420
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4421
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4422
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4423
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4425
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4426
__ARG_1.'print'($S2, ".'", $S4, "'(")
# predefined join
.annotate 'line', 4427
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4428
__ARG_1.'say'(")")
.annotate 'line', 4429
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4431

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4389
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4391
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4436
# Body
# {
.annotate 'line', 4438
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4440
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4442
new $P5, [ 'CallExpr' ]
.annotate 'line', 4443
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4442
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4445
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4447
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4449
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4452
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4453
__ARG_1.'unget'($P2)
.annotate 'line', 4454
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4456
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4460
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
.annotate 'line', 4465
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4467

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4476
# Body
# {
.annotate 'line', 4478
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4479
setattribute self, 'eleft', __ARG_3
.annotate 'line', 4480
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4481

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4482
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4483
# Body
# {
.annotate 'line', 4485
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4486
# string checkedval: $S1
null $S1
.annotate 'line', 4487
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4488
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S3, "'", $S1
concat $S1, $S3, "'"
.annotate 'line', 4489
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4493
# string r: $S2
getattribute $P3, self, 'eleft'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4494
self.'annotate'(__ARG_1)
.annotate 'line', 4495
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4496

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4471
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4473
addattribute $P0, 'eleft'
.annotate 'line', 4474
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4511
# Body
# {
.annotate 'line', 4513
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4514
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4515
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4516
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4517
.return(self)
# }
.annotate 'line', 4518

.end # set


.sub 'optimize' :method

.annotate 'line', 4519
# Body
# {
.annotate 'line', 4521
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4522
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
.annotate 'line', 4524
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4526
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4528
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4529
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4530
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4532

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4533
# Body
# {
.annotate 'line', 4535
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4536

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4537
# Body
# {
.annotate 'line', 4539
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4540
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4541
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4542
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4543
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4544
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4545
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4546
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4547

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4501
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4507
addattribute $P0, 'condition'
.annotate 'line', 4508
addattribute $P0, 'etrue'
.annotate 'line', 4509
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
# Constant Code_same evaluated at compile time
# Constant Code_not_same evaluated at compile time
# Constant Code_instanceof evaluated at compile time

.sub 'getOpCode_2'
.param pmc __ARG_1

.annotate 'line', 4583
# Body
# {
.annotate 'line', 4585
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
.annotate 'line', 4586
.return(1)
__label_3: # case
.annotate 'line', 4587
.return(2)
__label_4: # case
.annotate 'line', 4588
.return(3)
__label_1: # default
.annotate 'line', 4589
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4591

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4593
# Body
# {
.annotate 'line', 4595
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
.annotate 'line', 4596
.return(8)
__label_3: # case
.annotate 'line', 4597
.return(11)
__label_4: # case
.annotate 'line', 4598
.return(9)
__label_5: # case
.annotate 'line', 4599
.return(10)
__label_1: # default
.annotate 'line', 4600
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4602

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4604
# Body
# {
.annotate 'line', 4606
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
.annotate 'line', 4607
.return(19)
__label_3: # case
.annotate 'line', 4608
.return(20)
__label_4: # case
.annotate 'line', 4609
.return(21)
__label_5: # case
.annotate 'line', 4610
.return(22)
__label_1: # default
.annotate 'line', 4611
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4613

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 4615
# Body
# {
.annotate 'line', 4617
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '=='
if $S1 == $S2 goto __label_2
set $S2, '!='
if $S1 == $S2 goto __label_3
set $S2, '==='
if $S1 == $S2 goto __label_4
set $S2, '!=='
if $S1 == $S2 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4618
.return(12)
__label_3: # case
.annotate 'line', 4619
.return(13)
__label_4: # case
.annotate 'line', 4620
.return(25)
__label_5: # case
.annotate 'line', 4621
.return(26)
__label_1: # default
.annotate 'line', 4623
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 4624
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 4626

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4628
# Body
# {
.annotate 'line', 4630
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
.annotate 'line', 4631
.return(14)
__label_3: # case
.annotate 'line', 4632
.return(16)
__label_4: # case
.annotate 'line', 4633
.return(15)
__label_5: # case
.annotate 'line', 4634
.return(17)
__label_1: # default
.annotate 'line', 4635
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4637

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4639
# Body
# {
.annotate 'line', 4641
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
.annotate 'line', 4642
.return(4)
__label_3: # case
.annotate 'line', 4643
.return(5)
__label_4: # case
.annotate 'line', 4644
.return(6)
__label_5: # case
.annotate 'line', 4645
.return(18)
__label_6: # case
.annotate 'line', 4646
.return(23)
__label_7: # case
.annotate 'line', 4647
.return(24)
__label_1: # default
.annotate 'line', 4648
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4650

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4652
# Body
# {
.annotate 'line', 4654
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4656
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4657
# var expr: $P2
null $P2
.annotate 'line', 4658
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4659
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4660
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4661
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4663
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4664
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4665
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4666
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4667
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4668
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4669
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4670
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4671
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4672
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4673
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4674
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4675
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4676
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 4677
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 4678
new $P15, [ 'IdentifierExpr' ]
.tailcall $P15.'set'(__ARG_2, $P1)
__label_8: # endif
.annotate 'line', 4679
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4680

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4682
# Body
# {
.annotate 'line', 4684
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4685
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4687
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4688
# var t: $P2
null $P2
.annotate 'line', 4689
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4690
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
set $I3, $I1
set $I4, 1
.annotate 'line', 4691
if $I3 == $I4 goto __label_4
set $I4, 2
if $I3 == $I4 goto __label_5
set $I4, 3
if $I3 == $I4 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4693
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4696
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4699
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4702
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4705
__ARG_1.'unget'($P2)
.annotate 'line', 4706
.return($P1)
# }
.annotate 'line', 4707

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4709
# Body
# {
.annotate 'line', 4711
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4713
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4714
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4715
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4716
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4717
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4718
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4721
__ARG_1.'unget'($P2)
.annotate 'line', 4722
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4724

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4726
# Body
# {
.annotate 'line', 4728
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4729
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4730
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4732
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4733
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4734
# var subexpr: $P2
null $P2
.annotate 'line', 4735
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4736
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4737
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4738
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
.annotate 'line', 4740
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4743
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4746
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4749
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4752
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4754
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4757
__ARG_1.'unget'($P1)
.annotate 'line', 4758
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4760
.return($P2)
# }
.annotate 'line', 4761

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4763
# Body
# {
.annotate 'line', 4765
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4766
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4768
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4769
# var t: $P2
null $P2
.annotate 'line', 4770
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4771
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4772
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4773
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4774
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
.annotate 'line', 4776
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4779
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4782
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4785
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4788
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 4790
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4791
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4793
__ARG_1.'unget'($P2)
.annotate 'line', 4794
.return($P1)
# }
.annotate 'line', 4795

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4797
# Body
# {
.annotate 'line', 4799
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 4801
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4802
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4803
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 4804
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4805
# var expr: $P4
null $P4
.annotate 'line', 4806
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 4807
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 4809
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 4810
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4812
__ARG_1.'unget'($P2)
.annotate 'line', 4813
.return($P1)
# }
.annotate 'line', 4814

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4816
# Body
# {
.annotate 'line', 4818
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 4819
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 4821
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4822
# var eright: $P2
null $P2
.annotate 'line', 4823
# var t: $P3
null $P3
.annotate 'line', 4824
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4825
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
set $I3, $I1
set $I4, 12
.annotate 'line', 4826
if $I3 == $I4 goto __label_4
set $I4, 13
if $I3 == $I4 goto __label_5
set $I4, 25
if $I3 == $I4 goto __label_6
set $I4, 26
if $I3 == $I4 goto __label_7
set $I4, 27
if $I3 == $I4 goto __label_8
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4828
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4829
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 4832
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4833
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 4836
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4837
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 4840
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4841
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 4844
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 4847
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4850
__ARG_1.'unget'($P3)
.annotate 'line', 4851
.return($P1)
# }
.annotate 'line', 4852

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4854
# Body
# {
.annotate 'line', 4856
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 4857
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 4859
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4860
# var t: $P2
null $P2
.annotate 'line', 4861
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4862
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4863
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 4864
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
.annotate 'line', 4866
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 4869
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 4872
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 4875
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 4878
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4881
__ARG_1.'unget'($P2)
.annotate 'line', 4882
.return($P1)
# }
.annotate 'line', 4883

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4885
# Body
# {
.annotate 'line', 4887
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 4889
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4890
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4891
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4892
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4893
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4895
__ARG_1.'unget'($P2)
.annotate 'line', 4896
.return($P1)
# }
.annotate 'line', 4897

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4899
# Body
# {
.annotate 'line', 4901
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 4903
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4904
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4905
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4906
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4907
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4909
__ARG_1.'unget'($P2)
.annotate 'line', 4910
.return($P1)
# }
.annotate 'line', 4911

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4913
# Body
# {
.annotate 'line', 4915
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 4917
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4918
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4919
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4920
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4921
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4923
__ARG_1.'unget'($P2)
.annotate 'line', 4924
.return($P1)
# }
.annotate 'line', 4925

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4927
# Body
# {
.annotate 'line', 4929
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 4931
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4932
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4933
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4934
# var eright: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 4935
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4937
__ARG_1.'unget'($P2)
.annotate 'line', 4938
.return($P1)
# }
.annotate 'line', 4939

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4941
# Body
# {
.annotate 'line', 4943
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4944
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 4946
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4947
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4948
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 4949
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4950
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4951
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4952
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4955
__ARG_1.'unget'($P2)
.annotate 'line', 4956
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 4958

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4960
# Body
# {
.annotate 'line', 4962
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4963
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 4964
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 4966
# var eleft: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4967
# var t: $P2
null $P2
.annotate 'line', 4968
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4969
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4970
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4971
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 4972
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
.annotate 'line', 4974
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4977
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4980
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4983
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 4986
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 4989
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4992
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 4994
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4995
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4997
__ARG_1.'unget'($P2)
.annotate 'line', 4998
.return($P1)
# }
.annotate 'line', 4999

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5001
# Body
# {
.annotate 'line', 5003
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5005
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5006

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5019
# Body
# {
.annotate 'line', 5021
getattribute $P1, self, 'brlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5022
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5023
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5024
setattribute self, 'brlabel', $P2
.annotate 'line', 5025
.return($S1)
# }
.annotate 'line', 5026

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5027
# Body
# {
.annotate 'line', 5029
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5030
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 5031
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5032
.return($P1)
# }
.annotate 'line', 5033

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5017
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5040
# Body
# {
.annotate 'line', 5042
getattribute $P1, self, 'cntlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5043
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5044
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5045
setattribute self, 'cntlabel', $P2
.annotate 'line', 5046
.return($S1)
# }
.annotate 'line', 5047

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5048
# Body
# {
.annotate 'line', 5050
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5051
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 5052
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5053
.return($P1)
# }
.annotate 'line', 5054

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5036
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5038
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5068
# Body
# {
.annotate 'line', 5070
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5071
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5072
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 5073
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5074
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5075
# {
.annotate 'line', 5076
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5077
$P2.'push'($P3)
# }
.annotate 'line', 5078
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5080
'RequireOp'(';', $P1)
.annotate 'line', 5081
setattribute self, 'values', $P2
# }
.annotate 'line', 5082

.end # parse


.sub 'optimize' :method

.annotate 'line', 5083
# Body
# {
.annotate 'line', 5085
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5086
.return(self)
# }
.annotate 'line', 5087

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5088
# Body
# {
.annotate 'line', 5090
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 5091
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5092
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5095
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5096
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5098
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5099
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5100
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5101
self.'annotate'(__ARG_1)
.annotate 'line', 5102
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5106
# int i: $I2
null $I2
goto __label_7
__label_5: # for iteration
inc $I2
__label_7: # for condition
islt $I4, $I2, $I1
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 5107
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5108
# string reg: $S1
null $S1
.annotate 'line', 5109
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5110
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5111
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5114
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 5115
$P1.'push'($S1)
# }
goto __label_5 # for iteration
__label_6: # for end
.annotate 'line', 5117
self.'annotate'(__ARG_1)
.annotate 'line', 5118
self.'emitret'(__ARG_1)
.annotate 'line', 5119
# string sep: $S2
set $S2, ''
.annotate 'line', 5120
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5121
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5122
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5124
__ARG_1.'say'(')')
# }
.annotate 'line', 5125

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5064
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5066
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5130
# Body
# {
.annotate 'line', 5132
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5133

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5134
# Body
# {
.annotate 'line', 5136
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5137

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5128
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5142
# Body
# {
.annotate 'line', 5144
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5145

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5146
# Body
# {
.annotate 'line', 5148
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5149

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5140
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5160
# Body
# {
.annotate 'line', 5162
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5163
setattribute self, 'name', __ARG_1
.annotate 'line', 5164
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5165
setattribute self, 'value', $P2
.annotate 'line', 5166
.return(self)
# }
.annotate 'line', 5167

.end # set


.sub 'optimize' :method

.annotate 'line', 5168
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5169
# Body
# {
.annotate 'line', 5171
self.'annotate'(__ARG_1)
.annotate 'line', 5172
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5173
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 5174
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5175

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5156
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5158
addattribute $P0, 'name'
.annotate 'line', 5159
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5186
# Body
# {
.annotate 'line', 5188
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5189
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5190
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5191
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5192
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5193
setattribute self, 'label', $P1
.annotate 'line', 5194
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5195

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5196
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5197
# Body
# {
.annotate 'line', 5199
self.'annotate'(__ARG_1)
.annotate 'line', 5200
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5201
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5202
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5203

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5182
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5184
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5212
# Body
# {
.annotate 'line', 5214
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5215
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5216
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5217

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5210
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

.annotate 'line', 5228
# Body
# {
.annotate 'line', 5230
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5231
self.'parsecondition'(__ARG_2)
.annotate 'line', 5232
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5233
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5234
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5235
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5237
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5238
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5240

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5241
# Body
# {
.annotate 'line', 5243
self.'optimize_condition'()
.annotate 'line', 5244
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5245
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5246
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5247
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5249
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5251
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5253
.return(self)
# }
.annotate 'line', 5254

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5255
# Body
# {
.annotate 'line', 5257
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5258
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5259
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5260
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5261
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5262
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5263
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5264
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5265
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5266
self.'annotate'(__ARG_1)
.annotate 'line', 5267
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5268
$P1.'emit'(__ARG_1)
.annotate 'line', 5270
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5271
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5272
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5273
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5275
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5276

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5224
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5226
addattribute $P0, 'truebranch'
.annotate 'line', 5227
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5286
# Body
# {
.annotate 'line', 5288
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5289

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5290
# Body
# {
.annotate 'line', 5292
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5293
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5295
self.'annotate'(__ARG_1)
.annotate 'line', 5296
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5297
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5298
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5299
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5300

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5283
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5285
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5309
# Body
# {
.annotate 'line', 5311
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5312
self.'parsecondition'(__ARG_2)
.annotate 'line', 5313
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5314

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5315
# Body
# {
.annotate 'line', 5317
self.'optimize_condition'()
.annotate 'line', 5318
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5319
.return(self)
# }
.annotate 'line', 5320

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5321
# Body
# {
.annotate 'line', 5323
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5325
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5328
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5331
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5332
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5334
self.'annotate'(__ARG_1)
.annotate 'line', 5335
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5336
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5337
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5338
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5339
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5341

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5307
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

.annotate 'line', 5350
# Body
# {
.annotate 'line', 5352
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5353
self.'parsebody'(__ARG_2)
.annotate 'line', 5354
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5355
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5356

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5357
# Body
# {
.annotate 'line', 5359
self.'optimize_condition'()
.annotate 'line', 5360
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5361
.return(self)
# }
.annotate 'line', 5362

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5363
# Body
# {
.annotate 'line', 5365
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5367
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5370
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5371
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5372
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5374
self.'annotate'(__ARG_1)
.annotate 'line', 5375
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5377
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5378
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5379
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5381

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5348
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

.annotate 'line', 5390
# Body
# {
.annotate 'line', 5392
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5393
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5394

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5395
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5396
# Body
# {
.annotate 'line', 5398
self.'annotate'(__ARG_1)
.annotate 'line', 5399
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5400
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5401

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5388
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5410
# Body
# {
.annotate 'line', 5412
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5413
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5414

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5415
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5416
# Body
# {
.annotate 'line', 5418
self.'annotate'(__ARG_1)
.annotate 'line', 5419
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5420
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5421

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5408
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5435
# Body
# {
.annotate 'line', 5437
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5438
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5439
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5440
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5441
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5442
$P1 = __ARG_2.'get'()
.annotate 'line', 5443
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5444
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5445
$P1 = __ARG_2.'get'()
.annotate 'line', 5446
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5447
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5448
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5449
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5450
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5451
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5452
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5453
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5454
$P1 = __ARG_2.'get'()
.annotate 'line', 5455
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5456
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5457
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5458
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
.annotate 'line', 5459
__ARG_2.'unget'($P1)
.annotate 'line', 5460
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5462
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5463
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5466
$P1 = __ARG_2.'get'()
.annotate 'line', 5467
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5468
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5469
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
.annotate 'line', 5470
__ARG_2.'unget'($P1)
.annotate 'line', 5471
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5473
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5476

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5477
# Body
# {
.annotate 'line', 5479
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5480
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5481
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5482
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5483
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5484
.return(self)
# }
.annotate 'line', 5485

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5486
# Body
# {
.annotate 'line', 5489
# string type: $S1
set $S1, ''
.annotate 'line', 5490
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5491
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5492
iseq $I3, $S2, 'N'
unless $I3 goto __label_3
.annotate 'line', 5493
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5494
iseq $I3, $S1, ''
unless $I3 goto __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5496
isne $I4, $S1, $S2
unless $I4 goto __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5497
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5500
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5501
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
iseq $I4, $S9, $S1
unless $I4 goto __label_8
.annotate 'line', 5502
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5504
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5505
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5509
self.'genbreaklabel'()
.annotate 'line', 5510
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5511
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5512
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5513
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5514
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5515
$P2.'push'($S7)
.annotate 'line', 5516
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5517
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5519
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5522
__ARG_1.'comment'('switch')
.annotate 'line', 5523
self.'annotate'(__ARG_1)
.annotate 'line', 5524
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5525
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5526
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5527
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5528
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5529
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5530
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5531
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5534
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5535
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5536
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5538
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5539

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5428
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5430
addattribute $P0, 'condition'
.annotate 'line', 5431
addattribute $P0, 'case_value'
.annotate 'line', 5432
addattribute $P0, 'case_st'
.annotate 'line', 5433
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5552
# Body
# {
.annotate 'line', 5554
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5555
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5556
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5557
__ARG_2.'unget'($P1)
.annotate 'line', 5558
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5560
$P1 = __ARG_2.'get'()
.annotate 'line', 5561
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5562
__ARG_2.'unget'($P1)
.annotate 'line', 5563
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P5
.annotate 'line', 5564
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5566
$P1 = __ARG_2.'get'()
.annotate 'line', 5567
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5568
__ARG_2.'unget'($P1)
.annotate 'line', 5569
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P6
.annotate 'line', 5570
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5572
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5573

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5574
# Body
# {
.annotate 'line', 5576
getattribute $P1, self, 'initializer'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5577
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5578
getattribute $P1, self, 'condition'
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 5579
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
__label_1: # endif
.annotate 'line', 5580
getattribute $P5, self, 'iteration'
isnull $I2, $P5
not $I2
unless $I2 goto __label_2
.annotate 'line', 5581
getattribute $P8, self, 'iteration'
$P7 = $P8.'optimize'()
setattribute self, 'iteration', $P7
__label_2: # endif
.annotate 'line', 5582
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5583
.return(self)
# }
.annotate 'line', 5584

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5585
# Body
# {
.annotate 'line', 5587
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5588
getattribute $P2, self, 'condition'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5589
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5590
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5591
.return()
# }
__label_0: # endif
.annotate 'line', 5593
__ARG_1.'comment'('for loop')
.annotate 'line', 5594
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5595
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5596
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5597
getattribute $P4, self, 'initializer'
isnull $I1, $P4
not $I1
unless $I1 goto __label_6
.annotate 'line', 5598
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5599
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5601
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5602
getattribute $P4, self, 'iteration'
isnull $I2, $P4
not $I2
unless $I2 goto __label_7
.annotate 'line', 5603
# string unused: $S4
getattribute $P6, self, 'iteration'
$P5 = $P6.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
__label_7: # endif
.annotate 'line', 5605
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5606
getattribute $P6, self, 'condition'
isnull $I2, $P6
not $I2
unless $I2 goto __label_9
# {
.annotate 'line', 5607
# string regcond: $S5
getattribute $P8, self, 'condition'
$P7 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P7, __label_10
set $S5, $P7
__label_10:
.annotate 'line', 5608
__ARG_1.'say'('unless ', $S5, ' goto ', $S2, ' # for end')
# }
__label_9: # endif
.annotate 'line', 5611
getattribute $P7, self, 'body'
$P7.'emit'(__ARG_1)
.annotate 'line', 5612
__ARG_1.'emitgoto'($S1, 'for iteration')
.annotate 'line', 5614
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5615

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5546
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5548
addattribute $P0, 'initializer'
.annotate 'line', 5549
addattribute $P0, 'condition'
.annotate 'line', 5550
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5627
# Body
# {
.annotate 'line', 5629
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5630
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5631
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5632
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5633
isne $I1, $S2, ''
unless $I1 goto __label_2
# {
.annotate 'line', 5634
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5636
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5638
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5639
setattribute self, 'varname', $P1
.annotate 'line', 5640
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5641
$P2 = __ARG_2.'get'()
.annotate 'line', 5642
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5643
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5644
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5645

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5646
# Body
# {
.annotate 'line', 5648
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 5649
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5650
.return(self)
# }
.annotate 'line', 5651

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5652
# Body
# {
.annotate 'line', 5654
self.'annotate'(__ARG_1)
.annotate 'line', 5655
# string regcont: $S1
null $S1
.annotate 'line', 5656
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
iseq $I1, $S6, 'S'
unless $I1 goto __label_0
# {
.annotate 'line', 5657
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5658
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5659
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5662
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5663
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5664
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5665
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5666
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5667
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5668
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5669
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5670
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5671
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5672
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5673
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5674
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5675

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5622
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5624
addattribute $P0, 'varname'
.annotate 'line', 5625
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5680
# Body
# {
.annotate 'line', 5682
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5683
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5684
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5685
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5686
__ARG_2.'unget'($P3)
.annotate 'line', 5687
__ARG_2.'unget'($P2)
.annotate 'line', 5688
__ARG_2.'unget'($P1)
.annotate 'line', 5689
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5690
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5692
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5693

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5703
# Body
# {
.annotate 'line', 5705
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5706
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5707

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5708
# Body
# {
.annotate 'line', 5710
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5711
.return(self)
# }
.annotate 'line', 5712

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5713
# Body
# {
.annotate 'line', 5715
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5716
self.'annotate'(__ARG_1)
.annotate 'line', 5717
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5718

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5699
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5701
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5732
# Body
# {
.annotate 'line', 5734
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5735
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5736
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5737
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5740
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5742
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5743
$P1 = __ARG_2.'get'()
.annotate 'line', 5744
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5745
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5746
$P1 = __ARG_2.'get'()
.annotate 'line', 5747
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5748
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5749
$P1 = __ARG_2.'get'()
.annotate 'line', 5750
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5751
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5752
setattribute self, 'exname', $P1
.annotate 'line', 5753
self.'createvar'($S1, 'P')
.annotate 'line', 5754
$P1 = __ARG_2.'get'()
.annotate 'line', 5755
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5756
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5758
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5759

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5760
# Body
# {
.annotate 'line', 5762
getattribute $P1, self, 'modifiers'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5763
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5764
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5765
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 5766
.return(self)
# }
.annotate 'line', 5767

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5768
# Body
# {
.annotate 'line', 5770
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5771
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5772
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5773
# string exreg: $S4
null $S4
.annotate 'line', 5774
getattribute $P8, self, 'exname'
isnull $I3, $P8
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 5775
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5776
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5779
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5781
self.'annotate'(__ARG_1)
.annotate 'line', 5782
__ARG_1.'comment'('try: create handler')
.annotate 'line', 5784
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 5785
__ARG_1.'say'('set_addr ', $S1, ', ', $S2)
.annotate 'line', 5787
getattribute $P10, self, 'modifiers'
isnull $I3, $P10
not $I3
unless $I3 goto __label_5
# {
.annotate 'line', 5788
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 5789
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 5790
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 5791
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 5792
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 5795
isne $I4, $I1, 1
unless $I4 goto __label_14
.annotate 'line', 5796
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 5797
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 5798
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 5799
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 5802
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 5803
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5804
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 5805
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5807
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 5808
# string sep: $S7
set $S7, ''
.annotate 'line', 5809
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 5810
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 5811
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 5813
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 5816
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 5821
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 5822
__ARG_1.'comment'('try: begin')
.annotate 'line', 5823
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 5824
__ARG_1.'comment'('try: end')
.annotate 'line', 5826
self.'annotate'(__ARG_1)
.annotate 'line', 5827
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5829
__ARG_1.'comment'('catch')
.annotate 'line', 5830
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5831
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 5832
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 5833
__ARG_1.'say'('pop_eh')
.annotate 'line', 5834
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 5836
__ARG_1.'comment'('catch end')
.annotate 'line', 5837
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 5838

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 5725
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 5727
addattribute $P0, 'stry'
.annotate 'line', 5728
addattribute $P0, 'modifiers'
.annotate 'line', 5729
addattribute $P0, 'exname'
.annotate 'line', 5730
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5849
# Body
# {
.annotate 'line', 5851
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5852
setattribute self, 'name', __ARG_3
.annotate 'line', 5853
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5854
setattribute self, 'reg', $P2
# }
.annotate 'line', 5855

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 5845
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5847
addattribute $P0, 'name'
.annotate 'line', 5848
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5872
# Body
# {
.annotate 'line', 5874
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5875
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5876
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5877
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5878
setattribute self, 'name', $P1
.annotate 'line', 5879
# string reg: $S1
null $S1
.annotate 'line', 5881
$P1 = __ARG_2.'get'()
.annotate 'line', 5882
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 5884
setattribute self, 'typearray', $P5
.annotate 'line', 5885
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 5886
$P1 = __ARG_2.'get'()
.annotate 'line', 5887
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 5889
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 5892
__ARG_2.'unget'($P1)
.annotate 'line', 5893
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 5894
$P1 = __ARG_2.'get'()
.annotate 'line', 5895
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 5896
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 5897
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 5902
setattribute self, 'typearray', $P8
.annotate 'line', 5903
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 5904
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5906
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 5907
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 5911
setattribute self, 'reg', $P11
.annotate 'line', 5912
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 5914
$P1 = __ARG_2.'get'()
.annotate 'line', 5915
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 5916
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 5917
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 5918
$P1 = __ARG_2.'get'()
.annotate 'line', 5919
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 5920
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 5921
# {
.annotate 'line', 5922
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5923
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 5924
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 5925
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 5926
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 5928
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 5930
$P16 = $P1.'isop'(';')
isfalse $I3, $P16
unless $I3 goto __label_14
.annotate 'line', 5931
'SyntaxError'("Expected ';'", $P1)
__label_14: # endif
# }
.annotate 'line', 5932

.end # parse


.sub 'optimize' :method

.annotate 'line', 5933
# Body
# {
.annotate 'line', 5935
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 5936
getattribute $P2, self, 'size'
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
.annotate 'line', 5937
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 5938
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
# {
.annotate 'line', 5939
getattribute $P2, self, 'typearray'
set $I3, $P2
iseq $I2, $I3, 0
unless $I2 goto __label_2
.annotate 'line', 5940
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 5942
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 5944
.return(self)
# }
.annotate 'line', 5945

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5946
# Body
# {
.annotate 'line', 5948
self.'annotate'(__ARG_1)
.annotate 'line', 5949
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 5950
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5951
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 5952
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 5953
# var init: $P1
getattribute $P1, self, 'init'
concat $S13, $S1, ' '
concat $S12, $S13, $S2
concat $S11, $S12, ': '
concat $S10, $S11, $S3
.annotate 'line', 5954
__ARG_1.'comment'($S10)
.annotate 'line', 5956
getattribute $P6, self, 'typearray'
set $I4, $P6
iseq $I3, $I4, 0
unless $I3 goto __label_4
# {
.annotate 'line', 5957
isnull $I5, $P1
if $I5 goto __label_8
$I5 = $P1.'isnull'()
__label_8:
unless $I5 goto __label_6
.annotate 'line', 5958
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 5960
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 5961
iseq $I3, $S5, $S4
unless $I3 goto __label_10
# {
.annotate 'line', 5962
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 5965
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_12
# {
.annotate 'line', 5967
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 5970
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 5971
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 5972
iseq $I5, $S4, 'S'
unless $I5 goto __label_17
iseq $I5, $S5, 'P'
__label_17:
unless $I5 goto __label_15
# {
.annotate 'line', 5973
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 5974
__ARG_1.'emitnull'($S3)
.annotate 'line', 5975
__ARG_1.'say'('if_null ', $S6, ', ', $S7)
.annotate 'line', 5976
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 5977
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 5980
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
.annotate 'line', 5986
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 5987
isnull $I6, $P2
not $I6
unless $I6 goto __label_19
# {
.annotate 'line', 5989
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 5990
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 5994
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 5996
isnull $I6, $P1
not $I6
unless $I6 goto __label_22
# {
.annotate 'line', 5997
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 5998
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 5999
isnull $I7, $P2
unless $I7 goto __label_24
# {
.annotate 'line', 6000
isgt $I8, $I1, 0
unless $I8 goto __label_25
# {
.annotate 'line', 6002
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 6005
# int i: $I2
null $I2
.annotate 'line', 6006
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 6007
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6008
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6009
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6013

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6014
# Body
# {
.annotate 'line', 6016
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6017

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 5862
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5864
addattribute $P0, 'name'
.annotate 'line', 5865
addattribute $P0, 't_reg'
.annotate 'line', 5866
addattribute $P0, 't_name'
.annotate 'line', 5867
addattribute $P0, 't_array'
.annotate 'line', 5868
addattribute $P0, 'reg'
.annotate 'line', 5869
addattribute $P0, 'typearray'
.annotate 'line', 5870
addattribute $P0, 'size'
.annotate 'line', 5871
addattribute $P0, 'init'
.end
.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6030
# Body
# {
.annotate 'line', 6033
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6034
setattribute self, 'type', $P1
.annotate 'line', 6035
setattribute self, 'name', __ARG_4
.annotate 'line', 6036
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6037

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6038
# Body
# {
.annotate 'line', 6040
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6041
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6042
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6043
$P1 = $P1.'optimize'()
.annotate 'line', 6044
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6046
getattribute $P4, self, 'start'
.annotate 'line', 6045
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6048
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6049
setattribute self, 'value', $P1
.annotate 'line', 6050
.return(self)
# }
.annotate 'line', 6051

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 6052
# Body
# {
.annotate 'line', 6054
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6055

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6056
# Body
# {
.annotate 'line', 6058
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S3, 'Constant ', $S1
concat $S2, $S3, ' evaluated at compile time'
.annotate 'line', 6059
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6060

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6024
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6026
addattribute $P0, 'type'
.annotate 'line', 6027
addattribute $P0, 'name'
.annotate 'line', 6028
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6063
# Body
# {
.annotate 'line', 6065
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6066
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6067
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6068
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6070
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6071
# {
.annotate 'line', 6072
$P1 = __ARG_2.'get'()
.annotate 'line', 6073
# var name: $P3
set $P3, $P1
.annotate 'line', 6074
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6075
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6077
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6076
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6078
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6079
.return($P2)
# }
.annotate 'line', 6080

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6089
# Body
# {
.annotate 'line', 6091
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6092
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6093
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6094
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6095
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6097
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6098
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6099

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6100
# Body
# {
.annotate 'line', 6102
getattribute $P1, self, 'init'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 6103
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6104
.return(self)
# }
.annotate 'line', 6105

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6106
# Body
# {
.annotate 'line', 6108
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6109

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6110
# Body
# {
.annotate 'line', 6112
self.'annotate'(__ARG_1)
.annotate 'line', 6113
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6114
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6115
# var init: $P1
getattribute $P1, self, 'init'
concat $S7, 'var ', $S1
concat $S6, $S7, ': '
concat $S5, $S6, $S2
.annotate 'line', 6116
__ARG_1.'comment'($S5)
.annotate 'line', 6117
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
.annotate 'line', 6118
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6120
isnull $I1, $P1
not $I1
unless $I1 goto __label_4
# {
.annotate 'line', 6121
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6122
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
.annotate 'line', 6124
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6129
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 6130
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 6131
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6134
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6138
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6139

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6086
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6088
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6144
# Body
# {
.annotate 'line', 6146
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6147
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6148
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6149
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6150

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6151
# Body
# {
.annotate 'line', 6153
self.'annotate'(__ARG_1)
.annotate 'line', 6154
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6155
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S5, 'var ', $S1
concat $S4, $S5, '[] : '
concat $S3, $S4, $S2
.annotate 'line', 6156
__ARG_1.'comment'($S3)
.annotate 'line', 6157
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6158

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6142
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6165
# Body
# {
.annotate 'line', 6167
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6168
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6169
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6170
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6171
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6172
$P1 = __ARG_2.'get'()
.annotate 'line', 6173
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6174
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6175

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6176
# Body
# {
.annotate 'line', 6178
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6179
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6180

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6181
# Body
# {
.annotate 'line', 6183
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6184
self.'annotate'(__ARG_1)
.annotate 'line', 6185
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6186
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S6, 'var ', $S2
concat $S5, $S6, '[] : '
concat $S4, $S5, $S3
.annotate 'line', 6187
__ARG_1.'comment'($S4)
.annotate 'line', 6188
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6189

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6161
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6163
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6192
# Body
# {
.annotate 'line', 6194
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6195
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6196
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6197
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6198
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6199
$P2 = __ARG_2.'get'()
.annotate 'line', 6200
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6201
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6203
__ARG_2.'unget'($P2)
.annotate 'line', 6204
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
.annotate 'line', 6208
__ARG_2.'unget'($P2)
.annotate 'line', 6209
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6211

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6219
# Body
# {
box $P1, 'S'
.annotate 'line', 6221
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6222
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6223
setattribute self, 't_array', $P2
.annotate 'line', 6224
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6225

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6226
# Body
# {
.annotate 'line', 6228
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6229

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6217
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6238
# Body
# {
box $P1, 'I'
.annotate 'line', 6240
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6241
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6242
setattribute self, 't_array', $P2
.annotate 'line', 6243
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6244

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6245
# Body
# {
.annotate 'line', 6247
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6248

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6236
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6257
# Body
# {
box $P1, 'N'
.annotate 'line', 6259
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6260
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6261
setattribute self, 't_array', $P2
.annotate 'line', 6262
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6263

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6264
# Body
# {
.annotate 'line', 6266
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6267

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6255
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6281
# Body
# {
.annotate 'line', 6283
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6284
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6285
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6286
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6287
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6288
__ARG_2.'unget'($P1)
.annotate 'line', 6289
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6290
isnull $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6291
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6292
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6294
setattribute self, 'end', $P1
# }
.annotate 'line', 6295

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6296
# Body
# {
.annotate 'line', 6298
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6299
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6300
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6301
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6302
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6303
.return($S2)
# }
.annotate 'line', 6304

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6305
# Body
# {
.annotate 'line', 6307
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6308
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6309
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6310
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6311
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6312
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6313
$P1[$S1] = $S3
.annotate 'line', 6314
.return($S3)
# }
.annotate 'line', 6315

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6316
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6317
# Body
# {
.annotate 'line', 6319
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6320
.return(self)
# }
.annotate 'line', 6321

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6322
# Body
# {
.annotate 'line', 6324
__ARG_1.'comment'('{')
.annotate 'line', 6325
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6326
$P1.'emit'(__ARG_1)
.annotate 'line', 6327
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6329
__ARG_1.'comment'('}')
# }
.annotate 'line', 6330

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6274
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6276
addattribute $P0, 'statements'
.annotate 'line', 6277
addattribute $P0, 'end'
.annotate 'line', 6278
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6343
# Body
# {
box $P3, 1
.annotate 'line', 6346
setattribute self, 'nreg', $P3
.annotate 'line', 6347
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6348
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6349
setattribute self, 'tempreg', $P1
.annotate 'line', 6350
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6351

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6352
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6354
setattribute self, 'type', $P1
.annotate 'line', 6355
.return(self)
# }
.annotate 'line', 6356

.end # settype


.sub 'createreg' :method

.annotate 'line', 6357
# Body
# {
.annotate 'line', 6359
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6360
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6361
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6363
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S3, '$', $S2
concat $S1, $S3, $S1
.annotate 'line', 6365
.return($S1)
# }
.annotate 'line', 6366

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6367
# Body
# {
.annotate 'line', 6369
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6370
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6371
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6372
# string reg: $S1
null $S1
.annotate 'line', 6373
isgt $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 6374
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6376
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6377
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6379
.return($S1)
# }
.annotate 'line', 6380

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6381
# Body
# {
.annotate 'line', 6383
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6384
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6385
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6386
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6387

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6339
addattribute $P0, 'type'
.annotate 'line', 6340
addattribute $P0, 'nreg'
.annotate 'line', 6341
addattribute $P0, 'tempreg'
.annotate 'line', 6342
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6412
# Body
# {
.annotate 'line', 6414
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6415
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6416
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6417
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6418
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6419

.end # init


.sub 'getouter' :method

.annotate 'line', 6421
# Body
# {
.return(self)
# }

.end # getouter


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6422
# Body
# {
.annotate 'line', 6424
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6425
.return($I1)
# }
.annotate 'line', 6426

.end # same_scope_as


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6427
# Body
# {
.annotate 'line', 6429
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 6430
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6431
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6432
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6434
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6435

.end # setlex


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6436
# Body
# {
.annotate 'line', 6438
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 6439
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6440
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6441
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6443
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6444

.end # setusedlex


.sub 'createlex' :method
.param string __ARG_1

.annotate 'line', 6445
# Body
# {
.annotate 'line', 6447
# string lexname: $S1
# predefined substr
substr $S2, __ARG_1, 1
concat $S1, '__WLEX_', $S2
.annotate 'line', 6448
self.'setlex'($S1, __ARG_1)
.annotate 'line', 6449
.return($S1)
# }
.annotate 'line', 6450

.end # createlex


.sub 'ismethod' :method

.annotate 'line', 6452
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6453
# Body
# {
.annotate 'line', 6455
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6456
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
.annotate 'line', 6458
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6460
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6462
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6464
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6466
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6468
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6469
.return($S1)
# }
.annotate 'line', 6470

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6471
# Body
# {
.annotate 'line', 6473
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6474
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
.annotate 'line', 6476
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6478
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6480
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6482
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6484
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6486
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6487
.return($S1)
# }
.annotate 'line', 6488

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6489
# Body
# {
.annotate 'line', 6491
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
.annotate 'line', 6492
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6493

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6494
# Body
# {
.annotate 'line', 6496
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6497
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6498
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6500
.return($S1)
# }
.annotate 'line', 6501

.end # genlabel


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6502
# Body
# {
.annotate 'line', 6504
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6505
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6506
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6508
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6509

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6511
# Body
# {
.annotate 'line', 6513
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6514
.return(self)
# }
.annotate 'line', 6515

.end # optimize


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6517
# Body
# {
.annotate 'line', 6519
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 6520
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6521
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 6522
__ARG_1.'unget'($P1)
.annotate 'line', 6523
# int argnum: $I1
null $I1
__label_1: # do
.annotate 'line', 6524
# {
.annotate 'line', 6525
$P1 = __ARG_1.'get'()
.annotate 'line', 6526
# string type: $S1
$P6 = $P1.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6527
isne $I2, $S1, ''
unless $I2 goto __label_5
.annotate 'line', 6528
$P1 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6531
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S2, '__ARG_', $S4
.annotate 'line', 6532
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6534
# string varname: $S3
set $P7, $P1
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6535
# var arg: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 6536
$P2['name'] = $S3
.annotate 'line', 6537
$P1 = __ARG_1.'get'()
.annotate 'line', 6538
$P7 = $P1.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6539
# var modifiers: $P3
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, self)
set $P3, $P8
.annotate 'line', 6540
$P2['modifiers'] = $P3
.annotate 'line', 6541
$P1 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6543
getattribute $P8, self, 'args'
$P8.'push'($P2)
# }
.annotate 'line', 6544
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 6545
$P9 = $P1.'isop'(')')
isfalse $I3, $P9
unless $I3 goto __label_9
.annotate 'line', 6546
'SyntaxError'("Expected ')'", $P1)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6548

.end # parse_parameters


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6550
# Body
# {
.annotate 'line', 6552
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6553
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6554
setattribute self, 'name', $P1
box $P3, 0
.annotate 'line', 6555
setattribute self, 'isanon', $P3
.annotate 'line', 6556
$P1 = __ARG_2.'get'()
.annotate 'line', 6557
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6558
# var modifiers: $P2
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 6559
setattribute self, 'modifiers', $P2
.annotate 'line', 6560
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6562
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 6563
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6564
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6566
$P1 = __ARG_2.'get'()
.annotate 'line', 6567
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_2
.annotate 'line', 6568
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 6569
new $P8, [ 'CompoundStatement' ]
$P8.'CompoundStatement'($P1, __ARG_2, self)
set $P7, $P8
setattribute self, 'body', $P7
.annotate 'line', 6570
.return(self)
# }
.annotate 'line', 6571

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6572
# Body
# {
.annotate 'line', 6574
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 6575
__ARG_1.'say'()
.annotate 'line', 6576
__ARG_1.'print'(".sub ")
.annotate 'line', 6577
getattribute $P19, self, 'isanon'
isfalse $I5, $P19
unless $I5 goto __label_1
.annotate 'line', 6578
__ARG_1.'print'("'", $S1, "'")
goto __label_2
__label_1: # else
.annotate 'line', 6580
__ARG_1.'print'("'' :anon")
__label_2: # endif
.annotate 'line', 6581
getattribute $P20, self, 'subid'
isnull $I5, $P20
not $I5
unless $I5 goto __label_3
.annotate 'line', 6582
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 6583
getattribute $P20, self, 'outer'
isnull $I6, $P20
not $I6
unless $I6 goto __label_4
# {
.annotate 'line', 6584
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 6585
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 6586
isnull $I6, $P2
not $I6
unless $I6 goto __label_5
.annotate 'line', 6587
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 6591
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 6592
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 6593
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 6594
isnull $I7, $P3
not $I7
unless $I7 goto __label_7
# {
.annotate 'line', 6595
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 6596
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 6597
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 6598
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 6599
isgt $I7, $I1, 0
unless $I7 goto __label_11
# {
.annotate 'line', 6600
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6601
# int iargmod: $I2
null $I2
goto __label_14
__label_12: # for iteration
inc $I2
__label_14: # for condition
islt $I8, $I2, $I1
unless $I8 goto __label_13 # for end
# {
.annotate 'line', 6602
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 6603
$P24 = $P6.'isstringliteral'()
isfalse $I8, $P24
unless $I8 goto __label_15
.annotate 'line', 6604
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 6605
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
goto __label_12 # for iteration
__label_13: # for end
.annotate 'line', 6607
__ARG_1.'print'(')')
# }
__label_11: # endif
# }
goto __label_9
__label_10: # endfor
# }
goto __label_8
__label_7: # else
# {
.annotate 'line', 6612
iseq $I9, $S1, 'main'
unless $I9 goto __label_16
.annotate 'line', 6613
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 6615
__ARG_1.'say'()
.annotate 'line', 6617
# var args: $P7
getattribute $P7, self, 'args'
.annotate 'line', 6618
# var arg: $P8
null $P8
.annotate 'line', 6619
# string argname: $S2
null $S2
.annotate 'line', 6620
# var a: $P9
null $P9
.annotate 'line', 6622
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 6623
$S2 = $P8['name']
.annotate 'line', 6624
$P9 = self.'getvar'($S2)
.annotate 'line', 6625
# string ptype: $S3
$P27 = $P9['type']
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
$P27 = $P9['reg']
.annotate 'line', 6626
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 6627
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 6628
isnull $I9, $P10
not $I9
unless $I9 goto __label_20
# {
.annotate 'line', 6629
# var named: $P11
null $P11
.annotate 'line', 6630
# var slurpy: $P12
null $P12
.annotate 'line', 6631
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 6632
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 6633
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 6634
if $S8 == $S9 goto __label_26
set $S9, 'slurpy'
if $S8 == $S9 goto __label_27
goto __label_25
# switch
__label_26: # case
set $P11, $P14
goto __label_24 # break
__label_27: # case
set $P12, $P14
goto __label_24 # break
__label_25: # default
.annotate 'line', 6642
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 6645
isnull $I10, $P11
not $I10
unless $I10 goto __label_30
isnull $I10, $P12
not $I10
__label_30:
unless $I10 goto __label_28
# {
.annotate 'line', 6650
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 6653
isnull $I10, $P11
not $I10
unless $I10 goto __label_31
# {
.annotate 'line', 6654
# string setname: $S5
null $S5
.annotate 'line', 6655
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I11, $I3
null $I12
.annotate 'line', 6656
if $I11 == $I12 goto __label_35
set $I12, 1
if $I11 == $I12 goto __label_36
goto __label_34
# switch
__label_35: # case
concat $S8, "'", $S2
concat $S5, $S8, "'"
goto __label_33 # break
__label_36: # case
.annotate 'line', 6661
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 6662
$P30 = $P15.'isstringliteral'()
isfalse $I13, $P30
unless $I13 goto __label_37
.annotate 'line', 6663
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 6664
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 6667
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 6669
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 6671
isnull $I11, $P12
not $I11
unless $I11 goto __label_38
# {
.annotate 'line', 6672
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 6676
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 6678
__ARG_1.'say'()
.annotate 'line', 6679
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 6682
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 6683
isnull $I12, $P16
not $I12
unless $I12 goto __label_39
# {
.annotate 'line', 6685
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
$P31 = $P16[$S6]
.annotate 'line', 6686
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 6689
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 6690
isnull $I13, $P16
not $I13
unless $I13 goto __label_42
# {
.annotate 'line', 6692
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
$P32 = $P16[$S7]
.annotate 'line', 6693
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 6696
__ARG_1.'comment'('Body')
.annotate 'line', 6697
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 6699
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 6700
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 6703
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 6704
isnull $I14, $P17
not $I14
unless $I14 goto __label_45
# {
# for loop
.annotate 'line', 6706
# int ifn: $I4
null $I4
goto __label_48
__label_46: # for iteration
inc $I4
__label_48: # for condition
# predefined elements
elements $I16, $P17
islt $I15, $I4, $I16
unless $I15 goto __label_47 # for end
# {
.annotate 'line', 6707
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 6708
$P18.'emit'(__ARG_1)
# }
goto __label_46 # for iteration
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 6711

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6712
# Body
# {
.annotate 'line', 6714
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6715

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6716
# Body
# {
.annotate 'line', 6718
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6719

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6394
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6396
addattribute $P0, 'name'
.annotate 'line', 6397
addattribute $P0, 'subid'
.annotate 'line', 6398
addattribute $P0, 'isanon'
.annotate 'line', 6399
addattribute $P0, 'modifiers'
.annotate 'line', 6400
addattribute $P0, 'args'
.annotate 'line', 6401
addattribute $P0, 'body'
.annotate 'line', 6402
addattribute $P0, 'regstI'
.annotate 'line', 6403
addattribute $P0, 'regstN'
.annotate 'line', 6404
addattribute $P0, 'regstS'
.annotate 'line', 6405
addattribute $P0, 'regstP'
.annotate 'line', 6406
addattribute $P0, 'nlabel'
.annotate 'line', 6407
addattribute $P0, 'localfun'
.annotate 'line', 6408
addattribute $P0, 'lexicals'
.annotate 'line', 6409
addattribute $P0, 'usedlexicals'
.annotate 'line', 6410
addattribute $P0, 'outer'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6728
# Body
# {
.annotate 'line', 6730
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6731
$P3 = __ARG_3.'getouter'()
setattribute self, 'outer', $P3
.annotate 'line', 6732
# string subid: $S1
$P2 = __ARG_3.'createsubid'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6733
getattribute $P3, self, 'outer'
$P5 = __ARG_3.'createsubid'()
setattribute $P3, 'subid', $P5
box $P4, $S1
.annotate 'line', 6734
setattribute self, 'subid', $P4
box $P5, $S1
.annotate 'line', 6735
setattribute self, 'name', $P5
box $P6, 1
.annotate 'line', 6736
setattribute self, 'isanon', $P6
.annotate 'line', 6737
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6738
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6739
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_1
.annotate 'line', 6740
'Expected'('{', $P1)
__label_1: # endif
.annotate 'line', 6741
new $P9, [ 'CompoundStatement' ]
$P9.'CompoundStatement'($P1, __ARG_2, self)
set $P8, $P9
setattribute self, 'body', $P8
.annotate 'line', 6742
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 6743

.end # LocalFunctionStatement


.sub 'getsubid' :method

.annotate 'line', 6744
# Body
# {
.annotate 'line', 6746
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 6747

.end # getsubid


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 6748
# Body
# {
.annotate 'line', 6750
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 6751
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6754
getattribute $P8, self, 'owner'
$P1 = $P8.'getvar'(__ARG_1)
.annotate 'line', 6755
isnull $I1, $P1
unless $I1 goto __label_1
# {
.annotate 'line', 6757
iseq $I2, __ARG_1, 'self'
unless $I2 goto __label_3
# {
.annotate 'line', 6758
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 6759
getattribute $P9, self, 'outer'
$P8 = $P9.'ismethod'()
if_null $P8, __label_4
unless $P8 goto __label_4
# {
.annotate 'line', 6760
# string lexself: $S1
$P10 = $P2.'makelexicalself'()
null $S1
if_null $P10, __label_5
set $S1, $P10
__label_5:
.annotate 'line', 6761
# var r2: $P3
$P3 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 6762
# string reg: $S2
set $P9, $P3
null $S2
if_null $P9, __label_6
set $S2, $P9
__label_6:
.annotate 'line', 6763
self.'setusedlex'($S1, $S2)
set $P1, $P3
.annotate 'line', 6764
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 6768
$P10 = $P1['type']
$S5 = $P10
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P11 = $P1['const']
isfalse $I2, $P11
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 6769
# var scope: $P4
$P4 = $P1['scope']
.annotate 'line', 6770
# var ownerscope: $P5
$P5 = $P4.'getouter'()
.annotate 'line', 6771
# var outer: $P6
getattribute $P6, self, 'outer'
.annotate 'line', 6772
isa $I3, $P5, 'FunctionStatement'
unless $I3 goto __label_9
# {
.annotate 'line', 6773
$P11 = $P5.'same_scope_as'($P6)
if_null $P11, __label_10
unless $P11 goto __label_10
# {
.annotate 'line', 6774
# string lexname: $S3
$P12 = $P4.'makelexical'($P1)
null $S3
if_null $P12, __label_11
set $S3, $P12
__label_11:
.annotate 'line', 6775
# var r2: $P7
$P7 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 6776
# string reg: $S4
set $P12, $P7
null $S4
if_null $P12, __label_12
set $S4, $P12
__label_12:
.annotate 'line', 6777
self.'setusedlex'($S3, $S4)
set $P1, $P7
.annotate 'line', 6778
# }
__label_10: # endif
# }
__label_9: # endif
# }
__label_7: # endif
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 6783
.return($P1)
# }
.annotate 'line', 6784

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 6726
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 6793
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 6791
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

.annotate 'line', 6809
# Body
# {
.annotate 'line', 6811
setattribute self, 'owner', __ARG_1
.annotate 'line', 6812
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 6813

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 6814
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 6816
# Body
# {
.annotate 'line', 6818
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 6819

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 6807
addattribute $P0, 'owner'
.annotate 'line', 6808
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6825
# Body
# {
.annotate 'line', 6827
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 6828
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 6829

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 6830
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6832
# Body
# {
.annotate 'line', 6834
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6835
__ARG_1.'print'($S1)
# }
.annotate 'line', 6836

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 6822
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 6824
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6843
# Body
# {
.annotate 'line', 6845
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 6846
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 6847
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 6848
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6849
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 6850
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 6851
$P2 = __ARG_1.'get'()
.annotate 'line', 6852
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_1
# {
.annotate 'line', 6853
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
.annotate 'line', 6855
setattribute self, 'hll', $P7
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 6859
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 6861
# {
.annotate 'line', 6862
$P2 = __ARG_1.'get'()
.annotate 'line', 6863
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 6864
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 6865
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 6866
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 6867
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_10
.annotate 'line', 6868
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 6870
setattribute self, 'key', $P1
# }
.annotate 'line', 6871

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 6872
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 6873
# Body
# {
.annotate 'line', 6875
getattribute $P1, self, 'hll'
isnull $I2, $P1
not $I2
# predefined int
$I1 = $I2
.return($I1)
# }
.annotate 'line', 6876

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6878
# Body
# {
.annotate 'line', 6880
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 6881

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 6839
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 6841
addattribute $P0, 'key'
.annotate 'line', 6842
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6887
# Body
# {
.annotate 'line', 6889
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 6890
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
$S1 = __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 6891
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6892
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 6893
$P2 = __ARG_1.'get'()
# predefined string
.annotate 'line', 6894
$S1 = $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6896
__ARG_1.'unget'($P2)
.annotate 'line', 6897
setattribute self, 'key', $P1
# }
.annotate 'line', 6898

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 6899
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 6901
# Body
# {
.annotate 'line', 6903
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 6904
.return($P2)
# }
.annotate 'line', 6905

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6907
# Body
# {
.annotate 'line', 6909
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 6910
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6911
getattribute $P2, self, 'key'
# predefined join
join $S3, ".", $P2
concat $S2, "class ", $S3
concat $S1, $S2, " not found at compile time"
'Warn'($S1)
.annotate 'line', 6912
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6914
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 6915

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 6884
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 6886
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6918
# Body
# {
.annotate 'line', 6920
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6921
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6922
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 6923
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 6924
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 6925
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 6926
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 6927
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 6928

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6945
# Body
# {
.annotate 'line', 6947
setattribute self, 'parent', __ARG_2
.annotate 'line', 6948
setattribute self, 'owner', __ARG_2
.annotate 'line', 6949
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 6950
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 6951
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 6952
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 6954
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6955
setattribute self, 'name', $P1
.annotate 'line', 6956
$P1 = __ARG_1.'get'()
.annotate 'line', 6957
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 6958
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 6959
# {
.annotate 'line', 6960
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 6961
$P2.'push'($P3)
.annotate 'line', 6962
$P1 = __ARG_1.'get'()
.annotate 'line', 6963
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
.annotate 'line', 6966
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 6967
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 6968
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 6969
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 6970
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 6971
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 6972
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 6973
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6975
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 6976
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 6977
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 6978
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 6979
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 6980
$P1 = __ARG_1.'get'()
.annotate 'line', 6981
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 6982
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 6984
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 6985
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6986
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 6987
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6990
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 6991
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 6993
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 6994
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 6995
setattribute self, 'classns', $P9
# }
.annotate 'line', 6996

.end # ClassStatement


.sub 'createsubid' :method

.annotate 'line', 6997
# Body
# {
.annotate 'line', 6999
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7000

.end # createsubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7001
# Body
# {
.annotate 'line', 7003
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7004

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7005
# Body
# {
.annotate 'line', 7007
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7008

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7009
# Body
# {
.annotate 'line', 7011
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7012

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7013
# Body
# {
.annotate 'line', 7015
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7016
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7017
.return(self)
# }
.annotate 'line', 7018

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7019
# Body
# {
.annotate 'line', 7021
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7022

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7023
# Body
# {
.annotate 'line', 7025
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7026
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7027
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7028
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7030
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7032
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7033
# int n: $I1
set $I1, 1
.annotate 'line', 7034
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7035
$P3.'annotate'(__ARG_1)
.annotate 'line', 7036
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 7037
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7038
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7039
__ARG_1.'say'()
.annotate 'line', 7040
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7042
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7043
__ARG_1.'annotate'($P4)
.annotate 'line', 7044
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7047
__ARG_1.'say'('.end')
# }
.annotate 'line', 7048

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 6934
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 6936
addattribute $P0, 'parent'
.annotate 'line', 6937
addattribute $P0, 'owner'
.annotate 'line', 6938
addattribute $P0, 'name'
.annotate 'line', 6939
addattribute $P0, 'bases'
.annotate 'line', 6940
addattribute $P0, 'constants'
.annotate 'line', 6941
addattribute $P0, 'functions'
.annotate 'line', 6942
addattribute $P0, 'members'
.annotate 'line', 6943
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7055
# Body
# {
.annotate 'line', 7057
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7058
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7059
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7060
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7061
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7062
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7067
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7068
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7069
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7070
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7071
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 7072
# try: create handler
new $P11, 'ExceptionHandler'
set_addr $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7073
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7074
# }
# try: end
goto __label_5
.annotate 'line', 7072
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
.annotate 'line', 7079
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7080
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7085
load_bytecode 'PGE.pbc'
.annotate 'line', 7086
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7087
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7089
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
.annotate 'line', 7090
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7091
$P8 = $P7($S4)
.annotate 'line', 7092
# predefined elements
elements $I4, $P8
isgt $I3, $I4, 0
unless $I3 goto __label_11
# {
.annotate 'line', 7093
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7094
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7095
# int ivalue: $I1
null $I1
.annotate 'line', 7096
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7097
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7102
$P16 = 'newTokenFrom'(5, $S5, __ARG_1)
.annotate 'line', 7101
$P15 = 'integerValue'(__ARG_3, $P16, $I1)
.annotate 'line', 7100
__ARG_3.'createconst'($S5, 'I', $P15, '')
# }
__label_11: # endif
# }
goto __label_7 # for iteration
__label_8: # for end
.annotate 'line', 7106
$P5.'close'()
# }
.annotate 'line', 7107

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7119
# Body
# {
.annotate 'line', 7121
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7122
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7123
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7124
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7125

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7126
# Body
# {
.annotate 'line', 7128
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7129
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7130
getattribute $P4, $P2, 'name'
$S1 = $P4
iseq $I1, $S1, __ARG_1
unless $I1 goto __label_2
.annotate 'line', 7131
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7132
.return($P4)
# }
.annotate 'line', 7133

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7134
# Body
# {
# predefined elements
.annotate 'line', 7138
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 7140
.return($P5)
__label_3: # case
.annotate 'line', 7143
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7148
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7149
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7150
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7151
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7152
getattribute $P9, $P3, 'name'
$S2 = $P9
iseq $I3, $S2, $S1
unless $I3 goto __label_7
# {
.annotate 'line', 7154
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7155
isnull $I1, $P4
not $I1
unless $I1 goto __label_8
.annotate 'line', 7156
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7160
.return($P5)
# }
.annotate 'line', 7161

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7162
# Body
# {
.annotate 'line', 7164
# int balance1: $I1
null $I1
.annotate 'line', 7165
# int balance2: $I2
null $I2
.annotate 'line', 7166
# int balance3: $I3
null $I3
.annotate 'line', 7167
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7168
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7170
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7172
# var start: $P2
set $P2, $P1
.annotate 'line', 7173
$P1 = __ARG_1.'get'()
.annotate 'line', 7174
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7175
$P1 = __ARG_1.'get'()
.annotate 'line', 7177
# var modifier: $P3
null $P3
.annotate 'line', 7178
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7179
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7180
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7183
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7184
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7185
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 7186
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 7187
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7188
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7190
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 7191
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7192
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7194
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 7195
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 7196
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7197
$P7.'push'($P6)
.annotate 'line', 7198
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7200
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 7201
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 7202
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7203
$P9.'push'($P8)
.annotate 'line', 7204
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7206
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 7207
$P1 = __ARG_1.'get'()
.annotate 'line', 7208
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 7209
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7210
$P1 = __ARG_1.'get'()
.annotate 'line', 7211
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 7212
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7213
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 7214
self.'addlib'($S2)
.annotate 'line', 7215
$P1 = __ARG_1.'get'()
.annotate 'line', 7216
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7218
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 7219
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7221
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 7222
$P1 = __ARG_1.'get'()
.annotate 'line', 7223
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 7224
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7225
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 7226
self.'addload'($S3)
.annotate 'line', 7227
$P1 = __ARG_1.'get'()
.annotate 'line', 7228
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7230
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 7231
self.'close_ns'($P1)
.annotate 'line', 7232
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7235
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
.annotate 'line', 7237
self.'unclosed_ns'()
# }
.annotate 'line', 7238

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7239
# Body
# {
.annotate 'line', 7241
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7242

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7243
# Body
# {
.annotate 'line', 7245
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7246
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7248
# int activate: $I1
set $I1, 1
.annotate 'line', 7249
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7250
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7251
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 7254
unless $I1 goto __label_6
# {
.annotate 'line', 7255
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7256
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7258
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7260

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7111
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7113
addattribute $P0, 'namespaces'
.annotate 'line', 7114
addattribute $P0, 'classes'
.annotate 'line', 7115
addattribute $P0, 'functions'
.annotate 'line', 7116
addattribute $P0, 'items'
.annotate 'line', 7117
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7275
# Body
# {
.annotate 'line', 7278
setattribute self, 'parent', __ARG_1
.annotate 'line', 7279
setattribute self, 'start', __ARG_2
.annotate 'line', 7280
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7281
setattribute self, 'name', $P2
.annotate 'line', 7282
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7283
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 7284
$P3 = __ARG_4.'pick'('HLL')
isnull $I2, $P3
not $I2
unless $I2 goto __label_1
.annotate 'line', 7285
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7287

.end # NamespaceStatement


.sub 'createsubid' :method

.annotate 'line', 7288
# Body
# {
.annotate 'line', 7290
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7291

.end # createsubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7292
# Body
# {
.annotate 'line', 7294
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7295

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7296
# Body
# {
.annotate 'line', 7298
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7299
getattribute $P2, self, 'hll'
isnull $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 7300
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7301
.return($P1)
# }
.annotate 'line', 7302

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7303
# Body
# {
.annotate 'line', 7305
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7306

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7307
# Body
# {
.annotate 'line', 7309
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7310

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7311
# Body
# {
.annotate 'line', 7313
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7314
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 7315
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7317
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7318

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7319
# Body
# {
.annotate 'line', 7323
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7324
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 7325
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7326
.return($P1)
# }
.annotate 'line', 7327

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7328
# Body
# {
.annotate 'line', 7330
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7331

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7332
# Body
# {
# }
.annotate 'line', 7335

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7336
# Body
# {
.annotate 'line', 7338
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7339
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 7340
$P1 = $P1.'optimize'()
.annotate 'line', 7341
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7343
self.'optimize_base'()
.annotate 'line', 7344
.return(self)
# }
.annotate 'line', 7345

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7346
# Body
# {
.annotate 'line', 7348
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7349
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 7350
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7352
self.'emit_base'(__ARG_1)
.annotate 'line', 7354
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 7355
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7356

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7267
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7269
addattribute $P0, 'parent'
.annotate 'line', 7270
addattribute $P0, 'start'
.annotate 'line', 7271
addattribute $P0, 'name'
.annotate 'line', 7272
addattribute $P0, 'modifier'
.annotate 'line', 7273
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7370
# Body
# {
.annotate 'line', 7372
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7373
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7374

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7375
# Body
# {
.annotate 'line', 7377
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7378
$P1[__ARG_1] = 1
# }
.annotate 'line', 7379

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7380
# Body
# {
.annotate 'line', 7382
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7383
isnull $I2, $P2
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7384

.end # predef_is_used


.sub 'createsubid' :method

.annotate 'line', 7386
# Body
# {
.annotate 'line', 7388
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7389
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7390
inc $I1
assign $P1, $I1
.annotate 'line', 7392
# string id: $S1
# predefined string
$S2 = $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 7393
.return($S1)
# }
.annotate 'line', 7394

.end # createsubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7396
# Body
# {
.annotate 'line', 7398
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7399
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 7400
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7401
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7403
$P1[__ARG_1] = 1
# }
.annotate 'line', 7404

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7405
# Body
# {
.annotate 'line', 7407
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7408
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 7409
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7410
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7412
$P1[__ARG_1] = 1
# }
.annotate 'line', 7413

.end # addload


.sub 'getpath' :method

.annotate 'line', 7414
# Body
# {
.annotate 'line', 7416
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7417
.return($P1)
# }
.annotate 'line', 7418

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7419
# Body
# {
.annotate 'line', 7421
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7422

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7423
# Body
# {
.annotate 'line', 7426
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7427

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7428
# Body
# {
# }
.annotate 'line', 7431

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7432
# Body
# {
.annotate 'line', 7434
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7435

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7436
# Body
# {
.annotate 'line', 7438
self.'optimize_base'()
.annotate 'line', 7439
.return(self)
# }
.annotate 'line', 7440

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7441
# Body
# {
.annotate 'line', 7443
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7446
$P5 = $P1['chomp']
isnull $I3, $P5
not $I3
unless $I3 goto __label_0
.annotate 'line', 7447
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 7450
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
.annotate 'line', 7453
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7454
$P5 = $P1[$S1]
isnull $I3, $P5
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 7455
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7456
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7459
# int somelib: $I1
null $I1
.annotate 'line', 7460
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7461
isnull $I4, $P3
not $I4
unless $I4 goto __label_4
# {
set $I1, 1
.annotate 'line', 7463
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7464
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7467
# int someload: $I2
null $I2
.annotate 'line', 7468
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7469
isnull $I4, $P4
not $I4
unless $I4 goto __label_7
# {
set $I2, 1
.annotate 'line', 7471
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7472
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7473
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7474
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I6, $I1
set $I7, $I2
.annotate 'line', 7476
or $I5, $I6, $I7
unless $I5 goto __label_10
.annotate 'line', 7477
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7479
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7480

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7363
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7365
addattribute $P0, 'predefs_used'
.annotate 'line', 7366
addattribute $P0, 'libs'
.annotate 'line', 7367
addattribute $P0, 'loads'
.annotate 'line', 7368
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7492
# Body
# {
.annotate 'line', 7494
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7497
# var taux: $P2
$P2 = 'newToken'(4, 'predefconst', 0, '__predefconst__')
.annotate 'line', 7501
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7500
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7499
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7505
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7504
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 7503
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 7511
new $P6, [ 'StringLiteral' ]
# predefined int
.annotate 'line', 7512
$I2 = "2"
add $I1, $I2, 1
# predefined string
$S1 = $I1
$P7 = 'newTokenFrom'(2, $S1, $P2)
$P6.'StringLiteral'($P1, $P7)
set $P5, $P6
.annotate 'line', 7510
$P1.'createconst'('__STAGE__', 'S', $P5, '')
.annotate 'line', 7515
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7516

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7517
# Body
# {
.annotate 'line', 7519
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7520

.end # parse


.sub 'optimize' :method

.annotate 'line', 7521
# Body
# {
.annotate 'line', 7523
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7524

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7525
# Body
# {
.annotate 'line', 7527
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7528
__ARG_1.'say'('')
.annotate 'line', 7530
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7532
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7533

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7491
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7540
# Body
# {
.annotate 'line', 7542
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 7544
$P1.'open'('__eval__', 'w')
.annotate 'line', 7545
$P1.'puts'(__ARG_1)
.annotate 'line', 7546
$P1.'close'()
.annotate 'line', 7547
$P1.'open'('__eval__', 'r')
.annotate 'line', 7548
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7549
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7550
$P3.'parse'($P2)
.annotate 'line', 7551
$P1.'close'()
.annotate 'line', 7552
$P3.'optimize'()
.annotate 'line', 7553
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7554
$P4.'open'('__eval__', 'w')
.annotate 'line', 7555
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7556
$P5.'initialize'($P4)
.annotate 'line', 7557
$P3.'emit'($P5)
.annotate 'line', 7558
$P5.'close'()
.annotate 'line', 7559
$P4.'close'()
.annotate 'line', 7560
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7561
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7562
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7563
.return($P7)
# }
.annotate 'line', 7564

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7565
# Body
# {
.annotate 'line', 7567
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7568
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7569
$P1.'encoding'('utf8')
.annotate 'line', 7570
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7571
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7572
$P3.'parse'($P2)
.annotate 'line', 7573
$P1.'close'()
.annotate 'line', 7574
$P3.'optimize'()
.annotate 'line', 7575
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7576
$P4.'initialize'(__ARG_2)
.annotate 'line', 7577
$P3.'emit'($P4)
.annotate 'line', 7578
$P4.'close'()
# }
.annotate 'line', 7579

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7580
# Body
# {
.annotate 'line', 7582
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7583
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7584
$P1.'encoding'('utf8')
.annotate 'line', 7585
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7586
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7587
$P3.'parse'($P2)
.annotate 'line', 7588
$P1.'close'()
.annotate 'line', 7589
$P3.'optimize'()
.annotate 'line', 7590
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7591
$P4.'open'('__eval__', 'w')
.annotate 'line', 7592
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7593
$P5.'initialize'($P4)
.annotate 'line', 7594
$P3.'emit'($P5)
.annotate 'line', 7595
$P5.'close'()
.annotate 'line', 7596
$P4.'close'()
.annotate 'line', 7597
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7598
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7599
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7600
.return($P7)
# }
.annotate 'line', 7601

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7606
# Body
# {
.annotate 'line', 7608
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7609
$P1.'parse'(__ARG_1)
.annotate 'line', 7611
$P1.'optimize'()
.annotate 'line', 7613
# var handle: $P2
null $P2
.annotate 'line', 7614
iseq $I1, __ARG_2, '-'
unless $I1 goto __label_0
.annotate 'line', 7615
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 7617
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7618
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 7619
$P3.'initialize'($P2)
.annotate 'line', 7620
$P1.'emit'($P3)
.annotate 'line', 7621
$P3.'close'()
.annotate 'line', 7622
$P2.'close'()
# }
.annotate 'line', 7623

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7629
# Body
# {
.annotate 'line', 7631
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7632
compreg 'winxed', $P1
# }
.annotate 'line', 7633

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7635
# Body
# {
.annotate 'line', 7637
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7638
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 7639
$P1.'notOptStop'(1)
.annotate 'line', 7640
$P1.'push_string'('o=s')
.annotate 'line', 7641
$P1.'push_string'('e=s')
.annotate 'line', 7642
$P1.'push_string'('c')
.annotate 'line', 7643
$P1.'push_string'('noan')
.annotate 'line', 7645
__ARG_1.'shift'()
.annotate 'line', 7646
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7647
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7648
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7649
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7650
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7652
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7653
# string filename: $S1
null $S1
.annotate 'line', 7654
# string expr: $S2
null $S2
.annotate 'line', 7655
# var file: $P7
null $P7
.annotate 'line', 7656
isnull $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 7657
iseq $I3, $I1, 0
unless $I3 goto __label_2
# predefined Error
.annotate 'line', 7658
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7660
$S1 = __ARG_1[0]
.annotate 'line', 7661
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7662
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S4, 'function main[main](argv){', $S2
concat $S2, $S4, ';}'
.annotate 'line', 7667
new $P7, [ 'StringHandle' ]
.annotate 'line', 7668
$P7.'open'('__eval__', 'w')
.annotate 'line', 7669
$P7.'puts'($S2)
.annotate 'line', 7670
$P7.'close'()
.annotate 'line', 7671
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7674
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7676
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7677
isnull $I2, $P3
not $I2
unless $I2 goto __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7679
'winxed_parser'($P8, $S3)
.annotate 'line', 7681
$P7.'close'()
# }
.annotate 'line', 7682

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7684
# Body
# {
.annotate 'line', 7686
# try: create handler
new $P6, 'ExceptionHandler'
set_addr $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7692
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7686
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7695
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7696
print 'Error: '
say $S1
.annotate 'line', 7697
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7698
# int i: $I1
set $I1, 1
.annotate 'line', 7699
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7700
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7701
# string subname: $S2
null $S2
.annotate 'line', 7702
isnull $I3, $P4
not $I3
unless $I3 goto __label_4
# {
set $S2, $P4
.annotate 'line', 7704
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7705
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
.annotate 'line', 7707
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7708
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7709
isne $I4, $S4, ''
unless $I4 goto __label_8
# {
.annotate 'line', 7710
# int line: $I2
$I2 = $P5['line']
set $I5, $I1
.annotate 'line', 7711
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
.annotate 'line', 7715

.end # main

# End generated code
