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
.annotate 'line', 18
# predefined indexof
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
.annotate 'line', 33
# predefined indexof
.annotate 'line', 30
index $I2, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_", __ARG_1
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
.annotate 'line', 42
# predefined indexof
.annotate 'line', 38
index $I2, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789", __ARG_1
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
.annotate 'line', 72
concat $S0, __ARG_1, ' near '
concat $S0, $S0, $S1
set __ARG_1, $S0
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
concat $S3, __ARG_1, ' in '
concat $S3, $S3, $S2
concat $S3, $S3, ' line '
concat $S3, $S3, $S1
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
$P2 = __ARG_2.'viewable'()
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
.annotate 'line', 92
# string m: $S4
concat $S4, __ARG_1, ' in '
concat $S4, $S4, $S2
concat $S4, $S4, ' line '
concat $S4, $S4, $S1
concat $S4, $S4, ' near '
concat $S4, $S4, $S3
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
.annotate 'line', 99
concat $S1, "Expected ", __ARG_1
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 100

.end # Expected


.sub 'ExpectedIdentifier'
.param pmc __ARG_1

.annotate 'line', 102
# Body
# {
.annotate 'line', 104
'SyntaxError'("Expected identifier", __ARG_1)
# }
.annotate 'line', 105

.end # ExpectedIdentifier


.sub 'ExpectedOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 107
# Body
# {
.annotate 'line', 109
concat $S1, "Expected '", __ARG_1
concat $S1, $S1, "'"
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 110

.end # ExpectedOp


.sub 'RequireOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 112
# Body
# {
.annotate 'line', 114
$P1 = __ARG_2.'isop'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 115
'ExpectedOp'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 116

.end # RequireOp


.sub 'RequireKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 118
# Body
# {
.annotate 'line', 120
$P1 = __ARG_2.'iskeyword'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 121
'ExpectedOp'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 122

.end # RequireKeyword


.sub 'RequireIdentifier'
.param pmc __ARG_1

.annotate 'line', 124
# Body
# {
.annotate 'line', 126
$P1 = __ARG_1.'isidentifier'()
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 127
'ExpectedIdentifier'(__ARG_1)
__label_0: # endif
# }
.annotate 'line', 128

.end # RequireIdentifier


.sub 'ExpectOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 130
# Body
# {
.annotate 'line', 132
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 133
'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 134

.end # ExpectOp


.sub 'ExpectKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 136
# Body
# {
.annotate 'line', 138
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 139
'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 140

.end # ExpectKeyword

.namespace [ 'Token' ]

.sub 'Token' :method
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 150
# Body
# {
.annotate 'line', 152
box $P1, __ARG_1
setattribute self, 'file', $P1
.annotate 'line', 153
box $P1, __ARG_2
setattribute self, 'line', $P1
# }
.annotate 'line', 154

.end # Token


.sub 'get_bool' :method :vtable

.annotate 'line', 155
# Body
# {
.annotate 'line', 157
.return(1)
# }
.annotate 'line', 158

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 159
# Body
# {
.annotate 'line', 161
.return(1)
# }
.annotate 'line', 162

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 164
# Body
# {
.return(0)
# }

.end # iseof


.sub 'iscomment' :method

.annotate 'line', 165
# Body
# {
.return(0)
# }

.end # iscomment


.sub 'isidentifier' :method

.annotate 'line', 166
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isint' :method

.annotate 'line', 167
# Body
# {
.return(0)
# }

.end # isint


.sub 'isfloat' :method

.annotate 'line', 168
# Body
# {
.return(0)
# }

.end # isfloat


.sub 'isstring' :method

.annotate 'line', 169
# Body
# {
.return(0)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 171
# Body
# {
.annotate 'line', 173
'InternalError'('Not a literal string', self)
# }
.annotate 'line', 174

.end # rawstring


.sub 'getidentifier' :method

.annotate 'line', 175
# Body
# {
.annotate 'line', 177
'ExpectedIdentifier'(self)
# }
.annotate 'line', 178

.end # getidentifier


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 179
# Body
# {
.return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method

.annotate 'line', 180
# Body
# {
.return(0)
# }

.end # checkkeyword


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 181
# Body
# {
.return(0)
# }

.end # isop


.sub 'checkop' :method

.annotate 'line', 182
# Body
# {
.return('')
# }

.end # checkop


.sub 'viewable' :method

.annotate 'line', 183
# Body
# {
.return('(unknown)')
# }

.end # viewable


.sub 'show' :method

.annotate 'line', 184
# Body
# {
.annotate 'line', 186
# string r: $S1
$P1 = self.'viewable'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 187
# predefined string
getattribute $P1, self, 'file'
set $S2, $P1
# predefined string
getattribute $P2, self, 'line'
set $S3, $P2
concat $S4, $S1, ' at '
concat $S4, $S4, $S2
concat $S4, $S4, ' line '
concat $S4, $S4, $S3
.return($S4)
# }
.annotate 'line', 188

.end # show

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Token' ]
.annotate 'line', 148
addattribute $P0, 'file'
.annotate 'line', 149
addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
.param string __ARG_1

.annotate 'line', 193
# Body
# {
.annotate 'line', 195
self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 196

.end # TokenEof


.sub 'get_bool' :method :vtable

.annotate 'line', 197
# Body
# {
.annotate 'line', 199
.return(0)
# }
.annotate 'line', 200

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 201
# Body
# {
.annotate 'line', 203
.return(0)
# }
.annotate 'line', 204

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 205
# Body
# {
.return(1)
# }

.end # iseof


.sub 'viewable' :method

.annotate 'line', 206
# Body
# {
.return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenEof' ]
.annotate 'line', 191
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 212
# Body
# {
.annotate 'line', 214
self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 215
box $P1, __ARG_3
setattribute self, 'str', $P1
# }
.annotate 'line', 216

.end # TokenWithVal


.sub 'get_string' :method :vtable

.annotate 'line', 217
# Body
# {
getattribute $P1, self, 'str'
.return($P1)
# }

.end # get_string


.sub 'viewable' :method

.annotate 'line', 218
# Body
# {
.annotate 'line', 220
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 221

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 209
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.annotate 'line', 211
addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 226
# Body
# {
.annotate 'line', 228
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 229

.end # TokenComment


.sub 'iscomment' :method

.annotate 'line', 230
# Body
# {
.return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenComment' ]
.annotate 'line', 224
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 235
# Body
# {
.annotate 'line', 237
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 238

.end # TokenOp


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 239
# Body
# {
.annotate 'line', 241
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 242

.end # isop


.sub 'checkop' :method

.annotate 'line', 243
# Body
# {
# predefined string
.annotate 'line', 245
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 246

.end # checkop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenOp' ]
.annotate 'line', 233
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 251
# Body
# {
.annotate 'line', 253
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 254

.end # TokenIdentifier


.sub 'isidentifier' :method

.annotate 'line', 255
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method

.annotate 'line', 256
# Body
# {
.annotate 'line', 258
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 259

.end # getidentifier


.sub 'checkkeyword' :method

.annotate 'line', 260
# Body
# {
# predefined string
.annotate 'line', 262
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 263

.end # checkkeyword


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 264
# Body
# {
.annotate 'line', 266
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 267

.end # iskeyword

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 249
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method

.annotate 'line', 272
# Body
# {
.return(1)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 273
# Body
# {
.annotate 'line', 275
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 276

.end # rawstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenString' ]
.annotate 'line', 270
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 281
# Body
# {
.annotate 'line', 283
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 284

.end # TokenQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 285
# Body
# {
# predefined string
.annotate 'line', 287
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, $S2, '"'
.return($S2)
# }
.annotate 'line', 288

.end # get_string


.sub 'viewable' :method

.annotate 'line', 289
# Body
# {
# predefined string
.annotate 'line', 291
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, $S2, '"'
.return($S2)
# }
.annotate 'line', 292

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 279
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 297
# Body
# {
.annotate 'line', 299
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 300

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 301
# Body
# {
# predefined string
.annotate 'line', 303
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, $S2, "'"
.return($S2)
# }
.annotate 'line', 304

.end # get_string


.sub 'viewable' :method

.annotate 'line', 305
# Body
# {
# predefined string
.annotate 'line', 307
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, $S2, "'"
.return($S2)
# }
.annotate 'line', 308

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 295
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 313
# Body
# {
.annotate 'line', 315
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 316

.end # TokenInteger


.sub 'isint' :method

.annotate 'line', 317
# Body
# {
.return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 311
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 322
# Body
# {
.annotate 'line', 324
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 325

.end # TokenFloat


.sub 'isfloat' :method

.annotate 'line', 326
# Body
# {
.return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 320
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 334
# Body
# {
.annotate 'line', 336
# string s: $S1
set $S1, ''
.annotate 'line', 337
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 338
eq $S2, '"', __label_1
# {
.annotate 'line', 339
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 340
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 342
ne $S2, '\', __label_5
# {
.annotate 'line', 343
# string c2: $S3
$P1 = __ARG_1.'getchar'()
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 344
iseq $I1, $S3, ''
if $I1 goto __label_9
iseq $I1, $S3, "\n"
__label_9:
unless $I1 goto __label_8
.annotate 'line', 345
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_8: # endif
.annotate 'line', 346
concat $S1, $S1, $S2
concat $S1, $S1, $S3
# }
goto __label_6
__label_5: # else
.annotate 'line', 349
concat $S1, $S1, $S2
__label_6: # endif
.annotate 'line', 350
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 352
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenQuoted'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 353

.end # getquoted


