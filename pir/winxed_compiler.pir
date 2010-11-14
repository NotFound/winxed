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
lt $I1, 0, __label_0
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

.annotate 'line', 55
# Body
# {
.annotate 'line', 57
# var stderr: $P1
null $P1
.annotate 'line', 58
# pirop getstderr
getstderr $P1
.annotate 'line', 59
$P1.'print'('WARNING: ')
.annotate 'line', 60
$P1.'print'(__ARG_1)
.annotate 'line', 61
unless __ARG_3 goto __label_0
# {
.annotate 'line', 62
$P1.'print'(' near ')
.annotate 'line', 63
$P2 = __ARG_2.'show'()
$P1.'print'($P2)
# }
__label_0: # endif
.annotate 'line', 65
$P1.'print'("\n")
# }
.annotate 'line', 66

.end # Warn


.sub 'InternalError'
.param string __ARG_1
.param pmc __ARG_2 :optional
.param int __ARG_3 :opt_flag

.annotate 'line', 68
# Body
# {
.annotate 'line', 70
unless __ARG_3 goto __label_0
# {
.annotate 'line', 71
# string desc: $S1
$P2 = __ARG_2.'show'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S0, __ARG_1, ' near '
concat $S0, $S1
set __ARG_1, $S0
.annotate 'line', 72
# }
__label_0: # endif
.annotate 'line', 74
# var ex: $P1
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = __ARG_1
$P1['severity'] = 2
$P1['type'] = 555
.annotate 'line', 75
throw $P1
# }
.annotate 'line', 76

.end # InternalError


.sub 'TokenError'
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 78
# Body
# {
.annotate 'line', 80
# string sline: $S1
set $I1, __ARG_3
set $S1, $I1
.annotate 'line', 81
# string file: $S2
getattribute $P2, __ARG_2, 'filename'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
.annotate 'line', 82
# string m: $S3
concat $S0, __ARG_1, ' in '
concat $S0, $S2
concat $S0, ' line '
concat $S0, $S1
set $S3, $S0
.annotate 'line', 83
# var ex: $P1
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = $S3
$P1['severity'] = 2
$P1['type'] = 556
.annotate 'line', 84
throw $P1
# }
.annotate 'line', 85

.end # TokenError


.sub 'SyntaxError'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 87
# Body
# {
.annotate 'line', 89
# string sline: $S1
getattribute $P2, __ARG_2, 'line'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 90
# string file: $S2
getattribute $P2, __ARG_2, 'file'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 91
# string desc: $S3
$P3 = __ARG_2.'show'()
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 92
# string m: $S4
concat $S0, __ARG_1, ' in '
concat $S0, $S2
concat $S0, ' line '
concat $S0, $S1
concat $S0, ' near '
concat $S0, $S3
set $S4, $S0
.annotate 'line', 93
# var ex: $P1
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = $S4
$P1['severity'] = 2
$P1['type'] = 557
.annotate 'line', 94
throw $P1
# }
.annotate 'line', 95

.end # SyntaxError


.sub 'Expected'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 97
# Body
# {
concat $S1, "Expected '", __ARG_1
concat $S1, "'"
.annotate 'line', 99
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 100

.end # Expected


.sub 'RequireOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 102
# Body
# {
.annotate 'line', 104
$P1 = __ARG_2.'isop'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 105
'Expected'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 106

.end # RequireOp


.sub 'RequireKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 108
# Body
# {
.annotate 'line', 110
$P1 = __ARG_2.'iskeyword'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 111
'Expected'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 112

.end # RequireKeyword


.sub 'ExpectOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 114
# Body
# {
.annotate 'line', 116
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 117
'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 118

.end # ExpectOp


.sub 'ExpectKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 120
# Body
# {
.annotate 'line', 122
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 123
'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 124

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

.annotate 'line', 146
# Body
# {
.annotate 'line', 148
getattribute $P1, self, 'type'
set $I2, $P1
isne $I1, $I2, -1
.return($I1)
# }
.annotate 'line', 149

.end # get_bool


.sub 'iseof' :method

.annotate 'line', 150
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, -1
.return($I1)
# }

.end # iseof


.sub 'iscomment' :method

.annotate 'line', 151
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 0
.return($I1)
# }

.end # iscomment


.sub 'isint' :method

.annotate 'line', 152
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 5
.return($I1)
# }

.end # isint


.sub 'isfloat' :method

.annotate 'line', 153
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 6
.return($I1)
# }

.end # isfloat


.sub 'isstring' :method

.annotate 'line', 154
# Body
# {
.annotate 'line', 156
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
.annotate 'line', 157

.end # isstring


.sub 'isidentifier' :method

.annotate 'line', 158
# Body
# {
getattribute $P1, self, 'type'
set $I2, $P1
iseq $I1, $I2, 4
.return($I1)
# }

.end # isidentifier


.sub 'getidentifier' :method

.annotate 'line', 159
# Body
# {
.annotate 'line', 161
getattribute $P1, self, 'type'
set $I1, $P1
ne $I1, 4, __label_0
.annotate 'line', 162
getattribute $P2, self, 'str'
.return($P2)
goto __label_1
__label_0: # else
.annotate 'line', 164
'Expected'('Identifier', self)
__label_1: # endif
# }
.annotate 'line', 165

.end # getidentifier


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 166
# Body
# {
.annotate 'line', 168
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
.annotate 'line', 169

.end # iskeyword


.sub 'checkkeyword' :method

.annotate 'line', 170
# Body
# {
.annotate 'line', 172
getattribute $P1, self, 'type'
set $I1, $P1
ne $I1, 4, __label_1
getattribute $P2, self, 'str'
# predefined string
$S1 = $P2
goto __label_0
__label_1:
set $S1, ''
__label_0:
.return($S1)
# }
.annotate 'line', 173

.end # checkkeyword


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 174
# Body
# {
.annotate 'line', 176
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
.annotate 'line', 177

.end # isop


.sub 'checkop' :method

.annotate 'line', 178
# Body
# {
.annotate 'line', 180
getattribute $P1, self, 'type'
set $I1, $P1
ne $I1, 1, __label_1
getattribute $P2, self, 'str'
# predefined string
$S1 = $P2
goto __label_0
__label_1:
set $S1, ''
__label_0:
.return($S1)
# }
.annotate 'line', 181

.end # checkop


.sub 'rawstring' :method

.annotate 'line', 183
# Body
# {
.annotate 'line', 185
$P1 = self.'isstring'()
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 186
'InternalError'('Not a literal string', self)
__label_0: # endif
.annotate 'line', 187
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 188

.end # rawstring


.sub 'get_string' :method :vtable

.annotate 'line', 189
# Body
# {
.annotate 'line', 191
# string str: $S1
getattribute $P1, self, 'str'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 192
getattribute $P1, self, 'type'
set $I1, $P1
set $I2, 2
if $I1 == $I2 goto __label_3
set $I2, 3
if $I1 == $I2 goto __label_4
goto __label_2
# switch
__label_3: # case
concat $S0, '"', $S1
concat $S0, '"'
set $S1, $S0
goto __label_1 # break
__label_4: # case
concat $S0, "'", $S1
concat $S0, "'"
set $S1, $S0
goto __label_1 # break
__label_2: # default
__label_1: # switch end
.annotate 'line', 200
.return($S1)
# }
.annotate 'line', 201

.end # get_string


.sub 'show' :method

.annotate 'line', 203
# Body
# {
.annotate 'line', 205
# string str: $S1
getattribute $P1, self, 'str'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 206
# string r: $S2
null $S2
.annotate 'line', 207
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
concat $S0, '"', $S1
concat $S0, '"'
set $S2, $S0
goto __label_1 # break
__label_9: # case
concat $S0, "'", $S1
concat $S0, "'"
set $S2, $S0
goto __label_1 # break
__label_2: # default
set $S2, '(unknown)'
__label_1: # switch end
concat $S2, ' at '
.annotate 'line', 223
getattribute $P2, self, 'file'
$S3 = $P2
concat $S2, $S3
concat $S2, ' line '
.annotate 'line', 225
getattribute $P2, self, 'line'
$S3 = $P2
concat $S2, $S3
.annotate 'line', 226
.return($S2)
# }
.annotate 'line', 227

.end # show

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Token' ]
.annotate 'line', 142
addattribute $P0, 'type'
.annotate 'line', 143
addattribute $P0, 'str'
.annotate 'line', 144
addattribute $P0, 'file'
.annotate 'line', 145
addattribute $P0, 'line'
.end
.namespace [ ]

.sub 'newToken'
.param int __ARG_1
.param string __ARG_2
.param string __ARG_3
.param int __ARG_4

.annotate 'line', 230
# Body
# {
.annotate 'line', 232
# var t: $P1
new $P1, [ 'Token' ]
box $P2, __ARG_1
.annotate 'line', 233
setattribute $P1, 'type', $P2
box $P2, __ARG_2
setattribute $P1, 'str', $P2
box $P3, __ARG_3
setattribute $P1, 'file', $P3
box $P3, __ARG_4
setattribute $P1, 'line', $P3
.annotate 'line', 234
.return($P1)
# }
.annotate 'line', 235

.end # newToken


.sub 'newTokenFrom'
.param int __ARG_1
.param string __ARG_2
.param pmc __ARG_3

.annotate 'line', 237
# Body
# {
.annotate 'line', 239
# var t: $P1
new $P1, [ 'Token' ]
box $P2, __ARG_1
.annotate 'line', 240
setattribute $P1, 'type', $P2
box $P2, __ARG_2
setattribute $P1, 'str', $P2
getattribute $P4, __ARG_3, 'file'
setattribute $P1, 'file', $P4
getattribute $P4, __ARG_3, 'line'
setattribute $P1, 'line', $P4
.annotate 'line', 241
.return($P1)
# }
.annotate 'line', 242

.end # newTokenFrom


.sub 'getquoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 248
# Body
# {
.annotate 'line', 250
# string s: $S1
set $S1, ''
.annotate 'line', 251
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 252
eq $S2, '"', __label_1
# {
.annotate 'line', 253
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 254
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 256
ne $S2, '\', __label_5
# {
.annotate 'line', 257
# string c2: $S3
$P1 = __ARG_1.'getchar'()
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 258
iseq $I1, $S3, ''
if $I1 goto __label_9
iseq $I1, $S3, "\n"
__label_9:
unless $I1 goto __label_8
.annotate 'line', 259
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_8: # endif
concat $S1, $S2
concat $S1, $S3
.annotate 'line', 261
# }
goto __label_6
__label_5: # else
concat $S1, $S2
__label_6: # endif
.annotate 'line', 265
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 267
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(2, $S1, $P2, __ARG_3)
# }
.annotate 'line', 268

.end # getquoted


.sub 'getsinglequoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 270
# Body
# {
.annotate 'line', 272
# string s: $S1
set $S1, ''
.annotate 'line', 273
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 274
eq $S2, "'", __label_1
# {
.annotate 'line', 275
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 276
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
concat $S1, $S2
.annotate 'line', 278
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 280
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(3, $S1, $P2, __ARG_3)
# }
.annotate 'line', 281

.end # getsinglequoted


.sub 'getheredoc'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 283
# Body
# {
.annotate 'line', 285
# string mark: $S1
set $S1, ''
.annotate 'line', 286
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 287
isne $I1, $S2, "\n"
unless $I1 goto __label_3
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_1
# {
set $S5, $S2
set $S6, '"'
.annotate 'line', 290
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
concat $S0, $S1, $S2
set $S1, $S0
.annotate 'line', 299
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 301
ne $S2, '', __label_8
.annotate 'line', 302
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_8: # endif
concat $S0, $S1, ':>>'
set $S1, $S0
.annotate 'line', 305
# string content: $S3
set $S3, ''
.annotate 'line', 306
# string line: $S4
null $S4
__label_9: # do
.annotate 'line', 307
# {
set $S4, ''
.annotate 'line', 309
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_13: # while
.annotate 'line', 310
isne $I1, $S2, "\n"
unless $I1 goto __label_14
isne $I1, $S2, ''
__label_14:
unless $I1 goto __label_12
# {
set $S5, $S2
set $S6, '"'
.annotate 'line', 311
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
concat $S0, $S4, $S2
set $S4, $S0
.annotate 'line', 320
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_13
__label_12: # endwhile
.annotate 'line', 322
ne $S2, '', __label_19
.annotate 'line', 323
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_19: # endif
.annotate 'line', 324
eq $S4, $S1, __label_20
# {
concat $S3, $S4
concat $S3, '\n'
.annotate 'line', 326
# }
__label_20: # endif
# }
.annotate 'line', 328
ne $S4, $S1, __label_9
__label_10: # enddo
.annotate 'line', 329
getattribute $P3, __ARG_1, 'filename'
.tailcall 'newToken'(2, $S3, $P3, __ARG_3)
# }
.annotate 'line', 330

.end # getheredoc


.sub 'getident'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 332
# Body
# {
.annotate 'line', 334
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 335
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 336
$P1 = 'isident'($S2)
if_null $P1, __label_1
unless $P1 goto __label_1
# {
concat $S1, $S2
.annotate 'line', 338
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 340
__ARG_1.'ungetchar'($S2)
.annotate 'line', 341
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(4, $S1, $P2, __ARG_3)
# }
.annotate 'line', 342

.end # getident


