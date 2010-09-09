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
# int dotted: $I1
null $I1
.annotate 'line', 1649
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1651
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1653
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1654
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S2, $S3, $S1
box $P3, $S2
setattribute self, 'opname', $P3
.annotate 'line', 1655
$P1 = __ARG_2.'get'()
.annotate 'line', 1656
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1657
__ARG_2.'unget'($P1)
.annotate 'line', 1658
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1660
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1661

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1662
# Body
# {
.annotate 'line', 1664
self.'optimizeargs'()
.annotate 'line', 1665
.return(self)
# }
.annotate 'line', 1666

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1667
# Body
# {
.annotate 'line', 1669
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1670
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1671
__ARG_1.'comment'($S2)
.annotate 'line', 1672
$P1 = self.'numargs'()
set $I2, $P1
iseq $I1, $I2, 0
unless $I1 goto __label_1
.annotate 'line', 1673
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1675
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1676
self.'emitargs'(__ARG_1)
.annotate 'line', 1677
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1679

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

.annotate 'line', 1689
# Body
# {
.annotate 'line', 1691
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1692
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1693
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1694
# {
.annotate 'line', 1695
$P2 = __ARG_2.'get'()
.annotate 'line', 1696
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1697
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1698
'RequireOp'(';', $P2)
.annotate 'line', 1699
setattribute self, 'path', $P1
.annotate 'line', 1700
.return(self)
# }
.annotate 'line', 1701

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1702
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1703
# Body
# {
.annotate 'line', 1705
# string file: $S1
null $S1
.annotate 'line', 1706
# string sep: $S2
set $S2, ''
.annotate 'line', 1707
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
.annotate 'line', 1710
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 1712
self.'annotate'(__ARG_1)
.annotate 'line', 1713
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1714

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ExternStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 1688
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1724
# Body
# {
.annotate 'line', 1726
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1727
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1728
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1729
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1730

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1731
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1732
# Body
# {
.annotate 'line', 1734
self.'annotate'(__ARG_1)
.annotate 'line', 1735
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1736
getattribute $P3, self, 'symbol'
.annotate 'line', 1735
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1737

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'StaticStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 1723
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1747
# Body
# {
.annotate 'line', 1749
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1750
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1751
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1752
# {
.annotate 'line', 1753
$P2 = __ARG_2.'get'()
.annotate 'line', 1754
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1755
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1756
'RequireOp'(';', $P2)
.annotate 'line', 1757
setattribute self, 'path', $P1
# }
.annotate 'line', 1758

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1759
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1760
# Body
# {
.annotate 'line', 1762
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1763
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1764
self.'annotate'(__ARG_1)
.annotate 'line', 1766
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1768
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1769
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1771
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1774
__ARG_1.'print'('[')
.annotate 'line', 1775
# string sep: $S2
set $S2, ''
.annotate 'line', 1776
iter $P4, $P1
set $P4, 0
__label_4: # for iteration
unless $P4 goto __label_5
shift $S3, $P4
# {
.annotate 'line', 1777
__ARG_1.'print'($S2, "'", $S3, "'")
set $S2, '; '
.annotate 'line', 1778
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 1780
__ARG_1.'say'(" ], '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1782

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'UsingStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 1746
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1792
# Body
# {
.annotate 'line', 1794
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1795
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1796
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1797

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1798
# Body
# {
.annotate 'line', 1800
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1801
.return(self)
# }
.annotate 'line', 1802

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1803
# Body
# {
.annotate 'line', 1805
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1806

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ExprStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 1791
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1816
# Body
# {
.annotate 'line', 1818
setattribute self, 'name', __ARG_1
.annotate 'line', 1819
.return(self)
# }
.annotate 'line', 1820

.end # set


.sub 'get_string' :method :vtable

.annotate 'line', 1821
# Body
# {
# predefined Error
.annotate 'line', 1823
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1824

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ConstantInternalFail' ]
.annotate 'line', 1815
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1831
# Body
# {
.annotate 'line', 1833
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1834

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1835
# Body
# {
.annotate 'line', 1837
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1838
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1839
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1840
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S4, "Redeclared '", $S1
concat $S3, $S4, "'"
.annotate 'line', 1841
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1842
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1843
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1847
.return($S2)
# }
.annotate 'line', 1848

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1849
# Body
# {
.annotate 'line', 1851
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1852
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1853
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1854
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1855
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1856
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1860

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1861
# Body
# {
.annotate 'line', 1863
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1864
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1865
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1866
isnull $I1, $P2
not $I1
unless $I1 goto __label_1
concat $S3, "Redeclared '", $S1
concat $S2, $S3, "'"
.annotate 'line', 1867
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1868
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1871
new $P5, [  'ConstantInternalFail' ]
$P4 = $P5.'set'(__ARG_1)
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1873
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1874
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1875
$P1[$S1] = $P3
# }
.annotate 'line', 1876

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1877
# Body
# {
.annotate 'line', 1879
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1880
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1881
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1882
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1883
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1884
.return($P2)
# }
.annotate 'line', 1885

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'VarContainer' ]
.annotate 'line', 1830
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

.annotate 'line', 1904
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 1905
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 1906
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 1907
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 1908
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 1909
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 1910
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 1911
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1912
# Body
# {
.annotate 'line', 1914
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 1915

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 1916
# Body
# {
.annotate 'line', 1918
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1919

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 1920
# Body
# {
.annotate 'line', 1923
.return(self)
# }
.annotate 'line', 1924

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 1925
# Body
# {
.annotate 'line', 1927
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1928
# string reg: $S2
iseq $I1, $S1, 'v'
unless $I1 goto __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 1929
self.'emit'(__ARG_1, $S2)
.annotate 'line', 1930
.return($S2)
# }
.annotate 'line', 1931

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1932
# Body
# {
.annotate 'line', 1934
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 1935

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Expr' ]
get_class $P1, [  'CommonBase' ]
# CommonBase
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 1940
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

.annotate 'line', 1955
# Body
# {
.annotate 'line', 1957
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 1958
.return(self)
# }
.annotate 'line', 1959

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 1960
# Body
# {
.annotate 'line', 1962
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 1963

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 1964
# Body
# {
.annotate 'line', 1966
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 1967
.return(self)
# }
.annotate 'line', 1968

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 1969
# Body
# {
.annotate 'line', 1971
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1972
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 1973
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1975
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 1976
iseq $I2, $I1, 0
unless $I2 goto __label_4
.annotate 'line', 1977
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 1979
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 1982
.return(0)
# }
.annotate 'line', 1983

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1984
# Body
# {
.annotate 'line', 1986
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 1987
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1988
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 1989
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
.annotate 'line', 1992
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_3)
__label_6: # case
__label_7: # case
.annotate 'line', 1995
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 1998
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2000

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2001
# Body
# {
.annotate 'line', 2003
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2004
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2005
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2006
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
.annotate 'line', 2009
__ARG_1.'say'('if_null ', $S1, ', ', __ARG_2)
__label_6: # case
__label_7: # case
.annotate 'line', 2012
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2015
'InternalError'('Invalid if condition')
__label_2: # switch end
# }
.annotate 'line', 2017

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Condition' ]
.annotate 'line', 1954
addattribute $P0, 'condexpr'
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2025
# Body
# {
.annotate 'line', 2027
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2028
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2029

.end # StringLiteral


.sub 'isliteral' :method

.annotate 'line', 2030
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isstringliteral' :method

.annotate 'line', 2031
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2032
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2033
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getPirString' :method

.annotate 'line', 2034
# Body
# {
.annotate 'line', 2036
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2037
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2038
# int type: $I1
getattribute $P2, $P1, 'type'
set $I1, $P2
.annotate 'line', 2039
# int need_unicode: $I2
null $I2
box $P3, $S1
.annotate 'line', 2040
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $I3, $P4
# {
.annotate 'line', 2041
isgt $I7, $I3, 127
unless $I7 goto __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2043
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2046
unless $I2 goto __label_4
# {
.annotate 'line', 2047
iseq $I7, $I1, 3
unless $I7 goto __label_5
# {
set $I1, 2
.annotate 'line', 2049
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P3, $S2
.annotate 'line', 2051
iter $P5, $P3
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2052
iseq $I8, $S3, '\'
unless $I8 goto __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2054
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2057
# string result: $S4
set $S4, ''
.annotate 'line', 2058
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2059
# int i: $I5
null $I5
goto __label_11
__label_9: # for iteration
inc $I5
__label_11: # for condition
islt $I8, $I5, $I4
unless $I8 goto __label_10 # for end
# {
.annotate 'line', 2060
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2061
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2062
isgt $I9, $I6, 127
unless $I9 goto __label_12
# {
.annotate 'line', 2063
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
.annotate 'line', 2064
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2067
# }
goto __label_9 # for iteration
__label_10: # for end
set $S1, $S4
.annotate 'line', 2069
# }
__label_4: # endif
.annotate 'line', 2071
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
.annotate 'line', 2073
unless $I2 goto __label_17
concat $S1, 'unicode:', $S1
__label_17: # endif
.annotate 'line', 2075
.return($S1)
# }
.annotate 'line', 2076

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2077
# Body
# {
.annotate 'line', 2079
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2080
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2081
getattribute $P3, $P1, 'type'
set $I2, $P3
iseq $I1, $I2, 2
unless $I1 goto __label_1
# {
.annotate 'line', 2082
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2083
$P4 = $P2.'unescape'('utf8')
set $S1, $P4
# }
__label_1: # endif
.annotate 'line', 2085
.return($S1)
# }
.annotate 'line', 2086

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2087
# Body
# {
.annotate 'line', 2089
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2090

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2091
# Body
# {
.annotate 'line', 2093
.tailcall self.'getPirString'()
# }
.annotate 'line', 2094

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'StringLiteral' ]
get_class $P1, [  'SimpleExpr' ]
# SimpleExpr
addparent $P0, $P1
.annotate 'line', 2024
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2103
# Body
# {
.annotate 'line', 2106
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2107
setattribute self, 'pos', __ARG_2
.annotate 'line', 2108
# int n: $I1
null $I1
.annotate 'line', 2109
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2110
# {
.annotate 'line', 2112
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2113
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2115
setattribute self, 'numval', $P2
# }
.annotate 'line', 2116

.end # IntegerLiteral


.sub 'isliteral' :method

.annotate 'line', 2117
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2118
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2119
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2120
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getIntegerValue' :method

.annotate 'line', 2121
# Body
# {
.annotate 'line', 2123
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2124
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2125
.return($I1)
# }
.annotate 'line', 2126

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2127
# Body
# {
.annotate 'line', 2129
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2130
iseq $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 2131
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2133
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2134

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2135
# Body
# {
.annotate 'line', 2137
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2138

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IntegerLiteral' ]
get_class $P1, [  'SimpleExpr' ]
# SimpleExpr
addparent $P0, $P1
.annotate 'line', 2101
addattribute $P0, 'pos'
.annotate 'line', 2102
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2146
# Body
# {
.annotate 'line', 2148
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2149
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2150

.end # FloatLiteral


.sub 'isliteral' :method

.annotate 'line', 2151
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2152
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2153
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'hascompilevalue' :method

.annotate 'line', 2154
# Body
# {
.return(1)
# }

.end # hascompilevalue


.sub 'getFloatValue' :method

.annotate 'line', 2155
# Body
# {
.annotate 'line', 2157
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2158
# var n: $P1
new $P1, ['Float']
assign $P1, $S1
.annotate 'line', 2160
.return($P1)
# }
.annotate 'line', 2161

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2162
# Body
# {
.annotate 'line', 2164
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2165
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2166

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2167
# Body
# {
.annotate 'line', 2171
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2172
# predefined indexof
index $I2, $S1, '.'
islt $I1, $I2, 0
unless $I1 goto __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2174
.return($S1)
# }
.annotate 'line', 2175

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'FloatLiteral' ]
get_class $P1, [  'SimpleExpr' ]
# SimpleExpr
addparent $P0, $P1
.annotate 'line', 2145
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2183
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2184
# Body
# {
.annotate 'line', 2186
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2187
setattribute self, 'name', __ARG_2
.annotate 'line', 2188
.return(self)
# }
.annotate 'line', 2189

.end # set


.sub 'isnull' :method

.annotate 'line', 2190
# Body
# {
.annotate 'line', 2192
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2193

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2194
# Body
# {
.annotate 'line', 2196
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2197
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
$P2 = $P1['type']
.annotate 'line', 2198
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2200
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
.annotate 'line', 2203
.return('P')
__label_3: # default
.annotate 'line', 2205
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2208

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2209
# Body
# {
.annotate 'line', 2211
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2212
.return($S1)
# }
.annotate 'line', 2213

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2214
# Body
# {
.annotate 'line', 2216
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2217
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 2218
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2219
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2220
# string s: $S1
null $S1
.annotate 'line', 2221
isnull $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 2222
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2223
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
.annotate 'line', 2229
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2233
$P4 = $P2['id']
isnull $I2, $P4
not $I2
unless $I2 goto __label_8
$P5 = $P2['id']
.annotate 'line', 2234
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2236
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2238
.return($S1)
# }
.annotate 'line', 2239

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2240
# Body
# {
.annotate 'line', 2242
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2243
$S2 = $P1
iseq $I1, $S2, ''
unless $I1 goto __label_0
# {
.annotate 'line', 2244
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S3, "Variable '", $S1
concat $S2, $S3, "' is not defined"
.annotate 'line', 2245
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2247
.return($P1)
# }
.annotate 'line', 2248

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2249
# Body
# {
.annotate 'line', 2251
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2252
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2253
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 2254
$I2 = $P2['const']
unless $I2 goto __label_2
$P3 = $P2['id']
isnull $I2, $P3
__label_2:
unless $I2 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2255
.return($P4)
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2257
.return(self)
# }
.annotate 'line', 2258

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2259
# Body
# {
.annotate 'line', 2261
self.'annotate'(__ARG_1)
.annotate 'line', 2262
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2263

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2264
# Body
# {
.annotate 'line', 2266
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2267

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2268
# Body
# {
.annotate 'line', 2270
self.'annotate'(__ARG_1)
.annotate 'line', 2271
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2272
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2273
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2274
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2277
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2280
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2283
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2284
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2286
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2287
iseq $I1, $S1, $S3
unless $I1 goto __label_11
# {
.annotate 'line', 2288
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2291
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2292
self.'annotate'(__ARG_1)
.annotate 'line', 2293
iseq $I2, $S1, 'P'
unless $I2 goto __label_16
isne $I2, $S3, 'P'
__label_16:
unless $I2 goto __label_14
.annotate 'line', 2294
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2296
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2299
.return($S2)
# }
.annotate 'line', 2300

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IdentifierExpr' ]
get_class $P1, [  'SimpleExpr' ]
# SimpleExpr
addparent $P0, $P1
.annotate 'line', 2182
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2307
# Body
# {
.annotate 'line', 2309
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2310

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

.annotate 'line', 2318
# Body
# {
.annotate 'line', 2320
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2321
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2322

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2323
# Body
# {
.annotate 'line', 2325
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2326

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2327
# Body
# {
.annotate 'line', 2329
self.'optimizearg'()
.annotate 'line', 2330
.return(self)
# }
.annotate 'line', 2331

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpUnaryExpr' ]
get_class $P1, [  'OpExpr' ]
# OpExpr
addparent $P0, $P1
.annotate 'line', 2317
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2340
# Body
# {
.annotate 'line', 2342
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2343
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2344
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2345

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2346
# Body
# {
.annotate 'line', 2348
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2349
.return(self)
# }
.annotate 'line', 2350

.end # set


.sub 'optimizearg' :method

.annotate 'line', 2351
# Body
# {
.annotate 'line', 2353
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2354
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2355

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2356
# Body
# {
.annotate 'line', 2358
self.'optimizearg'()
.annotate 'line', 2359
.return(self)
# }
.annotate 'line', 2360

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBinaryExpr' ]
get_class $P1, [  'OpExpr' ]
# OpExpr
addparent $P0, $P1
.annotate 'line', 2338
addattribute $P0, 'lexpr'
.annotate 'line', 2339
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2367
# Body
# {
.annotate 'line', 2369
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2370

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2371
# Body
# {
.annotate 'line', 2373
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2374
.return(self)
# }
.annotate 'line', 2375

.end # set


.sub 'optimize' :method

.annotate 'line', 2376
# Body
# {
.annotate 'line', 2378
self.'optimizearg'()
.annotate 'line', 2379
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2380
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2381
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2382
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2385
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2386
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2387
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2388
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2391
.return(self)
# }
.annotate 'line', 2392

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2393
# Body
# {
.annotate 'line', 2395
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2396
self.'annotate'(__ARG_1)
.annotate 'line', 2397
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2398

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpUnaryMinusExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2405
# Body
# {
.annotate 'line', 2407
.return('I')
# }
.annotate 'line', 2408

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2409
# Body
# {
.annotate 'line', 2411
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2412
.return(self)
# }
.annotate 'line', 2413

.end # set


.sub 'optimize' :method

.annotate 'line', 2414
# Body
# {
.annotate 'line', 2416
self.'optimizearg'()
.annotate 'line', 2417
getattribute $P3, self, 'subexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2418
# var numval: $P1
getattribute $P4, self, 'subexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2419
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2420
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2422
.return(self)
# }
.annotate 'line', 2423

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2424
# Body
# {
.annotate 'line', 2426
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2427
self.'annotate'(__ARG_1)
.annotate 'line', 2428
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2429
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2431
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2434
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2437
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2439

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpNotExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2446
# Body
# {
.annotate 'line', 2448
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2449

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2450
# Body
# {
.annotate 'line', 2452
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2453
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2454
.return(self)
# }
.annotate 'line', 2455

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2456
# Body
# {
.annotate 'line', 2458
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2459
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2460
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2461

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2462
# Body
# {
.annotate 'line', 2464
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2465
self.'annotate'(__ARG_1)
.annotate 'line', 2466
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2467
.return($S1)
# }
.annotate 'line', 2468

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

.annotate 'line', 2475
# Body
# {
.annotate 'line', 2477
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2478
.return(self)
# }
.annotate 'line', 2479

.end # set


.sub 'checkResult' :method