.sub 'getsinglequoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 355
# Body
# {
.annotate 'line', 357
# string s: $S1
set $S1, ''
.annotate 'line', 358
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 359
eq $S2, "'", __label_1
# {
.annotate 'line', 360
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 361
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 362
concat $S1, $S1, $S2
.annotate 'line', 363
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 365
new $P2, [ 'TokenSingleQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 366

.end # getsinglequoted


.sub 'getheredoc'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 368
# Body
# {
.annotate 'line', 370
# string mark: $S1
set $S1, ''
.annotate 'line', 371
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 372
isne $I1, $S2, "\n"
unless $I1 goto __label_3
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 375
set $S5, $S2
set $S6, '"'
if $S5 == $S6 goto __label_6
set $S6, '\'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
.annotate 'line', 377
set $S2, '\"'
goto __label_4 # break
__label_7: # case
.annotate 'line', 380
set $S2, '\\'
goto __label_4 # break
__label_5: # default
__label_4: # switch end
.annotate 'line', 383
concat $S0, $S1, $S2
set $S1, $S0
.annotate 'line', 384
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 386
ne $S2, '', __label_8
.annotate 'line', 387
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_8: # endif
.annotate 'line', 388
concat $S0, $S1, ':>>'
set $S1, $S0
.annotate 'line', 390
# string content: $S3
set $S3, ''
.annotate 'line', 391
# string line: $S4
null $S4
__label_9: # do
.annotate 'line', 392
# {
.annotate 'line', 393
set $S4, ''
.annotate 'line', 394
$P1 = __ARG_1.'getchar'()
set $S2, $P1
__label_13: # while
.annotate 'line', 395
isne $I1, $S2, "\n"
unless $I1 goto __label_14
isne $I1, $S2, ''
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 396
set $S5, $S2
set $S6, '"'
if $S5 == $S6 goto __label_17
set $S6, '\'
if $S5 == $S6 goto __label_18
goto __label_16
# switch
__label_17: # case
.annotate 'line', 398
set $S2, '\"'
goto __label_15 # break
__label_18: # case
.annotate 'line', 401
set $S2, '\\'
goto __label_15 # break
__label_16: # default
__label_15: # switch end
.annotate 'line', 404
concat $S4, $S4, $S2
.annotate 'line', 405
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_13
__label_12: # endwhile
.annotate 'line', 407
ne $S2, '', __label_19
.annotate 'line', 408
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_19: # endif
.annotate 'line', 409
eq $S4, $S1, __label_20
.annotate 'line', 410
concat $S3, $S3, $S4
concat $S3, $S3, '\n'
__label_20: # endif
# }
__label_11: # continue
.annotate 'line', 411
ne $S4, $S1, __label_9
__label_10: # enddo
.annotate 'line', 412
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenQuoted'($P3, __ARG_3, $S3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 413

.end # getheredoc


.sub 'getident'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 415
# Body
# {
.annotate 'line', 417
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 418
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 419
$P1 = 'isident'($S2)
if_null $P1, __label_1
unless $P1 goto __label_1
# {
.annotate 'line', 420
concat $S1, $S1, $S2
.annotate 'line', 421
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 423
__ARG_1.'ungetchar'($S2)
.annotate 'line', 424
new $P2, [ 'TokenIdentifier' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenIdentifier'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 425

.end # getident


.sub 'getnumber'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 427
# Body
# {
.annotate 'line', 429
# string s: $S1
null $S1
.annotate 'line', 430
# string c: $S2
set $S2, __ARG_2
__label_0: # do
.annotate 'line', 431
# {
.annotate 'line', 432
concat $S1, $S1, $S2
.annotate 'line', 433
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_2: # continue
.annotate 'line', 434
$P1 = 'isdigit'($S2)
if_null $P1, __label_1
if $P1 goto __label_0
__label_1: # enddo
.annotate 'line', 435
iseq $I3, $S1, '0'
unless $I3 goto __label_4
iseq $I3, $S2, 'x'
if $I3 goto __label_5
iseq $I3, $S2, 'X'
__label_5:
__label_4:
unless $I3 goto __label_3
# {
.annotate 'line', 436
# int hexval: $I1
null $I1
# int h: $I2
null $I2
.annotate 'line', 437
$P1 = __ARG_1.'getchar'()
set $S2, $P1
__label_7: # while
.annotate 'line', 438
$P1 = 'hexdigit'($S2)
set $I2, $P1
lt $I2, 0, __label_6
# {
.annotate 'line', 439
mul $I3, $I1, 16
add $I1, $I3, $I2
.annotate 'line', 440
concat $S1, $S1, $S2
.annotate 'line', 441
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_7
__label_6: # endwhile
.annotate 'line', 443
__ARG_1.'ungetchar'($S2)
.annotate 'line', 444
set $S1, $I1
.annotate 'line', 445
new $P2, [ 'TokenInteger' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenInteger'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
__label_3: # endif
.annotate 'line', 447
ne $S2, '.', __label_8
# {
__label_10: # do
.annotate 'line', 448
# {
.annotate 'line', 449
concat $S1, $S1, $S2
.annotate 'line', 450
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_12: # continue
.annotate 'line', 451
$P1 = 'isdigit'($S2)
if_null $P1, __label_11
if $P1 goto __label_10
__label_11: # enddo
.annotate 'line', 452
iseq $I3, $S2, 'e'
if $I3 goto __label_14
iseq $I3, $S2, 'E'
__label_14:
unless $I3 goto __label_13
# {
.annotate 'line', 453
concat $S1, $S1, 'E'
.annotate 'line', 454
$P1 = __ARG_1.'getchar'()
set $S2, $P1
iseq $I3, $S2, '+'
if $I3 goto __label_16
iseq $I3, $S2, '-'
__label_16:
unless $I3 goto __label_15
# {
.annotate 'line', 455
concat $S1, $S1, $S2
.annotate 'line', 456
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_15: # endif
__label_18: # while
.annotate 'line', 458
$P1 = 'isdigit'($S2)
if_null $P1, __label_17
unless $P1 goto __label_17
# {
.annotate 'line', 459
concat $S1, $S1, $S2
.annotate 'line', 460
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_18
__label_17: # endwhile
# }
__label_13: # endif
.annotate 'line', 463
__ARG_1.'ungetchar'($S2)
.annotate 'line', 464
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenFloat'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 467
iseq $I3, $S2, 'e'
if $I3 goto __label_21
iseq $I3, $S2, 'E'
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 468
concat $S1, $S1, 'E'
.annotate 'line', 469
$P1 = __ARG_1.'getchar'()
set $S2, $P1
iseq $I3, $S2, '+'
if $I3 goto __label_23
iseq $I3, $S2, '-'
__label_23:
unless $I3 goto __label_22
# {
.annotate 'line', 470
concat $S1, $S1, $S2
.annotate 'line', 471
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_22: # endif
__label_25: # while
.annotate 'line', 473
$P1 = 'isdigit'($S2)
if_null $P1, __label_24
unless $P1 goto __label_24
# {
.annotate 'line', 474
concat $S1, $S1, $S2
.annotate 'line', 475
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_25
__label_24: # endwhile
.annotate 'line', 477
__ARG_1.'ungetchar'($S2)
.annotate 'line', 478
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenFloat'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 481
__ARG_1.'ungetchar'($S2)
.annotate 'line', 482
new $P2, [ 'TokenInteger' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenInteger'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
__label_20: # endif
# }
__label_9: # endif
# }
.annotate 'line', 485

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 487
# Body
# {
.annotate 'line', 489
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 490
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 491
isne $I1, $S2, ''
unless $I1 goto __label_3
isne $I1, $S2, "\n"
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 492
concat $S1, $S1, $S2
.annotate 'line', 493
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 495
new $P2, [ 'TokenComment' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenComment'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 496

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 498
# Body
# {
.annotate 'line', 500
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 501
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_1: # do
.annotate 'line', 502
# {
__label_5: # while
.annotate 'line', 503
isne $I1, $S2, ''
unless $I1 goto __label_6
isne $I1, $S2, '*'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 504
concat $S1, $S1, $S2
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_5
__label_4: # endwhile
.annotate 'line', 505
ne $S2, '', __label_7
.annotate 'line', 506
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_7: # endif
.annotate 'line', 507
concat $S1, $S1, $S2
.annotate 'line', 508
$P1 = __ARG_1.'getchar'()
set $S2, $P1
.annotate 'line', 509
ne $S2, '', __label_8
.annotate 'line', 510
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_8: # endif
# }
__label_3: # continue
.annotate 'line', 511
ne $S2, '/', __label_1
__label_2: # enddo
.annotate 'line', 512
concat $S1, $S1, '/'
.annotate 'line', 513
new $P2, [ 'TokenComment' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenComment'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 514

.end # getcomment


.sub 'getop'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 516
# Body
# {
.annotate 'line', 518
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 519
new $P2, [ 'TokenOp' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenOp'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 520

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 534
# Body
# {
.annotate 'line', 536
.const 'Sub' $P2 = 'getop'
.annotate 'line', 538
setattribute self, 'h', __ARG_1
.annotate 'line', 539
box $P3, ''
setattribute self, 'pending', $P3
.annotate 'line', 540
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'stacked', $P4
.annotate 'line', 541
box $P3, __ARG_2
setattribute self, 'filename', $P3
.annotate 'line', 542
box $P3, 1
setattribute self, 'line', $P3
.annotate 'line', 543
# var select: $P1
root_new $P1, ['parrot';'Hash']
.annotate 'line', 544
root_new $P3, ['parrot';'Hash']
get_hll_global $P4, 'getident'
$P3[''] = $P4
$P3['{'] = $P2
$P1['$'] = $P3
get_hll_global $P5, 'getquoted'
$P1['"'] = $P5
get_hll_global $P6, 'getsinglequoted'
$P1["'"] = $P6
.annotate 'line', 547
root_new $P7, ['parrot';'Hash']
.annotate 'line', 548
root_new $P8, ['parrot';'Hash']
$P8[''] = $P2
$P8['='] = $P2
$P7['='] = $P8
$P7[':'] = $P2
$P1['='] = $P7
.annotate 'line', 551
root_new $P9, ['parrot';'Hash']
$P9['+'] = $P2
$P9['='] = $P2
$P1['+'] = $P9
.annotate 'line', 552
root_new $P10, ['parrot';'Hash']
$P10['-'] = $P2
$P10['='] = $P2
$P1['-'] = $P10
.annotate 'line', 553
root_new $P11, ['parrot';'Hash']
$P11['='] = $P2
$P1['*'] = $P11
.annotate 'line', 554
root_new $P12, ['parrot';'Hash']
$P12['|'] = $P2
$P1['|'] = $P12
.annotate 'line', 555
root_new $P13, ['parrot';'Hash']
$P13['&'] = $P2
$P1['&'] = $P13
.annotate 'line', 556
root_new $P14, ['parrot';'Hash']
.annotate 'line', 557
root_new $P15, ['parrot';'Hash']
$P15[''] = $P2
get_hll_global $P16, 'getheredoc'
$P15[':'] = $P16
$P14['<'] = $P15
$P14['='] = $P2
$P1['<'] = $P14
.annotate 'line', 560
root_new $P17, ['parrot';'Hash']
$P17['>'] = $P2
$P17['='] = $P2
$P1['>'] = $P17
.annotate 'line', 561
root_new $P18, ['parrot';'Hash']
.annotate 'line', 562
root_new $P19, ['parrot';'Hash']
$P19[''] = $P2
$P19['='] = $P2
$P18['='] = $P19
$P1['!'] = $P18
.annotate 'line', 564
root_new $P20, ['parrot';'Hash']
$P20['%'] = $P2
$P20['='] = $P2
$P1['%'] = $P20
.annotate 'line', 565
root_new $P21, ['parrot';'Hash']
$P21['='] = $P2
get_hll_global $P22, 'getlinecomment'
$P21['/'] = $P22
get_hll_global $P23, 'getcomment'
$P21['*'] = $P23
$P1['/'] = $P21
get_hll_global $P24, 'getlinecomment'
$P1['#'] = $P24
.annotate 'line', 568
setattribute self, 'select', $P1
# }
.annotate 'line', 569

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 570
# Body
# {
.annotate 'line', 572
# var pending: $P1
getattribute $P1, self, 'pending'
.annotate 'line', 573
# string c: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 574
eq $S1, '', __label_1
.annotate 'line', 575
assign $P1, ''
goto __label_2
__label_1: # else
# {
.annotate 'line', 577
# var h: $P2
getattribute $P2, self, 'h'
.annotate 'line', 578
$P3 = $P2.'read'(1)
set $S1, $P3
.annotate 'line', 579
ne $S1, "\n", __label_3
# {
.annotate 'line', 580
# int l: $I1
getattribute $P3, self, 'line'
set $I1, $P3
.annotate 'line', 581
inc $I1
.annotate 'line', 582
box $P3, $I1
setattribute self, 'line', $P3
# }
__label_3: # endif
# }
__label_2: # endif
.annotate 'line', 585
.return($S1)
# }
.annotate 'line', 586

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 587
# Body
# {
.annotate 'line', 589
getattribute $P1, self, 'pending'
assign $P1, __ARG_1
# }
.annotate 'line', 590

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 591
# Body
# {
.annotate 'line', 593
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 594
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 595
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 596
.const 'Sub' $P7 = 'getop'
.annotate 'line', 597
.const 'Sub' $P8 = 'getident'
.annotate 'line', 598
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 600
getattribute $P10, self, 'stacked'
if_null $P10, __label_0
unless $P10 goto __label_0
# {
.annotate 'line', 601
# var t: $P1
getattribute $P11, self, 'stacked'
$P1 = $P11.'pop'()
.annotate 'line', 602
.return($P1)
# }
__label_0: # endif
.annotate 'line', 604
# string c: $S1
$P10 = self.'getchar'()
null $S1
if_null $P10, __label_1
set $S1, $P10
__label_1:
__label_3: # while
.annotate 'line', 605
$P10 = $P4($S1)
if_null $P10, __label_2
unless $P10 goto __label_2
.annotate 'line', 606
$P11 = self.'getchar'()
set $S1, $P11
goto __label_3
__label_2: # endwhile
.annotate 'line', 607
# int line: $I1
getattribute $P10, self, 'line'
set $I1, $P10
.annotate 'line', 608
ne $S1, '', __label_4
.annotate 'line', 609
new $P11, [ 'TokenEof' ]
getattribute $P12, self, 'filename'
$P11.'TokenEof'($P12)
set $P10, $P11
.return($P10)
__label_4: # endif
.annotate 'line', 610
$P10 = $P5($S1)
if_null $P10, __label_5
unless $P10 goto __label_5
.annotate 'line', 611
.tailcall $P8(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 612
$P10 = $P6($S1)
if_null $P10, __label_6
unless $P10 goto __label_6
.annotate 'line', 613
.tailcall $P9(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 615
# string op: $S2
set $S2, $S1
.annotate 'line', 616
# var select: $P2
getattribute $P2, self, 'select'
.annotate 'line', 617
# var current: $P3
$P3 = $P2[$S1]
__label_8: # while
.annotate 'line', 619
isnull $I2, $P3
not $I2
unless $I2 goto __label_9
isa $I2, $P3, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 620
$P10 = self.'getchar'()
set $S1, $P10
.annotate 'line', 621
set $P2, $P3
.annotate 'line', 622
$P3 = $P2[$S1]
.annotate 'line', 623
unless_null $P3, __label_10
# {
.annotate 'line', 624
self.'ungetchar'($S1)
.annotate 'line', 625
$P3 = $P2['']
# }
goto __label_11
__label_10: # else
.annotate 'line', 628
concat $S2, $S2, $S1
__label_11: # endif
# }
goto __label_8
__label_7: # endwhile
.annotate 'line', 630
if_null $P3, __label_12
unless $P3 goto __label_12
.annotate 'line', 631
.tailcall $P3(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 632
.tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 633

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 634
# Body
# {
.annotate 'line', 636
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 637
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 638
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 639
.return($P1)
# }
.annotate 'line', 640

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 641
# Body
# {
.annotate 'line', 643
getattribute $P1, self, 'stacked'
$P1.'push'(__ARG_1)
# }
.annotate 'line', 644

.end # unget

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 528
addattribute $P0, 'h'
.annotate 'line', 529
addattribute $P0, 'pending'
.annotate 'line', 530
addattribute $P0, 'select'
.annotate 'line', 531
addattribute $P0, 'stacked'
.annotate 'line', 532
addattribute $P0, 'filename'
.annotate 'line', 533
addattribute $P0, 'line'
.end
.namespace [ ]
# Constant REGint evaluated at compile time
# Constant REGfloat evaluated at compile time
# Constant REGstring evaluated at compile time
# Constant REGvar evaluated at compile time
# Constant REGarglist evaluated at compile time
# Constant REGany evaluated at compile time
# Constant REGraw1 evaluated at compile time
# Constant REGnone evaluated at compile time

.sub 'typetoregcheck'
.param string __ARG_1

.annotate 'line', 663
# Body
# {
.annotate 'line', 665
set $S1, __ARG_1
set $S2, 'int'
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
.annotate 'line', 666
.return('I')
__label_3: # case
.annotate 'line', 667
.return('N')
__label_4: # case
.annotate 'line', 668
.return('S')
__label_5: # case
.annotate 'line', 669
.return('P')
__label_1: # default
.annotate 'line', 670
.return('')
__label_0: # switch end
# }
.annotate 'line', 672

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 674
# Body
# {
.annotate 'line', 676
set $S1, __ARG_1
set $S2, 'I'
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
.annotate 'line', 677
.return('int')
__label_3: # case
.annotate 'line', 678
.return('num')
__label_4: # case
.annotate 'line', 679
.return('string')
__label_5: # case
.annotate 'line', 680
.return('pmc')
__label_1: # default
.annotate 'line', 681
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 683

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 698
# Body
# {
.annotate 'line', 700
setattribute self, 'handle', __ARG_1
.annotate 'line', 701
box $P1, ''
setattribute self, 'file', $P1
.annotate 'line', 702
box $P1, 0
setattribute self, 'line', $P1
.annotate 'line', 703
box $P1, 0
setattribute self, 'pendingf', $P1
.annotate 'line', 704
box $P1, 0
setattribute self, 'pendingl', $P1
# }
.annotate 'line', 705

.end # initialize


.sub 'disable_annotations' :method

.annotate 'line', 706
# Body
# {
.annotate 'line', 708
box $P1, 1
setattribute self, 'noan', $P1
# }
.annotate 'line', 709

.end # disable_annotations


.sub 'close' :method

.annotate 'line', 710
# Body
# {
.annotate 'line', 712
null $P1
setattribute self, 'handle', $P1
# }
.annotate 'line', 713

.end # close


.sub 'updateannot' :method

.annotate 'line', 714
# Body
# {
.annotate 'line', 716
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 717
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 718
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 719
getattribute $P1, self, 'handle'
$P1.'print'("'")
.annotate 'line', 720
getattribute $P1, self, 'handle'
$P1.'print'("\n")
.annotate 'line', 721
getattribute $P1, self, 'pendingf'
assign $P1, 0
# }
__label_0: # endif
.annotate 'line', 723
getattribute $P1, self, 'pendingl'
if_null $P1, __label_1
unless $P1 goto __label_1
# {
.annotate 'line', 724
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'line', ")
.annotate 'line', 725
getattribute $P1, self, 'handle'
getattribute $P2, self, 'line'
$P1.'print'($P2)
.annotate 'line', 726
getattribute $P1, self, 'handle'
$P1.'print'("\n")
.annotate 'line', 727
getattribute $P1, self, 'pendingl'
assign $P1, 0
# }
__label_1: # endif
# }
.annotate 'line', 729

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 730
# Body
# {
.annotate 'line', 732
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 733
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 734

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 735
# Body
# {
.annotate 'line', 737
self.'updateannot'()
.annotate 'line', 738
self.'vprint'(__ARG_1)
# }
.annotate 'line', 739

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 740
# Body
# {
.annotate 'line', 742
self.'updateannot'()
.annotate 'line', 743
self.'vprint'(__ARG_1)
.annotate 'line', 744
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 745

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 746
# Body
# {
.annotate 'line', 748
getattribute $P3, self, 'noan'
unless_null $P3, __label_0
# {
.annotate 'line', 750
# var file: $P1
getattribute $P1, self, 'file'
.annotate 'line', 751
# var line: $P2
getattribute $P2, self, 'line'
.annotate 'line', 752
# string tfile: $S1
getattribute $P3, __ARG_1, 'file'
null $S1
if_null $P3, __label_1
set $S1, $P3
__label_1:
.annotate 'line', 753
# int tline: $I1
getattribute $P3, __ARG_1, 'line'
set $I1, $P3
.annotate 'line', 754
set $S2, $P1
eq $S2, $S1, __label_2
# {
.annotate 'line', 755
assign $P1, $S1
.annotate 'line', 756
getattribute $P3, self, 'pendingf'
assign $P3, 1
.annotate 'line', 757
assign $P2, 0
# }
__label_2: # endif
.annotate 'line', 759
set $I2, $P2
eq $I2, $I1, __label_3
# {
.annotate 'line', 760
assign $P2, $I1
.annotate 'line', 761
getattribute $P3, self, 'pendingl'
assign $P3, 1
# }
__label_3: # endif
# }
__label_0: # endif
# }
.annotate 'line', 764

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 765
# Body
# {
.annotate 'line', 767
self.'updateannot'()
.annotate 'line', 768
getattribute $P1, self, 'handle'
concat $S1, '# ', __ARG_1
concat $S1, $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 769

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 770
# Body
# {
.annotate 'line', 772
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 773
$P1.'print'(__ARG_1)
.annotate 'line', 774
$P1.'print'(':')
.annotate 'line', 775
if_null __ARG_2, __label_0
# {
.annotate 'line', 776
$P1.'print'(' # ')
.annotate 'line', 777
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 779
$P1.'print'("\n")
# }
.annotate 'line', 780

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 781
# Body
# {
.annotate 'line', 783
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 784
$P1.'print'('goto ')
.annotate 'line', 785
$P1.'print'(__ARG_1)
.annotate 'line', 786
if_null __ARG_2, __label_0
# {
.annotate 'line', 787
$P1.'print'(' # ')
.annotate 'line', 788
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 790
$P1.'print'("\n")
# }
.annotate 'line', 791

.end # emitgoto


.sub 'emitif' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 793
# Body
# {
.annotate 'line', 795
self.'say'('if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 796

.end # emitif


.sub 'emitunless' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 797
# Body
# {
.annotate 'line', 799
self.'say'('unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 800

.end # emitunless


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 802
# Body
# {
.annotate 'line', 804
self.'say'('if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 805

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 806
# Body
# {
.annotate 'line', 808
self.'say'("null ", __ARG_1)
# }
.annotate 'line', 809

.end # emitnull


.sub 'emitinc' :method
.param string __ARG_1

.annotate 'line', 810
# Body
# {
.annotate 'line', 812
self.'say'('inc ', __ARG_1)
# }
.annotate 'line', 813

.end # emitinc


.sub 'emitdec' :method
.param string __ARG_1

.annotate 'line', 815
# Body
# {
.annotate 'line', 817
self.'say'('dec ', __ARG_1)
# }
.annotate 'line', 818

.end # emitdec


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 819
# Body
# {
.annotate 'line', 821
self.'say'("set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 822

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 823
# Body
# {
.annotate 'line', 825
self.'say'("assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 826

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 827
# Body
# {
.annotate 'line', 829
self.'say'("box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 830

.end # emitbox


.sub 'emitunbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 831
# Body
# {
.annotate 'line', 833
self.'say'("unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 834

.end # emitunbox


.sub 'emitbinop' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 835
# Body
# {
.annotate 'line', 837
self.'say'(__ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 838

.end # emitbinop


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 839
# Body
# {
.annotate 'line', 841
self.'say'("add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 842

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 843
# Body
# {
.annotate 'line', 845
self.'say'("add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 846

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 847
# Body
# {
.annotate 'line', 849
self.'say'("mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 850

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 851
# Body
# {
.annotate 'line', 853
self.'say'("concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 854

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 855
# Body
# {
.annotate 'line', 857
self.'say'("concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 858

.end # emitconcat


.sub 'emitprint' :method
.param string __ARG_1

.annotate 'line', 859
# Body
# {
.annotate 'line', 861
self.'say'('print ', __ARG_1)
# }
.annotate 'line', 862

.end # emitprint


.sub 'emitsay' :method
.param string __ARG_1

.annotate 'line', 863
# Body
# {
.annotate 'line', 865
self.'say'('say ', __ARG_1)
# }
.annotate 'line', 866

.end # emitsay

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 691
addattribute $P0, 'handle'
.annotate 'line', 692
addattribute $P0, 'file'
.annotate 'line', 693
addattribute $P0, 'line'
.annotate 'line', 694
addattribute $P0, 'pendingf'
.annotate 'line', 695
addattribute $P0, 'pendingl'
.annotate 'line', 696
addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 873
# Body
# {
.annotate 'line', 875
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 876

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 878
# Body
# {
.annotate 'line', 880
# var t: $P1
new $P1, [ 'TokenFloat' ]
getattribute $P2, __ARG_2, 'file'
getattribute $P3, __ARG_2, 'line'
$P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 881
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 882

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 884
# Body
# {
.annotate 'line', 890
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 891
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 892
.return($I1)
# }
.annotate 'line', 893

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 911
# Body
# {
.annotate 'line', 913
# int pos: $I1
# predefined indexof
index $I1, __ARG_2, '{res}'
.annotate 'line', 914
iseq $I2, __ARG_1, 'v'
unless $I2 goto __label_1
isne $I2, $I1, -1
__label_1:
unless $I2 goto __label_0
.annotate 'line', 915
'InternalError'('void predef with {res}')
__label_0: # endif
.annotate 'line', 916
isne $I2, __ARG_1, 'v'
unless $I2 goto __label_3
iseq $I2, $I1, -1
__label_3:
unless $I2 goto __label_2
.annotate 'line', 917
'InternalError'('non void predef without {res}')
__label_2: # endif
.annotate 'line', 918
box $P1, __ARG_2
setattribute self, 'body', $P1
.annotate 'line', 919
box $P1, __ARG_1
setattribute self, 'typeresult', $P1
# }
.annotate 'line', 920

.end # Predef_frombody


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 921
# Body
# {
.annotate 'line', 923
# string body: $S1
getattribute $P1, self, 'body'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 924
# string typeresult: $S2
getattribute $P1, self, 'typeresult'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 926
# int pos: $I1
null $I1
.annotate 'line', 927
ne $S2, 'v', __label_2
# {
.annotate 'line', 928
isnull $I4, __ARG_3
not $I4
unless $I4 goto __label_5
isne $I4, __ARG_3, ''
__label_5:
unless $I4 goto __label_4
.annotate 'line', 929
'SyntaxError'('using return value from void predef')
__label_4: # endif
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 932
isnull $I4, __ARG_3
if $I4 goto __label_7
iseq $I4, __ARG_3, ''
__label_7:
unless $I4 goto __label_6
.annotate 'line', 933
'InternalError'('Bad result in non void predef')
__label_6: # endif
__label_9: # while
.annotate 'line', 934
# predefined indexof
index $I1, $S1, '{res}'
eq $I1, -1, __label_8
.annotate 'line', 935
# predefined substr
substr $S5, $S1, 0, $I1
add $I4, $I1, 5
# predefined substr
substr $S6, $S1, $I4
concat $S0, $S5, __ARG_3
concat $S0, $S0, $S6
set $S1, $S0
goto __label_9
__label_8: # endwhile
# }
__label_3: # endif
.annotate 'line', 938
# int n: $I2
set $P1, __ARG_4
set $I2, $P1
# for loop
.annotate 'line', 939
# int i: $I3
null $I3
__label_12: # for condition
ge $I3, $I2, __label_11
# {
.annotate 'line', 940
# string argmark: $S3
set $S6, $I3
concat $S5, '{arg', $S6
concat $S3, $S5, '}'
.annotate 'line', 941
# string arg: $S4
$S4 = __ARG_4[$I3]
__label_14: # while
.annotate 'line', 942
# predefined indexof
index $I1, $S1, $S3
eq $I1, -1, __label_13
.annotate 'line', 943
# predefined substr
substr $S5, $S1, 0, $I1
add $I4, $I1, 6
# predefined substr
substr $S6, $S1, $I4
concat $S0, $S5, $S4
concat $S0, $S0, $S6
set $S1, $S0
goto __label_14
__label_13: # endwhile
# }
__label_10: # for iteration
.annotate 'line', 939
inc $I3
goto __label_12
__label_11: # for end
.annotate 'line', 945
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 946
__ARG_1.'say'($S1)
# }
.annotate 'line', 947

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 909
addattribute $P0, 'body'
.annotate 'line', 910
addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 961
# Body
# {
.annotate 'line', 963
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 964
.return($S1)
# }
.annotate 'line', 965

.end # name


.sub 'result' :method

.annotate 'line', 966
# Body
# {
.annotate 'line', 968
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 969

.end # result


.sub 'params' :method

.annotate 'line', 970
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 971
# Body
# {
.annotate 'line', 973
# string type: $S1
null $S1
.annotate 'line', 974
set $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 975
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 976
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 977
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 979
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 981
.return($S1)
# }
.annotate 'line', 982

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 983
# Body
# {
.annotate 'line', 989
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 990
isa $I2, __ARG_2, 'String'
unless $I2 goto __label_0
.annotate 'line', 991
new $P3, [ 'Predef_frombody' ]
$P3.'Predef_frombody'(__ARG_3, __ARG_2)
set $P2, $P3
setattribute self, 'body', $P2
goto __label_1
__label_0: # else
.annotate 'line', 993
setattribute self, 'body', __ARG_2
__label_1: # endif
.annotate 'line', 994
box $P1, __ARG_3
setattribute self, 'typeresult', $P1
.annotate 'line', 995
# int n: $I1
null $I1
.annotate 'line', 996
if_null __ARG_4, __label_2
# {
.annotate 'line', 997
box $P1, __ARG_4
setattribute self, 'type0', $P1
.annotate 'line', 998
set $S1, __ARG_4
set $S2, '*'
if $S1 == $S2 goto __label_5
set $S2, '!'
if $S1 == $S2 goto __label_6
goto __label_4
# switch
__label_5: # case
.annotate 'line', 1000
set $I1, -1
goto __label_3 # break
__label_6: # case
.annotate 'line', 1003
set $I1, -2
.annotate 'line', 1004
if_null __ARG_5, __label_7
.annotate 'line', 1005
concat $S3, "Invalid predef '", __ARG_1
concat $S3, $S3, '"'
'InternalError'($S3)
__label_7: # endif
goto __label_3 # break
__label_4: # default
.annotate 'line', 1008
set $I1, 1
.annotate 'line', 1009
if_null __ARG_5, __label_8
# {
.annotate 'line', 1010
box $P1, __ARG_5
setattribute self, 'type1', $P1
.annotate 'line', 1011
inc $I1
# }
__label_8: # endif
.annotate 'line', 1013
if_null __ARG_6, __label_9
# {
.annotate 'line', 1014
box $P1, __ARG_6
setattribute self, 'type2', $P1
.annotate 'line', 1015
inc $I1
# }
__label_9: # endif
__label_3: # switch end
# }
__label_2: # endif
.annotate 'line', 1019
box $P1, $I1
setattribute self, 'nparams', $P1
.annotate 'line', 1020
.return(self)
# }
.annotate 'line', 1021

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 1022
# Body
# {
.annotate 'line', 1030
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1031
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 1032
.return(self)
# }
.annotate 'line', 1033

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 1034
# Body
# {
.annotate 'line', 1036
# predefined string
getattribute $P2, self, 'name'
set $S2, $P2
concat $S3, 'predefined ', $S2
__ARG_1.'comment'($S3)
.annotate 'line', 1037
# string typeresult: $S1
getattribute $P2, self, 'typeresult'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1038
isne $I1, $S1, 'v'
unless $I1 goto __label_2
iseq $I1, __ARG_4, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1039
$P2 = __ARG_2.'tempreg'($S1)
set __ARG_4, $P2
__label_1: # endif
.annotate 'line', 1040
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 1041
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1042

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 952
addattribute $P0, 'name'
.annotate 'line', 953
addattribute $P0, 'body'
.annotate 'line', 954
addattribute $P0, 'evalfun'
.annotate 'line', 955
addattribute $P0, 'typeresult'
.annotate 'line', 956
addattribute $P0, 'type0'
.annotate 'line', 957
addattribute $P0, 'type1'
.annotate 'line', 958
addattribute $P0, 'type2'
.annotate 'line', 959
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 1048
# Body
# {
.annotate 'line', 1050
box $P1, __ARG_1
setattribute self, 'type', $P1
# }
.annotate 'line', 1051

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1052
# Body
# {
.annotate 'line', 1054
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1055
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1056
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1057
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1058
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1059
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1060
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1062
# string arg: $S3
$P2 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 1063
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1064
__ARG_1.'emitset'(__ARG_3, $S3)
# }
__label_4: # endif
# }
.annotate 'line', 1066

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1047
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1071
# Body
# {
.annotate 'line', 1073
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1074
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1075
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1076
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
.annotate 'line', 1077
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_2: # for iteration
.annotate 'line', 1076
inc $I2
goto __label_4
__label_3: # for end
.annotate 'line', 1078
$P1 = __ARG_4[$I1]
__ARG_1.'emitsay'($P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1081
__ARG_1.'emitsay'("''")
__label_1: # endif
# }
.annotate 'line', 1082

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

.annotate 'line', 1087
# Body
# {
.annotate 'line', 1089
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1090
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1091
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1092
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1093
$P1 = __ARG_4[$I2]
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1092
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1094
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1095

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

.annotate 'line', 1100
# Body
# {
.annotate 'line', 1102
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1103
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1104
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1105
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_0: # for iteration
.annotate 'line', 1104
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1106

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length' :subid('WSubId_1')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1109
# Body
# {
.annotate 'line', 1111
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1112
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1113
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1114

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1116
# Body
# {
.annotate 'line', 1118
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1119
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1120
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1121

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1123
# Body
# {
.annotate 'line', 1125
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1126
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1127
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1128

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1130
# Body
# {
.annotate 'line', 1132
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1133
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1134
# var argn: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1135
# int n: $I1
getattribute $P3, $P2, 'numval'
set $I1, $P3
.annotate 'line', 1136
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1137

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1139
# Body
# {
.annotate 'line', 1141
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1143
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1144
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1146
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1147
new $P4, [ 'StringLiteral' ]
$P4.'StringLiteral'(__ARG_1, $P2)
set $P3, $P4
.return($P3)
# }
.annotate 'line', 1148

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1150
# Body
# {
.annotate 'line', 1152
# var argstr: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1153
# var argpos: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1154
# string str: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1155
# int pos: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1157
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1
$P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1158
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1159

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1161
# Body
# {
.annotate 'line', 1163
# var argstr: $P1
$P5 = __ARG_3[0]
getattribute $P1, $P5, 'arg'
.annotate 'line', 1164
# var argpos: $P2
$P5 = __ARG_3[1]
getattribute $P2, $P5, 'arg'
.annotate 'line', 1165
# var arglen: $P3
$P5 = __ARG_3[2]
getattribute $P3, $P5, 'arg'
.annotate 'line', 1166
# string str: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1167
# int pos: $I1
getattribute $P5, $P2, 'numval'
set $I1, $P5
.annotate 'line', 1168
# int len: $I2
getattribute $P5, $P3, 'numval'
set $I2, $P5
.annotate 'line', 1170
# var t: $P4
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1171
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_1, $P4)
set $P5, $P6
.return($P5)
# }
.annotate 'line', 1172

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1174
# Body
# {
.annotate 'line', 1176
# var argstrfrom: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1177
# var argstrsearch: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1178
# string strfrom: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1179
# string strsearch: $S2
$P3 = $P2.'get_value'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 1180
# predefined indexof
index $I1, $S1, $S2
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1181

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1183
# Body
# {
.annotate 'line', 1185
# var argstrfrom: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1186
# var argstrsearch: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1187
# var argpos: $P3
$P4 = __ARG_3[2]
getattribute $P3, $P4, 'arg'
.annotate 'line', 1188
# string strfrom: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1189
# string strsearch: $S2
$P4 = $P2.'get_value'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 1190
# int pos: $I1
getattribute $P4, $P3, 'numval'
set $I1, $P4
.annotate 'line', 1191
# predefined indexof
index $I2, $S1, $S2, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1192

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1194
# Body
# {
.const 'Sub' $P2 = "WSubId_1"
.const 'Sub' $P3 = "WSubId_2"
.const 'Sub' $P4 = "WSubId_3"
.const 'Sub' $P5 = "WSubId_4"
.const 'Sub' $P6 = "WSubId_5"
.const 'Sub' $P7 = "WSubId_6"
.const 'Sub' $P8 = "WSubId_7"
.const 'Sub' $P9 = "WSubId_8"
.const 'Sub' $P10 = "WSubId_9"
.annotate 'line', 1206
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1207
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1208
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('I')
set $P14, $P15
.annotate 'line', 1207
$P12 = $P13.'set'('int', $P14, 'I', '!')
.annotate 'line', 1206
$P1.'push'($P12)
.annotate 'line', 1211
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1212
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('N')
set $P18, $P19
.annotate 'line', 1211
$P16 = $P17.'set'('float', $P18, 'N', '!')
.annotate 'line', 1206
$P1.'push'($P16)
.annotate 'line', 1215
new $P21, [ 'PredefFunction' ]
.annotate 'line', 1216
new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('S')
set $P22, $P23
.annotate 'line', 1215
$P20 = $P21.'set'('string', $P22, 'S', '!')
.annotate 'line', 1206
$P1.'push'($P20)
.annotate 'line', 1219
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1206
$P1.'push'($P24)
.annotate 'line', 1223
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1206
$P1.'push'($P26)
.annotate 'line', 1227
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('time', 'time {res}', 'I')
.annotate 'line', 1206
$P1.'push'($P28)
.annotate 'line', 1231
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1206
$P1.'push'($P30)
.annotate 'line', 1235
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1206
$P1.'push'($P32)
.annotate 'line', 1239
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1206
$P1.'push'($P34)
.annotate 'line', 1244
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P36)
.annotate 'line', 1249
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1206
$P1.'push'($P38)
.annotate 'line', 1254
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1206
$P1.'push'($P40)
.annotate 'line', 1260
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1206
$P1.'push'($P42)
.annotate 'line', 1267
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1206
$P1.'push'($P44)
.annotate 'line', 1271
new $P47, [ 'PredefFunction' ]
.annotate 'line', 1271
$P46 = $P47.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1206
$P1.'push'($P46)
.annotate 'line', 1276
new $P49, [ 'PredefFunction' ]
.annotate 'line', 1276
$P48 = $P49.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1206
$P1.'push'($P48)
.annotate 'line', 1281
new $P51, [ 'PredefFunction' ]
.annotate 'line', 1281
$P50 = $P51.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1206
$P1.'push'($P50)
.annotate 'line', 1288
new $P53, [ 'PredefFunction' ]
.annotate 'line', 1288
$P52 = $P53.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1206
$P1.'push'($P52)
.annotate 'line', 1293
new $P55, [ 'PredefFunction' ]
.annotate 'line', 1293
$P54 = $P55.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1206
$P1.'push'($P54)
.annotate 'line', 1298
new $P57, [ 'PredefFunction' ]
.annotate 'line', 1298
$P56 = $P57.'set_eval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1206
$P1.'push'($P56)
.annotate 'line', 1303
new $P59, [ 'PredefFunction' ]
.annotate 'line', 1303
$P58 = $P59.'set_eval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1206
$P1.'push'($P58)
.annotate 'line', 1308
new $P61, [ 'PredefFunction' ]
.annotate 'line', 1308
$P60 = $P61.'set_eval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P60)
.annotate 'line', 1313
new $P63, [ 'PredefFunction' ]
.annotate 'line', 1313
$P62 = $P63.'set_eval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1206
$P1.'push'($P62)
.annotate 'line', 1318
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1206
$P1.'push'($P64)
.annotate 'line', 1322
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P66)
.annotate 'line', 1326
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P68)
.annotate 'line', 1330
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P70)
.annotate 'line', 1334
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P72)
.annotate 'line', 1338
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P74)
.annotate 'line', 1343
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P76)
.annotate 'line', 1348
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P78)
.annotate 'line', 1352
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P80)
.annotate 'line', 1356
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P82)
.annotate 'line', 1360
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P84)
.annotate 'line', 1364
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P86)
.annotate 'line', 1368
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P88)
.annotate 'line', 1372
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P90)
.annotate 'line', 1376
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P92)
.annotate 'line', 1380
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P94)
.annotate 'line', 1384
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P96)
.annotate 'line', 1388
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1206
$P1.'push'($P98)
.annotate 'line', 1392
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1206
$P1.'push'($P100)
.annotate 'line', 1396
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1206
$P1.'push'($P102)
.annotate 'line', 1400
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1206
$P1.'push'($P104)
.annotate 'line', 1404
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1206
$P1.'push'($P106)
.annotate 'line', 1408
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1206
$P1.'push'($P108)
.annotate 'line', 1412
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1206
$P1.'push'($P110)
.annotate 'line', 1416
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1206
$P1.'push'($P112)
.annotate 'line', 1420
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1206
$P1.'push'($P114)
.annotate 'line', 1424
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1206
$P1.'push'($P116)
.annotate 'line', 1429
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P118)
.annotate 'line', 1434
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1206
$P1.'push'($P120)
.annotate 'line', 1438
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1206
$P1.'push'($P122)
.annotate 'line', 1442
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1206
$P1.'push'($P124)
.annotate 'line', 1446
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1206
$P1.'push'($P126)
.annotate 'line', 1450
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1206
$P1.'push'($P128)
.annotate 'line', 1454
new $P131, [ 'PredefFunction' ]
.annotate 'line', 1455
new $P132, [ 'Predef_print' ]
.annotate 'line', 1454
$P130 = $P131.'set'('print', $P132, 'v', '*')
.annotate 'line', 1206
$P1.'push'($P130)
.annotate 'line', 1458
new $P134, [ 'PredefFunction' ]
.annotate 'line', 1459
new $P135, [ 'Predef_say' ]
.annotate 'line', 1458
$P133 = $P134.'set'('say', $P135, 'v', '*')
.annotate 'line', 1206
$P1.'push'($P133)
.annotate 'line', 1462
new $P137, [ 'PredefFunction' ]
.annotate 'line', 1463
new $P138, [ 'Predef_cry' ]
.annotate 'line', 1462
$P136 = $P137.'set'('cry', $P138, 'v', '*')
.annotate 'line', 1206
$P1.'push'($P136)
__label_1: # Infinite loop
.annotate 'line', 1468
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1469

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1471
# Body
# {
.annotate 'line', 1473
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1474
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1475
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1476
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1477
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1478
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1479
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1481
.return($P2)
# }
.annotate 'line', 1482

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1488
# Body
# {
.annotate 'line', 1490
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1491
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1492
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1491
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1493

.end # optimize_array


.sub 'parseDotted'
.param pmc __ARG_1

.annotate 'line', 1495
# Body
# {
.annotate 'line', 1497
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1498
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 1499
$P3 = $P2.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 1500
$P1.'push'($P2)
__label_2: # while
.annotate 'line', 1501
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 1502
$P2 = __ARG_1.'get'()
.annotate 'line', 1503
$P1.'push'($P2)
# }
goto __label_2
__label_1: # endwhile
# }
__label_0: # endif
.annotate 'line', 1506
__ARG_1.'unget'($P2)
.annotate 'line', 1507
.return($P1)
# }
.annotate 'line', 1508

.end # parseDotted


.sub 'toIdentifierList'
.param pmc __ARG_1

.annotate 'line', 1510
# Body
# {
.annotate 'line', 1512
# string list: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1513
iter $P3, __ARG_1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 1514
$P4 = $P2.'getidentifier'()
$P1.'push'($P4)
goto __label_0
__label_1: # endfor
.annotate 'line', 1515
.return($P1)
# }
.annotate 'line', 1516

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1527
# Body
# {
.annotate 'line', 1529
setattribute self, 'start', __ARG_1
.annotate 'line', 1530
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1531

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1532
# Body
# {
.annotate 'line', 1534
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1535

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1536
# Body
# {
.annotate 'line', 1538
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1539

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1540
# Body
# {
.annotate 'line', 1542
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1543

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1544
# Body
# {
.annotate 'line', 1546
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1547

.end # addlocalfunction


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 1548
# Body
# {
.annotate 'line', 1550
getattribute $P1, self, 'owner'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1551

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1552
# Body
# {
.annotate 'line', 1554
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1555

.end # findclasskey


.sub 'dowarnings' :method

.annotate 'line', 1556
# Body
# {
.annotate 'line', 1558
getattribute $P1, self, 'owner'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1559

.end # dowarnings

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1524
addattribute $P0, 'start'
.annotate 'line', 1525
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1572
# Body
# {
.annotate 'line', 1574
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1575

.end # init


.sub 'numargs' :method

.annotate 'line', 1577
# Body
# {
.annotate 'line', 1579
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1580

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1581
# Body
# {
.annotate 'line', 1583
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1584
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1585

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1587
# Body
# {
.annotate 'line', 1589
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1590
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1591
# {
.annotate 'line', 1592
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1593
$P1.'push'($P3)
# }
__label_2: # continue
.annotate 'line', 1594
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1595
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1596

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1598
# Body
# {
.annotate 'line', 1600
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1601
if_null $P1, __label_0
.annotate 'line', 1602
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1603

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1604
# Body
# {
.annotate 'line', 1606
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1607
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1608
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1609
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1610
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1611
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1612
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1609
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1614
.return($P2)
# }
.annotate 'line', 1615

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1616
# Body
# {
.annotate 'line', 1618
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1619
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1620

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1570
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1632
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1633
# Body
# {
.annotate 'line', 1635
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1636
.return($I1)
# }
.annotate 'line', 1637

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1638
# Body
# {
.annotate 'line', 1640
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1641
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1642
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1644
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1645

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1646
# Body
# {
.annotate 'line', 1648
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 1649
if_null __ARG_2, __label_0
.annotate 'line', 1650
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1651

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1652
# Body
# {
.annotate 'line', 1654
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1655

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1629
addattribute $P0, 'name'
.annotate 'line', 1630
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1662
# Body
# {
.annotate 'line', 1664
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1665
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1666
# {
.annotate 'line', 1667
$P2 = __ARG_1.'get'()
.annotate 'line', 1668
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1669
$P2 = __ARG_1.'get'()
.annotate 'line', 1670
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1671
$P4 = $P2.'isop'('(')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 1672
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1673
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1675
new $P5, [ 'Modifier' ]
$P5.'Modifier'($S1, $P3)
set $P4, $P5
$P1.'push'($P4)
# }
__label_2: # continue
.annotate 'line', 1676
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1677
'RequireOp'(']', $P2)
.annotate 'line', 1678
setattribute self, 'list', $P1
# }
.annotate 'line', 1679

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1680
# Body
# {
.annotate 'line', 1682
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1683
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1684

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1685
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1686
# Body
# {
.annotate 'line', 1688
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1689
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1690
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1691
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1692
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1693
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1690
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1696
.return($P3)
# }
.annotate 'line', 1697

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1660
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1704
# Body
# {
.annotate 'line', 1706
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1707
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
.annotate 'line', 1708

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1710
# Body
# {
.annotate 'line', 1712
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1713
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1715
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1716
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1718

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1720
# Body
# {
.annotate 'line', 1722
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1723
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1724
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1725
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1726
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1728
__ARG_2.'unget'($P1)
.annotate 'line', 1729
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1731

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1733
# Body
# {
.annotate 'line', 1735
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1736
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1737
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1738
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1739
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1740
$P4 = $P1.'isop'('${')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 1741
new $P6, [ 'PiropStatement' ]
$P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 1743
# string key: $S1
$P4 = $P1.'checkkeyword'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1744
# var st: $P2
null $P2
.annotate 'line', 1745
set $S2, $S1
set $S3, 'using'
if $S2 == $S3 goto __label_6
set $S3, 'const'
if $S2 == $S3 goto __label_7
set $S3, 'volatile'
if $S2 == $S3 goto __label_8
set $S3, 'var'
if $S2 == $S3 goto __label_9
set $S3, 'string'
if $S2 == $S3 goto __label_10
set $S3, 'int'
if $S2 == $S3 goto __label_11
set $S3, 'float'
if $S2 == $S3 goto __label_12
set $S3, 'return'
if $S2 == $S3 goto __label_13
set $S3, 'yield'
if $S2 == $S3 goto __label_14
set $S3, 'goto'
if $S2 == $S3 goto __label_15
set $S3, 'if'
if $S2 == $S3 goto __label_16
set $S3, 'while'
if $S2 == $S3 goto __label_17
set $S3, 'do'
if $S2 == $S3 goto __label_18
set $S3, 'continue'
if $S2 == $S3 goto __label_19
set $S3, 'break'
if $S2 == $S3 goto __label_20
set $S3, 'switch'
if $S2 == $S3 goto __label_21
set $S3, 'for'
if $S2 == $S3 goto __label_22
set $S3, 'throw'
if $S2 == $S3 goto __label_23
set $S3, 'try'
if $S2 == $S3 goto __label_24
goto __label_5
# switch
__label_6: # case
.annotate 'line', 1747
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1749
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1752
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_9: # case
.annotate 'line', 1755
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1757
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1759
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1761
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_13: # case
.annotate 'line', 1763
new $P5, [ 'ReturnStatement' ]
$P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_14: # case
.annotate 'line', 1765
new $P7, [ 'YieldStatement' ]
$P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P6, $P7
.return($P6)
__label_15: # case
.annotate 'line', 1767
new $P9, [ 'GotoStatement' ]
$P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_16: # case
.annotate 'line', 1769
new $P11, [ 'IfStatement' ]
$P11.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_17: # case
.annotate 'line', 1771
new $P13, [ 'WhileStatement' ]
$P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_18: # case
.annotate 'line', 1773
new $P15, [ 'DoStatement' ]
$P15.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_19: # case
.annotate 'line', 1775
new $P17, [ 'ContinueStatement' ]
$P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_20: # case
.annotate 'line', 1777
new $P19, [ 'BreakStatement' ]
$P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_21: # case
.annotate 'line', 1779
new $P21, [ 'SwitchStatement' ]
$P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_22: # case
.annotate 'line', 1781
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_23: # case
.annotate 'line', 1783
new $P23, [ 'ThrowStatement' ]
$P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_24: # case
.annotate 'line', 1785
new $P25, [ 'TryStatement' ]
$P25.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_5: # default
.annotate 'line', 1787
$P26 = $P1.'isidentifier'()
if_null $P26, __label_25
unless $P26 goto __label_25
# {
.annotate 'line', 1788
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1789
$P4 = $P3.'isop'(':')
if_null $P4, __label_26
unless $P4 goto __label_26
.annotate 'line', 1790
new $P6, [ 'LabelStatement' ]
$P6.'LabelStatement'($P1, __ARG_2)
set $P5, $P6
.return($P5)
__label_26: # endif
.annotate 'line', 1791
__ARG_1.'unget'($P3)
# }
__label_25: # endif
.annotate 'line', 1793
__ARG_1.'unget'($P1)
.annotate 'line', 1794
new $P5, [ 'ExprStatement' ]
$P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_4: # switch end
.annotate 'line', 1796
unless_null $P2, __label_27
.annotate 'line', 1797
'InternalError'('parseStatement failure')
__label_27: # endif
.annotate 'line', 1798
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1799

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1807
# Body
# {
.annotate 'line', 1809
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1810

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1811
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1812
# Body
# {
.annotate 'line', 1814
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1815

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1816
# Body
# {
.annotate 'line', 1818
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1819

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1820
# Body
# {
.annotate 'line', 1822
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1823

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1824
# Body
# {
.annotate 'line', 1826
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1827

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1828
# Body
# {
.annotate 'line', 1830
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1831

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1832
# Body
# {
.annotate 'line', 1834
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1835

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1836
# Body
# {
.annotate 'line', 1838
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1839

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1840
# Body
# {
.annotate 'line', 1842
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1843

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1844
# Body
# {
.annotate 'line', 1846
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1847

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1848
# Body
# {
.annotate 'line', 1850
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1851

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1853
# Body
# {
.annotate 'line', 1858
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1859

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1860
# Body
# {
.annotate 'line', 1862
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1863

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1864
# Body
# {
.annotate 'line', 1866
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1867

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1868
# Body
# {
.annotate 'line', 1870
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1872
.return(self)
# }
.annotate 'line', 1873

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1805
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1878
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1879
# Body
# {
.annotate 'line', 1881
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1882

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1883
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1884
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1876
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method

.annotate 'line', 1894
# Body
# {
.annotate 'line', 1896
# var statements: $P1
getattribute $P1, self, 'statements'
.annotate 'line', 1897
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 1898
# int empty: $I2
set $I2, 1
# for loop
.annotate 'line', 1899
# int i: $I3
null $I3
__label_2: # for condition
ge $I3, $I1, __label_1
# {
.annotate 'line', 1900
# var st: $P2
$P3 = $P1[$I3]
$P2 = $P3.'optimize'()
.annotate 'line', 1901
set $I4, $I2
unless $I4 goto __label_4
$P3 = $P2.'isempty'()
isfalse $I4, $P3
__label_4:
unless $I4 goto __label_3
.annotate 'line', 1902
null $I2
__label_3: # endif
.annotate 'line', 1903
$P1[$I3] = $P2
# }
__label_0: # for iteration
.annotate 'line', 1899
inc $I3
goto __label_2
__label_1: # for end
.annotate 'line', 1905
unless $I2 goto __label_5
.annotate 'line', 1906
new $P3, [ 'EmptyStatement' ]
.return($P3)
goto __label_6
__label_5: # else
.annotate 'line', 1908
.return(self)
__label_6: # endif
# }
.annotate 'line', 1909

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 1892
addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1914
# Body
# {
.annotate 'line', 1916
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1917
$P1.'push'(__ARG_1)
.annotate 'line', 1918
$P1.'push'(__ARG_2)
.annotate 'line', 1919
setattribute self, 'statements', $P1
# }
.annotate 'line', 1920

.end # MultiStatement


.sub 'isempty' :method

.annotate 'line', 1921
# Body
# {
.return(0)
# }

.end # isempty


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1922
# Body
# {
.annotate 'line', 1924
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1925
.return(self)
# }
.annotate 'line', 1926

.end # push


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1927
# Body
# {
.annotate 'line', 1929
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1930
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1931

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1912
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1934
# Body
# {
.annotate 'line', 1936
unless_null __ARG_1, __label_0
.annotate 'line', 1937
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1938
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1939
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1941
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1942

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1953
# Body
# {
.annotate 'line', 1955
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1956
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1957
# int dotted: $I1
null $I1
.annotate 'line', 1958
$P4 = $P1.'isop'('.')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 1959
set $I1, 1
.annotate 'line', 1960
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1962
# string opname: $S1
$P4 = $P1.'getidentifier'()
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 1963
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S4, $S3, $S1
box $P4, $S4
setattribute self, 'opname', $P4
.annotate 'line', 1964
$P1 = __ARG_2.'get'()
.annotate 'line', 1965
$P4 = $P1.'isop'('}')
isfalse $I2, $P4
unless $I2 goto __label_4
# {
.annotate 'line', 1966
__ARG_2.'unget'($P1)
.annotate 'line', 1967
# var args: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_5: # do
.annotate 'line', 1968
# {
.annotate 'line', 1969
# var arg: $P3
null $P3
.annotate 'line', 1970
$P1 = __ARG_2.'get'()
.annotate 'line', 1971
$P4 = $P1.'isop'(':')
if_null $P4, __label_8
unless $P4 goto __label_8
# {
.annotate 'line', 1972
$P1 = __ARG_2.'get'()
.annotate 'line', 1973
# string label: $S2
$P4 = $P1.'getidentifier'()
null $S2
if_null $P4, __label_10
set $S2, $P4
__label_10:
.annotate 'line', 1974
new $P4, [ 'Reflabel' ]
$P4.'Reflabel'(__ARG_3, $S2)
set $P3, $P4
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 1977
__ARG_2.'unget'($P1)
.annotate 'line', 1978
$P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
__label_9: # endif
.annotate 'line', 1980
$P2.'push'($P3)
# }
__label_7: # continue
.annotate 'line', 1981
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_6
if $P4 goto __label_5
__label_6: # enddo
.annotate 'line', 1982
'RequireOp'('}', $P1)
.annotate 'line', 1983
setattribute self, 'args', $P2
# }
__label_4: # endif
.annotate 'line', 1985
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1986

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1987
# Body
# {
.annotate 'line', 1989
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1990
if_null $P1, __label_0
.annotate 'line', 1991
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 1992
.return(self)
# }
.annotate 'line', 1993

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1994
# Body
# {
.annotate 'line', 1996
# string opname: $S1
getattribute $P4, self, 'opname'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1997
self.'annotate'(__ARG_1)
.annotate 'line', 1998
concat $S3, 'pirop ', $S1
__ARG_1.'comment'($S3)
.annotate 'line', 1999
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2000
unless_null $P1, __label_1
.annotate 'line', 2001
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 2003
__ARG_1.'print'($S1, ' ')
.annotate 'line', 2004
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2005
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 2006
# int i: $I2
null $I2
__label_5: # for condition
ge $I2, $I1, __label_4
# {
.annotate 'line', 2007
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 2008
# string reg: $S2
$P4 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_6
set $S2, $P4
__label_6:
.annotate 'line', 2009
$P2.'push'($S2)
# }
__label_3: # for iteration
.annotate 'line', 2006
inc $I2
goto __label_5
__label_4: # for end
.annotate 'line', 2011
# predefined join
join $S3, ', ', $P2
__ARG_1.'say'($S3)
# }
__label_2: # endif
# }
.annotate 'line', 2013

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1948
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1950
addattribute $P0, 'opname'
.annotate 'line', 1951
addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2023
# Body
# {
.annotate 'line', 2025
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2026
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2027
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2028
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2029
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2030
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
.annotate 'line', 2031
.return(self)
# }
.annotate 'line', 2032

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 2033
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2034
# Body
# {
.annotate 'line', 2036
self.'annotate'(__ARG_1)
.annotate 'line', 2037
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2038

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2020
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2022
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2048
# Body
# {
.annotate 'line', 2050
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2051
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2052
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2053
box $P1, $S1
setattribute self, 'symbol', $P1
# }
.annotate 'line', 2054

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 2055
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2056
# Body
# {
.annotate 'line', 2058
self.'annotate'(__ARG_1)
.annotate 'line', 2059
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2060
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2061

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2045
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2047
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2073
# Body
# {
.annotate 'line', 2075
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2076
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2077
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2078
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2079
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2080
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
# }
.annotate 'line', 2081

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 2082
# Body
# {
.annotate 'line', 2084
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2085
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2086
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2088
# var symbol: $P3
$P3 = self.'findsymbol'($P1)
.annotate 'line', 2089
if_null $P3, __label_0
# {
.annotate 'line', 2090
isa $I1, $P3, 'FunctionStatement'
unless $I1 goto __label_1
# {
.annotate 'line', 2091
# string subid: $S2
$P4 = $P3.'makesubid'()
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2092
box $P4, $S2
setattribute self, 'subid', $P4
# }
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2095
.return(self)
# }
.annotate 'line', 2096

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2097
# Body
# {
.annotate 'line', 2099
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2100
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2101
# var vdata: $P2
$P2 = self.'getvar'($S1)
.annotate 'line', 2102
getattribute $P3, self, 'subid'
if_null $P3, __label_0
# {
.annotate 'line', 2103
# string subid: $S2
getattribute $P4, self, 'subid'
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2104
$P3 = $P2.'getreg'()
__ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 2107
self.'annotate'(__ARG_1)
.annotate 'line', 2108
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 2109
$P1.'pop'()
.annotate 'line', 2110
# predefined elements
elements $I1, $P1
null $I2
if $I1 == $I2 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 2112
__ARG_1.'say'("'", $S1, "'")
goto __label_3 # break
__label_4: # default
.annotate 'line', 2115
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_3: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2118

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2068
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2070
addattribute $P0, 'path'
.annotate 'line', 2071
addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2128
# Body
# {
.annotate 'line', 2130
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2131
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 2132
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2133

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 2134
# Body
# {
.annotate 'line', 2136
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 2137
.return(self)
# }
.annotate 'line', 2138

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2139
# Body
# {
.annotate 'line', 2141
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2142

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2125
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2127
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2159
# Body
# {
.annotate 'line', 2161
setattribute self, 'type', __ARG_1
.annotate 'line', 2162
setattribute self, 'reg', __ARG_2
.annotate 'line', 2163
setattribute self, 'scope', __ARG_3
.annotate 'line', 2164
box $P1, __ARG_4
setattribute self, 'flags', $P1
.annotate 'line', 2165
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2166

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2167
# Body
# {
.annotate 'line', 2169
box $P1, __ARG_1
setattribute self, 'id', $P1
# }
.annotate 'line', 2170

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2171
# Body
# {
.annotate 'line', 2173
box $P1, __ARG_1
setattribute self, 'lexname', $P1
# }
.annotate 'line', 2174

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2175
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2176
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2177
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2178
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2179
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2180
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2181
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'isvolatile' :method

.annotate 'line', 2182
# Body
# {
# predefined int
getattribute $P1, self, 'flags'
set $I2, $P1
band $I1, $I2, 1
.return($I1)
# }

.end # isvolatile

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarData' ]
.annotate 'line', 2151
addattribute $P0, 'type'
.annotate 'line', 2152
addattribute $P0, 'reg'
.annotate 'line', 2153
addattribute $P0, 'scope'
.annotate 'line', 2154
addattribute $P0, 'flags'
.annotate 'line', 2155
addattribute $P0, 'value'
.annotate 'line', 2156
addattribute $P0, 'id'
.annotate 'line', 2157
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2188
# Body
# {
.annotate 'line', 2190
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2191

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2192
# Body
# {
.annotate 'line', 2194
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2195

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2187
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2202
# Body
# {
.annotate 'line', 2204
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2205

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2206
# Body
# {
.annotate 'line', 2208
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2209
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2210
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2211
if_null $P2, __label_1
.annotate 'line', 2212
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2213
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2214
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2215
$P1[$S1] = $P3
.annotate 'line', 2216
.return($P3)
# }
.annotate 'line', 2217

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2218
# Body
# {
.annotate 'line', 2220
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2221
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2222
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2223
if_null $P2, __label_1
.annotate 'line', 2224
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2225
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2226

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2227
# Body
# {
.annotate 'line', 2229
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2230
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2231
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2232
if_null $P2, __label_1
.annotate 'line', 2233
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2234
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2235
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2236
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2237
$P1[$S1] = $P3
# }
.annotate 'line', 2238

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2239
# Body
# {
.annotate 'line', 2241
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2242
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2243
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2244
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2245
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2246
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2247
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2248
.return($P2)
# }
.annotate 'line', 2249

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2250
# Body
# {
.annotate 'line', 2252
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2253
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2254
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2255
.return($P2)
# }
.annotate 'line', 2256

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2257
# Body
# {
.annotate 'line', 2259
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2260
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2261
.return($S1)
# }
.annotate 'line', 2262

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2263
# Body
# {
.annotate 'line', 2265
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2267
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2268
.return('__WLEX_self')
# }
.annotate 'line', 2269

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2201
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2278
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2288
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2289
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2290
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2291
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2292
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2293
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2294
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2295
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2296
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2297
# Body
# {
.annotate 'line', 2299
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2300

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2301
# Body
# {
.annotate 'line', 2303
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2304

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2305
# Body
# {
.annotate 'line', 2308
.return(self)
# }
.annotate 'line', 2309

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 2310
# Body
# {
.return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2311
# Body
# {
.annotate 'line', 2313
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2314
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2315
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2316
.return($S2)
# }
.annotate 'line', 2317

.end # emit_get


.sub 'emit_getint' :method
.param pmc __ARG_1

.annotate 'line', 2318
# Body
# {
.annotate 'line', 2320
# string reg: $S1
null $S1
.annotate 'line', 2321
$P1 = self.'checkresult'()
set $S2, $P1
ne $S2, 'I', __label_0
.annotate 'line', 2322
$P2 = self.'emit_get'(__ARG_1)
set $S1, $P2
goto __label_1
__label_0: # else
# {
.annotate 'line', 2324
$P3 = self.'tempreg'('I')
set $S1, $P3
.annotate 'line', 2325
self.'emit'(__ARG_1, $S1)
# }
__label_1: # endif
.annotate 'line', 2327
.return($S1)
# }
.annotate 'line', 2328

.end # emit_getint


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2329
# Body
# {
.annotate 'line', 2331
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2332

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2286
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2337
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2335
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2345
# Body
# {
.annotate 'line', 2347
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2348
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2349
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2350
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2351
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2352

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2353
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2354
# Body
# {
.annotate 'line', 2356
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2357
.return(self)
# }
.annotate 'line', 2358

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2359
# Body
# {
.annotate 'line', 2361
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2362
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2363
self.'annotate'(__ARG_1)
.annotate 'line', 2364
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2365
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2366
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2367

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2342
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2344
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2380
# Body
# {
.annotate 'line', 2382
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2383
.return(self)
# }
.annotate 'line', 2384

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2385
# Body
# {
.annotate 'line', 2387
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2388

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2389
# Body
# {
.annotate 'line', 2391
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2392
.return(self)
# }
.annotate 'line', 2393

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2394
# Body
# {
.annotate 'line', 2396
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2397
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2398
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2400
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2401
ne $I1, 0, __label_4
.annotate 'line', 2402
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2404
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2407
.return(0)
# }
.annotate 'line', 2408

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2409
# Body
# {
.annotate 'line', 2411
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2413
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2414
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2415
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2417
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2418
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2419
set $S3, $S2
set $S4, 'S'
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
.annotate 'line', 2422
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2425
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2428
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2431

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2432
# Body
# {
.annotate 'line', 2434
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2436
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2437
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2438
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2440
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2441
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2442
set $S3, $S2
set $S4, 'S'
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
.annotate 'line', 2445
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2448
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2451
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2454

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2379
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2461
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2462
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2459
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2470
# Body
# {
.annotate 'line', 2472
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2473
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2474

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2475
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2476
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2477
# Body
# {
.annotate 'line', 2479
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2480
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2481
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2482
# int need_unicode: $I2
null $I2
.annotate 'line', 2483
box $P2, $S1
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2484
le $I3, 127, __label_3
# {
.annotate 'line', 2485
set $I2, 1
goto __label_2 # break
.annotate 'line', 2486
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2489
unless $I2 goto __label_4
# {
.annotate 'line', 2490
unless $I1 goto __label_5
# {
.annotate 'line', 2491
null $I1
.annotate 'line', 2492
# string saux: $S2
set $S2, $S1
.annotate 'line', 2493
set $S1, ''
.annotate 'line', 2494
box $P2, $S2
iter $P4, $P2
set $P4, 0
__label_6: # for iteration
unless $P4 goto __label_7
shift $S3, $P4
# {
.annotate 'line', 2495
ne $S3, '\', __label_8
.annotate 'line', 2496
set $S3, '\\'
__label_8: # endif
.annotate 'line', 2497
concat $S1, $S1, $S3
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2500
# string result: $S4
set $S4, ''
.annotate 'line', 2501
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2502
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2503
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2504
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2505
le $I6, 127, __label_12
# {
.annotate 'line', 2506
# string h: $S6
box $P5, $I6
$P2 = $P5.'get_as_base'(16)
null $S6
if_null $P2, __label_14
set $S6, $P2
__label_14:
.annotate 'line', 2507
concat $S4, $S4, '\x{'
concat $S4, $S4, $S6
concat $S4, $S4, '}'
# }
goto __label_13
__label_12: # else
.annotate 'line', 2510
concat $S4, $S4, $S5
__label_13: # endif
# }
__label_9: # for iteration
.annotate 'line', 2502
inc $I5
goto __label_11
__label_10: # for end
.annotate 'line', 2512
set $S1, $S4
# }
__label_4: # endif
.annotate 'line', 2514
# string q: $S7
unless $I1 goto __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
.annotate 'line', 2515
concat $S0, $S7, $S1
concat $S0, $S0, $S7
set $S1, $S0
.annotate 'line', 2516
unless $I2 goto __label_17
.annotate 'line', 2517
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2518
.return($S1)
# }
.annotate 'line', 2519

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2520
# Body
# {
.annotate 'line', 2522
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2523
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2524
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2525
# var s: $P2
box $P2, $S1
.annotate 'line', 2526
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2528
.return($S1)
# }
.annotate 'line', 2529

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2530
# Body
# {
.annotate 'line', 2532
set $S1, __ARG_2
eq $S1, '', __label_0
.annotate 'line', 2533
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2534

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2535
# Body
# {
.annotate 'line', 2537
.tailcall self.'getPirString'()
# }
.annotate 'line', 2538

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2467
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2469
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2547
# Body
# {
.annotate 'line', 2550
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2551
setattribute self, 'pos', __ARG_2
.annotate 'line', 2552
# int n: $I1
null $I1
.annotate 'line', 2553
unless __ARG_4 goto __label_0
.annotate 'line', 2554
set $I1, __ARG_3
goto __label_1
__label_0: # else
# {
.annotate 'line', 2556
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 2557
set $I1, $S1
# }
__label_1: # endif
.annotate 'line', 2559
box $P1, $I1
setattribute self, 'numval', $P1
# }
.annotate 'line', 2560

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2561
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2562
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2563
# Body
# {
.annotate 'line', 2565
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2566
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2567
.return($I1)
# }
.annotate 'line', 2568

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2569
# Body
# {
.annotate 'line', 2571
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2572
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2573
ne $I1, 0, __label_1
.annotate 'line', 2574
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2576
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2578

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2579
# Body
# {
.annotate 'line', 2581
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2582

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2543
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2545
addattribute $P0, 'pos'
.annotate 'line', 2546
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2590
# Body
# {
.annotate 'line', 2592
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2593
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2594

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2595
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2596
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2597
# Body
# {
.annotate 'line', 2599
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2600
# var n: $P1
new $P1, [ 'Float' ]
.annotate 'line', 2601
assign $P1, $S1
.annotate 'line', 2602
.return($P1)
# }
.annotate 'line', 2603

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2604
# Body
# {
.annotate 'line', 2606
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2607
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2608
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2610

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2611
# Body
# {
.annotate 'line', 2615
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2616
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
.annotate 'line', 2617
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2618
.return($S1)
# }
.annotate 'line', 2619

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2587
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2589
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2627
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2628
# Body
# {
.annotate 'line', 2630
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2631
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2632

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2633
# Body
# {
.annotate 'line', 2635
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2636

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2637
# Body
# {
.annotate 'line', 2639
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2640
if_null $P1, __label_0
.annotate 'line', 2641
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2643
getattribute $P2, self, 'name'
set $S1, $P2
set $S2, 'self'
if $S1 == $S2 goto __label_4
set $S2, 'null'
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 2646
.return('P')
__label_3: # default
.annotate 'line', 2648
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2651

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2652
# Body
# {
.annotate 'line', 2654
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2655
.return($S1)
# }
.annotate 'line', 2656

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2657
# Body
# {
.annotate 'line', 2659
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2660
unless_null $P1, __label_0
.annotate 'line', 2661
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2662
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2663
# string s: $S1
null $S1
.annotate 'line', 2664
unless_null $P2, __label_1
# {
.annotate 'line', 2665
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2666
set $S3, $S2
set $S4, 'self'
if $S3 == $S4 goto __label_6
set $S4, 'null'
if $S3 == $S4 goto __label_7
goto __label_5
# switch
__label_6: # case
.annotate 'line', 2668
set $S1, 'self'
goto __label_4 # break
__label_7: # case
.annotate 'line', 2670
set $S1, 'null'
goto __label_4 # break
__label_5: # default
.annotate 'line', 2672
set $S1, ''
__label_4: # switch end
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2676
$P3 = $P2.'getid'()
if_null $P3, __label_8
.annotate 'line', 2677
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2679
$P4 = $P2.'getreg'()
set $S1, $P4
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2681
.return($S1)
# }
.annotate 'line', 2682

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2683
# Body
# {
.annotate 'line', 2685
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2686
set $S2, $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2687
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2688
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2690
.return($P1)
# }
.annotate 'line', 2691

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2692
# Body
# {
.annotate 'line', 2694
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2695
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2696
if_null $P2, __label_0
# {
.annotate 'line', 2697
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2698
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2700
.return(self)
# }
.annotate 'line', 2701

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2702
# Body
# {
.annotate 'line', 2704
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2705
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2706
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
$I1 = $P1.'isvolatile'()
__label_2:
unless $I1 goto __label_1
# {
.annotate 'line', 2707
# string lexname: $S2
$P2 = $P1.'getlex'()
null $S2
if_null $P2, __label_3
set $S2, $P2
__label_3:
.annotate 'line', 2708
isnull $I1, $S2
not $I1
unless $I1 goto __label_5
isne $I1, $S2, ''
__label_5:
unless $I1 goto __label_4
.annotate 'line', 2709
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 2711
.return($S1)
# }
.annotate 'line', 2712

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2713
# Body
# {
.annotate 'line', 2715
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 2716
self.'annotate'(__ARG_1)
.annotate 'line', 2717
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2718
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2720

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2721
# Body
# {
.annotate 'line', 2723
self.'annotate'(__ARG_1)
.annotate 'line', 2724
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2725
.return($S1)
# }
.annotate 'line', 2726

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2727
# Body
# {
.annotate 'line', 2729
self.'annotate'(__ARG_1)
.annotate 'line', 2730
$P2 = self.'isnull'()
if_null $P2, __label_0
unless $P2 goto __label_0
# predefined die
.annotate 'line', 2731
die "NO"
__label_0: # endif
.annotate 'line', 2732
# string typeleft: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2733
# string lreg: $S2
$P2 = self.'getIdentifier'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 2734
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
# {
.annotate 'line', 2735
set $S6, $S1
set $S7, 'S'
if $S6 == $S7 goto __label_7
set $S7, 'P'
if $S6 == $S7 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2738
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2741
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2744
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2745
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2747
# string typeright: $S3
$P2 = __ARG_2.'checkresult'()
null $S3
if_null $P2, __label_11
set $S3, $P2
__label_11:
.annotate 'line', 2748
ne $S3, 'v', __label_12
.annotate 'line', 2749
getattribute $P2, self, 'start'
'SyntaxError'("Can't assign from void expression", $P2)
__label_12: # endif
.annotate 'line', 2750
ne $S1, $S3, __label_13
# {
.annotate 'line', 2751
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 2754
# string rreg: $S4
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_15
set $S4, $P2
__label_15:
.annotate 'line', 2755
self.'annotate'(__ARG_1)
.annotate 'line', 2756
iseq $I1, $S1, 'P'
unless $I1 goto __label_18
isne $I1, $S3, 'P'
__label_18:
unless $I1 goto __label_16
.annotate 'line', 2757
__ARG_1.'emitbox'($S2, $S4)
goto __label_17
__label_16: # else
.annotate 'line', 2759
__ARG_1.'emitset'($S2, $S4)
__label_17: # endif
# }
__label_14: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2762
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2763
$P2 = $P1.'isvolatile'()
if_null $P2, __label_19
unless $P2 goto __label_19
# {
.annotate 'line', 2764
# string lexname: $S5
$P3 = $P1.'getlex'()
null $S5
if_null $P3, __label_20
set $S5, $P3
__label_20:
.annotate 'line', 2765
isnull $I1, $S5
not $I1
unless $I1 goto __label_22
isne $I1, $S5, ''
__label_22:
unless $I1 goto __label_21
.annotate 'line', 2766
__ARG_1.'say'("store_lex '", $S5, "', ", $S2)
__label_21: # endif
# }
__label_19: # endif
.annotate 'line', 2768
.return($S2)
# }
.annotate 'line', 2769

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2624
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2626
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2776
# Body
# {
.annotate 'line', 2778
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2779

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2774
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2787
# Body
# {
.annotate 'line', 2789
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2790
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2791

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2792
# Body
# {
.annotate 'line', 2794
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2795

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2796
# Body
# {
.annotate 'line', 2798
self.'optimizearg'()
.annotate 'line', 2799
.return(self)
# }
.annotate 'line', 2800

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2784
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2786
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2809
# Body
# {
.annotate 'line', 2811
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2812
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2813
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2814

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2815
# Body
# {
.annotate 'line', 2817
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2818
.return(self)
# }
.annotate 'line', 2819

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2820
# Body
# {
.annotate 'line', 2822
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2823

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2824
# Body
# {
.annotate 'line', 2826
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2827
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2828

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2829
# Body
# {
.annotate 'line', 2831
self.'optimizearg'()
.annotate 'line', 2832
.return(self)
# }
.annotate 'line', 2833

.end # optimize


.sub 'emit_intleft' :method
.param pmc __ARG_1

.annotate 'line', 2834
# Body
# {
.annotate 'line', 2836
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2837
.return($S1)
# }
.annotate 'line', 2838

.end # emit_intleft


.sub 'emit_intright' :method
.param pmc __ARG_1

.annotate 'line', 2839
# Body
# {
.annotate 'line', 2841
# string reg: $S1
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2842
.return($S1)
# }
.annotate 'line', 2843

.end # emit_intright

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2805
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2807
addattribute $P0, 'lexpr'
.annotate 'line', 2808
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2850
# Body
# {
.annotate 'line', 2852
.return('I')
# }
.annotate 'line', 2853

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2854
# Body
# {
.annotate 'line', 2856
self.'optimizearg'()
.annotate 'line', 2857
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2858
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2859
$I3 = $P1.'isintegerliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 2860
# int li: $I1
# predefined int
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 2861
# int ri: $I2
# predefined int
getattribute $P3, $P2, 'numval'
set $I2, $P3
.annotate 'line', 2862
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
$P5 = self.'do_op'($I1, $I2)
.tailcall 'integerValue'($P3, $P4, $P5)
# }
__label_0: # endif
.annotate 'line', 2864
.return(self)
# }
.annotate 'line', 2865

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 2848
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2872
# Body
# {
.annotate 'line', 2874
.return('I')
# }
.annotate 'line', 2875

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2876
# Body
# {
.annotate 'line', 2878
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2879
.return(self)
# }
.annotate 'line', 2880

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2881
# Body
# {
.annotate 'line', 2883
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2884
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_2
$P2 = $P1.'checkresult'()
set $S1, $P2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 2885
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 2886
self.'annotate'(__ARG_1)
.annotate 'line', 2887
__ARG_1.'print'('delete ')
.annotate 'line', 2888
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 2889
__ARG_1.'say'()
.annotate 'line', 2890
set $S1, __ARG_2
eq $S1, '', __label_3
.annotate 'line', 2891
__ARG_1.'emitset'(__ARG_2, '1')
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 2894
getattribute $P2, self, 'start'
'SyntaxError'("delete with invalid operator", $P2)
__label_1: # endif
# }
.annotate 'line', 2895

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 2870
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2902
# Body
# {
.annotate 'line', 2904
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2905

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2906
# Body
# {
.annotate 'line', 2908
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2909
.return(self)
# }
.annotate 'line', 2910

.end # set


.sub 'optimize' :method

.annotate 'line', 2911
# Body
# {
.annotate 'line', 2913
self.'optimizearg'()
.annotate 'line', 2914
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2915
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2916
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2917
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2920
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isfloatliteral'()
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 2921
# var numval: $P2
getattribute $P5, self, 'subexpr'
getattribute $P2, $P5, 'numval'
.annotate 'line', 2922
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2923
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P3, $P5, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2926
.return(self)
# }
.annotate 'line', 2927

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2928
# Body
# {
.annotate 'line', 2930
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2931
self.'annotate'(__ARG_1)
.annotate 'line', 2932
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2933

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2900
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2940
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2941
# Body
# {
.annotate 'line', 2943
.return('I')
# }
.annotate 'line', 2944

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2945
# Body
# {
.annotate 'line', 2947
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2948
.return(self)
# }
.annotate 'line', 2949

.end # set


.sub 'optimize' :method

.annotate 'line', 2950
# Body
# {
.annotate 'line', 2952
self.'optimizearg'()
.annotate 'line', 2953
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2954
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2955
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2956
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2957
getattribute $P3, self, 'owner'
getattribute $P4, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P4, $I2)
# }
__label_0: # endif
.annotate 'line', 2959
$P3 = $P1.'isnegable'()
if_null $P3, __label_1
unless $P3 goto __label_1
.annotate 'line', 2960
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2961
.return(self)
# }
.annotate 'line', 2962

.end # optimize


.sub 'negated' :method

.annotate 'line', 2963
# Body
# {
.annotate 'line', 2965
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2966

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2967
# Body
# {
.annotate 'line', 2969
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2970
self.'annotate'(__ARG_1)
.annotate 'line', 2971
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2972
set $S3, $S2
set $S4, 'I'
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2974
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2977
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2980
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2982

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2938
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2989
# Body
# {
.annotate 'line', 2991
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2992

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2993
# Body
# {
.annotate 'line', 2995
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2996
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2997
.return(self)
# }
.annotate 'line', 2998

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2999
# Body
# {
.annotate 'line', 3001
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3002
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3003
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3004

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3005
# Body
# {
.annotate 'line', 3007
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3008
self.'annotate'(__ARG_1)
.annotate 'line', 3009
__ARG_1.'emitinc'($S1)
.annotate 'line', 3010
.return($S1)
# }
.annotate 'line', 3011

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2987
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3018
# Body
# {
.annotate 'line', 3020
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3021
.return(self)
# }
.annotate 'line', 3022

.end # set


.sub 'checkresult' :method

.annotate 'line', 3023
# Body
# {
.annotate 'line', 3025
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3026

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3027
# Body
# {
.annotate 'line', 3029
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3030
self.'annotate'(__ARG_1)
.annotate 'line', 3031
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3032
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3033
__ARG_1.'emitinc'($S1)
.annotate 'line', 3034
.return($S1)
# }
.annotate 'line', 3035

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3016
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3042
# Body
# {
.annotate 'line', 3044
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3045

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3046
# Body
# {
.annotate 'line', 3048
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3049
.return(self)
# }
.annotate 'line', 3050

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3051
# Body
# {
.annotate 'line', 3053
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3054
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3055
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3056

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3057
# Body
# {
.annotate 'line', 3059
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3060
self.'annotate'(__ARG_1)
.annotate 'line', 3061
__ARG_1.'emitdec'($S1)
.annotate 'line', 3062
.return($S1)
# }
.annotate 'line', 3063

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3040
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3070
# Body
# {
.annotate 'line', 3072
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3073
.return(self)
# }
.annotate 'line', 3074

.end # set


.sub 'checkresult' :method

.annotate 'line', 3075
# Body
# {
.annotate 'line', 3077
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3078

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3079
# Body
# {
.annotate 'line', 3081
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3082
self.'annotate'(__ARG_1)
.annotate 'line', 3083
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3084
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3085
__ARG_1.'emitdec'($S1)
.annotate 'line', 3086
.return($S1)
# }
.annotate 'line', 3087

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3068
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3096
# Body
# {
.annotate 'line', 3098
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3099
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3100
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3101
.return(self)
# }
.annotate 'line', 3102

.end # set


.sub 'checkresult' :method

.annotate 'line', 3103
# Body
# {
.annotate 'line', 3105
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 3106
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkresult'()
goto __label_1
__label_0: # else
.annotate 'line', 3108
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 3109

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 3110
# Body
# {
.annotate 'line', 3112
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 3113
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 3114
.return(self)
# }
.annotate 'line', 3115

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 3116
# Body
# {
.annotate 'line', 3118
.tailcall self.'optimize_base'()
# }
.annotate 'line', 3119

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3092
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3094
addattribute $P0, 'lexpr'
.annotate 'line', 3095
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3126
# Body
# {
.annotate 'line', 3128
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3129
set $S2, __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 3130
self.'annotate'(__ARG_1)
.annotate 'line', 3131
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 3133

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3134
# Body
# {
.annotate 'line', 3136
self.'annotate'(__ARG_1)
.annotate 'line', 3137
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3138
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3139

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3124
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3146
# Body
# {
.annotate 'line', 3148
self.'annotate'(__ARG_1)
.annotate 'line', 3149
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3150
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 3151
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3152

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3153
# Body
# {
.annotate 'line', 3155
self.'annotate'(__ARG_1)
.annotate 'line', 3156
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3157
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3158
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3159
.return($S1)
# }
.annotate 'line', 3160

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3144
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3167
# Body
# {
.annotate 'line', 3169
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3170
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3171
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3172

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3173
# Body
# {
.annotate 'line', 3175
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3176
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3177
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3178
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3179
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 3180
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3182
# string reg2: $S3
$P3 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 3183
self.'annotate'(__ARG_1)
.annotate 'line', 3184
ne $S1, 'S', __label_6
# {
.annotate 'line', 3185
$P3 = $P2.'checkresult'()
set $S5, $P3
eq $S5, 'S', __label_8
# {
.annotate 'line', 3186
# string aux: $S4
$P4 = self.'tempreg'('S')
null $S4
if_null $P4, __label_9
set $S4, $P4
__label_9:
.annotate 'line', 3187
__ARG_1.'emitset'($S4, $S3)
.annotate 'line', 3188
set $S3, $S4
# }
__label_8: # endif
.annotate 'line', 3190
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 3193
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 3195
.return($S2)
# }
.annotate 'line', 3196

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3165
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3203
# Body
# {
.annotate 'line', 3205
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3206
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3207
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3208

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3209
# Body
# {
.annotate 'line', 3211
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3212
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3213
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3214
self.'annotate'(__ARG_1)
.annotate 'line', 3215
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 3216
.return($S2)
# }
.annotate 'line', 3217

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3201
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3224
# Body
# {
.annotate 'line', 3226
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3227
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3228
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3229

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3230
# Body
# {
.annotate 'line', 3232
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3233
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3234
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3235
self.'annotate'(__ARG_1)
.annotate 'line', 3236
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 3237
.return($S2)
# }
.annotate 'line', 3238

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3222
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3245
# Body
# {
.annotate 'line', 3247
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3248
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3249
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3250

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3251
# Body
# {
.annotate 'line', 3253
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3254
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3255
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3256
self.'annotate'(__ARG_1)
.annotate 'line', 3257
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3258
.return($S2)
# }
.annotate 'line', 3259

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3243
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3266
# Body
# {
.annotate 'line', 3268
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3269
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3270
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3271

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3272
# Body
# {
.annotate 'line', 3274
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3275
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3276
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3277
self.'annotate'(__ARG_1)
.annotate 'line', 3278
__ARG_1.'say'('mod ', $S2, ', ', $S3)
.annotate 'line', 3279
.return($S2)
# }
.annotate 'line', 3280

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3264
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3287
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3288
# Body
# {
.annotate 'line', 3290
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3291
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3292
# string regl: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3293
# string regr: $S4
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P1, __label_3
set $S4, $P1
__label_3:
.annotate 'line', 3294
self.'annotate'(__ARG_1)
.annotate 'line', 3295
# string aux: $S5
null $S5
.annotate 'line', 3296
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3298
ne $S1, 'I', __label_7
# {
.annotate 'line', 3299
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3300
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3301
set $S3, $S5
# }
__label_7: # endif
.annotate 'line', 3303
ne $S2, 'I', __label_8
# {
.annotate 'line', 3304
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3305
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3306
set $S4, $S5
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3309
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3310
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3311
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3312
set $S3, $S5
# }
goto __label_10
__label_9: # else
.annotate 'line', 3314
iseq $I1, $S2, 'P'
unless $I1 goto __label_14
iseq $I1, $S1, 'I'
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3315
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3316
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3317
set $S4, $S5
# }
goto __label_13
__label_12: # else
.annotate 'line', 3319
iseq $I1, $S2, 'S'
unless $I1 goto __label_17
iseq $I1, $S1, 'P'
__label_17:
unless $I1 goto __label_15
# {
.annotate 'line', 3320
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3321
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3322
set $S3, $S5
# }
goto __label_16
__label_15: # else
.annotate 'line', 3324
iseq $I1, $S2, 'P'
unless $I1 goto __label_19
iseq $I1, $S1, 'S'
__label_19:
unless $I1 goto __label_18
# {
.annotate 'line', 3325
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3326
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3327
set $S4, $S5
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 3330
set $I1, __ARG_3
null $I2
if $I1 == $I2 goto __label_22
set $I2, 1
if $I1 == $I2 goto __label_23
set $I2, 2
if $I1 == $I2 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3332
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3335
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3338
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3339
# }
.annotate 'line', 3341

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3342
# Body
# {
.annotate 'line', 3344
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3345

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3346
# Body
# {
.annotate 'line', 3348
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3349

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3350
# Body
# {
.annotate 'line', 3352
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3353

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3285
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3366
# Body
# {
.annotate 'line', 3368
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3369
setattribute self, 'expr', __ARG_2
.annotate 'line', 3370
box $P1, __ARG_3
setattribute self, 'checknull', $P1
# }
.annotate 'line', 3371

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3372
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3373
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3374
# Body
# {
.annotate 'line', 3376
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
.annotate 'line', 3377
box $P1, $I1
setattribute self, 'checknull', $P1
.annotate 'line', 3378
.return(self)
# }
.annotate 'line', 3379

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3380
# Body
# {
.annotate 'line', 3382
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3383
self.'annotate'(__ARG_1)
.annotate 'line', 3384
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3385
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3386
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3387

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3388
# Body
# {
.annotate 'line', 3390
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3391
self.'annotate'(__ARG_1)
.annotate 'line', 3392
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
.annotate 'line', 3393

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3361
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3363
addattribute $P0, 'expr'
.annotate 'line', 3364
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3400
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3401
# Body
# {
.annotate 'line', 3403
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3404

.end # negated


.sub 'optimize' :method

.annotate 'line', 3405
# Body
# {
.annotate 'line', 3407
self.'optimizearg'()
.annotate 'line', 3408
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3409
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3410
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3411
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3412
unless $I1 goto __label_0
# {
.annotate 'line', 3413
unless $I2 goto __label_1
.annotate 'line', 3414
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3416
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 1)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3418
unless $I2 goto __label_3
.annotate 'line', 3419
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 1)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3420
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3421
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3422
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3423
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3424
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3425
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3426
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
iseq $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3429
.return(self)
# }
.annotate 'line', 3430

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3431
# Body
# {
.annotate 'line', 3433
__ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3434

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3435
# Body
# {
.annotate 'line', 3437
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3438

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3439
# Body
# {
.annotate 'line', 3441
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3442

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3443
# Body
# {
.annotate 'line', 3445
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3446

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3398
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3453
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3454
# Body
# {
.annotate 'line', 3456
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3457

.end # negated


.sub 'optimize' :method

.annotate 'line', 3458
# Body
# {
.annotate 'line', 3460
self.'optimizearg'()
.annotate 'line', 3461
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3462
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3463
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3464
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3465
unless $I1 goto __label_0
# {
.annotate 'line', 3466
unless $I2 goto __label_1
.annotate 'line', 3467
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3469
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 0)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3471
unless $I2 goto __label_3
.annotate 'line', 3472
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 0)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3473
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3474
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3475
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3476
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3477
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3478
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3479
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
isne $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3482
.return(self)
# }
.annotate 'line', 3483

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3484
# Body
# {
.annotate 'line', 3486
__ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3487

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3488
# Body
# {
.annotate 'line', 3490
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3491

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3492
# Body
# {
.annotate 'line', 3494
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3495

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3496
# Body
# {
.annotate 'line', 3498
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3499

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3451
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