.sub 'getnumber'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 344
# Body
# {
.annotate 'line', 346
# string s: $S1
null $S1
.annotate 'line', 347
# string c: $S2
set $S2, __ARG_2
__label_0: # do
.annotate 'line', 348
# {
concat $S1, $S2
.annotate 'line', 350
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
.annotate 'line', 351
$P1 = 'isdigit'($S2)
if_null $P1, __label_1
if $P1 goto __label_0
__label_1: # enddo
.annotate 'line', 352
iseq $I3, $S1, '0'
unless $I3 goto __label_4
iseq $I3, $S2, 'x'
if $I3 goto __label_5
iseq $I3, $S2, 'X'
__label_5:
__label_4:
unless $I3 goto __label_3
# {
.annotate 'line', 353
# int hexval: $I1
null $I1
.annotate 'line', 354
# int h: $I2
null $I2
.annotate 'line', 355
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_7: # while
.annotate 'line', 356
$P2 = 'hexdigit'($S2)
set $I2, $P2
lt $I2, 0, __label_6
# {
set $I4, $I1
.annotate 'line', 357
mul $I3, $I4, 16
add $I1, $I3, $I2
concat $S1, $S2
.annotate 'line', 359
$P3 = __ARG_1.'getchar'()
set $S2, $P3
# }
goto __label_7
__label_6: # endwhile
.annotate 'line', 361
__ARG_1.'ungetchar'($S2)
set $S1, $I1
.annotate 'line', 363
getattribute $P3, __ARG_1, 'filename'
.tailcall 'newToken'(5, $S1, $P3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 365
ne $S2, '.', __label_8
# {
__label_10: # do
.annotate 'line', 366
# {
concat $S1, $S2
.annotate 'line', 368
$P4 = __ARG_1.'getchar'()
set $S2, $P4
# }
.annotate 'line', 369
$P4 = 'isdigit'($S2)
if_null $P4, __label_11
if $P4 goto __label_10
__label_11: # enddo
.annotate 'line', 370
iseq $I4, $S2, 'e'
if $I4 goto __label_14
iseq $I4, $S2, 'E'
__label_14:
unless $I4 goto __label_13
# {
concat $S1, 'E'
.annotate 'line', 372
$P5 = __ARG_1.'getchar'()
set $S2, $P5
iseq $I5, $S2, '+'
if $I5 goto __label_16
iseq $I5, $S2, '-'
__label_16:
unless $I5 goto __label_15
# {
concat $S1, $S2
.annotate 'line', 374
$P5 = __ARG_1.'getchar'()
set $S2, $P5
# }
__label_15: # endif
__label_18: # while
.annotate 'line', 376
$P6 = 'isdigit'($S2)
if_null $P6, __label_17
unless $P6 goto __label_17
# {
concat $S1, $S2
.annotate 'line', 378
$P6 = __ARG_1.'getchar'()
set $S2, $P6
# }
goto __label_18
__label_17: # endwhile
# }
__label_13: # endif
.annotate 'line', 381
__ARG_1.'ungetchar'($S2)
.annotate 'line', 382
getattribute $P7, __ARG_1, 'filename'
.tailcall 'newToken'(6, $S1, $P7, __ARG_3)
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 385
iseq $I5, $S2, 'e'
if $I5 goto __label_21
iseq $I5, $S2, 'E'
__label_21:
unless $I5 goto __label_19
# {
concat $S1, 'E'
.annotate 'line', 387
$P7 = __ARG_1.'getchar'()
set $S2, $P7
iseq $I6, $S2, '+'
if $I6 goto __label_23
iseq $I6, $S2, '-'
__label_23:
unless $I6 goto __label_22
# {
concat $S1, $S2
.annotate 'line', 389
$P8 = __ARG_1.'getchar'()
set $S2, $P8
# }
__label_22: # endif
__label_25: # while
.annotate 'line', 391
$P8 = 'isdigit'($S2)
if_null $P8, __label_24
unless $P8 goto __label_24
# {
concat $S1, $S2
.annotate 'line', 393
$P9 = __ARG_1.'getchar'()
set $S2, $P9
# }
goto __label_25
__label_24: # endwhile
.annotate 'line', 395
__ARG_1.'ungetchar'($S2)
.annotate 'line', 396
getattribute $P9, __ARG_1, 'filename'
.tailcall 'newToken'(6, $S1, $P9, __ARG_3)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 399
__ARG_1.'ungetchar'($S2)
.annotate 'line', 400
getattribute $P10, __ARG_1, 'filename'
.tailcall 'newToken'(5, $S1, $P10, __ARG_3)
# }
__label_20: # endif
# }
__label_9: # endif
# }
.annotate 'line', 403

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 405
# Body
# {
.annotate 'line', 407
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 408
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 409
isne $I1, $S2, ''
unless $I1 goto __label_3
isne $I1, $S2, "\n"
__label_3:
unless $I1 goto __label_1
# {
concat $S1, $S2
.annotate 'line', 411
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 413
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(0, $S1, $P2, __ARG_3)
# }
.annotate 'line', 414

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 416
# Body
# {
.annotate 'line', 418
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 419
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_1: # do
.annotate 'line', 420
# {
__label_5: # while
.annotate 'line', 421
isne $I1, $S2, ''
unless $I1 goto __label_6
isne $I1, $S2, '*'
__label_6:
unless $I1 goto __label_4
# {
concat $S1, $S2
.annotate 'line', 422
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_5
__label_4: # endwhile
.annotate 'line', 423
ne $S2, '', __label_7
.annotate 'line', 424
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_7: # endif
concat $S1, $S2
.annotate 'line', 426
$P2 = __ARG_1.'getchar'()
set $S2, $P2
.annotate 'line', 427
ne $S2, '', __label_8
.annotate 'line', 428
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_8: # endif
# }
.annotate 'line', 429
ne $S2, '/', __label_1
__label_2: # enddo
concat $S1, '/'
.annotate 'line', 431
getattribute $P2, __ARG_1, 'filename'
.tailcall 'newToken'(0, $S1, $P2, __ARG_3)
# }
.annotate 'line', 432

.end # getcomment


.sub 'getop'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 434
# Body
# {
.annotate 'line', 436
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 437
getattribute $P1, __ARG_1, 'filename'
.tailcall 'newToken'(1, $S1, $P1, __ARG_3)
# }
.annotate 'line', 438

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 452
# Body
# {
.annotate 'line', 454
.const 'Sub' $P2 = 'getop'
.annotate 'line', 456
setattribute self, 'h', __ARG_1
box $P3, ''
.annotate 'line', 457
setattribute self, 'pending', $P3
.annotate 'line', 458
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'stacked', $P5
box $P4, __ARG_2
.annotate 'line', 459
setattribute self, 'filename', $P4
box $P5, 1
.annotate 'line', 460
setattribute self, 'line', $P5
.annotate 'line', 461
# var select: $P1
root_new $P1, ['parrot';'Hash']
.annotate 'line', 462
root_new $P6, ['parrot';'Hash']
get_hll_global $P7, 'getident'
$P6[''] = $P7
$P6['{'] = $P2
$P1['$'] = $P6
get_hll_global $P8, 'getquoted'
$P1['"'] = $P8
get_hll_global $P9, 'getsinglequoted'
$P1["'"] = $P9
.annotate 'line', 465
root_new $P10, ['parrot';'Hash']
.annotate 'line', 466
root_new $P11, ['parrot';'Hash']
$P11[''] = $P2
$P11['='] = $P2
$P10['='] = $P11
$P10[':'] = $P2
$P1['='] = $P10
.annotate 'line', 469
root_new $P12, ['parrot';'Hash']
$P12['+'] = $P2
$P12['='] = $P2
$P1['+'] = $P12
.annotate 'line', 470
root_new $P13, ['parrot';'Hash']
$P13['-'] = $P2
$P13['='] = $P2
$P1['-'] = $P13
.annotate 'line', 471
root_new $P14, ['parrot';'Hash']
$P14['='] = $P2
$P1['*'] = $P14
.annotate 'line', 472
root_new $P15, ['parrot';'Hash']
$P15['|'] = $P2
$P1['|'] = $P15
.annotate 'line', 473
root_new $P16, ['parrot';'Hash']
$P16['&'] = $P2
$P1['&'] = $P16
.annotate 'line', 474
root_new $P17, ['parrot';'Hash']
.annotate 'line', 475
root_new $P18, ['parrot';'Hash']
$P18[''] = $P2
get_hll_global $P19, 'getheredoc'
$P18[':'] = $P19
$P17['<'] = $P18
$P17['='] = $P2
$P1['<'] = $P17
.annotate 'line', 478
root_new $P20, ['parrot';'Hash']
$P20['>'] = $P2
$P20['='] = $P2
$P1['>'] = $P20
.annotate 'line', 479
root_new $P21, ['parrot';'Hash']
.annotate 'line', 480
root_new $P22, ['parrot';'Hash']
$P22[''] = $P2
$P22['='] = $P2
$P21['='] = $P22
$P1['!'] = $P21
.annotate 'line', 482
root_new $P23, ['parrot';'Hash']
$P23['%'] = $P2
$P1['%'] = $P23
.annotate 'line', 483
root_new $P24, ['parrot';'Hash']
$P24['='] = $P2
get_hll_global $P25, 'getlinecomment'
$P24['/'] = $P25
get_hll_global $P26, 'getcomment'
$P24['*'] = $P26
$P1['/'] = $P24
get_hll_global $P27, 'getlinecomment'
$P1['#'] = $P27
.annotate 'line', 486
setattribute self, 'select', $P1
# }
.annotate 'line', 487

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 488
# Body
# {
.annotate 'line', 490
# string pending: $S1
getattribute $P2, self, 'pending'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 491
eq $S1, '', __label_1
# {
box $P2, ''
.annotate 'line', 492
setattribute self, 'pending', $P2
.annotate 'line', 493
.return($S1)
# }
__label_1: # endif
.annotate 'line', 495
# var h: $P1
getattribute $P1, self, 'h'
.annotate 'line', 496
# string c: $S2
$P3 = $P1.'read'(1)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 497
ne $S2, "\n", __label_3
# {
.annotate 'line', 498
# int l: $I1
getattribute $P3, self, 'line'
set $I1, $P3
.annotate 'line', 499
inc $I1
box $P4, $I1
.annotate 'line', 500
setattribute self, 'line', $P4
# }
__label_3: # endif
.annotate 'line', 502
.return($S2)
# }
.annotate 'line', 503

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 504
# Body
# {
box $P1, __ARG_1
.annotate 'line', 506
setattribute self, 'pending', $P1
# }
.annotate 'line', 507

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 508
# Body
# {
.annotate 'line', 510
.const 'Sub' $P5 = 'isspace'
.annotate 'line', 511
.const 'Sub' $P6 = 'isidentstart'
.annotate 'line', 512
.const 'Sub' $P7 = 'isdigit'
.annotate 'line', 513
.const 'Sub' $P8 = 'getop'
.annotate 'line', 514
.const 'Sub' $P9 = 'getident'
.annotate 'line', 515
.const 'Sub' $P10 = 'getnumber'
.annotate 'line', 517
getattribute $P11, self, 'stacked'
if_null $P11, __label_0
unless $P11 goto __label_0
# {
.annotate 'line', 518
# var t: $P1
getattribute $P12, self, 'stacked'
$P1 = $P12.'pop'()
.annotate 'line', 519
.return($P1)
# }
__label_0: # endif
.annotate 'line', 521
# string c: $S1
$P11 = self.'getchar'()
null $S1
if_null $P11, __label_1
set $S1, $P11
__label_1:
__label_3: # while
.annotate 'line', 522
$P12 = $P5($S1)
if_null $P12, __label_2
unless $P12 goto __label_2
.annotate 'line', 523
$P13 = self.'getchar'()
set $S1, $P13
goto __label_3
__label_2: # endwhile
.annotate 'line', 524
# int line: $I1
getattribute $P13, self, 'line'
set $I1, $P13
.annotate 'line', 525
ne $S1, '', __label_4
# {
.annotate 'line', 526
# var t: $P2
new $P2, [ 'Token' ]
box $P14, -1
.annotate 'line', 527
setattribute $P2, 'type', $P14
.annotate 'line', 528
.return($P2)
# }
__label_4: # endif
.annotate 'line', 530
$P14 = $P6($S1)
if_null $P14, __label_5
unless $P14 goto __label_5
.annotate 'line', 531
.tailcall $P9(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 532
$P15 = $P7($S1)
if_null $P15, __label_6
unless $P15 goto __label_6
.annotate 'line', 533
.tailcall $P10(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 535
# string op: $S2
set $S2, $S1
.annotate 'line', 536
# var select: $P3
getattribute $P3, self, 'select'
.annotate 'line', 537
# var current: $P4
$P4 = $P3[$S1]
__label_8: # while
.annotate 'line', 539
isnull $I2, $P4
not $I2
unless $I2 goto __label_9
isa $I2, $P4, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 540
$P15 = self.'getchar'()
set $S1, $P15
set $P3, $P4
.annotate 'line', 542
$P4 = $P3[$S1]
.annotate 'line', 543
unless_null $P4, __label_10
# {
.annotate 'line', 544
self.'ungetchar'($S1)
.annotate 'line', 545
$P4 = $P3['']
# }
goto __label_11
__label_10: # else
concat $S2, $S1
__label_11: # endif
.annotate 'line', 548
# }
goto __label_8
__label_7: # endwhile
if_null $P4, __label_12
.annotate 'line', 550
unless $P4 goto __label_12
.annotate 'line', 551
.tailcall $P4(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 552
.tailcall $P8(self, $S2, $I1)
# }
.annotate 'line', 553

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 554
# Body
# {
.annotate 'line', 556
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 557
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 558
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 559
.return($P1)
# }
.annotate 'line', 560

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 561
# Body
# {
getattribute $P1, self, 'stacked'
$P1.'push'(__ARG_1)
# }

.end # unget

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 446
addattribute $P0, 'h'
.annotate 'line', 447
addattribute $P0, 'pending'
.annotate 'line', 448
addattribute $P0, 'select'
.annotate 'line', 449
addattribute $P0, 'stacked'
.annotate 'line', 450
addattribute $P0, 'filename'
.annotate 'line', 451
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

.annotate 'line', 578
# Body
# {
set $S1, __ARG_1
set $S2, 'int'
.annotate 'line', 580
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
.annotate 'line', 581
.return('I')
__label_3: # case
.annotate 'line', 582
.return('N')
__label_4: # case
.annotate 'line', 583
.return('S')
__label_5: # case
.annotate 'line', 584
.return('P')
__label_1: # default
.annotate 'line', 585
.return('')
__label_0: # switch end
# }
.annotate 'line', 587

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 589
# Body
# {
set $S1, __ARG_1
set $S2, 'I'
.annotate 'line', 591
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
.annotate 'line', 592
.return('int')
__label_3: # case
.annotate 'line', 593
.return('num')
__label_4: # case
.annotate 'line', 594
.return('string')
__label_5: # case
.annotate 'line', 595
.return('pmc')
__label_1: # default
.annotate 'line', 596
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 598

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 612
# Body
# {
.annotate 'line', 614
setattribute self, 'handle', __ARG_1
box $P1, ''
.annotate 'line', 615
setattribute self, 'file', $P1
box $P2, 0
.annotate 'line', 616
setattribute self, 'line', $P2
box $P2, 0
.annotate 'line', 617
setattribute self, 'pendingf', $P2
box $P3, 0
.annotate 'line', 618
setattribute self, 'pendingl', $P3
# }
.annotate 'line', 619

.end # initialize


.sub 'close' :method

.annotate 'line', 620
# Body
# {
null $P1
.annotate 'line', 622
setattribute self, 'handle', $P1
# }
.annotate 'line', 623

.end # close


.sub 'updateannot' :method

.annotate 'line', 624
# Body
# {
.annotate 'line', 626
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 627
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 628
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 629
getattribute $P3, self, 'handle'
$P3.'print'("'")
.annotate 'line', 630
getattribute $P3, self, 'handle'
$P3.'print'("\n")
box $P4, 0
.annotate 'line', 631
setattribute self, 'pendingf', $P4
# }
__label_0: # endif
.annotate 'line', 633
getattribute $P4, self, 'pendingl'
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 634
getattribute $P5, self, 'handle'
$P5.'print'(".annotate 'line', ")
.annotate 'line', 635
getattribute $P5, self, 'handle'
getattribute $P6, self, 'line'
$P5.'print'($P6)
.annotate 'line', 636
getattribute $P6, self, 'handle'
$P6.'print'("\n")
box $P7, 0
.annotate 'line', 637
setattribute self, 'pendingl', $P7
# }
__label_1: # endif
# }
.annotate 'line', 639

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 640
# Body
# {
.annotate 'line', 642
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 643
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 644

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 645
# Body
# {
.annotate 'line', 647
self.'updateannot'()
.annotate 'line', 648
self.'vprint'(__ARG_1)
# }
.annotate 'line', 649

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 650
# Body
# {
.annotate 'line', 652
self.'updateannot'()
.annotate 'line', 653
self.'vprint'(__ARG_1)
.annotate 'line', 654
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 655

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 656
# Body
# {
.annotate 'line', 658
getattribute $P1, self, 'file'
getattribute $P2, __ARG_1, 'file'
eq $P1, $P2, __label_0
# {
.annotate 'line', 659
getattribute $P4, __ARG_1, 'file'
setattribute self, 'file', $P4
box $P1, 1
.annotate 'line', 660
setattribute self, 'pendingf', $P1
box $P2, 0
.annotate 'line', 661
setattribute self, 'line', $P2
# }
__label_0: # endif
.annotate 'line', 663
getattribute $P3, self, 'line'
getattribute $P4, __ARG_1, 'line'
eq $P3, $P4, __label_1
# {
.annotate 'line', 664
getattribute $P6, __ARG_1, 'line'
setattribute self, 'line', $P6
box $P5, 1
.annotate 'line', 665
setattribute self, 'pendingl', $P5
# }
__label_1: # endif
# }
.annotate 'line', 667

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 668
# Body
# {
.annotate 'line', 670
self.'updateannot'()
.annotate 'line', 671
getattribute $P1, self, 'handle'
concat $S1, '# ', __ARG_1
concat $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 672

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 673
# Body
# {
.annotate 'line', 675
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 676
$P1.'print'(__ARG_1)
.annotate 'line', 677
$P1.'print'(':')
.annotate 'line', 678
if_null __ARG_2, __label_0
# {
.annotate 'line', 679
$P1.'print'(' # ')
.annotate 'line', 680
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 682
$P1.'print'("\n")
# }
.annotate 'line', 683

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 684
# Body
# {
.annotate 'line', 686
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 687
$P1.'print'('goto ')
.annotate 'line', 688
$P1.'print'(__ARG_1)
.annotate 'line', 689
if_null __ARG_2, __label_0
# {
.annotate 'line', 690
$P1.'print'(' # ')
.annotate 'line', 691
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 693
$P1.'print'("\n")
# }
.annotate 'line', 694

.end # emitgoto


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 695
# Body
# {
.annotate 'line', 697
# string ins: $S1
concat $S0, 'if_null ', __ARG_1
concat $S0, ', '
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 698
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 699

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 700
# Body
# {
.annotate 'line', 702
# string ins: $S1
concat $S0, "null ", __ARG_1
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 703
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 704

.end # emitnull


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 705
# Body
# {
.annotate 'line', 707
# string ins: $S1
concat $S0, "set ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 708
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 709

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 710
# Body
# {
.annotate 'line', 712
# string ins: $S1
concat $S0, "assign ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 713
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 714

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 715
# Body
# {
.annotate 'line', 717
# string ins: $S1
concat $S0, "box ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 718
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 719

.end # emitbox


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 720
# Body
# {
.annotate 'line', 722
# string ins: $S1
concat $S0, "add ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 723
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 724

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 725
# Body
# {
.annotate 'line', 727
# string ins: $S1
concat $S0, "add ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 728
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 729

.end # emitadd


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 730
# Body
# {
.annotate 'line', 732
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 733
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 734

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 735
# Body
# {
.annotate 'line', 737
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 738
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 739

.end # emitconcat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 606
addattribute $P0, 'handle'
.annotate 'line', 607
addattribute $P0, 'file'
.annotate 'line', 608
addattribute $P0, 'line'
.annotate 'line', 609
addattribute $P0, 'pendingf'
.annotate 'line', 610
addattribute $P0, 'pendingl'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 746
# Body
# {
.annotate 'line', 748
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 749

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 751
# Body
# {
.annotate 'line', 753
# var t: $P1
$P1 = 'newTokenFrom'(6, __ARG_3, __ARG_2)
.annotate 'line', 754
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 755

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 757
# Body
# {
.annotate 'line', 763
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 764
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 765
.return($I1)
# }
.annotate 'line', 766

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 786
# Body
# {
.annotate 'line', 788
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 789
.return($S1)
# }
.annotate 'line', 790

.end # name


.sub 'result' :method

.annotate 'line', 791
# Body
# {
.annotate 'line', 793
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 794

.end # result


.sub 'params' :method

.annotate 'line', 795
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 796
# Body
# {
.annotate 'line', 798
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 799
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 800
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 801
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 802
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 804
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 806
.return($S1)
# }
.annotate 'line', 807

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 808
# Body
# {
box $P1, __ARG_1
.annotate 'line', 814
setattribute self, 'name', $P1
.annotate 'line', 815
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 816
setattribute self, 'typeresult', $P2
.annotate 'line', 817
# int n: $I1
null $I1
.annotate 'line', 818
if_null __ARG_4, __label_0
# {
box $P2, __ARG_4
.annotate 'line', 819
setattribute self, 'type0', $P2
.annotate 'line', 820
ne __ARG_4, '*', __label_1
set $I1, -1
goto __label_2
__label_1: # else
.annotate 'line', 821
# {
set $I1, 1
.annotate 'line', 824
if_null __ARG_5, __label_3
# {
box $P3, __ARG_5
.annotate 'line', 825
setattribute self, 'type1', $P3
.annotate 'line', 826
inc $I1
# }
__label_3: # endif
.annotate 'line', 828
if_null __ARG_6, __label_4
# {
box $P3, __ARG_6
.annotate 'line', 829
setattribute self, 'type2', $P3
.annotate 'line', 830
inc $I1
# }
__label_4: # endif
# }
__label_2: # endif
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 834
setattribute self, 'nparams', $P4
.annotate 'line', 835
.return(self)
# }
.annotate 'line', 836

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 837
# Body
# {
.annotate 'line', 845
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 846
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 847
.return(self)
# }
.annotate 'line', 848

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 849
# Body
# {
.annotate 'line', 851
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 852
# string typeresult: $S2
getattribute $P2, self, 'typeresult'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 853
__ARG_1.'comment'($S6)
.annotate 'line', 855
getattribute $P3, self, 'body'
isa $I4, $P3, 'String'
unless $I4 goto __label_2
# {
.annotate 'line', 856
# string body: $S3
getattribute $P4, self, 'body'
null $S3
if_null $P4, __label_4
set $S3, $P4
__label_4:
.annotate 'line', 857
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 858
ne $S2, 'v', __label_5
# {
.annotate 'line', 859
isnull $I4, __ARG_4
not $I4
unless $I4 goto __label_8
isne $I4, __ARG_4, ''
__label_8:
unless $I4 goto __label_7
.annotate 'line', 860
'SyntaxError'('using return value from void predef')
__label_7: # endif
.annotate 'line', 861
eq $I1, -1, __label_9
.annotate 'line', 862
'InternalError'('void predef with {res}')
__label_9: # endif
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 865
ne $I1, -1, __label_10
.annotate 'line', 866
'InternalError'('non void predef without {res}')
__label_10: # endif
.annotate 'line', 867
isne $I5, $S2, 'v'
unless $I5 goto __label_12
isnull $I5, __ARG_4
if $I5 goto __label_13
iseq $I5, __ARG_4, ''
__label_13:
__label_12:
unless $I5 goto __label_11
.annotate 'line', 868
$P3 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P3
__label_11: # endif
__label_14: # do
.annotate 'line', 869
# {
.annotate 'line', 870
# predefined substr
substr $S6, $S3, 0, $I1
add $I5, $I1, 5
# predefined substr
substr $S7, $S3, $I5
concat $S0, $S6, __ARG_4
concat $S0, $S7
set $S3, $S0
# }
.annotate 'line', 871
# predefined indexof
index $I1, $S3, '{res}'
ne $I1, -1, __label_14
__label_15: # enddo
# }
__label_6: # endif
.annotate 'line', 874
# int n: $I2
set $P4, __ARG_5
set $I2, $P4
# for loop
.annotate 'line', 875
# int i: $I3
null $I3
__label_19: # for condition
ge $I3, $I2, __label_18
# {
.annotate 'line', 876
# string argmark: $S4
$S8 = $I3
concat $S7, '{arg', $S8
concat $S0, $S7, '}'
set $S4, $S0
.annotate 'line', 877
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_21: # while
.annotate 'line', 878
# predefined indexof
index $I1, $S3, $S4
eq $I1, -1, __label_20
.annotate 'line', 879
# predefined substr
substr $S8, $S3, 0, $I1
add $I6, $I1, 6
# predefined substr
substr $S9, $S3, $I6
concat $S0, $S8, $S5
concat $S0, $S9
set $S3, $S0
goto __label_21
__label_20: # endwhile
# }
__label_17: # for iteration
.annotate 'line', 875
inc $I3
goto __label_19
__label_18: # for end
.annotate 'line', 881
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 882
__ARG_1.'say'($S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 885
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 886
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_3: # endif
# }
.annotate 'line', 888

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 777
addattribute $P0, 'name'
.annotate 'line', 778
addattribute $P0, 'body'
.annotate 'line', 779
addattribute $P0, 'evalfun'
.annotate 'line', 780
addattribute $P0, 'typeresult'
.annotate 'line', 781
addattribute $P0, 'type0'
.annotate 'line', 782
addattribute $P0, 'type1'
.annotate 'line', 783
addattribute $P0, 'type2'
.annotate 'line', 784
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 893
# Body
# {
.annotate 'line', 895
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 896
# int n: $I1
# predefined int
$I3 = __ARG_4
sub $I1, $I3, 1
.annotate 'line', 897
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 898
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
$P1 = __ARG_4[$I2]
.annotate 'line', 899
__ARG_1.'say'('print ', $P1)
__label_2: # for iteration
.annotate 'line', 898
inc $I2
goto __label_4
__label_3: # for end
$P1 = __ARG_4[$I1]
.annotate 'line', 900
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 903
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 904

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

.annotate 'line', 909
# Body
# {
.annotate 'line', 911
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 912
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 913
# int n: $I1
# predefined int
$I1 = __ARG_4
# for loop
.annotate 'line', 914
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 915
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 914
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 916
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 917

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

.annotate 'line', 922
# Body
# {
.annotate 'line', 924
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 925
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 926
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 927
__ARG_1.'say'('print ', $P1)
__label_0: # for iteration
.annotate 'line', 926
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 928

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 931
# Body
# {
.annotate 'line', 933
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 934
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 935
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 936

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 938
# Body
# {
.annotate 'line', 940
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 941
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 942
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 943

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 945
# Body
# {
.annotate 'line', 947
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 948
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 949
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 950

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 952
# Body
# {
.annotate 'line', 954
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 955
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 956
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 957
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 958
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 959

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 961
# Body
# {
.annotate 'line', 963
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 965
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 966
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 968
# var t: $P2
$P2 = 'newTokenFrom'(2, $S1, __ARG_2)
.annotate 'line', 969
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 970

.end # predefeval_chr


.sub 'getpredefs'

.annotate 'line', 972
# Body
# {
.annotate 'line', 974
# var predef_say: $P1
new $P1, [ 'Predef_say' ]
.annotate 'line', 975
# var predef_cry: $P2
new $P2, [ 'Predef_cry' ]
.annotate 'line', 976
# var predef_print: $P3
new $P3, [ 'Predef_print' ]
.annotate 'line', 978
get_hll_global $P5, 'predefeval_length'
.annotate 'line', 979
get_hll_global $P6, 'predefeval_bytelength'
.annotate 'line', 980
get_hll_global $P7, 'predefeval_chr'
.annotate 'line', 981
get_hll_global $P8, 'predefeval_ord'
.annotate 'line', 982
get_hll_global $P9, 'predefeval_ord_n'
.annotate 'line', 984
# var predefs: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
.annotate 'line', 985
new $P13, [ 'PredefFunction' ]
$P12 = $P13.'set'('int', '{res} = {arg0}', 'I', '?')
.annotate 'line', 984
$P10.'push'($P12)
.annotate 'line', 989
new $P15, [ 'PredefFunction' ]
$P14 = $P15.'set'('float', '{res} = {arg0}', 'N', '?')
.annotate 'line', 984
$P10.'push'($P14)
.annotate 'line', 993
new $P17, [ 'PredefFunction' ]
$P16 = $P17.'set'('string', '{res} = {arg0}', 'S', '?')
.annotate 'line', 984
$P10.'push'($P16)
.annotate 'line', 997
new $P19, [ 'PredefFunction' ]
$P18 = $P19.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 984
$P10.'push'($P18)
.annotate 'line', 1001
new $P21, [ 'PredefFunction' ]
$P20 = $P21.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 984
$P10.'push'($P20)
.annotate 'line', 1005
new $P23, [ 'PredefFunction' ]
$P22 = $P23.'set'('time', 'time {res}', 'I')
.annotate 'line', 984
$P10.'push'($P22)
.annotate 'line', 1009
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 984
$P10.'push'($P24)
.annotate 'line', 1013
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 984
$P10.'push'($P26)
.annotate 'line', 1017
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 984
$P10.'push'($P28)
.annotate 'line', 1022
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P30)
.annotate 'line', 1027
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 984
$P10.'push'($P32)
.annotate 'line', 1032
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 984
$P10.'push'($P34)
.annotate 'line', 1038
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 984
$P10.'push'($P36)
.annotate 'line', 1045
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 984
$P10.'push'($P38)
.annotate 'line', 1049
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set_eval'('length', $P5, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 984
$P10.'push'($P40)
.annotate 'line', 1054
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set_eval'('bytelength', $P6, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 984
$P10.'push'($P42)
.annotate 'line', 1059
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set_eval'('chr', $P7, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 984
$P10.'push'($P44)
.annotate 'line', 1066
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set_eval'('ord', $P8, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 984
$P10.'push'($P46)
.annotate 'line', 1071
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set_eval'('ord', $P9, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 984
$P10.'push'($P48)
.annotate 'line', 1076
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 984
$P10.'push'($P50)
.annotate 'line', 1080
new $P53, [ 'PredefFunction' ]
$P52 = $P53.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 984
$P10.'push'($P52)
.annotate 'line', 1084
new $P55, [ 'PredefFunction' ]
$P54 = $P55.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P54)
.annotate 'line', 1088
new $P57, [ 'PredefFunction' ]
$P56 = $P57.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 984
$P10.'push'($P56)
.annotate 'line', 1092
new $P59, [ 'PredefFunction' ]
$P58 = $P59.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 984
$P10.'push'($P58)
.annotate 'line', 1096
new $P61, [ 'PredefFunction' ]
$P60 = $P61.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P60)
.annotate 'line', 1100
new $P63, [ 'PredefFunction' ]
$P62 = $P63.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P62)
.annotate 'line', 1104
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P64)
.annotate 'line', 1108
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P66)
.annotate 'line', 1112
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 984
$P10.'push'($P68)
.annotate 'line', 1117
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P70)
.annotate 'line', 1122
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P72)
.annotate 'line', 1126
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P74)
.annotate 'line', 1130
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P76)
.annotate 'line', 1134
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P78)
.annotate 'line', 1138
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P80)
.annotate 'line', 1142
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P82)
.annotate 'line', 1146
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P84)
.annotate 'line', 1150
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P86)
.annotate 'line', 1154
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P88)
.annotate 'line', 1158
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P90)
.annotate 'line', 1162
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 984
$P10.'push'($P92)
.annotate 'line', 1166
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 984
$P10.'push'($P94)
.annotate 'line', 1170
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 984
$P10.'push'($P96)
.annotate 'line', 1174
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 984
$P10.'push'($P98)
.annotate 'line', 1178
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 984
$P10.'push'($P100)
.annotate 'line', 1182
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 984
$P10.'push'($P102)
.annotate 'line', 1186
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 984
$P10.'push'($P104)
.annotate 'line', 1190
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 984
$P10.'push'($P106)
.annotate 'line', 1194
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 984
$P10.'push'($P108)
.annotate 'line', 1198
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 984
$P10.'push'($P110)
.annotate 'line', 1203
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P112)
.annotate 'line', 1208
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 984
$P10.'push'($P114)
.annotate 'line', 1212
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 984
$P10.'push'($P116)
.annotate 'line', 1216
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 984
$P10.'push'($P118)
.annotate 'line', 1220
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 984
$P10.'push'($P120)
.annotate 'line', 1224
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 984
$P10.'push'($P122)
.annotate 'line', 1228
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('print', $P3, 'P', '*')
.annotate 'line', 984
$P10.'push'($P124)
.annotate 'line', 1232
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('say', $P1, 'P', '*')
.annotate 'line', 984
$P10.'push'($P126)
.annotate 'line', 1236
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('cry', $P2, 'P', '*')
.annotate 'line', 984
$P10.'push'($P128)
set $P4, $P10
__label_1: # Infinite loop
.annotate 'line', 1242
.yield($P4)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1243

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1245
# Body
# {
.annotate 'line', 1247
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1248
getattribute $P4, $P1, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1249
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1250
iseq $I2, $I1, -1
if $I2 goto __label_4
iseq $I2, $I1, __ARG_2
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1251
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1253
.return($P2)
# }
.annotate 'line', 1254

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1260
# Body
# {
.annotate 'line', 1262
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1263
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1264
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1263
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1265

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1276
# Body
# {
.annotate 'line', 1278
setattribute self, 'start', __ARG_1
.annotate 'line', 1279
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1280

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1281
# Body
# {
.annotate 'line', 1283
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1284

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1285
# Body
# {
.annotate 'line', 1287
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1288