.annotate 'line', 2480
# Body
# {
.annotate 'line', 2482
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2483

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2484
# Body
# {
.annotate 'line', 2486
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2487
self.'annotate'(__ARG_1)
.annotate 'line', 2488
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2489
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2490
.return($S1)
# }
.annotate 'line', 2491

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpPostIncExpr' ]
get_class $P1, [  'OpUnaryExpr' ]
# OpUnaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2498
# Body
# {
.annotate 'line', 2500
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2501

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2502
# Body
# {
.annotate 'line', 2504
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2505
.return(self)
# }
.annotate 'line', 2506

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2507
# Body
# {
.annotate 'line', 2509
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2510
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2511
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2512

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2513
# Body
# {
.annotate 'line', 2515
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2516
self.'annotate'(__ARG_1)
.annotate 'line', 2517
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2518
.return($S1)
# }
.annotate 'line', 2519

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

.annotate 'line', 2526
# Body
# {
.annotate 'line', 2528
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2529
.return(self)
# }
.annotate 'line', 2530

.end # set


.sub 'checkResult' :method

.annotate 'line', 2531
# Body
# {
.annotate 'line', 2533
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2534

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2535
# Body
# {
.annotate 'line', 2537
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2538
self.'annotate'(__ARG_1)
.annotate 'line', 2539
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2540
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2541
.return($S1)
# }
.annotate 'line', 2542

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

.annotate 'line', 2551
# Body
# {
.annotate 'line', 2553
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2554
setattribute self, 'eleft', __ARG_3
.annotate 'line', 2555
setattribute self, 'eright', __ARG_4
.annotate 'line', 2556
.return(self)
# }
.annotate 'line', 2557

.end # set


.sub 'checkResult' :method

.annotate 'line', 2558
# Body
# {
.annotate 'line', 2560
getattribute $P2, self, 'eleft'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2561
getattribute $P3, self, 'eleft'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2563
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2564

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2565
# Body
# {
.annotate 'line', 2567
getattribute $P3, self, 'eleft'
$P2 = $P3.'optimize'()
setattribute self, 'eleft', $P2
.annotate 'line', 2568
getattribute $P3, self, 'eright'
$P2 = $P3.'optimize'()
setattribute self, 'eright', $P2
.annotate 'line', 2569
.return(self)
# }
.annotate 'line', 2570

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2571
# Body
# {
.annotate 'line', 2573
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2574

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBaseAssignExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 2549
addattribute $P0, 'eleft'
.annotate 'line', 2550
addattribute $P0, 'eright'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2581
# Body
# {
.annotate 'line', 2583
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2584
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
# {
.annotate 'line', 2585
self.'annotate'(__ARG_1)
.annotate 'line', 2586
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2588

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2589
# Body
# {
.annotate 'line', 2591
self.'annotate'(__ARG_1)
.annotate 'line', 2592
# var eleft: $P1
getattribute $P1, self, 'eleft'
.annotate 'line', 2593
getattribute $P2, self, 'eright'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2594

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

.annotate 'line', 2601
# Body
# {
.annotate 'line', 2603
self.'annotate'(__ARG_1)
.annotate 'line', 2604
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2605
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2606
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2607

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2608
# Body
# {
.annotate 'line', 2610
self.'annotate'(__ARG_1)
.annotate 'line', 2611
# string reg: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2612
# string reg2: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2613
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2614
.return($S1)
# }
.annotate 'line', 2615

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

.annotate 'line', 2622
# Body
# {
.annotate 'line', 2624
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2625
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2626
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2627

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2628
# Body
# {
.annotate 'line', 2630
# string ltype: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2631
# string rtype: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2632
# string reg: $S3
getattribute $P4, self, 'eleft'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2633
# string reg2: $S4
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2634
self.'annotate'(__ARG_1)
.annotate 'line', 2635
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
# {
.annotate 'line', 2636
isne $I2, $S2, 'S'
unless $I2 goto __label_6
# {
.annotate 'line', 2637
# string aux: $S5
$P5 = self.'tempreg'('S')
null $S5
if_null $P5, __label_7
set $S5, $P5
__label_7:
.annotate 'line', 2638
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2639
# }
__label_6: # endif
.annotate 'line', 2641
__ARG_1.'emitconcat'($S3, $S3, $S4)
# }
goto __label_5
__label_4: # else
.annotate 'line', 2644
__ARG_1.'emitaddto'($S3, $S4)
__label_5: # endif
.annotate 'line', 2645
.return($S3)
# }
.annotate 'line', 2646

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

.annotate 'line', 2653
# Body
# {
.annotate 'line', 2655
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2656
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2657
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2658

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2659
# Body
# {
.annotate 'line', 2661
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2662
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2663
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2664
self.'annotate'(__ARG_1)
.annotate 'line', 2665
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2666
.return($S2)
# }
.annotate 'line', 2667

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

.annotate 'line', 2674
# Body
# {
.annotate 'line', 2676
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2677
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2678
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2679

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2680
# Body
# {
.annotate 'line', 2682
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2683
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2684
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2685
self.'annotate'(__ARG_1)
.annotate 'line', 2686
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2687
.return($S2)
# }
.annotate 'line', 2688

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

.annotate 'line', 2695
# Body
# {
.annotate 'line', 2697
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2698
$S2 = __ARG_2
isne $I1, $S2, ''
unless $I1 goto __label_1
.annotate 'line', 2699
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2700

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2701
# Body
# {
.annotate 'line', 2703
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2704
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2705
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2706
self.'annotate'(__ARG_1)
.annotate 'line', 2707
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2708
.return($S2)
# }
.annotate 'line', 2709

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpDivToExpr' ]
get_class $P1, [  'OpBaseAssignExpr' ]
# OpBaseAssignExpr
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2716
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2717
# Body
# {
.annotate 'line', 2719
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2720
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2721
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2722
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2723
self.'annotate'(__ARG_1)
.annotate 'line', 2724
# string aux: $S5
null $S5
.annotate 'line', 2725
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2727
iseq $I2, $S1, 'I'
unless $I2 goto __label_7
# {
.annotate 'line', 2728
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2729
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2730
# }
__label_7: # endif
.annotate 'line', 2732
iseq $I1, $S2, 'I'
unless $I1 goto __label_8
# {
.annotate 'line', 2733
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2734
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2735
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2738
iseq $I2, $S2, 'I'
unless $I2 goto __label_11
iseq $I2, $S1, 'P'
__label_11:
unless $I2 goto __label_9
# {
.annotate 'line', 2739
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2740
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2741
# }
goto __label_10
__label_9: # else
.annotate 'line', 2743
iseq $I3, $S2, 'P'
unless $I3 goto __label_14
iseq $I3, $S1, 'I'
__label_14:
unless $I3 goto __label_12
# {
.annotate 'line', 2744
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2745
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2746
# }
goto __label_13
__label_12: # else
.annotate 'line', 2748
iseq $I3, $S2, 'S'
unless $I3 goto __label_17
iseq $I3, $S1, 'P'
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 2749
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2750
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2751
# }
goto __label_16
__label_15: # else
.annotate 'line', 2753
iseq $I4, $S2, 'P'
unless $I4 goto __label_19
iseq $I4, $S1, 'S'
__label_19:
unless $I4 goto __label_18
# {
.annotate 'line', 2754
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2755
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2756
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 2759
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
# }
.annotate 'line', 2760

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2761
# Body
# {
.annotate 'line', 2763
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2764

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ComparatorBaseExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2776
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2777
# Body
# {
.annotate 'line', 2779
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2780
setattribute self, 'expr', __ARG_2
.annotate 'line', 2781
.return(self)
# }
.annotate 'line', 2782