.annotate 'line', 3507
# Body
# {
.annotate 'line', 3509
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3510
box $P1, __ARG_1
setattribute self, 'positive', $P1
# }
.annotate 'line', 3511

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3512
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3513
# Body
# {
.annotate 'line', 3515
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3516
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
.annotate 'line', 3517

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3518
# Body
# {
.annotate 'line', 3520
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3521
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3522
__ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3523

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3524
# Body
# {
.annotate 'line', 3526
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3527

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3528
# Body
# {
.annotate 'line', 3530
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3531
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3532
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3533

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3534
# Body
# {
.annotate 'line', 3536
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3537
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3538
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3539

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3504
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3506
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3546
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3547
# Body
# {
.annotate 'line', 3549
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3550

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3551
# Body
# {
.annotate 'line', 3553
__ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3554

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3555
# Body
# {
.annotate 'line', 3557
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3558

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3559
# Body
# {
.annotate 'line', 3561
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3562

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3544
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3569
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3570
# Body
# {
.annotate 'line', 3572
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3573

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3574
# Body
# {
.annotate 'line', 3576
__ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3577

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3578
# Body
# {
.annotate 'line', 3580
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3581

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3582
# Body
# {
.annotate 'line', 3584
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3585

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3567
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3592
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3593
# Body
# {
.annotate 'line', 3595
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3596

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3597
# Body
# {
.annotate 'line', 3599
__ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3600

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3601
# Body
# {
.annotate 'line', 3603
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3604

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3605
# Body
# {
.annotate 'line', 3607
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3608

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3590
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3615
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3616
# Body
# {
.annotate 'line', 3618
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3619

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3620
# Body
# {
.annotate 'line', 3622
__ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3623

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3624
# Body
# {
.annotate 'line', 3626
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3627

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3628
# Body
# {
.annotate 'line', 3630
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3631

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3613
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3638
# Body
# {
.annotate 'line', 3640
.return('I')
# }
.annotate 'line', 3641

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3636
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3648
# Body
# {
.annotate 'line', 3650
self.'optimizearg'()
.annotate 'line', 3651
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3652
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3653
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3654
eq $I1, 0, __label_1
.annotate 'line', 3655
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3657
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3659
.return(self)
# }
.annotate 'line', 3660

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3661
# Body
# {
.annotate 'line', 3663
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
.annotate 'line', 3664
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3665
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3666
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 3667
__ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3670
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_8
set $S4, $P1
__label_8:
.annotate 'line', 3671
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3672
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3673
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3674
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3676

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3646
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3683
# Body
# {
.annotate 'line', 3685
self.'optimizearg'()
.annotate 'line', 3686
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3687
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3688
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3689
ne $I1, 0, __label_1
.annotate 'line', 3690
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3692
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3694
.return(self)
# }
.annotate 'line', 3695

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3696
# Body
# {
.annotate 'line', 3698
# string res: $S1
null $S1
.annotate 'line', 3699
if_null __ARG_2, __label_0
.annotate 'line', 3700
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3702
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3703
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3704
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3705
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_6
set $S3, $P1
__label_6:
.annotate 'line', 3706
__ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3709
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_7
set $S4, $P1
__label_7:
.annotate 'line', 3710
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3711
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3712
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3713
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3715

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3681
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3720
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3728
# Body
# {
.annotate 'line', 3730
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
.annotate 'line', 3731
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3732
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3733
self.'annotate'(__ARG_1)
.annotate 'line', 3734
__ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3735

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3736
# Body
# {
.annotate 'line', 3738
band $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3739

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3726
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3746
# Body
# {
.annotate 'line', 3748
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
.annotate 'line', 3749
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3750
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3751
self.'annotate'(__ARG_1)
.annotate 'line', 3752
__ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 3753

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3754
# Body
# {
.annotate 'line', 3756
bor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3757

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3744
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3765
# Body
# {
.annotate 'line', 3767
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3768
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3769
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3770
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3771
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3773
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3775
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_4
# {
.annotate 'line', 3776
getattribute $P2, __ARG_4, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3777
getattribute $P1, self, 'values'
$P1.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3780
root_new $P2, ['parrot';'ResizablePMCArray']
$P2.'push'(__ARG_3)
$P2.'push'(__ARG_4)
setattribute self, 'values', $P2
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3781

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3782
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3783
# Body
# {
.annotate 'line', 3785
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3786
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3787
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3788
# int i: $I2
null $I2
# for loop
.annotate 'line', 3789
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3790
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3789
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3791
.return($P2)
# }
.annotate 'line', 3792

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3793
# Body
# {
.annotate 'line', 3795
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3796
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3797
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3798
self.'annotate'(__ARG_1)
.annotate 'line', 3799
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3800
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3801
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3800
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3802
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3803

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3804
# Body
# {
.annotate 'line', 3806
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3807
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3808
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3809
self.'annotate'(__ARG_1)
.annotate 'line', 3810
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3811
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 3812
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_1: # for iteration
.annotate 'line', 3811
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3813
.return($S1)
# }
.annotate 'line', 3814

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3815
# Body
# {
.annotate 'line', 3817
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3818
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3819
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3820
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3821
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3820
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3822

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3823
# Body
# {
.annotate 'line', 3825
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3826
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3827
self.'annotate'(__ARG_1)
.annotate 'line', 3828
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 3829
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3830
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3829
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3831

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3762
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3764
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3838
# Body
# {
.annotate 'line', 3840
self.'optimizearg'()
.annotate 'line', 3841
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3842
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3843
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3844
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3845
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3846
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3847
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3848
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3849
# var t: $P5
null $P5
.annotate 'line', 3850
# string es: $S3
getattribute $P10, $P3, 'str'
null $S3
if_null $P10, __label_6
set $S3, $P10
__label_6:
.annotate 'line', 3851
# string rs: $S4
getattribute $P10, $P4, 'str'
null $S4
if_null $P10, __label_7
set $S4, $P10
__label_7:
.annotate 'line', 3852
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3853
new $P10, [ 'TokenSingleQuoted' ]
getattribute $P11, $P3, 'file'
getattribute $P12, $P3, 'line'
concat $S5, $S3, $S4
$P10.'TokenSingleQuoted'($P11, $P12, $S5)
set $P5, $P10
goto __label_9
__label_8: # else
.annotate 'line', 3855
new $P13, [ 'TokenQuoted' ]
getattribute $P14, $P3, 'file'
getattribute $P15, $P3, 'line'
concat $S6, $S3, $S4
$P13.'TokenQuoted'($P14, $P15, $S6)
set $P5, $P13
__label_9: # endif
.annotate 'line', 3856
new $P11, [ 'StringLiteral' ]
getattribute $P12, self, 'owner'
$P11.'StringLiteral'($P12, $P5)
set $P10, $P11
.return($P10)
# }
__label_4: # endif
.annotate 'line', 3858
iseq $I3, $S1, 'I'
unless $I3 goto __label_12
iseq $I3, $S2, 'I'
__label_12:
unless $I3 goto __label_11
# {
.annotate 'line', 3859
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3860
# int ln: $I1
set $P10, $P6
set $I1, $P10
.annotate 'line', 3861
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3862
# int rn: $I2
set $P10, $P7
set $I2, $P10
.annotate 'line', 3863
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $I3, $I1, $I2
.tailcall 'integerValue'($P10, $P11, $I3)
# }
__label_11: # endif
# {
.annotate 'line', 3866
$P10 = 'floatresult'($S1, $S2)
if_null $P10, __label_13
unless $P10 goto __label_13
# {
.annotate 'line', 3867
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3868
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3869
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3870
# float rf: $N2
# predefined string
set $S5, $P9
set $N2, $S5
.annotate 'line', 3871
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3875
iseq $I3, $S1, 'S'
unless $I3 goto __label_15
iseq $I3, $S2, 'S'
__label_15:
unless $I3 goto __label_14
# {
.annotate 'line', 3876
new $P11, [ 'ConcatString' ]
getattribute $P12, self, 'owner'
getattribute $P13, self, 'start'
$P11.'ConcatString'($P12, $P13, $P1, $P2)
set $P10, $P11
.return($P10)
# }
__label_14: # endif
.annotate 'line', 3878
.return(self)
# }
.annotate 'line', 3879

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3880
# Body
# {
.annotate 'line', 3882
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3883
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3884
ne $S1, $S2, __label_2
.annotate 'line', 3885
.return($S1)
__label_2: # endif
.annotate 'line', 3886
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3887
.return('S')
__label_3: # endif
.annotate 'line', 3888
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3889
.return('S')
__label_5: # endif
.annotate 'line', 3890
$P1 = 'floatresult'($S1, $S2)
if_null $P1, __label_7
unless $P1 goto __label_7
.annotate 'line', 3891
.return('N')
__label_7: # endif
.annotate 'line', 3892
.return('I')
# }
.annotate 'line', 3893

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3894
# Body
# {
.annotate 'line', 3896
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3897
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3898
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3899
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3900
# string rtype: $S3
$P3 = $P2.'checkresult'()
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3902
# string rleft: $S4
$P3 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3903
# string rright: $S5
$P3 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_4
set $S5, $P3
__label_4:
.annotate 'line', 3904
ne $S1, 'S', __label_5
# {
.annotate 'line', 3905
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3906
# string aux: $S6
$P3 = self.'tempreg'('S')
null $S6
if_null $P3, __label_9
set $S6, $P3
__label_9:
.annotate 'line', 3907
eq $S2, 'S', __label_10
# {
.annotate 'line', 3908
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 3909
set $S4, $S6
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3912
__ARG_1.'emitset'($S6, $S5)
.annotate 'line', 3913
set $S5, $S6
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3916
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3919
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3920
# string l: $S7
null $S7
.annotate 'line', 3921
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3923
$P3 = self.'tempreg'('I')
set $S7, $P3
.annotate 'line', 3924
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3926
# string r: $S8
null $S8
.annotate 'line', 3927
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3929
$P3 = self.'tempreg'('I')
set $S8, $P3
.annotate 'line', 3930
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3932
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3935
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3937

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3836
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3944
# Body
# {
.annotate 'line', 3946
self.'optimizearg'()
.annotate 'line', 3947
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3948
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3949
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3950
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3951
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3952
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3953
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3954
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 3955
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3956
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 3957
getattribute $P5, self, 'owner'
getattribute $P6, self, 'start'
sub $I3, $I1, $I2
.tailcall 'integerValue'($P5, $P6, $I3)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3960
.return(self)
# }
.annotate 'line', 3961

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3962
# Body
# {
.annotate 'line', 3964
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3965
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3966
ne $S1, $S2, __label_2
.annotate 'line', 3967
.return($S1)
__label_2: # endif
.annotate 'line', 3968
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3969
.return('N')
__label_3: # endif
.annotate 'line', 3970
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3971
.return('N')
__label_5: # endif
.annotate 'line', 3972
.return('I')
# }
.annotate 'line', 3973

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3974
# Body
# {
.annotate 'line', 3976
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3977
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3978
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3979

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3942
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3986
# Body
# {
.annotate 'line', 3988
self.'optimizearg'()
.annotate 'line', 3989
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3990
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3991
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3992
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3993
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3994
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3995
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3996
# int ln: $I1
set $P7, $P3
set $I1, $P7
.annotate 'line', 3997
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3998
# int rn: $I2
set $P7, $P4
set $I2, $P7
.annotate 'line', 3999
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $I3, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I3)
# }
__label_4: # endif
# {
.annotate 'line', 4002
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4003
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 4004
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 4005
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 4006
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 4007
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P7, $P8, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 4011
.return(self)
# }
.annotate 'line', 4012

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4013
# Body
# {
.annotate 'line', 4015
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4016
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4017
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4018
ne $S1, $S2, __label_2
.annotate 'line', 4019
.return($S1)
__label_2: # endif
.annotate 'line', 4020
ne $S1, 'S', __label_3
.annotate 'line', 4021
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 4023
.return('N')
__label_4: # endif
# }
.annotate 'line', 4024

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4025
# Body
# {
.annotate 'line', 4027
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4028
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4029
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4030
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 4031
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 4032
ne $S1, 'S', __label_2
# {
.annotate 'line', 4033
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4034
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4035
# string rval: $S5
null $S5
.annotate 'line', 4036
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 4038
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 4041
$P3 = self.'tempreg'('I')
set $S5, $P3
.annotate 'line', 4042
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 4044
self.'annotate'(__ARG_1)
.annotate 'line', 4045
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 4046
.return()
# }
__label_2: # endif
.annotate 'line', 4048
iseq $I3, $S1, $S2
unless $I3 goto __label_7
iseq $I3, $S1, 'I'
if $I3 goto __label_9
iseq $I3, $S1, 'N'
__label_9:
if $I3 goto __label_8
iseq $I3, $S1, 'P'
__label_8:
__label_7:
unless $I3 goto __label_6
# {
.annotate 'line', 4049
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4050
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4051
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4052
.return()
# }
__label_6: # endif
.annotate 'line', 4057
ne $S1, 'N', __label_10
# {
.annotate 'line', 4058
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4059
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4060
# string rval: $S6
null $S6
.annotate 'line', 4061
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 4063
$P3 = self.'tempreg'('N')
set $S6, $P3
.annotate 'line', 4064
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4065
set $S6, $S4
goto __label_11 # break
__label_14: # case
.annotate 'line', 4068
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 4071
$P4 = self.'tempreg'('N')
set $S6, $P4
.annotate 'line', 4072
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 4074
self.'annotate'(__ARG_1)
.annotate 'line', 4075
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 4076
.return()
# }
__label_10: # endif
.annotate 'line', 4079
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 4080
$P3 = $P1.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 4081
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S3, $P4
.annotate 'line', 4082
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 4085
$P3 = $P1.'getIntegerValue'()
set $I1, $P3
.annotate 'line', 4086
set $S3, $I1
# }
__label_16: # endif
.annotate 'line', 4088
$P3 = $P2.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_20
$I3 = $P2.'isidentifier'()
__label_20:
unless $I3 goto __label_18
# {
.annotate 'line', 4089
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S4, $P4
.annotate 'line', 4090
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
.annotate 'line', 4093
set $S7, $S2
set $S8, 'S'
if $S7 == $S8 goto __label_23
set $S8, 'I'
if $S7 == $S8 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 4095
$P4 = self.'checkresult'()
$P3 = self.'tempreg'($P4)
set $S4, $P3
.annotate 'line', 4096
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 4100
$P5 = $P2.'getIntegerValue'()
set $I2, $P5
.annotate 'line', 4101
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 4102
# }
__label_19: # endif
.annotate 'line', 4105
self.'annotate'(__ARG_1)
.annotate 'line', 4106
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4107

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3984
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 4114
# Body
# {
.annotate 'line', 4116
self.'optimizearg'()
.annotate 'line', 4117
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4118
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4119
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4120
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4121
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4122
# var lval: $P3
null $P3
.annotate 'line', 4123
# var rval: $P4
null $P4
.annotate 'line', 4124
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4125
getattribute $P3, $P1, 'numval'
.annotate 'line', 4126
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4127
getattribute $P4, $P2, 'numval'
.annotate 'line', 4128
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4129
eq $I2, 0, __label_6
.annotate 'line', 4130
getattribute $P5, self, 'owner'
getattribute $P6, self, 'start'
set $N4, $I1
set $N5, $I2
div $N3, $N4, $N5
.tailcall 'integerValue'($P5, $P6, $N3)
__label_6: # endif
# }
__label_4: # endif
# {
.annotate 'line', 4133
$P5 = 'floatresult'($S1, $S2)
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 4134
getattribute $P3, $P1, 'numval'
.annotate 'line', 4135
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 4136
getattribute $P4, $P2, 'numval'
.annotate 'line', 4137
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
.annotate 'line', 4138
set $N3, 0
eq $N2, $N3, __label_8
.annotate 'line', 4139
getattribute $P5, self, 'owner'
getattribute $P6, self, 'start'
div $N4, $N1, $N2
.tailcall 'floatValue'($P5, $P6, $N4)
__label_8: # endif
# }
__label_7: # endif
# }
# }
__label_0: # endif
.annotate 'line', 4143
.return(self)
# }
.annotate 'line', 4144

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4145
# Body
# {
.annotate 'line', 4147
.return('N')
# }
.annotate 'line', 4148

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4149
# Body
# {
.annotate 'line', 4151
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4152
# var lreg: $P2
null $P2
.annotate 'line', 4153
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_0
.annotate 'line', 4154
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 4156
$P2 = self.'tempreg'('N')
.annotate 'line', 4157
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 4159
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 4160
# var rreg: $P4
null $P4
.annotate 'line', 4161
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_2
.annotate 'line', 4162
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4164
$P4 = self.'tempreg'('N')
.annotate 'line', 4165
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 4167
self.'annotate'(__ARG_1)
.annotate 'line', 4168
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 4169

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4112
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4176
# Body
# {
.annotate 'line', 4178
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4179
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4180
self.'annotate'(__ARG_1)
.annotate 'line', 4181
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4182

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4183
# Body
# {
.annotate 'line', 4185
mod $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4186

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4174
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4193
# Body
# {
.annotate 'line', 4195
.return('I')
# }
.annotate 'line', 4196

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4197
# Body
# {
.annotate 'line', 4199
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4200
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4201
self.'annotate'(__ARG_1)
.annotate 'line', 4206
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4207

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4191
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4214
# Body
# {
.annotate 'line', 4216
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
.annotate 'line', 4217
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4218
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4219
self.'annotate'(__ARG_1)
.annotate 'line', 4220
__ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4221

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4222
# Body
# {
.annotate 'line', 4224
shl $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4225

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4212
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4232
# Body
# {
.annotate 'line', 4234
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
.annotate 'line', 4235
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4236
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4237
self.'annotate'(__ARG_1)
.annotate 'line', 4238
__ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4239

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4240
# Body
# {
.annotate 'line', 4242
shr $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4243

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4230
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4252
# Body
# {
.annotate 'line', 4254
setattribute self, 'arg', __ARG_1
.annotate 'line', 4255
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4256

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4257
# Body
# {
.annotate 'line', 4259
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 4260
.return(self)
# }
.annotate 'line', 4261

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4262
# Body
# {
.annotate 'line', 4264
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4265

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 4250
addattribute $P0, 'arg'
.annotate 'line', 4251
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4268
# Body
# {
.annotate 'line', 4270
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4271
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4272
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4273
.return(1)
# }
.annotate 'line', 4274

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4283
# Body
# {
.annotate 'line', 4285
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4286
setattribute self, 'predef', __ARG_3
.annotate 'line', 4287
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4288

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4289
# Body
# {
.annotate 'line', 4291
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4292

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4293
# Body
# {
.annotate 'line', 4295
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4296
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4297
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4298
# var arg: $P4
null $P4
.annotate 'line', 4299
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
.annotate 'line', 4300
set $I4, $I1
set $I5, -1
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4302
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4303
# string reg: $S1
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 4304
$P3.'push'($S1)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4308
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4309
iter $P9, $P2
set $P9, 0
__label_7: # for iteration
unless $P9 goto __label_8
shift $P4, $P9
.annotate 'line', 4310
getattribute $P8, $P4, 'arg'
$P5.'push'($P8)
goto __label_7
__label_8: # endfor
.annotate 'line', 4311
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4312
.return()
__label_1: # default
.annotate 'line', 4314
# int n: $I2
getattribute $P12, self, 'args'
set $I2, $P12
# for loop
.annotate 'line', 4315
# int i: $I3
null $I3
__label_11: # for condition
ge $I3, $I2, __label_10
# {
.annotate 'line', 4316
$P13 = $P2[$I3]
getattribute $P4, $P13, 'arg'
.annotate 'line', 4317
# string argtype: $S2
$P6 = $P4.'checkresult'()
null $S2
if_null $P6, __label_12
set $S2, $P6
__label_12:
.annotate 'line', 4318
# string paramtype: $S3
$P6 = $P1.'paramtype'($I3)
null $S3
if_null $P6, __label_13
set $S3, $P6
__label_13:
.annotate 'line', 4319
# string argr: $S4
null $S4
.annotate 'line', 4320
iseq $I4, $S2, $S3
if $I4 goto __label_16
iseq $I4, $S3, '?'
__label_16:
unless $I4 goto __label_14
.annotate 'line', 4321
$P6 = $P4.'emit_get'(__ARG_1)
set $S4, $P6
goto __label_15
__label_14: # else
# {
.annotate 'line', 4323
$P8 = self.'tempreg'($S3)
set $S4, $P8
.annotate 'line', 4324
ne $S3, 'P', __label_17
# {
.annotate 'line', 4325
# string nreg: $S5
set $S5, ''
.annotate 'line', 4326
set $S6, $S2
set $S7, 'I'
if $S6 == $S7 goto __label_20
set $S7, 'N'
if $S6 == $S7 goto __label_21
set $S7, 'S'
if $S6 == $S7 goto __label_22
goto __label_19
# switch
__label_20: # case
.annotate 'line', 4327
set $S5, 'Integer'
goto __label_18 # break
__label_21: # case
.annotate 'line', 4328
set $S5, 'Float'
goto __label_18 # break
__label_22: # case
.annotate 'line', 4329
set $S5, 'String'
goto __label_18 # break
__label_19: # default
__label_18: # switch end
.annotate 'line', 4331
eq $S5, '', __label_23
.annotate 'line', 4332
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_23: # endif
# }
__label_17: # endif
.annotate 'line', 4334
$P4.'emit'(__ARG_1, $S4)
# }
__label_15: # endif
.annotate 'line', 4336
$P3.'push'($S4)
# }
__label_9: # for iteration
.annotate 'line', 4315
inc $I3
goto __label_11
__label_10: # for end
__label_0: # switch end
.annotate 'line', 4339
getattribute $P6, self, 'predef'
getattribute $P8, self, 'start'
$P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4340

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4278
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4280
addattribute $P0, 'predef'
.annotate 'line', 4281
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4350
# Body
# {
.annotate 'line', 4352
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4353
setattribute self, 'funref', __ARG_4
.annotate 'line', 4354
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 4355
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4356
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 4357
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4358
# {
.annotate 'line', 4359
# var modifier: $P2
null $P2
.annotate 'line', 4360
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4361
$P1 = __ARG_1.'get'()
.annotate 'line', 4362
$P4 = $P1.'isop'(':')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 4363
$P1 = __ARG_1.'get'()
.annotate 'line', 4364
$P4 = $P1.'isop'('[')
if_null $P4, __label_5
unless $P4 goto __label_5
# {
.annotate 'line', 4365
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P5
.annotate 'line', 4366
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4369
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4372
getattribute $P4, self, 'args'
new $P6, [ 'Argument' ]
$P6.'Argument'($P3, $P2)
set $P5, $P6
$P4.'push'($P5)
# }
__label_3: # continue
.annotate 'line', 4373
$P4 = $P1.'isop'(',')
if_null $P4, __label_2
if $P4 goto __label_1
__label_2: # enddo
.annotate 'line', 4374
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_7
.annotate 'line', 4375
'Expected'("')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4377

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4378
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4379
# Body
# {
.annotate 'line', 4381
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 4382
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4383
'optimize_array'($P1)
.annotate 'line', 4386
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4387
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4388
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 4389
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4390
if_null $P3, __label_2
# {
.annotate 'line', 4391
self.'use_predef'($S1)
.annotate 'line', 4394
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 4395
if_null $P4, __label_3
# {
.annotate 'line', 4396
$P5 = 'arglist_hascompilevalue'($P1)
if_null $P5, __label_4
unless $P5 goto __label_4
.annotate 'line', 4397
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
.tailcall $P4($P6, $P7, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 4400
new $P6, [ 'CallPredefExpr' ]
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
$P6.'CallPredefExpr'($P7, $P8, $P3, $P1)
set $P5, $P6
.return($P5)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4404
.return(self)
# }
.annotate 'line', 4405

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 4406
# Body
# {
.annotate 'line', 4408
.return(1)
# }
.annotate 'line', 4409

.end # cantailcall


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4410
# Body
# {
.annotate 'line', 4412
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4413
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4414
# string call: $S1
null $S1
.annotate 'line', 4415
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 4416
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4417
ne $S1, '', __label_2
# {
.annotate 'line', 4418
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
.annotate 'line', 4419
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S1, $S0
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 4423
unless $I1 goto __label_5
$P9 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P9 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P9
__label_1: # endif
.annotate 'line', 4425
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4426
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4427
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4428
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4429
# string reg: $S3
null $S3
.annotate 'line', 4430
$P9 = $P5.'isnull'()
if_null $P9, __label_8
unless $P9 goto __label_8
# {
.annotate 'line', 4431
$P10 = self.'tempreg'('P')
set $S3, $P10
.annotate 'line', 4432
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4435
$P9 = $P5.'emit_get'(__ARG_1)
set $S3, $P9
__label_9: # endif
.annotate 'line', 4436
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4438
self.'annotate'(__ARG_1)
.annotate 'line', 4440
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
set $S8, __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 4441
set $S9, __ARG_2
ne $S9, '.tailcall', __label_12
.annotate 'line', 4442
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4444
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 4447
unless $I1 goto __label_14
.annotate 'line', 4448
$P9 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P9, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4450
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4452
__ARG_1.'print'('(')
.annotate 'line', 4454
# string sep: $S4
set $S4, ''
.annotate 'line', 4455
# int n: $I2
set $P9, $P2
set $I2, $P9
# for loop
.annotate 'line', 4456
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4457
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4458
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4459
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4460
# string setname: $S6
set $S6, ''
.annotate 'line', 4461
# var modifiers: $P6
$P9 = $P3[$I3]
getattribute $P6, $P9, 'modifiers'
.annotate 'line', 4462
if_null $P6, __label_19
# {
.annotate 'line', 4463
$P9 = $P6.'getlist'()
iter $P12, $P9
set $P12, 0
__label_20: # for iteration
unless $P12 goto __label_21
shift $P7, $P12
# {
.annotate 'line', 4464
# string name: $S7
$P10 = $P7.'getname'()
null $S7
if_null $P10, __label_22
set $S7, $P10
__label_22:
.annotate 'line', 4465
ne $S7, 'flat', __label_23
.annotate 'line', 4466
set $I4, 1
__label_23: # endif
.annotate 'line', 4467
ne $S7, 'named', __label_24
# {
.annotate 'line', 4468
set $I5, 1
.annotate 'line', 4469
$P9 = $P7.'numargs'()
set $I6, $P9
null $I7
if $I6 == $I7 goto __label_27
set $I7, 1
if $I6 == $I7 goto __label_28
goto __label_26
# switch
__label_27: # case
goto __label_25 # break
__label_28: # case
.annotate 'line', 4473
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4474
$P10 = $P8.'isstringliteral'()
isfalse $I8, $P10
unless $I8 goto __label_29
.annotate 'line', 4475
getattribute $P13, self, 'start'
'SyntaxError'('Invalid modifier', $P13)
__label_29: # endif
.annotate 'line', 4476
$P14 = $P8.'getPirString'()
set $S6, $P14
goto __label_25 # break
__label_26: # default
.annotate 'line', 4479
getattribute $P15, self, 'start'
'SyntaxError'('Invalid modifier', $P15)
__label_25: # switch end
# }
__label_24: # endif
# }
goto __label_20
__label_21: # endfor
# }
__label_19: # endif
.annotate 'line', 4484
and $I6, $I4, $I5
unless $I6 goto __label_30
.annotate 'line', 4485
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 4486
unless $I4 goto __label_32
.annotate 'line', 4487
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 4488
unless $I5 goto __label_34
# {
.annotate 'line', 4489
__ARG_1.'print'(' :named')
.annotate 'line', 4490
eq $S6, '', __label_35
.annotate 'line', 4491
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
.annotate 'line', 4493
set $S4, ', '
# }
__label_16: # for iteration
.annotate 'line', 4456
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4495
__ARG_1.'say'(')')
# }
.annotate 'line', 4496

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4345
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4347
addattribute $P0, 'funref'
.annotate 'line', 4348
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4506
# Body
# {
.annotate 'line', 4508
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4509
setattribute self, 'left', __ARG_4
.annotate 'line', 4510
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4511

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4512
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4513
# Body
# {
.annotate 'line', 4515
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4516
.return(self)
# }
.annotate 'line', 4517

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4518
# Body
# {
.annotate 'line', 4520
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4521

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4522
# Body
# {
.annotate 'line', 4524
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4525
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4526
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4527
eq $S1, 'P', __label_2
# {
.annotate 'line', 4528
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4529
$P2 = self.'tempreg'('P')
set $S2, $P2
.annotate 'line', 4530
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4532
.return($S2)
# }
.annotate 'line', 4533

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4534
# Body
# {
.annotate 'line', 4536
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4537
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4538
# string result: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4539
self.'annotate'(__ARG_1)
.annotate 'line', 4540
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4541
.return($S3)
# }
.annotate 'line', 4542

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4543
# Body
# {
.annotate 'line', 4545
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4546
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4547
self.'annotate'(__ARG_1)
.annotate 'line', 4548
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4549

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4550
# Body
# {
.annotate 'line', 4552
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4553

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4554
# Body
# {
.annotate 'line', 4556
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4557
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4558
# string value: $S3
null $S3
.annotate 'line', 4559
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4561
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4562
$P1 = self.'tempreg'('P')
set __ARG_3, $P1
.annotate 'line', 4563
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
.annotate 'line', 4565
set $S3, __ARG_3
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4568
$P1 = self.'tempreg'('P')
set $S3, $P1
.annotate 'line', 4569
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4571
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4572

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4573
# Body
# {
.annotate 'line', 4575
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4576
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4577
# string value: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4578
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_3
unless $P1 goto __label_3
.annotate 'line', 4579
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4581
# string rreg: $S4
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_5
set $S4, $P2
__label_5:
.annotate 'line', 4582
$P1 = __ARG_2.'checkresult'()
set $S5, $P1
eq $S5, 'P', __label_6
.annotate 'line', 4583
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
.annotate 'line', 4585
set $S3, $S4
__label_7: # endif
# }
__label_4: # endif
.annotate 'line', 4587
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4588
.return($S3)
# }
.annotate 'line', 4589

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4501
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4503
addattribute $P0, 'left'
.annotate 'line', 4504
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4600
# Body
# {
.annotate 'line', 4602
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4603
setattribute self, 'left', __ARG_4
.annotate 'line', 4604
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4605

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4606
# Body
# {
.annotate 'line', 4608
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4609
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4611
.return('P')
__label_1: # endif
# }
.annotate 'line', 4612

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4613
# Body
# {
.annotate 'line', 4615
# var left: $P1
getattribute $P4, self, 'left'
$P1 = $P4.'optimize'()
.annotate 'line', 4616
setattribute self, 'left', $P1
.annotate 'line', 4617
self.'optimizeargs'()
.annotate 'line', 4621
$I2 = $P1.'isstringliteral'()
unless $I2 goto __label_1
$P4 = self.'numargs'()
set $I3, $P4
iseq $I2, $I3, 1
__label_1:
unless $I2 goto __label_0
# {
.annotate 'line', 4622
# var arg: $P2
$P2 = self.'getarg'(0)
.annotate 'line', 4623
$P4 = $P2.'isintegerliteral'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4624
# int ival: $I1
$P5 = $P2.'getIntegerValue'()
set $I1, $P5
.annotate 'line', 4625
# string sval: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 4626
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, self, 'start'
getattribute $P5, $P4, 'file'
getattribute $P6, self, 'start'
getattribute $P7, $P6, 'line'
.annotate 'line', 4627
# predefined substr
substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 4628
new $P5, [ 'StringLiteral' ]
getattribute $P6, self, 'owner'
$P5.'StringLiteral'($P6, $P3)
set $P4, $P5
.return($P4)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4631
.return(self)
# }
.annotate 'line', 4632

.end # optimize


.sub 'emit_prep' :method
.param pmc __ARG_1

.annotate 'line', 4633
# Body
# {
.annotate 'line', 4635
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 4636
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 4637
isnull $I1, $P1
not $I1
if $I1 goto __label_1
isnull $I1, $P2
not $I1
__label_1:
unless $I1 goto __label_0
.annotate 'line', 4638
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_args', $P3)
__label_0: # endif
.annotate 'line', 4639
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 4640
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_3
__label_2: # else
.annotate 'line', 4642
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_3: # endif
.annotate 'line', 4643
setattribute self, 'regleft', $P1
.annotate 'line', 4644
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4645
setattribute self, 'argregs', $P2
# }
.annotate 'line', 4646

.end # emit_prep


.sub 'emit_aux' :method
.param pmc __ARG_1

.annotate 'line', 4647
# Body
# {
.annotate 'line', 4649
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 4650
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 4651
isnull $I1, $P1
if $I1 goto __label_1
isnull $I1, $P2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 4652
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
__label_0: # endif
.annotate 'line', 4653
getattribute $P3, self, 'regleft'
__ARG_1.'print'($P3, '[')
.annotate 'line', 4654
getattribute $P3, self, 'argregs'
# predefined join
join $S1, '; ', $P3
__ARG_1.'print'($S1)
.annotate 'line', 4655
__ARG_1.'print'(']')
# }
.annotate 'line', 4656

.end # emit_aux


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4657
# Body
# {
.annotate 'line', 4659
self.'emit_prep'(__ARG_1)
.annotate 'line', 4660
# string type: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4661
ne $S1, 'S', __label_1
# {
.annotate 'line', 4662
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 4663
# int nargs: $I1
getattribute $P2, self, 'argregs'
# predefined elements
elements $I1, $P2
.annotate 'line', 4664
eq $I1, 1, __label_3
.annotate 'line', 4665
getattribute $P2, self, 'start'
'SyntaxError'('Bad string index', $P2)
__label_3: # endif
.annotate 'line', 4666
set $S2, __ARG_2
ne $S2, '', __label_4
.annotate 'line', 4667
__ARG_2 = self.'tempreg'('S')
__label_4: # endif
.annotate 'line', 4668
getattribute $P2, self, 'regleft'
$P3 = $P1[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 4671
self.'annotate'(__ARG_1)
.annotate 'line', 4672
__ARG_1.'print'(__ARG_2, ' = ')
.annotate 'line', 4673
self.'emit_aux'(__ARG_1)
.annotate 'line', 4674
__ARG_1.'say'('')
# }
__label_2: # endif
# }
.annotate 'line', 4676

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4677
# Body
# {
.annotate 'line', 4679
self.'emit_prep'(__ARG_1)
.annotate 'line', 4680
self.'annotate'(__ARG_1)
.annotate 'line', 4681
self.'emit_aux'(__ARG_1)
.annotate 'line', 4682
__ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 4683

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4684
# Body
# {
.annotate 'line', 4686
self.'emit_prep'(__ARG_1)
.annotate 'line', 4687
# string rreg: $S1
null $S1
.annotate 'line', 4688
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 4689
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 4690
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4693
$P1 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P1
__label_1: # endif
.annotate 'line', 4694
self.'annotate'(__ARG_1)
.annotate 'line', 4695
self.'emit_aux'(__ARG_1)
.annotate 'line', 4696
__ARG_1.'say'(' = ', $S1)
.annotate 'line', 4697
.return($S1)
# }
.annotate 'line', 4698

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4594
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4596
addattribute $P0, 'left'
.annotate 'line', 4597
addattribute $P0, 'regleft'
.annotate 'line', 4598
addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4707
# Body
# {
.annotate 'line', 4709
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4710
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4711
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4712
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4713
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4714
# {
.annotate 'line', 4715
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4716
getattribute $P3, self, 'values'
$P3.'push'($P2)
# }
__label_3: # continue
.annotate 'line', 4717
$P1 = __ARG_1.'get'()
$P3 = $P1.'isop'(',')
if_null $P3, __label_2
if $P3 goto __label_1
__label_2: # enddo
.annotate 'line', 4718
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_4
.annotate 'line', 4719
'Expected'("']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4721

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4722
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4723
# Body
# {
.annotate 'line', 4725
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4726
.return(self)
# }
.annotate 'line', 4727

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4728
# Body
# {
.annotate 'line', 4730
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 4731
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 4732
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4738
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 4740

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4741
# Body
# {
.annotate 'line', 4743
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4744
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 4745
.return($S1)
# }
.annotate 'line', 4746

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 4747
# Body
# {
.annotate 'line', 4749
self.'annotate'(__ARG_1)
.annotate 'line', 4750
# string itemreg: $S1
null $S1
.annotate 'line', 4751
# string it_p: $S2
null $S2
.annotate 'line', 4752
eq __ARG_2, '', __label_0
# {
.annotate 'line', 4753
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4754
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 4756
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 4757
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
.annotate 'line', 4758
set $S5, $S3
set $S6, 'I'
if $S5 == $S6 goto __label_6
set $S6, 'N'
if $S5 == $S6 goto __label_7
set $S6, 'S'
if $S5 == $S6 goto __label_8
goto __label_5
# switch
__label_6: # case
__label_7: # case
__label_8: # case
.annotate 'line', 4760
# string aux: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
.annotate 'line', 4761
eq __ARG_2, '', __label_10
# {
.annotate 'line', 4762
__ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 4763
set $S1, $S2
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 4767
$P2 = $P1.'isnull'()
if_null $P2, __label_11
unless $P2 goto __label_11
# {
.annotate 'line', 4768
eq __ARG_2, '', __label_13
# {
.annotate 'line', 4769
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4770
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 4774
$P2 = $P1.'emit_get'(__ARG_1)
set $S1, $P2
__label_12: # endif
__label_4: # switch end
.annotate 'line', 4776
eq __ARG_2, '', __label_14
# {
.annotate 'line', 4777
self.'annotate'(__ARG_1)
.annotate 'line', 4778
__ARG_1.'say'(__ARG_2, ".'push'(", $S1, ")")
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 4781

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4703
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4705
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4791
# Body
# {
.annotate 'line', 4793
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4794
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4795
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 4796
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 4797
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_0
# {
.annotate 'line', 4798
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4799
# {
.annotate 'line', 4800
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4801
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4802
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4803
$P2.'push'($P4)
.annotate 'line', 4804
$P3.'push'($P5)
# }
__label_3: # continue
.annotate 'line', 4806
$P1 = __ARG_1.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4807
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4808
'Expected'("',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4810
setattribute self, 'keys', $P2
.annotate 'line', 4811
setattribute self, 'values', $P3
# }
.annotate 'line', 4812

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 4813
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4814
# Body
# {
.annotate 'line', 4816
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4817
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4818
.return(self)
# }
.annotate 'line', 4819

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4820
# Body
# {
.annotate 'line', 4822
self.'annotate'(__ARG_1)
.annotate 'line', 4827
set $S6, __ARG_2
eq $S6, '', __label_0
.annotate 'line', 4828
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 4830
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4831
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4832
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4833
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4834
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4835
# string item: $S1
null $S1
.annotate 'line', 4836
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4837
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4838
$P5 = self.'tempreg'('P')
set $S1, $P5
.annotate 'line', 4839
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 4842
$P5 = $P3.'emit_get'(__ARG_1)
set $S1, $P5
__label_5: # endif
.annotate 'line', 4844
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4845
# string itemreg: $S3
null $S3
.annotate 'line', 4846
$P5 = $P4.'isnull'()
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 4847
set $S6, __ARG_2
eq $S6, '', __label_9
# {
.annotate 'line', 4848
$P6 = self.'tempreg'('P')
set $S3, $P6
.annotate 'line', 4849
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 4852
$P5 = $P4.'isidentifier'()
if_null $P5, __label_10
unless $P5 goto __label_10
# {
.annotate 'line', 4853
# string s: $S4
$P6 = $P4.'checkIdentifier'()
null $S4
if_null $P6, __label_12
set $S4, $P6
__label_12:
.annotate 'line', 4854
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
.annotate 'line', 4855
set $S3, $S4
goto __label_14
__label_13: # else
# {
.annotate 'line', 4857
# string id: $S5
$P5 = $P4.'getName'()
null $S5
if_null $P5, __label_16
set $S5, $P5
__label_16:
.annotate 'line', 4858
getattribute $P6, self, 'owner'
$P5 = $P6.'getvar'($S5)
unless_null $P5, __label_17
# {
.annotate 'line', 4859
$P7 = self.'tempreg'('P')
set $S3, $P7
.annotate 'line', 4860
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 4863
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4867
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_11: # endif
__label_8: # endif
.annotate 'line', 4868
set $S6, __ARG_2
eq $S6, '', __label_19
.annotate 'line', 4869
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 4833
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 4871

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4872
# Body
# {
.annotate 'line', 4874
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4875
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4876
.return($S1)
# }
.annotate 'line', 4877

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4786
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4788
addattribute $P0, 'keys'
.annotate 'line', 4789
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4886
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4887
# Body
# {
.annotate 'line', 4891
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4892
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4893
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4894
__ARG_1.'unget'($P2)
.annotate 'line', 4895
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 4896
# {
.annotate 'line', 4897
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4898
$P3.'push'($P4)
# }
__label_3: # continue
.annotate 'line', 4899
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4900
setattribute self, 'initializer', $P3
.annotate 'line', 4901
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4903

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4882
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4884
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4912
# Body
# {
.annotate 'line', 4914
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4916
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4917
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4918
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4919
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4920
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4921
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4922
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4923
# {
.annotate 'line', 4924
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4925
'RequireIdentifier'($P3)
.annotate 'line', 4926
$P2.'push'($P3)
# }
__label_8: # continue
.annotate 'line', 4927
$P1 = __ARG_1.'get'()
$P4 = $P1.'isop'('.')
if_null $P4, __label_7
if $P4 goto __label_6
__label_7: # enddo
.annotate 'line', 4928
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4931
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4934
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4936
$P4 = $P1.'isop'('(')
if_null $P4, __label_9
unless $P4 goto __label_9
.annotate 'line', 4937
self.'parseinitializer'(__ARG_1)
goto __label_10
__label_9: # else
.annotate 'line', 4939
__ARG_1.'unget'($P1)
__label_10: # endif
# }
.annotate 'line', 4940

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4941
# Body
# {
.annotate 'line', 4943
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4944
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4947
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4948
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4949
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4950
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4951
$P1 = $P3['value']
.annotate 'line', 4952
isa $I2, $P1, 'StringLiteral'
not $I1, $I2
unless $I1 goto __label_6
.annotate 'line', 4953
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4954
getattribute $P6, $P1, 'strval'
setattribute self, 'value', $P6
# }
goto __label_5
__label_4: # else
.annotate 'line', 4957
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4961
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4962
if_null $P4, __label_7
.annotate 'line', 4963
getattribute $P5, self, 'initializer'
'optimize_array'($P5)
__label_7: # endif
.annotate 'line', 4964
.return(self)
# }
.annotate 'line', 4965

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 4966
# Body
# {
.annotate 'line', 4968
self.'annotate'(__ARG_1)
.annotate 'line', 4970
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4971
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
.annotate 'line', 4974
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4975
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4976
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
.annotate 'line', 4978
# string reginit: $S1
set $S1, ''
.annotate 'line', 4979
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4980
# string constructor: $S3
null $S3
.annotate 'line', 4981
set $I3, $I1
null $I4
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4985
ne $I2, 1, __label_13
# {
.annotate 'line', 4986
not $I5, __ARG_3
unless $I5 goto __label_15
.annotate 'line', 4987
$P9 = self.'tempreg'('P')
set $S2, $P9
__label_15: # endif
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 4990
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4991
$P9 = $P2.'emit_get'(__ARG_1)
set $S1, $P9
.annotate 'line', 4992
concat $S0, ', ', $S1
set $S1, $S0
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4996
isne $I3, $I2, 1
unless $I3 goto __label_17
isne $I3, $I2, 2
__label_17:
unless $I3 goto __label_16
.annotate 'line', 4997
getattribute $P9, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P9)
__label_16: # endif
.annotate 'line', 4998
not $I4, __ARG_3
unless $I4 goto __label_18
.annotate 'line', 4999
$P10 = self.'tempreg'('P')
set $S2, $P10
__label_18: # endif
__label_9: # switch end
.annotate 'line', 5002
set $I3, $I2
null $I4
if $I3 == $I4 goto __label_21
set $I4, 2
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
goto __label_20
# switch
__label_21: # case
.annotate 'line', 5005
# string name: $S4
getattribute $P10, self, 'value'
$P9 = $P10.'rawstring'()
null $S4
if_null $P9, __label_24
set $S4, $P9
__label_24:
.annotate 'line', 5006
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 5007
isnull $I5, $P3
unless $I5 goto __label_26
$I5 = self.'dowarnings'()
__label_26:
unless $I5 goto __label_25
.annotate 'line', 5008
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
getattribute $P11, self, 'value'
'Warn'($S6, $P11)
__label_25: # endif
.annotate 'line', 5012
getattribute $P12, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P12, " ]", $S1)
.annotate 'line', 5013
le $I1, 1, __label_27
# {
.annotate 'line', 5014
getattribute $P13, self, 'value'
__ARG_1.'say'($S2, ".'", $P13, "'()")
# }
__label_27: # endif
goto __label_19 # break
__label_22: # case
.annotate 'line', 5018
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 5019
# predefined elements
elements $I4, $P4
sub $I3, $I4, 1
$S3 = $P4[$I3]
.annotate 'line', 5020
$P9 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P9, $S1)
goto __label_19 # break
__label_23: # case
.annotate 'line', 5023
# var id: $P5
getattribute $P10, self, 'owner'
getattribute $P11, self, 'value'
$P5 = $P10.'getvar'($P11)
.annotate 'line', 5024
unless_null $P5, __label_28
# {
.annotate 'line', 5026
# var cl: $P6
getattribute $P12, self, 'owner'
getattribute $P13, self, 'value'
$P6 = $P12.'checkclass'($P13)
.annotate 'line', 5027
if_null $P6, __label_30
# {
.annotate 'line', 5028
$P9 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P9, $S1)
# }
goto __label_31
__label_30: # else
# {
.annotate 'line', 5031
$P9 = self.'dowarnings'()
if_null $P9, __label_32
unless $P9 goto __label_32
.annotate 'line', 5032
'Warn'('Checking: new unknown type')
__label_32: # endif
.annotate 'line', 5033
getattribute $P9, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P9, "']", $S1)
# }
__label_31: # endif
.annotate 'line', 5035
getattribute $P9, self, 'value'
set $S3, $P9
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 5039
$P9 = $P5['reg']
__ARG_1.'say'('new ', $S2, ", ", $P9, "", $S1)
# }
__label_29: # endif
goto __label_19 # break
__label_20: # default
.annotate 'line', 5043
'InternalError'('Unexpected type in new')
__label_19: # switch end
.annotate 'line', 5045
isgt $I3, $I1, 1
if $I3 goto __label_34
isgt $I3, $I1, 0
unless $I3 goto __label_35
iseq $I3, $I2, 1
__label_35:
__label_34:
unless $I3 goto __label_33
# {
.annotate 'line', 5046
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5047
iter $P14, $P1
set $P14, 0
__label_36: # for iteration
unless $P14 goto __label_37
shift $P8, $P14
# {
.annotate 'line', 5048
# string reg: $S5
$P9 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P9, __label_38
set $S5, $P9
__label_38:
.annotate 'line', 5049
$P7.'push'($S5)
# }
goto __label_36
__label_37: # endfor
.annotate 'line', 5051
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 5052
# predefined join
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 5053
__ARG_1.'say'(")")
.annotate 'line', 5054
not $I3, __ARG_3
unless $I3 goto __label_39
.annotate 'line', 5055
__ARG_1.'emitset'(__ARG_2, $S2)
__label_39: # endif
# }
__label_33: # endif
# }
.annotate 'line', 5057

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5058
# Body
# {
.annotate 'line', 5060
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5061

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4908
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4910
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5070
# Body
# {
.annotate 'line', 5072
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5073
setattribute self, 'owner', __ARG_2
.annotate 'line', 5074
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5075
setattribute self, 'nskey', $P1
.annotate 'line', 5076
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5077
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5078
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5080
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5081

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5082
# Body
# {
.annotate 'line', 5084
# string reginit: $S1
null $S1
.annotate 'line', 5085
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5086
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5087
set $I2, $I1
null $I3
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 5091
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5092
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 5095
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 5097
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 5098
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 5099
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 5100
__ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5101
null $P4
$P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5102
if_null $S1, __label_7
.annotate 'line', 5103
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 5104
__ARG_1.'say'()
# }
.annotate 'line', 5105

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5066
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5068
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5114
# Body
# {
.annotate 'line', 5116
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5117
setattribute self, 'owner', __ARG_2
.annotate 'line', 5118
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5119
setattribute self, 'nskey', $P1
.annotate 'line', 5120
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5121
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5122
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5124
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5125

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5126
# Body
# {
.annotate 'line', 5128
# string reginit: $S1
null $S1
.annotate 'line', 5129
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5131
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5132
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 5133
le $I1, 0, __label_3
.annotate 'line', 5134
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 5135
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 5136
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 5137
getattribute $P5, self, 'owner'
$P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5138
__ARG_1.'say'()
.annotate 'line', 5140
le $I1, 0, __label_4
# {
.annotate 'line', 5141
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5142
iter $P6, $P1
set $P6, 0
__label_5: # for iteration
unless $P6 goto __label_6
shift $P4, $P6
# {
.annotate 'line', 5143
# string reg: $S3
$P5 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 5144
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 5146
# string constructor: $S4
$P5 = $P2.'last'()
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
.annotate 'line', 5147
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 5148
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 5149
__ARG_1.'say'(")")
.annotate 'line', 5150
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 5152

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5110
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5112
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5157
# Body
# {
.annotate 'line', 5159
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5161
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 5163
new $P5, [ 'CallExpr' ]
.annotate 'line', 5164
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 5163
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5166
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 5168
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 5170
$P3 = $P1.'isidentifier'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 5173
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5174
__ARG_1.'unget'($P2)
.annotate 'line', 5175
$P3 = $P2.'isop'('.')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 5177
new $P5, [ 'NewQualifiedExpr' ]
$P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P4, $P5
.return($P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5181
new $P4, [ 'NewExpr' ]
$P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P3, $P4
.return($P3)
# }
__label_7: # endif
# }
goto __label_5
__label_4: # else
# {
.annotate 'line', 5186
new $P4, [ 'NewExpr' ]
$P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P3, $P4
.return($P3)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5188

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5197
# Body
# {
.annotate 'line', 5199
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5200
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5201
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 5202

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 5203
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5204
# Body
# {
.annotate 'line', 5206
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 5207
# string checkedval: $S1
null $S1
.annotate 'line', 5208
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5209
$P3 = $P1.'getidentifier'()
set $S1, $P3
.annotate 'line', 5210
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
# }
goto __label_1
__label_0: # else
.annotate 'line', 5213
set $S1, $P1
__label_1: # endif
.annotate 'line', 5214
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 5215
self.'annotate'(__ARG_1)
.annotate 'line', 5216
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 5217

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5192
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5194
addattribute $P0, 'lexpr'
.annotate 'line', 5195
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5232
# Body
# {
.annotate 'line', 5234
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5235
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 5236
setattribute self, 'etrue', __ARG_4
.annotate 'line', 5237
setattribute self, 'efalse', __ARG_5
.annotate 'line', 5238
.return(self)
# }
.annotate 'line', 5239

.end # set


.sub 'optimize' :method

.annotate 'line', 5240
# Body
# {
.annotate 'line', 5242
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 5243
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
.annotate 'line', 5245
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 5247
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 5249
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 5250
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 5251
.return(self)
__label_0: # switch end
# }
.annotate 'line', 5253

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5254
# Body
# {
.annotate 'line', 5256
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 5257

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5258
# Body
# {
.annotate 'line', 5260
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5261
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5262
getattribute $P1, self, 'condition'
$P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5263
getattribute $P1, self, 'etrue'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5264
__ARG_1.'emitgoto'($S1)
.annotate 'line', 5265
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5266
getattribute $P1, self, 'efalse'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5267
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5268

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5222
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5228
addattribute $P0, 'condition'
.annotate 'line', 5229
addattribute $P0, 'etrue'
.annotate 'line', 5230
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
# Constant Code_shiftleft evaluated at compile time
# Constant Code_shiftright evaluated at compile time
# Constant Code_mod_assign evaluated at compile time
# Constant Code_delete evaluated at compile time

.sub 'getOpCode_2'
.param pmc __ARG_1

.annotate 'line', 5309
# Body
# {
.annotate 'line', 5311
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
.annotate 'line', 5312
.return(1)
__label_3: # case
.annotate 'line', 5313
.return(2)
__label_4: # case
.annotate 'line', 5314
.return(3)
__label_1: # default
.annotate 'line', 5315
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5317

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5319
# Body
# {
.annotate 'line', 5321
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
.annotate 'line', 5322
.return(8)
__label_3: # case
.annotate 'line', 5323
.return(11)
__label_4: # case
.annotate 'line', 5324
.return(9)
__label_5: # case
.annotate 'line', 5325
.return(10)
__label_1: # default
.annotate 'line', 5327
$P2 = __ARG_1.'iskeyword'('delete')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(31)
goto __label_7
__label_6: # else
.annotate 'line', 5328
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5330

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5332
# Body
# {
.annotate 'line', 5334
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
.annotate 'line', 5335
.return(19)
__label_3: # case
.annotate 'line', 5336
.return(20)
__label_4: # case
.annotate 'line', 5337
.return(21)
__label_5: # case
.annotate 'line', 5338
.return(22)
__label_1: # default
.annotate 'line', 5339
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5341

.end # getOpCode_5


.sub 'getOpCode_7'
.param pmc __ARG_1

.annotate 'line', 5343
# Body
# {
.annotate 'line', 5345
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '<<'
if $S1 == $S2 goto __label_2
set $S2, '>>'
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5346
.return(28)
__label_3: # case
.annotate 'line', 5347
.return(29)
__label_1: # default
.annotate 'line', 5348
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5350

.end # getOpCode_7


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5352
# Body
# {
.annotate 'line', 5354
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
.annotate 'line', 5355
.return(12)
__label_3: # case
.annotate 'line', 5356
.return(13)
__label_4: # case
.annotate 'line', 5357
.return(25)
__label_5: # case
.annotate 'line', 5358
.return(26)
__label_1: # default
.annotate 'line', 5360
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5361
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5363

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5365
# Body
# {
.annotate 'line', 5367
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
.annotate 'line', 5368
.return(14)
__label_3: # case
.annotate 'line', 5369
.return(16)
__label_4: # case
.annotate 'line', 5370
.return(15)
__label_5: # case
.annotate 'line', 5371
.return(17)
__label_1: # default
.annotate 'line', 5372
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5374

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5376
# Body
# {
.annotate 'line', 5378
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
set $S2, '%='
if $S1 == $S2 goto __label_8
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5379
.return(4)
__label_3: # case
.annotate 'line', 5380
.return(5)
__label_4: # case
.annotate 'line', 5381
.return(6)
__label_5: # case
.annotate 'line', 5382
.return(18)
__label_6: # case
.annotate 'line', 5383
.return(23)
__label_7: # case
.annotate 'line', 5384
.return(24)
__label_8: # case
.annotate 'line', 5385
.return(30)
__label_1: # default
.annotate 'line', 5386
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5388

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5390
# Body
# {
.annotate 'line', 5392
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5394
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5395
# var expr: $P2
null $P2
.annotate 'line', 5396
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5397
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5398
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5399
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5401
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5402
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5403
$P4 = $P1.'isop'('{')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 5404
new $P6, [ 'HashExpr' ]
$P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 5405
$P4 = $P1.'iskeyword'('new')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5406
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 5407
$P4 = $P1.'isstring'()
if_null $P4, __label_4
unless $P4 goto __label_4
.annotate 'line', 5408
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_4: # endif
.annotate 'line', 5409
$P4 = $P1.'isint'()
if_null $P4, __label_5
unless $P4 goto __label_5
.annotate 'line', 5410
new $P6, [ 'IntegerLiteral' ]
$P6.'IntegerLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_5: # endif
.annotate 'line', 5411
$P4 = $P1.'isfloat'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 5412
new $P6, [ 'FloatLiteral' ]
$P6.'FloatLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_6: # endif
.annotate 'line', 5413
$P4 = $P1.'iskeyword'('function')
if_null $P4, __label_7
unless $P4 goto __label_7
.annotate 'line', 5414
new $P6, [ 'FunctionExpr' ]
$P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_7: # endif
.annotate 'line', 5415
$P4 = $P1.'isidentifier'()
if_null $P4, __label_8
unless $P4 goto __label_8
.annotate 'line', 5416
new $P6, [ 'IdentifierExpr' ]
$P6.'IdentifierExpr'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_8: # endif
.annotate 'line', 5417
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5418

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5420
# Body
# {
.annotate 'line', 5422
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 5423
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 5425
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5426
# var t: $P2
null $P2
.annotate 'line', 5427
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5428
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
.annotate 'line', 5429
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5431
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 5434
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5437
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5440
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5443
__ARG_1.'unget'($P2)
.annotate 'line', 5444
.return($P1)
# }
.annotate 'line', 5445

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5447
# Body
# {
.annotate 'line', 5449
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5451
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5452
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5453
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5454
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5455
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5456
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5459
__ARG_1.'unget'($P2)
.annotate 'line', 5460
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5462

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5464
# Body
# {
.annotate 'line', 5466
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5467
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5468
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5470
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5471
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5472
# var subexpr: $P2
null $P2
.annotate 'line', 5473
eq $I1, 0, __label_0
# {
.annotate 'line', 5474
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5475
# var oper: $P3
null $P3
.annotate 'line', 5476
set $I2, $I1
set $I3, 8
if $I2 == $I3 goto __label_4
set $I3, 11
if $I2 == $I3 goto __label_5
set $I3, 9
if $I2 == $I3 goto __label_6
set $I3, 10
if $I2 == $I3 goto __label_7
set $I3, 31
if $I2 == $I3 goto __label_8
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5478
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5481
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5484
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5487
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5490
new $P3, [ 'OpDeleteExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5493
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5495
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5498
__ARG_1.'unget'($P1)
.annotate 'line', 5499
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5501
.return($P2)
# }
.annotate 'line', 5502

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5504
# Body
# {
.annotate 'line', 5506
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5507
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5509
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5510
# var t: $P2
null $P2
.annotate 'line', 5511
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5512
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5513
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5514
# var aux: $P4
null $P4
.annotate 'line', 5515
set $I2, $I1
set $I3, 19
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
.annotate 'line', 5517
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5520
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5523
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5526
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5529
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5531
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5532
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5534
__ARG_1.'unget'($P2)
.annotate 'line', 5535
.return($P1)
# }
.annotate 'line', 5536

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5538
# Body
# {
.annotate 'line', 5540
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5542
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5543
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5544
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5545
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5546
# var expr: $P4
null $P4
.annotate 'line', 5547
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5548
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5550
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
.annotate 'line', 5551
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5553
__ARG_1.'unget'($P2)
.annotate 'line', 5554
.return($P1)
# }
.annotate 'line', 5555

.end # parseExpr_6


.sub 'parseExpr_7'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5557
# Body
# {
.annotate 'line', 5559
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5561
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5562
# var rexpr: $P2
null $P2
.annotate 'line', 5563
# var t: $P3
null $P3
.annotate 'line', 5564
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5565
$P3 = __ARG_1.'get'()
$P5 = 'getOpCode_7'($P3)
set $I1, $P5
eq $I1, 0, __label_0
# {
.annotate 'line', 5566
set $I2, $I1
set $I3, 28
if $I2 == $I3 goto __label_4
set $I3, 29
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5568
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5569
new $P6, [ 'OpShiftleftExpr' ]
$P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5572
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5573
new $P7, [ 'OpShiftrightExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5576
'InternalError'('Invalid code in parseExpr_7', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5579
__ARG_1.'unget'($P3)
.annotate 'line', 5580
.return($P1)
# }
.annotate 'line', 5581

.end # parseExpr_7


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5583
# Body
# {
.annotate 'line', 5585
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 5586
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5588
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5589
# var rexpr: $P2
null $P2
.annotate 'line', 5590
# var t: $P3
null $P3
.annotate 'line', 5591
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5592
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5593
set $I2, $I1
set $I3, 12
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
.annotate 'line', 5595
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5596
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5599
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5600
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5603
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5604
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5607
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5608
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5611
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5614
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5617
__ARG_1.'unget'($P3)
.annotate 'line', 5618
.return($P1)
# }
.annotate 'line', 5619

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5621
# Body
# {
.annotate 'line', 5623
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5624
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5626
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5627
# var t: $P2
null $P2
.annotate 'line', 5628
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5629
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5630
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5631
set $I2, $I1
set $I3, 14
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
.annotate 'line', 5633
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5636
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5639
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5642
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5645
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5648
__ARG_1.'unget'($P2)
.annotate 'line', 5649
.return($P1)
# }
.annotate 'line', 5650

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5652
# Body
# {
.annotate 'line', 5654
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5656
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5657
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5658
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5659
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5660
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5662
__ARG_1.'unget'($P2)
.annotate 'line', 5663
.return($P1)
# }
.annotate 'line', 5664

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5666
# Body
# {
.annotate 'line', 5668
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5670
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5671
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5672
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5673
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5674
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5676
__ARG_1.'unget'($P2)
.annotate 'line', 5677
.return($P1)
# }
.annotate 'line', 5678

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5680
# Body
# {
.annotate 'line', 5682
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5684
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5685
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5686
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5687
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5688
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5690
__ARG_1.'unget'($P2)
.annotate 'line', 5691
.return($P1)
# }
.annotate 'line', 5692

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5694
# Body
# {
.annotate 'line', 5696
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5698
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5699
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5700
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5701
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5702
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5704
__ARG_1.'unget'($P2)
.annotate 'line', 5705
.return($P1)
# }
.annotate 'line', 5706

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5708
# Body
# {
.annotate 'line', 5710
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5711
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5713
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5714
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5715
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5716
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5717
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5718
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5719
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5722
__ARG_1.'unget'($P2)
.annotate 'line', 5723
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5725

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5727
# Body
# {
.annotate 'line', 5729
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5730
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5731
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5733
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5734
# var t: $P2
null $P2
.annotate 'line', 5735
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5736
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5737
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5738
# var expr: $P4
null $P4
.annotate 'line', 5739
set $I2, $I1
set $I3, 4
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
set $I3, 30
if $I2 == $I3 goto __label_10
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5741
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5744
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5747
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5750
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5753
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5756
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_10: # case
.annotate 'line', 5759
new $P4, [ 'OpModToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5762
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5764
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5765
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5767
__ARG_1.'unget'($P2)
.annotate 'line', 5768
.return($P1)
# }
.annotate 'line', 5769

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5771
# Body
# {
.annotate 'line', 5773
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5775
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5776

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5789
# Body
# {
.annotate 'line', 5791
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5792
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5793
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 5794
box $P1, $S1
setattribute self, 'brlabel', $P1
.annotate 'line', 5795
.return($S1)
# }
.annotate 'line', 5796

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5797
# Body
# {
.annotate 'line', 5799
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5800
unless_null $P1, __label_0
.annotate 'line', 5801
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5802
.return($P1)
# }
.annotate 'line', 5803

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5787
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5810
# Body
# {
.annotate 'line', 5812
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5813
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5814
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 5815
box $P1, $S1
setattribute self, 'cntlabel', $P1
.annotate 'line', 5816
.return($S1)
# }
.annotate 'line', 5817

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5818
# Body
# {
.annotate 'line', 5820
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5821
unless_null $P1, __label_0
.annotate 'line', 5822
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5823
.return($P1)
# }
.annotate 'line', 5824

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5806
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5808
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5838
# Body
# {
.annotate 'line', 5840
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5841
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5842
# var values: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5843
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5844
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5845
# {
.annotate 'line', 5846
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5847
$P2.'push'($P3)
# }
__label_3: # continue
.annotate 'line', 5848
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_2
if $P4 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5850
'RequireOp'(';', $P1)
.annotate 'line', 5851
setattribute self, 'values', $P2
# }
.annotate 'line', 5852

.end # parse


.sub 'optimize' :method

.annotate 'line', 5853
# Body
# {
.annotate 'line', 5855
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5856
.return(self)
# }
.annotate 'line', 5857

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5858
# Body
# {
.annotate 'line', 5860
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 5861
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5862
# int n: $I1
set $P5, $P2
set $I1, $P5
.annotate 'line', 5865
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5866
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5867
$P5 = $P3.'cantailcall'()
if_null $P5, __label_2
unless $P5 goto __label_2
# {
.annotate 'line', 5868
self.'annotate'(__ARG_1)
.annotate 'line', 5869
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5872
# int i: $I2
null $I2
__label_5: # for condition
ge $I2, $I1, __label_4
# {
.annotate 'line', 5873
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 5874
# string reg: $S1
null $S1
.annotate 'line', 5875
$P5 = $P4.'isnull'()
if_null $P5, __label_6
unless $P5 goto __label_6
# {
.annotate 'line', 5876
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 5877
__ARG_1.'emitnull'($S1)
# }
goto __label_7
__label_6: # else
.annotate 'line', 5880
$P5 = $P4.'emit_get'(__ARG_1)
set $S1, $P5
__label_7: # endif
.annotate 'line', 5881
$P1.'push'($S1)
# }
__label_3: # for iteration
.annotate 'line', 5872
inc $I2
goto __label_5
__label_4: # for end
.annotate 'line', 5883
self.'annotate'(__ARG_1)
.annotate 'line', 5884
self.'emitret'(__ARG_1)
.annotate 'line', 5885
# string sep: $S2
set $S2, ''
.annotate 'line', 5886
iter $P7, $P1
set $P7, 0
__label_8: # for iteration
unless $P7 goto __label_9
shift $S3, $P7
# {
.annotate 'line', 5887
__ARG_1.'print'($S2, $S3)
.annotate 'line', 5888
set $S2, ', '
# }
goto __label_8
__label_9: # endfor
.annotate 'line', 5890
__ARG_1.'say'(')')
# }
.annotate 'line', 5891

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5834
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5836
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5896
# Body
# {
.annotate 'line', 5898
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5899

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5900
# Body
# {
.annotate 'line', 5902
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5903

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5894
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5908
# Body
# {
.annotate 'line', 5910
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5911

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5912
# Body
# {
.annotate 'line', 5914
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5915

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5906
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5926
# Body
# {
.annotate 'line', 5928
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5929
setattribute self, 'name', __ARG_1
.annotate 'line', 5930
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5931
box $P1, $S1
setattribute self, 'value', $P1
# }
.annotate 'line', 5932

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5933
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5934
# Body
# {
.annotate 'line', 5936
self.'annotate'(__ARG_1)
.annotate 'line', 5937
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5938
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 5939
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5940

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5922
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5924
addattribute $P0, 'name'
.annotate 'line', 5925
addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 5952
# Body
# {
.annotate 'line', 5954
setattribute self, 'owner', __ARG_1
.annotate 'line', 5955
box $P1, __ARG_2
setattribute self, 'label', $P1
# }
.annotate 'line', 5956

.end # Reflabel


.sub 'optimize' :method

.annotate 'line', 5957
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5958
# Body
# {
.annotate 'line', 5960
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5961
# string value: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5962
.return($S2)
# }
.annotate 'line', 5963

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Reflabel' ]
.annotate 'line', 5949
addattribute $P0, 'owner'
.annotate 'line', 5950
addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5974
# Body
# {
.annotate 'line', 5976
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5977
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5978
'RequireIdentifier'($P1)
.annotate 'line', 5979
setattribute self, 'label', $P1
.annotate 'line', 5980
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5981

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5982
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5983
# Body
# {
.annotate 'line', 5985
self.'annotate'(__ARG_1)
.annotate 'line', 5986
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5987
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5988
concat $S3, 'goto ', $S1
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5989

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5970
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5972
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5998
# Body
# {
.annotate 'line', 6000
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 6001

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 6002
# Body
# {
.annotate 'line', 6004
'ExpectOp'('(', __ARG_1)
.annotate 'line', 6005
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 6006
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6007

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5996
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

.annotate 'line', 6018
# Body
# {
.annotate 'line', 6020
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6021
self.'parsecondition'(__ARG_2)
.annotate 'line', 6022
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 6023
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6024
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6025
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 6027
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 6028
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 6030

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 6031
# Body
# {
.annotate 'line', 6033
self.'optimize_condition'()
.annotate 'line', 6034
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 6035
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 6036
getattribute $P3, self, 'falsebranch'
$P2 = $P3.'optimize'()
setattribute self, 'falsebranch', $P2
.annotate 'line', 6037
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6039
getattribute $P1, self, 'truebranch'
.return($P1)
__label_3: # case
.annotate 'line', 6041
getattribute $P2, self, 'falsebranch'
.return($P2)
__label_1: # default
__label_0: # switch end
.annotate 'line', 6043
.return(self)
# }
.annotate 'line', 6044

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6045
# Body
# {
.annotate 'line', 6047
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 6048
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 6049
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 6050
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 6051
# string elselabel: $S1
set $S1, ''
.annotate 'line', 6052
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 6053
$P3 = self.'genlabel'()
set $S1, $P3
__label_0: # endif
.annotate 'line', 6054
# string endlabel: $S2
$P3 = self.'genlabel'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6055
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 6056
self.'annotate'(__ARG_1)
.annotate 'line', 6057
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6058
$P1.'emit'(__ARG_1)
.annotate 'line', 6060
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 6061
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6062
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6063
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 6065
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6066

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6014
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 6016
addattribute $P0, 'truebranch'
.annotate 'line', 6017
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 6076
# Body
# {
.annotate 'line', 6078
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 6079

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 6080
# Body
# {
.annotate 'line', 6082
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6083
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6085
self.'annotate'(__ARG_1)
.annotate 'line', 6086
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6087
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6088
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6089
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6090

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6073
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 6075
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6099
# Body
# {
.annotate 'line', 6101
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6102
self.'parsecondition'(__ARG_2)
.annotate 'line', 6103
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6104

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 6105
# Body
# {
.annotate 'line', 6107
self.'optimize_condition'()
.annotate 'line', 6108
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6109
.return(self)
# }
.annotate 'line', 6110

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6111
# Body
# {
.annotate 'line', 6113
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6115
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 6118
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 6121
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 6122
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 6124
self.'annotate'(__ARG_1)
.annotate 'line', 6125
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6126
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6127
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 6128
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6129
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 6131

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6097
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

.annotate 'line', 6140
# Body
# {
.annotate 'line', 6142
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6143
self.'parsebody'(__ARG_2)
.annotate 'line', 6144
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6145
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6146

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 6147
# Body
# {
.annotate 'line', 6149
self.'optimize_condition'()
.annotate 'line', 6150
# var body: $P1
getattribute $P2, self, 'body'
$P1 = $P2.'optimize'()
.annotate 'line', 6151
$I1 = $P1.'isempty'()
unless $I1 goto __label_1
$P2 = self.'getvalue'()
set $I2, $P2
iseq $I1, $I2, 2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 6152
new $P3, [ 'EmptyStatement' ]
.return($P3)
__label_0: # endif
.annotate 'line', 6153
setattribute self, 'body', $P1
.annotate 'line', 6154
.return(self)
# }
.annotate 'line', 6155

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6156
# Body
# {
.annotate 'line', 6158
# var body: $P1
getattribute $P1, self, 'body'
.annotate 'line', 6159
# int condvalue: $I1
$P2 = self.'getvalue'()
set $I1, $P2
.annotate 'line', 6160
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6162
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 6165
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 6166
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 6167
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 6169
self.'annotate'(__ARG_1)
.annotate 'line', 6170
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6172
$P1.'emit'(__ARG_1)
.annotate 'line', 6173
__ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6174
eq $I1, 2, __label_6
.annotate 'line', 6175
self.'emit_if'(__ARG_1, $S1, $S2)
__label_6: # endif
.annotate 'line', 6176
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 6178

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6138
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

.annotate 'line', 6187
# Body
# {
.annotate 'line', 6189
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6190
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6191

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 6192
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6193
# Body
# {
.annotate 'line', 6195
self.'annotate'(__ARG_1)
.annotate 'line', 6196
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6197
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6198

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6185
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6207
# Body
# {
.annotate 'line', 6209
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6210
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6211

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 6212
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6213
# Body
# {
.annotate 'line', 6215
self.'annotate'(__ARG_1)
.annotate 'line', 6216
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6217
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6218

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6205
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6232
# Body
# {
.annotate 'line', 6234
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6235
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6236
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6237
'Expected'("'(' in switch", $P1)
__label_0: # endif
.annotate 'line', 6238
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 6239
$P1 = __ARG_2.'get'()
.annotate 'line', 6240
$P3 = $P1.'isop'(')')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6241
'Expected'("')' in switch", $P1)
__label_1: # endif
.annotate 'line', 6242
$P1 = __ARG_2.'get'()
.annotate 'line', 6243
$P3 = $P1.'isop'('{')
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 6244
'Expected'("'{' in switch", $P1)
__label_2: # endif
.annotate 'line', 6245
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P4
.annotate 'line', 6246
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P4
.annotate 'line', 6247
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P4
__label_4: # while
.annotate 'line', 6248
$P1 = __ARG_2.'get'()
$I1 = $P1.'iskeyword'('case')
if $I1 goto __label_5
$I1 = $P1.'iskeyword'('default')
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 6249
$P3 = $P1.'iskeyword'('case')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 6250
getattribute $P4, self, 'case_value'
$P5 = 'parseExpr'(__ARG_2, self)
$P4.'push'($P5)
.annotate 'line', 6251
$P1 = __ARG_2.'get'()
.annotate 'line', 6252
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_8
.annotate 'line', 6253
'Expected'("':' in case", $P1)
__label_8: # endif
.annotate 'line', 6254
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 6255
$P1 = __ARG_2.'get'()
$I2 = $P1.'isop'('}')
if $I2 goto __label_12
$I2 = $P1.'iskeyword'('case')
__label_12:
if $I2 goto __label_11
$I2 = $P1.'iskeyword'('default')
__label_11:
not $I1, $I2
unless $I1 goto __label_9
# {
.annotate 'line', 6256
__ARG_2.'unget'($P1)
.annotate 'line', 6257
$P3 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P3)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 6259
getattribute $P3, self, 'case_st'
$P3.'push'($P2)
.annotate 'line', 6260
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 6263
$P1 = __ARG_2.'get'()
.annotate 'line', 6264
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_13
.annotate 'line', 6265
'Expected'("':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 6266
$P1 = __ARG_2.'get'()
$I2 = $P1.'isop'('}')
if $I2 goto __label_17
$I2 = $P1.'iskeyword'('case')
__label_17:
if $I2 goto __label_16
$I2 = $P1.'iskeyword'('default')
__label_16:
not $I1, $I2
unless $I1 goto __label_14
# {
.annotate 'line', 6267
__ARG_2.'unget'($P1)
.annotate 'line', 6268
getattribute $P3, self, 'default_st'
$P4 = 'parseStatement'(__ARG_2, self)
$P3.'push'($P4)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 6270
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 6273

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 6274
# Body
# {
.annotate 'line', 6276
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 6277
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 6278
getattribute $P2, self, 'case_st'
iter $P5, $P2
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 6279
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6280
getattribute $P2, self, 'default_st'
'optimize_array'($P2)
.annotate 'line', 6281
.return(self)
# }
.annotate 'line', 6282

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6283
# Body
# {
.annotate 'line', 6286
# string type: $S1
set $S1, ''
.annotate 'line', 6287
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 6288
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 6289
ne $S2, 'N', __label_3
.annotate 'line', 6290
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 6291
ne $S1, '', __label_4
.annotate 'line', 6292
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 6293
eq $S1, $S2, __label_6
.annotate 'line', 6294
set $S1, 'P'
__label_6: # endif
__label_5: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6297
# string reg: $S3
$P8 = self.'tempreg'($S1)
null $S3
if_null $P8, __label_7
set $S3, $P8
__label_7:
.annotate 'line', 6298
getattribute $P10, self, 'condition'
$P8 = $P10.'checkresult'()
set $S9, $P8
ne $S9, $S1, __label_8
.annotate 'line', 6299
getattribute $P11, self, 'condition'
$P11.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 6301
# string regcond: $S4
getattribute $P13, self, 'condition'
$P12 = $P13.'emit_get'(__ARG_1)
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
.annotate 'line', 6302
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 6306
self.'genbreaklabel'()
.annotate 'line', 6307
# string defaultlabel: $S5
$P8 = self.'genlabel'()
null $S5
if_null $P8, __label_11
set $S5, $P8
__label_11:
.annotate 'line', 6308
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6309
# string regval: $S6
$P8 = self.'tempreg'($S1)
null $S6
if_null $P8, __label_12
set $S6, $P8
__label_12:
.annotate 'line', 6310
getattribute $P8, self, 'case_value'
iter $P14, $P8
set $P14, 0
__label_13: # for iteration
unless $P14 goto __label_14
shift $P3, $P14
# {
.annotate 'line', 6311
# string label: $S7
$P10 = self.'genlabel'()
null $S7
if_null $P10, __label_15
set $S7, $P10
__label_15:
.annotate 'line', 6312
$P2.'push'($S7)
.annotate 'line', 6313
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6314
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 6316
__ARG_1.'emitgoto'($S5)
.annotate 'line', 6319
__ARG_1.'comment'('switch')
.annotate 'line', 6320
self.'annotate'(__ARG_1)
.annotate 'line', 6321
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 6322
# int n: $I1
set $P8, $P4
set $I1, $P8
# for loop
.annotate 'line', 6323
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6324
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 6325
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6326
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 6327
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $P6, $P15
.annotate 'line', 6328
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 6323
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6331
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6332
getattribute $P8, self, 'default_st'
iter $P16, $P8
set $P16, 0
__label_21: # for iteration
unless $P16 goto __label_22
shift $P7, $P16
.annotate 'line', 6333
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 6335
getattribute $P10, self, 'start'
$P8 = self.'getbreaklabel'($P10)
__ARG_1.'emitlabel'($P8, 'switch end')
# }
.annotate 'line', 6336

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6225
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 6227
addattribute $P0, 'condition'
.annotate 'line', 6228
addattribute $P0, 'case_value'
.annotate 'line', 6229
addattribute $P0, 'case_st'
.annotate 'line', 6230
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6348
# Body
# {
.annotate 'line', 6350
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6351
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6352
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6353
__ARG_2.'unget'($P1)
.annotate 'line', 6354
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 6356
$P1 = __ARG_2.'get'()
.annotate 'line', 6357
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 6358
__ARG_2.'unget'($P1)
.annotate 'line', 6359
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6360
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 6362
$P1 = __ARG_2.'get'()
.annotate 'line', 6363
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_2
# {
.annotate 'line', 6364
__ARG_2.'unget'($P1)
.annotate 'line', 6365
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P3
.annotate 'line', 6366
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 6368
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6369

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6370
# Body
# {
.annotate 'line', 6372
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 6373
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 6374
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 6375
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 6376
getattribute $P1, self, 'iteration'
if_null $P1, __label_2
.annotate 'line', 6377
getattribute $P4, self, 'iteration'
$P3 = $P4.'optimize'()
setattribute self, 'iteration', $P3
__label_2: # endif
.annotate 'line', 6378
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6379
.return(self)
# }
.annotate 'line', 6380

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6381
# Body
# {
.annotate 'line', 6383
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6384
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6385
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6386
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6387
.return()
# }
__label_0: # endif
.annotate 'line', 6389
__ARG_1.'comment'('for loop')
.annotate 'line', 6390
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6391
# string breaklabel: $S2
$P1 = self.'genbreaklabel'()
null $S2
if_null $P1, __label_4
set $S2, $P1
__label_4:
.annotate 'line', 6392
# string condlabel: $S3
$P1 = self.'genlabel'()
null $S3
if_null $P1, __label_5
set $S3, $P1
__label_5:
.annotate 'line', 6393
getattribute $P1, self, 'initializer'
if_null $P1, __label_6
.annotate 'line', 6394
getattribute $P2, self, 'initializer'
$P2.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6396
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6397
getattribute $P1, self, 'condexpr'
if_null $P1, __label_7
.annotate 'line', 6398
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6400
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6401
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6402
getattribute $P1, self, 'iteration'
if_null $P1, __label_8
.annotate 'line', 6403
# string unused: $S4
getattribute $P3, self, 'iteration'
$P2 = $P3.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
__label_8: # endif
.annotate 'line', 6404
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6406
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6407

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6343
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 6345
addattribute $P0, 'initializer'
.annotate 'line', 6346
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param string __ARG_5

.annotate 'line', 6419
# Body
# {
.annotate 'line', 6421
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6422
# string sname: $S1
set $P1, __ARG_4
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6423
eq __ARG_5, '', __label_1
.annotate 'line', 6424
$P1 = 'typetoregcheck'(__ARG_5)
self.'createvar'($S1, $P1)
__label_1: # endif
.annotate 'line', 6425
setattribute self, 'varname', __ARG_4
.annotate 'line', 6426
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P2
.annotate 'line', 6427
'ExpectOp'(')', __ARG_2)
.annotate 'line', 6428
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6429

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6430
# Body
# {
.annotate 'line', 6432
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6433
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6434
.return(self)
# }
.annotate 'line', 6435

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6436
# Body
# {
.annotate 'line', 6438
self.'annotate'(__ARG_1)
.annotate 'line', 6439
# string regcont: $S1
null $S1
.annotate 'line', 6440
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6441
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6442
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6443
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6446
getattribute $P3, self, 'container'
$P2 = $P3.'emit_get'(__ARG_1)
set $S1, $P2
__label_1: # endif
.annotate 'line', 6447
# var itvar: $P1
getattribute $P2, self, 'varname'
$P1 = self.'getvar'($P2)
.annotate 'line', 6448
# string iterator: $S3
$P2 = self.'createreg'('P')
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6449
# string continuelabel: $S4
$P2 = self.'gencontinuelabel'()
null $S4
if_null $P2, __label_4
set $S4, $P2
__label_4:
.annotate 'line', 6450
# string breaklabel: $S5
$P2 = self.'genbreaklabel'()
null $S5
if_null $P2, __label_5
set $S5, $P2
__label_5:
.annotate 'line', 6451
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6452
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6453
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6454
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6455
$P2 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P2, ', ', $S3)
.annotate 'line', 6456
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 6457
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6458
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6459

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6414
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6416
addattribute $P0, 'varname'
.annotate 'line', 6417
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6464
# Body
# {
.annotate 'line', 6466
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6467
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6468
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6469
$P4 = $P2.'iskeyword'('in')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 6470
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
set $P5, $P6
.return($P5)
goto __label_1
__label_0: # else
# {
.annotate 'line', 6472
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6473
$P4 = $P3.'iskeyword'('in')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 6474
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 6475
__ARG_2.'unget'($P3)
.annotate 'line', 6476
__ARG_2.'unget'($P2)
.annotate 'line', 6477
__ARG_2.'unget'($P1)
# }
__label_1: # endif
.annotate 'line', 6479
new $P5, [ 'ForStatement' ]
$P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 6480

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6490
# Body
# {
.annotate 'line', 6492
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6493
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6494

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6495
# Body
# {
.annotate 'line', 6497
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6498
.return(self)
# }
.annotate 'line', 6499

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6500
# Body
# {
.annotate 'line', 6502
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6503
self.'annotate'(__ARG_1)
.annotate 'line', 6504
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6505

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6486
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6488
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6519
# Body
# {
.annotate 'line', 6521
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6522
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6523
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6524
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6527
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6529
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6530
$P1 = __ARG_2.'get'()
.annotate 'line', 6531
$P2 = $P1.'iskeyword'('catch')
isfalse $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6532
'ExpectedOp'('catch', $P1)
__label_2: # endif
.annotate 'line', 6533
$P1 = __ARG_2.'get'()
.annotate 'line', 6534
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_3
.annotate 'line', 6535
'Expected'("'(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6536
$P1 = __ARG_2.'get'()
.annotate 'line', 6537
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_4
# {
.annotate 'line', 6538
# string exname: $S1
$P3 = $P1.'getidentifier'()
null $S1
if_null $P3, __label_5
set $S1, $P3
__label_5:
.annotate 'line', 6539
setattribute self, 'exname', $P1
.annotate 'line', 6540
self.'createvar'($S1, 'P')
.annotate 'line', 6541
$P1 = __ARG_2.'get'()
.annotate 'line', 6542
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_6
.annotate 'line', 6543
'Expected'("')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6545
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P3
# }
.annotate 'line', 6546

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6547
# Body
# {
.annotate 'line', 6549
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6550
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6551
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6552
getattribute $P3, self, 'scatch'
$P2 = $P3.'optimize'()
setattribute self, 'scatch', $P2
.annotate 'line', 6553
.return(self)
# }
.annotate 'line', 6554

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6555
# Body
# {
.annotate 'line', 6557
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6558
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6559
# string labelpasthandler: $S3
$P7 = self.'genlabel'()
null $S3
if_null $P7, __label_2
set $S3, $P7
__label_2:
.annotate 'line', 6560
# string exreg: $S4
null $S4
.annotate 'line', 6561
getattribute $P7, self, 'exname'
if_null $P7, __label_3
# {
.annotate 'line', 6562
# var exname: $P1
getattribute $P8, self, 'exname'
$P1 = self.'getvar'($P8)
.annotate 'line', 6563
$P7 = $P1.'getreg'()
set $S4, $P7
# }
goto __label_4
__label_3: # else
.annotate 'line', 6566
$P7 = self.'tempreg'('P')
set $S4, $P7
__label_4: # endif
.annotate 'line', 6568
self.'annotate'(__ARG_1)
.annotate 'line', 6569
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6571
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6572
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6574
getattribute $P7, self, 'modifiers'
if_null $P7, __label_5
# {
.annotate 'line', 6575
# var modiflist: $P2
getattribute $P8, self, 'modifiers'
$P2 = $P8.'getlist'()
.annotate 'line', 6576
iter $P9, $P2
set $P9, 0
__label_6: # for iteration
unless $P9 goto __label_7
shift $P3, $P9
# {
.annotate 'line', 6577
# string modifname: $S5
$P7 = $P3.'getname'()
null $S5
if_null $P7, __label_8
set $S5, $P7
__label_8:
.annotate 'line', 6578
# int nargs: $I1
$P7 = $P3.'numargs'()
set $I1, $P7
.annotate 'line', 6579
set $S9, $S5
set $S10, 'min_severity'
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
set $S10, 'handle_types_except'
if $S9 == $S10 goto __label_14
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 6582
eq $I1, 1, __label_15
.annotate 'line', 6583
getattribute $P7, self, 'start'
'SyntaxError'('Wrong modifier args', $P7)
__label_15: # endif
.annotate 'line', 6584
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6585
# string argreg: $S6
$P8 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P8, __label_16
set $S6, $P8
__label_16:
.annotate 'line', 6586
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
__label_14: # case
.annotate 'line', 6590
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6591
# int i: $I2
null $I2
__label_19: # for condition
ge $I2, $I1, __label_18
# {
.annotate 'line', 6592
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6593
$P7 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P7)
# }
__label_17: # for iteration
.annotate 'line', 6591
inc $I2
goto __label_19
__label_18: # for end
.annotate 'line', 6595
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6596
# string sep: $S7
set $S7, ''
.annotate 'line', 6597
iter $P10, $P5
set $P10, 0
__label_20: # for iteration
unless $P10 goto __label_21
shift $S8, $P10
# {
.annotate 'line', 6598
__ARG_1.'print'($S7, $S8)
.annotate 'line', 6599
set $S7, ', '
# }
goto __label_20
__label_21: # endfor
.annotate 'line', 6601
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6604
getattribute $P7, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P7)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6609
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6610
__ARG_1.'comment'('try: begin')
.annotate 'line', 6611
getattribute $P7, self, 'stry'
$P7.'emit'(__ARG_1)
.annotate 'line', 6612
__ARG_1.'comment'('try: end')
.annotate 'line', 6613
__ARG_1.'say'('pop_eh')
.annotate 'line', 6615
self.'annotate'(__ARG_1)
.annotate 'line', 6616
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6618
__ARG_1.'comment'('catch')
.annotate 'line', 6619
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6620
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6621
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6622
__ARG_1.'say'('pop_eh')
.annotate 'line', 6623
getattribute $P7, self, 'scatch'
$P7.'emit'(__ARG_1)
.annotate 'line', 6625
__ARG_1.'comment'('catch end')
.annotate 'line', 6626
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6627

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6512
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6514
addattribute $P0, 'stry'
.annotate 'line', 6515
addattribute $P0, 'modifiers'
.annotate 'line', 6516
addattribute $P0, 'exname'
.annotate 'line', 6517
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6638
# Body
# {
.annotate 'line', 6640
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6641
setattribute self, 'name', __ARG_3
.annotate 'line', 6642
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 6643
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6644

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6634
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6636
addattribute $P0, 'name'
.annotate 'line', 6637
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6661
# Body
# {
.annotate 'line', 6663
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6664
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6665
'RequireIdentifier'($P1)
.annotate 'line', 6666
setattribute self, 'name', $P1
.annotate 'line', 6667
# var vdata: $P2
null $P2
.annotate 'line', 6668
# string reg: $S1
null $S1
.annotate 'line', 6670
$P1 = __ARG_2.'get'()
.annotate 'line', 6671
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6673
box $P5, 1
setattribute self, 'typearray', $P5
.annotate 'line', 6674
getattribute $P4, self, 'name'
$P2 = self.'createvar'($P4, 'P')
.annotate 'line', 6675
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 6676
$P1 = __ARG_2.'get'()
.annotate 'line', 6677
$P4 = $P1.'isop'(']')
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 6679
$P1 = __ARG_2.'get'()
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 6682
__ARG_2.'unget'($P1)
.annotate 'line', 6683
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P5
.annotate 'line', 6684
'ExpectOp'(']', __ARG_2)
.annotate 'line', 6685
$P1 = __ARG_2.'get'()
# }
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 6690
box $P4, 0
setattribute self, 'typearray', $P4
.annotate 'line', 6691
getattribute $P4, self, 'name'
getattribute $P5, self, 't_reg'
$P2 = self.'createvar'($P4, $P5)
.annotate 'line', 6692
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 6693
$P4 = $P1.'isop'('=')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 6695
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P6
.annotate 'line', 6696
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 6700
box $P4, $S1
setattribute self, 'reg', $P4
.annotate 'line', 6701
$P4 = $P1.'isop'('=')
if_null $P4, __label_5
unless $P4 goto __label_5
# {
.annotate 'line', 6702
$P1 = __ARG_2.'get'()
.annotate 'line', 6703
$P4 = $P1.'isop'('[')
isfalse $I1, $P4
unless $I1 goto __label_6
.annotate 'line', 6704
'Expected'("array initializer", $P1)
__label_6: # endif
.annotate 'line', 6705
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P5
.annotate 'line', 6706
$P1 = __ARG_2.'get'()
.annotate 'line', 6707
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_7
# {
.annotate 'line', 6708
__ARG_2.'unget'($P1)
__label_8: # do
.annotate 'line', 6709
# {
.annotate 'line', 6710
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6711
getattribute $P4, self, 'init'
$P4.'push'($P3)
# }
__label_10: # continue
.annotate 'line', 6712
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_9
if $P4 goto __label_8
__label_9: # enddo
.annotate 'line', 6713
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_11
.annotate 'line', 6714
'Expected'("',' or ']'", $P1)
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 6716
$P1 = __ARG_2.'get'()
# }
__label_5: # endif
.annotate 'line', 6718
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6719

.end # parse


.sub 'optimize' :method

.annotate 'line', 6720
# Body
# {
.annotate 'line', 6722
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6723
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6724
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6725
if_null $P1, __label_1
# {
.annotate 'line', 6726
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6727
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6729
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6731
.return(self)
# }
.annotate 'line', 6732

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6733
# Body
# {
.annotate 'line', 6735
self.'annotate'(__ARG_1)
.annotate 'line', 6736
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6737
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6738
# string reg: $S3
getattribute $P4, self, 'reg'
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 6739
# string t_reg: $S4
getattribute $P4, self, 't_reg'
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 6740
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6741
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
__ARG_1.'comment'($S10)
.annotate 'line', 6743
getattribute $P4, self, 'typearray'
set $I3, $P4
ne $I3, 0, __label_4
# {
.annotate 'line', 6744
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6745
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6747
# string itype: $S5
$P5 = $P1.'checkresult'()
null $S5
if_null $P5, __label_9
set $S5, $P5
__label_9:
.annotate 'line', 6748
ne $S5, $S4, __label_10
# {
.annotate 'line', 6749
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6750
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 6752
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6755
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_15
# {
.annotate 'line', 6757
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 6760
# string ireg: $S6
$P4 = self.'tempreg'($S5)
null $S6
if_null $P4, __label_17
set $S6, $P4
__label_17:
.annotate 'line', 6761
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6762
iseq $I3, $S4, 'S'
unless $I3 goto __label_20
iseq $I3, $S5, 'P'
__label_20:
unless $I3 goto __label_18
# {
.annotate 'line', 6763
# string auxlabel: $S7
$P4 = self.'genlabel'()
null $S7
if_null $P4, __label_21
set $S7, $P4
__label_21:
.annotate 'line', 6764
__ARG_1.'emitnull'($S3)
.annotate 'line', 6765
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6766
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6767
__ARG_1.'emitlabel'($S7)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6770
__ARG_1.'emitset'($S3, $S6)
__label_19: # endif
# }
__label_16: # endif
# }
__label_11: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_4: # else
# {
.annotate 'line', 6776
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6777
if_null $P2, __label_22
# {
.annotate 'line', 6779
# string regsize: $S8
$P4 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P4, __label_24
set $S8, $P4
__label_24:
.annotate 'line', 6780
getattribute $P4, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P4, "Array'], ", $S8)
# }
goto __label_23
__label_22: # else
# {
.annotate 'line', 6784
getattribute $P4, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P4, "Array']")
# }
__label_23: # endif
.annotate 'line', 6786
if_null $P1, __label_25
# {
.annotate 'line', 6787
# string itemreg: $S9
$P4 = self.'tempreg'($S4)
null $S9
if_null $P4, __label_26
set $S9, $P4
__label_26:
.annotate 'line', 6788
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6789
unless_null $P2, __label_27
# {
.annotate 'line', 6790
le $I1, 0, __label_28
# {
.annotate 'line', 6792
__ARG_1.'emitset'($S3, $I1)
# }
__label_28: # endif
# }
__label_27: # endif
.annotate 'line', 6795
# int i: $I2
null $I2
.annotate 'line', 6796
iter $P6, $P1
set $P6, 0
__label_29: # for iteration
unless $P6 goto __label_30
shift $P3, $P6
# {
.annotate 'line', 6797
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6798
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6799
inc $I2
# }
goto __label_29
__label_30: # endfor
# }
__label_25: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6803

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6804
# Body
# {
.annotate 'line', 6806
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6807

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6651
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6653
addattribute $P0, 'name'
.annotate 'line', 6654
addattribute $P0, 't_reg'
.annotate 'line', 6655
addattribute $P0, 't_name'
.annotate 'line', 6656
addattribute $P0, 't_array'
.annotate 'line', 6657
addattribute $P0, 'reg'
.annotate 'line', 6658
addattribute $P0, 'typearray'
.annotate 'line', 6659
addattribute $P0, 'size'
.annotate 'line', 6660
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6810
# Body
# {
.annotate 'line', 6812
# var next: $P1
null $P1
.annotate 'line', 6813
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6814
# {
.annotate 'line', 6815
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6816
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6817
$P1 = __ARG_3.'get'()
# }
__label_2: # continue
.annotate 'line', 6818
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6819
'RequireOp'(';', $P1)
.annotate 'line', 6820
.return($P2)
# }
.annotate 'line', 6821

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6833
# Body
# {
.annotate 'line', 6836
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6837
box $P1, __ARG_3
setattribute self, 'type', $P1
.annotate 'line', 6838
setattribute self, 'name', __ARG_4
.annotate 'line', 6839
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6840

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6841
# Body
# {
.annotate 'line', 6843
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6844
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6845
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6846
$P1 = $P1.'optimize'()
.annotate 'line', 6847
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6849
getattribute $P4, self, 'start'
.annotate 'line', 6848
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6851
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6852
setattribute self, 'value', $P1
.annotate 'line', 6853
.return(self)
# }
.annotate 'line', 6854

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 6855
# Body
# {
.annotate 'line', 6857
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6858

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6859
# Body
# {
.annotate 'line', 6861
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6862
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6863

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6827
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6829
addattribute $P0, 'type'
.annotate 'line', 6830
addattribute $P0, 'name'
.annotate 'line', 6831
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6866
# Body
# {
.annotate 'line', 6868
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6869
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6870
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6871
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6873
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6874
# {
.annotate 'line', 6875
$P1 = __ARG_2.'get'()
.annotate 'line', 6876
# var name: $P3
set $P3, $P1
.annotate 'line', 6877
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6878
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6880
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6879
$P2 = 'addtomulti'($P2, $P5)
# }
__label_6: # continue
.annotate 'line', 6881
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_5
if $P5 goto __label_4
__label_5: # enddo
.annotate 'line', 6882
.return($P2)
# }
.annotate 'line', 6883

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 6892
# Body
# {
.annotate 'line', 6894
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 6895
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6896
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6897
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6898
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6900
'RequireOp'(';', $P1)
# }
.annotate 'line', 6901

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6902
# Body
# {
.annotate 'line', 6904
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6905
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6906
.return(self)
# }
.annotate 'line', 6907

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6908
# Body
# {
.annotate 'line', 6910
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6911

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6912
# Body
# {
.annotate 'line', 6914
self.'annotate'(__ARG_1)
.annotate 'line', 6915
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6916
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6917
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6918
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
__ARG_1.'comment'($S5)
.annotate 'line', 6919
if_null $P1, __label_2
.annotate 'line', 6920
$P2 = $P1.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
.annotate 'line', 6921
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6922
if_null $P1, __label_4
# {
.annotate 'line', 6923
# string type: $S3
$P2 = $P1.'checkresult'()
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 6924
set $S5, $S3
set $S6, 'P'
if $S5 == $S6 goto __label_9
set $S6, 'S'
if $S5 == $S6 goto __label_10
set $S6, 'I'
if $S5 == $S6 goto __label_11
set $S6, 'N'
if $S5 == $S6 goto __label_12
set $S6, 'v'
if $S5 == $S6 goto __label_13
goto __label_8
# switch
__label_9: # case
.annotate 'line', 6926
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_17
isa $I1, $P1, 'ArrayExpr'
__label_17:
if $I1 goto __label_16
isa $I1, $P1, 'NewExpr'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 6927
$P1.'emit_init'(__ARG_1, $S2)
goto __label_15
__label_14: # else
.annotate 'line', 6929
$P1.'emit'(__ARG_1, $S2)
__label_15: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6934
# string value: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_18
set $S4, $P2
__label_18:
.annotate 'line', 6935
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_13: # case
.annotate 'line', 6938
getattribute $P3, self, 'name'
'SyntaxError'("Can't use void function as initializer", $P3)
__label_8: # default
.annotate 'line', 6940
getattribute $P4, self, 'name'
'SyntaxError'("Invalid var initializer", $P4)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6944
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6945

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6889
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6891
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6950
# Body
# {
.annotate 'line', 6952
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6953
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6954

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6955
# Body
# {
.annotate 'line', 6957
self.'annotate'(__ARG_1)
.annotate 'line', 6958
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6959
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6960
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
__ARG_1.'comment'($S3)
.annotate 'line', 6961
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6962

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6948
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6969
# Body
# {
.annotate 'line', 6971
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6972
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P2
.annotate 'line', 6973
'ExpectOp'(']', __ARG_2)
.annotate 'line', 6974
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6975

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6976
# Body
# {
.annotate 'line', 6978
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6979
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6980

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6981
# Body
# {
.annotate 'line', 6983
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6984
self.'annotate'(__ARG_1)
.annotate 'line', 6985
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6986
# string reg: $S3
getattribute $P1, self, 'reg'
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 6987
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
__ARG_1.'comment'($S4)
.annotate 'line', 6988
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6989

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6965
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6967
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6992
# Body
# {
.annotate 'line', 6994
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6995
'RequireIdentifier'($P1)
.annotate 'line', 6996
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6997
$P3 = $P2.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 6998
$P2 = __ARG_2.'get'()
.annotate 'line', 6999
$P3 = $P2.'isop'(']')
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 7000
new $P5, [ 'ResizableVarStatement' ]
$P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
goto __label_3
__label_2: # else
# {
.annotate 'line', 7002
__ARG_2.'unget'($P2)
.annotate 'line', 7003
new $P4, [ 'FixedVarStatement' ]
$P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P3, $P4
.return($P3)
# }
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 7007
__ARG_2.'unget'($P2)
.annotate 'line', 7008
new $P4, [ 'VarStatement' ]
$P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P3, $P4
.return($P3)
# }
__label_1: # endif
# }
.annotate 'line', 7010

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7012
# Body
# {
.annotate 'line', 7014
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7015
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 7016
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 7017
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7018

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7026
# Body
# {
.annotate 'line', 7028
box $P1, 'S'
setattribute self, 't_reg', $P1
.annotate 'line', 7029
box $P1, 'string'
setattribute self, 't_name', $P1
.annotate 'line', 7030
box $P1, 'String'
setattribute self, 't_array', $P1
.annotate 'line', 7031
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7032

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7033
# Body
# {
.annotate 'line', 7035
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7036

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7024
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7039
# Body
# {
.annotate 'line', 7041
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7042

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7044
# Body
# {
.annotate 'line', 7046
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 7047
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7048

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7056
# Body
# {
.annotate 'line', 7058
box $P1, 'I'
setattribute self, 't_reg', $P1
.annotate 'line', 7059
box $P1, 'int'
setattribute self, 't_name', $P1
.annotate 'line', 7060
box $P1, 'Integer'
setattribute self, 't_array', $P1
.annotate 'line', 7061
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7062

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7063
# Body
# {
.annotate 'line', 7065
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7066

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7054
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7069
# Body
# {
.annotate 'line', 7071
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7072

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7074
# Body
# {
.annotate 'line', 7076
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 7077
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7078

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7086
# Body
# {
.annotate 'line', 7088
box $P1, 'N'
setattribute self, 't_reg', $P1
.annotate 'line', 7090
box $P1, 'float'
setattribute self, 't_name', $P1
.annotate 'line', 7091
box $P1, 'Float'
setattribute self, 't_array', $P1
.annotate 'line', 7092
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7093

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7094
# Body
# {
.annotate 'line', 7096
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7097

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7084
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7100
# Body
# {
.annotate 'line', 7102
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7103

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7105
# Body
# {
.annotate 'line', 7107
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 7108
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7109

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7120
# Body
# {
.annotate 'line', 7122
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 7123
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 7124
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 7125
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7126
$P1 = __ARG_2.'get'()
$P3 = $P1.'isop'('}')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 7127
__ARG_2.'unget'($P1)
.annotate 'line', 7128
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7129
unless_null $P2, __label_2
.annotate 'line', 7130
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 7131
getattribute $P3, self, 'statements'
$P3.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7133
setattribute self, 'end', $P1
# }
.annotate 'line', 7134

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 7135
# Body
# {
.annotate 'line', 7137
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7138
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7139
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7140
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7141
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 7142
.return($S2)
# }
.annotate 'line', 7143

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 7144
# Body
# {
.annotate 'line', 7146
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7147
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7148
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7149
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7150
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 7151
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 7152
$P1[$S1] = $S3
.annotate 'line', 7153
.return($S3)
# }
.annotate 'line', 7154

.end # createlabel


.sub 'getend' :method

.annotate 'line', 7155
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7156
# Body
# {
.annotate 'line', 7158
__ARG_1.'comment'('{')
.annotate 'line', 7159
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 7160
$P1.'emit'(__ARG_1)
.annotate 'line', 7161
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 7163
__ARG_1.'comment'('}')
# }
.annotate 'line', 7164

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7115
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 7117
addattribute $P0, 'end'
.annotate 'line', 7118
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 7177
# Body
# {
.annotate 'line', 7180
box $P3, 1
setattribute self, 'nreg', $P3
.annotate 'line', 7181
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7182
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7183
setattribute self, 'tempreg', $P1
.annotate 'line', 7184
setattribute self, 'freereg', $P2
# }
.annotate 'line', 7185

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 7186
# Body
# {
.annotate 'line', 7188
box $P1, __ARG_1
setattribute self, 'type', $P1
.annotate 'line', 7189
.return(self)
# }
.annotate 'line', 7190

.end # settype


.sub 'createreg' :method

.annotate 'line', 7191
# Body
# {
.annotate 'line', 7193
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 7194
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7195
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
.annotate 'line', 7196
assign $P1, $I1
.annotate 'line', 7197
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
.annotate 'line', 7198
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 7199
.return($S1)
# }
.annotate 'line', 7200

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 7201
# Body
# {
.annotate 'line', 7203
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7204
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7205
# string reg: $S1
null $S1
.annotate 'line', 7206
# predefined elements
elements $I1, $P1
le $I1, 0, __label_0
.annotate 'line', 7207
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
.annotate 'line', 7209
$P4 = self.'createreg'()
set $S1, $P4
__label_1: # endif
.annotate 'line', 7210
$P2.'push'($S1)
.annotate 'line', 7211
.return($S1)
# }
.annotate 'line', 7212

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7213
# Body
# {
.annotate 'line', 7215
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7216
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7217
# int n: $I1
# predefined elements
elements $I1, $P2
# for loop
.annotate 'line', 7218
# int i: $I2
sub $I2, $I1, 1
__label_2: # for condition
lt $I2, 0, __label_1
# {
.annotate 'line', 7219
# string s: $S1
$S1 = $P2[$I2]
.annotate 'line', 7220
$P1.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 7218
dec $I2
goto __label_2
__label_1: # for end
.annotate 'line', 7222
assign $P2, 0
# }
.annotate 'line', 7223

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7173
addattribute $P0, 'type'
.annotate 'line', 7174
addattribute $P0, 'nreg'
.annotate 'line', 7175
addattribute $P0, 'tempreg'
.annotate 'line', 7176
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7247
# Body
# {
.annotate 'line', 7249
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7250
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
.annotate 'line', 7251
box $P1, 0
setattribute self, 'nlabel', $P1
.annotate 'line', 7252
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 7253
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 7254
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('S')
setattribute self, 'regstS', $P2
.annotate 'line', 7255
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('P')
setattribute self, 'regstP', $P2
# }
.annotate 'line', 7256

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 7258
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 7259
# Body
# {
.annotate 'line', 7262
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 7263
unless_null $P1, __label_0
# {
.annotate 'line', 7264
$P1 = self.'generatesubid'()
.annotate 'line', 7265
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 7267
.return($P1)
# }
.annotate 'line', 7268

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 7270
# Body
# {
.annotate 'line', 7272
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 7273
.return($I1)
# }
.annotate 'line', 7274

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 7275
# Body
# {
.annotate 'line', 7277
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 7278
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7279
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 7280
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 7281
# {
.annotate 'line', 7282
$P2 = __ARG_1.'get'()
.annotate 'line', 7283
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 7284
eq $S1, '', __label_5
.annotate 'line', 7285
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
.annotate 'line', 7287
set $S1, 'P'
__label_6: # endif
.annotate 'line', 7288
# string argname: $S2
# predefined string
$P5 = self.'getparamnum'()
set $S4, $P5
concat $S2, '__ARG_', $S4
.annotate 'line', 7289
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7291
# string varname: $S3
set $P5, $P2
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 7292
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 7293
$P3['name'] = $S3
.annotate 'line', 7294
$P2 = __ARG_1.'get'()
.annotate 'line', 7295
$P5 = $P2.'isop'('[')
if_null $P5, __label_8
unless $P5 goto __label_8
# {
.annotate 'line', 7296
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7297
$P3['modifiers'] = $P4
.annotate 'line', 7298
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 7300
$P1.'push'($P3)
# }
__label_3: # continue
.annotate 'line', 7301
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 7302
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_9
.annotate 'line', 7303
'Expected'("')' or ','", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7305

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7307
# Body
# {
.annotate 'line', 7309
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 7310
unless_null $P1, __label_0
.annotate 'line', 7311
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 7313
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 7314

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7316
# Body
# {
.annotate 'line', 7318
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 7319
.return(self)
# }
.annotate 'line', 7320

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7322
# Body
# {
.annotate 'line', 7324
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7325
unless_null $P1, __label_0
# {
.annotate 'line', 7326
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7327
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7329
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7330

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7331
# Body
# {
.annotate 'line', 7333
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 7334
unless_null $P1, __label_0
# {
.annotate 'line', 7335
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7336
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7338
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7339

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7340
# Body
# {
.annotate 'line', 7344
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 7345
# string lexname: $S1
null $S1
.annotate 'line', 7346
if_null $P1, __label_0
.annotate 'line', 7347
set $S1, $P1
goto __label_1
__label_0: # else
# {
.annotate 'line', 7349
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 7350
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 7351
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 7352
self.'setlex'($S1, $S2)
.annotate 'line', 7353
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 7355
.return($S1)
# }
.annotate 'line', 7356

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7358
# Body
# {
.annotate 'line', 7360
# var store: $P1
null $P1
.annotate 'line', 7361
set $S2, __ARG_1
set $S3, 'I'
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
.annotate 'line', 7363
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7365
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7367
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7369
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7371
concat $S4, 'Invalid type in createreg: ', __ARG_1
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7373
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7374
.return($S1)
# }
.annotate 'line', 7375

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7376
# Body
# {
.annotate 'line', 7378
# var store: $P1
null $P1
.annotate 'line', 7379
set $S2, __ARG_1
set $S3, 'I'
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
.annotate 'line', 7381
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7383
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7385
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7387
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7389
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 7391
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7392
.return($S1)
# }
.annotate 'line', 7393

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7394
# Body
# {
.annotate 'line', 7396
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
.annotate 'line', 7397
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7398

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7399
# Body
# {
.annotate 'line', 7401
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7402
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7403
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
.annotate 'line', 7404
assign $P1, $I1
.annotate 'line', 7405
.return($S1)
# }
.annotate 'line', 7406

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7407
# Body
# {
.annotate 'line', 7409
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7410

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7411
# Body
# {
.annotate 'line', 7413
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7414

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7416
# Body
# {
.annotate 'line', 7418
# string name: $S1
getattribute $P20, self, 'name'
null $S1
if_null $P20, __label_0
set $S1, $P20
__label_0:
.annotate 'line', 7419
__ARG_1.'say'()
.annotate 'line', 7420
__ARG_1.'print'(".sub ")
.annotate 'line', 7421
$P20 = self.'isanonymous'()
if_null $P20, __label_1
unless $P20 goto __label_1
.annotate 'line', 7422
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7424
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7425
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7426
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7427
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7428
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7429
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7430
if_null $P2, __label_5
.annotate 'line', 7431
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7435
$P20 = self.'ismethod'()
if_null $P20, __label_6
unless $P20 goto __label_6
.annotate 'line', 7436
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7437
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7438
if_null $P3, __label_7
# {
.annotate 'line', 7439
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7440
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7441
# int nargmods: $I1
$P20 = $P5.'numargs'()
set $I1, $P20
.annotate 'line', 7442
$P20 = $P5.'getname'()
__ARG_1.'print'(' :', $P20)
.annotate 'line', 7443
le $I1, 0, __label_11
# {
.annotate 'line', 7444
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7445
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7446
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7447
$P20 = $P6.'isstringliteral'()
isfalse $I5, $P20
unless $I5 goto __label_15
.annotate 'line', 7448
getattribute $P21, $P6, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_15: # endif
.annotate 'line', 7449
$P20 = $P6.'getPirString'()
__ARG_1.'print'($P20)
# }
__label_12: # for iteration
.annotate 'line', 7445
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7451
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
.annotate 'line', 7456
ne $S1, 'main', __label_16
.annotate 'line', 7457
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7459
__ARG_1.'say'()
.annotate 'line', 7461
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7462
# var param: $P8
null $P8
.annotate 'line', 7463
# string paramname: $S2
null $S2
.annotate 'line', 7464
# var a: $P9
null $P9
.annotate 'line', 7466
iter $P23, $P7
set $P23, 0
__label_17: # for iteration
unless $P23 goto __label_18
shift $P8, $P23
# {
.annotate 'line', 7467
$S2 = $P8['name']
.annotate 'line', 7468
$P9 = self.'getvar'($S2)
.annotate 'line', 7469
# string ptype: $S3
$P21 = $P9.'gettype'()
$P20 = 'typetopirname'($P21)
null $S3
if_null $P20, __label_19
set $S3, $P20
__label_19:
.annotate 'line', 7470
$P20 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P20)
.annotate 'line', 7471
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7472
if_null $P10, __label_20
# {
.annotate 'line', 7473
# var named: $P11
null $P11
.annotate 'line', 7474
# var slurpy: $P12
null $P12
.annotate 'line', 7475
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7476
iter $P24, $P13
set $P24, 0
__label_21: # for iteration
unless $P24 goto __label_22
shift $P14, $P24
# {
.annotate 'line', 7477
# string modname: $S4
$P20 = $P14.'getname'()
null $S4
if_null $P20, __label_23
set $S4, $P20
__label_23:
.annotate 'line', 7478
set $S8, $S4
set $S9, 'named'
if $S8 == $S9 goto __label_26
set $S9, 'slurpy'
if $S8 == $S9 goto __label_27
goto __label_25
# switch
__label_26: # case
.annotate 'line', 7480
set $P11, $P14
goto __label_24 # break
__label_27: # case
.annotate 'line', 7483
set $P12, $P14
goto __label_24 # break
__label_25: # default
.annotate 'line', 7486
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7489
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7494
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7497
if_null $P11, __label_31
# {
.annotate 'line', 7498
# string setname: $S5
null $S5
.annotate 'line', 7499
# int nargs: $I3
$P20 = $P11.'numargs'()
set $I3, $P20
.annotate 'line', 7500
set $I5, $I3
null $I6
if $I5 == $I6 goto __label_35
set $I6, 1
if $I5 == $I6 goto __label_36
goto __label_34
# switch
__label_35: # case
.annotate 'line', 7502
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S5, $S0
goto __label_33 # break
__label_36: # case
.annotate 'line', 7505
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7506
$P20 = $P15.'isstringliteral'()
isfalse $I7, $P20
unless $I7 goto __label_37
.annotate 'line', 7507
getattribute $P21, self, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_37: # endif
.annotate 'line', 7508
$P25 = $P15.'getPirString'()
set $S5, $P25
goto __label_33 # break
__label_34: # default
.annotate 'line', 7511
getattribute $P26, self, 'start'
'SyntaxError'('Invalid modifier', $P26)
__label_33: # switch end
.annotate 'line', 7513
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7515
if_null $P12, __label_38
# {
.annotate 'line', 7516
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7520
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7522
__ARG_1.'say'()
.annotate 'line', 7523
getattribute $P20, self, 'start'
__ARG_1.'annotate'($P20)
.annotate 'line', 7526
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7527
if_null $P16, __label_39
# {
.annotate 'line', 7529
iter $P27, $P16
set $P27, 0
__label_40: # for iteration
unless $P27 goto __label_41
shift $S6, $P27
.annotate 'line', 7530
$P20 = $P16[$S6]
__ARG_1.'say'(".lex '", $P20, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7533
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7534
if_null $P16, __label_42
# {
.annotate 'line', 7536
iter $P28, $P16
set $P28, 0
__label_43: # for iteration
unless $P28 goto __label_44
shift $S7, $P28
.annotate 'line', 7537
$P20 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P20, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7540
# var body: $P17
getattribute $P17, self, 'body'
.annotate 'line', 7541
$P20 = $P17.'isempty'()
if_null $P20, __label_45
unless $P20 goto __label_45
.annotate 'line', 7542
__ARG_1.'comment'('Empty body')
goto __label_46
__label_45: # else
# {
.annotate 'line', 7544
__ARG_1.'comment'('Body')
.annotate 'line', 7545
$P17.'emit'(__ARG_1)
.annotate 'line', 7546
$P20 = $P17.'getend'()
__ARG_1.'annotate'($P20)
# }
__label_46: # endif
.annotate 'line', 7548
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7551
# var localfun: $P18
getattribute $P18, self, 'localfun'
.annotate 'line', 7552
if_null $P18, __label_47
# {
# for loop
.annotate 'line', 7553
# int ifn: $I4
null $I4
__label_50: # for condition
# predefined elements
elements $I5, $P18
ge $I4, $I5, __label_49
# {
.annotate 'line', 7554
# var fn: $P19
$P19 = $P18[$I4]
.annotate 'line', 7555
$P19.'emit'(__ARG_1)
# }
__label_48: # for iteration
.annotate 'line', 7553
inc $I4
goto __label_50
__label_49: # for end
# }
__label_47: # endif
# }
.annotate 'line', 7558

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7230
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 7232
addattribute $P0, 'name'
.annotate 'line', 7233
addattribute $P0, 'subid'
.annotate 'line', 7234
addattribute $P0, 'modifiers'
.annotate 'line', 7235
addattribute $P0, 'params'
.annotate 'line', 7236
addattribute $P0, 'body'
.annotate 'line', 7237
addattribute $P0, 'regstI'
.annotate 'line', 7238
addattribute $P0, 'regstN'
.annotate 'line', 7239
addattribute $P0, 'regstS'
.annotate 'line', 7240
addattribute $P0, 'regstP'
.annotate 'line', 7241
addattribute $P0, 'nlabel'
.annotate 'line', 7242
addattribute $P0, 'localfun'
.annotate 'line', 7243
addattribute $P0, 'lexicals'
.annotate 'line', 7244
addattribute $P0, 'usedlexicals'
.annotate 'line', 7245
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7570
# Body
# {
.annotate 'line', 7572
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7573
box $P1, 0
setattribute self, 'paramnum', $P1
.annotate 'line', 7574
box $P1, 0
setattribute self, 'lexnum', $P1
.annotate 'line', 7575
self.'parse'(__ARG_2)
# }
.annotate 'line', 7576

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7578
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7579
# Body
# {
.annotate 'line', 7582
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7583
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 7584
assign $P1, $I1
.annotate 'line', 7585
.return($I1)
# }
.annotate 'line', 7586

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7587
# Body
# {
.annotate 'line', 7590
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7591
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 7592
assign $P1, $I1
.annotate 'line', 7593
.return($I1)
# }
.annotate 'line', 7594

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7595
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7597
# Body
# {
.annotate 'line', 7599
# var name: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7600
setattribute self, 'name', $P1
.annotate 'line', 7601
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7602
$P5 = $P2.'isop'('[')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 7603
# var modifiers: $P3
new $P3, [ 'ModifierList' ]
$P3.'ModifierList'(__ARG_1, self)
.annotate 'line', 7604
setattribute self, 'modifiers', $P3
.annotate 'line', 7605
$P2 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 7607
'RequireOp'('(', $P2)
.annotate 'line', 7608
self.'parse_parameters'(__ARG_1)
.annotate 'line', 7610
# var fullname: $P4
getattribute $P6, self, 'owner'
$P5 = $P6.'getpath'()
# predefined clone
clone $P4, $P5
.annotate 'line', 7611
$P5 = $P1.'getidentifier'()
$P4.'push'($P5)
.annotate 'line', 7613
new $P6, [ 'StringLiteral' ]
.annotate 'line', 7614
new $P8, [ 'TokenQuoted' ]
getattribute $P9, $P1, 'file'
getattribute $P10, $P1, 'line'
# predefined join
join $S1, '.', $P4
$P8.'TokenQuoted'($P9, $P10, $S1)
set $P7, $P8
$P6.'StringLiteral'(self, $P7)
set $P5, $P6
.annotate 'line', 7612
self.'createconst'('__FUNCTION__', 'S', $P5, '')
.annotate 'line', 7617
$P2 = __ARG_1.'get'()
.annotate 'line', 7618
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 7619
'ExpectedOp'('{', $P2)
__label_1: # endif
.annotate 'line', 7620
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7621
.return(self)
# }
.annotate 'line', 7622

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7565
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7567
addattribute $P0, 'paramnum'
.annotate 'line', 7568
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7631
# Body
# {
.annotate 'line', 7633
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7634
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 7635
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 7636
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 7637
setattribute self, 'name', $P1
.annotate 'line', 7638
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7639
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7640
'RequireOp'('{', $P2)
.annotate 'line', 7641
new $P5, [ 'CompoundStatement' ]
$P5.'CompoundStatement'($P2, __ARG_2, self)
set $P4, $P5
setattribute self, 'body', $P4
.annotate 'line', 7642
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7643

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7644
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 7645
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 7646
# Body
# {
.annotate 'line', 7648
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7649

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7650
# Body
# {
.annotate 'line', 7653
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7654

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7655
# Body
# {
.annotate 'line', 7658
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7659

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7660
# Body
# {
.annotate 'line', 7662
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7663
unless_null $P1, __label_0
# {
.annotate 'line', 7666
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7667
unless_null $P1, __label_1
# {
.annotate 'line', 7669
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7670
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7671
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7672
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7673
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7674
# string reg: $S2
$P6 = $P1.'getreg'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 7675
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7679
$P6 = $P1.'gettype'()
set $S5, $P6
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P7 = $P1.'isconst'()
isfalse $I2, $P7
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 7680
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7681
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7682
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7683
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 7684
$P6 = $P4.'same_scope_as'($P5)
if_null $P6, __label_10
unless $P6 goto __label_10
# {
.annotate 'line', 7685
# string lexname: $S3
$P7 = $P3.'makelexical'($P1)
null $S3
if_null $P7, __label_11
set $S3, $P7
__label_11:
.annotate 'line', 7686
# int flags: $I1
$P6 = $P1.'isvolatile'()
if_null $P6, __label_13
unless $P6 goto __label_13
set $I1, 1
goto __label_12
__label_13:
null $I1
__label_12:
.annotate 'line', 7687
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 7688
box $P6, $S3
setattribute $P1, 'lexname', $P6
.annotate 'line', 7689
# string reg: $S4
$P6 = $P1.'getreg'()
null $S4
if_null $P6, __label_14
set $S4, $P6
__label_14:
.annotate 'line', 7690
self.'setusedlex'($S3, $S4)
# }
__label_10: # endif
# }
__label_9: # endif
# }
__label_7: # endif
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 7695
isnull $I2, $P1
not $I2
unless $I2 goto __label_16
isa $I3, $P1, 'VarData'
not $I2, $I3
__label_16:
unless $I2 goto __label_15
.annotate 'line', 7696
'InternalError'('Incorrect data for variable in LocalFunction')
__label_15: # endif
.annotate 'line', 7697
.return($P1)
# }
.annotate 'line', 7698

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7629
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7707
# Body
# {
.annotate 'line', 7709
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7710

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 7711
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7705
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

.annotate 'line', 7728
# Body
# {
.annotate 'line', 7730
setattribute self, 'owner', __ARG_1
.annotate 'line', 7731
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7732

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7733
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7735
# Body
# {
.annotate 'line', 7737
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7738

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7726
addattribute $P0, 'owner'
.annotate 'line', 7727
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7744
# Body
# {
.annotate 'line', 7746
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7747
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7748

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7749
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7751
# Body
# {
.annotate 'line', 7753
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7754
__ARG_1.'print'($S1)
# }
.annotate 'line', 7755

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7741
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7743
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7762
# Body
# {
.annotate 'line', 7764
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7765
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7766
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7767
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7768
'Expected'('literal string', $P2)
__label_0: # endif
.annotate 'line', 7769
$P3 = $P2.'rawstring'()
$P1.'push'($P3)
.annotate 'line', 7770
$P2 = __ARG_1.'get'()
.annotate 'line', 7771
$P3 = $P2.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 7772
$P4 = $P2.'checkop'()
set $S1, $P4
set $S2, ':'
if $S1 == $S2 goto __label_4
set $S2, ','
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 7774
box $P5, 1
setattribute self, 'hll', $P5
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7778
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7780
# {
.annotate 'line', 7781
$P2 = __ARG_1.'get'()
.annotate 'line', 7782
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_9
.annotate 'line', 7783
'Expected'('literal string', $P2)
__label_9: # endif
.annotate 'line', 7784
$P3 = $P2.'rawstring'()
$P1.'push'($P3)
# }
__label_8: # continue
.annotate 'line', 7785
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'(',')
if_null $P3, __label_7
if $P3 goto __label_6
__label_7: # enddo
.annotate 'line', 7786
'RequireOp'(']', $P2)
# }
__label_1: # endif
.annotate 'line', 7788
setattribute self, 'key', $P1
# }
.annotate 'line', 7789

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7790
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7791
# Body
# {
# predefined int
.annotate 'line', 7793
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 7794

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7796
# Body
# {
.annotate 'line', 7798
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7799

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7758
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7760
addattribute $P0, 'key'
.annotate 'line', 7761
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7805
# Body
# {
.annotate 'line', 7807
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7808
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
$P1.'push'($P3)
.annotate 'line', 7809
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7810
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7811
$P2 = __ARG_1.'get'()
.annotate 'line', 7812
# predefined string
set $S1, $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7814
__ARG_1.'unget'($P2)
.annotate 'line', 7815
setattribute self, 'key', $P1
# }
.annotate 'line', 7816

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7817
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7819
# Body
# {
.annotate 'line', 7821
# var key: $P1
getattribute $P1, self, 'key'
.annotate 'line', 7822
$P2 = $P1[-1]
.return($P2)
# }
.annotate 'line', 7823

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7825
# Body
# {
.annotate 'line', 7827
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7828
unless_null $P1, __label_0
# {
.annotate 'line', 7829
$P2 = self.'dowarnings'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 7830
getattribute $P3, self, 'key'
# predefined join
join $S1, ".", $P3
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
__label_2: # endif
.annotate 'line', 7831
getattribute $P3, self, 'key'
$P2 = 'getparrotkey'($P3)
__ARG_1.'print'($P2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7833
$P2 = $P1.'getclasskey'()
__ARG_1.'print'($P2)
__label_1: # endif
# }
.annotate 'line', 7834

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7802
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7804
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7837
# Body
# {
.annotate 'line', 7839
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7840
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7841
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7842
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7843
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7844
$P2 = $P1.'isidentifier'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 7845
new $P4, [ 'ClassSpecifierId' ]
$P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_2: # endif
.annotate 'line', 7846
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7847

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7864
# Body
# {
.annotate 'line', 7866
setattribute self, 'parent', __ARG_2
.annotate 'line', 7867
setattribute self, 'owner', __ARG_2
.annotate 'line', 7868
# var functions: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7869
setattribute self, 'functions', $P1
.annotate 'line', 7870
# var members: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 7871
setattribute self, 'members', $P2
.annotate 'line', 7872
root_new $P13, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P13
.annotate 'line', 7873
# var constants: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 7874
setattribute self, 'constants', $P3
.annotate 'line', 7876
# var name: $P4
$P4 = __ARG_1.'get'()
.annotate 'line', 7877
setattribute self, 'name', $P4
.annotate 'line', 7878
# var classns: $P5
$P12 = __ARG_2.'getpath'()
# predefined clone
clone $P5, $P12
.annotate 'line', 7879
getattribute $P12, self, 'name'
$P5.'push'($P12)
.annotate 'line', 7880
setattribute self, 'classns', $P5
.annotate 'line', 7882
# var t: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7883
$P12 = $P6.'isop'(':')
if_null $P12, __label_0
unless $P12 goto __label_0
# {
.annotate 'line', 7884
# var bases: $P7
getattribute $P7, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7885
# {
.annotate 'line', 7886
# var base: $P8
$P8 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7887
$P7.'push'($P8)
.annotate 'line', 7888
$P6 = __ARG_1.'get'()
.annotate 'line', 7889
$P12 = $P6.'isop'(',')
isfalse $I1, $P12
unless $I1 goto __label_3
goto __label_1 # break
__label_3: # endif
# }
goto __label_2
__label_1: # Infinite loop end
# }
__label_0: # endif
.annotate 'line', 7892
'RequireOp'('{', $P6)
# for loop
.annotate 'line', 7893
$P6 = __ARG_1.'get'()
__label_6: # for condition
$P12 = $P6.'isop'('}')
isfalse $I1, $P12
unless $I1 goto __label_5
# {
.annotate 'line', 7894
# string key: $S1
$P13 = $P6.'checkkeyword'()
null $S1
if_null $P13, __label_7
set $S1, $P13
__label_7:
.annotate 'line', 7895
set $S2, $S1
set $S3, 'function'
if $S2 == $S3 goto __label_10
set $S3, 'var'
if $S2 == $S3 goto __label_11
set $S3, 'const'
if $S2 == $S3 goto __label_12
goto __label_9
# switch
__label_10: # case
.annotate 'line', 7897
# var f: $P9
new $P9, [ 'MethodStatement' ]
$P9.'MethodStatement'($P6, __ARG_1, self)
.annotate 'line', 7898
$P1.'push'($P9)
goto __label_8 # break
__label_11: # case
.annotate 'line', 7901
# var name: $P10
$P10 = __ARG_1.'get'()
.annotate 'line', 7902
$P12 = $P10.'isidentifier'()
isfalse $I1, $P12
unless $I1 goto __label_13
.annotate 'line', 7903
'Expected'("member identifier", $P10)
__label_13: # endif
.annotate 'line', 7904
$P2.'push'($P10)
.annotate 'line', 7905
$P6 = __ARG_1.'get'()
.annotate 'line', 7906
$P13 = $P6.'isop'(';')
isfalse $I2, $P13
unless $I2 goto __label_14
.annotate 'line', 7907
'Expected'("';' in member declaration", $P6)
__label_14: # endif
goto __label_8 # break
__label_12: # case
.annotate 'line', 7910
# var cst: $P11
$P11 = 'parseConst'($P6, __ARG_1, self)
.annotate 'line', 7911
$P3.'push'($P11)
goto __label_8 # break
__label_9: # default
.annotate 'line', 7914
'SyntaxError'("Unexpected item in class", $P6)
__label_8: # switch end
# }
__label_4: # for iteration
.annotate 'line', 7893
$P6 = __ARG_1.'get'()
goto __label_6
__label_5: # for end
# }
.annotate 'line', 7917

.end # ClassStatement


.sub 'getpath' :method

.annotate 'line', 7918
# Body
# {
.annotate 'line', 7920
getattribute $P1, self, 'classns'
.return($P1)
# }
.annotate 'line', 7921

.end # getpath


.sub 'generatesubid' :method

.annotate 'line', 7922
# Body
# {
.annotate 'line', 7924
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7925

.end # generatesubid


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 7926
# Body
# {
.annotate 'line', 7928
getattribute $P1, self, 'parent'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 7929

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7930
# Body
# {
.annotate 'line', 7932
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7933

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7934
# Body
# {
.annotate 'line', 7936
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7937

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7938
# Body
# {
.annotate 'line', 7940
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7941

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7942
# Body
# {
.annotate 'line', 7944
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7945
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7946
.return(self)
# }
.annotate 'line', 7947

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7948
# Body
# {
.annotate 'line', 7950
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7951

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7952
# Body
# {
.annotate 'line', 7954
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7955
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7956
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7957
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7959
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7961
$P5 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P5)
.annotate 'line', 7962
# int n: $I1
set $I1, 1
.annotate 'line', 7963
getattribute $P5, self, 'bases'
iter $P7, $P5
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7964
$P3.'annotate'(__ARG_1)
.annotate 'line', 7965
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 7966
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7967
getattribute $P5, self, 'parent'
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 7968
__ARG_1.'say'()
.annotate 'line', 7969
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7971
getattribute $P5, self, 'members'
iter $P8, $P5
set $P8, 0
__label_4: # for iteration
unless $P8 goto __label_5
shift $P4, $P8
# {
.annotate 'line', 7972
__ARG_1.'annotate'($P4)
.annotate 'line', 7973
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7976
__ARG_1.'say'('.end')
# }
.annotate 'line', 7977

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7853
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7855
addattribute $P0, 'parent'
.annotate 'line', 7856
addattribute $P0, 'owner'
.annotate 'line', 7857
addattribute $P0, 'name'
.annotate 'line', 7858
addattribute $P0, 'bases'
.annotate 'line', 7859
addattribute $P0, 'constants'
.annotate 'line', 7860
addattribute $P0, 'functions'
.annotate 'line', 7861
addattribute $P0, 'members'
.annotate 'line', 7862
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7984
# Body
# {
.annotate 'line', 7986
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7987
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7988
'Expected'('literal string', $P1)
__label_0: # endif
.annotate 'line', 7989
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7990
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7991
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7996
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7997
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7998
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7999
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 8000
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 8001
# try: create handler
new $P9, 'ExceptionHandler'
set_label $P9, __label_4
push_eh $P9
# try: begin
# {
.annotate 'line', 8002
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 8003
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 8001
# catch
__label_4:
.get_results($P11)
finalize $P11
pop_eh
# catch end
__label_5:
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 8008
$P9 = $P5.'is_closed'()
if_null $P9, __label_6
unless $P9 goto __label_6
.annotate 'line', 8009
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 8014
load_bytecode 'PGE.pbc'
.annotate 'line', 8015
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 8016
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 8018
# string line: $S4
$P9 = $P5.'readline'()
null $S4
if_null $P9, __label_10
set $S4, $P9
__label_10:
__label_9: # for condition
$P11 = $P5.'eof'()
isfalse $I2, $P11
unless $I2 goto __label_8
# {
.annotate 'line', 8019
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8020
$P8 = $P7($S4)
.annotate 'line', 8021
# predefined elements
elements $I2, $P8
le $I2, 0, __label_11
# {
.annotate 'line', 8022
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 8023
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 8024
# int ivalue: $I1
null $I1
.annotate 'line', 8025
# predefined substr
substr $S7, $S6, 0, 2
iseq $I2, $S7, '0x'
if $I2 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I2, $S8, '0X'
__label_14:
unless $I2 goto __label_12
.annotate 'line', 8026
# predefined substr
substr $S9, $S6, 2
box $P11, $S9
$P9 = $P11.'to_int'(16)
set $I1, $P9
goto __label_13
__label_12: # else
.annotate 'line', 8028
set $I1, $S6
__label_13: # endif
.annotate 'line', 8031
new $P12, [ 'TokenInteger' ]
getattribute $P13, __ARG_1, 'file'
getattribute $P14, __ARG_1, 'line'
$P12.'TokenInteger'($P13, $P14, $S5)
set $P11, $P12
.annotate 'line', 8030
$P9 = 'integerValue'(__ARG_3, $P11, $I1)
.annotate 'line', 8029
__ARG_3.'createconst'($S5, 'I', $P9, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 8018
$P9 = $P5.'readline'()
set $S4, $P9
goto __label_9
__label_8: # for end
.annotate 'line', 8035
$P5.'close'()
# }
.annotate 'line', 8036

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 8049
# Body
# {
.annotate 'line', 8051
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 8052
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 8053
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P2
.annotate 'line', 8054
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P2
# }
.annotate 'line', 8055

.end # init


.sub 'getpath' :method

.annotate 'line', 8056
# Body
# {
.annotate 'line', 8058
getattribute $P1, self, 'nspath'
.return($P1)
# }
.annotate 'line', 8059

.end # getpath


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 8060
# Body
# {
.annotate 'line', 8062
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 8063
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 8064
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 8065
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 8066
.return($P4)
# }
.annotate 'line', 8067

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 8068
# Body
# {
.annotate 'line', 8072
# predefined elements
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 8074
.return($P5)
__label_3: # case
.annotate 'line', 8077
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 8082
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 8083
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 8084
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 8085
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 8086
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 8087
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8088
if_null $P4, __label_8
.annotate 'line', 8089
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 8093
.return($P5)
# }
.annotate 'line', 8094

.end # findclasskey_base


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8095
# Body
# {
.annotate 'line', 8099
# predefined elements
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P7
.annotate 'line', 8101
.return($P7)
__label_3: # case
.annotate 'line', 8103
# string name: $S1
$S1 = __ARG_1[0]
.annotate 'line', 8105
# var sym: $P1
$P1 = self.'checkclass_base'($S1)
.annotate 'line', 8106
if_null $P1, __label_4
.annotate 'line', 8107
.return($P1)
__label_4: # endif
.annotate 'line', 8108
getattribute $P8, self, 'functions'
iter $P9, $P8
set $P9, 0
__label_5: # for iteration
unless $P9 goto __label_6
shift $P2, $P9
.annotate 'line', 8109
getattribute $P10, $P2, 'name'
set $S3, $P10
ne $S3, $S1, __label_7
.annotate 'line', 8110
.return($P2)
__label_7: # endif
goto __label_5
__label_6: # endfor
null $P11
.annotate 'line', 8111
.return($P11)
__label_1: # default
.annotate 'line', 8116
# var namespaces: $P3
getattribute $P3, self, 'namespaces'
.annotate 'line', 8117
# var childkey: $P4
# predefined clone
clone $P4, __ARG_1
.annotate 'line', 8118
# string basename: $S2
$P12 = $P4.'shift'()
null $S2
if_null $P12, __label_8
set $S2, $P12
__label_8:
.annotate 'line', 8119
iter $P13, $P3
set $P13, 0
__label_9: # for iteration
unless $P13 goto __label_10
shift $P5, $P13
# {
.annotate 'line', 8120
getattribute $P14, $P5, 'name'
set $S4, $P14
ne $S4, $S2, __label_11
# {
.annotate 'line', 8121
# var found: $P6
$P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8122
if_null $P6, __label_12
.annotate 'line', 8123
.return($P6)
__label_12: # endif
# }
__label_11: # endif
# }
goto __label_9
__label_10: # endfor
__label_0: # switch end
null $P7
.annotate 'line', 8127
.return($P7)
# }
.annotate 'line', 8128

.end # findsymbol


.sub 'parsenamespace' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8129
# Body
# {
.annotate 'line', 8131
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8132
# string name: $S1
set $P4, $P1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 8133
$P1 = __ARG_2.'get'()
.annotate 'line', 8135
# var modifier: $P2
null $P2
.annotate 'line', 8136
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 8137
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 8138
$P1 = __ARG_2.'get'()
# }
__label_1: # endif
.annotate 'line', 8141
'RequireOp'('{', $P1)
.annotate 'line', 8142
# var child: $P3
new $P3, [ 'NamespaceStatement' ]
$P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8143
getattribute $P4, self, 'namespaces'
$P4.'push'($P3)
.annotate 'line', 8144
getattribute $P4, self, 'items'
$P4.'push'($P3)
.annotate 'line', 8145
$P3.'parse'(__ARG_2)
# }
.annotate 'line', 8146

.end # parsenamespace


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8147
# Body
# {
.annotate 'line', 8149
# var items: $P1
getattribute $P1, self, 'items'
.annotate 'line', 8150
# var functions: $P2
getattribute $P2, self, 'functions'
.annotate 'line', 8151
# var classes: $P3
getattribute $P3, self, 'classes'
.annotate 'line', 8152
# var t: $P4
null $P4
# for loop
.annotate 'line', 8153
$P4 = __ARG_1.'get'()
__label_2: # for condition
set $I1, $P4
unless $I1 goto __label_3
$P8 = $P4.'isop'('}')
isfalse $I1, $P8
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 8155
# string key: $S1
$P9 = $P4.'checkkeyword'()
null $S1
if_null $P9, __label_4
set $S1, $P9
__label_4:
.annotate 'line', 8156
set $S4, $S1
set $S5, 'namespace'
if $S4 == $S5 goto __label_7
set $S5, 'const'
if $S4 == $S5 goto __label_8
set $S5, 'function'
if $S4 == $S5 goto __label_9
set $S5, 'class'
if $S4 == $S5 goto __label_10
set $S5, 'using'
if $S4 == $S5 goto __label_11
set $S5, '$include_const'
if $S4 == $S5 goto __label_12
set $S5, '$load'
if $S4 == $S5 goto __label_13
goto __label_6
# switch
__label_7: # case
.annotate 'line', 8158
self.'parsenamespace'($P4, __ARG_1)
goto __label_5 # break
__label_8: # case
.annotate 'line', 8161
# var cst: $P5
$P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8162
$P1.'push'($P5)
goto __label_5 # break
__label_9: # case
.annotate 'line', 8165
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8166
$P2.'push'($P6)
.annotate 'line', 8167
$P1.'push'($P6)
goto __label_5 # break
__label_10: # case
.annotate 'line', 8170
# var c: $P7
new $P7, [ 'ClassStatement' ]
$P7.'ClassStatement'(__ARG_1, self)
.annotate 'line', 8171
$P3.'push'($P7)
.annotate 'line', 8172
$P1.'push'($P7)
goto __label_5 # break
__label_11: # case
.annotate 'line', 8175
$P4 = __ARG_1.'get'()
.annotate 'line', 8176
$P8 = $P4.'iskeyword'('extern')
isfalse $I1, $P8
unless $I1 goto __label_14
.annotate 'line', 8177
'SyntaxError'('Unsupported at nmaespace level', $P4)
__label_14: # endif
.annotate 'line', 8178
$P4 = __ARG_1.'get'()
.annotate 'line', 8179
$P9 = $P4.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_15
.annotate 'line', 8180
'Expected'('string literal', $P4)
__label_15: # endif
.annotate 'line', 8181
# string reqlib: $S2
set $P10, $P4
null $S2
if_null $P10, __label_16
set $S2, $P10
__label_16:
.annotate 'line', 8182
self.'addlib'($S2)
.annotate 'line', 8183
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_12: # case
.annotate 'line', 8186
'include_parrot'($P4, __ARG_1, self)
goto __label_5 # break
__label_13: # case
.annotate 'line', 8189
$P4 = __ARG_1.'get'()
.annotate 'line', 8190
$P11 = $P4.'isstring'()
isfalse $I3, $P11
unless $I3 goto __label_17
.annotate 'line', 8191
'Expected'('string literal', $P4)
__label_17: # endif
.annotate 'line', 8192
# string reqload: $S3
set $P12, $P4
null $S3
if_null $P12, __label_18
set $S3, $P12
__label_18:
.annotate 'line', 8193
self.'addload'($S3)
.annotate 'line', 8194
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_6: # default
.annotate 'line', 8197
'SyntaxError'("Unexpected token", $P4)
__label_5: # switch end
# }
__label_0: # for iteration
.annotate 'line', 8153
$P4 = __ARG_1.'get'()
goto __label_2
__label_1: # for end
.annotate 'line', 8200
if_null $P4, __label_19
unless $P4 goto __label_19
.annotate 'line', 8201
self.'close_ns'($P4)
goto __label_20
__label_19: # else
.annotate 'line', 8203
self.'unclosed_ns'()
__label_20: # endif
# }
.annotate 'line', 8204

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 8205
# Body
# {
.annotate 'line', 8207
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 8208

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 8209
# Body
# {
.annotate 'line', 8211
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 8212
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 8214
# int activate: $I1
set $I1, 1
.annotate 'line', 8215
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 8216
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 8217
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
.annotate 'line', 8218
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 8220
unless $I1 goto __label_6
# {
.annotate 'line', 8221
__ARG_1.'say'($S1)
.annotate 'line', 8222
null $I1
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 8224
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 8226

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8040
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 8042
addattribute $P0, 'nspath'
.annotate 'line', 8043
addattribute $P0, 'namespaces'
.annotate 'line', 8044
addattribute $P0, 'classes'
.annotate 'line', 8045
addattribute $P0, 'functions'
.annotate 'line', 8046
addattribute $P0, 'items'
.annotate 'line', 8047
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 8241
# Body
# {
.annotate 'line', 8244
# var nspath: $P1
$P2 = __ARG_1.'getpath'()
# predefined clone
clone $P1, $P2
.annotate 'line', 8245
$P1.'push'(__ARG_3)
.annotate 'line', 8246
setattribute self, 'nspath', $P1
.annotate 'line', 8248
setattribute self, 'parent', __ARG_1
.annotate 'line', 8249
setattribute self, 'start', __ARG_2
.annotate 'line', 8250
setattribute self, 'owner', __ARG_1
.annotate 'line', 8251
box $P2, __ARG_3
setattribute self, 'name', $P2
.annotate 'line', 8252
setattribute self, 'modifier', __ARG_4
.annotate 'line', 8253
if_null __ARG_4, __label_0
# {
.annotate 'line', 8254
$P2 = __ARG_4.'pick'('HLL')
if_null $P2, __label_1
.annotate 'line', 8255
getattribute $P4, self, 'name'
setattribute self, 'hll', $P4
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 8257

.end # NamespaceStatement


.sub 'generatesubid' :method

.annotate 'line', 8258
# Body
# {
.annotate 'line', 8260
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8261

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8262
# Body
# {
.annotate 'line', 8264
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8265

.end # use_predef


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8266
# Body
# {
.annotate 'line', 8268
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8269

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8270
# Body
# {
.annotate 'line', 8272
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 8273

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8274
# Body
# {
.annotate 'line', 8276
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8277
unless_null $P1, __label_0
.annotate 'line', 8278
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 8280
.return($P1)
__label_1: # endif
# }
.annotate 'line', 8281

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8282
# Body
# {
.annotate 'line', 8286
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8287
unless_null $P1, __label_0
.annotate 'line', 8288
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 8289
.return($P1)
# }
.annotate 'line', 8290

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8291
# Body
# {
.annotate 'line', 8293
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8294

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8295
# Empty body

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8299
# Body
# {
.annotate 'line', 8301
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 8302
if_null $P1, __label_0
# {
.annotate 'line', 8303
$P1 = $P1.'optimize'()
.annotate 'line', 8304
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 8306
self.'optimize_base'()
.annotate 'line', 8307
.return(self)
# }
.annotate 'line', 8308

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8309
# Body
# {
.annotate 'line', 8311
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 8312
if_null $P1, __label_0
.annotate 'line', 8313
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 8315
self.'emit_base'(__ARG_1)
.annotate 'line', 8317
if_null $P1, __label_1
.annotate 'line', 8318
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 8319

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8233
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8235
addattribute $P0, 'parent'
.annotate 'line', 8236
addattribute $P0, 'start'
.annotate 'line', 8237
addattribute $P0, 'name'
.annotate 'line', 8238
addattribute $P0, 'modifier'
.annotate 'line', 8239
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
.param pmc __ARG_1

.annotate 'line', 8334
# Body
# {
.annotate 'line', 8336
# string nspath: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8337
setattribute self, 'nspath', $P1
.annotate 'line', 8338
setattribute self, 'unit', __ARG_1
.annotate 'line', 8339
root_new $P3, ['parrot';'Hash']
setattribute self, 'predefs_used', $P3
.annotate 'line', 8340
box $P2, 0
setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8341

.end # RootNamespace


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8342
# Body
# {
.annotate 'line', 8344
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8345
$P1[__ARG_1] = 1
# }
.annotate 'line', 8346

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 8347
# Body
# {
.annotate 'line', 8349
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8350
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 8351

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 8353
# Body
# {
.annotate 'line', 8355
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 8356
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 8357
inc $I1
.annotate 'line', 8358
assign $P1, $I1
.annotate 'line', 8359
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 8360
.return($S1)
# }
.annotate 'line', 8361

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8363
# Body
# {
.annotate 'line', 8365
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 8366
unless_null $P1, __label_0
# {
.annotate 'line', 8367
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8368
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 8370
$P1[__ARG_1] = 1
# }
.annotate 'line', 8371

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8372
# Body
# {
.annotate 'line', 8374
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 8375
unless_null $P1, __label_0
# {
.annotate 'line', 8376
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8377
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 8379
$P1[__ARG_1] = 1
# }
.annotate 'line', 8380

.end # addload


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8381
# Body
# {
.annotate 'line', 8383
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8384

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8385
# Body
# {
.annotate 'line', 8388
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8389

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8390
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8394
# Body
# {
.annotate 'line', 8396
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8397

.end # close_ns


.sub 'dowarnings' :method

.annotate 'line', 8398
# Body
# {
.annotate 'line', 8400
getattribute $P1, self, 'unit'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8401

.end # dowarnings


.sub 'optimize' :method

.annotate 'line', 8402
# Body
# {
.annotate 'line', 8404
self.'optimize_base'()
.annotate 'line', 8405
.return(self)
# }
.annotate 'line', 8406

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8407
# Body
# {
.annotate 'line', 8409
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8412
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 8413
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 8416
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
.annotate 'line', 8419
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8420
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8421
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8422
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8425
# int somelib: $I1
null $I1
.annotate 'line', 8426
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8427
if_null $P3, __label_4
# {
.annotate 'line', 8428
set $I1, 1
.annotate 'line', 8429
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8430
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8433
# int someload: $I2
null $I2
.annotate 'line', 8434
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8435
if_null $P4, __label_7
# {
.annotate 'line', 8436
set $I2, 1
.annotate 'line', 8437
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8438
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8439
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8440
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
.annotate 'line', 8442
or $I3, $I1, $I2
unless $I3 goto __label_10
.annotate 'line', 8443
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8445
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8446

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8326
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8328
addattribute $P0, 'unit'
.annotate 'line', 8329
addattribute $P0, 'predefs_used'
.annotate 'line', 8330
addattribute $P0, 'libs'
.annotate 'line', 8331
addattribute $P0, 'loads'
.annotate 'line', 8332
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable

.annotate 'line', 8460
# Body
# {
.annotate 'line', 8462
box $P3, 1
setattribute self, 'warnings', $P3
.annotate 'line', 8463
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
$P1.'RootNamespace'(self)
.annotate 'line', 8466
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8470
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8469
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8468
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8474
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8473
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8472
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8480
new $P4, [ 'StringLiteral' ]
.annotate 'line', 8481
new $P6, [ 'TokenQuoted' ]
getattribute $P7, $P2, 'file'
getattribute $P8, $P2, 'line'
# predefined string
# predefined int
set $I2, "2"
add $I1, $I2, 1
set $S1, $I1
$P6.'TokenQuoted'($P7, $P8, $S1)
set $P5, $P6
$P4.'StringLiteral'($P1, $P5)
set $P3, $P4
.annotate 'line', 8479
$P1.'createconst'('__STAGE__', 'S', $P3, '')
.annotate 'line', 8484
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8485

.end # init


.sub 'setwarnmode' :method
.param int __ARG_1

.annotate 'line', 8486
# Body
# {
.annotate 'line', 8488
getattribute $P1, self, 'warnings'
assign $P1, __ARG_1
# }
.annotate 'line', 8489

.end # setwarnmode


.sub 'dowarnings' :method

.annotate 'line', 8490
# Body
# {
# predefined int
.annotate 'line', 8492
getattribute $P1, self, 'warnings'
set $I1, $P1
.return($I1)
# }
.annotate 'line', 8493

.end # dowarnings


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8494
# Body
# {
.annotate 'line', 8496
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8497

.end # parse


.sub 'optimize' :method

.annotate 'line', 8498
# Body
# {
.annotate 'line', 8500
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8501

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8502
# Body
# {
.annotate 'line', 8504
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8505
__ARG_1.'say'('')
.annotate 'line', 8507
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8509
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8510

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 8457
addattribute $P0, 'rootns'
.annotate 'line', 8458
addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8517
# Body
# {
.annotate 'line', 8522
unless_null __ARG_2, __label_0
.annotate 'line', 8523
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8524
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8525
$P1.'open'('__eval__', 'w')
.annotate 'line', 8526
$P1.'puts'(__ARG_1)
.annotate 'line', 8527
$P1.'close'()
.annotate 'line', 8528
$P1.'open'('__eval__', 'r')
.annotate 'line', 8529
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8530
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8531
unless __ARG_4 goto __label_1
.annotate 'line', 8532
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 8533
$P3.'parse'($P2)
.annotate 'line', 8534
$P1.'close'()
.annotate 'line', 8535
$P3.'optimize'()
.annotate 'line', 8536
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8537
$P4.'open'('__eval__', 'w')
.annotate 'line', 8538
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8539
unless __ARG_3 goto __label_2
.annotate 'line', 8540
$P5.'disable_annotations'()
__label_2: # endif
.annotate 'line', 8541
$P5.'initialize'($P4)
.annotate 'line', 8542
$P3.'emit'($P5)
.annotate 'line', 8543
$P5.'close'()
.annotate 'line', 8544
$P4.'close'()
.annotate 'line', 8545
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_3
set $S1, $P8
__label_3:
.annotate 'line', 8546
# var object: $P6
null $P6
.annotate 'line', 8547
set $S2, __ARG_2
set $S3, 'pir'
if $S2 == $S3 goto __label_6
set $S3, 'pbc'
if $S2 == $S3 goto __label_7
set $S3, ''
if $S2 == $S3 goto __label_8
goto __label_5
# switch
__label_6: # case
.annotate 'line', 8549
new $P6, [ 'String' ]
.annotate 'line', 8550
assign $P6, $S1
goto __label_4 # break
__label_7: # case
__label_8: # case
.annotate 'line', 8554
# var pircomp: $P7
# predefined compreg
compreg $P7, 'PIR'
.annotate 'line', 8555
$P6 = $P7($S1)
goto __label_4 # break
__label_5: # default
.annotate 'line', 8556
# predefined die
.annotate 'line', 8558
die 'Invalid target'
__label_4: # switch end
.annotate 'line', 8560
.return($P6)
# }
.annotate 'line', 8561

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8562
# Body
# {
.annotate 'line', 8566
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8567
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8568
$P1.'encoding'('utf8')
.annotate 'line', 8569
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8570
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8571
unless __ARG_4 goto __label_0
.annotate 'line', 8572
$P3.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8573
$P3.'parse'($P2)
.annotate 'line', 8574
$P1.'close'()
.annotate 'line', 8575
$P3.'optimize'()
.annotate 'line', 8576
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8577
unless __ARG_3 goto __label_1
.annotate 'line', 8578
$P4.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8579
$P4.'initialize'(__ARG_2)
.annotate 'line', 8580
$P3.'emit'($P4)
.annotate 'line', 8581
$P4.'close'()
# }
.annotate 'line', 8582

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1
.param int __ARG_2 :optional :named('noan')
.param int __ARG_3 :optional :named('nowarn')

.annotate 'line', 8583
# Body
# {
.annotate 'line', 8587
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8588
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8589
$P1.'encoding'('utf8')
.annotate 'line', 8590
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8591
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8592
unless __ARG_3 goto __label_0
.annotate 'line', 8593
$P3.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8594
$P3.'parse'($P2)
.annotate 'line', 8595
$P1.'close'()
.annotate 'line', 8596
$P3.'optimize'()
.annotate 'line', 8597
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8598
$P4.'open'('__eval__', 'w')
.annotate 'line', 8599
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8600
unless __ARG_2 goto __label_1
.annotate 'line', 8601
$P5.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8602
$P5.'initialize'($P4)
.annotate 'line', 8603
$P3.'emit'($P5)
.annotate 'line', 8604
$P5.'close'()
.annotate 'line', 8605
$P4.'close'()
.annotate 'line', 8606
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_2
set $S1, $P8
__label_2:
.annotate 'line', 8607
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 8608
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 8609
.return($P7)
# }
.annotate 'line', 8610

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3
.param int __ARG_4

.annotate 'line', 8615
# Body
# {
.annotate 'line', 8617
# var winxed: $P1
new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 8618
not $I1, __ARG_3
unless $I1 goto __label_0
.annotate 'line', 8619
$P1.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8620
$P1.'parse'(__ARG_1)
.annotate 'line', 8622
$P1.'optimize'()
.annotate 'line', 8624
# var handle: $P2
null $P2
.annotate 'line', 8625
ne __ARG_2, '-', __label_1
.annotate 'line', 8626
# pirop getstdout
getstdout $P2
goto __label_2
__label_1: # else
.annotate 'line', 8628
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_2: # endif
.annotate 'line', 8629
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8630
unless __ARG_4 goto __label_3
.annotate 'line', 8631
$P3.'disable_annotations'()
__label_3: # endif
.annotate 'line', 8632
$P3.'initialize'($P2)
.annotate 'line', 8633
$P1.'emit'($P3)
.annotate 'line', 8634
$P3.'close'()
.annotate 'line', 8635
$P2.'close'()
# }
.annotate 'line', 8636

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8642
# Body
# {
.annotate 'line', 8644
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 8645
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 8646

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
.param pmc __ARG_1

.annotate 'line', 8653
# Body
# {
.annotate 'line', 8655
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8656
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8657
$P1.'notOptStop'(1)
.annotate 'line', 8658
$P1.'push_string'('o=s')
.annotate 'line', 8659
$P1.'push_string'('e=s')
.annotate 'line', 8660
$P1.'push_string'('noan')
.annotate 'line', 8661
$P1.'push_string'('nowarn')
.annotate 'line', 8662
$P1.'notOptStop'(1)
.annotate 'line', 8663
__ARG_1.'shift'()
.annotate 'line', 8664
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8665
setattribute self, 'getopts', $P1
.annotate 'line', 8666
setattribute self, 'opts', $P2
# }
.annotate 'line', 8667

.end # Options


.sub 'getbool' :method
.param string __ARG_1

.annotate 'line', 8668
# Body
# {
.annotate 'line', 8670
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 8671
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 8672
isnull $I1, $P2
not $I1
.return($I1)
# }
.annotate 'line', 8673

.end # getbool


.sub 'getstring' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 8674
# Body
# {
.annotate 'line', 8676
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 8677
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 8678
if_null $P2, __label_1
# predefined string
set $S1, $P2
goto __label_0
__label_1:
set $S1, __ARG_2
__label_0:
.return($S1)
# }
.annotate 'line', 8679

.end # getstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Options' ]
.annotate 'line', 8650
addattribute $P0, 'getopts'
.annotate 'line', 8651
addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8682
# Body
# {
.annotate 'line', 8684
# var options: $P1
new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1)
.annotate 'line', 8685
# string outputfile: $S1
$P4 = $P1.'getstring'('o', '')
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 8686
# string expr: $S2
$P4 = $P1.'getstring'('e')
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 8687
# int noan: $I1
$P4 = $P1.'getbool'('noan')
set $I1, $P4
.annotate 'line', 8688
# int warn: $I2
$P4 = $P1.'getbool'('nowarn')
isfalse $I2, $P4
.annotate 'line', 8690
# int argc: $I3
set $P4, __ARG_1
set $I3, $P4
.annotate 'line', 8691
# string filename: $S3
null $S3
.annotate 'line', 8692
# var file: $P2
null $P2
.annotate 'line', 8693
unless_null $S2, __label_2
# {
.annotate 'line', 8694
ne $I3, 0, __label_4
# predefined Error
.annotate 'line', 8695
root_new $P4, ['parrot';'Exception']
$P4['message'] = 'No file'
throw $P4
__label_4: # endif
.annotate 'line', 8697
$S3 = __ARG_1[0]
.annotate 'line', 8698
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'($S3)
.annotate 'line', 8699
$P2.'encoding'('utf8')
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 8702
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 8703
new $P2, [ 'StringHandle' ]
.annotate 'line', 8704
$P2.'open'('__eval__', 'w')
.annotate 'line', 8705
$P2.'puts'($S2)
.annotate 'line', 8706
$P2.'close'()
.annotate 'line', 8707
$P2.'open'('__eval__')
.annotate 'line', 8708
set $S3, '__eval__'
# }
__label_3: # endif
.annotate 'line', 8711
# var t: $P3
new $P3, [ 'Tokenizer' ]
$P3.'Tokenizer'($P2, $S3)
.annotate 'line', 8713
'winxed_parser'($P3, $S1, $I2, $I1)
.annotate 'line', 8715
$P2.'close'()
# }
.annotate 'line', 8716

.end # stage1


.sub 'show_backtrace'
.param pmc __ARG_1

.annotate 'line', 8718
# Body
# {
.annotate 'line', 8720
# int i: $I1
set $I1, 1
.annotate 'line', 8721
iter $P4, __ARG_1
set $P4, 0
__label_0: # for iteration
unless $P4 goto __label_1
shift $P1, $P4
# {
.annotate 'line', 8722
# var sub: $P2
$P2 = $P1['sub']
.annotate 'line', 8723
# string subname: $S1
null $S1
.annotate 'line', 8724
if_null $P2, __label_2
# {
.annotate 'line', 8725
set $S1, $P2
.annotate 'line', 8726
# string ns: $S2
$P5 = $P2.'get_namespace'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 8727
isne $I3, $S2, ''
unless $I3 goto __label_5
isne $I3, $S2, 'parrot'
__label_5:
unless $I3 goto __label_4
concat $S0, $S2, '.'
concat $S0, $S0, $S1
set $S1, $S0
__label_4: # endif
# }
__label_2: # endif
.annotate 'line', 8729
# var ann: $P3
$P3 = $P1['annotations']
.annotate 'line', 8730
# string file: $S3
$S3 = $P3['file']
.annotate 'line', 8731
eq $S3, '', __label_6
# {
.annotate 'line', 8732
# int line: $I2
$I2 = $P3['line']
.annotate 'line', 8733
set $I4, $I1
inc $I1
mul $I3, 2, $I4
repeat $S4, ' ', $I3
# predefined cry
getstderr $P0
print $P0, $S4
print $P0, "at "
print $P0, $S1
print $P0, " in '"
print $P0, $S3
print $P0, "' line "
print $P0, $I2
print $P0, "\n"
# }
__label_6: # endif
# }
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 8736

.end # show_backtrace


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8738
# Body
# {
.annotate 'line', 8740
# int retval: $I1
null $I1
.annotate 'line', 8741
# try: create handler
new $P2, 'ExceptionHandler'
set_label $P2, __label_0
$P2.'min_severity'(2)
$P2.'max_severity'(2)
$P2.'handle_types'(555, 556, 557)
push_eh $P2
# try: begin
.annotate 'line', 8747
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 8741
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8750
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 8751
# int type: $I2
$I2 = $P1['type']
.annotate 'line', 8752
set $I3, $I2
set $I4, 556
if $I3 == $I4 goto __label_4
set $I4, 557
if $I3 == $I4 goto __label_5
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 8755
# predefined cry
getstderr $P0
print $P0, 'Error: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 8756
set $I1, 1
goto __label_2 # break
__label_3: # default
.annotate 'line', 8759
# predefined cry
getstderr $P0
print $P0, 'INTERNAL ERROR: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 8760
$P2 = $P1.'backtrace'()
'show_backtrace'($P2)
.annotate 'line', 8761
set $I1, 2
__label_2: # switch end
# }
# catch end
__label_1:
.annotate 'line', 8764
# predefined exit
exit $I1
# }
.annotate 'line', 8765

.end # main

# End generated code