.end # use_predef


.sub 'createsubid' :method

.annotate 'line', 1289
# Body
# {
.annotate 'line', 1291
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 1292

.end # createsubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1293
# Body
# {
.annotate 'line', 1295
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1296

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1297
# Body
# {
.annotate 'line', 1299
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1300

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1273
addattribute $P0, 'start'
.annotate 'line', 1274
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1313
# Body
# {
.annotate 'line', 1315
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1316

.end # init


.sub 'numargs' :method

.annotate 'line', 1318
# Body
# {
.annotate 'line', 1320
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1321

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1322
# Body
# {
.annotate 'line', 1324
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1325
.return($P2)
# }
.annotate 'line', 1326

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1328
# Body
# {
.annotate 'line', 1330
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1331
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1332
# {
.annotate 'line', 1333
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1334
$P1.'push'($P3)
# }
.annotate 'line', 1335
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1336
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1337

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1339
# Body
# {
.annotate 'line', 1341
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1342
if_null $P1, __label_0
.annotate 'line', 1343
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1344

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1345
# Body
# {
.annotate 'line', 1347
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1348
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1349
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1350
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1351
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1352
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1353
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1350
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1355
.return($P2)
# }
.annotate 'line', 1356

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1357
# Body
# {
.annotate 'line', 1359
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1360
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1361

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1311
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1373
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1374
# Body
# {
.annotate 'line', 1376
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1377
.return($I1)
# }
.annotate 'line', 1378

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1379
# Body
# {
.annotate 'line', 1381
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1382
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1383
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1385
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1386

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1387
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1389
setattribute self, 'name', $P1
.annotate 'line', 1390
if_null __ARG_2, __label_0
.annotate 'line', 1391
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1392

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1393
# Body
# {
.annotate 'line', 1395
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1396

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1370
addattribute $P0, 'name'
.annotate 'line', 1371
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1403
# Body
# {
.annotate 'line', 1405
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1406
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1407
# {
.annotate 'line', 1408
$P2 = __ARG_1.'get'()
.annotate 'line', 1409
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1410
$P2 = __ARG_1.'get'()
.annotate 'line', 1411
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1412
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1413
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1414
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1416
new $P7, [ 'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1417
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1418
'RequireOp'(']', $P2)
.annotate 'line', 1419
setattribute self, 'list', $P1
# }
.annotate 'line', 1420

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1421
# Body
# {
.annotate 'line', 1423
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1424
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1425

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1426
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1427
# Body
# {
.annotate 'line', 1429
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1430
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1431
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1432
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1433
$P3 = $P2.'getname'()
$S1 = $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1434
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1431
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1437
.return($P3)
# }
.annotate 'line', 1438

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1401
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1445
# Body
# {
.annotate 'line', 1447
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, "' ]"
.annotate 'line', 1448
.return($S2)
# }
.annotate 'line', 1449

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1451
# Body
# {
.annotate 'line', 1453
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1454
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1456
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, "' ]"
.annotate 'line', 1457
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1459

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1461
# Body
# {
.annotate 'line', 1463
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1464
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1465
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1466
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1467
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1469
__ARG_2.'unget'($P1)
.annotate 'line', 1470
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1472

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1474
# Body
# {
.annotate 'line', 1476
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1477
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1478
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1479
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1480
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1481
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1482
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1484
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1485
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1486
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
.annotate 'line', 1488
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1490
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1493
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1495
new $P9, [ 'StringStatement' ]
$P9.'StringStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_10: # case
.annotate 'line', 1497
new $P11, [ 'IntStatement' ]
$P11.'IntStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_11: # case
.annotate 'line', 1499
new $P13, [ 'FloatStatement' ]
$P13.'FloatStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_12: # case
.annotate 'line', 1501
new $P15, [ 'ReturnStatement' ]
$P15.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_13: # case
.annotate 'line', 1503
new $P17, [ 'YieldStatement' ]
$P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_14: # case
.annotate 'line', 1505
new $P19, [ 'GotoStatement' ]
$P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_15: # case
.annotate 'line', 1507
new $P21, [ 'IfStatement' ]
$P21.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_16: # case
.annotate 'line', 1509
new $P23, [ 'WhileStatement' ]
$P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_17: # case
.annotate 'line', 1511
new $P25, [ 'DoStatement' ]
$P25.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_18: # case
.annotate 'line', 1513
new $P27, [ 'ContinueStatement' ]
$P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_19: # case
.annotate 'line', 1515
new $P29, [ 'BreakStatement' ]
$P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_20: # case
.annotate 'line', 1517
new $P31, [ 'SwitchStatement' ]
$P31.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P30, $P31
.return($P30)
__label_21: # case
.annotate 'line', 1519
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1521
new $P33, [ 'ThrowStatement' ]
$P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P32, $P33
.return($P32)
__label_23: # case
.annotate 'line', 1523
new $P35, [ 'TryStatement' ]
$P35.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P34, $P35
.return($P34)
__label_5: # default
.annotate 'line', 1525
$P36 = $P1.'isidentifier'()
if_null $P36, __label_24
unless $P36 goto __label_24
# {
.annotate 'line', 1526
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1527
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1528
new $P10, [ 'LabelStatement' ]
.tailcall $P10.'set'($P1, __ARG_2)
__label_25: # endif
.annotate 'line', 1529
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1531
__ARG_1.'unget'($P1)
.annotate 'line', 1532
new $P12, [ 'ExprStatement' ]
$P12.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P11, $P12
.return($P11)
__label_4: # switch end
.annotate 'line', 1534
unless_null $P2, __label_26
.annotate 'line', 1535
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1536
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1537

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1545
# Body
# {
.annotate 'line', 1547
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1548

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1549
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1550
# Body
# {
.annotate 'line', 1552
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1553

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1554
# Body
# {
.annotate 'line', 1556
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1557

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1558
# Body
# {
.annotate 'line', 1560
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1561

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1562
# Body
# {
.annotate 'line', 1564
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1565

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1566
# Body
# {
.annotate 'line', 1568
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1569

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1570
# Body
# {
.annotate 'line', 1572
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1573

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1574
# Body
# {
.annotate 'line', 1576
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1577

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1578
# Body
# {
.annotate 'line', 1580
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1581

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1582
# Body
# {
.annotate 'line', 1584
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1585

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1586
# Body
# {
.annotate 'line', 1588
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1589

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1591
# Body
# {
.annotate 'line', 1596
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1597

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1598
# Body
# {
.annotate 'line', 1600
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1601

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1602
# Body
# {
.annotate 'line', 1604
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1605

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1606
# Body
# {
.annotate 'line', 1608
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1610
.return(self)
# }
.annotate 'line', 1611

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1543
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1616
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1617
# Body
# {
.annotate 'line', 1619
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1620

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1621
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1622
# Body
# {
# }
.annotate 'line', 1625

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1614
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1632
# Body
# {
.annotate 'line', 1634
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1635
$P1.'push'(__ARG_1)
.annotate 'line', 1636
$P1.'push'(__ARG_2)
.annotate 'line', 1637
setattribute self, 'statements', $P1
# }
.annotate 'line', 1638

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1639
# Body
# {
.annotate 'line', 1641
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1642
.return(self)
# }
.annotate 'line', 1643

.end # push


.sub 'optimize' :method

.annotate 'line', 1644
# Body
# {
.annotate 'line', 1646
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1647
.return(self)
# }
.annotate 'line', 1648

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1649
# Body
# {
.annotate 'line', 1651
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1652
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1653

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1630
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1656
# Body
# {
.annotate 'line', 1658
unless_null __ARG_1, __label_0
.annotate 'line', 1659
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1660
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1661
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1663
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1664

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1674
# Body
# {
.annotate 'line', 1676
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1677
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1678
# int dotted: $I1
null $I1
.annotate 'line', 1679
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1681
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1683
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1684
unless $I1 goto __label_3
set $S2, '.'
goto __label_2
__label_3:
set $S2, ''
__label_2:
concat $S3, $S2, $S1
box $P3, $S3
setattribute self, 'opname', $P3
.annotate 'line', 1685
$P1 = __ARG_2.'get'()
.annotate 'line', 1686
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1687
__ARG_2.'unget'($P1)
.annotate 'line', 1688
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1690
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1691

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1692
# Body
# {
.annotate 'line', 1694
self.'optimizeargs'()
.annotate 'line', 1695
.return(self)
# }
.annotate 'line', 1696

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1697
# Body
# {
.annotate 'line', 1699
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1700
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1701
__ARG_1.'comment'($S2)
.annotate 'line', 1702
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1703
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1705
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1706
self.'emitargs'(__ARG_1)
.annotate 'line', 1707
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1709

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1670
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1672
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1719
# Body
# {
.annotate 'line', 1721
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1722
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1723
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1724
# {
.annotate 'line', 1725
$P2 = __ARG_2.'get'()
.annotate 'line', 1726
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1727
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1728
'RequireOp'(';', $P2)
.annotate 'line', 1729
setattribute self, 'path', $P1
.annotate 'line', 1730
.return(self)
# }
.annotate 'line', 1731

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1732
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1733
# Body
# {
.annotate 'line', 1735
self.'annotate'(__ARG_1)
.annotate 'line', 1736
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1737

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1716
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1718
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1747
# Body
# {
.annotate 'line', 1749
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1750
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1751
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1752
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1753

.end # StaticStatement


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
self.'annotate'(__ARG_1)
.annotate 'line', 1758
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1759
getattribute $P3, self, 'symbol'
.annotate 'line', 1758
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1760

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1744
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1746
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1770
# Body
# {
.annotate 'line', 1772
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1773
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1774
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1775
# {
.annotate 'line', 1776
$P2 = __ARG_2.'get'()
.annotate 'line', 1777
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1778
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1779
'RequireOp'(';', $P2)
.annotate 'line', 1780
setattribute self, 'path', $P1
# }
.annotate 'line', 1781

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1782
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1783
# Body
# {
.annotate 'line', 1785
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1786
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1787
self.'annotate'(__ARG_1)
.annotate 'line', 1789
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1791
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1792
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1794
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1797
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1799

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1767
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1769
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1809
# Body
# {
.annotate 'line', 1811
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1812
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1813
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1814

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1815
# Body
# {
.annotate 'line', 1817
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1818
.return(self)
# }
.annotate 'line', 1819

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1820
# Body
# {
.annotate 'line', 1822
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1823

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1806
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1808
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 1833
# Body
# {
.annotate 'line', 1835
setattribute self, 'name', __ARG_1
.annotate 'line', 1836
.return(self)
# }
.annotate 'line', 1837

.end # set


.sub 'get_string' :method :vtable

.annotate 'line', 1838
# Body
# {
# predefined Error
.annotate 'line', 1840
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1841

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1832
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1848
# Body
# {
.annotate 'line', 1850
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1851

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1852
# Body
# {
.annotate 'line', 1854
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1855
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1856
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1857
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, "'"
.annotate 'line', 1858
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1859
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1860
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['scope'] = self
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1865
.return($S2)
# }
.annotate 'line', 1866

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1867
# Body
# {
.annotate 'line', 1869
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1870
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1871
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1872
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 1873
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1874
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['scope'] = self
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1879

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1880
# Body
# {
.annotate 'line', 1882
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1883
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1884
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1885
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 1886
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1887
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1890
new $P5, [ 'ConstantInternalFail' ]
$P4 = $P5.'set'(__ARG_1)
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1892
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1893
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1894
$P1[$S1] = $P3
# }
.annotate 'line', 1895

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1896
# Body
# {
.annotate 'line', 1898
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1899
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1900
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1901
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1902
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1903
.return($P2)
# }
.annotate 'line', 1904

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 1905
# Body
# {
.annotate 'line', 1907
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1908
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1909
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1910
.return($P2)
# }
.annotate 'line', 1911

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 1912
# Body
# {
.annotate 'line', 1914
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 1915
# string lexname: $S1
$P3 = __ARG_1['reg']
$P2 = $P1.'createlex'($P3)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1916
.return($S1)
# }
.annotate 'line', 1917

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 1918
# Body
# {
.annotate 'line', 1920
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 1922
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 1923
.return('__WLEX_self')
# }
.annotate 'line', 1924

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1847
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 1933
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 1943
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 1944
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 1945
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 1946
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 1947
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 1948
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 1949
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 1950
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 1951
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1952
# Body
# {
.annotate 'line', 1954
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 1955

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 1956
# Body
# {
.annotate 'line', 1958
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1959

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 1960
# Body
# {
.annotate 'line', 1963
.return(self)
# }
.annotate 'line', 1964

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 1965
# Body
# {
.annotate 'line', 1967
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1968
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 1969
self.'emit'(__ARG_1, $S2)
.annotate 'line', 1970
.return($S2)
# }
.annotate 'line', 1971

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1972
# Body
# {
.annotate 'line', 1974
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 1975

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 1941
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 1980
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 1978
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1988
# Body
# {
.annotate 'line', 1990
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 1991
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1992
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 1993
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 1994
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 1995

.end # FunctionExpr


.sub 'checkResult' :method

.annotate 'line', 1996
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 1997
# Body
# {
.annotate 'line', 1999
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2000
.return(self)
# }
.annotate 'line', 2001

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2002
# Body
# {
.annotate 'line', 2004
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2005
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2006
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2007
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2008
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2009

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 1985
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 1987
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2022
# Body
# {
.annotate 'line', 2024
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2025
.return(self)
# }
.annotate 'line', 2026

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2027
# Body
# {
.annotate 'line', 2029
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2030

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2031
# Body
# {
.annotate 'line', 2033
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2034
.return(self)
# }
.annotate 'line', 2035

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2036
# Body
# {
.annotate 'line', 2038
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2039
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2040
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2042
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2043
ne $I1, 0, __label_4
.annotate 'line', 2044
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2046
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2049
.return(0)
# }
.annotate 'line', 2050

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2051
# Body
# {
.annotate 'line', 2053
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2055
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2056
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2057
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2059
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2060
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2061
if $S3 == $S4 goto __label_7
set $S4, 'P'
if $S3 == $S4 goto __label_8
set $S4, 'I'
if $S3 == $S4 goto __label_9
set $S4, 'N'
if $S3 == $S4 goto __label_10
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2064
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2067
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2070
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2073

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2074
# Body
# {
.annotate 'line', 2076
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2078
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2079
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2080
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2082
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2083
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2084
if $S3 == $S4 goto __label_7
set $S4, 'P'
if $S3 == $S4 goto __label_8
set $S4, 'I'
if $S3 == $S4 goto __label_9
set $S4, 'N'
if $S3 == $S4 goto __label_10
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2087
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2090
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2093
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2096

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2021
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2103
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2104
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2101
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2112
# Body
# {
.annotate 'line', 2114
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2115
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2116

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2117
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2118
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'getPirString' :method

.annotate 'line', 2119
# Body
# {
.annotate 'line', 2121
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2122
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2123
# int type: $I1
getattribute $P2, $P1, 'type'
set $I1, $P2
.annotate 'line', 2124
# int need_unicode: $I2
null $I2
box $P3, $S1
.annotate 'line', 2125
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $I3, $P4
# {
.annotate 'line', 2126
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2128
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2131
unless $I2 goto __label_4
# {
.annotate 'line', 2132
ne $I1, 3, __label_5
# {
set $I1, 2
.annotate 'line', 2134
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P3, $S2
.annotate 'line', 2136
iter $P5, $P3
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2137
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S3
.annotate 'line', 2139
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2142
# string result: $S4
set $S4, ''
.annotate 'line', 2143
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2144
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2145
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2146
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2147
le $I6, 127, __label_12
# {
.annotate 'line', 2148
# string h: $S6
box $P7, $I6
$P6 = $P7.'get_as_base'(16)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
concat $S4, '\x{'
concat $S4, $S6
concat $S4, '}'
.annotate 'line', 2149
# }
goto __label_13
__label_12: # else
concat $S4, $S5
__label_13: # endif
.annotate 'line', 2152
# }
__label_9: # for iteration
.annotate 'line', 2144
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2154
# }
__label_4: # endif
.annotate 'line', 2156
# string q: $S7
ne $I1, 3, __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
concat $S0, $S7, $S1
concat $S0, $S7
set $S1, $S0
.annotate 'line', 2158
unless $I2 goto __label_17
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2160
.return($S1)
# }
.annotate 'line', 2161

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2162
# Body
# {
.annotate 'line', 2164
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2165
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2166
getattribute $P3, $P1, 'type'
set $I1, $P3
ne $I1, 2, __label_1
# {
.annotate 'line', 2167
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2168
$P4 = $P2.'unescape'('utf8')
set $S1, $P4
# }
__label_1: # endif
.annotate 'line', 2170
.return($S1)
# }
.annotate 'line', 2171

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2172
# Body
# {
.annotate 'line', 2174
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2175

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2176
# Body
# {
.annotate 'line', 2178
.tailcall self.'getPirString'()
# }
.annotate 'line', 2179

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2109
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2111
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2188
# Body
# {
.annotate 'line', 2191
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2192
setattribute self, 'pos', __ARG_2
.annotate 'line', 2193
# int n: $I1
null $I1
.annotate 'line', 2194
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2195
# {
.annotate 'line', 2197
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2198
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2200
setattribute self, 'numval', $P2
# }
.annotate 'line', 2201

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2202
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2203
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'getIntegerValue' :method

.annotate 'line', 2204
# Body
# {
.annotate 'line', 2206
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2207
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2208
.return($I1)
# }
.annotate 'line', 2209

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2210
# Body
# {
.annotate 'line', 2212
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2213
ne $I1, 0, __label_0
.annotate 'line', 2214
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2216
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2217

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2218
# Body
# {
.annotate 'line', 2220
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2221

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2184
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2186
addattribute $P0, 'pos'
.annotate 'line', 2187
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2229
# Body
# {
.annotate 'line', 2231
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2232
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2233

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2234
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2235
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'getFloatValue' :method

.annotate 'line', 2236
# Body
# {
.annotate 'line', 2238
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2239
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2241
.return($P1)
# }
.annotate 'line', 2242

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2243
# Body
# {
.annotate 'line', 2245
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2246
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2247

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2248
# Body
# {
.annotate 'line', 2252
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2253
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, '.0'
__label_1: # endif
.annotate 'line', 2255
.return($S1)
# }
.annotate 'line', 2256

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2226
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2228
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2264
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2265
# Body
# {
.annotate 'line', 2267
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2268
setattribute self, 'name', __ARG_2
.annotate 'line', 2269
.return(self)
# }
.annotate 'line', 2270

.end # set


.sub 'isnull' :method

.annotate 'line', 2271
# Body
# {
.annotate 'line', 2273
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2274

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2275
# Body
# {
.annotate 'line', 2277
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2278
if_null $P1, __label_0
$P2 = $P1['type']
.annotate 'line', 2279
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2281
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
.annotate 'line', 2284
.return('P')
__label_3: # default
.annotate 'line', 2286
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2289

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2290
# Body
# {
.annotate 'line', 2292
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2293
.return($S1)
# }
.annotate 'line', 2294

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2295
# Body
# {
.annotate 'line', 2297
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2298
unless_null $P1, __label_0
.annotate 'line', 2299
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2300
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2301
# string s: $S1
null $S1
.annotate 'line', 2302
unless_null $P2, __label_1
# {
.annotate 'line', 2303
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2304
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
.annotate 'line', 2310
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2314
$P4 = $P2['id']
if_null $P4, __label_8
$P5 = $P2['id']
.annotate 'line', 2315
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2317
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2319
.return($S1)
# }
.annotate 'line', 2320

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2321
# Body
# {
.annotate 'line', 2323
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2324
$S2 = $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2325
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, "' is not defined"
.annotate 'line', 2326
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2328
.return($P1)
# }
.annotate 'line', 2329

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2330
# Body
# {
.annotate 'line', 2332
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2333
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2334
if_null $P2, __label_0
# {
.annotate 'line', 2335
$I1 = $P2['const']
unless $I1 goto __label_2
$P3 = $P2['id']
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2336
.return($P4)
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2338
.return(self)
# }
.annotate 'line', 2339

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2340
# Body
# {
.annotate 'line', 2342
self.'annotate'(__ARG_1)
.annotate 'line', 2343
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2344

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2345
# Body
# {
.annotate 'line', 2347
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2348

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2349
# Body
# {
.annotate 'line', 2351
self.'annotate'(__ARG_1)
.annotate 'line', 2352
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2353
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2354
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2355
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2358
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2361
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2364
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2365
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2367
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2368
ne $S1, $S3, __label_11
# {
.annotate 'line', 2369
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2372
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2373
self.'annotate'(__ARG_1)
.annotate 'line', 2374
iseq $I1, $S1, 'P'
unless $I1 goto __label_16
isne $I1, $S3, 'P'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 2375
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2377
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2380
.return($S2)
# }
.annotate 'line', 2381

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2261
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2263
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2388
# Body
# {
.annotate 'line', 2390
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2391

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2386
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2399
# Body
# {
.annotate 'line', 2401
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2402
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2403

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2404
# Body
# {
.annotate 'line', 2406
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2407

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2408
# Body
# {
.annotate 'line', 2410
self.'optimizearg'()
.annotate 'line', 2411
.return(self)
# }
.annotate 'line', 2412

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2396
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2398
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2421
# Body
# {
.annotate 'line', 2423
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2424
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2425
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2426

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2427
# Body
# {
.annotate 'line', 2429
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2430
.return(self)
# }
.annotate 'line', 2431

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2432
# Body
# {
.annotate 'line', 2434
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2435

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2436
# Body
# {
.annotate 'line', 2438
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2439
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2440

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2441
# Body
# {
.annotate 'line', 2443
self.'optimizearg'()
.annotate 'line', 2444
.return(self)
# }
.annotate 'line', 2445

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2417
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2419
addattribute $P0, 'lexpr'
.annotate 'line', 2420
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2452
# Body
# {
.annotate 'line', 2454
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2455

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2456
# Body
# {
.annotate 'line', 2458
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2459
.return(self)
# }
.annotate 'line', 2460

.end # set


.sub 'optimize' :method

.annotate 'line', 2461
# Body
# {
.annotate 'line', 2463
self.'optimizearg'()
.annotate 'line', 2464
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2465
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2466
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2467
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2470
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2471
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2472
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2473
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2476
.return(self)
# }
.annotate 'line', 2477

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

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
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2483

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2450
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2490
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkResult' :method

.annotate 'line', 2491
# Body
# {
.annotate 'line', 2493
.return('I')
# }
.annotate 'line', 2494

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2495
# Body
# {
.annotate 'line', 2497
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2498
.return(self)
# }
.annotate 'line', 2499

.end # set


.sub 'optimize' :method

.annotate 'line', 2500
# Body
# {
.annotate 'line', 2502
self.'optimizearg'()
.annotate 'line', 2503
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2504
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2505
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2506
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2507
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2509
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2510
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2511
.return(self)
# }
.annotate 'line', 2512

.end # optimize


.sub 'negated' :method

.annotate 'line', 2513
# Body
# {
.annotate 'line', 2515
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2516

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2517
# Body
# {
.annotate 'line', 2519
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2520
self.'annotate'(__ARG_1)
.annotate 'line', 2521
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2522
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2524
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2527
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2530
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2532

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2488
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2539
# Body
# {
.annotate 'line', 2541
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2542

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2543
# Body
# {
.annotate 'line', 2545
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2546
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2547
.return(self)
# }
.annotate 'line', 2548

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2549
# Body
# {
.annotate 'line', 2551
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2552
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2553
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2554

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2555
# Body
# {
.annotate 'line', 2557
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2558
self.'annotate'(__ARG_1)
.annotate 'line', 2559
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2560
.return($S1)
# }
.annotate 'line', 2561

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2537
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2568
# Body
# {
.annotate 'line', 2570
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2571
.return(self)
# }
.annotate 'line', 2572

.end # set


.sub 'checkResult' :method

.annotate 'line', 2573
# Body
# {
.annotate 'line', 2575
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2576

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2577
# Body
# {
.annotate 'line', 2579
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2580
self.'annotate'(__ARG_1)
.annotate 'line', 2581
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2582
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2583
.return($S1)
# }
.annotate 'line', 2584

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2566
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2591
# Body
# {
.annotate 'line', 2593
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2594

.end # checkResult


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


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2600
# Body
# {
.annotate 'line', 2602
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2603
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2604
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2605

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2606
# Body
# {
.annotate 'line', 2608
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2609
self.'annotate'(__ARG_1)
.annotate 'line', 2610
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2611
.return($S1)
# }
.annotate 'line', 2612

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2589
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2619
# Body
# {
.annotate 'line', 2621
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2622
.return(self)
# }
.annotate 'line', 2623

.end # set


.sub 'checkResult' :method

.annotate 'line', 2624
# Body
# {
.annotate 'line', 2626
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2627

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2628
# Body
# {
.annotate 'line', 2630
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2631
self.'annotate'(__ARG_1)
.annotate 'line', 2632
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2633
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2634
.return($S1)
# }
.annotate 'line', 2635

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2617
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2644
# Body
# {
.annotate 'line', 2646
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2647
setattribute self, 'eleft', __ARG_3
.annotate 'line', 2648
setattribute self, 'eright', __ARG_4
.annotate 'line', 2649
.return(self)
# }
.annotate 'line', 2650

.end # set


.sub 'checkResult' :method

.annotate 'line', 2651
# Body
# {
.annotate 'line', 2653
getattribute $P2, self, 'eleft'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2654
getattribute $P3, self, 'eleft'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2656
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2657

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2658
# Body
# {
.annotate 'line', 2660
getattribute $P3, self, 'eleft'
$P2 = $P3.'optimize'()
setattribute self, 'eleft', $P2
.annotate 'line', 2661
getattribute $P3, self, 'eright'
$P2 = $P3.'optimize'()
setattribute self, 'eright', $P2
.annotate 'line', 2662
.return(self)
# }
.annotate 'line', 2663

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2664
# Body
# {
.annotate 'line', 2666
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2667

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2640
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2642
addattribute $P0, 'eleft'
.annotate 'line', 2643
addattribute $P0, 'eright'
.end
.namespace [ 'OpAssignExpr' ]

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
eq $S2, '', __label_1
# {
.annotate 'line', 2678
self.'annotate'(__ARG_1)
.annotate 'line', 2679
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2681

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2682
# Body
# {
.annotate 'line', 2684
self.'annotate'(__ARG_1)
.annotate 'line', 2685
# var eleft: $P1
getattribute $P1, self, 'eleft'
.annotate 'line', 2686
getattribute $P2, self, 'eright'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2687

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2672
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2694
# Body
# {
.annotate 'line', 2696
self.'annotate'(__ARG_1)
.annotate 'line', 2697
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2698
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2699
__ARG_1.'emitassign'(__ARG_2, $S1)
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
self.'annotate'(__ARG_1)
.annotate 'line', 2704
# string reg: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2705
# string reg2: $S2
getattribute $P2, self, 'eright'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2706
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2707
.return($S1)
# }
.annotate 'line', 2708

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2692
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2715
# Body
# {
.annotate 'line', 2717
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2718
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2719
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2720

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2721
# Body
# {
.annotate 'line', 2723
# var eleft: $P1
getattribute $P1, self, 'eleft'
.annotate 'line', 2724
# var eright: $P2
getattribute $P2, self, 'eright'
.annotate 'line', 2725
# string ltype: $S1
$P3 = $P1.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2726
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2727
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2728
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2730
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2731
self.'annotate'(__ARG_1)
.annotate 'line', 2732
ne $S1, 'S', __label_6
# {
.annotate 'line', 2733
$P4 = $P2.'checkResult'()
$S5 = $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2734
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2735
__ARG_1.'say'($S4, ' = ', $S3)
set $S3, $S4
.annotate 'line', 2736
# }
__label_8: # endif
.annotate 'line', 2738
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2741
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2743
.return($S2)
# }
.annotate 'line', 2744

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2713
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2751
# Body
# {
.annotate 'line', 2753
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2754
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2755
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2756

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2757
# Body
# {
.annotate 'line', 2759
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2760
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2761
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2762
self.'annotate'(__ARG_1)
.annotate 'line', 2763
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2764
.return($S2)
# }
.annotate 'line', 2765

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2749
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2772
# Body
# {
.annotate 'line', 2774
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2775
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2776
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2777

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2778
# Body
# {
.annotate 'line', 2780
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2781
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2782
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2783
self.'annotate'(__ARG_1)
.annotate 'line', 2784
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2785
.return($S2)
# }
.annotate 'line', 2786

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2770
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2793
# Body
# {
.annotate 'line', 2795
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2796
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2797
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2798

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2799
# Body
# {
.annotate 'line', 2801
# string type: $S1
getattribute $P2, self, 'eleft'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2802
# string reg: $S2
getattribute $P2, self, 'eleft'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2803
# string reg2: $S3
getattribute $P4, self, 'eright'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2804
self.'annotate'(__ARG_1)
.annotate 'line', 2805
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2806
.return($S2)
# }
.annotate 'line', 2807

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2791
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2814
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2815
# Body
# {
.annotate 'line', 2817
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2818
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2819
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2820
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2821
self.'annotate'(__ARG_1)
.annotate 'line', 2822
# string aux: $S5
null $S5
.annotate 'line', 2823
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2825
ne $S1, 'I', __label_7
# {
.annotate 'line', 2826
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2827
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2828
# }
__label_7: # endif
.annotate 'line', 2830
ne $S2, 'I', __label_8
# {
.annotate 'line', 2831
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2832
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2833
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2836
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 2837
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2838
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2839
# }
goto __label_10
__label_9: # else
.annotate 'line', 2841
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 2842
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2843
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2844
# }
goto __label_13
__label_12: # else
.annotate 'line', 2846
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 2847
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2848
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2849
# }
goto __label_16
__label_15: # else
.annotate 'line', 2851
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 2852
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2853
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2854
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 2857
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 2859
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 2862
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 2865
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 2866
# }
.annotate 'line', 2868

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2869
# Body
# {
.annotate 'line', 2871
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2872

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2873
# Body
# {
.annotate 'line', 2875
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 2876

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2877
# Body
# {
.annotate 'line', 2879
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 2880

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2812
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 2893
# Body
# {
.annotate 'line', 2895
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2896
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 2897
setattribute self, 'checknull', $P2
# }
.annotate 'line', 2898

.end # NullCheckerExpr


.sub 'checkResult' :method

.annotate 'line', 2899
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'isnegable' :method

.annotate 'line', 2900
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2901
# Body
# {
.annotate 'line', 2903
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 2904
setattribute self, 'checknull', $P1
.annotate 'line', 2905
.return(self)
# }
.annotate 'line', 2906

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2907
# Body
# {
.annotate 'line', 2909
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2910
self.'annotate'(__ARG_1)
.annotate 'line', 2911
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2912
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 2913
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 2914

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2915
# Body
# {
.annotate 'line', 2917
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2918
self.'annotate'(__ARG_1)
.annotate 'line', 2919
getattribute $P1, self, 'checknull'
if_null $P1, __label_2
unless $P1 goto __label_2
set $S2, 'unless'
goto __label_1
__label_2:
set $S2, 'if'
__label_1:
__ARG_1.'say'($S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 2920

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 2888
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2890
addattribute $P0, 'expr'
.annotate 'line', 2891
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2927
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2928
# Body
# {
.annotate 'line', 2930
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 2931

.end # negated


.sub 'optimize' :method

.annotate 'line', 2932
# Body
# {
.annotate 'line', 2934
self.'optimizearg'()
.annotate 'line', 2935
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2936
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2937
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2938
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2939
unless $I1 goto __label_0
# {
.annotate 'line', 2940
unless $I2 goto __label_1
.annotate 'line', 2941
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 2943
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2945
unless $I2 goto __label_3
.annotate 'line', 2946
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 2947
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 2948
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 2949
# string rtype: $S2
$P8 = $P2.'checkResult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 2950
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 2951
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 2952
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 2953
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 2956
.return(self)
# }
.annotate 'line', 2957

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2958
# Body
# {
.annotate 'line', 2960
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 2961

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2962
# Body
# {
.annotate 'line', 2964
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2965

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2966
# Body
# {
.annotate 'line', 2968
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 2969

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 2970
# Body
# {
.annotate 'line', 2972
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 2973

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 2925
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2980
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2981
# Body
# {
.annotate 'line', 2983
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 2984

.end # negated


.sub 'optimize' :method

.annotate 'line', 2985
# Body
# {
.annotate 'line', 2987
self.'optimizearg'()
.annotate 'line', 2988
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2989
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2990
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2991
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2992
unless $I1 goto __label_0
# {
.annotate 'line', 2993
unless $I2 goto __label_1
.annotate 'line', 2994
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 2996
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2998
unless $I2 goto __label_3
.annotate 'line', 2999
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3000
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3001
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3002
# string rtype: $S2
$P8 = $P2.'checkResult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3003
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3004
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3005
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3006
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3009
.return(self)
# }
.annotate 'line', 3010

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3011
# Body
# {
.annotate 'line', 3013
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3014

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3015
# Body
# {
.annotate 'line', 3017
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3018

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3019
# Body
# {
.annotate 'line', 3021
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3022

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3023
# Body
# {
.annotate 'line', 3025
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3026

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 2978
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

.annotate 'line', 3034
# Body
# {
.annotate 'line', 3036
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3037
setattribute self, 'positive', $P1
# }
.annotate 'line', 3038

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3039
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3040
# Body
# {
.annotate 'line', 3042
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3043
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
.annotate 'line', 3044

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3045
# Body
# {
.annotate 'line', 3047
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3048
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3049
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3050

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3051
# Body
# {
.annotate 'line', 3053
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3054

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3055
# Body
# {
.annotate 'line', 3057
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3058
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3059
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3060

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3061
# Body
# {
.annotate 'line', 3063
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3064
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3065
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3066

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3031
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3033
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3073
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3074
# Body
# {
.annotate 'line', 3076
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3077

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3078
# Body
# {
.annotate 'line', 3080
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3081

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3082
# Body
# {
.annotate 'line', 3084
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3085

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3086
# Body
# {
.annotate 'line', 3088
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3089

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3071
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3096
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3097
# Body
# {
.annotate 'line', 3099
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3100

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3101
# Body
# {
.annotate 'line', 3103
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3104

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3105
# Body
# {
.annotate 'line', 3107
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3108

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3109
# Body
# {
.annotate 'line', 3111
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3112

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3094
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3119
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3120
# Body
# {
.annotate 'line', 3122
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3123

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3124
# Body
# {
.annotate 'line', 3126
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3127

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3128
# Body
# {
.annotate 'line', 3130
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3131

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3132
# Body
# {
.annotate 'line', 3134
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3135

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3117
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3142
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3143
# Body
# {
.annotate 'line', 3145
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3146

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3147
# Body
# {
.annotate 'line', 3149
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3150

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3151
# Body
# {
.annotate 'line', 3153
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3154

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3155
# Body
# {
.annotate 'line', 3157
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3158

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3140
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3165
# Body
# {
.annotate 'line', 3167
.return('I')
# }
.annotate 'line', 3168

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3163
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3175
# Body
# {
.annotate 'line', 3177
self.'optimizearg'()
.annotate 'line', 3178
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3179
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3180
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3181
eq $I1, 0, __label_1
.annotate 'line', 3182
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3184
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3186
.return(self)
# }
.annotate 'line', 3187

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3188
# Body
# {
.annotate 'line', 3190
# string res: $S1
if_null __ARG_2, __label_1
set $P1, __ARG_2
goto __label_0
__label_1:
$P1 = self.'tempreg'('I')
__label_0:
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 3191
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3192
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3193
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3194
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3195
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3196
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3199
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3200
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3201
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 3202
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3203
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3205

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3173
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3212
# Body
# {
.annotate 'line', 3214
self.'optimizearg'()
.annotate 'line', 3215
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3216
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3217
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3218
ne $I1, 0, __label_1
.annotate 'line', 3219
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3221
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3223
.return(self)
# }
.annotate 'line', 3224

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3225
# Body
# {
.annotate 'line', 3227
# string res: $S1
null $S1
.annotate 'line', 3228
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3231
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3232
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3233
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3234
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3235
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3236
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3237
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3240
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3241
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3242
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3243
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3244
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3246

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3210
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3253
# Body
# {
.annotate 'line', 3255
.return('I')
# }
.annotate 'line', 3256

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3251
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3263
# Body
# {
.annotate 'line', 3265
self.'optimizearg'()
.annotate 'line', 3266
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3267
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3268
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3269
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3270
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3271
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3273
.return(self)
# }
.annotate 'line', 3274

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3275
# Body
# {
.annotate 'line', 3277
# string res: $S1
if_null __ARG_2, __label_1
set $P1, __ARG_2
goto __label_0
__label_1:
$P1 = self.'tempreg'('I')
__label_0:
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 3278
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3279
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3280
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3281
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3282
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3283

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3261
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3290
# Body
# {
.annotate 'line', 3292
self.'optimizearg'()
.annotate 'line', 3293
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3294
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3295
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3296
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3297
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3298
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3300
.return(self)
# }
.annotate 'line', 3301

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3302
# Body
# {
.annotate 'line', 3304
# string res: $S1
if_null __ARG_2, __label_1
set $P1, __ARG_2
goto __label_0
__label_1:
$P1 = self.'tempreg'('I')
__label_0:
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 3305
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3306
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3307
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3308
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3309
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3310

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3288
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3318
# Body
# {
.annotate 'line', 3320
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3321
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3322
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3323
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3324
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3326
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3328
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3329
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3330
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3333
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3334

.end # ConcatString


.sub 'checkResult' :method

.annotate 'line', 3335
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3336
# Body
# {
.annotate 'line', 3338
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3339
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3340
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3341
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3342
ge $I2, $I1, __label_1
.annotate 'line', 3343
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
# predefined string
$S1 = $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3342
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3344
.return($P2)
# }
.annotate 'line', 3345

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3346
# Body
# {
.annotate 'line', 3348
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3349
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3350
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3351
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3352
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3353
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3354
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3353
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3355
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3356

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3357
# Body
# {
.annotate 'line', 3359
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3360
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3361
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3362
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3363
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3364
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
$P3 = $P1[$I2]
.annotate 'line', 3365
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3364
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3366
.return($S1)
# }
.annotate 'line', 3367

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3368
# Body
# {
.annotate 'line', 3370
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3371
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3372
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3373
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3374
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3373
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3375

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3315
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3317
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3382
# Body
# {
.annotate 'line', 3384
self.'optimizearg'()
.annotate 'line', 3385
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3386
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3387
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3388
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3389
$I4 = $P1.'isliteral'()
unless $I4 goto __label_3
$I4 = $P2.'isliteral'()
__label_3:
unless $I4 goto __label_2
# {
.annotate 'line', 3390
iseq $I5, $S1, 'S'
unless $I5 goto __label_5
iseq $I5, $S2, 'S'
__label_5:
unless $I5 goto __label_4
# {
.annotate 'line', 3391
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3392
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3393
# var t: $P5
null $P5
.annotate 'line', 3394
# int newtype: $I1
null $I1
.annotate 'line', 3395
getattribute $P11, $P3, 'type'
set $I5, $P11
iseq $I4, $I5, 3
unless $I4 goto __label_8
getattribute $P12, $P4, 'type'
set $I6, $P12
iseq $I4, $I6, 3
__label_8:
unless $I4 goto __label_6
set $I1, 3
goto __label_7
__label_6: # else
set $I1, 2
__label_7: # endif
.annotate 'line', 3399
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_9
set $S3, $P11
__label_9:
.annotate 'line', 3400
# string rs: $S4
getattribute $P12, $P4, 'str'
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
concat $S5, $S3, $S4
.annotate 'line', 3401
$P5 = 'newTokenFrom'($I1, $S5, $P3)
.annotate 'line', 3402
new $P14, [ 'StringLiteral' ]
getattribute $P15, self, 'owner'
$P14.'StringLiteral'($P15, $P5)
set $P13, $P14
.return($P13)
# }
__label_4: # endif
.annotate 'line', 3404
iseq $I6, $S1, 'I'
unless $I6 goto __label_12
iseq $I6, $S2, 'I'
__label_12:
unless $I6 goto __label_11
# {
.annotate 'line', 3405
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3406
# int ln: $I2
set $P13, $P6
set $I2, $P13
.annotate 'line', 3407
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3408
# int rn: $I3
set $P14, $P7
set $I3, $P14
.annotate 'line', 3409
getattribute $P15, self, 'owner'
getattribute $P16, self, 'start'
add $I7, $I2, $I3
.tailcall 'integerValue'($P15, $P16, $I7)
# }
__label_11: # endif
# {
.annotate 'line', 3412
$P16 = 'floatresult'($S1, $S2)
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 3413
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3414
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3415
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3416
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3417
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P17, $P18, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3421
iseq $I7, $S1, 'S'
unless $I7 goto __label_15
iseq $I7, $S2, 'S'
__label_15:
unless $I7 goto __label_14
# {
.annotate 'line', 3422
new $P18, [ 'ConcatString' ]
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
$P18.'ConcatString'($P19, $P20, $P1, $P2)
set $P17, $P18
.return($P17)
# }
__label_14: # endif
.annotate 'line', 3424
.return(self)
# }
.annotate 'line', 3425

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3426
# Body
# {
.annotate 'line', 3428
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3429
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3430
ne $S1, $S2, __label_2
.annotate 'line', 3431
.return($S1)
__label_2: # endif
.annotate 'line', 3432
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3433
.return('S')
__label_3: # endif
.annotate 'line', 3434
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3435
.return('S')
__label_5: # endif
.annotate 'line', 3436
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3437
.return('N')
__label_7: # endif
.annotate 'line', 3438
.return('I')
# }
.annotate 'line', 3439

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3440
# Body
# {
.annotate 'line', 3442
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3443
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3444
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3445
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3446
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3448
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3449
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3450
ne $S1, 'S', __label_5
# {
.annotate 'line', 3451
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3452
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3453
eq $S2, 'S', __label_10
# {
.annotate 'line', 3454
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3455
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3458
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3459
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3462
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3465
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3466
# string l: $S7
null $S7
.annotate 'line', 3467
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3469
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3470
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3472
# string r: $S8
null $S8
.annotate 'line', 3473
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3475
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3476
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3478
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3481
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3483

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3380
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3490
# Body
# {
.annotate 'line', 3492
self.'optimizearg'()
.annotate 'line', 3493
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3494
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3495
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3496
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3497
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3498
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3499
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3500
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3501
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3502
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3503
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3506
.return(self)
# }
.annotate 'line', 3507

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3508
# Body
# {
.annotate 'line', 3510
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3511
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3512
ne $S1, $S2, __label_2
.annotate 'line', 3513
.return($S1)
__label_2: # endif
.annotate 'line', 3514
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3515
.return('N')
__label_3: # endif
.annotate 'line', 3516
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3517
.return('N')
__label_5: # endif
.annotate 'line', 3518
.return('I')
# }
.annotate 'line', 3519

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3520
# Body
# {
.annotate 'line', 3522
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3523
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3524
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3525

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3488
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3532
# Body
# {
.annotate 'line', 3534
self.'optimizearg'()
.annotate 'line', 3535
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3536
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3537
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3538
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3539
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3540
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3541
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3542
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3543
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3544
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3545
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
set $I5, $I1
set $I6, $I2
mul $I4, $I5, $I6
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3548
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3549
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3550
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3551
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3552
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3553
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3557
.return(self)
# }
.annotate 'line', 3558

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3559
# Body
# {
.annotate 'line', 3561
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3562
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3563
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3564
ne $S1, $S2, __label_2
.annotate 'line', 3565
.return($S1)
__label_2: # endif
.annotate 'line', 3566
ne $S1, 'S', __label_3
.annotate 'line', 3567
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3569
.return('N')
__label_4: # endif
# }
.annotate 'line', 3570

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3571
# Body
# {
.annotate 'line', 3573
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3574
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3575
# var ltype: $P3
$P3 = $P1.'checkResult'()
.annotate 'line', 3576
$S10 = $P3
ne $S10, 'S', __label_0
# {
.annotate 'line', 3577
# string lreg: $S1
$P4 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 3578
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 3579
# string rval: $S3
null $S3
.annotate 'line', 3580
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
.annotate 'line', 3585
$P6 = self.'tempreg'('I')
set $S3, $P6
.annotate 'line', 3586
__ARG_1.'emitset'($S3, $S2)
__label_3: # switch end
.annotate 'line', 3588
self.'annotate'(__ARG_1)
.annotate 'line', 3589
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S1, ', ', $S3)
.annotate 'line', 3590
.return()
# }
__label_0: # endif
.annotate 'line', 3595
$S11 = $P3
ne $S11, 'N', __label_6
# {
.annotate 'line', 3596
# string lreg: $S4
$P5 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_7
set $S4, $P5
__label_7:
.annotate 'line', 3597
# string rreg: $S5
$P6 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P6, __label_8
set $S5, $P6
__label_8:
.annotate 'line', 3598
# string rval: $S6
null $S6
.annotate 'line', 3599
$P7 = $P2.'checkResult'()
set $S12, $P7
set $S13, 'I'
if $S12 == $S13 goto __label_11
set $S13, 'N'
if $S12 == $S13 goto __label_12
goto __label_10
# switch
__label_11: # case
.annotate 'line', 3601
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3602
__ARG_1.'emitset'($S6, $S5)
set $S6, $S5
goto __label_9 # break
__label_12: # case
set $S6, $S5
goto __label_9 # break
__label_10: # default
.annotate 'line', 3609
$P9 = self.'tempreg'('N')
set $S6, $P9
.annotate 'line', 3610
__ARG_1.'emitset'($S6, $S5)
__label_9: # switch end
.annotate 'line', 3612
self.'annotate'(__ARG_1)
.annotate 'line', 3613
__ARG_1.'say'('mul ', __ARG_2, ', ', $S4, ', ', $S6)
.annotate 'line', 3614
.return()
# }
__label_6: # endif
.annotate 'line', 3617
# string rleft: $S7
null $S7
.annotate 'line', 3618
# string rright: $S8
null $S8
.annotate 'line', 3619
# int nleft: $I1
null $I1
.annotate 'line', 3620
# int nright: $I2
null $I2
.annotate 'line', 3621
$P7 = $P1.'issimple'()
isfalse $I3, $P7
if $I3 goto __label_15
$I3 = $P1.'isidentifier'()
__label_15:
unless $I3 goto __label_13
# {
.annotate 'line', 3622
$P9 = self.'checkResult'()
$P8 = self.'tempreg'($P9)
set $S7, $P8
.annotate 'line', 3623
$P1.'emit'(__ARG_1, $S7)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 3626
$P10 = $P1.'getIntegerValue'()
set $I1, $P10
set $S7, $I1
.annotate 'line', 3627
# }
__label_14: # endif
.annotate 'line', 3629
$P10 = $P2.'issimple'()
isfalse $I3, $P10
if $I3 goto __label_18
$I3 = $P2.'isidentifier'()
__label_18:
unless $I3 goto __label_16
# {
.annotate 'line', 3630
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S8, $P11
.annotate 'line', 3631
$P2.'emit'(__ARG_1, $S8)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 3634
# string type: $S9
$P11 = $P2.'checkResult'()
null $S9
if_null $P11, __label_19
set $S9, $P11
__label_19:
set $S12, $S9
set $S13, 'S'
.annotate 'line', 3635
if $S12 == $S13 goto __label_22
set $S13, 'I'
if $S12 == $S13 goto __label_23
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3637
$P13 = self.'checkResult'()
$P12 = self.'tempreg'($P13)
set $S8, $P12
.annotate 'line', 3638
$P2.'emit'(__ARG_1, $S8)
goto __label_20 # break
__label_23: # case
__label_21: # default
.annotate 'line', 3642
$P14 = $P2.'getIntegerValue'()
set $I2, $P14
set $S8, $I2
goto __label_20 # break
__label_20: # switch end
.annotate 'line', 3644
# }
__label_17: # endif
.annotate 'line', 3647
self.'annotate'(__ARG_1)
.annotate 'line', 3648
__ARG_1.'say'('mul ', __ARG_2, ', ', $S7, ', ', $S8)
# }
.annotate 'line', 3649

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3530
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3656
# Body
# {
.annotate 'line', 3658
self.'optimizearg'()
.annotate 'line', 3659
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3660
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3661
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3662
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3663
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3664
# var lval: $P3
null $P3
.annotate 'line', 3665
# var rval: $P4
null $P4
.annotate 'line', 3666
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3667
getattribute $P3, $P1, 'numval'
.annotate 'line', 3668
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3669
getattribute $P4, $P2, 'numval'
.annotate 'line', 3670
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3671
eq $I2, 0, __label_6
.annotate 'line', 3672
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
.annotate 'line', 3675
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3676
getattribute $P3, $P1, 'numval'
.annotate 'line', 3677
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3678
getattribute $P4, $P2, 'numval'
.annotate 'line', 3679
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3680
eq $N2, $N3, __label_8
.annotate 'line', 3681
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
.annotate 'line', 3685
.return(self)
# }
.annotate 'line', 3686

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3687
# Body
# {
.annotate 'line', 3689
.return('N')
# }
.annotate 'line', 3690

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3691
# Body
# {
.annotate 'line', 3693
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3694
# var lreg: $P2
null $P2
.annotate 'line', 3695
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'N', __label_0
.annotate 'line', 3696
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3698
$P2 = self.'tempreg'('N')
.annotate 'line', 3699
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3701
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3702
# var rreg: $P4
null $P4
.annotate 'line', 3703
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'N', __label_2
.annotate 'line', 3704
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3706
$P4 = self.'tempreg'('N')
.annotate 'line', 3707
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3709
self.'annotate'(__ARG_1)
.annotate 'line', 3710
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3711

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3654
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3718
# Body
# {
.annotate 'line', 3720
.return('I')
# }
.annotate 'line', 3721

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3722
# Body
# {
.annotate 'line', 3724
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3725
# var lreg: $P2
null $P2
.annotate 'line', 3726
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3727
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3729
$P2 = self.'tempreg'('I')
.annotate 'line', 3730
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3732
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3733
# var rreg: $P4
null $P4
.annotate 'line', 3734
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3735
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3737
$P4 = self.'tempreg'('I')
.annotate 'line', 3738
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3740
self.'annotate'(__ARG_1)
.annotate 'line', 3741
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3742

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3716
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3749
# Body
# {
.annotate 'line', 3751
.return('I')
# }
.annotate 'line', 3752

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3753
# Body
# {
.annotate 'line', 3755
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3756
# var lreg: $P2
null $P2
.annotate 'line', 3757
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3758
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3760
$P2 = self.'tempreg'('I')
.annotate 'line', 3761
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3763
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3764
# var rreg: $P4
null $P4
.annotate 'line', 3765
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3766
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3768
$P4 = self.'tempreg'('I')
.annotate 'line', 3769
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3771
self.'annotate'(__ARG_1)
.annotate 'line', 3776
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3777

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3747
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3786
# Body
# {
.annotate 'line', 3788
setattribute self, 'arg', __ARG_1
.annotate 'line', 3789
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3790

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3791
# Body
# {
.annotate 'line', 3793
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3794
.return(self)
# }
.annotate 'line', 3795

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3796
# Body
# {
.annotate 'line', 3798
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3799

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3784
addattribute $P0, 'arg'
.annotate 'line', 3785
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3802
# Body
# {
.annotate 'line', 3804
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3805
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3806
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3807
.return(1)
# }
.annotate 'line', 3808

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3817
# Body
# {
.annotate 'line', 3819
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3820
setattribute self, 'predef', __ARG_3
.annotate 'line', 3821
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3822

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3823
# Body
# {
.annotate 'line', 3825
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3826

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3827
# Body
# {
.annotate 'line', 3829
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3830
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3831
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3832
# var arg: $P4
null $P4
.annotate 'line', 3833
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3834
ne $I1, -1, __label_0
# {
.annotate 'line', 3835
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3836
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3837
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3841
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3842
# int i: $I3
null $I3
__label_7: # for condition
ge $I3, $I2, __label_6
# {
.annotate 'line', 3843
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3844
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3845
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3846
# string argr: $S4
null $S4
.annotate 'line', 3847
iseq $I4, $S2, $S3
if $I4 goto __label_12
iseq $I4, $S3, '?'
__label_12:
unless $I4 goto __label_10
.annotate 'line', 3848
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3850
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3851
ne $S3, 'P', __label_13
# {
.annotate 'line', 3852
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3853
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
.annotate 'line', 3858
eq $S5, '', __label_19
.annotate 'line', 3859
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3861
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3863
$P3.'push'($S4)
# }
__label_5: # for iteration
.annotate 'line', 3842
inc $I3
goto __label_7
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3866
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3867

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3812
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3814
addattribute $P0, 'predef'
.annotate 'line', 3815
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3877
# Body
# {
.annotate 'line', 3879
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3880
setattribute self, 'funref', __ARG_4
.annotate 'line', 3881
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3882
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3883
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3884
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3885
# {
.annotate 'line', 3886
# var modifier: $P2
null $P2
.annotate 'line', 3887
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3888
$P1 = __ARG_1.'get'()
.annotate 'line', 3889
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3890
$P1 = __ARG_1.'get'()
.annotate 'line', 3891
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3892
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3893
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3896
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3899
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3900
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3901
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3902
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3904

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3905
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3906
# Body
# {
.annotate 'line', 3908
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3909
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3910
'optimize_array'($P1)
.annotate 'line', 3913
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3914
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3915
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3916
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3917
if_null $P3, __label_2
# {
.annotate 'line', 3918
self.'use_predef'($S1)
.annotate 'line', 3921
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3922
if_null $P4, __label_3
# {
.annotate 'line', 3923
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3924
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3927
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
.annotate 'line', 3931
.return(self)
# }
.annotate 'line', 3932

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3933
# Body
# {
.annotate 'line', 3935
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3936
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3937
# string call: $S1
null $S1
.annotate 'line', 3938
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3939
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 3940
ne $S1, '', __label_2
# {
.annotate 'line', 3941
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, "'"
set $S1, $S0
.annotate 'line', 3942
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3946
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 3948
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3949
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 3950
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 3951
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 3952
# string reg: $S3
null $S3
.annotate 'line', 3953
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 3954
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 3955
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 3958
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 3959
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 3961
self.'annotate'(__ARG_1)
.annotate 'line', 3963
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 3964
$S9 = __ARG_2
ne $S9, '.tailcall', __label_12
.annotate 'line', 3965
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 3967
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 3970
unless $I1 goto __label_14
.annotate 'line', 3971
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 3973
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 3975
__ARG_1.'print'('(')
.annotate 'line', 3977
# string sep: $S4
set $S4, ''
.annotate 'line', 3978
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 3979
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 3980
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 3981
__ARG_1.'print'($S4, $S5)
.annotate 'line', 3982
# int isflat: $I4
null $I4
.annotate 'line', 3983
# int isnamed: $I5
null $I5
.annotate 'line', 3984
# string setname: $S6
set $S6, ''
.annotate 'line', 3985
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 3986
if_null $P6, __label_19
# {
.annotate 'line', 3987
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 3988
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 3989
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 3991
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 3993
$P15 = $P7.'numargs'()
set $I6, $P15
null $I7
if $I6 == $I7 goto __label_27
set $I7, 1
if $I6 == $I7 goto __label_28
goto __label_26
# switch
__label_27: # case
goto __label_25 # break
__label_28: # case
.annotate 'line', 3997
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 3998
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 3999
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4000
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4003
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
set $I8, $I4
set $I9, $I5
.annotate 'line', 4008
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4009
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 4010
unless $I4 goto __label_32
.annotate 'line', 4011
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 4012
unless $I5 goto __label_34
# {
.annotate 'line', 4013
__ARG_1.'print'(' :named')
.annotate 'line', 4014
eq $S6, '', __label_35
.annotate 'line', 4015
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4017
# }
__label_16: # for iteration
.annotate 'line', 3979
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4019
__ARG_1.'say'(')')
# }
.annotate 'line', 4020

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 3872
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3874
addattribute $P0, 'funref'
.annotate 'line', 3875
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4030
# Body
# {
.annotate 'line', 4032
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4033
setattribute self, 'left', __ARG_4
.annotate 'line', 4034
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4035

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 4036
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4037
# Body
# {
.annotate 'line', 4039
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4040
.return(self)
# }
.annotate 'line', 4041

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4042
# Body
# {
.annotate 'line', 4044
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4045

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4046
# Body
# {
.annotate 'line', 4048
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4049
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4050
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4051
eq $S1, 'P', __label_2
# {
.annotate 'line', 4052
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4053
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4054
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4056
.return($S2)
# }
.annotate 'line', 4057

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4058
# Body
# {
.annotate 'line', 4060
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4061
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4062
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4063
self.'annotate'(__ARG_1)
.annotate 'line', 4064
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4065
.return($S3)
# }
.annotate 'line', 4066

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4067
# Body
# {
.annotate 'line', 4069
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4070
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4071
self.'annotate'(__ARG_1)
.annotate 'line', 4072
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4073

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4074
# Body
# {
.annotate 'line', 4076
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4077
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4078
# string value: $S3
null $S3
.annotate 'line', 4079
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4081
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4082
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4083
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4085
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4088
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4089
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4091
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4092

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4093
# Body
# {
.annotate 'line', 4095
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4096
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4097
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4098
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4099
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4101
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4102
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
eq $S5, 'P', __label_6
.annotate 'line', 4103
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4105
# }
__label_4: # endif
.annotate 'line', 4107
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4108
.return($S3)
# }
.annotate 'line', 4109

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4025
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4027
addattribute $P0, 'left'
.annotate 'line', 4028
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4118
# Body
# {
.annotate 'line', 4120
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4121
setattribute self, 'left', __ARG_4
.annotate 'line', 4122
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4123

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 4124
# Body
# {
.annotate 'line', 4126
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
ne $S1, 'S', __label_0
.annotate 'line', 4127
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4129
.return('P')
__label_1: # endif
# }
.annotate 'line', 4130

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4131
# Body
# {
.annotate 'line', 4133
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4134
self.'optimizeargs'()
.annotate 'line', 4135
.return(self)
# }
.annotate 'line', 4136

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4137
# Body
# {
.annotate 'line', 4139
# var regleft: $P1
null $P1
.annotate 'line', 4140
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4141
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4143
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4144
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4145
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4146
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4147
ne $S1, 'S', __label_3
# {
.annotate 'line', 4148
eq $I1, 1, __label_5
.annotate 'line', 4149
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4150
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4153
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 4154
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4155
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4157

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4158
# Body
# {
.annotate 'line', 4160
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4161
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4162
self.'annotate'(__ARG_1)
.annotate 'line', 4163
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4164
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4165
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4166

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4167
# Body
# {
.annotate 'line', 4169
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4170
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4171
# string rreg: $S1
null $S1
.annotate 'line', 4172
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4173
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4174
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4177
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4178
self.'annotate'(__ARG_1)
.annotate 'line', 4179
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4180
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4181
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4182
.return($S1)
# }
.annotate 'line', 4183

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4114
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4116
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4192
# Body
# {
.annotate 'line', 4194
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4195
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4196
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4197
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4198
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4199
# {
.annotate 'line', 4200
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4201
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4202
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4203
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4204
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4206

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 4207
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4208
# Body
# {
.annotate 'line', 4210
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4211
.return(self)
# }
.annotate 'line', 4212

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4213
# Body
# {
.annotate 'line', 4215
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4216
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4217

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4218
# Body
# {
.annotate 'line', 4220
self.'annotate'(__ARG_1)
.annotate 'line', 4221
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4222
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4223
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4224
# string itemreg: $S3
null $S3
.annotate 'line', 4225
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 4226
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 4227
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
.annotate 'line', 4229
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 4230
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 4234
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 4236
self.'annotate'(__ARG_1)
.annotate 'line', 4237
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 4239
.return($S1)
# }
.annotate 'line', 4240

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4188
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4190
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4250
# Body
# {
.annotate 'line', 4252
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4253
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4254
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 4255
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4256
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 4257
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4258
# {
.annotate 'line', 4259
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4260
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4261
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4262
$P2.'push'($P4)
.annotate 'line', 4263
$P3.'push'($P5)
# }
.annotate 'line', 4265
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 4266
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 4267
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4269
setattribute self, 'keys', $P2
.annotate 'line', 4270
setattribute self, 'values', $P3
# }
.annotate 'line', 4271

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 4272
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4273
# Body
# {
.annotate 'line', 4275
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4276
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4277
.return(self)
# }
.annotate 'line', 4278

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4279
# Body
# {
.annotate 'line', 4281
self.'annotate'(__ARG_1)
.annotate 'line', 4282
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 4283
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4284
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4285
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4286
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4287
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4288
# string item: $S1
null $S1
.annotate 'line', 4289
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 4290
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 4291
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4292
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 4295
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4297
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4298
# string itemreg: $S3
null $S3
.annotate 'line', 4299
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4300
# string s: $S4
$P8 = $P4.'checkIdentifier'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4301
isnull $I3, $S4
not $I3
unless $I3 goto __label_11
isne $I3, $S4, ''
__label_11:
unless $I3 goto __label_9
set $S3, $S4
goto __label_10
__label_9: # else
.annotate 'line', 4302
# {
.annotate 'line', 4304
# string id: $S5
$P8 = $P4.'getName'()
null $S5
if_null $P8, __label_12
set $S5, $P8
__label_12:
.annotate 'line', 4305
getattribute $P10, self, 'owner'
$P9 = $P10.'getvar'($S5)
unless_null $P9, __label_13
# {
.annotate 'line', 4306
$P11 = self.'tempreg'('P')
set $S3, $P11
.annotate 'line', 4307
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_14
__label_13: # else
.annotate 'line', 4310
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_14: # endif
# }
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4314
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4315
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
__label_0: # for iteration
.annotate 'line', 4286
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4317

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4318
# Body
# {
.annotate 'line', 4320
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4321
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4322
.return($S1)
# }
.annotate 'line', 4323

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4245
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4247
addattribute $P0, 'keys'
.annotate 'line', 4248
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 4332
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4333
# Body
# {
.annotate 'line', 4337
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4338
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4339
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4340
__ARG_1.'unget'($P2)
.annotate 'line', 4341
# var initializer: $P3
root_new $P5, ['parrot';'ResizablePMCArray']
set $P3, $P5
__label_1: # do
.annotate 'line', 4342
# {
.annotate 'line', 4343
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4344
$P3.'push'($P4)
# }
.annotate 'line', 4345
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4346
setattribute self, 'initializer', $P3
.annotate 'line', 4347
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4349

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4328
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4330
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4358
# Body
# {
.annotate 'line', 4360
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4362
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4363
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4364
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4365
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4366
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4367
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4368
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4369
# {
.annotate 'line', 4370
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4371
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4372
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4373
$P2.'push'($P3)
# }
.annotate 'line', 4374
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4375
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4378
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4381
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4383
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4384
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4386
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4387

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4388
# Body
# {
.annotate 'line', 4390
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4391
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4394
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4395
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4396
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4397
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4398
$P1 = $P3['value']
.annotate 'line', 4399
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4400
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4401
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4404
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4408
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4409
if_null $P4, __label_7
.annotate 'line', 4410
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4411
.return(self)
# }
.annotate 'line', 4412

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4413
# Body
# {
.annotate 'line', 4415
self.'annotate'(__ARG_1)
.annotate 'line', 4417
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4418
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
# Constant BYMULTI evaluated at compile time
.annotate 'line', 4421
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4422
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4423
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
.annotate 'line', 4425
# string reginit: $S1
set $S1, ''
.annotate 'line', 4426
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4427
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4428
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4432
ne $I2, 1, __label_13
.annotate 'line', 4433
$P10 = self.'tempreg'('P')
set $S2, $P10
goto __label_14
__label_13: # else
# {
.annotate 'line', 4435
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4436
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4437
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4441
isne $I4, $I2, 1
unless $I4 goto __label_16
isne $I4, $I2, 2
__label_16:
unless $I4 goto __label_15
.annotate 'line', 4442
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_15: # endif
.annotate 'line', 4443
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_9: # switch end
set $I5, $I2
null $I6
.annotate 'line', 4446
if $I5 == $I6 goto __label_19
set $I6, 2
if $I5 == $I6 goto __label_20
set $I6, 1
if $I5 == $I6 goto __label_21
goto __label_18
# switch
__label_19: # case
.annotate 'line', 4449
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_22
set $S4, $P14
__label_22:
.annotate 'line', 4450
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4451
unless_null $P3, __label_23
concat $S6, "Can't locate class ", $S4
concat $S6, " at compile time"
.annotate 'line', 4452
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_23: # endif
.annotate 'line', 4456
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4457
le $I1, 1, __label_24
# {
.annotate 'line', 4458
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_24: # endif
goto __label_17 # break
__label_20: # case
.annotate 'line', 4462
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4463
# predefined elements
elements $I6, $P4
sub $I5, $I6, 1
$S3 = $P4[$I5]
.annotate 'line', 4464
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_17 # break
__label_21: # case
.annotate 'line', 4467
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4468
unless_null $P5, __label_25
# {
.annotate 'line', 4470
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4471
if_null $P6, __label_27
# {
.annotate 'line', 4472
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4475
'Warn'('Checking: new unknown type')
.annotate 'line', 4476
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4478
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_26
__label_25: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4482
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_17 # break
__label_18: # default
.annotate 'line', 4486
'InternalError'('Unexpected type in new')
__label_17: # switch end
.annotate 'line', 4488
isgt $I7, $I1, 1
if $I7 goto __label_30
isgt $I7, $I1, 0
unless $I7 goto __label_31
iseq $I7, $I2, 1
__label_31:
__label_30:
unless $I7 goto __label_29
# {
.annotate 'line', 4489
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4490
iter $P21, $P1
set $P21, 0
__label_32: # for iteration
unless $P21 goto __label_33
shift $P8, $P21
# {
.annotate 'line', 4491
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_34
set $S5, $P22
__label_34:
.annotate 'line', 4492
$P7.'push'($S5)
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 4494
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4495
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4496
__ARG_1.'say'(")")
.annotate 'line', 4497
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4499

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4354
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4356
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4508
# Body
# {
.annotate 'line', 4510
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4511
setattribute self, 'owner', __ARG_2
.annotate 'line', 4512
# var nskey: $P1
new $P3, [ 'ClassSpecifierParrotKey' ]
$P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4513
setattribute self, 'nskey', $P1
.annotate 'line', 4514
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4515
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4516
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4518
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4519

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4520
# Body
# {
.annotate 'line', 4522
# string reginit: $S1
null $S1
.annotate 'line', 4523
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4524
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
set $I2, $I1
null $I3
.annotate 'line', 4525
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4529
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4530
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4533
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4535
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4536
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4537
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4538
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4539
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4540
if_null $S1, __label_7
.annotate 'line', 4541
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4542
__ARG_1.'say'()
# }
.annotate 'line', 4543

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4504
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4506
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4552
# Body
# {
.annotate 'line', 4554
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4555
setattribute self, 'owner', __ARG_2
.annotate 'line', 4556
# var nskey: $P1
new $P3, [ 'ClassSpecifierId' ]
$P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4557
setattribute self, 'nskey', $P1
.annotate 'line', 4558
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4559
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4560
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4562
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4563

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4564
# Body
# {
.annotate 'line', 4566
# string reginit: $S1
null $S1
.annotate 'line', 4567
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4569
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4570
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4571
le $I1, 0, __label_3
.annotate 'line', 4572
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4573
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4574
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4575
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4576
__ARG_1.'say'()
.annotate 'line', 4578
le $I1, 0, __label_4
# {
.annotate 'line', 4579
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4580
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4581
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4582
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4584
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4585
__ARG_1.'print'($S2, ".'", $S4, "'(")
# predefined join
.annotate 'line', 4586
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4587
__ARG_1.'say'(")")
.annotate 'line', 4588
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4590

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4548
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4550
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4595
# Body
# {
.annotate 'line', 4597
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4599
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4601
new $P5, [ 'CallExpr' ]
.annotate 'line', 4602
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4601
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4604
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4606
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4608
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4611
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4612
__ARG_1.'unget'($P2)
.annotate 'line', 4613
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4615
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4619
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
.annotate 'line', 4624
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4626

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4635
# Body
# {
.annotate 'line', 4637
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4638
setattribute self, 'eleft', __ARG_3
.annotate 'line', 4639
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4640

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4641
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4642
# Body
# {
.annotate 'line', 4644
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4645
# string checkedval: $S1
null $S1
.annotate 'line', 4646
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4647
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4648
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4652
# string r: $S2
getattribute $P3, self, 'eleft'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4653
self.'annotate'(__ARG_1)
.annotate 'line', 4654
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4655

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4630
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4632
addattribute $P0, 'eleft'
.annotate 'line', 4633
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4670
# Body
# {
.annotate 'line', 4672
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4673
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4674
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4675
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4676
.return(self)
# }
.annotate 'line', 4677

.end # set


.sub 'optimize' :method

.annotate 'line', 4678
# Body
# {
.annotate 'line', 4680
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4681
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
.annotate 'line', 4683
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4685
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4687
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4688
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4689
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4691

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4692
# Body
# {
.annotate 'line', 4694
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4695

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4696
# Body
# {
.annotate 'line', 4698
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4699
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4700
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4701
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4702
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4703
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4704
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4705
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4706

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4660
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4666
addattribute $P0, 'condition'
.annotate 'line', 4667
addattribute $P0, 'etrue'
.annotate 'line', 4668
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

.annotate 'line', 4743
# Body
# {
.annotate 'line', 4745
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
.annotate 'line', 4746
.return(1)
__label_3: # case
.annotate 'line', 4747
.return(2)
__label_4: # case
.annotate 'line', 4748
.return(3)
__label_1: # default
.annotate 'line', 4749
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4751

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4753
# Body
# {
.annotate 'line', 4755
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
.annotate 'line', 4756
.return(8)
__label_3: # case
.annotate 'line', 4757
.return(11)
__label_4: # case
.annotate 'line', 4758
.return(9)
__label_5: # case
.annotate 'line', 4759
.return(10)
__label_1: # default
.annotate 'line', 4760
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4762

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4764
# Body
# {
.annotate 'line', 4766
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
.annotate 'line', 4767
.return(19)
__label_3: # case
.annotate 'line', 4768
.return(20)
__label_4: # case
.annotate 'line', 4769
.return(21)
__label_5: # case
.annotate 'line', 4770
.return(22)
__label_1: # default
.annotate 'line', 4771
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4773

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 4775
# Body
# {
.annotate 'line', 4777
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
.annotate 'line', 4778
.return(12)
__label_3: # case
.annotate 'line', 4779
.return(13)
__label_4: # case
.annotate 'line', 4780
.return(25)
__label_5: # case
.annotate 'line', 4781
.return(26)
__label_1: # default
.annotate 'line', 4783
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 4784
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 4786

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4788
# Body
# {
.annotate 'line', 4790
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
.annotate 'line', 4791
.return(14)
__label_3: # case
.annotate 'line', 4792
.return(16)
__label_4: # case
.annotate 'line', 4793
.return(15)
__label_5: # case
.annotate 'line', 4794
.return(17)
__label_1: # default
.annotate 'line', 4795
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4797

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4799
# Body
# {
.annotate 'line', 4801
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
.annotate 'line', 4802
.return(4)
__label_3: # case
.annotate 'line', 4803
.return(5)
__label_4: # case
.annotate 'line', 4804
.return(6)
__label_5: # case
.annotate 'line', 4805
.return(18)
__label_6: # case
.annotate 'line', 4806
.return(23)
__label_7: # case
.annotate 'line', 4807
.return(24)
__label_1: # default
.annotate 'line', 4808
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4810

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4812
# Body
# {
.annotate 'line', 4814
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4816
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4817
# var expr: $P2
null $P2
.annotate 'line', 4818
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4819
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4820
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4821
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4823
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4824
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4825
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4826
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4827
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4828
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4829
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4830
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4831
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4832
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4833
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4834
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4835
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4836
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 4837
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 4838
new $P15, [ 'IdentifierExpr' ]
.tailcall $P15.'set'(__ARG_2, $P1)
__label_8: # endif
.annotate 'line', 4839
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4840

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4842
# Body
# {
.annotate 'line', 4844
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4845
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4847
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4848
# var t: $P2
null $P2
.annotate 'line', 4849
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4850
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 4851
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4853
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4856
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4859
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4862
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4865
__ARG_1.'unget'($P2)
.annotate 'line', 4866
.return($P1)
# }
.annotate 'line', 4867

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4869
# Body
# {
.annotate 'line', 4871
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4873
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4874
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4875
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4876
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4877
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4878
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4881
__ARG_1.'unget'($P2)
.annotate 'line', 4882
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4884

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4886
# Body
# {
.annotate 'line', 4888
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4889
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4890
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4892
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4893
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4894
# var subexpr: $P2
null $P2
.annotate 'line', 4895
eq $I1, 0, __label_0
# {
.annotate 'line', 4896
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4897
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4898
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
.annotate 'line', 4900
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4903
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4906
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4909
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4912
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4914
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4917
__ARG_1.'unget'($P1)
.annotate 'line', 4918
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4920
.return($P2)
# }
.annotate 'line', 4921

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4923
# Body
# {
.annotate 'line', 4925
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4926
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4928
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4929
# var t: $P2
null $P2
.annotate 'line', 4930
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4931
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 4932
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4933
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4934
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
.annotate 'line', 4936
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4939
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4942
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4945
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4948
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 4950
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 4951
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4953
__ARG_1.'unget'($P2)
.annotate 'line', 4954
.return($P1)
# }
.annotate 'line', 4955

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4957
# Body
# {
.annotate 'line', 4959
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 4961
# var eleft: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4962
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 4963
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 4964
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4965
# var expr: $P4
null $P4
.annotate 'line', 4966
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 4967
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 4969
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 4970
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4972
__ARG_1.'unget'($P2)
.annotate 'line', 4973
.return($P1)
# }
.annotate 'line', 4974

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4976
# Body
# {
.annotate 'line', 4978
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 4979
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 4981
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4982
# var eright: $P2
null $P2
.annotate 'line', 4983
# var t: $P3
null $P3
.annotate 'line', 4984
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4985
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 4986
if $I2 == $I3 goto __label_4
set $I3, 13
if $I2 == $I3 goto __label_5
set $I3, 25
if $I2 == $I3 goto __label_6
set $I3, 26
if $I2 == $I3 goto __label_7
set $I3, 27
if $I2 == $I3 goto __label_8
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4988
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4989
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 4992
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4993
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 4996
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4997
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5000
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5001
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5004
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5007
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5010
__ARG_1.'unget'($P3)
.annotate 'line', 5011
.return($P1)
# }
.annotate 'line', 5012

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5014
# Body
# {
.annotate 'line', 5016
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5017
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5019
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5020
# var t: $P2
null $P2
.annotate 'line', 5021
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5022
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5023
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5024
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
.annotate 'line', 5026
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5029
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5032
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5035
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5038
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5041
__ARG_1.'unget'($P2)
.annotate 'line', 5042
.return($P1)
# }
.annotate 'line', 5043

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5045
# Body
# {
.annotate 'line', 5047
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5049
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5050
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5051
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5052
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5053
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5055
__ARG_1.'unget'($P2)
.annotate 'line', 5056
.return($P1)
# }
.annotate 'line', 5057

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5059
# Body
# {
.annotate 'line', 5061
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5063
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5064
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5065
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5066
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5067
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5069
__ARG_1.'unget'($P2)
.annotate 'line', 5070
.return($P1)
# }
.annotate 'line', 5071

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5073
# Body
# {
.annotate 'line', 5075
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5077
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5078
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5079
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5080
# var eright: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5081
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5083
__ARG_1.'unget'($P2)
.annotate 'line', 5084
.return($P1)
# }
.annotate 'line', 5085

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5087
# Body
# {
.annotate 'line', 5089
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5091
# var eleft: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5092
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5093
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5094
# var eright: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5095
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5097
__ARG_1.'unget'($P2)
.annotate 'line', 5098
.return($P1)
# }
.annotate 'line', 5099

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5101
# Body
# {
.annotate 'line', 5103
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5104
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5106
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5107
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5108
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5109
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5110
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5111
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5112
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5115
__ARG_1.'unget'($P2)
.annotate 'line', 5116
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5118

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5120
# Body
# {
.annotate 'line', 5122
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5123
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5124
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5126
# var eleft: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5127
# var t: $P2
null $P2
.annotate 'line', 5128
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5129
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5130
# var eright: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5131
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5132
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
.annotate 'line', 5134
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5137
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5140
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5143
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5146
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5149
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5152
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5154
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5155
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5157
__ARG_1.'unget'($P2)
.annotate 'line', 5158
.return($P1)
# }
.annotate 'line', 5159

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5161
# Body
# {
.annotate 'line', 5163
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5165
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5166

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5179
# Body
# {
.annotate 'line', 5181
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5182
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5183
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5184
setattribute self, 'brlabel', $P2
.annotate 'line', 5185
.return($S1)
# }
.annotate 'line', 5186

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5187
# Body
# {
.annotate 'line', 5189
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5190
unless_null $P1, __label_0
.annotate 'line', 5191
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5192
.return($P1)
# }
.annotate 'line', 5193

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5177
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5200
# Body
# {
.annotate 'line', 5202
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5203
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5204
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5205
setattribute self, 'cntlabel', $P2
.annotate 'line', 5206
.return($S1)
# }
.annotate 'line', 5207

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5208
# Body
# {
.annotate 'line', 5210
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5211
unless_null $P1, __label_0
.annotate 'line', 5212
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5213
.return($P1)
# }
.annotate 'line', 5214

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5196
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5198
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5228
# Body
# {
.annotate 'line', 5230
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5231
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5232
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 5233
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5234
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5235
# {
.annotate 'line', 5236
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5237
$P2.'push'($P3)
# }
.annotate 'line', 5238
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5240
'RequireOp'(';', $P1)
.annotate 'line', 5241
setattribute self, 'values', $P2
# }
.annotate 'line', 5242

.end # parse


.sub 'optimize' :method

.annotate 'line', 5243
# Body
# {
.annotate 'line', 5245
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5246
.return(self)
# }
.annotate 'line', 5247

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5248
# Body
# {
.annotate 'line', 5250
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 5251
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5252
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5255
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5256
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5258
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5259
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5260
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5261
self.'annotate'(__ARG_1)
.annotate 'line', 5262
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5266
# int i: $I2
null $I2
__label_7: # for condition
ge $I2, $I1, __label_6
# {
.annotate 'line', 5267
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5268
# string reg: $S1
null $S1
.annotate 'line', 5269
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5270
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5271
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5274
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 5275
$P1.'push'($S1)
# }
__label_5: # for iteration
.annotate 'line', 5266
inc $I2
goto __label_7
__label_6: # for end
.annotate 'line', 5277
self.'annotate'(__ARG_1)
.annotate 'line', 5278
self.'emitret'(__ARG_1)
.annotate 'line', 5279
# string sep: $S2
set $S2, ''
.annotate 'line', 5280
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5281
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5282
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5284
__ARG_1.'say'(')')
# }
.annotate 'line', 5285

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5224
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5226
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5290
# Body
# {
.annotate 'line', 5292
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5293

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5294
# Body
# {
.annotate 'line', 5296
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5297

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5288
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5302
# Body
# {
.annotate 'line', 5304
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5305

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5306
# Body
# {
.annotate 'line', 5308
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5309

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5300
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5320
# Body
# {
.annotate 'line', 5322
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5323
setattribute self, 'name', __ARG_1
.annotate 'line', 5324
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5325
setattribute self, 'value', $P2
.annotate 'line', 5326
.return(self)
# }
.annotate 'line', 5327

.end # set


.sub 'optimize' :method

.annotate 'line', 5328
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5329
# Body
# {
.annotate 'line', 5331
self.'annotate'(__ARG_1)
.annotate 'line', 5332
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5333
# string comment: $S2
concat $S0, 'label ', $S1
set $S2, $S0
.annotate 'line', 5334
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5335

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5316
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5318
addattribute $P0, 'name'
.annotate 'line', 5319
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5346
# Body
# {
.annotate 'line', 5348
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5349
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5350
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5351
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5352
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5353
setattribute self, 'label', $P1
.annotate 'line', 5354
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5355

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5356
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5357
# Body
# {
.annotate 'line', 5359
self.'annotate'(__ARG_1)
.annotate 'line', 5360
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5361
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5362
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5363

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5342
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5344
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5372
# Body
# {
.annotate 'line', 5374
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5375

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5376
# Body
# {
.annotate 'line', 5378
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5379
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5380
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5381

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5370
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

.annotate 'line', 5392
# Body
# {
.annotate 'line', 5394
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5395
self.'parsecondition'(__ARG_2)
.annotate 'line', 5396
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5397
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5398
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5399
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5401
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5402
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5404

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5405
# Body
# {
.annotate 'line', 5407
self.'optimize_condition'()
.annotate 'line', 5408
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5409
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5410
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5411
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5413
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5415
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5417
.return(self)
# }
.annotate 'line', 5418

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5419
# Body
# {
.annotate 'line', 5421
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5422
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5423
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5424
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5425
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5426
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5427
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5428
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5429
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5430
self.'annotate'(__ARG_1)
.annotate 'line', 5431
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5432
$P1.'emit'(__ARG_1)
.annotate 'line', 5434
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5435
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5436
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5437
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5439
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5440

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5388
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5390
addattribute $P0, 'truebranch'
.annotate 'line', 5391
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5450
# Body
# {
.annotate 'line', 5452
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5453

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5454
# Body
# {
.annotate 'line', 5456
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5457
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5459
self.'annotate'(__ARG_1)
.annotate 'line', 5460
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5461
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5462
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5463
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5464

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5447
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5449
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5473
# Body
# {
.annotate 'line', 5475
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5476
self.'parsecondition'(__ARG_2)
.annotate 'line', 5477
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5478

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5479
# Body
# {
.annotate 'line', 5481
self.'optimize_condition'()
.annotate 'line', 5482
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5483
.return(self)
# }
.annotate 'line', 5484

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5485
# Body
# {
.annotate 'line', 5487
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5489
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5492
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5495
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5496
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5498
self.'annotate'(__ARG_1)
.annotate 'line', 5499
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5500
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5501
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5502
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5503
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5505

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5471
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

.annotate 'line', 5514
# Body
# {
.annotate 'line', 5516
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5517
self.'parsebody'(__ARG_2)
.annotate 'line', 5518
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5519
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5520

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5521
# Body
# {
.annotate 'line', 5523
self.'optimize_condition'()
.annotate 'line', 5524
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5525
.return(self)
# }
.annotate 'line', 5526

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5527
# Body
# {
.annotate 'line', 5529
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5531
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5534
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5535
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5536
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5538
self.'annotate'(__ARG_1)
.annotate 'line', 5539
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5541
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5542
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5543
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5545

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5512
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

.annotate 'line', 5554
# Body
# {
.annotate 'line', 5556
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5557
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5558

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5559
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5560
# Body
# {
.annotate 'line', 5562
self.'annotate'(__ARG_1)
.annotate 'line', 5563
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5564
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5565

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5552
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5574
# Body
# {
.annotate 'line', 5576
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5577
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5578

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5579
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5580
# Body
# {
.annotate 'line', 5582
self.'annotate'(__ARG_1)
.annotate 'line', 5583
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5584
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5585

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5572
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5599
# Body
# {
.annotate 'line', 5601
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5602
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5603
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5604
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5605
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5606
$P1 = __ARG_2.'get'()
.annotate 'line', 5607
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5608
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5609
$P1 = __ARG_2.'get'()
.annotate 'line', 5610
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5611
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5612
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5613
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5614
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5615
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5616
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5617
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5618
$P1 = __ARG_2.'get'()
.annotate 'line', 5619
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5620
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5621
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5622
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
.annotate 'line', 5623
__ARG_2.'unget'($P1)
.annotate 'line', 5624
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5626
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5627
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5630
$P1 = __ARG_2.'get'()
.annotate 'line', 5631
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5632
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5633
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
.annotate 'line', 5634
__ARG_2.'unget'($P1)
.annotate 'line', 5635
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5637
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5640

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5641
# Body
# {
.annotate 'line', 5643
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5644
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5645
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5646
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5647
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5648
.return(self)
# }
.annotate 'line', 5649

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5650
# Body
# {
.annotate 'line', 5653
# string type: $S1
set $S1, ''
.annotate 'line', 5654
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5655
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5656
ne $S2, 'N', __label_3
.annotate 'line', 5657
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5658
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5660
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5661
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5664
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5665
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
ne $S9, $S1, __label_8
.annotate 'line', 5666
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5668
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5669
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5673
self.'genbreaklabel'()
.annotate 'line', 5674
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5675
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5676
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5677
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5678
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5679
$P2.'push'($S7)
.annotate 'line', 5680
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5681
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5683
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5686
__ARG_1.'comment'('switch')
.annotate 'line', 5687
self.'annotate'(__ARG_1)
.annotate 'line', 5688
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5689
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5690
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 5691
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5692
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5693
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5694
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5695
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 5690
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 5698
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5699
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5700
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5702
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5703

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5592
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5594
addattribute $P0, 'condition'
.annotate 'line', 5595
addattribute $P0, 'case_value'
.annotate 'line', 5596
addattribute $P0, 'case_st'
.annotate 'line', 5597
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5715
# Body
# {
.annotate 'line', 5717
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5718
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5719
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5720
__ARG_2.'unget'($P1)
.annotate 'line', 5721
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5723
$P1 = __ARG_2.'get'()
.annotate 'line', 5724
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5725
__ARG_2.'unget'($P1)
.annotate 'line', 5726
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 5727
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5729
$P1 = __ARG_2.'get'()
.annotate 'line', 5730
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5731
__ARG_2.'unget'($P1)
.annotate 'line', 5732
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 5733
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5735
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5736

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5737
# Body
# {
.annotate 'line', 5739
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 5740
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5741
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 5742
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 5743
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 5744
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 5745
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5746
.return(self)
# }
.annotate 'line', 5747

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5748
# Body
# {
.annotate 'line', 5750
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5751
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5752
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5753
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5754
.return()
# }
__label_0: # endif
.annotate 'line', 5756
__ARG_1.'comment'('for loop')
.annotate 'line', 5757
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5758
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5759
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5760
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 5761
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5763
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5764
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 5765
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 5767
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5768
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5769
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 5770
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 5771
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5773
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5774

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5710
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 5712
addattribute $P0, 'initializer'
.annotate 'line', 5713
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5786
# Body
# {
.annotate 'line', 5788
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5789
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5790
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5791
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5792
eq $S2, '', __label_2
# {
.annotate 'line', 5793
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5795
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5797
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5798
setattribute self, 'varname', $P1
.annotate 'line', 5799
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5800
$P2 = __ARG_2.'get'()
.annotate 'line', 5801
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5802
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5803
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5804

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5805
# Body
# {
.annotate 'line', 5807
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 5808
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
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
# string regcont: $S1
null $S1
.annotate 'line', 5815
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 5816
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5817
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5818
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5821
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5822
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5823
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5824
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5825
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5826
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5827
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5828
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5829
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5830
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5831
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5832
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5833
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5834

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5781
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5783
addattribute $P0, 'varname'
.annotate 'line', 5784
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5839
# Body
# {
.annotate 'line', 5841
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5842
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5843
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5844
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5845
__ARG_2.'unget'($P3)
.annotate 'line', 5846
__ARG_2.'unget'($P2)
.annotate 'line', 5847
__ARG_2.'unget'($P1)
.annotate 'line', 5848
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5849
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5851
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5852

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5862
# Body
# {
.annotate 'line', 5864
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5865
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5866

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5867
# Body
# {
.annotate 'line', 5869
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5870
.return(self)
# }
.annotate 'line', 5871

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5872
# Body
# {
.annotate 'line', 5874
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5875
self.'annotate'(__ARG_1)
.annotate 'line', 5876
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5877

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5858
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5860
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5891
# Body
# {
.annotate 'line', 5893
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5894
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5895
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5896
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5899
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5901
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5902
$P1 = __ARG_2.'get'()
.annotate 'line', 5903
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5904
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5905
$P1 = __ARG_2.'get'()
.annotate 'line', 5906
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5907
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5908
$P1 = __ARG_2.'get'()
.annotate 'line', 5909
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5910
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5911
setattribute self, 'exname', $P1
.annotate 'line', 5912
self.'createvar'($S1, 'P')
.annotate 'line', 5913
$P1 = __ARG_2.'get'()
.annotate 'line', 5914
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5915
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5917
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5918

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5919
# Body
# {
.annotate 'line', 5921
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 5922
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5923
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5924
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 5925
.return(self)
# }
.annotate 'line', 5926

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5927
# Body
# {
.annotate 'line', 5929
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5930
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5931
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5932
# string exreg: $S4
null $S4
.annotate 'line', 5933
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 5934
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5935
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5938
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5940
self.'annotate'(__ARG_1)
.annotate 'line', 5941
__ARG_1.'comment'('try: create handler')
.annotate 'line', 5943
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 5944
__ARG_1.'say'('set_addr ', $S1, ', ', $S2)
.annotate 'line', 5946
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 5947
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 5948
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 5949
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 5950
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 5951
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 5954
eq $I1, 1, __label_14
.annotate 'line', 5955
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 5956
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 5957
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 5958
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 5961
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 5962
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 5963
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 5964
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
__label_16: # for iteration
.annotate 'line', 5962
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 5966
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 5967
# string sep: $S7
set $S7, ''
.annotate 'line', 5968
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 5969
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 5970
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 5972
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 5975
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 5980
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 5981
__ARG_1.'comment'('try: begin')
.annotate 'line', 5982
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 5983
__ARG_1.'comment'('try: end')
.annotate 'line', 5985
self.'annotate'(__ARG_1)
.annotate 'line', 5986
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5988
__ARG_1.'comment'('catch')
.annotate 'line', 5989
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5990
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 5991
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 5992
__ARG_1.'say'('pop_eh')
.annotate 'line', 5993
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 5995
__ARG_1.'comment'('catch end')
.annotate 'line', 5996
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 5997

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 5884
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 5886
addattribute $P0, 'stry'
.annotate 'line', 5887
addattribute $P0, 'modifiers'
.annotate 'line', 5888
addattribute $P0, 'exname'
.annotate 'line', 5889
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6008
# Body
# {
.annotate 'line', 6010
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6011
setattribute self, 'name', __ARG_3
.annotate 'line', 6012
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 6013
setattribute self, 'reg', $P2
# }
.annotate 'line', 6014

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6004
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6006
addattribute $P0, 'name'
.annotate 'line', 6007
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6031
# Body
# {
.annotate 'line', 6033
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6034
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6035
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6036
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6037
setattribute self, 'name', $P1
.annotate 'line', 6038
# string reg: $S1
null $S1
.annotate 'line', 6040
$P1 = __ARG_2.'get'()
.annotate 'line', 6041
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 6043
setattribute self, 'typearray', $P5
.annotate 'line', 6044
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 6045
$P1 = __ARG_2.'get'()
.annotate 'line', 6046
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 6048
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6051
__ARG_2.'unget'($P1)
.annotate 'line', 6052
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 6053
$P1 = __ARG_2.'get'()
.annotate 'line', 6054
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 6055
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6056
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 6061
setattribute self, 'typearray', $P8
.annotate 'line', 6062
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 6063
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 6065
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 6066
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6070
setattribute self, 'reg', $P11
.annotate 'line', 6071
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6073
$P1 = __ARG_2.'get'()
.annotate 'line', 6074
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 6075
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6076
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 6077
$P1 = __ARG_2.'get'()
.annotate 'line', 6078
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 6079
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6080
# {
.annotate 'line', 6081
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6082
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 6083
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 6084
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 6085
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6087
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6089
$P16 = $P1.'isop'(';')
isfalse $I3, $P16
unless $I3 goto __label_14
.annotate 'line', 6090
'SyntaxError'("Expected ';'", $P1)
__label_14: # endif
# }
.annotate 'line', 6091

.end # parse


.sub 'optimize' :method

.annotate 'line', 6092
# Body
# {
.annotate 'line', 6094
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6095
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6096
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6097
if_null $P1, __label_1
# {
.annotate 'line', 6098
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6099
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6101
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6103
.return(self)
# }
.annotate 'line', 6104

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6105
# Body
# {
.annotate 'line', 6107
self.'annotate'(__ARG_1)
.annotate 'line', 6108
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6109
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6110
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6111
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6112
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S2
concat $S10, ': '
concat $S10, $S3
.annotate 'line', 6113
__ARG_1.'comment'($S10)
.annotate 'line', 6115
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6116
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6117
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6119
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6120
ne $S5, $S4, __label_10
# {
.annotate 'line', 6121
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6124
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_12
# {
.annotate 'line', 6126
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 6129
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 6130
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6131
iseq $I4, $S4, 'S'
unless $I4 goto __label_17
iseq $I4, $S5, 'P'
__label_17:
unless $I4 goto __label_15
# {
.annotate 'line', 6132
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 6133
__ARG_1.'emitnull'($S3)
.annotate 'line', 6134
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6135
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6136
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 6139
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
.annotate 'line', 6145
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6146
if_null $P2, __label_19
# {
.annotate 'line', 6148
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 6149
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 6153
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 6155
if_null $P1, __label_22
# {
.annotate 'line', 6156
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 6157
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6158
unless_null $P2, __label_24
# {
.annotate 'line', 6159
le $I1, 0, __label_25
# {
.annotate 'line', 6161
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 6164
# int i: $I2
null $I2
.annotate 'line', 6165
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 6166
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6167
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6168
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6172

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6173
# Body
# {
.annotate 'line', 6175
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6176

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6021
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6023
addattribute $P0, 'name'
.annotate 'line', 6024
addattribute $P0, 't_reg'
.annotate 'line', 6025
addattribute $P0, 't_name'
.annotate 'line', 6026
addattribute $P0, 't_array'
.annotate 'line', 6027
addattribute $P0, 'reg'
.annotate 'line', 6028
addattribute $P0, 'typearray'
.annotate 'line', 6029
addattribute $P0, 'size'
.annotate 'line', 6030
addattribute $P0, 'init'
.end
.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6189
# Body
# {
.annotate 'line', 6192
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6193
setattribute self, 'type', $P1
.annotate 'line', 6194
setattribute self, 'name', __ARG_4
.annotate 'line', 6195
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6196

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6197
# Body
# {
.annotate 'line', 6199
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6200
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6201
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6202
$P1 = $P1.'optimize'()
.annotate 'line', 6203
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6205
getattribute $P4, self, 'start'
.annotate 'line', 6204
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6207
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6208
setattribute self, 'value', $P1
.annotate 'line', 6209
.return(self)
# }
.annotate 'line', 6210

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 6211
# Body
# {
.annotate 'line', 6213
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6214

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6215
# Body
# {
.annotate 'line', 6217
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, ' evaluated at compile time'
.annotate 'line', 6218
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6219

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6183
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6185
addattribute $P0, 'type'
.annotate 'line', 6186
addattribute $P0, 'name'
.annotate 'line', 6187
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6222
# Body
# {
.annotate 'line', 6224
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6225
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6226
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6227
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6229
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6230
# {
.annotate 'line', 6231
$P1 = __ARG_2.'get'()
.annotate 'line', 6232
# var name: $P3
set $P3, $P1
.annotate 'line', 6233
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6234
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6236
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6235
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6237
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6238
.return($P2)
# }
.annotate 'line', 6239

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6248
# Body
# {
.annotate 'line', 6250
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6251
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6252
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6253
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6254
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6256
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6257
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6258

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6259
# Body
# {
.annotate 'line', 6261
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6262
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6263
.return(self)
# }
.annotate 'line', 6264

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6265
# Body
# {
.annotate 'line', 6267
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6268

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6269
# Body
# {
.annotate 'line', 6271
self.'annotate'(__ARG_1)
.annotate 'line', 6272
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6273
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6274
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, ': '
concat $S5, $S2
.annotate 'line', 6275
__ARG_1.'comment'($S5)
.annotate 'line', 6276
if_null $P1, __label_2
.annotate 'line', 6277
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6279
if_null $P1, __label_4
# {
.annotate 'line', 6280
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6281
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
.annotate 'line', 6283
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6288
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 6289
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 6290
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6293
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6297
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6298

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6245
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6247
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6303
# Body
# {
.annotate 'line', 6305
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6306
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6307
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6308
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6309

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6310
# Body
# {
.annotate 'line', 6312
self.'annotate'(__ARG_1)
.annotate 'line', 6313
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6314
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, '[] : '
concat $S3, $S2
.annotate 'line', 6315
__ARG_1.'comment'($S3)
.annotate 'line', 6316
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6317

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6301
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6324
# Body
# {
.annotate 'line', 6326
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6327
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6328
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6329
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6330
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6331
$P1 = __ARG_2.'get'()
.annotate 'line', 6332
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6333
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6334

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6335
# Body
# {
.annotate 'line', 6337
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6338
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6339

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6340
# Body
# {
.annotate 'line', 6342
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6343
self.'annotate'(__ARG_1)
.annotate 'line', 6344
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6345
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, '[] : '
concat $S4, $S3
.annotate 'line', 6346
__ARG_1.'comment'($S4)
.annotate 'line', 6347
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6348

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6320
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6322
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6351
# Body
# {
.annotate 'line', 6353
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6354
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6355
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6356
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6357
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6358
$P2 = __ARG_2.'get'()
.annotate 'line', 6359
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6360
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6362
__ARG_2.'unget'($P2)
.annotate 'line', 6363
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
.annotate 'line', 6367
__ARG_2.'unget'($P2)
.annotate 'line', 6368
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6370

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6378
# Body
# {
box $P1, 'S'
.annotate 'line', 6380
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6381
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6382
setattribute self, 't_array', $P2
.annotate 'line', 6383
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6384

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6385
# Body
# {
.annotate 'line', 6387
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6388

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6376
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6397
# Body
# {
box $P1, 'I'
.annotate 'line', 6399
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6400
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6401
setattribute self, 't_array', $P2
.annotate 'line', 6402
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6403

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6404
# Body
# {
.annotate 'line', 6406
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6407

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6395
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6416
# Body
# {
box $P1, 'N'
.annotate 'line', 6418
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6419
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6420
setattribute self, 't_array', $P2
.annotate 'line', 6421
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6422

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6423
# Body
# {
.annotate 'line', 6425
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6426

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6414
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6440
# Body
# {
.annotate 'line', 6442
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6443
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6444
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6445
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6446
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6447
__ARG_2.'unget'($P1)
.annotate 'line', 6448
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6449
unless_null $P2, __label_2
.annotate 'line', 6450
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6451
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6453
setattribute self, 'end', $P1
# }
.annotate 'line', 6454

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6455
# Body
# {
.annotate 'line', 6457
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6458
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6459
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6460
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6461
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6462
.return($S2)
# }
.annotate 'line', 6463

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6464
# Body
# {
.annotate 'line', 6466
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6467
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6468
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6469
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6470
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6471
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6472
$P1[$S1] = $S3
.annotate 'line', 6473
.return($S3)
# }
.annotate 'line', 6474

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6475
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6476
# Body
# {
.annotate 'line', 6478
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6479
.return(self)
# }
.annotate 'line', 6480

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6481
# Body
# {
.annotate 'line', 6483
__ARG_1.'comment'('{')
.annotate 'line', 6484
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6485
$P1.'emit'(__ARG_1)
.annotate 'line', 6486
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6488
__ARG_1.'comment'('}')
# }
.annotate 'line', 6489

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6433
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6435
addattribute $P0, 'statements'
.annotate 'line', 6436
addattribute $P0, 'end'
.annotate 'line', 6437
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6502
# Body
# {
box $P3, 1
.annotate 'line', 6505
setattribute self, 'nreg', $P3
.annotate 'line', 6506
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6507
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6508
setattribute self, 'tempreg', $P1
.annotate 'line', 6509
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6510

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6511
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6513
setattribute self, 'type', $P1
.annotate 'line', 6514
.return(self)
# }
.annotate 'line', 6515

.end # settype


.sub 'createreg' :method

.annotate 'line', 6516
# Body
# {
.annotate 'line', 6518
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6519
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6520
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6522
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S1
set $S1, $S0
.annotate 'line', 6524
.return($S1)
# }
.annotate 'line', 6525

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6526
# Body
# {
.annotate 'line', 6528
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6529
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6530
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6531
# string reg: $S1
null $S1
.annotate 'line', 6532
le $I1, 0, __label_0
.annotate 'line', 6533
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6535
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6536
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6538
.return($S1)
# }
.annotate 'line', 6539

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6540
# Body
# {
.annotate 'line', 6542
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6543
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6544
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6545
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6546

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6498
addattribute $P0, 'type'
.annotate 'line', 6499
addattribute $P0, 'nreg'
.annotate 'line', 6500
addattribute $P0, 'tempreg'
.annotate 'line', 6501
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6571
# Body
# {
.annotate 'line', 6573
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6574
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6575
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6576
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6577
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6578

.end # init


.sub 'getouter' :method

.annotate 'line', 6580
# Body
# {
.return(self)
# }

.end # getouter


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6581
# Body
# {
.annotate 'line', 6583
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6584
.return($I1)
# }
.annotate 'line', 6585

.end # same_scope_as


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6586
# Body
# {
.annotate 'line', 6588
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 6589
unless_null $P1, __label_0
# {
.annotate 'line', 6590
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6591
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6593
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6594

.end # setlex


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6595
# Body
# {
.annotate 'line', 6597
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 6598
unless_null $P1, __label_0
# {
.annotate 'line', 6599
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6600
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6602
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6603

.end # setusedlex


.sub 'createlex' :method
.param string __ARG_1

.annotate 'line', 6604
# Body
# {
.annotate 'line', 6606
# string lexname: $S1
# predefined substr
substr $S2, __ARG_1, 1
concat $S0, '__WLEX_', $S2
set $S1, $S0
.annotate 'line', 6607
self.'setlex'($S1, __ARG_1)
.annotate 'line', 6608
.return($S1)
# }
.annotate 'line', 6609

.end # createlex


.sub 'ismethod' :method

.annotate 'line', 6611
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6612
# Body
# {
.annotate 'line', 6614
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6615
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
.annotate 'line', 6617
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6619
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6621
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6623
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6625
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6627
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6628
.return($S1)
# }
.annotate 'line', 6629

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6630
# Body
# {
.annotate 'line', 6632
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6633
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
.annotate 'line', 6635
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6637
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6639
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6641
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6643
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6645
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6646
.return($S1)
# }
.annotate 'line', 6647

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6648
# Body
# {
.annotate 'line', 6650
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
.annotate 'line', 6651
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6652

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6653
# Body
# {
.annotate 'line', 6655
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6656
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6657
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6659
.return($S1)
# }
.annotate 'line', 6660

.end # genlabel


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6661
# Body
# {
.annotate 'line', 6663
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6664
unless_null $P1, __label_0
.annotate 'line', 6665
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6667
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6668

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6670
# Body
# {
.annotate 'line', 6672
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6673
.return(self)
# }
.annotate 'line', 6674

.end # optimize


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6676
# Body
# {
.annotate 'line', 6678
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 6679
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6680
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 6681
__ARG_1.'unget'($P1)
.annotate 'line', 6682
# int argnum: $I1
null $I1
__label_1: # do
.annotate 'line', 6683
# {
.annotate 'line', 6684
$P1 = __ARG_1.'get'()
.annotate 'line', 6685
# string type: $S1
$P6 = $P1.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6686
eq $S1, '', __label_5
.annotate 'line', 6687
$P1 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6690
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S0, '__ARG_', $S4
set $S2, $S0
.annotate 'line', 6691
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6693
# string varname: $S3
set $P7, $P1
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6694
# var arg: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 6695
$P2['name'] = $S3
.annotate 'line', 6696
$P1 = __ARG_1.'get'()
.annotate 'line', 6697
$P7 = $P1.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6698
# var modifiers: $P3
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, self)
set $P3, $P8
.annotate 'line', 6699
$P2['modifiers'] = $P3
.annotate 'line', 6700
$P1 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6702
getattribute $P8, self, 'args'
$P8.'push'($P2)
# }
.annotate 'line', 6703
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 6704
$P9 = $P1.'isop'(')')
isfalse $I2, $P9
unless $I2 goto __label_9
.annotate 'line', 6705
'SyntaxError'("Expected ')'", $P1)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6707