.end # set

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NullCheckerExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 2774
addattribute $P0, 'expr'
.end
.namespace [ 'OpIsNullExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2787
# Body
# {
.annotate 'line', 2789
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2790
self.'annotate'(__ARG_1)
.annotate 'line', 2791
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2792

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

.annotate 'line', 2797
# Body
# {
.annotate 'line', 2799
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2800
self.'annotate'(__ARG_1)
.annotate 'line', 2801
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2802
__ARG_1.'say'('not ', __ARG_2)
# }
.annotate 'line', 2803

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpNotNullExpr' ]
get_class $P1, [  'NullCheckerExpr' ]
# NullCheckerExpr
addparent $P0, $P1
.end
.namespace [ 'OpEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2810
# Body
# {
.annotate 'line', 2812
self.'optimizearg'()
.annotate 'line', 2813
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2814
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2815
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2816
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2817
unless $I1 goto __label_0
# {
.annotate 'line', 2818
unless $I2 goto __label_1
.annotate 'line', 2819
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 2821
new $P6, [  'OpIsNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2823
unless $I2 goto __label_3
.annotate 'line', 2824
new $P4, [  'OpIsNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2825
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2826
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2827
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2828
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2829
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2830
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2831
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2834
.return(self)
# }
.annotate 'line', 2835

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2836
# Body
# {
.annotate 'line', 2838
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2839

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2840
# Body
# {
.annotate 'line', 2842
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2843

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpEqualExpr' ]
get_class $P1, [  'ComparatorBaseExpr' ]
# ComparatorBaseExpr
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'optimize' :method

.annotate 'line', 2850
# Body
# {
.annotate 'line', 2852
self.'optimizearg'()
.annotate 'line', 2853
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2854
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2855
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2856
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2857
unless $I1 goto __label_0
# {
.annotate 'line', 2858
unless $I2 goto __label_1
.annotate 'line', 2859
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 2861
new $P6, [  'OpNotNullExpr' ]
getattribute $P7, self, 'rexpr'
.tailcall $P6.'set'(self, $P7)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2863
unless $I2 goto __label_3
.annotate 'line', 2864
new $P4, [  'OpNotNullExpr' ]
getattribute $P5, self, 'lexpr'
.tailcall $P4.'set'(self, $P5)
__label_3: # endif
.annotate 'line', 2865
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2866
# string ltype: $S1
$P6 = $P1.'checkResult'()
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 2867
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_7
set $S2, $P7
__label_7:
.annotate 'line', 2868
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2869
# string ls: $S3
getattribute $P9, $P1, 'strval'
getattribute $P8, $P9, 'str'
null $S3
if_null $P8, __label_10
set $S3, $P8
__label_10:
.annotate 'line', 2870
# string rs: $S4
getattribute $P9, $P2, 'strval'
getattribute $P8, $P9, 'str'
null $S4
if_null $P8, __label_11
set $S4, $P8
__label_11:
.annotate 'line', 2871
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P10, $P11, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2874
.return(self)
# }
.annotate 'line', 2875

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2876
# Body
# {
.annotate 'line', 2878
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2879

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2880
# Body
# {
.annotate 'line', 2882
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2883

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

.annotate 'line', 2890
# Body
# {
.annotate 'line', 2892
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2893

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

.annotate 'line', 2900
# Body
# {
.annotate 'line', 2902
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2903

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

.annotate 'line', 2910
# Body
# {
.annotate 'line', 2912
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2913

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

.annotate 'line', 2920
# Body
# {
.annotate 'line', 2922
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2923

.end # emitop

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpGreaterEqualExpr' ]
get_class $P1, [  'ComparatorBaseExpr' ]
# ComparatorBaseExpr
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2930
# Body
# {
.annotate 'line', 2932
.return('I')
# }
.annotate 'line', 2933

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBaseBoolExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 2940
# Body
# {
.annotate 'line', 2942
self.'optimizearg'()
.annotate 'line', 2943
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2944
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2945
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2946
isne $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2947
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2949
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2951
.return(self)
# }
.annotate 'line', 2952

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2953
# Body
# {
.annotate 'line', 2955
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
.annotate 'line', 2956
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 2957
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 2958
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 2959
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 2960
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 2961
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 2964
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 2965
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 2966
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 2967
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 2968
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 2970

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBoolAndExpr' ]
get_class $P1, [  'OpBaseBoolExpr' ]
# OpBaseBoolExpr
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 2977
# Body
# {
.annotate 'line', 2979
self.'optimizearg'()
.annotate 'line', 2980
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2981
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 2982
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 2983
iseq $I2, $I1, 0
unless $I2 goto __label_1
.annotate 'line', 2984
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 2986
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2988
.return(self)
# }
.annotate 'line', 2989

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2990
# Body
# {
.annotate 'line', 2992
# string res: $S1
null $S1
.annotate 'line', 2993
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 2996
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 2997
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 2998
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 2999
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3000
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3001
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3002
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3005
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3006
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3007
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3008
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3009
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3011

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBoolOrExpr' ]
get_class $P1, [  'OpBaseBoolExpr' ]
# OpBaseBoolExpr
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3018
# Body
# {
.annotate 'line', 3020
.return('I')
# }
.annotate 'line', 3021

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBaseBinExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3028
# Body
# {
.annotate 'line', 3030
self.'optimizearg'()
.annotate 'line', 3031
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3032
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3033
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3034
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3035
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3036
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3038
.return(self)
# }
.annotate 'line', 3039

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3040
# Body
# {
.annotate 'line', 3042
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
.annotate 'line', 3043
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3044
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3045
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3046
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3047
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3048

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBinAndExpr' ]
get_class $P1, [  'OpBaseBinExpr' ]
# OpBaseBinExpr
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3055
# Body
# {
.annotate 'line', 3057
self.'optimizearg'()
.annotate 'line', 3058
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3059
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3060
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3061
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3062
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3063
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3065
.return(self)
# }
.annotate 'line', 3066

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3067
# Body
# {
.annotate 'line', 3069
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
.annotate 'line', 3070
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3071
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3072
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3073
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3074
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3075

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpBinOrExpr' ]
get_class $P1, [  'OpBaseBinExpr' ]
# OpBaseBinExpr
addparent $P0, $P1
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3082
# Body
# {
.annotate 'line', 3084
self.'optimizearg'()
.annotate 'line', 3085
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3086
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3087
$I4 = $P1.'isliteral'()
unless $I4 goto __label_1
$I4 = $P2.'isliteral'()
__label_1:
unless $I4 goto __label_0
# {
.annotate 'line', 3088
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_2
set $S1, $P10
__label_2:
.annotate 'line', 3089
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_3
set $S2, $P10
__label_3:
.annotate 'line', 3090
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3091
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3092
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3093
# var t: $P5
null $P5
.annotate 'line', 3094
# int newtype: $I1
null $I1
.annotate 'line', 3095
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
.annotate 'line', 3099
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_9
set $S3, $P11
__label_9:
.annotate 'line', 3100
# string rs: $S4
getattribute $P12, $P4, 'str'
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
concat $S5, $S3, $S4
.annotate 'line', 3101
$P5 = 'newTokenFrom'($I1, $S5, $P3)
.annotate 'line', 3102
new $P14, [  'StringLiteral' ]
getattribute $P15, self, 'owner'
$P14.'StringLiteral'($P15, $P5)
set $P13, $P14
.return($P13)
# }
__label_4: # endif
.annotate 'line', 3104
iseq $I5, $S1, 'I'
unless $I5 goto __label_12
iseq $I5, $S2, 'I'
__label_12:
unless $I5 goto __label_11
# {
.annotate 'line', 3105
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3106
# int ln: $I2
set $P13, $P6
set $I2, $P13
.annotate 'line', 3107
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3108
# int rn: $I3
set $P14, $P7
set $I3, $P14
.annotate 'line', 3109
getattribute $P15, self, 'owner'
getattribute $P16, self, 'start'
add $I6, $I2, $I3
.tailcall 'integerValue'($P15, $P16, $I6)
# }
__label_11: # endif
# {
.annotate 'line', 3112
$P16 = 'floatresult'($S1, $S2)
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 3113
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3114
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3115
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3116
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3117
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P17, $P18, $N3)
# }
__label_13: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3121
.return(self)
# }
.annotate 'line', 3122

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3123
# Body
# {
.annotate 'line', 3125
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3126
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3127
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3128
.return($S1)
__label_2: # endif
.annotate 'line', 3129
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3130
.return('S')
__label_3: # endif
.annotate 'line', 3131
iseq $I2, $S1, 'S'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3132
.return('S')
__label_5: # endif
.annotate 'line', 3133
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3134
.return('N')
__label_7: # endif
.annotate 'line', 3135
.return('I')
# }
.annotate 'line', 3136

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3137
# Body
# {
.annotate 'line', 3139
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3140
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3141
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3142
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3143
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3145
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3146
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3147
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
# {
.annotate 'line', 3148
isne $I2, $S2, 'S'
if $I2 goto __label_8
isne $I2, $S3, 'S'
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 3149
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3150
isne $I1, $S2, 'S'
unless $I1 goto __label_10
# {
.annotate 'line', 3151
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3152
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3155
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3156
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3159
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3162
iseq $I2, $S1, 'I'
unless $I2 goto __label_14
isne $I2, $S2, 'I'
if $I2 goto __label_15
isne $I2, $S3, 'I'
__label_15:
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3163
# string l: $S7
null $S7
.annotate 'line', 3164
iseq $I3, $S2, 'I'
unless $I3 goto __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3166
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3167
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3169
# string r: $S8
null $S8
.annotate 'line', 3170
iseq $I3, $S3, 'I'
unless $I3 goto __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3172
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3173
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3175
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3178
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3180

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpAddExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3187
# Body
# {
.annotate 'line', 3189
self.'optimizearg'()
.annotate 'line', 3190
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3191
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3192
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3193
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3194
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3195
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3196
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3197
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3198
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3199
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3200
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3203
.return(self)
# }
.annotate 'line', 3204

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3205
# Body
# {
.annotate 'line', 3207
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3208
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3209
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3210
.return($S1)
__label_2: # endif
.annotate 'line', 3211
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3212
.return('N')
__label_3: # endif
.annotate 'line', 3213
iseq $I2, $S1, 'N'
unless $I2 goto __label_6
iseq $I2, $S2, 'I'
__label_6:
unless $I2 goto __label_5
.annotate 'line', 3214
.return('N')
__label_5: # endif
.annotate 'line', 3215
.return('I')
# }
.annotate 'line', 3216

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3217
# Body
# {
.annotate 'line', 3219
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3220
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3221
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3222

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpSubExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3229
# Body
# {
.annotate 'line', 3231
self.'optimizearg'()
.annotate 'line', 3232
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3233
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3234
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3235
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3236
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3237
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3238
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3239
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3240
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3241
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3242
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
set $I5, $I1
set $I6, $I2
mul $I4, $I5, $I6
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3245
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3246
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3247
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3248
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3249
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3250
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3254
.return(self)
# }
.annotate 'line', 3255

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3256
# Body
# {
.annotate 'line', 3258
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3259
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3260
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3261
iseq $I1, $S1, $S2
unless $I1 goto __label_2
.annotate 'line', 3262
.return($S1)
__label_2: # endif
.annotate 'line', 3263
iseq $I1, $S1, 'S'
unless $I1 goto __label_3
.annotate 'line', 3264
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3266
.return('N')
__label_4: # endif
# }
.annotate 'line', 3267

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3268
# Body
# {
.annotate 'line', 3270
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3271
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3272
# var ltype: $P3
$P3 = $P1.'checkResult'()
.annotate 'line', 3273
$S10 = $P3
iseq $I3, $S10, 'S'
unless $I3 goto __label_0
# {
.annotate 'line', 3274
# string lreg: $S1
$P4 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 3275
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 3276
# string rval: $S3
null $S3
.annotate 'line', 3277
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
.annotate 'line', 3282
$P6 = self.'tempreg'('I')
set $S3, $P6
.annotate 'line', 3283
__ARG_1.'emitset'($S3, $S2)
__label_3: # switch end
.annotate 'line', 3285
self.'annotate'(__ARG_1)
.annotate 'line', 3286
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S1, ', ', $S3)
.annotate 'line', 3287
.return()
# }
__label_0: # endif
.annotate 'line', 3292
$S11 = $P3
iseq $I3, $S11, 'N'
unless $I3 goto __label_6
# {
.annotate 'line', 3293
# string lreg: $S4
$P5 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_7
set $S4, $P5
__label_7:
.annotate 'line', 3294
# string rreg: $S5
$P6 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P6, __label_8
set $S5, $P6
__label_8:
.annotate 'line', 3295
# string rval: $S6
null $S6
.annotate 'line', 3296
$P7 = $P2.'checkResult'()
set $S12, $P7
set $S13, 'I'
if $S12 == $S13 goto __label_11
set $S13, 'N'
if $S12 == $S13 goto __label_12
goto __label_10
# switch
__label_11: # case
.annotate 'line', 3298
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3299
__ARG_1.'emitset'($S6, $S5)
set $S6, $S5
goto __label_9 # break
__label_12: # case
set $S6, $S5
goto __label_9 # break
__label_10: # default
.annotate 'line', 3306
$P9 = self.'tempreg'('N')
set $S6, $P9
.annotate 'line', 3307
__ARG_1.'emitset'($S6, $S5)
__label_9: # switch end
.annotate 'line', 3309
self.'annotate'(__ARG_1)
.annotate 'line', 3310
__ARG_1.'say'('mul ', __ARG_2, ', ', $S4, ', ', $S6)
.annotate 'line', 3311
.return()
# }
__label_6: # endif
.annotate 'line', 3314
# string rleft: $S7
null $S7
.annotate 'line', 3315
# string rright: $S8
null $S8
.annotate 'line', 3316
# int nleft: $I1
null $I1
.annotate 'line', 3317
# int nright: $I2
null $I2
.annotate 'line', 3318
$P7 = $P1.'issimple'()
isfalse $I4, $P7
if $I4 goto __label_15
$I4 = $P1.'isidentifier'()
__label_15:
unless $I4 goto __label_13
# {
.annotate 'line', 3319
$P9 = self.'checkResult'()
$P8 = self.'tempreg'($P9)
set $S7, $P8
.annotate 'line', 3320
$P1.'emit'(__ARG_1, $S7)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 3323
$P10 = $P1.'getIntegerValue'()
set $I1, $P10
set $S7, $I1
.annotate 'line', 3324
# }
__label_14: # endif
.annotate 'line', 3326
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_18
$I4 = $P2.'isidentifier'()
__label_18:
unless $I4 goto __label_16
# {
.annotate 'line', 3327
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S8, $P11
.annotate 'line', 3328
$P2.'emit'(__ARG_1, $S8)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 3331
# string type: $S9
$P11 = $P2.'checkResult'()
null $S9
if_null $P11, __label_19
set $S9, $P11
__label_19:
set $S12, $S9
set $S13, 'S'
.annotate 'line', 3332
if $S12 == $S13 goto __label_22
set $S13, 'I'
if $S12 == $S13 goto __label_23
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3334
$P13 = self.'checkResult'()
$P12 = self.'tempreg'($P13)
set $S8, $P12
.annotate 'line', 3335
$P2.'emit'(__ARG_1, $S8)
goto __label_20 # break
__label_23: # case
__label_21: # default
.annotate 'line', 3339
$P14 = $P2.'getIntegerValue'()
set $I2, $P14
set $S8, $I2
goto __label_20 # break
__label_20: # switch end
.annotate 'line', 3341
# }
__label_17: # endif
.annotate 'line', 3344
self.'annotate'(__ARG_1)
.annotate 'line', 3345
__ARG_1.'say'('mul ', __ARG_2, ', ', $S7, ', ', $S8)
# }
.annotate 'line', 3346

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpMulExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3353
# Body
# {
.annotate 'line', 3355
self.'optimizearg'()
.annotate 'line', 3356
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3357
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3358
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3359
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3360
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3361
# var lval: $P3
null $P3
.annotate 'line', 3362
# var rval: $P4
null $P4
.annotate 'line', 3363
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3364
getattribute $P3, $P1, 'numval'
.annotate 'line', 3365
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3366
getattribute $P4, $P2, 'numval'
.annotate 'line', 3367
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3368
isne $I4, $I2, 0
unless $I4 goto __label_6
.annotate 'line', 3369
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
.annotate 'line', 3372
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3373
getattribute $P3, $P1, 'numval'
.annotate 'line', 3374
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3375
getattribute $P4, $P2, 'numval'
.annotate 'line', 3376
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3377
isne $I4, $N2, $N3
unless $I4 goto __label_8
.annotate 'line', 3378
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
.annotate 'line', 3382
.return(self)
# }
.annotate 'line', 3383

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3384
# Body
# {
.annotate 'line', 3386
.return('N')
# }
.annotate 'line', 3387

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3388
# Body
# {
.annotate 'line', 3390
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3391
# var lreg: $P2
null $P2
.annotate 'line', 3392
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_0
.annotate 'line', 3393
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3395
$P2 = self.'tempreg'('N')
.annotate 'line', 3396
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3398
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3399
# var rreg: $P4
null $P4
.annotate 'line', 3400
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'N'
unless $I1 goto __label_2
.annotate 'line', 3401
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3403
$P4 = self.'tempreg'('N')
.annotate 'line', 3404
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3406
self.'annotate'(__ARG_1)
.annotate 'line', 3407
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3408

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpDivExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3415
# Body
# {
.annotate 'line', 3417
.return('I')
# }
.annotate 'line', 3418

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3419
# Body
# {
.annotate 'line', 3421
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3422
# var lreg: $P2
null $P2
.annotate 'line', 3423
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3424
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3426
$P2 = self.'tempreg'('I')
.annotate 'line', 3427
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3429
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3430
# var rreg: $P4
null $P4
.annotate 'line', 3431
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3432
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3434
$P4 = self.'tempreg'('I')
.annotate 'line', 3435
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3437
self.'annotate'(__ARG_1)
.annotate 'line', 3438
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3439

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpModExpr' ]
get_class $P1, [  'OpBinaryExpr' ]
# OpBinaryExpr
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3446
# Body
# {
.annotate 'line', 3448
.return('I')
# }
.annotate 'line', 3449

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3450
# Body
# {
.annotate 'line', 3452
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3453
# var lreg: $P2
null $P2
.annotate 'line', 3454
$P5 = $P1.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_0
.annotate 'line', 3455
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3457
$P2 = self.'tempreg'('I')
.annotate 'line', 3458
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3460
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3461
# var rreg: $P4
null $P4
.annotate 'line', 3462
$P5 = $P3.'checkResult'()
$S1 = $P5
iseq $I1, $S1, 'I'
unless $I1 goto __label_2
.annotate 'line', 3463
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3465
$P4 = self.'tempreg'('I')
.annotate 'line', 3466
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3468
self.'annotate'(__ARG_1)
.annotate 'line', 3473
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3474

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

.annotate 'line', 3483
# Body
# {
.annotate 'line', 3485
setattribute self, 'arg', __ARG_1
.annotate 'line', 3486
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3487

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3488
# Body
# {
.annotate 'line', 3490
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3491
.return(self)
# }
.annotate 'line', 3492

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3493
# Body
# {
.annotate 'line', 3495
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3496

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Argument' ]
.annotate 'line', 3481
addattribute $P0, 'arg'
.annotate 'line', 3482
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3499
# Body
# {
.annotate 'line', 3501
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3502
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3503
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3504
.return(1)
# }
.annotate 'line', 3505

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3514
# Body
# {
.annotate 'line', 3516
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3517
setattribute self, 'predef', __ARG_3
.annotate 'line', 3518
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3519

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3520
# Body
# {
.annotate 'line', 3522
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3523

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3524
# Body
# {
.annotate 'line', 3526
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3527
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3528
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3529
# var arg: $P4
null $P4
.annotate 'line', 3530
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3531
iseq $I4, $I1, -1
unless $I4 goto __label_0
# {
.annotate 'line', 3532
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3533
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3534
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3538
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3539
# int i: $I3
null $I3
goto __label_7
__label_5: # for iteration
inc $I3
__label_7: # for condition
islt $I4, $I3, $I2
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 3540
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3541
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3542
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3543
# string argr: $S4
null $S4
.annotate 'line', 3544
iseq $I5, $S2, $S3
if $I5 goto __label_12
iseq $I5, $S3, '?'
__label_12:
unless $I5 goto __label_10
.annotate 'line', 3545
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3547
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3548
iseq $I5, $S3, 'P'
unless $I5 goto __label_13
# {
.annotate 'line', 3549
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3550
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
.annotate 'line', 3555
isne $I6, $S5, ''
unless $I6 goto __label_19
.annotate 'line', 3556
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3558
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3560
$P3.'push'($S4)
# }
goto __label_5 # for iteration
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3563
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3564

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'CallPredefExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3511
addattribute $P0, 'predef'
.annotate 'line', 3512
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3574
# Body
# {
.annotate 'line', 3576
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3577
setattribute self, 'funref', __ARG_4
.annotate 'line', 3578
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3579
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3580
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3581
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3582
# {
.annotate 'line', 3583
# var modifier: $P2
null $P2
.annotate 'line', 3584
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3585
$P1 = __ARG_1.'get'()
.annotate 'line', 3586
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3587
$P1 = __ARG_1.'get'()
.annotate 'line', 3588
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3589
new $P8, [  'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3590
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3593
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3596
getattribute $P7, self, 'args'
new $P9, [  'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3597
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3598
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3599
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3601

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3602
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3603
# Body
# {
.annotate 'line', 3605
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3606
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3607
'optimize_array'($P1)
.annotate 'line', 3610
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3611
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3612
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3613
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3614
isnull $I1, $P3
not $I1
unless $I1 goto __label_2
# {
.annotate 'line', 3615
self.'use_predef'($S1)
.annotate 'line', 3618
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3619
isnull $I2, $P4
not $I2
unless $I2 goto __label_3
# {
.annotate 'line', 3620
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3621
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3624
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
.annotate 'line', 3628
.return(self)
# }
.annotate 'line', 3629

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3630
# Body
# {
.annotate 'line', 3632
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3633
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3634
# string call: $S1
null $S1
.annotate 'line', 3635
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3636
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 3637
iseq $I6, $S1, ''
unless $I6 goto __label_2
# {
.annotate 'line', 3638
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S8, "'", $S2
concat $S1, $S8, "'"
.annotate 'line', 3639
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3643
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 3645
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3646
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 3647
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 3648
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 3649
# string reg: $S3
null $S3
.annotate 'line', 3650
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 3651
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 3652
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 3655
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 3656
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 3658
self.'annotate'(__ARG_1)
.annotate 'line', 3660
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 3661
$S9 = __ARG_2
iseq $I7, $S9, '.tailcall'
unless $I7 goto __label_12
.annotate 'line', 3662
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 3664
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 3667
unless $I1 goto __label_14
.annotate 'line', 3668
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 3670
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 3672
__ARG_1.'print'('(')
.annotate 'line', 3674
# string sep: $S4
set $S4, ''
.annotate 'line', 3675
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 3676
# int i: $I3
null $I3
goto __label_18
__label_16: # for iteration
inc $I3
__label_18: # for condition
islt $I7, $I3, $I2
unless $I7 goto __label_17 # for end
# {
.annotate 'line', 3677
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 3678
__ARG_1.'print'($S4, $S5)
.annotate 'line', 3679
# int isflat: $I4
null $I4
.annotate 'line', 3680
# int isnamed: $I5
null $I5
.annotate 'line', 3681
# string setname: $S6
set $S6, ''
.annotate 'line', 3682
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 3683
isnull $I8, $P6
not $I8
unless $I8 goto __label_19
# {
.annotate 'line', 3684
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 3685
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 3686
iseq $I8, $S7, 'flat'
unless $I8 goto __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 3688
iseq $I9, $S7, 'named'
unless $I9 goto __label_24
# {
set $I5, 1
.annotate 'line', 3690
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
.annotate 'line', 3694
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 3695
$P17 = $P8.'isstringliteral'()
isfalse $I11, $P17
unless $I11 goto __label_29
.annotate 'line', 3696
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 3697
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 3700
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
.annotate 'line', 3705
and $I10, $I11, $I12
unless $I10 goto __label_30
.annotate 'line', 3706
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 3707
unless $I4 goto __label_32
.annotate 'line', 3708
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 3709
unless $I5 goto __label_34
# {
.annotate 'line', 3710
__ARG_1.'print'(' :named')
.annotate 'line', 3711
isne $I12, $S6, ''
unless $I12 goto __label_35
.annotate 'line', 3712
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 3714
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 3716
__ARG_1.'say'(')')
# }
.annotate 'line', 3717

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'CallExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3571
addattribute $P0, 'funref'
.annotate 'line', 3572
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3727
# Body
# {
.annotate 'line', 3729
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3730
setattribute self, 'left', __ARG_4
.annotate 'line', 3731
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 3732

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 3733
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3734
# Body
# {
.annotate 'line', 3736
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3737
.return(self)
# }
.annotate 'line', 3738

.end # optimize


.sub 'get_member' :method

.annotate 'line', 3739
# Body
# {
.annotate 'line', 3741
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 3742

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 3743
# Body
# {
.annotate 'line', 3745
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 3746
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3747
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3748
isne $I1, $S1, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3749
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 3750
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 3751
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 3753
.return($S2)
# }
.annotate 'line', 3754

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3755
# Body
# {
.annotate 'line', 3757
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3758
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3759
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3760
self.'annotate'(__ARG_1)
.annotate 'line', 3761
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 3762
.return($S3)
# }
.annotate 'line', 3763

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3764
# Body
# {
.annotate 'line', 3766
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3767
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3768
self.'annotate'(__ARG_1)
.annotate 'line', 3769
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 3770

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

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
# string value: $S3
null $S3
.annotate 'line', 3776
iseq $I1, __ARG_2, 'P'
unless $I1 goto __label_2
# {
.annotate 'line', 3778
iseq $I2, __ARG_3, 'null'
unless $I2 goto __label_4
# {
.annotate 'line', 3779
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 3780
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 3782
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3785
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 3786
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 3788
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 3789

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3790
# Body
# {
.annotate 'line', 3792
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3793
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3794
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3795
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 3796
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3798
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 3799
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
isne $I1, $S5, 'P'
unless $I1 goto __label_6
.annotate 'line', 3800
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 3802
# }
__label_4: # endif
.annotate 'line', 3804
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 3805
.return($S3)
# }
.annotate 'line', 3806

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'MemberExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3724
addattribute $P0, 'left'
.annotate 'line', 3725
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3815
# Body
# {
.annotate 'line', 3817
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3818
setattribute self, 'left', __ARG_4
.annotate 'line', 3819
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 3820

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 3821
# Body
# {
.annotate 'line', 3823
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
iseq $I1, $S1, 'S'
unless $I1 goto __label_0
.annotate 'line', 3824
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 3826
.return('P')
__label_1: # endif
# }
.annotate 'line', 3827

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3828
# Body
# {
.annotate 'line', 3830
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 3831
self.'optimizeargs'()
.annotate 'line', 3832
.return(self)
# }
.annotate 'line', 3833

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3834
# Body
# {
.annotate 'line', 3836
# var regleft: $P1
null $P1
.annotate 'line', 3837
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 3838
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 3840
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 3841
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 3842
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3843
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 3844
iseq $I2, $S1, 'S'
unless $I2 goto __label_3
# {
.annotate 'line', 3845
isne $I3, $I1, 1
unless $I3 goto __label_5
.annotate 'line', 3846
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 3847
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3850
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 3851
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3852
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 3854

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 3855
# Body
# {
.annotate 'line', 3857
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3858
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3859
self.'annotate'(__ARG_1)
.annotate 'line', 3860
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3861
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 3862
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 3863

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3864
# Body
# {
.annotate 'line', 3866
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 3867
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 3868
# string rreg: $S1
null $S1
.annotate 'line', 3869
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3870
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 3871
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 3874
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 3875
self.'annotate'(__ARG_1)
.annotate 'line', 3876
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 3877
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 3878
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 3879
.return($S1)
# }
.annotate 'line', 3880

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IndexExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
get_class $P2, [  'SimpleArgList' ]
# SimpleArgList
addparent $P0, $P2
.annotate 'line', 3813
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3889
# Body
# {
.annotate 'line', 3891
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3892
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 3893
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3894
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 3895
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3896
# {
.annotate 'line', 3897
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3898
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 3899
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 3900
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 3901
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3903

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 3904
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3905
# Body
# {
.annotate 'line', 3907
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3908
.return(self)
# }
.annotate 'line', 3909

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3910
# Body
# {
.annotate 'line', 3912
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3913
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3914

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3915
# Body
# {
.annotate 'line', 3917
self.'annotate'(__ARG_1)
.annotate 'line', 3918
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3919
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 3920
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3921
# string itemreg: $S3
null $S3
.annotate 'line', 3922
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 3923
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 3924
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
.annotate 'line', 3926
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 3927
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 3931
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 3933
self.'annotate'(__ARG_1)
.annotate 'line', 3934
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 3936
.return($S1)
# }
.annotate 'line', 3937

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ArrayExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3887
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3947
# Body
# {
.annotate 'line', 3949
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3950
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3951
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 3952
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 3953
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 3954
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3955
# {
.annotate 'line', 3963
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3964
'ExpectOp'(':', __ARG_1)
.annotate 'line', 3965
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3966
$P2.'push'($P4)
.annotate 'line', 3967
$P3.'push'($P5)
# }
.annotate 'line', 3969
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 3970
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 3971
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3973
setattribute self, 'keys', $P2
.annotate 'line', 3974
setattribute self, 'values', $P3
# }
.annotate 'line', 3975

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 3976
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3977
# Body
# {
.annotate 'line', 3979
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 3980
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 3981
.return(self)
# }
.annotate 'line', 3982

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3983
# Body
# {
.annotate 'line', 3985
self.'annotate'(__ARG_1)
.annotate 'line', 3986
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 3987
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 3988
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 3989
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 3990
# int i: $I2
null $I2
goto __label_2
__label_0: # for iteration
inc $I2
__label_2: # for condition
islt $I3, $I2, $I1
unless $I3 goto __label_1 # for end
# {
.annotate 'line', 3991
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 3992
# string item: $S1
null $S1
.annotate 'line', 3993
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 3994
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 3995
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 3996
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 3999
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4001
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4002
# string itemreg: $S3
null $S3
.annotate 'line', 4003
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4004
# string id: $S4
$P8 = $P4.'getName'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4005
getattribute $P9, self, 'owner'
$P8 = $P9.'getvar'($S4)
isnull $I3, $P8
unless $I3 goto __label_9
# {
.annotate 'line', 4006
$P10 = self.'tempreg'('P')
set $S3, $P10
.annotate 'line', 4007
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S4, "'")
# }
goto __label_10
__label_9: # else
.annotate 'line', 4010
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4013
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4014
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
goto __label_0 # for iteration
__label_1: # for end
# }
.annotate 'line', 4036

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4037
# Body
# {
.annotate 'line', 4039
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4040
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4041
.return($S1)
# }
.annotate 'line', 4042

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'HashExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 3944
addattribute $P0, 'keys'
.annotate 'line', 3945
addattribute $P0, 'values'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4052
# Body
# {
.annotate 'line', 4054
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4056
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4057
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4058
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4059
$P6 = __ARG_4.'isidentifier'()
if_null $P6, __label_2
unless $P6 goto __label_2
# {
.annotate 'line', 4060
$P7 = $P1.'isop'('.')
if_null $P7, __label_4
unless $P7 goto __label_4
# {
.annotate 'line', 4061
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4062
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4063
# {
.annotate 'line', 4064
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4065
$P6 = $P3.'isidentifier'()
isfalse $I1, $P6
unless $I1 goto __label_9
.annotate 'line', 4066
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4067
$P2.'push'($P3)
# }
.annotate 'line', 4068
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'('.')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 4069
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4072
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4075
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4077
$P9 = $P1.'isop'('(')
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 4078
$P1 = __ARG_1.'get'()
.annotate 'line', 4079
$P10 = $P1.'isop'(')')
isfalse $I2, $P10
unless $I2 goto __label_12
# {
.annotate 'line', 4080
__ARG_1.'unget'($P1)
.annotate 'line', 4081
# var initializer: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
set $P4, $P10
__label_13: # do
.annotate 'line', 4082
# {
.annotate 'line', 4083
# var auxinit: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4084
$P4.'push'($P5)
# }
.annotate 'line', 4085
$P1 = __ARG_1.'get'()
$P11 = $P1.'isop'(',')
if_null $P11, __label_14
if $P11 goto __label_13
__label_14: # enddo
.annotate 'line', 4086
setattribute self, 'initializer', $P4
.annotate 'line', 4087
'RequireOp'(')', $P1)
# }
__label_12: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4091
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4092

.end # NewExpr


.sub 'checkResult' :method

.annotate 'line', 4093
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4094
# Body
# {
.annotate 'line', 4096
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4097
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4100
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4101
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4102
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4103
$P5 = $P3['id']
isnull $I2, $P5
not $I2
unless $I2 goto __label_4
# {
.annotate 'line', 4104
$P1 = $P3['value']
.annotate 'line', 4105
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4106
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4107
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4110
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4114
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4115
isnull $I3, $P4
not $I3
unless $I3 goto __label_7
.annotate 'line', 4116
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4117
.return(self)
# }
.annotate 'line', 4118

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4119
# Body
# {
.annotate 'line', 4121
self.'annotate'(__ARG_1)
.annotate 'line', 4123
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4124
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
.annotate 'line', 4129
# int type: $I2
getattribute $P8, self, 'value'
isa $I3, $P8, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4130
getattribute $P10, self, 'value'
$P9 = $P10.'isstring'()
if_null $P9, __label_5
unless $P9 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4131
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
.annotate 'line', 4133
# string reginit: $S1
set $S1, ''
.annotate 'line', 4134
# string regnew: $S2
set $P8, __ARG_2
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 4135
# string constructor: $S3
null $S3
set $I4, $I1
null $I5
.annotate 'line', 4136
if $I4 == $I5 goto __label_11
set $I5, 1
if $I4 == $I5 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4140
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4141
$P9 = $P2.'emit_get'(__ARG_1)
set $S1, $P9
concat $S1, ', ', $S1
goto __label_9 # break
__label_10: # default
.annotate 'line', 4145
isne $I6, $I2, 1
unless $I6 goto __label_14
isne $I6, $I2, 2
__label_14:
unless $I6 goto __label_13
.annotate 'line', 4146
getattribute $P10, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P10)
__label_13: # endif
.annotate 'line', 4147
$P11 = self.'tempreg'('P')
set $S2, $P11
__label_9: # switch end
set $I4, $I2
null $I5
.annotate 'line', 4150
if $I4 == $I5 goto __label_17
set $I5, 2
if $I4 == $I5 goto __label_18
set $I5, 1
if $I4 == $I5 goto __label_19
goto __label_16
# switch
__label_17: # case
.annotate 'line', 4153
# string name: $S4
getattribute $P13, self, 'value'
$P12 = $P13.'rawstring'()
null $S4
if_null $P12, __label_20
set $S4, $P12
__label_20:
.annotate 'line', 4154
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4155
isnull $I6, $P3
unless $I6 goto __label_21
concat $S9, "Can't locate class ", $S4
concat $S8, $S9, " at compile time"
.annotate 'line', 4156
getattribute $P14, self, 'value'
'Warn'($S8, $P14)
__label_21: # endif
.annotate 'line', 4160
getattribute $P15, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P15, " ]", $S1)
.annotate 'line', 4161
isgt $I7, $I1, 1
unless $I7 goto __label_22
# {
.annotate 'line', 4162
getattribute $P16, self, 'value'
__ARG_1.'say'($S2, ".'", $P16, "'()")
# }
__label_22: # endif
goto __label_15 # break
__label_18: # case
.annotate 'line', 4166
__ARG_1.'print'('new ', $S2, ", [")
.annotate 'line', 4167
# string sep: $S5
set $S5, ''
.annotate 'line', 4168
getattribute $P13, self, 'value'
iter $P17, $P13
set $P17, 0
__label_23: # for iteration
unless $P17 goto __label_24
shift $S6, $P17
# {
.annotate 'line', 4169
__ARG_1.'print'($S5, "'", $S6, "'")
set $S5, ';'
set $S3, $S6
.annotate 'line', 4171
# }
goto __label_23
__label_24: # endfor
.annotate 'line', 4173
__ARG_1.'say'("]", $S1)
goto __label_15 # break
__label_19: # case
.annotate 'line', 4176
# var id: $P4
getattribute $P14, self, 'owner'
getattribute $P15, self, 'value'
$P4 = $P14.'getvar'($P15)
.annotate 'line', 4177
isnull $I7, $P4
unless $I7 goto __label_25
# {
.annotate 'line', 4179
# var cl: $P5
getattribute $P16, self, 'owner'
getattribute $P18, self, 'value'
$P5 = $P16.'checkclass'($P18)
.annotate 'line', 4180
isnull $I8, $P5
not $I8
unless $I8 goto __label_27
# {
.annotate 'line', 4181
$P18 = $P5.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P18, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4184
'Warn'('Checking: new unknown type')
.annotate 'line', 4185
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4187
getattribute $P19, self, 'value'
set $S3, $P19
# }
goto __label_26
__label_25: # else
# {
$P20 = $P4['reg']
.annotate 'line', 4191
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_15 # break
__label_16: # default
.annotate 'line', 4195
'InternalError'('Unexpected type in new')
__label_15: # switch end
.annotate 'line', 4197
isgt $I8, $I1, 1
unless $I8 goto __label_29
# {
.annotate 'line', 4198
# string argregs: $P6
root_new $P6, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4199
iter $P21, $P1
set $P21, 0
__label_30: # for iteration
unless $P21 goto __label_31
shift $P7, $P21
# {
.annotate 'line', 4200
# string reg: $S7
$P20 = $P7.'emit_get'(__ARG_1)
null $S7
if_null $P20, __label_32
set $S7, $P20
__label_32:
.annotate 'line', 4201
$P6.'push'($S7)
# }
goto __label_30
__label_31: # endfor
.annotate 'line', 4203
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4204
join $S8, ", ", $P6
__ARG_1.'print'($S8)
.annotate 'line', 4205
__ARG_1.'say'(")")
.annotate 'line', 4206
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4208

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NewExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 4049
addattribute $P0, 'value'
.annotate 'line', 4050
addattribute $P0, 'initializer'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4218
# Body
# {
.annotate 'line', 4220
# var first: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4221
$P4 = $P1.'isstring'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 4222
'SyntaxError'('Expected string literal', $P1)
__label_0: # endif
.annotate 'line', 4223
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4224
$P4 = $P2.'isop'(':')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 4225
setattribute self, 'hll', $P1
.annotate 'line', 4226
$P1 = __ARG_1.'get'()
.annotate 'line', 4227
$P5 = $P1.'isstring'()
isfalse $I1, $P5
unless $I1 goto __label_2
.annotate 'line', 4228
'SyntaxError'('Expected string literal', $P1)
__label_2: # endif
.annotate 'line', 4229
$P2 = __ARG_1.'get'()
# }
__label_1: # endif
.annotate 'line', 4231
# var nskey: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4232
$P3.'push'($P1)
__label_4: # while
.annotate 'line', 4233
$P6 = $P2.'isop'(',')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 4234
$P1 = __ARG_1.'get'()
.annotate 'line', 4235
$P7 = $P1.'isstring'()
isfalse $I2, $P7
unless $I2 goto __label_5
.annotate 'line', 4236
'SyntaxError'('Expected string literal', $P1)
__label_5: # endif
.annotate 'line', 4237
$P3.'push'($P1)
.annotate 'line', 4238
$P2 = __ARG_1.'get'()
# }
goto __label_4
__label_3: # endwhile
.annotate 'line', 4240
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_6
.annotate 'line', 4241
'SyntaxError'("Expected ']' in keyed new", $P2)
__label_6: # endif
.annotate 'line', 4242
setattribute self, 'nskey', $P3
# }
.annotate 'line', 4243

.end # NewIndexedExpr


.sub 'checkResult' :method

.annotate 'line', 4244
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4245
# Body
# {
.annotate 'line', 4247
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 4248
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4249
__ARG_1.'print'("root_new ", __ARG_2, ", [", $P1, "; ")
goto __label_1
__label_0: # else
.annotate 'line', 4251
__ARG_1.'print'("new ", __ARG_2, ", [")
__label_1: # endif
.annotate 'line', 4252
# var nskey: $P2
getattribute $P2, self, 'nskey'
# predefined join
.annotate 'line', 4253
join $S1, ";", $P2
__ARG_1.'print'($S1)
.annotate 'line', 4255
__ARG_1.'say'("]")
# }
.annotate 'line', 4256

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NewIndexedExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 4215
addattribute $P0, 'hll'
.annotate 'line', 4216
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4261
# Body
# {
.annotate 'line', 4263
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4264
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 4265
new $P4, [  'NewIndexedExpr' ]
$P4.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 4266
$P5 = $P1.'isop'('(')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4267
new $P7, [  'CallExpr' ]
.annotate 'line', 4268
new $P9, [  'StringLiteral' ]
$P9.'StringLiteral'(__ARG_2, __ARG_3)
set $P8, $P9
$P7.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P8)
set $P6, $P7
.annotate 'line', 4267
.return($P6)
goto __label_3
__label_2: # else
.annotate 'line', 4270
new $P11, [  'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4271

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4280
# Body
# {
.annotate 'line', 4282
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4283
setattribute self, 'eleft', __ARG_3
.annotate 'line', 4284
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4285

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4286
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4287
# Body
# {
.annotate 'line', 4289
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4290
# string checkedval: $S1
null $S1
.annotate 'line', 4291
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4292
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S3, "'", $S1
concat $S1, $S3, "'"
.annotate 'line', 4293
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4297
# string r: $S2
getattribute $P3, self, 'eleft'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4298
self.'annotate'(__ARG_1)
.annotate 'line', 4299
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4300

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpInstanceOfExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 4277
addattribute $P0, 'eleft'
.annotate 'line', 4278
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4315
# Body
# {
.annotate 'line', 4317
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4318
new $P3, [  'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4319
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4320
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4321
.return(self)
# }
.annotate 'line', 4322

.end # set


.sub 'optimize' :method

.annotate 'line', 4323
# Body
# {
.annotate 'line', 4325
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4326
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
.annotate 'line', 4328
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4330
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4332
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4333
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4334
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4336

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4337
# Body
# {
.annotate 'line', 4339
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4340

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4341
# Body
# {
.annotate 'line', 4343
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4344
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4345
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4346
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4347
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4348
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4349
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4350
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4351

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'OpConditionalExpr' ]
get_class $P1, [  'Expr' ]
# Expr
addparent $P0, $P1
.annotate 'line', 4311
addattribute $P0, 'condition'
.annotate 'line', 4312
addattribute $P0, 'etrue'
.annotate 'line', 4313
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

.annotate 'line', 4384
# Body
# {
.annotate 'line', 4386
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
.annotate 'line', 4387
.return(1)
__label_3: # case
.annotate 'line', 4388
.return(2)
__label_4: # case
.annotate 'line', 4389
.return(3)
__label_1: # default
.annotate 'line', 4390
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4392

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4394
# Body
# {
.annotate 'line', 4396
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
.annotate 'line', 4397
.return(8)
__label_3: # case
.annotate 'line', 4398
.return(11)
__label_4: # case
.annotate 'line', 4399
.return(9)
__label_5: # case
.annotate 'line', 4400
.return(10)
__label_1: # default
.annotate 'line', 4401
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4403

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4405
# Body
# {
.annotate 'line', 4407
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
.annotate 'line', 4408
.return(19)
__label_3: # case
.annotate 'line', 4409
.return(20)
__label_4: # case
.annotate 'line', 4410
.return(21)
__label_5: # case
.annotate 'line', 4411
.return(22)
__label_1: # default
.annotate 'line', 4412
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4414

.end # getOpCode_5


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4416
# Body
# {
.annotate 'line', 4418
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
.annotate 'line', 4419
.return(14)
__label_3: # case
.annotate 'line', 4420
.return(16)
__label_4: # case
.annotate 'line', 4421
.return(15)
__label_5: # case
.annotate 'line', 4422
.return(17)
__label_1: # default
.annotate 'line', 4423
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4425

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4427
# Body
# {
.annotate 'line', 4429
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
.annotate 'line', 4430
.return(4)
__label_3: # case
.annotate 'line', 4431
.return(5)
__label_4: # case
.annotate 'line', 4432
.return(6)
__label_5: # case
.annotate 'line', 4433
.return(18)
__label_6: # case
.annotate 'line', 4434
.return(23)
__label_7: # case
.annotate 'line', 4435
.return(24)
__label_1: # default
.annotate 'line', 4436
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4438

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4440
# Body
# {
.annotate 'line', 4442
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4444
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4445
# var expr: $P2
null $P2
.annotate 'line', 4446
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4447
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4448
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4449
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4451
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4452
new $P6, [  'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4453
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4454
new $P7, [  'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4455
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4456
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4457
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4458
new $P10, [  'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4459
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4460
new $P10, [  'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4461
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4462
new $P13, [  'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4463
$P11 = $P1.'isidentifier'()
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4464
new $P12, [  'IdentifierExpr' ]
.tailcall $P12.'set'(__ARG_2, $P1)
__label_7: # endif
.annotate 'line', 4465
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4466

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4468
# Body
# {
.annotate 'line', 4470
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4471
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4473
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4474
# var t: $P2
null $P2
.annotate 'line', 4475
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4476
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
set $I3, $I1
set $I4, 1
.annotate 'line', 4477
if $I3 == $I4 goto __label_4
set $I4, 2
if $I3 == $I4 goto __label_5
set $I4, 3
if $I3 == $I4 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4479
new $P6, [  'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4482
new $P7, [  'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4485
new $P8, [  'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4488
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4491
__ARG_1.'unget'($P2)
.annotate 'line', 4492
.return($P1)
# }
.annotate 'line', 4493

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4495
# Body
# {
.annotate 'line', 4497
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4499
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4500
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4501
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4502
new $P5, [  'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4503
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4504
new $P7, [  'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4507
__ARG_1.'unget'($P2)
.annotate 'line', 4508
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4510

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4512
# Body
# {
.annotate 'line', 4514
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4515
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4516
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4518
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4519
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4520
# var subexpr: $P2
null $P2
.annotate 'line', 4521
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4522
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4523
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4524
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
.annotate 'line', 4526
new $P3, [  'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4529
new $P3, [  'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4532
new $P3, [  'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4535
new $P3, [  'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4538
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4540
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4543
__ARG_1.'unget'($P1)
.annotate 'line', 4544
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4546
.return($P2)
# }
.annotate 'line', 4547

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4549
# Body
# {
.annotate 'line', 4551
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4552
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4554
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4555
# var t: $P2
null $P2
.annotate 'line', 4556
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4557
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4558
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4559
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4560
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
.annotate 'line', 4562
new $P4, [  'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4565
new $P4, [  'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4568
new $P4, [  'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4571
new $P4, [  'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4574
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 4576
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4577
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4579
__ARG_1.'unget'($P2)
.annotate 'line', 4580
.return($P1)
# }
.annotate 'line', 4581

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4583
# Body
# {
.annotate 'line', 4585
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 4587
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4588
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4589
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 4590
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4591
# var expr: $P4
null $P4
.annotate 'line', 4592
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 4593
new $P7, [  'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 4595
new $P8, [  'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 4596
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4598
__ARG_1.'unget'($P2)
.annotate 'line', 4599
.return($P1)
# }
.annotate 'line', 4600

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4602
# Body
# {
.annotate 'line', 4604
.const 'Sub' $P5 = 'parseExpr_6'
.annotate 'line', 4606
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4607
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4608
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
.annotate 'line', 4609
$P6 = $P2.'isop'('==')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4610
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4611
new $P6, [  'OpEqualExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 4613
$P7 = $P2.'isop'('!=')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4614
# var eright: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4615
new $P7, [  'OpNotEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4618
new $P8, [  'OpInstanceOfExpr' ]
$P8.'OpInstanceOfExpr'(__ARG_2, $P2, $P1, __ARG_1)
set $P1, $P8
# }
__label_7: # endif
__label_5: # endif
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4621
__ARG_1.'unget'($P2)
.annotate 'line', 4622
.return($P1)
# }
.annotate 'line', 4623

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4625
# Body
# {
.annotate 'line', 4627
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 4628
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 4630
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4631
# var t: $P2
null $P2
.annotate 'line', 4632
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4633
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4634
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 4635
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
.annotate 'line', 4637
new $P6, [  'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 4640
new $P7, [  'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 4643
new $P8, [  'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 4646
new $P9, [  'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 4649
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4652
__ARG_1.'unget'($P2)
.annotate 'line', 4653
.return($P1)
# }
.annotate 'line', 4654

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4656
# Body
# {
.annotate 'line', 4658
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 4660
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4661
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4662
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4663
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4664
new $P5, [  'OpBinAndExpr' ]
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

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4670
# Body
# {
.annotate 'line', 4672
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 4674
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4675
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4676
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4677
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4678
new $P5, [  'OpBinOrExpr' ]
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

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4684
# Body
# {
.annotate 'line', 4686
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 4688
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4689
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4690
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4691
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4692
new $P5, [  'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4694
__ARG_1.'unget'($P2)
.annotate 'line', 4695
.return($P1)
# }
.annotate 'line', 4696

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4698
# Body
# {
.annotate 'line', 4700
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 4702
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4703
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4704
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4705
# var eright: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 4706
new $P5, [  'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4708
__ARG_1.'unget'($P2)
.annotate 'line', 4709
.return($P1)
# }
.annotate 'line', 4710

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4712
# Body
# {
.annotate 'line', 4714
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4715
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 4717
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4718
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4719
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 4720
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4721
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4722
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4723
new $P7, [  'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4726
__ARG_1.'unget'($P2)
.annotate 'line', 4727
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 4729

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4731
# Body
# {
.annotate 'line', 4733
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 4734
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 4735
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 4737
# var eleft: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 4738
# var t: $P2
null $P2
.annotate 'line', 4739
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4740
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
isne $I2, $I1, 0
unless $I2 goto __label_0
# {
.annotate 'line', 4741
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4742
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 4743
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
.annotate 'line', 4745
new $P4, [  'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4748
new $P4, [  'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4751
new $P4, [  'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4754
new $P4, [  'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 4757
new $P4, [  'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 4760
new $P4, [  'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4763
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 4765
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4766
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4768
__ARG_1.'unget'($P2)
.annotate 'line', 4769
.return($P1)
# }
.annotate 'line', 4770

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4772
# Body
# {
.annotate 'line', 4774
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 4776
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 4777

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 4790
# Body
# {
.annotate 'line', 4792
getattribute $P1, self, 'brlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4793
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 4794
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4795
setattribute self, 'brlabel', $P2
.annotate 'line', 4796
.return($S1)
# }
.annotate 'line', 4797

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 4798
# Body
# {
.annotate 'line', 4800
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 4801
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4802
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 4803
.return($P1)
# }
.annotate 'line', 4804

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Breakable' ]
.annotate 'line', 4788
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 4811
# Body
# {
.annotate 'line', 4813
getattribute $P1, self, 'cntlabel'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 4814
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 4815
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 4816
setattribute self, 'cntlabel', $P2
.annotate 'line', 4817
.return($S1)
# }
.annotate 'line', 4818

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 4819
# Body
# {
.annotate 'line', 4821
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 4822
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 4823
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 4824
.return($P1)
# }
.annotate 'line', 4825

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'Continuable' ]
get_class $P1, [  'Breakable' ]
# Breakable
addparent $P0, $P1
.annotate 'line', 4809
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4839
# Body
# {
.annotate 'line', 4841
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4842
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4843
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 4844
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 4845
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 4846
# {
.annotate 'line', 4847
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 4848
$P2.'push'($P3)
# }
.annotate 'line', 4849
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 4851
'RequireOp'(';', $P1)
.annotate 'line', 4852
setattribute self, 'values', $P2
# }
.annotate 'line', 4853

.end # parse


.sub 'optimize' :method

.annotate 'line', 4854
# Body
# {
.annotate 'line', 4856
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4857
.return(self)
# }
.annotate 'line', 4858

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4859
# Body
# {
.annotate 'line', 4861
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 4862
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4863
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 4866
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4867
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 4869
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 4870
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 4871
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 4872
self.'annotate'(__ARG_1)
.annotate 'line', 4873
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 4877
# int i: $I2
null $I2
goto __label_7
__label_5: # for iteration
inc $I2
__label_7: # for condition
islt $I4, $I2, $I1
unless $I4 goto __label_6 # for end
# {
.annotate 'line', 4878
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 4879
# string reg: $S1
null $S1
.annotate 'line', 4880
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 4881
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 4882
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4885
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 4886
$P1.'push'($S1)
# }
goto __label_5 # for iteration
__label_6: # for end
.annotate 'line', 4888
self.'annotate'(__ARG_1)
.annotate 'line', 4889
self.'emitret'(__ARG_1)
.annotate 'line', 4890
# string sep: $S2
set $S2, ''
.annotate 'line', 4891
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 4892
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 4893
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 4895
__ARG_1.'say'(')')
# }
.annotate 'line', 4896

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ReturnYieldStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 4837
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4901
# Body
# {
.annotate 'line', 4903
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4904

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4905
# Body
# {
.annotate 'line', 4907
__ARG_1.'print'('.return(')
# }
.annotate 'line', 4908

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

.annotate 'line', 4913
# Body
# {
.annotate 'line', 4915
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4916

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 4917
# Body
# {
.annotate 'line', 4919
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 4920

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

.annotate 'line', 4931
# Body
# {
.annotate 'line', 4933
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 4934
setattribute self, 'name', __ARG_1
.annotate 'line', 4935
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 4936
setattribute self, 'value', $P2
.annotate 'line', 4937
.return(self)
# }
.annotate 'line', 4938

.end # set


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
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4944
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 4945
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 4946

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'LabelStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 4929
addattribute $P0, 'name'
.annotate 'line', 4930
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4957
# Body
# {
.annotate 'line', 4959
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 4960
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 4961
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 4962
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 4963
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 4964
setattribute self, 'label', $P1
.annotate 'line', 4965
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 4966

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 4967
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 4968
# Body
# {
.annotate 'line', 4970
self.'annotate'(__ARG_1)
.annotate 'line', 4971
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4972
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 4973
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 4974

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'GotoStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 4955
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 4983
# Body
# {
.annotate 'line', 4985
'ExpectOp'('(', __ARG_1)
.annotate 'line', 4986
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 4987
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 4988

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

.annotate 'line', 4999
# Body
# {
.annotate 'line', 5001
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5002
self.'parsecondition'(__ARG_2)
.annotate 'line', 5003
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5004
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5005
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5006
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5008
new $P6, [  'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5009
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5011

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5012
# Body
# {
.annotate 'line', 5014
self.'optimize_condition'()
.annotate 'line', 5015
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5016
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5017
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5018
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5020
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5022
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5024
.return(self)
# }
.annotate 'line', 5025

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5026
# Body
# {
.annotate 'line', 5028
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5029
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5030
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5031
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5032
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5033
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5034
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5035
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5036
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5037
self.'annotate'(__ARG_1)
.annotate 'line', 5038
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5039
$P1.'emit'(__ARG_1)
.annotate 'line', 5041
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5042
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5043
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5044
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5046
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5047

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'IfStatement' ]
get_class $P1, [  'ConditionalStatement' ]
# ConditionalStatement
addparent $P0, $P1
.annotate 'line', 4997
addattribute $P0, 'truebranch'
.annotate 'line', 4998
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5057
# Body
# {
.annotate 'line', 5059
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5060

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5061
# Body
# {
.annotate 'line', 5063
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5064
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5066
self.'annotate'(__ARG_1)
.annotate 'line', 5067
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5068
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5069
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5070
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5071

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'LoopStatement' ]
get_class $P1, [  'Continuable' ]
# Continuable
addparent $P0, $P1
.annotate 'line', 5056
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5080
# Body
# {
.annotate 'line', 5082
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5083
self.'parsecondition'(__ARG_2)
.annotate 'line', 5084
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5085

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5086
# Body
# {
.annotate 'line', 5088
self.'optimize_condition'()
.annotate 'line', 5089
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5090
.return(self)
# }
.annotate 'line', 5091

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5092
# Body
# {
.annotate 'line', 5094
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5096
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5099
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5102
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5103
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5105
self.'annotate'(__ARG_1)
.annotate 'line', 5106
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5107
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5108
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5109
__ARG_1.'say'('goto ', $S2)
.annotate 'line', 5110
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5112

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

.annotate 'line', 5121
# Body
# {
.annotate 'line', 5123
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5124
self.'parsebody'(__ARG_2)
.annotate 'line', 5125
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5126
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5127

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5128
# Body
# {
.annotate 'line', 5130
self.'optimize_condition'()
.annotate 'line', 5131
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5132
.return(self)
# }
.annotate 'line', 5133

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5134
# Body
# {
.annotate 'line', 5136
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5138
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5141
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5142
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5143
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5145
self.'annotate'(__ARG_1)
.annotate 'line', 5146
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5148
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5149
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5150
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5152

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

.annotate 'line', 5161
# Body
# {
.annotate 'line', 5163
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5164
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5165

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5166
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5167
# Body
# {
.annotate 'line', 5169
self.'annotate'(__ARG_1)
.annotate 'line', 5170
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5171
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5172

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

.annotate 'line', 5181
# Body
# {
.annotate 'line', 5183
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5184
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5185

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5186
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5187
# Body
# {
.annotate 'line', 5189
self.'annotate'(__ARG_1)
.annotate 'line', 5190
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5191
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5192

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

.annotate 'line', 5206
# Body
# {
.annotate 'line', 5208
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5209
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5210
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5211
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5212
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5213
$P1 = __ARG_2.'get'()
.annotate 'line', 5214
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5215
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5216
$P1 = __ARG_2.'get'()
.annotate 'line', 5217
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5218
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5219
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5220
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5221
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5222
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5223
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5224
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5225
$P1 = __ARG_2.'get'()
.annotate 'line', 5226
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5227
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5228
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5229
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
.annotate 'line', 5230
__ARG_2.'unget'($P1)
.annotate 'line', 5231
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5233
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5234
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5237
$P1 = __ARG_2.'get'()
.annotate 'line', 5238
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5239
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5240
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
.annotate 'line', 5241
__ARG_2.'unget'($P1)
.annotate 'line', 5242
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5244
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5247

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5248
# Body
# {
.annotate 'line', 5250
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5251
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5252
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5253
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5254
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5255
.return(self)
# }
.annotate 'line', 5256

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5257
# Body
# {
.annotate 'line', 5260
# string type: $S1
set $S1, ''
.annotate 'line', 5261
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5262
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5263
iseq $I3, $S2, 'N'
unless $I3 goto __label_3
.annotate 'line', 5264
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5265
iseq $I3, $S1, ''
unless $I3 goto __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5267
isne $I4, $S1, $S2
unless $I4 goto __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5268
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5271
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5272
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
iseq $I4, $S9, $S1
unless $I4 goto __label_8
.annotate 'line', 5273
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5275
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5276
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5280
self.'genbreaklabel'()
.annotate 'line', 5281
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5282
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5283
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5284
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5285
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5286
$P2.'push'($S7)
.annotate 'line', 5287
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5288
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5290
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5293
__ARG_1.'comment'('switch')
.annotate 'line', 5294
self.'annotate'(__ARG_1)
.annotate 'line', 5295
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5296
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5297
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5298
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5299
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5300
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5301
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5302
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5305
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5306
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5307
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5309
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5310

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'SwitchStatement' ]
get_class $P1, [  'Breakable' ]
# Breakable
addparent $P0, $P1
get_class $P2, [  'Statement' ]
# Statement
addparent $P0, $P2
.annotate 'line', 5201
addattribute $P0, 'condition'
.annotate 'line', 5202
addattribute $P0, 'case_value'
.annotate 'line', 5203
addattribute $P0, 'case_st'
.annotate 'line', 5204
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5323
# Body
# {
.annotate 'line', 5325
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5326
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5327
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5328
__ARG_2.'unget'($P1)
.annotate 'line', 5329
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5331
$P1 = __ARG_2.'get'()
.annotate 'line', 5332
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5333
__ARG_2.'unget'($P1)
.annotate 'line', 5334
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P5
.annotate 'line', 5335
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5337
$P1 = __ARG_2.'get'()
.annotate 'line', 5338
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5339
__ARG_2.'unget'($P1)
.annotate 'line', 5340
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P6
.annotate 'line', 5341
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5343
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5344

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5345
# Body
# {
.annotate 'line', 5347
getattribute $P1, self, 'initializer'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5348
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5349
getattribute $P1, self, 'condition'
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 5350
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
__label_1: # endif
.annotate 'line', 5351
getattribute $P5, self, 'iteration'
isnull $I2, $P5
not $I2
unless $I2 goto __label_2
.annotate 'line', 5352
getattribute $P8, self, 'iteration'
$P7 = $P8.'optimize'()
setattribute self, 'iteration', $P7
__label_2: # endif
.annotate 'line', 5353
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5354
.return(self)
# }
.annotate 'line', 5355

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5356
# Body
# {
.annotate 'line', 5358
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5359
getattribute $P2, self, 'condition'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5360
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5361
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5362
.return()
# }
__label_0: # endif
.annotate 'line', 5364
__ARG_1.'comment'('for loop')
.annotate 'line', 5365
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5366
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5367
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5368
getattribute $P4, self, 'initializer'
isnull $I1, $P4
not $I1
unless $I1 goto __label_6
.annotate 'line', 5369
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5370
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5372
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5373
getattribute $P4, self, 'iteration'
isnull $I2, $P4
not $I2
unless $I2 goto __label_7
.annotate 'line', 5374
# string unused: $S4
getattribute $P6, self, 'iteration'
$P5 = $P6.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
__label_7: # endif
.annotate 'line', 5376
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5377
getattribute $P6, self, 'condition'
isnull $I2, $P6
not $I2
unless $I2 goto __label_9
# {
.annotate 'line', 5378
# string regcond: $S5
getattribute $P8, self, 'condition'
$P7 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P7, __label_10
set $S5, $P7
__label_10:
.annotate 'line', 5379
__ARG_1.'say'('unless ', $S5, ' goto ', $S2, ' # for end')
# }
__label_9: # endif
.annotate 'line', 5382
getattribute $P7, self, 'body'
$P7.'emit'(__ARG_1)
.annotate 'line', 5383
__ARG_1.'emitgoto'($S1, 'for iteration')
.annotate 'line', 5385
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5386

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ForStatement' ]
get_class $P1, [  'LoopStatement' ]
# LoopStatement
addparent $P0, $P1
get_class $P2, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P2
.annotate 'line', 5319
addattribute $P0, 'initializer'
.annotate 'line', 5320
addattribute $P0, 'condition'
.annotate 'line', 5321
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5398
# Body
# {
.annotate 'line', 5400
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5401
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5402
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5403
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5404
isne $I1, $S2, ''
unless $I1 goto __label_2
# {
.annotate 'line', 5405
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5407
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5409
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5410
setattribute self, 'varname', $P1
.annotate 'line', 5411
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5412
$P2 = __ARG_2.'get'()
.annotate 'line', 5413
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5414
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5415
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5416

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5417
# Body
# {
.annotate 'line', 5419
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5420
.return(self)
# }
.annotate 'line', 5421

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5422
# Body
# {
.annotate 'line', 5424
self.'annotate'(__ARG_1)
.annotate 'line', 5425
# string regcont: $S1
null $S1
.annotate 'line', 5426
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
iseq $I1, $S6, 'S'
unless $I1 goto __label_0
# {
.annotate 'line', 5427
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5428
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5429
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5432
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5433
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5434
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5435
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5436
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5437
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5438
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5439
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5440
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5441
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5442
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5443
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5444
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5445

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ForeachStatement' ]
get_class $P1, [  'LoopStatement' ]
# LoopStatement
addparent $P0, $P1
get_class $P2, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P2
.annotate 'line', 5395
addattribute $P0, 'varname'
.annotate 'line', 5396
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5450
# Body
# {
.annotate 'line', 5452
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5453
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5454
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5455
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5456
__ARG_2.'unget'($P3)
.annotate 'line', 5457
__ARG_2.'unget'($P2)
.annotate 'line', 5458
__ARG_2.'unget'($P1)
.annotate 'line', 5459
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5460
new $P5, [  'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5462
new $P7, [  'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5463

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5473
# Body
# {
.annotate 'line', 5475
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5476
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5477

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5478
# Body
# {
.annotate 'line', 5480
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5481
.return(self)
# }
.annotate 'line', 5482

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5483
# Body
# {
.annotate 'line', 5485
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5486
self.'annotate'(__ARG_1)
.annotate 'line', 5487
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5488

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ThrowStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 5471
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5502
# Body
# {
.annotate 'line', 5504
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5505
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5506
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5507
new $P5, [  'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5510
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5512
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5513
$P1 = __ARG_2.'get'()
.annotate 'line', 5514
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5515
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5516
$P1 = __ARG_2.'get'()
.annotate 'line', 5517
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5518
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5519
$P1 = __ARG_2.'get'()
.annotate 'line', 5520
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5521
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5522
setattribute self, 'exname', $P1
.annotate 'line', 5523
self.'createvar'($S1, 'P')
.annotate 'line', 5524
$P1 = __ARG_2.'get'()
.annotate 'line', 5525
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5526
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5528
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5529

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5530
# Body
# {
.annotate 'line', 5532
getattribute $P1, self, 'modifiers'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5533
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5534
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5535
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 5536
.return(self)
# }
.annotate 'line', 5537

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5538
# Body
# {
.annotate 'line', 5540
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5541
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5542
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5543
# string exreg: $S4
null $S4
.annotate 'line', 5544
getattribute $P8, self, 'exname'
isnull $I3, $P8
not $I3
unless $I3 goto __label_3
# {
.annotate 'line', 5545
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5546
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5549
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5551
self.'annotate'(__ARG_1)
.annotate 'line', 5552
__ARG_1.'comment'('try: create handler')
.annotate 'line', 5554
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 5555
__ARG_1.'say'('set_addr ', $S1, ', ', $S2)
.annotate 'line', 5557
getattribute $P10, self, 'modifiers'
isnull $I3, $P10
not $I3
unless $I3 goto __label_5
# {
.annotate 'line', 5558
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 5559
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 5560
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 5561
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 5562
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 5565
isne $I4, $I1, 1
unless $I4 goto __label_14
.annotate 'line', 5566
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 5567
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 5568
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 5569
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 5572
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 5573
# int i: $I2
null $I2
goto __label_18
__label_16: # for iteration
inc $I2
__label_18: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_17 # for end
# {
.annotate 'line', 5574
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 5575
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
goto __label_16 # for iteration
__label_17: # for end
.annotate 'line', 5577
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 5578
# string sep: $S7
set $S7, ''
.annotate 'line', 5579
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 5580
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 5581
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 5583
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 5586
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 5591
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 5592
__ARG_1.'comment'('try: begin')
.annotate 'line', 5593
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 5594
__ARG_1.'comment'('try: end')
.annotate 'line', 5596
self.'annotate'(__ARG_1)
.annotate 'line', 5597
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5599
__ARG_1.'comment'('catch')
.annotate 'line', 5600
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5601
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 5602
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 5603
__ARG_1.'say'('pop_eh')
.annotate 'line', 5604
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 5606
__ARG_1.'comment'('catch end')
.annotate 'line', 5607
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 5608

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'TryStatement' ]
get_class $P1, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P1
.annotate 'line', 5497
addattribute $P0, 'stry'
.annotate 'line', 5498
addattribute $P0, 'modifiers'
.annotate 'line', 5499
addattribute $P0, 'exname'
.annotate 'line', 5500
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5619
# Body
# {
.annotate 'line', 5621
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5622
setattribute self, 'name', __ARG_3
.annotate 'line', 5623
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5624
setattribute self, 'reg', $P2
# }
.annotate 'line', 5625

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'VarBaseStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 5617
addattribute $P0, 'name'
.annotate 'line', 5618
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5642
# Body
# {
.annotate 'line', 5644
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5645
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5646
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5647
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5648
setattribute self, 'name', $P1
.annotate 'line', 5649
# string reg: $S1
null $S1
.annotate 'line', 5651
$P1 = __ARG_2.'get'()
.annotate 'line', 5652
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 5654
setattribute self, 'typearray', $P5
.annotate 'line', 5655
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 5656
$P1 = __ARG_2.'get'()
.annotate 'line', 5657
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 5659
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 5662
__ARG_2.'unget'($P1)
.annotate 'line', 5663
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 5664
$P1 = __ARG_2.'get'()
.annotate 'line', 5665
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 5666
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 5667
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 5672
setattribute self, 'typearray', $P8
.annotate 'line', 5673
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 5674
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5676
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 5677
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 5681
setattribute self, 'reg', $P11
.annotate 'line', 5682
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 5684
$P1 = __ARG_2.'get'()
.annotate 'line', 5685
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 5686
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 5687
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 5688
$P1 = __ARG_2.'get'()
.annotate 'line', 5689
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 5690
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 5691
# {
.annotate 'line', 5692
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5693
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 5694
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 5695
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 5696
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 5698
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 5700
$P16 = $P1.'isop'(';')
isfalse $I3, $P16
unless $I3 goto __label_14
.annotate 'line', 5701
'SyntaxError'("Expected ';'", $P1)
__label_14: # endif
# }
.annotate 'line', 5702

.end # parse


.sub 'optimize' :method

.annotate 'line', 5703
# Body
# {
.annotate 'line', 5705
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 5706
getattribute $P2, self, 'size'
isnull $I1, $P2
not $I1
unless $I1 goto __label_0
.annotate 'line', 5707
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 5708
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
# {
.annotate 'line', 5709
getattribute $P2, self, 'typearray'
set $I3, $P2
iseq $I2, $I3, 0
unless $I2 goto __label_2
.annotate 'line', 5710
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 5712
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 5714
.return(self)
# }
.annotate 'line', 5715

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5716
# Body
# {
.annotate 'line', 5718
self.'annotate'(__ARG_1)
.annotate 'line', 5719
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 5720
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5721
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 5722
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 5723
# var init: $P1
getattribute $P1, self, 'init'
concat $S13, $S1, ' '
concat $S12, $S13, $S2
concat $S11, $S12, ': '
concat $S10, $S11, $S3
.annotate 'line', 5724
__ARG_1.'comment'($S10)
.annotate 'line', 5726
getattribute $P6, self, 'typearray'
set $I4, $P6
iseq $I3, $I4, 0
unless $I3 goto __label_4
# {
.annotate 'line', 5727
isnull $I5, $P1
if $I5 goto __label_8
$I5 = $P1.'isnull'()
__label_8:
unless $I5 goto __label_6
.annotate 'line', 5728
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 5730
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 5731
iseq $I3, $S5, $S4
unless $I3 goto __label_10
# {
.annotate 'line', 5732
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 5735
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_12
# {
.annotate 'line', 5737
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 5740
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 5741
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 5742
iseq $I5, $S4, 'S'
unless $I5 goto __label_17
iseq $I5, $S5, 'P'
__label_17:
unless $I5 goto __label_15
# {
.annotate 'line', 5743
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 5744
__ARG_1.'emitnull'($S3)
.annotate 'line', 5745
__ARG_1.'say'('if_null ', $S6, ', ', $S7)
.annotate 'line', 5746
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 5747
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 5750
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
.annotate 'line', 5756
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 5757
isnull $I6, $P2
not $I6
unless $I6 goto __label_19
# {
.annotate 'line', 5759
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 5760
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 5764
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 5766
isnull $I6, $P1
not $I6
unless $I6 goto __label_22
# {
.annotate 'line', 5767
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 5768
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 5769
isnull $I7, $P2
unless $I7 goto __label_24
# {
.annotate 'line', 5770
isgt $I8, $I1, 0
unless $I8 goto __label_25
# {
.annotate 'line', 5772
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 5775
# int i: $I2
null $I2
.annotate 'line', 5776
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 5777
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 5778
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 5779
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 5783

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5784
# Body
# {
.annotate 'line', 5786
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 5787

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'DeclareStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 5634
addattribute $P0, 'name'
.annotate 'line', 5635
addattribute $P0, 't_reg'
.annotate 'line', 5636
addattribute $P0, 't_name'
.annotate 'line', 5637
addattribute $P0, 't_array'
.annotate 'line', 5638
addattribute $P0, 'reg'
.annotate 'line', 5639
addattribute $P0, 'typearray'
.annotate 'line', 5640
addattribute $P0, 'size'
.annotate 'line', 5641
addattribute $P0, 'init'
.end
.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5800
# Body
# {
.annotate 'line', 5803
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 5804
setattribute self, 'type', $P1
.annotate 'line', 5805
setattribute self, 'name', __ARG_4
.annotate 'line', 5806
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 5807

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 5808
# Body
# {
.annotate 'line', 5810
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5811
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 5812
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5813
$P1 = $P1.'optimize'()
.annotate 'line', 5814
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5816
getattribute $P4, self, 'start'
.annotate 'line', 5815
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 5818
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 5819
setattribute self, 'value', $P1
.annotate 'line', 5820
.return(self)
# }
.annotate 'line', 5821

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 5822
# Body
# {
.annotate 'line', 5824
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 5825

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5826
# Body
# {
.annotate 'line', 5828
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S3, 'Constant ', $S1
concat $S2, $S3, ' evaluated at compile time'
.annotate 'line', 5829
__ARG_1.'comment'($S2)
# }
.annotate 'line', 5830

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ConstStatement' ]
get_class $P1, [  'Statement' ]
# Statement
addparent $P0, $P1
.annotate 'line', 5796
addattribute $P0, 'type'
.annotate 'line', 5797
addattribute $P0, 'name'
.annotate 'line', 5798
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5833
# Body
# {
.annotate 'line', 5835
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5836
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 5837
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5838
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 5840
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 5841
# {
.annotate 'line', 5842
$P1 = __ARG_2.'get'()
.annotate 'line', 5843
# var name: $P3
set $P3, $P1
.annotate 'line', 5844
'ExpectOp'('=', __ARG_2)
.annotate 'line', 5845
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 5847
new $P6, [  'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 5846
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 5848
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 5849
.return($P2)
# }
.annotate 'line', 5850

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5859
# Body
# {
.annotate 'line', 5861
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5862
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5863
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5864
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 5865
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 5867
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 5868
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5869

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 5870
# Body
# {
.annotate 'line', 5872
getattribute $P1, self, 'init'
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 5873
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 5874
.return(self)
# }
.annotate 'line', 5875

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 5876
# Body
# {
.annotate 'line', 5878
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5879

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5880
# Body
# {
.annotate 'line', 5882
self.'annotate'(__ARG_1)
.annotate 'line', 5883
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 5884
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 5885
# var init: $P1
getattribute $P1, self, 'init'
concat $S7, 'var ', $S1
concat $S6, $S7, ': '
concat $S5, $S6, $S2
.annotate 'line', 5886
__ARG_1.'comment'($S5)
.annotate 'line', 5887
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
.annotate 'line', 5888
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 5890
isnull $I1, $P1
not $I1
unless $I1 goto __label_4
# {
.annotate 'line', 5891
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 5892
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
.annotate 'line', 5894
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 5899
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 5900
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 5901
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 5904
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 5908
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 5909

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'VarStatement' ]
get_class $P1, [  'VarBaseStatement' ]
# VarBaseStatement
addparent $P0, $P1
.annotate 'line', 5858
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5914
# Body
# {
.annotate 'line', 5916
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5917
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5918
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5919
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 5920

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5921
# Body
# {
.annotate 'line', 5923
self.'annotate'(__ARG_1)
.annotate 'line', 5924
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5925
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S5, 'var ', $S1
concat $S4, $S5, '[] : '
concat $S3, $S4, $S2
.annotate 'line', 5926
__ARG_1.'comment'($S3)
.annotate 'line', 5927
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 5928

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

.annotate 'line', 5935
# Body
# {
.annotate 'line', 5937
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 5938
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 5939
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5940
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5941
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 5942
$P1 = __ARG_2.'get'()
.annotate 'line', 5943
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 5944
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 5945

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 5946
# Body
# {
.annotate 'line', 5948
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 5949
.tailcall self.'optimize_init'()
# }
.annotate 'line', 5950

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5951
# Body
# {
.annotate 'line', 5953
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5954
self.'annotate'(__ARG_1)
.annotate 'line', 5955
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5956
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S6, 'var ', $S2
concat $S5, $S6, '[] : '
concat $S4, $S5, $S3
.annotate 'line', 5957
__ARG_1.'comment'($S4)
.annotate 'line', 5958
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 5959

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'FixedVarStatement' ]
get_class $P1, [  'VarStatement' ]
# VarStatement
addparent $P0, $P1
.annotate 'line', 5933
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5962
# Body
# {
.annotate 'line', 5964
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5965
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5966
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5967
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5968
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 5969
$P2 = __ARG_2.'get'()
.annotate 'line', 5970
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5971
new $P6, [  'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 5973
__ARG_2.'unget'($P2)
.annotate 'line', 5974
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
.annotate 'line', 5978
__ARG_2.'unget'($P2)
.annotate 'line', 5979
new $P7, [  'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 5981

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5989
# Body
# {
box $P1, 'S'
.annotate 'line', 5991
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 5992
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 5993
setattribute self, 't_array', $P2
.annotate 'line', 5994
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5995

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 5996
# Body
# {
.annotate 'line', 5998
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 5999

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

.annotate 'line', 6008
# Body
# {
box $P1, 'I'
.annotate 'line', 6010
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6011
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6012
setattribute self, 't_array', $P2
.annotate 'line', 6013
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6014

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6015
# Body
# {
.annotate 'line', 6017
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6018

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

.annotate 'line', 6027
# Body
# {
box $P1, 'N'
.annotate 'line', 6029
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6030
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6031
setattribute self, 't_array', $P2
.annotate 'line', 6032
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6033

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6034
# Body
# {
.annotate 'line', 6036
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6037

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

.annotate 'line', 6051
# Body
# {
.annotate 'line', 6053
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6054
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6055
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6056
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6057
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6058
__ARG_2.'unget'($P1)
.annotate 'line', 6059
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6060
isnull $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6061
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6062
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6064
setattribute self, 'end', $P1
# }
.annotate 'line', 6065

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6066
# Body
# {
.annotate 'line', 6068
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6069
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6070
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6071
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6072
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6073
.return($S2)
# }
.annotate 'line', 6074

.end # getlabel


.sub 'createlabel' :method
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
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6081
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6082
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6083
$P1[$S1] = $S3
.annotate 'line', 6084
.return($S3)
# }
.annotate 'line', 6085

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6086
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6087
# Body
# {
.annotate 'line', 6089
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6090
.return(self)
# }
.annotate 'line', 6091

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6092
# Body
# {
.annotate 'line', 6094
__ARG_1.'comment'('{')
.annotate 'line', 6095
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6096
$P1.'emit'(__ARG_1)
.annotate 'line', 6097
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6099
__ARG_1.'comment'('}')
# }
.annotate 'line', 6100

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'CompoundStatement' ]
get_class $P1, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P1
.annotate 'line', 6046
addattribute $P0, 'statements'
.annotate 'line', 6047
addattribute $P0, 'end'
.annotate 'line', 6048
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6113
# Body
# {
box $P3, 1
.annotate 'line', 6116
setattribute self, 'nreg', $P3
.annotate 'line', 6117
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6118
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6119
setattribute self, 'tempreg', $P1
.annotate 'line', 6120
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6121

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6122
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6124
setattribute self, 'type', $P1
.annotate 'line', 6125
.return(self)
# }
.annotate 'line', 6126

.end # settype


.sub 'createreg' :method

.annotate 'line', 6127
# Body
# {
.annotate 'line', 6129
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6130
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6131
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6133
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S3, '$', $S2
concat $S1, $S3, $S1
.annotate 'line', 6135
.return($S1)
# }
.annotate 'line', 6136

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6137
# Body
# {
.annotate 'line', 6139
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6140
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6141
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6142
# string reg: $S1
null $S1
.annotate 'line', 6143
isgt $I2, $I1, 0
unless $I2 goto __label_0
.annotate 'line', 6144
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6146
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6147
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6149
.return($S1)
# }
.annotate 'line', 6150

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6151
# Body
# {
.annotate 'line', 6153
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6154
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6155
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6156
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6157

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'RegisterStore' ]
.annotate 'line', 6109
addattribute $P0, 'type'
.annotate 'line', 6110
addattribute $P0, 'nreg'
.annotate 'line', 6111
addattribute $P0, 'tempreg'
.annotate 'line', 6112
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6176
# Body
# {
.annotate 'line', 6178
new $P3, [  'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6179
new $P3, [  'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6180
new $P6, [  'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6181
new $P6, [  'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6182
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6183

.end # init


.sub 'ismethod' :method

.annotate 'line', 6184
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6185
# Body
# {
.annotate 'line', 6187
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6188
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
.annotate 'line', 6190
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6192
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6194
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6196
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6198
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6200
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6201
.return($S1)
# }
.annotate 'line', 6202

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6203
# Body
# {
.annotate 'line', 6205
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6206
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
.annotate 'line', 6208
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6210
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6212
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6214
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6216
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6218
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6219
.return($S1)
# }
.annotate 'line', 6220

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6221
# Body
# {
.annotate 'line', 6223
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
.annotate 'line', 6224
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6225

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6226
# Body
# {
.annotate 'line', 6228
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6229
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6230
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6232
.return($S1)
# }
.annotate 'line', 6233

.end # genlabel


.sub 'optimize' :method

.annotate 'line', 6235
# Body
# {
.annotate 'line', 6237
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6238
.return(self)
# }
.annotate 'line', 6239

.end # optimize


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6241
# Body
# {
.annotate 'line', 6243
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6244
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6245
setattribute self, 'name', $P1
.annotate 'line', 6246
$P1 = __ARG_2.'get'()
.annotate 'line', 6247
$P5 = $P1.'isop'('[')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6248
# var modifiers: $P2
new $P6, [  'ModifierList' ]
$P6.'ModifierList'(__ARG_2, self)
set $P2, $P6
.annotate 'line', 6249
setattribute self, 'modifiers', $P2
.annotate 'line', 6250
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6252
$P7 = $P1.'isop'('(')
isfalse $I2, $P7
unless $I2 goto __label_1
.annotate 'line', 6253
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6254
root_new $P8, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P8
.annotate 'line', 6255
$P1 = __ARG_2.'get'()
.annotate 'line', 6256
$P8 = $P1.'isop'(')')
isfalse $I2, $P8
unless $I2 goto __label_2
# {
.annotate 'line', 6257
__ARG_2.'unget'($P1)
.annotate 'line', 6258
# int argnum: $I1
null $I1
__label_3: # do
.annotate 'line', 6259
# {
.annotate 'line', 6260
$P1 = __ARG_2.'get'()
.annotate 'line', 6261
# string type: $S1
$P10 = $P1.'checkkeyword'()
$P9 = 'typetoregcheck'($P10)
null $S1
if_null $P9, __label_6
set $S1, $P9
__label_6:
.annotate 'line', 6262
isne $I3, $S1, ''
unless $I3 goto __label_7
.annotate 'line', 6263
$P1 = __ARG_2.'get'()
goto __label_8
__label_7: # else
set $S1, 'P'
__label_8: # endif
.annotate 'line', 6266
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S2, '__ARG_', $S4
.annotate 'line', 6267
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6269
# string varname: $S3
set $P10, $P1
null $S3
if_null $P10, __label_9
set $S3, $P10
__label_9:
.annotate 'line', 6270
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 6271
$P3['name'] = $S3
.annotate 'line', 6272
$P1 = __ARG_2.'get'()
.annotate 'line', 6273
$P11 = $P1.'isop'('[')
if_null $P11, __label_10
unless $P11 goto __label_10
# {
.annotate 'line', 6274
# var modifiers: $P4
new $P12, [  'ModifierList' ]
$P12.'ModifierList'(__ARG_2, self)
set $P4, $P12
.annotate 'line', 6275
$P3['modifiers'] = $P4
.annotate 'line', 6276
$P1 = __ARG_2.'get'()
# }
__label_10: # endif
.annotate 'line', 6278
getattribute $P11, self, 'args'
$P11.'push'($P3)
# }
.annotate 'line', 6279
$P12 = $P1.'isop'(',')
if_null $P12, __label_4
if $P12 goto __label_3
__label_4: # enddo
.annotate 'line', 6280
$P13 = $P1.'isop'(')')
isfalse $I3, $P13
unless $I3 goto __label_11
.annotate 'line', 6281
'SyntaxError'("Expected ')'", $P1)
__label_11: # endif
# }
__label_2: # endif
.annotate 'line', 6284
$P1 = __ARG_2.'get'()
.annotate 'line', 6285
$P13 = $P1.'isop'('{')
isfalse $I4, $P13
unless $I4 goto __label_12
.annotate 'line', 6286
'Expected'('{', $P1)
__label_12: # endif
.annotate 'line', 6287
new $P16, [  'CompoundStatement' ]
$P16.'CompoundStatement'($P1, __ARG_2, self)
set $P15, $P16
setattribute self, 'body', $P15
.annotate 'line', 6288
.return(self)
# }
.annotate 'line', 6289

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6290
# Body
# {
.annotate 'line', 6292
# string name: $S1
getattribute $P14, self, 'name'
null $S1
if_null $P14, __label_0
set $S1, $P14
__label_0:
.annotate 'line', 6293
__ARG_1.'say'()
.annotate 'line', 6294
__ARG_1.'print'(".sub '", $S1, "'")
.annotate 'line', 6297
$P14 = self.'ismethod'()
if_null $P14, __label_1
unless $P14 goto __label_1
.annotate 'line', 6298
__ARG_1.'print'(' :method')
__label_1: # endif
.annotate 'line', 6299
# var modifiers: $P1
getattribute $P1, self, 'modifiers'
.annotate 'line', 6300
isnull $I4, $P1
not $I4
unless $I4 goto __label_2
# {
.annotate 'line', 6301
# var mlist: $P2
$P2 = $P1.'getlist'()
.annotate 'line', 6302
iter $P15, $P2
set $P15, 0
__label_4: # for iteration
unless $P15 goto __label_5
shift $P3, $P15
# {
.annotate 'line', 6303
# int nargmods: $I1
$P16 = $P3.'numargs'()
set $I1, $P16
.annotate 'line', 6304
$P16 = $P3.'getname'()
__ARG_1.'print'(' :', $P16)
.annotate 'line', 6305
isgt $I4, $I1, 0
unless $I4 goto __label_6
# {
.annotate 'line', 6306
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6307
# int iargmod: $I2
null $I2
goto __label_9
__label_7: # for iteration
inc $I2
__label_9: # for condition
islt $I5, $I2, $I1
unless $I5 goto __label_8 # for end
# {
.annotate 'line', 6308
# var argmod: $P4
$P4 = $P3.'getarg'($I2)
.annotate 'line', 6309
$P17 = $P4.'isstringliteral'()
isfalse $I5, $P17
unless $I5 goto __label_10
.annotate 'line', 6310
getattribute $P18, $P4, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_10: # endif
.annotate 'line', 6311
$P17 = $P4.'getPirString'()
__ARG_1.'print'($P17)
# }
goto __label_7 # for iteration
__label_8: # for end
.annotate 'line', 6313
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
.annotate 'line', 6318
iseq $I6, $S1, 'main'
unless $I6 goto __label_11
.annotate 'line', 6319
__ARG_1.'print'(' :main')
__label_11: # endif
# }
__label_3: # endif
.annotate 'line', 6321
__ARG_1.'say'()
.annotate 'line', 6323
# var args: $P5
getattribute $P5, self, 'args'
.annotate 'line', 6324
# var arg: $P6
null $P6
.annotate 'line', 6325
# string argname: $S2
null $S2
.annotate 'line', 6326
# var a: $P7
null $P7
.annotate 'line', 6327
iter $P19, $P5
set $P19, 0
__label_12: # for iteration
unless $P19 goto __label_13
shift $P6, $P19
# {
.annotate 'line', 6328
$S2 = $P6['name']
.annotate 'line', 6329
$P7 = self.'getvar'($S2)
.annotate 'line', 6330
# string ptype: $S3
$P20 = $P7['type']
$P18 = 'typetopirname'($P20)
null $S3
if_null $P18, __label_14
set $S3, $P18
__label_14:
$P20 = $P7['reg']
.annotate 'line', 6331
__ARG_1.'print'('.param ', $S3, ' ', $P20)
.annotate 'line', 6332
# var modarg: $P8
$P8 = $P6['modifiers']
.annotate 'line', 6333
isnull $I6, $P8
not $I6
unless $I6 goto __label_15
# {
.annotate 'line', 6334
# var named: $P9
null $P9
.annotate 'line', 6335
# var slurpy: $P10
null $P10
.annotate 'line', 6336
# var modarglist: $P11
$P11 = $P8.'getlist'()
.annotate 'line', 6337
iter $P21, $P11
set $P21, 0
__label_16: # for iteration
unless $P21 goto __label_17
shift $P12, $P21
# {
.annotate 'line', 6338
# string modname: $S4
$P22 = $P12.'getname'()
null $S4
if_null $P22, __label_18
set $S4, $P22
__label_18:
set $S6, $S4
set $S7, 'named'
.annotate 'line', 6339
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
.annotate 'line', 6347
__ARG_1.'print'(' :', $S4)
__label_19: # switch end
# }
goto __label_16
__label_17: # endfor
.annotate 'line', 6350
isnull $I7, $P9
not $I7
unless $I7 goto __label_25
isnull $I7, $P10
not $I7
__label_25:
unless $I7 goto __label_23
# {
.annotate 'line', 6355
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_24
__label_23: # else
# {
.annotate 'line', 6358
isnull $I7, $P9
not $I7
unless $I7 goto __label_26
# {
.annotate 'line', 6359
# string setname: $S5
null $S5
.annotate 'line', 6360
# int nargs: $I3
$P22 = $P9.'numargs'()
set $I3, $P22
set $I8, $I3
null $I9
.annotate 'line', 6361
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
.annotate 'line', 6366
# var argmod: $P13
$P13 = $P9.'getarg'(0)
.annotate 'line', 6367
$P23 = $P13.'isstringliteral'()
isfalse $I10, $P23
unless $I10 goto __label_32
.annotate 'line', 6368
getattribute $P24, self, 'start'
'SyntaxError'('Invalid modifier', $P24)
__label_32: # endif
.annotate 'line', 6369
$P25 = $P13.'getPirString'()
set $S5, $P25
goto __label_28 # break
__label_29: # default
.annotate 'line', 6372
getattribute $P26, self, 'start'
'SyntaxError'('Invalid modifier', $P26)
__label_28: # switch end
.annotate 'line', 6374
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_27
__label_26: # else
.annotate 'line', 6376
isnull $I8, $P10
not $I8
unless $I8 goto __label_33
# {
.annotate 'line', 6377
__ARG_1.'print'(" :slurpy")
# }
__label_33: # endif
__label_27: # endif
# }
__label_24: # endif
# }
__label_15: # endif
.annotate 'line', 6381
__ARG_1.'say'('')
# }
goto __label_12
__label_13: # endfor
.annotate 'line', 6383
__ARG_1.'say'()
.annotate 'line', 6384
getattribute $P23, self, 'name'
__ARG_1.'annotate'($P23)
.annotate 'line', 6385
__ARG_1.'comment'('Body')
.annotate 'line', 6386
getattribute $P24, self, 'body'
$P24.'emit'(__ARG_1)
.annotate 'line', 6388
getattribute $P26, self, 'body'
$P25 = $P26.'getend'()
__ARG_1.'annotate'($P25)
.annotate 'line', 6389
__ARG_1.'say'("\n.end # ", $S1, "\n")
# }
.annotate 'line', 6390

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6391
# Body
# {
.annotate 'line', 6393
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6394

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6395
# Body
# {
.annotate 'line', 6397
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6398

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'FunctionStatement' ]
get_class $P1, [  'BlockStatement' ]
# BlockStatement
addparent $P0, $P1
.annotate 'line', 6166
addattribute $P0, 'name'
.annotate 'line', 6167
addattribute $P0, 'modifiers'
.annotate 'line', 6168
addattribute $P0, 'args'
.annotate 'line', 6169
addattribute $P0, 'body'
.annotate 'line', 6170
addattribute $P0, 'regstI'
.annotate 'line', 6171
addattribute $P0, 'regstN'
.annotate 'line', 6172
addattribute $P0, 'regstS'
.annotate 'line', 6173
addattribute $P0, 'regstP'
.annotate 'line', 6174
addattribute $P0, 'nlabel'
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 6407
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

.annotate 'line', 6425
# Body
# {
.annotate 'line', 6427
setattribute self, 'parent', __ARG_2
.annotate 'line', 6428
setattribute self, 'owner', __ARG_2
.annotate 'line', 6429
root_new $P11, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P11
.annotate 'line', 6430
root_new $P11, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P11
.annotate 'line', 6431
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P14
.annotate 'line', 6432
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P14
.annotate 'line', 6434
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6435
setattribute self, 'name', $P1
.annotate 'line', 6436
$P1 = __ARG_1.'get'()
.annotate 'line', 6437
$P16 = $P1.'isop'(':')
if_null $P16, __label_0
unless $P16 goto __label_0
# {
.annotate 'line', 6438
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 6439
# {
.annotate 'line', 6440
$P1 = __ARG_1.'get'()
.annotate 'line', 6441
$P2.'push'($P1)
.annotate 'line', 6442
$P1 = __ARG_1.'get'()
.annotate 'line', 6443
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
.annotate 'line', 6446
$P17 = $P1.'isop'('{')
isfalse $I1, $P17
unless $I1 goto __label_4
.annotate 'line', 6447
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 6448
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 6449
$P18 = $P1.'isop'('}')
isfalse $I2, $P18
unless $I2 goto __label_5
# {
.annotate 'line', 6450
$P19 = $P1.'iskeyword'('function')
if_null $P19, __label_7
unless $P19 goto __label_7
# {
.annotate 'line', 6451
# var f: $P3
new $P20, [  'MethodStatement' ]
$P3 = $P20.'parse'($P1, __ARG_1, self)
.annotate 'line', 6452
# var functions: $P4
getattribute $P4, self, 'functions'
.annotate 'line', 6453
$P4.'push'($P3)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6455
$P18 = $P1.'iskeyword'('var')
if_null $P18, __label_9
unless $P18 goto __label_9
# {
.annotate 'line', 6456
# var name: $P5
$P5 = __ARG_1.'get'()
.annotate 'line', 6457
$P19 = $P5.'isidentifier'()
isfalse $I2, $P19
unless $I2 goto __label_11
.annotate 'line', 6458
'SyntaxError'("Expected member identifier", $P5)
__label_11: # endif
.annotate 'line', 6459
getattribute $P20, self, 'members'
$P20.'push'($P5)
.annotate 'line', 6460
$P1 = __ARG_1.'get'()
.annotate 'line', 6461
$P21 = $P1.'isop'(';')
isfalse $I3, $P21
unless $I3 goto __label_12
.annotate 'line', 6462
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 6464
$P21 = $P1.'iskeyword'('const')
if_null $P21, __label_13
unless $P21 goto __label_13
# {
.annotate 'line', 6465
# var cst: $P6
$P6 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 6466
# var constants: $P7
getattribute $P7, self, 'constants'
.annotate 'line', 6467
$P7.'push'($P6)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6470
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 6471
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 6473
# var classns: $P8
getattribute $P22, self, 'parent'
$P8 = $P22.'getpath'()
.annotate 'line', 6474
getattribute $P22, self, 'name'
$P8.'push'($P22)
.annotate 'line', 6475
setattribute self, 'classns', $P8
# }
.annotate 'line', 6476

.end # ClassStatement


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6477
# Body
# {
.annotate 'line', 6479
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 6480

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6481
# Body
# {
.annotate 'line', 6483
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6484

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 6485
# Body
# {
.annotate 'line', 6487
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 6488
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 6489
.return(self)
# }
.annotate 'line', 6490

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 6491
# Body
# {
.annotate 'line', 6493
getattribute $P1, self, 'classns'
.tailcall 'getkey'($P1)
# }
.annotate 'line', 6494

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6495
# Body
# {
.annotate 'line', 6497
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 6498
$P6 = 'namespacekey'($P1)
__ARG_1.'say'($P6)
.annotate 'line', 6499
getattribute $P6, self, 'functions'
iter $P7, $P6
set $P7, 0
__label_0: # for iteration
unless $P7 goto __label_1
shift $P2, $P7
.annotate 'line', 6500
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6502
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 6505
$P8 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P8)
.annotate 'line', 6506
# int n: $I1
set $I1, 1
.annotate 'line', 6507
getattribute $P8, self, 'bases'
iter $P9, $P8
set $P9, 0
__label_2: # for iteration
unless $P9 goto __label_3
shift $P3, $P9
# {
.annotate 'line', 6508
# string reg: $S1
set $I2, $I1
inc $I1
$S3 = $I2
concat $S1, "$P", $S3
.annotate 'line', 6509
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 6510
$P10 = $P3.'isstring'()
if_null $P10, __label_4
unless $P10 goto __label_4
.annotate 'line', 6511
__ARG_1.'say'($P3)
goto __label_5
__label_4: # else
# {
.annotate 'line', 6513
# string name: $S2
set $P11, $P3
null $S2
if_null $P11, __label_6
set $S2, $P11
__label_6:
.annotate 'line', 6514
# var cl: $P4
$P4 = self.'checkclass'($S2)
.annotate 'line', 6515
isnull $I2, $P4
unless $I2 goto __label_7
.annotate 'line', 6516
'InternalError'('No such class')
__label_7: # endif
.annotate 'line', 6518
$P10 = $P4.'getclasskey'()
__ARG_1.'say'($P10)
# }
__label_5: # endif
.annotate 'line', 6520
__ARG_1.'comment'($P3)
.annotate 'line', 6521
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 6523
getattribute $P11, self, 'members'
iter $P12, $P11
set $P12, 0
__label_8: # for iteration
unless $P12 goto __label_9
shift $P5, $P12
# {
.annotate 'line', 6524
__ARG_1.'annotate'($P5)
.annotate 'line', 6525
__ARG_1.'say'("addattribute $P0, '", $P5, "'")
# }
goto __label_8
__label_9: # endfor
.annotate 'line', 6528
__ARG_1.'say'('.end')
# }
.annotate 'line', 6529

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'ClassStatement' ]
get_class $P1, [  'VarContainer' ]
# VarContainer
addparent $P0, $P1
.annotate 'line', 6416
addattribute $P0, 'parent'
.annotate 'line', 6417
addattribute $P0, 'owner'
.annotate 'line', 6418
addattribute $P0, 'name'
.annotate 'line', 6419
addattribute $P0, 'bases'
.annotate 'line', 6420
addattribute $P0, 'constants'
.annotate 'line', 6421
addattribute $P0, 'functions'
.annotate 'line', 6422
addattribute $P0, 'members'
.annotate 'line', 6423
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6536
# Body
# {
.annotate 'line', 6538
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6539
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 6540
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 6541
'ExpectOp'(';', __ARG_2)
.annotate 'line', 6542
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 6543
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 6548
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 6549
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 6550
# var file: $P5
new $P5, ['FileHandle']
.annotate 'line', 6551
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 6552
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 6553
# try: create handler
new $P11, 'ExceptionHandler'
set_addr $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 6554
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 6555
# }
# try: end
goto __label_5
.annotate 'line', 6553
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
.annotate 'line', 6560
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 6561
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 6566
load_bytecode 'PGE.pbc'
.annotate 'line', 6567
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 6568
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 6570
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
.annotate 'line', 6571
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6572
$P8 = $P7($S4)
.annotate 'line', 6573
# predefined elements
elements $I4, $P8
isgt $I3, $I4, 0
unless $I3 goto __label_11
# {
.annotate 'line', 6574
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 6575
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 6576
# int ivalue: $I1
null $I1
.annotate 'line', 6577
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6578
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 6583
$P16 = 'newTokenFrom'(5, $S5, __ARG_1)
.annotate 'line', 6582
$P15 = 'integerValue'(__ARG_3, $P16, $I1)
.annotate 'line', 6581
__ARG_3.'createconst'($S5, 'I', $P15, '')
# }
__label_11: # endif
# }
goto __label_7 # for iteration
__label_8: # for end
.annotate 'line', 6587
$P5.'close'()
# }
.annotate 'line', 6588

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 6600
# Body
# {
.annotate 'line', 6602
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 6603
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 6604
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 6605
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 6606

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 6607
# Body
# {
.annotate 'line', 6609
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 6610
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 6611
getattribute $P4, $P2, 'name'
$S1 = $P4
iseq $I1, $S1, __ARG_1
unless $I1 goto __label_2
.annotate 'line', 6612
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 6613
.return($P4)
# }
.annotate 'line', 6614

.end # checkclass_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 6615
# Body
# {
.annotate 'line', 6617
# string namespace: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6618
# int balance1: $I1
null $I1
.annotate 'line', 6619
# int balance2: $I2
null $I2
.annotate 'line', 6620
# int balance3: $I3
null $I3
.annotate 'line', 6621
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6622
$P2 = __ARG_1.'get'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6624
$P11 = $P2.'iskeyword'('namespace')
if_null $P11, __label_2
unless $P11 goto __label_2
# {
.annotate 'line', 6626
# var start: $P3
set $P3, $P2
.annotate 'line', 6627
$P2 = __ARG_1.'get'()
.annotate 'line', 6628
# string name: $S1
set $P11, $P2
null $S1
if_null $P11, __label_4
set $S1, $P11
__label_4:
.annotate 'line', 6629
$P1.'push'($S1)
.annotate 'line', 6630
$P2 = __ARG_1.'get'()
.annotate 'line', 6632
# var modifier: $P4
null $P4
.annotate 'line', 6633
$P12 = $P2.'isop'('[')
if_null $P12, __label_5
unless $P12 goto __label_5
# {
.annotate 'line', 6634
new $P13, [  'ModifierList' ]
$P13.'ModifierList'(__ARG_1, self)
set $P4, $P13
.annotate 'line', 6635
$P2 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 6638
$P12 = $P2.'isop'('{')
isfalse $I5, $P12
unless $I5 goto __label_6
.annotate 'line', 6639
'Expected'('{', $P2)
__label_6: # endif
.annotate 'line', 6640
# var child: $P5
new $P13, [  'NamespaceStatement' ]
$P13.'NamespaceStatement'(self, $P3, $S1, $P4)
set $P5, $P13
.annotate 'line', 6641
getattribute $P14, self, 'namespaces'
$P14.'push'($P5)
.annotate 'line', 6642
getattribute $P14, self, 'items'
$P14.'push'($P5)
.annotate 'line', 6643
$P5.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 6645
$P15 = $P2.'iskeyword'('const')
if_null $P15, __label_7
unless $P15 goto __label_7
# {
.annotate 'line', 6646
# var cst: $P6
$P6 = 'parseConst'($P2, __ARG_1, self)
.annotate 'line', 6647
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_8
__label_7: # else
.annotate 'line', 6649
$P16 = $P2.'iskeyword'('function')
if_null $P16, __label_9
unless $P16 goto __label_9
# {
.annotate 'line', 6650
# var f: $P7
new $P17, [  'FunctionStatement' ]
$P7 = $P17.'parse'($P2, __ARG_1, self)
.annotate 'line', 6651
# var functions: $P8
getattribute $P8, self, 'functions'
.annotate 'line', 6652
$P8.'push'($P7)
.annotate 'line', 6653
getattribute $P16, self, 'items'
$P16.'push'($P7)
# }
goto __label_10
__label_9: # else
.annotate 'line', 6655
$P17 = $P2.'iskeyword'('class')
if_null $P17, __label_11
unless $P17 goto __label_11
# {
.annotate 'line', 6656
# var c: $P9
new $P18, [  'ClassStatement' ]
$P18.'ClassStatement'(__ARG_1, self)
set $P9, $P18
.annotate 'line', 6657
# var classes: $P10
getattribute $P10, self, 'classes'
.annotate 'line', 6658
$P10.'push'($P9)
.annotate 'line', 6659
getattribute $P18, self, 'items'
$P18.'push'($P9)
# }
goto __label_12
__label_11: # else
.annotate 'line', 6661
$P19 = $P2.'iskeyword'('using')
if_null $P19, __label_13
unless $P19 goto __label_13
# {
.annotate 'line', 6662
$P2 = __ARG_1.'get'()
.annotate 'line', 6663
$P19 = $P2.'iskeyword'('extern')
isfalse $I5, $P19
unless $I5 goto __label_15
.annotate 'line', 6664
'SyntaxError'('Unsupported at nmaespace level', $P2)
__label_15: # endif
.annotate 'line', 6665
$P2 = __ARG_1.'get'()
.annotate 'line', 6666
$P20 = $P2.'isstring'()
isfalse $I6, $P20
unless $I6 goto __label_16
.annotate 'line', 6667
'Expected'('string literal', $P2)
__label_16: # endif
.annotate 'line', 6668
# string reqlib: $S2
set $P20, $P2
null $S2
if_null $P20, __label_17
set $S2, $P20
__label_17:
.annotate 'line', 6669
self.'addlib'($S2)
.annotate 'line', 6670
$P2 = __ARG_1.'get'()
.annotate 'line', 6671
'RequireOp'(';', $P2)
# }
goto __label_14
__label_13: # else
.annotate 'line', 6673
$P21 = $P2.'iskeyword'('$include_const')
if_null $P21, __label_18
unless $P21 goto __label_18
# {
.annotate 'line', 6674
'include_parrot'($P2, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6676
$P21 = $P2.'isop'('}')
if_null $P21, __label_20
unless $P21 goto __label_20
# {
.annotate 'line', 6677
# int n: $I4
set $P22, $P1
set $I4, $P22
.annotate 'line', 6678
islt $I6, $I4, 1
unless $I6 goto __label_22
# {
.annotate 'line', 6679
getattribute $P22, self, 'parent'
isnull $I7, $P22
not $I7
unless $I7 goto __label_23
.return()
__label_23: # endif
.annotate 'line', 6680
# string line: $S3
getattribute $P23, $P2, 'line'
null $S3
if_null $P23, __label_24
set $S3, $P23
__label_24:
.annotate 'line', 6681
'SyntaxError'('Unclosed namespace', $P2)
# }
__label_22: # endif
.annotate 'line', 6683
$P1.'pop'()
# }
goto __label_21
__label_20: # else
.annotate 'line', 6686
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
.annotate 'line', 6688

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 6689
# Body
# {
.annotate 'line', 6691
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 6692

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 6693
# Body
# {
.annotate 'line', 6695
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 6696
# string s: $S1
$P3 = 'namespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6698
# int activate: $I1
set $I1, 1
.annotate 'line', 6699
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 6700
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 6701
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 6704
unless $I1 goto __label_6
# {
.annotate 'line', 6705
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 6706
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 6708
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 6710

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NamespaceBase' ]
get_class $P1, [  'VarContainer' ]
# VarContainer
addparent $P0, $P1
.annotate 'line', 6594
addattribute $P0, 'namespaces'
.annotate 'line', 6595
addattribute $P0, 'classes'
.annotate 'line', 6596
addattribute $P0, 'functions'
.annotate 'line', 6597
addattribute $P0, 'items'
.annotate 'line', 6598
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 6724
# Body
# {
.annotate 'line', 6727
setattribute self, 'parent', __ARG_1
.annotate 'line', 6728
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 6729
setattribute self, 'name', $P2
.annotate 'line', 6730
setattribute self, 'modifier', __ARG_4
.annotate 'line', 6731
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 6732
$P3 = __ARG_4.'pick'('HLL')
isnull $I2, $P3
not $I2
unless $I2 goto __label_1
.annotate 'line', 6733
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6735

.end # NamespaceStatement


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6736
# Body
# {
.annotate 'line', 6738
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 6739

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 6740
# Body
# {
.annotate 'line', 6742
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 6743
getattribute $P2, self, 'hll'
isnull $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6744
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 6745
.return($P1)
# }
.annotate 'line', 6746

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6747
# Body
# {
.annotate 'line', 6749
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 6750

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6751
# Body
# {
.annotate 'line', 6753
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 6754
isnull $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 6755
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 6757
.return($P1)
__label_1: # endif
# }
.annotate 'line', 6758

.end # checkclass


.sub 'optimize' :method

.annotate 'line', 6759
# Body
# {
.annotate 'line', 6761
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 6762
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
# {
.annotate 'line', 6763
$P1 = $P1.'optimize'()
.annotate 'line', 6764
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 6766
self.'optimize_base'()
.annotate 'line', 6767
.return(self)
# }
.annotate 'line', 6768

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6769
# Body
# {
.annotate 'line', 6771
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 6772
isnull $I1, $P1
not $I1
unless $I1 goto __label_0
.annotate 'line', 6773
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 6775
self.'emit_base'(__ARG_1)
.annotate 'line', 6777
isnull $I1, $P1
not $I1
unless $I1 goto __label_1
.annotate 'line', 6778
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 6779

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'NamespaceStatement' ]
get_class $P1, [  'NamespaceBase' ]
# NamespaceBase
addparent $P0, $P1
.annotate 'line', 6719
addattribute $P0, 'parent'
.annotate 'line', 6720
addattribute $P0, 'name'
.annotate 'line', 6721
addattribute $P0, 'modifier'
.annotate 'line', 6722
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 6791
# Body
# {
.annotate 'line', 6793
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
# }
.annotate 'line', 6794

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 6795
# Body
# {
.annotate 'line', 6797
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 6798
$P1[__ARG_1] = 1
# }
.annotate 'line', 6799

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 6800
# Body
# {
.annotate 'line', 6802
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 6803
isnull $I2, $P2
unless $I2 goto __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 6804

.end # predef_is_used


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 6806
# Body
# {
.annotate 'line', 6808
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 6809
isnull $I1, $P1
unless $I1 goto __label_0
# {
.annotate 'line', 6810
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6811
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 6813
$P1[__ARG_1] = 1
# }
.annotate 'line', 6814

.end # addlib


.sub 'getpath' :method

.annotate 'line', 6815
# Body
# {
.annotate 'line', 6817
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6818
.return($P1)
# }
.annotate 'line', 6819

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 6820
# Body
# {
.annotate 'line', 6822
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 6823

.end # checkclass


.sub 'optimize' :method

.annotate 'line', 6824
# Body
# {
.annotate 'line', 6826
self.'optimize_base'()
.annotate 'line', 6827
.return(self)
# }
.annotate 'line', 6828

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6829
# Body
# {
.annotate 'line', 6831
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 6832
# int somelib: $I1
null $I1
.annotate 'line', 6833
$P4 = $P1['chomp']
isnull $I3, $P4
not $I3
unless $I3 goto __label_0
# {
set $I1, 1
.annotate 'line', 6835
__ARG_1.'say'(".sub 'initialize' :load :init :anon\n  load_bytecode 'String/Utils.pbc'\n.end\n")
# }
__label_0: # endif
.annotate 'line', 6841
# int trans: $I2
null $I2
.annotate 'line', 6842
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
.annotate 'line', 6845
iter $P5, $P2
set $P5, 0
__label_1: # for iteration
unless $P5 goto __label_2
shift $S1, $P5
.annotate 'line', 6846
$P4 = $P1[$S1]
isnull $I3, $P4
not $I3
unless $I3 goto __label_3
set $I2, 1
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 6848
unless $I2 goto __label_4
# {
set $I1, 1
.annotate 'line', 6850
__ARG_1.'say'(".loadlib 'trans_ops'")
# }
__label_4: # endif
.annotate 'line', 6853
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 6854
isnull $I4, $P3
not $I4
unless $I4 goto __label_5
# {
set $I1, 1
.annotate 'line', 6856
iter $P6, $P3
set $P6, 0
__label_6: # for iteration
unless $P6 goto __label_7
shift $S2, $P6
.annotate 'line', 6857
__ARG_1.'say'('.loadlib ', $S2)
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6859
unless $I1 goto __label_8
.annotate 'line', 6860
__ARG_1.'comment'('end libs')
__label_8: # endif
.annotate 'line', 6861
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 6862

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'RootNamespace' ]
get_class $P1, [  'NamespaceBase' ]
# NamespaceBase
addparent $P0, $P1
.annotate 'line', 6788
addattribute $P0, 'predefs_used'
.annotate 'line', 6789
addattribute $P0, 'libs'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 6874
# Body
# {
.annotate 'line', 6876
# var rootns: $P1
new $P1, [  'RootNamespace' ]
.annotate 'line', 6879
# var taux: $P2
$P2 = 'newToken'(4, 'predefconst', 0, '__predefconst__')
.annotate 'line', 6883
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 6882
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 6881
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 6887
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 6886
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 6885
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 6893
new $P6, [  'StringLiteral' ]
# predefined int
.annotate 'line', 6894
$I2 = "2"
add $I1, $I2, 1
# predefined string
$S1 = $I1
$P7 = 'newTokenFrom'(2, $S1, $P2)
$P6.'StringLiteral'($P1, $P7)
set $P5, $P6
.annotate 'line', 6892
$P1.'createconst'('__STAGE__', 'S', $P5, '')
.annotate 'line', 6897
setattribute self, 'rootns', $P1
# }
.annotate 'line', 6898

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 6899
# Body
# {
.annotate 'line', 6901
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 6902

.end # parse


.sub 'optimize' :method

.annotate 'line', 6903
# Body
# {
.annotate 'line', 6905
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 6906

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6907
# Body
# {
.annotate 'line', 6909
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 6910
__ARG_1.'say'('')
.annotate 'line', 6912
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 6914
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 6915

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'WinxedCompiler' ]
.annotate 'line', 6873
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 6922
# Body
# {
.annotate 'line', 6924
# var handlein: $P1
new $P1, ['StringHandle']
.annotate 'line', 6926
$P1.'open'('__eval__', 'w')
.annotate 'line', 6927
$P1.'puts'(__ARG_1)
.annotate 'line', 6928
$P1.'close'()
.annotate 'line', 6929
$P1.'open'('__eval__', 'r')
.annotate 'line', 6930
# var tk: $P2
new $P8, [  'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 6931
# var winxed: $P3
new $P3, [  'WinxedCompiler' ]
.annotate 'line', 6932
$P3.'parse'($P2)
.annotate 'line', 6933
$P1.'close'()
.annotate 'line', 6934
$P3.'optimize'()
.annotate 'line', 6935
# var handleout: $P4
new $P4, ['StringHandle']
.annotate 'line', 6936
$P4.'open'('__eval__', 'w')
.annotate 'line', 6937
# var emit: $P5
new $P5, [  'Emit' ]
.annotate 'line', 6938
$P5.'initialize'($P4)
.annotate 'line', 6939
$P3.'emit'($P5)
.annotate 'line', 6940
$P5.'close'()
.annotate 'line', 6941
$P4.'close'()
.annotate 'line', 6942
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 6943
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 6944
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 6945
.return($P7)
# }
.annotate 'line', 6946

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 6947
# Body
# {
.annotate 'line', 6949
# var handlein: $P1
new $P1, ['FileHandle']
.annotate 'line', 6950
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 6951
$P1.'encoding'('utf8')
.annotate 'line', 6952
# var tk: $P2
new $P5, [  'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 6953
# var winxed: $P3
new $P3, [  'WinxedCompiler' ]
.annotate 'line', 6954
$P3.'parse'($P2)
.annotate 'line', 6955
$P1.'close'()
.annotate 'line', 6956
$P3.'optimize'()
.annotate 'line', 6957
# var emit: $P4
new $P4, [  'Emit' ]
.annotate 'line', 6958
$P4.'initialize'(__ARG_2)
.annotate 'line', 6959
$P3.'emit'($P4)
.annotate 'line', 6960
$P4.'close'()
# }
.annotate 'line', 6961

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 6962
# Body
# {
.annotate 'line', 6964
# var handlein: $P1
new $P1, ['FileHandle']
.annotate 'line', 6965
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 6966
$P1.'encoding'('utf8')
.annotate 'line', 6967
# var tk: $P2
new $P8, [  'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 6968
# var winxed: $P3
new $P3, [  'WinxedCompiler' ]
.annotate 'line', 6969
$P3.'parse'($P2)
.annotate 'line', 6970
$P1.'close'()
.annotate 'line', 6971
$P3.'optimize'()
.annotate 'line', 6972
# var handleout: $P4
new $P4, ['StringHandle']
.annotate 'line', 6973
$P4.'open'('__eval__', 'w')
.annotate 'line', 6974
# var emit: $P5
new $P5, [  'Emit' ]
.annotate 'line', 6975
$P5.'initialize'($P4)
.annotate 'line', 6976
$P3.'emit'($P5)
.annotate 'line', 6977
$P5.'close'()
.annotate 'line', 6978
$P4.'close'()
.annotate 'line', 6979
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 6980
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 6981
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 6982
.return($P7)
# }
.annotate 'line', 6983

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [  'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 6988
# Body
# {
.annotate 'line', 6990
# var winxed: $P1
new $P1, [  'WinxedCompiler' ]
.annotate 'line', 6991
$P1.'parse'(__ARG_1)
.annotate 'line', 6993
$P1.'optimize'()
.annotate 'line', 6995
# var handle: $P2
null $P2
.annotate 'line', 6996
iseq $I1, __ARG_2, '-'
unless $I1 goto __label_0
.annotate 'line', 6997
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 6999
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7000
# var emit: $P3
new $P3, [  'Emit' ]
.annotate 'line', 7001
$P3.'initialize'($P2)
.annotate 'line', 7002
$P1.'emit'($P3)
.annotate 'line', 7003
$P3.'close'()
.annotate 'line', 7004
$P2.'close'()
# }
.annotate 'line', 7005

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7011
# Body
# {
.annotate 'line', 7013
# var comp: $P1
new $P1, [  'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7014
compreg 'winxed', $P1
# }
.annotate 'line', 7015

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7017
# Body
# {
.annotate 'line', 7019
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7020
# var getopts: $P1
new $P1, ['Getopt';'Obj']
.annotate 'line', 7021
$P1.'notOptStop'(1)
.annotate 'line', 7022
$P1.'push_string'('o=s')
.annotate 'line', 7023
$P1.'push_string'('e=s')
.annotate 'line', 7024
$P1.'push_string'('c')
.annotate 'line', 7025
$P1.'push_string'('noan')
.annotate 'line', 7027
__ARG_1.'shift'()
.annotate 'line', 7028
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7029
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7030
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7031
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7032
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7034
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7035
# string filename: $S1
null $S1
.annotate 'line', 7036
# string expr: $S2
null $S2
.annotate 'line', 7037
# var file: $P7
null $P7
.annotate 'line', 7038
isnull $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 7039
iseq $I3, $I1, 0
unless $I3 goto __label_2
# predefined Error
.annotate 'line', 7040
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7042
$S1 = __ARG_1[0]
.annotate 'line', 7043
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7044
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S4, 'function main[main](argv){', $S2
concat $S2, $S4, ';}'
.annotate 'line', 7049
new $P7, ['StringHandle']
.annotate 'line', 7050
$P7.'open'('__eval__', 'w')
.annotate 'line', 7051
$P7.'puts'($S2)
.annotate 'line', 7052
$P7.'close'()
.annotate 'line', 7053
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7056
# var t: $P8
new $P10, [  'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7058
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7059
isnull $I2, $P3
not $I2
unless $I2 goto __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7061
'winxed_parser'($P8, $S3)
.annotate 'line', 7063
$P7.'close'()
# }
.annotate 'line', 7064

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7066
# Body
# {
.annotate 'line', 7068
# try: create handler
new $P6, 'ExceptionHandler'
set_addr $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7074
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7068
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7077
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7078
print 'Error: '
say $S1
.annotate 'line', 7079
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7080
# int i: $I1
set $I1, 1
.annotate 'line', 7081
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7082
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7083
# string subname: $S2
null $S2
.annotate 'line', 7084
isnull $I3, $P4
not $I3
unless $I3 goto __label_4
# {
set $S2, $P4
.annotate 'line', 7086
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7087
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
.annotate 'line', 7089
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7090
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7091
isne $I4, $S4, ''
unless $I4 goto __label_8
# {
.annotate 'line', 7092
# int line: $I2
$I2 = $P5['line']
set $I5, $I1
.annotate 'line', 7093
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
.annotate 'line', 7097

.end # main

# End generated code