.end # parse_parameters


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6709
# Body
# {
.annotate 'line', 6711
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6712
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6713
setattribute self, 'name', $P1
box $P3, 0
.annotate 'line', 6714
setattribute self, 'isanon', $P3
.annotate 'line', 6715
$P1 = __ARG_2.'get'()
.annotate 'line', 6716
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6717
# var modifiers: $P2
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 6718
setattribute self, 'modifiers', $P2
.annotate 'line', 6719
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6721
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 6722
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6723
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6725
$P1 = __ARG_2.'get'()
.annotate 'line', 6726
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_2
.annotate 'line', 6727
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 6728
new $P8, [ 'CompoundStatement' ]
$P8.'CompoundStatement'($P1, __ARG_2, self)
set $P7, $P8
setattribute self, 'body', $P7
.annotate 'line', 6729
.return(self)
# }
.annotate 'line', 6730

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6731
# Body
# {
.annotate 'line', 6733
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 6734
__ARG_1.'say'()
.annotate 'line', 6735
__ARG_1.'print'(".sub ")
.annotate 'line', 6736
getattribute $P19, self, 'isanon'
isfalse $I5, $P19
unless $I5 goto __label_1
.annotate 'line', 6737
__ARG_1.'print'("'", $S1, "'")
goto __label_2
__label_1: # else
.annotate 'line', 6739
__ARG_1.'print'("'' :anon")
__label_2: # endif
.annotate 'line', 6740
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 6741
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 6742
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 6743
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 6744
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 6745
if_null $P2, __label_5
.annotate 'line', 6746
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 6750
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 6751
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 6752
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 6753
if_null $P3, __label_7
# {
.annotate 'line', 6754
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 6755
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 6756
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 6757
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 6758
le $I1, 0, __label_11
# {
.annotate 'line', 6759
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6760
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 6761
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 6762
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 6763
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 6764
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 6760
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 6766
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
.annotate 'line', 6771
ne $S1, 'main', __label_16
.annotate 'line', 6772
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 6774
__ARG_1.'say'()
.annotate 'line', 6776
# var args: $P7
getattribute $P7, self, 'args'
.annotate 'line', 6777
# var arg: $P8
null $P8
.annotate 'line', 6778
# string argname: $S2
null $S2
.annotate 'line', 6779
# var a: $P9
null $P9
.annotate 'line', 6781
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 6782
$S2 = $P8['name']
.annotate 'line', 6783
$P9 = self.'getvar'($S2)
.annotate 'line', 6784
# string ptype: $S3
$P27 = $P9['type']
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
$P27 = $P9['reg']
.annotate 'line', 6785
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 6786
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 6787
if_null $P10, __label_20
# {
.annotate 'line', 6788
# var named: $P11
null $P11
.annotate 'line', 6789
# var slurpy: $P12
null $P12
.annotate 'line', 6790
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 6791
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 6792
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 6793
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
.annotate 'line', 6801
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 6804
isnull $I6, $P11
not $I6
unless $I6 goto __label_30
isnull $I6, $P12
not $I6
__label_30:
unless $I6 goto __label_28
# {
.annotate 'line', 6809
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 6812
if_null $P11, __label_31
# {
.annotate 'line', 6813
# string setname: $S5
null $S5
.annotate 'line', 6814
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 6815
if $I6 == $I7 goto __label_35
set $I7, 1
if $I6 == $I7 goto __label_36
goto __label_34
# switch
__label_35: # case
concat $S0, "'", $S2
concat $S0, "'"
set $S5, $S0
goto __label_33 # break
__label_36: # case
.annotate 'line', 6820
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 6821
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 6822
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 6823
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 6826
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 6828
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 6830
if_null $P12, __label_38
# {
.annotate 'line', 6831
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 6835
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 6837
__ARG_1.'say'()
.annotate 'line', 6838
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 6841
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 6842
if_null $P16, __label_39
# {
.annotate 'line', 6844
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
$P31 = $P16[$S6]
.annotate 'line', 6845
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 6848
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 6849
if_null $P16, __label_42
# {
.annotate 'line', 6851
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
$P32 = $P16[$S7]
.annotate 'line', 6852
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 6855
__ARG_1.'comment'('Body')
.annotate 'line', 6856
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 6858
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 6859
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 6862
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 6863
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 6865
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I7, $P17
ge $I4, $I7, __label_47
# {
.annotate 'line', 6866
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 6867
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 6865
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 6870

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6871
# Body
# {
.annotate 'line', 6873
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6874

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6875
# Body
# {
.annotate 'line', 6877
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6878

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6553
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6555
addattribute $P0, 'name'
.annotate 'line', 6556
addattribute $P0, 'subid'
.annotate 'line', 6557
addattribute $P0, 'isanon'
.annotate 'line', 6558
addattribute $P0, 'modifiers'
.annotate 'line', 6559
addattribute $P0, 'args'
.annotate 'line', 6560
addattribute $P0, 'body'
.annotate 'line', 6561
addattribute $P0, 'regstI'
.annotate 'line', 6562
addattribute $P0, 'regstN'
.annotate 'line', 6563
addattribute $P0, 'regstS'
.annotate 'line', 6564
addattribute $P0, 'regstP'
.annotate 'line', 6565
addattribute $P0, 'nlabel'
.annotate 'line', 6566
addattribute $P0, 'localfun'
.annotate 'line', 6567
addattribute $P0, 'lexicals'
.annotate 'line', 6568
addattribute $P0, 'usedlexicals'
.annotate 'line', 6569
addattribute $P0, 'outer'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6887
# Body
# {
.annotate 'line', 6889
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6890
$P3 = __ARG_3.'getouter'()
setattribute self, 'outer', $P3
.annotate 'line', 6891
# string subid: $S1
$P2 = __ARG_3.'createsubid'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6892
getattribute $P3, self, 'outer'
$P5 = __ARG_3.'createsubid'()
setattribute $P3, 'subid', $P5
box $P4, $S1
.annotate 'line', 6893
setattribute self, 'subid', $P4
box $P5, $S1
.annotate 'line', 6894
setattribute self, 'name', $P5
box $P6, 1
.annotate 'line', 6895
setattribute self, 'isanon', $P6
.annotate 'line', 6896
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6897
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6898
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_1
.annotate 'line', 6899
'Expected'('{', $P1)
__label_1: # endif
.annotate 'line', 6900
new $P9, [ 'CompoundStatement' ]
$P9.'CompoundStatement'($P1, __ARG_2, self)
set $P8, $P9
setattribute self, 'body', $P8
.annotate 'line', 6901
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 6902

.end # LocalFunctionStatement


.sub 'getsubid' :method

.annotate 'line', 6903
# Body
# {
.annotate 'line', 6905
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 6906

.end # getsubid


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 6907
# Body
# {
.annotate 'line', 6909
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 6910
unless_null $P1, __label_0
# {
.annotate 'line', 6913
getattribute $P8, self, 'owner'
$P1 = $P8.'getvar'(__ARG_1)
.annotate 'line', 6914
unless_null $P1, __label_1
# {
.annotate 'line', 6916
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 6917
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 6918
getattribute $P9, self, 'outer'
$P8 = $P9.'ismethod'()
if_null $P8, __label_4
unless $P8 goto __label_4
# {
.annotate 'line', 6919
# string lexself: $S1
$P10 = $P2.'makelexicalself'()
null $S1
if_null $P10, __label_5
set $S1, $P10
__label_5:
.annotate 'line', 6920
# var r2: $P3
$P3 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 6921
# string reg: $S2
set $P9, $P3
null $S2
if_null $P9, __label_6
set $S2, $P9
__label_6:
.annotate 'line', 6922
self.'setusedlex'($S1, $S2)
set $P1, $P3
.annotate 'line', 6923
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 6927
$P10 = $P1['type']
$S5 = $P10
iseq $I1, $S5, 'P'
unless $I1 goto __label_8
$P11 = $P1['const']
isfalse $I1, $P11
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 6928
# var scope: $P4
$P4 = $P1['scope']
.annotate 'line', 6929
# var ownerscope: $P5
$P5 = $P4.'getouter'()
.annotate 'line', 6930
# var outer: $P6
getattribute $P6, self, 'outer'
.annotate 'line', 6931
isa $I1, $P5, 'FunctionStatement'
unless $I1 goto __label_9
# {
.annotate 'line', 6932
$P11 = $P5.'same_scope_as'($P6)
if_null $P11, __label_10
unless $P11 goto __label_10
# {
.annotate 'line', 6933
# string lexname: $S3
$P12 = $P4.'makelexical'($P1)
null $S3
if_null $P12, __label_11
set $S3, $P12
__label_11:
.annotate 'line', 6934
# var r2: $P7
$P7 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 6935
# string reg: $S4
set $P12, $P7
null $S4
if_null $P12, __label_12
set $S4, $P12
__label_12:
.annotate 'line', 6936
self.'setusedlex'($S3, $S4)
set $P1, $P7
.annotate 'line', 6937
# }
__label_10: # endif
# }
__label_9: # endif
# }
__label_7: # endif
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 6942
.return($P1)
# }
.annotate 'line', 6943

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 6885
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 6952
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 6950
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

.annotate 'line', 6969
# Body
# {
.annotate 'line', 6971
setattribute self, 'owner', __ARG_1
.annotate 'line', 6972
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 6973

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 6974
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 6976
# Body
# {
.annotate 'line', 6978
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 6979

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 6967
addattribute $P0, 'owner'
.annotate 'line', 6968
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6985
# Body
# {
.annotate 'line', 6987
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 6988
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 6989

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 6990
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6992
# Body
# {
.annotate 'line', 6994
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6995
__ARG_1.'print'($S1)
# }
.annotate 'line', 6996

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 6982
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 6984
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7003
# Body
# {
.annotate 'line', 7005
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7006
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 7007
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7008
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7009
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7010
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7011
$P2 = __ARG_1.'get'()
.annotate 'line', 7012
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_1
# {
.annotate 'line', 7013
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
.annotate 'line', 7015
setattribute self, 'hll', $P7
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7019
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7021
# {
.annotate 'line', 7022
$P2 = __ARG_1.'get'()
.annotate 'line', 7023
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7024
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7025
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7026
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7027
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_10
.annotate 'line', 7028
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7030
setattribute self, 'key', $P1
# }
.annotate 'line', 7031

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7032
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7033
# Body
# {
.annotate 'line', 7035
getattribute $P1, self, 'hll'
isnull $I2, $P1
not $I2
# predefined int
$I1 = $I2
.return($I1)
# }
.annotate 'line', 7036

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7038
# Body
# {
.annotate 'line', 7040
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7041

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 6999
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7001
addattribute $P0, 'key'
.annotate 'line', 7002
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7047
# Body
# {
.annotate 'line', 7049
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7050
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
$S1 = __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 7051
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7052
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7053
$P2 = __ARG_1.'get'()
# predefined string
.annotate 'line', 7054
$S1 = $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7056
__ARG_1.'unget'($P2)
.annotate 'line', 7057
setattribute self, 'key', $P1
# }
.annotate 'line', 7058

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7059
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7061
# Body
# {
.annotate 'line', 7063
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7064
.return($P2)
# }
.annotate 'line', 7065

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7067
# Body
# {
.annotate 'line', 7069
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7070
unless_null $P1, __label_0
# {
.annotate 'line', 7071
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7072
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7074
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7075

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7044
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7046
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7078
# Body
# {
.annotate 'line', 7080
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7081
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7082
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7083
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7084
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7085
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7086
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7087
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7088

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7105
# Body
# {
.annotate 'line', 7107
setattribute self, 'parent', __ARG_2
.annotate 'line', 7108
setattribute self, 'owner', __ARG_2
.annotate 'line', 7109
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7110
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7111
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7112
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7114
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7115
setattribute self, 'name', $P1
.annotate 'line', 7116
$P1 = __ARG_1.'get'()
.annotate 'line', 7117
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7118
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7119
# {
.annotate 'line', 7120
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7121
$P2.'push'($P3)
.annotate 'line', 7122
$P1 = __ARG_1.'get'()
.annotate 'line', 7123
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
.annotate 'line', 7126
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7127
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7128
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7129
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7130
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7131
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 7132
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7133
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7135
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7136
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7137
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7138
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7139
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7140
$P1 = __ARG_1.'get'()
.annotate 'line', 7141
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 7142
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7144
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7145
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7146
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7147
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7150
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7151
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7153
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 7154
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7155
setattribute self, 'classns', $P9
# }
.annotate 'line', 7156

.end # ClassStatement


.sub 'createsubid' :method

.annotate 'line', 7157
# Body
# {
.annotate 'line', 7159
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7160

.end # createsubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7161
# Body
# {
.annotate 'line', 7163
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7164

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7165
# Body
# {
.annotate 'line', 7167
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7168

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7169
# Body
# {
.annotate 'line', 7171
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7172

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7173
# Body
# {
.annotate 'line', 7175
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7176
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7177
.return(self)
# }
.annotate 'line', 7178

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7179
# Body
# {
.annotate 'line', 7181
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7182

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7183
# Body
# {
.annotate 'line', 7185
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7186
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7187
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7188
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7190
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7192
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7193
# int n: $I1
set $I1, 1
.annotate 'line', 7194
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7195
$P3.'annotate'(__ARG_1)
.annotate 'line', 7196
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 7197
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7198
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7199
__ARG_1.'say'()
.annotate 'line', 7200
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7202
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7203
__ARG_1.'annotate'($P4)
.annotate 'line', 7204
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7207
__ARG_1.'say'('.end')
# }
.annotate 'line', 7208

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7094
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7096
addattribute $P0, 'parent'
.annotate 'line', 7097
addattribute $P0, 'owner'
.annotate 'line', 7098
addattribute $P0, 'name'
.annotate 'line', 7099
addattribute $P0, 'bases'
.annotate 'line', 7100
addattribute $P0, 'constants'
.annotate 'line', 7101
addattribute $P0, 'functions'
.annotate 'line', 7102
addattribute $P0, 'members'
.annotate 'line', 7103
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7215
# Body
# {
.annotate 'line', 7217
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7218
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7219
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7220
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7221
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7222
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7227
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7228
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7229
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7230
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7231
# string filepath: $S3
concat $S0, $S2, $S1
set $S3, $S0
.annotate 'line', 7232
# try: create handler
new $P11, 'ExceptionHandler'
set_addr $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7233
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7234
# }
# try: end
goto __label_5
.annotate 'line', 7232
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
.annotate 'line', 7239
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7240
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7245
load_bytecode 'PGE.pbc'
.annotate 'line', 7246
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7247
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7249
# string line: $S4
$P12 = $P5.'readline'()
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
__label_9: # for condition
$P13 = $P5.'eof'()
isfalse $I2, $P13
unless $I2 goto __label_8
# {
.annotate 'line', 7250
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7251
$P8 = $P7($S4)
.annotate 'line', 7252
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7253
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7254
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7255
# int ivalue: $I1
null $I1
.annotate 'line', 7256
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7257
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7262
$P15 = 'newTokenFrom'(5, $S5, __ARG_1)
.annotate 'line', 7261
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7260
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7249
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7266
$P5.'close'()
# }
.annotate 'line', 7267

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7279
# Body
# {
.annotate 'line', 7281
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7282
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7283
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7284
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7285

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7286
# Body
# {
.annotate 'line', 7288
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7289
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7290
getattribute $P4, $P2, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7291
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7292
.return($P4)
# }
.annotate 'line', 7293

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7294
# Body
# {
# predefined elements
.annotate 'line', 7298
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 7300
.return($P5)
__label_3: # case
.annotate 'line', 7303
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7308
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7309
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7310
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7311
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7312
getattribute $P9, $P3, 'name'
$S2 = $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7314
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7315
if_null $P4, __label_8
.annotate 'line', 7316
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7320
.return($P5)
# }
.annotate 'line', 7321

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7322
# Body
# {
.annotate 'line', 7324
# int balance1: $I1
null $I1
.annotate 'line', 7325
# int balance2: $I2
null $I2
.annotate 'line', 7326
# int balance3: $I3
null $I3
.annotate 'line', 7327
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7328
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7330
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7332
# var start: $P2
set $P2, $P1
.annotate 'line', 7333
$P1 = __ARG_1.'get'()
.annotate 'line', 7334
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7335
$P1 = __ARG_1.'get'()
.annotate 'line', 7337
# var modifier: $P3
null $P3
.annotate 'line', 7338
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7339
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7340
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7343
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7344
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7345
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 7346
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 7347
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7348
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7350
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 7351
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7352
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7354
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 7355
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 7356
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7357
$P7.'push'($P6)
.annotate 'line', 7358
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7360
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 7361
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 7362
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7363
$P9.'push'($P8)
.annotate 'line', 7364
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7366
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 7367
$P1 = __ARG_1.'get'()
.annotate 'line', 7368
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 7369
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7370
$P1 = __ARG_1.'get'()
.annotate 'line', 7371
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 7372
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7373
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 7374
self.'addlib'($S2)
.annotate 'line', 7375
$P1 = __ARG_1.'get'()
.annotate 'line', 7376
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7378
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 7379
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7381
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 7382
$P1 = __ARG_1.'get'()
.annotate 'line', 7383
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 7384
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7385
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 7386
self.'addload'($S3)
.annotate 'line', 7387
$P1 = __ARG_1.'get'()
.annotate 'line', 7388
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7390
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 7391
self.'close_ns'($P1)
.annotate 'line', 7392
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7395
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
.annotate 'line', 7397
self.'unclosed_ns'()
# }
.annotate 'line', 7398

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7399
# Body
# {
.annotate 'line', 7401
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7402

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7403
# Body
# {
.annotate 'line', 7405
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7406
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7408
# int activate: $I1
set $I1, 1
.annotate 'line', 7409
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7410
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7411
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 7414
unless $I1 goto __label_6
# {
.annotate 'line', 7415
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7416
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7418
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7420

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7271
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7273
addattribute $P0, 'namespaces'
.annotate 'line', 7274
addattribute $P0, 'classes'
.annotate 'line', 7275
addattribute $P0, 'functions'
.annotate 'line', 7276
addattribute $P0, 'items'
.annotate 'line', 7277
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7435
# Body
# {
.annotate 'line', 7438
setattribute self, 'parent', __ARG_1
.annotate 'line', 7439
setattribute self, 'start', __ARG_2
.annotate 'line', 7440
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7441
setattribute self, 'name', $P2
.annotate 'line', 7442
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7443
if_null __ARG_4, __label_0
# {
.annotate 'line', 7444
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7445
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7447

.end # NamespaceStatement


.sub 'createsubid' :method

.annotate 'line', 7448
# Body
# {
.annotate 'line', 7450
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7451

.end # createsubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7452
# Body
# {
.annotate 'line', 7454
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7455

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7456
# Body
# {
.annotate 'line', 7458
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7459
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7460
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7461
.return($P1)
# }
.annotate 'line', 7462

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7463
# Body
# {
.annotate 'line', 7465
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7466

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7467
# Body
# {
.annotate 'line', 7469
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7470

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7471
# Body
# {
.annotate 'line', 7473
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7474
unless_null $P1, __label_0
.annotate 'line', 7475
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7477
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7478

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7479
# Body
# {
.annotate 'line', 7483
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7484
unless_null $P1, __label_0
.annotate 'line', 7485
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7486
.return($P1)
# }
.annotate 'line', 7487

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7488
# Body
# {
.annotate 'line', 7490
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7491

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7492
# Body
# {
# }
.annotate 'line', 7495

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7496
# Body
# {
.annotate 'line', 7498
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7499
if_null $P1, __label_0
# {
.annotate 'line', 7500
$P1 = $P1.'optimize'()
.annotate 'line', 7501
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7503
self.'optimize_base'()
.annotate 'line', 7504
.return(self)
# }
.annotate 'line', 7505

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7506
# Body
# {
.annotate 'line', 7508
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7509
if_null $P1, __label_0
.annotate 'line', 7510
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7512
self.'emit_base'(__ARG_1)
.annotate 'line', 7514
if_null $P1, __label_1
.annotate 'line', 7515
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7516

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7427
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7429
addattribute $P0, 'parent'
.annotate 'line', 7430
addattribute $P0, 'start'
.annotate 'line', 7431
addattribute $P0, 'name'
.annotate 'line', 7432
addattribute $P0, 'modifier'
.annotate 'line', 7433
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7530
# Body
# {
.annotate 'line', 7532
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7533
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7534

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7535
# Body
# {
.annotate 'line', 7537
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7538
$P1[__ARG_1] = 1
# }
.annotate 'line', 7539

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7540
# Body
# {
.annotate 'line', 7542
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7543
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7544

.end # predef_is_used


.sub 'createsubid' :method

.annotate 'line', 7546
# Body
# {
.annotate 'line', 7548
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7549
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7550
inc $I1
assign $P1, $I1
.annotate 'line', 7552
# string id: $S1
# predefined string
$S2 = $I1
concat $S0, 'WSubId_', $S2
set $S1, $S0
.annotate 'line', 7553
.return($S1)
# }
.annotate 'line', 7554

.end # createsubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7556
# Body
# {
.annotate 'line', 7558
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7559
unless_null $P1, __label_0
# {
.annotate 'line', 7560
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7561
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7563
$P1[__ARG_1] = 1
# }
.annotate 'line', 7564

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7565
# Body
# {
.annotate 'line', 7567
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7568
unless_null $P1, __label_0
# {
.annotate 'line', 7569
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7570
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7572
$P1[__ARG_1] = 1
# }
.annotate 'line', 7573

.end # addload


.sub 'getpath' :method

.annotate 'line', 7574
# Body
# {
.annotate 'line', 7576
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7577
.return($P1)
# }
.annotate 'line', 7578

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7579
# Body
# {
.annotate 'line', 7581
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7582

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7583
# Body
# {
.annotate 'line', 7586
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7587

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7588
# Body
# {
# }
.annotate 'line', 7591

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7592
# Body
# {
.annotate 'line', 7594
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7595

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7596
# Body
# {
.annotate 'line', 7598
self.'optimize_base'()
.annotate 'line', 7599
.return(self)
# }
.annotate 'line', 7600

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7601
# Body
# {
.annotate 'line', 7603
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7606
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 7607
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 7610
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
.annotate 'line', 7613
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7614
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 7615
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7616
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7619
# int somelib: $I1
null $I1
.annotate 'line', 7620
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7621
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 7623
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7624
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7627
# int someload: $I2
null $I2
.annotate 'line', 7628
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7629
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 7631
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7632
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7633
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7634
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 7636
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 7637
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7639
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7640

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7523
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7525
addattribute $P0, 'predefs_used'
.annotate 'line', 7526
addattribute $P0, 'libs'
.annotate 'line', 7527
addattribute $P0, 'loads'
.annotate 'line', 7528
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7652
# Body
# {
.annotate 'line', 7654
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7657
# var taux: $P2
$P2 = 'newToken'(4, 'predefconst', 0, '__predefconst__')
.annotate 'line', 7661
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7660
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7659
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7665
$P4 = 'newTokenFrom'(5, 'false', $P2)
.annotate 'line', 7664
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 7663
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 7671
new $P6, [ 'StringLiteral' ]
# predefined int
.annotate 'line', 7672
$I2 = "2"
add $I1, $I2, 1
# predefined string
$S1 = $I1
$P7 = 'newTokenFrom'(2, $S1, $P2)
$P6.'StringLiteral'($P1, $P7)
set $P5, $P6
.annotate 'line', 7670
$P1.'createconst'('__STAGE__', 'S', $P5, '')
.annotate 'line', 7675
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7676

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7677
# Body
# {
.annotate 'line', 7679
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7680

.end # parse


.sub 'optimize' :method

.annotate 'line', 7681
# Body
# {
.annotate 'line', 7683
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7684

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7685
# Body
# {
.annotate 'line', 7687
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7688
__ARG_1.'say'('')
.annotate 'line', 7690
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7692
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7693

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7651
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7700
# Body
# {
.annotate 'line', 7702
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 7704
$P1.'open'('__eval__', 'w')
.annotate 'line', 7705
$P1.'puts'(__ARG_1)
.annotate 'line', 7706
$P1.'close'()
.annotate 'line', 7707
$P1.'open'('__eval__', 'r')
.annotate 'line', 7708
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7709
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7710
$P3.'parse'($P2)
.annotate 'line', 7711
$P1.'close'()
.annotate 'line', 7712
$P3.'optimize'()
.annotate 'line', 7713
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7714
$P4.'open'('__eval__', 'w')
.annotate 'line', 7715
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7716
$P5.'initialize'($P4)
.annotate 'line', 7717
$P3.'emit'($P5)
.annotate 'line', 7718
$P5.'close'()
.annotate 'line', 7719
$P4.'close'()
.annotate 'line', 7720
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7721
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7722
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7723
.return($P7)
# }
.annotate 'line', 7724

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7725
# Body
# {
.annotate 'line', 7727
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7728
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7729
$P1.'encoding'('utf8')
.annotate 'line', 7730
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7731
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7732
$P3.'parse'($P2)
.annotate 'line', 7733
$P1.'close'()
.annotate 'line', 7734
$P3.'optimize'()
.annotate 'line', 7735
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7736
$P4.'initialize'(__ARG_2)
.annotate 'line', 7737
$P3.'emit'($P4)
.annotate 'line', 7738
$P4.'close'()
# }
.annotate 'line', 7739

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7740
# Body
# {
.annotate 'line', 7742
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7743
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7744
$P1.'encoding'('utf8')
.annotate 'line', 7745
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7746
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7747
$P3.'parse'($P2)
.annotate 'line', 7748
$P1.'close'()
.annotate 'line', 7749
$P3.'optimize'()
.annotate 'line', 7750
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7751
$P4.'open'('__eval__', 'w')
.annotate 'line', 7752
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7753
$P5.'initialize'($P4)
.annotate 'line', 7754
$P3.'emit'($P5)
.annotate 'line', 7755
$P5.'close'()
.annotate 'line', 7756
$P4.'close'()
.annotate 'line', 7757
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7758
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7759
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7760
.return($P7)
# }
.annotate 'line', 7761

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7766
# Body
# {
.annotate 'line', 7768
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7769
$P1.'parse'(__ARG_1)
.annotate 'line', 7771
$P1.'optimize'()
.annotate 'line', 7773
# var handle: $P2
null $P2
.annotate 'line', 7774
ne __ARG_2, '-', __label_0
.annotate 'line', 7775
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 7777
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7778
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 7779
$P3.'initialize'($P2)
.annotate 'line', 7780
$P1.'emit'($P3)
.annotate 'line', 7781
$P3.'close'()
.annotate 'line', 7782
$P2.'close'()
# }
.annotate 'line', 7783

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7789
# Body
# {
.annotate 'line', 7791
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7792
compreg 'winxed', $P1
# }
.annotate 'line', 7793

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7795
# Body
# {
.annotate 'line', 7797
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7798
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 7799
$P1.'notOptStop'(1)
.annotate 'line', 7800
$P1.'push_string'('o=s')
.annotate 'line', 7801
$P1.'push_string'('e=s')
.annotate 'line', 7802
$P1.'push_string'('c')
.annotate 'line', 7803
$P1.'push_string'('noan')
.annotate 'line', 7805
__ARG_1.'shift'()
.annotate 'line', 7806
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7807
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7808
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7809
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7810
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7812
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7813
# string filename: $S1
null $S1
.annotate 'line', 7814
# string expr: $S2
null $S2
.annotate 'line', 7815
# var file: $P7
null $P7
.annotate 'line', 7816
unless_null $P4, __label_0
# {
.annotate 'line', 7817
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 7818
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7820
$S1 = __ARG_1[0]
.annotate 'line', 7821
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7822
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, ';}'
set $S2, $S0
.annotate 'line', 7827
new $P7, [ 'StringHandle' ]
.annotate 'line', 7828
$P7.'open'('__eval__', 'w')
.annotate 'line', 7829
$P7.'puts'($S2)
.annotate 'line', 7830
$P7.'close'()
.annotate 'line', 7831
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7834
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7836
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7837
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7839
'winxed_parser'($P8, $S3)
.annotate 'line', 7841
$P7.'close'()
# }
.annotate 'line', 7842

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7844
# Body
# {
.annotate 'line', 7846
# try: create handler
new $P6, 'ExceptionHandler'
set_addr $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7852
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7846
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7855
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7856
print 'Error: '
say $S1
.annotate 'line', 7857
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7858
# int i: $I1
set $I1, 1
.annotate 'line', 7859
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7860
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7861
# string subname: $S2
null $S2
.annotate 'line', 7862
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 7864
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7865
isne $I3, $S3, ''
unless $I3 goto __label_7
isne $I3, $S3, 'parrot'
__label_7:
unless $I3 goto __label_6
concat $S0, $S3, '.'
concat $S0, $S2
set $S2, $S0
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 7867
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7868
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7869
eq $S4, '', __label_8
# {
.annotate 'line', 7870
# int line: $I2
$I2 = $P5['line']
set $I4, $I1
.annotate 'line', 7871
inc $I1
mul $I3, 2, $I4
repeat $S5, ' ', $I3
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
.annotate 'line', 7875

.end # main

# End generated code
