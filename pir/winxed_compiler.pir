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
# predefined getstderr
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
$P1 = __ARG_2.'show'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 71
concat $S0, __ARG_1, ' near '
concat $S0, $S0, $S1
set __ARG_1, $S0
# }
__label_0: # endif
.annotate 'line', 73
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = __ARG_1
$P1['severity'] = 2
$P1['type'] = 555
throw $P1
# }
.annotate 'line', 74

.end # InternalError


.sub 'TokenError'
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 76
# Body
# {
.annotate 'line', 78
# predefined string
getattribute $P2, __ARG_2, 'filename'
set $S1, $P2
# predefined string
set $S2, __ARG_3
concat $S3, __ARG_1, ' in '
concat $S3, $S3, $S1
concat $S3, $S3, ' line '
concat $S3, $S3, $S2
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = $S3
$P1['severity'] = 2
$P1['type'] = 556
throw $P1
# }
.annotate 'line', 80

.end # TokenError


.sub 'SyntaxError'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 82
# Body
# {
.annotate 'line', 84
# string sline: $S1
getattribute $P1, __ARG_2, 'line'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 85
# string file: $S2
getattribute $P1, __ARG_2, 'file'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 86
# string desc: $S3
$P1 = __ARG_2.'viewable'()
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 87
concat $S4, __ARG_1, ' in '
concat $S4, $S4, $S2
concat $S4, $S4, ' line '
concat $S4, $S4, $S1
concat $S4, $S4, ' near '
concat $S4, $S4, $S3
# predefined Error
root_new $P1, ['parrot';'Exception']
$P1['message'] = $S4
$P1['severity'] = 2
$P1['type'] = 557
throw $P1
# }
.annotate 'line', 89

.end # SyntaxError


.sub 'Expected'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 91
# Body
# {
.annotate 'line', 93
concat $S1, "Expected ", __ARG_1
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 94

.end # Expected


.sub 'ExpectedIdentifier'
.param pmc __ARG_1

.annotate 'line', 96
# Body
# {
.annotate 'line', 98
'SyntaxError'("Expected identifier", __ARG_1)
# }
.annotate 'line', 99

.end # ExpectedIdentifier


.sub 'ExpectedOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 101
# Body
# {
.annotate 'line', 103
concat $S1, "Expected '", __ARG_1
concat $S1, $S1, "'"
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 104

.end # ExpectedOp


.sub 'RequireOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 106
# Body
# {
.annotate 'line', 108
$P1 = __ARG_2.'isop'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 109
'ExpectedOp'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 110

.end # RequireOp


.sub 'RequireKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 112
# Body
# {
.annotate 'line', 114
$P1 = __ARG_2.'iskeyword'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 115
'ExpectedOp'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 116

.end # RequireKeyword


.sub 'RequireIdentifier'
.param pmc __ARG_1

.annotate 'line', 118
# Body
# {
.annotate 'line', 120
$P1 = __ARG_1.'isidentifier'()
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 121
'ExpectedIdentifier'(__ARG_1)
__label_0: # endif
# }
.annotate 'line', 122

.end # RequireIdentifier


.sub 'ExpectOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 124
# Body
# {
.annotate 'line', 126
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 127
'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 128

.end # ExpectOp


.sub 'ExpectKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 130
# Body
# {
.annotate 'line', 132
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 133
'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 134

.end # ExpectKeyword

.namespace [ 'Token' ]

.sub 'Token' :method
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 144
# Body
# {
.annotate 'line', 146
box $P1, __ARG_1
setattribute self, 'file', $P1
.annotate 'line', 147
box $P1, __ARG_2
setattribute self, 'line', $P1
# }
.annotate 'line', 148

.end # Token


.sub 'get_bool' :method :vtable

.annotate 'line', 149
# Body
# {
.annotate 'line', 151
.return(1)
# }
.annotate 'line', 152

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 153
# Body
# {
.annotate 'line', 155
.return(1)
# }
.annotate 'line', 156

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 158
# Body
# {
.return(0)
# }

.end # iseof


.sub 'iscomment' :method

.annotate 'line', 159
# Body
# {
.return(0)
# }

.end # iscomment


.sub 'isidentifier' :method

.annotate 'line', 160
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isint' :method

.annotate 'line', 161
# Body
# {
.return(0)
# }

.end # isint


.sub 'isfloat' :method

.annotate 'line', 162
# Body
# {
.return(0)
# }

.end # isfloat


.sub 'isstring' :method

.annotate 'line', 163
# Body
# {
.return(0)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 165
# Body
# {
.annotate 'line', 167
'InternalError'('Not a literal string', self)
# }
.annotate 'line', 168

.end # rawstring


.sub 'getidentifier' :method

.annotate 'line', 169
# Body
# {
.annotate 'line', 171
'ExpectedIdentifier'(self)
# }
.annotate 'line', 172

.end # getidentifier


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 173
# Body
# {
.return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method

.annotate 'line', 174
# Body
# {
.return(0)
# }

.end # checkkeyword


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 175
# Body
# {
.return(0)
# }

.end # isop


.sub 'checkop' :method

.annotate 'line', 176
# Body
# {
.return('')
# }

.end # checkop


.sub 'viewable' :method

.annotate 'line', 177
# Body
# {
.return('(unknown)')
# }

.end # viewable


.sub 'show' :method

.annotate 'line', 178
# Body
# {
.annotate 'line', 180
# string r: $S1
$P1 = self.'viewable'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 181
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
.annotate 'line', 182

.end # show

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Token' ]
.annotate 'line', 142
addattribute $P0, 'file'
.annotate 'line', 143
addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
.param string __ARG_1

.annotate 'line', 187
# Body
# {
.annotate 'line', 189
self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 190

.end # TokenEof


.sub 'get_bool' :method :vtable

.annotate 'line', 191
# Body
# {
.annotate 'line', 193
.return(0)
# }
.annotate 'line', 194

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 195
# Body
# {
.annotate 'line', 197
.return(0)
# }
.annotate 'line', 198

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 199
# Body
# {
.return(1)
# }

.end # iseof


.sub 'viewable' :method

.annotate 'line', 200
# Body
# {
.return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenEof' ]
.annotate 'line', 185
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 206
# Body
# {
.annotate 'line', 208
self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 209
box $P1, __ARG_3
setattribute self, 'str', $P1
# }
.annotate 'line', 210

.end # TokenWithVal


.sub 'get_string' :method :vtable

.annotate 'line', 211
# Body
# {
getattribute $P1, self, 'str'
.return($P1)
# }

.end # get_string


.sub 'viewable' :method

.annotate 'line', 212
# Body
# {
.annotate 'line', 214
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 215

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 203
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.annotate 'line', 205
addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 220
# Body
# {
.annotate 'line', 222
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 223

.end # TokenComment


.sub 'iscomment' :method

.annotate 'line', 224
# Body
# {
.return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenComment' ]
.annotate 'line', 218
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 229
# Body
# {
.annotate 'line', 231
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 232

.end # TokenOp


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 233
# Body
# {
.annotate 'line', 235
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 236

.end # isop


.sub 'checkop' :method

.annotate 'line', 237
# Body
# {
# predefined string
.annotate 'line', 239
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 240

.end # checkop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenOp' ]
.annotate 'line', 227
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 245
# Body
# {
.annotate 'line', 247
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 248

.end # TokenIdentifier


.sub 'isidentifier' :method

.annotate 'line', 249
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method

.annotate 'line', 250
# Body
# {
.annotate 'line', 252
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 253

.end # getidentifier


.sub 'checkkeyword' :method

.annotate 'line', 254
# Body
# {
# predefined string
.annotate 'line', 256
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 257

.end # checkkeyword


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 258
# Body
# {
.annotate 'line', 260
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 261

.end # iskeyword

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 243
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method

.annotate 'line', 266
# Body
# {
.return(1)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 267
# Body
# {
.annotate 'line', 269
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 270

.end # rawstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenString' ]
.annotate 'line', 264
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 275
# Body
# {
.annotate 'line', 277
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 278

.end # TokenQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 279
# Body
# {
# predefined string
.annotate 'line', 281
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, $S2, '"'
.return($S2)
# }
.annotate 'line', 282

.end # get_string


.sub 'viewable' :method

.annotate 'line', 283
# Body
# {
# predefined string
.annotate 'line', 285
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, $S2, '"'
.return($S2)
# }
.annotate 'line', 286

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 273
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 291
# Body
# {
.annotate 'line', 293
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 294

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 295
# Body
# {
# predefined string
.annotate 'line', 297
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, $S2, "'"
.return($S2)
# }
.annotate 'line', 298

.end # get_string


.sub 'viewable' :method

.annotate 'line', 299
# Body
# {
# predefined string
.annotate 'line', 301
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, $S2, "'"
.return($S2)
# }
.annotate 'line', 302

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 289
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 307
# Body
# {
.annotate 'line', 309
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 310

.end # TokenInteger


.sub 'isint' :method

.annotate 'line', 311
# Body
# {
.return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 305
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 316
# Body
# {
.annotate 'line', 318
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 319

.end # TokenFloat


.sub 'isfloat' :method

.annotate 'line', 320
# Body
# {
.return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 314
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 328
# Body
# {
.annotate 'line', 330
# string s: $S1
set $S1, ''
.annotate 'line', 331
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 332
eq $S2, '"', __label_1
# {
.annotate 'line', 333
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 334
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 336
ne $S2, '\', __label_5
# {
.annotate 'line', 337
# string c2: $S3
$P1 = __ARG_1.'getchar'()
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 338
iseq $I1, $S3, ''
if $I1 goto __label_9
iseq $I1, $S3, "\n"
__label_9:
unless $I1 goto __label_8
.annotate 'line', 339
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_8: # endif
.annotate 'line', 340
concat $S1, $S1, $S2
concat $S1, $S1, $S3
# }
goto __label_6
__label_5: # else
.annotate 'line', 343
concat $S1, $S1, $S2
__label_6: # endif
.annotate 'line', 344
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 346
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenQuoted'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 347

.end # getquoted


.sub 'getsinglequoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 349
# Body
# {
.annotate 'line', 351
# string s: $S1
set $S1, ''
.annotate 'line', 352
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 353
eq $S2, "'", __label_1
# {
.annotate 'line', 354
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 355
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 356
concat $S1, $S1, $S2
.annotate 'line', 357
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 359
new $P2, [ 'TokenSingleQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 360

.end # getsinglequoted


.sub 'getheredoc'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 362
# Body
# {
.annotate 'line', 364
# string mark: $S1
set $S1, ''
.annotate 'line', 365
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 366
isne $I1, $S2, "\n"
unless $I1 goto __label_3
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 369
iseq $I2, $S2, '"'
if $I2 goto __label_5
iseq $I2, $S2, '\'
__label_5:
unless $I2 goto __label_4
.annotate 'line', 370
concat $S0, '\', $S2
set $S2, $S0
__label_4: # endif
.annotate 'line', 371
concat $S0, $S1, $S2
set $S1, $S0
.annotate 'line', 372
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 374
ne $S2, '', __label_6
.annotate 'line', 375
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_6: # endif
.annotate 'line', 376
concat $S0, $S1, ':>>'
set $S1, $S0
.annotate 'line', 378
# string content: $S3
set $S3, ''
.annotate 'line', 379
# string line: $S4
null $S4
__label_7: # do
.annotate 'line', 380
# {
.annotate 'line', 381
set $S4, ''
.annotate 'line', 382
$P1 = __ARG_1.'getchar'()
set $S2, $P1
__label_11: # while
.annotate 'line', 383
isne $I1, $S2, "\n"
unless $I1 goto __label_12
isne $I1, $S2, ''
__label_12:
unless $I1 goto __label_10
# {
.annotate 'line', 384
iseq $I2, $S2, '"'
if $I2 goto __label_14
iseq $I2, $S2, '\'
__label_14:
unless $I2 goto __label_13
.annotate 'line', 385
concat $S0, '\', $S2
set $S2, $S0
__label_13: # endif
.annotate 'line', 386
concat $S4, $S4, $S2
.annotate 'line', 387
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_11
__label_10: # endwhile
.annotate 'line', 389
ne $S2, '', __label_15
.annotate 'line', 390
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_15: # endif
.annotate 'line', 391
eq $S4, $S1, __label_16
.annotate 'line', 392
concat $S3, $S3, $S4
concat $S3, $S3, '\n'
__label_16: # endif
# }
__label_9: # continue
.annotate 'line', 393
ne $S4, $S1, __label_7
__label_8: # enddo
.annotate 'line', 394
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenQuoted'($P3, __ARG_3, $S3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 395

.end # getheredoc


.sub 'getident'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 397
# Body
# {
.annotate 'line', 399
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 400
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 401
$P1 = 'isident'($S2)
if_null $P1, __label_1
unless $P1 goto __label_1
# {
.annotate 'line', 402
concat $S1, $S1, $S2
.annotate 'line', 403
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 405
__ARG_1.'ungetchar'($S2)
.annotate 'line', 406
new $P2, [ 'TokenIdentifier' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenIdentifier'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 407

.end # getident


.sub 'getnumber'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 409
# Body
# {
.annotate 'line', 411
# string s: $S1
null $S1
.annotate 'line', 412
# string c: $S2
set $S2, __ARG_2
__label_0: # do
.annotate 'line', 413
# {
.annotate 'line', 414
concat $S1, $S1, $S2
.annotate 'line', 415
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_2: # continue
.annotate 'line', 416
$P1 = 'isdigit'($S2)
if_null $P1, __label_1
if $P1 goto __label_0
__label_1: # enddo
.annotate 'line', 417
iseq $I3, $S1, '0'
unless $I3 goto __label_4
iseq $I3, $S2, 'x'
if $I3 goto __label_5
iseq $I3, $S2, 'X'
__label_5:
__label_4:
unless $I3 goto __label_3
# {
.annotate 'line', 418
# int hexval: $I1
null $I1
# int h: $I2
null $I2
.annotate 'line', 419
$P1 = __ARG_1.'getchar'()
set $S2, $P1
__label_7: # while
.annotate 'line', 420
$P1 = 'hexdigit'($S2)
set $I2, $P1
lt $I2, 0, __label_6
# {
.annotate 'line', 421
mul $I3, $I1, 16
add $I1, $I3, $I2
.annotate 'line', 422
concat $S1, $S1, $S2
.annotate 'line', 423
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_7
__label_6: # endwhile
.annotate 'line', 425
__ARG_1.'ungetchar'($S2)
.annotate 'line', 426
set $S1, $I1
.annotate 'line', 427
new $P2, [ 'TokenInteger' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenInteger'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
__label_3: # endif
.annotate 'line', 429
ne $S2, '.', __label_8
# {
__label_10: # do
.annotate 'line', 430
# {
.annotate 'line', 431
concat $S1, $S1, $S2
.annotate 'line', 432
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_12: # continue
.annotate 'line', 433
$P1 = 'isdigit'($S2)
if_null $P1, __label_11
if $P1 goto __label_10
__label_11: # enddo
.annotate 'line', 434
iseq $I3, $S2, 'e'
if $I3 goto __label_14
iseq $I3, $S2, 'E'
__label_14:
unless $I3 goto __label_13
# {
.annotate 'line', 435
concat $S1, $S1, 'E'
.annotate 'line', 436
$P1 = __ARG_1.'getchar'()
set $S2, $P1
iseq $I3, $S2, '+'
if $I3 goto __label_16
iseq $I3, $S2, '-'
__label_16:
unless $I3 goto __label_15
# {
.annotate 'line', 437
concat $S1, $S1, $S2
.annotate 'line', 438
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_15: # endif
__label_18: # while
.annotate 'line', 440
$P1 = 'isdigit'($S2)
if_null $P1, __label_17
unless $P1 goto __label_17
# {
.annotate 'line', 441
concat $S1, $S1, $S2
.annotate 'line', 442
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_18
__label_17: # endwhile
# }
__label_13: # endif
.annotate 'line', 445
__ARG_1.'ungetchar'($S2)
.annotate 'line', 446
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenFloat'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 449
iseq $I3, $S2, 'e'
if $I3 goto __label_21
iseq $I3, $S2, 'E'
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 450
concat $S1, $S1, 'E'
.annotate 'line', 451
$P1 = __ARG_1.'getchar'()
set $S2, $P1
iseq $I3, $S2, '+'
if $I3 goto __label_23
iseq $I3, $S2, '-'
__label_23:
unless $I3 goto __label_22
# {
.annotate 'line', 452
concat $S1, $S1, $S2
.annotate 'line', 453
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_22: # endif
__label_25: # while
.annotate 'line', 455
$P1 = 'isdigit'($S2)
if_null $P1, __label_24
unless $P1 goto __label_24
# {
.annotate 'line', 456
concat $S1, $S1, $S2
.annotate 'line', 457
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_25
__label_24: # endwhile
.annotate 'line', 459
__ARG_1.'ungetchar'($S2)
.annotate 'line', 460
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenFloat'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 463
__ARG_1.'ungetchar'($S2)
.annotate 'line', 464
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
.annotate 'line', 467

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 469
# Body
# {
.annotate 'line', 471
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 472
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 473
isne $I1, $S2, ''
unless $I1 goto __label_3
isne $I1, $S2, "\n"
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 474
concat $S1, $S1, $S2
.annotate 'line', 475
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 477
new $P2, [ 'TokenComment' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenComment'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 478

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 480
# Body
# {
.annotate 'line', 482
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 483
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_1: # do
.annotate 'line', 484
# {
__label_5: # while
.annotate 'line', 485
isne $I1, $S2, ''
unless $I1 goto __label_6
isne $I1, $S2, '*'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 486
concat $S1, $S1, $S2
.annotate 'line', 487
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_5
__label_4: # endwhile
.annotate 'line', 489
ne $S2, '', __label_7
.annotate 'line', 490
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_7: # endif
.annotate 'line', 491
concat $S1, $S1, $S2
.annotate 'line', 492
$P1 = __ARG_1.'getchar'()
set $S2, $P1
.annotate 'line', 493
ne $S2, '', __label_8
.annotate 'line', 494
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_8: # endif
# }
__label_3: # continue
.annotate 'line', 495
ne $S2, '/', __label_1
__label_2: # enddo
.annotate 'line', 496
concat $S1, $S1, '/'
.annotate 'line', 497
new $P2, [ 'TokenComment' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenComment'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 498

.end # getcomment


.sub 'getop'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 500
# Body
# {
.annotate 'line', 502
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 503
new $P2, [ 'TokenOp' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenOp'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 504

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 518
# Body
# {
.annotate 'line', 520
.const 'Sub' $P2 = 'getop'
.annotate 'line', 522
setattribute self, 'h', __ARG_1
.annotate 'line', 523
box $P3, ''
setattribute self, 'pending', $P3
.annotate 'line', 524
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'stacked', $P4
.annotate 'line', 525
box $P3, __ARG_2
setattribute self, 'filename', $P3
.annotate 'line', 526
box $P3, 1
setattribute self, 'line', $P3
.annotate 'line', 527
# var select: $P1
root_new $P1, ['parrot';'Hash']
.annotate 'line', 528
root_new $P3, ['parrot';'Hash']
get_hll_global $P4, 'getident'
$P3[''] = $P4
$P3['{'] = $P2
$P1['$'] = $P3
get_hll_global $P5, 'getquoted'
$P1['"'] = $P5
get_hll_global $P6, 'getsinglequoted'
$P1["'"] = $P6
.annotate 'line', 531
root_new $P7, ['parrot';'Hash']
.annotate 'line', 532
root_new $P8, ['parrot';'Hash']
$P8[''] = $P2
$P8['='] = $P2
$P7['='] = $P8
$P7[':'] = $P2
$P1['='] = $P7
.annotate 'line', 535
root_new $P9, ['parrot';'Hash']
$P9['+'] = $P2
$P9['='] = $P2
$P1['+'] = $P9
.annotate 'line', 536
root_new $P10, ['parrot';'Hash']
$P10['-'] = $P2
$P10['='] = $P2
$P1['-'] = $P10
.annotate 'line', 537
root_new $P11, ['parrot';'Hash']
$P11['='] = $P2
$P1['*'] = $P11
.annotate 'line', 538
root_new $P12, ['parrot';'Hash']
$P12['|'] = $P2
$P1['|'] = $P12
.annotate 'line', 539
root_new $P13, ['parrot';'Hash']
$P13['&'] = $P2
$P1['&'] = $P13
.annotate 'line', 540
root_new $P14, ['parrot';'Hash']
.annotate 'line', 541
root_new $P15, ['parrot';'Hash']
$P15[''] = $P2
get_hll_global $P16, 'getheredoc'
$P15[':'] = $P16
$P14['<'] = $P15
$P14['='] = $P2
$P1['<'] = $P14
.annotate 'line', 544
root_new $P17, ['parrot';'Hash']
$P17['>'] = $P2
$P17['='] = $P2
$P1['>'] = $P17
.annotate 'line', 545
root_new $P18, ['parrot';'Hash']
.annotate 'line', 546
root_new $P19, ['parrot';'Hash']
$P19[''] = $P2
$P19['='] = $P2
$P18['='] = $P19
$P1['!'] = $P18
.annotate 'line', 548
root_new $P20, ['parrot';'Hash']
$P20['%'] = $P2
$P20['='] = $P2
$P1['%'] = $P20
.annotate 'line', 549
root_new $P21, ['parrot';'Hash']
$P21['='] = $P2
get_hll_global $P22, 'getlinecomment'
$P21['/'] = $P22
get_hll_global $P23, 'getcomment'
$P21['*'] = $P23
$P1['/'] = $P21
get_hll_global $P24, 'getlinecomment'
$P1['#'] = $P24
.annotate 'line', 552
setattribute self, 'select', $P1
# }
.annotate 'line', 553

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 554
# Body
# {
.annotate 'line', 556
# var pending: $P1
getattribute $P1, self, 'pending'
.annotate 'line', 557
# string c: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 558
eq $S1, '', __label_1
.annotate 'line', 559
assign $P1, ''
goto __label_2
__label_1: # else
# {
.annotate 'line', 561
# var h: $P2
getattribute $P2, self, 'h'
.annotate 'line', 562
$P3 = $P2.'read'(1)
set $S1, $P3
.annotate 'line', 563
ne $S1, "\n", __label_3
# {
.annotate 'line', 564
# int l: $I1
getattribute $P3, self, 'line'
set $I1, $P3
.annotate 'line', 565
inc $I1
.annotate 'line', 566
box $P3, $I1
setattribute self, 'line', $P3
# }
__label_3: # endif
# }
__label_2: # endif
.annotate 'line', 569
.return($S1)
# }
.annotate 'line', 570

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 571
# Body
# {
.annotate 'line', 573
getattribute $P1, self, 'pending'
assign $P1, __ARG_1
# }
.annotate 'line', 574

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 575
# Body
# {
.annotate 'line', 577
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 578
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 579
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 580
.const 'Sub' $P7 = 'getop'
.annotate 'line', 581
.const 'Sub' $P8 = 'getident'
.annotate 'line', 582
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 584
getattribute $P10, self, 'stacked'
if_null $P10, __label_0
unless $P10 goto __label_0
# {
.annotate 'line', 585
# var t: $P1
getattribute $P11, self, 'stacked'
$P1 = $P11.'pop'()
.annotate 'line', 586
.return($P1)
# }
__label_0: # endif
.annotate 'line', 588
# string c: $S1
$P10 = self.'getchar'()
null $S1
if_null $P10, __label_1
set $S1, $P10
__label_1:
__label_3: # while
.annotate 'line', 589
$P10 = $P4($S1)
if_null $P10, __label_2
unless $P10 goto __label_2
.annotate 'line', 590
$P11 = self.'getchar'()
set $S1, $P11
goto __label_3
__label_2: # endwhile
.annotate 'line', 591
# int line: $I1
getattribute $P10, self, 'line'
set $I1, $P10
.annotate 'line', 592
ne $S1, '', __label_4
.annotate 'line', 593
new $P11, [ 'TokenEof' ]
getattribute $P12, self, 'filename'
$P11.'TokenEof'($P12)
set $P10, $P11
.return($P10)
__label_4: # endif
.annotate 'line', 594
$P10 = $P5($S1)
if_null $P10, __label_5
unless $P10 goto __label_5
.annotate 'line', 595
.tailcall $P8(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 596
$P10 = $P6($S1)
if_null $P10, __label_6
unless $P10 goto __label_6
.annotate 'line', 597
.tailcall $P9(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 599
# string op: $S2
set $S2, $S1
.annotate 'line', 600
# var select: $P2
getattribute $P2, self, 'select'
.annotate 'line', 601
# var current: $P3
$P3 = $P2[$S1]
__label_8: # while
.annotate 'line', 603
isnull $I2, $P3
not $I2
unless $I2 goto __label_9
isa $I2, $P3, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 604
$P10 = self.'getchar'()
set $S1, $P10
.annotate 'line', 605
set $P2, $P3
.annotate 'line', 606
$P3 = $P2[$S1]
.annotate 'line', 607
unless_null $P3, __label_10
# {
.annotate 'line', 608
self.'ungetchar'($S1)
.annotate 'line', 609
$P3 = $P2['']
# }
goto __label_11
__label_10: # else
.annotate 'line', 612
concat $S2, $S2, $S1
__label_11: # endif
# }
goto __label_8
__label_7: # endwhile
.annotate 'line', 614
if_null $P3, __label_12
unless $P3 goto __label_12
.annotate 'line', 615
.tailcall $P3(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 616
.tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 617

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 618
# Body
# {
.annotate 'line', 620
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 621
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 622
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 623
.return($P1)
# }
.annotate 'line', 624

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 625
# Body
# {
.annotate 'line', 627
getattribute $P1, self, 'stacked'
# predefined push
push $P1, __ARG_1
# }
.annotate 'line', 628

.end # unget

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 512
addattribute $P0, 'h'
.annotate 'line', 513
addattribute $P0, 'pending'
.annotate 'line', 514
addattribute $P0, 'select'
.annotate 'line', 515
addattribute $P0, 'stacked'
.annotate 'line', 516
addattribute $P0, 'filename'
.annotate 'line', 517
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

.annotate 'line', 647
# Body
# {
.annotate 'line', 649
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
.annotate 'line', 650
.return('I')
__label_3: # case
.annotate 'line', 651
.return('N')
__label_4: # case
.annotate 'line', 652
.return('S')
__label_5: # case
.annotate 'line', 653
.return('P')
__label_1: # default
.annotate 'line', 654
.return('')
__label_0: # switch end
# }
.annotate 'line', 656

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 658
# Body
# {
.annotate 'line', 660
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
.annotate 'line', 661
.return('int')
__label_3: # case
.annotate 'line', 662
.return('num')
__label_4: # case
.annotate 'line', 663
.return('string')
__label_5: # case
.annotate 'line', 664
.return('pmc')
__label_1: # default
.annotate 'line', 665
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 667

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 682
# Body
# {
.annotate 'line', 684
setattribute self, 'handle', __ARG_1
.annotate 'line', 685
box $P1, ''
setattribute self, 'file', $P1
.annotate 'line', 686
box $P1, 0
setattribute self, 'line', $P1
.annotate 'line', 687
box $P1, 0
setattribute self, 'pendingf', $P1
.annotate 'line', 688
box $P1, 0
setattribute self, 'pendingl', $P1
# }
.annotate 'line', 689

.end # initialize


.sub 'disable_annotations' :method

.annotate 'line', 690
# Body
# {
.annotate 'line', 692
box $P1, 1
setattribute self, 'noan', $P1
# }
.annotate 'line', 693

.end # disable_annotations


.sub 'close' :method

.annotate 'line', 694
# Body
# {
.annotate 'line', 696
null $P1
setattribute self, 'handle', $P1
# }
.annotate 'line', 697

.end # close


.sub 'updateannot' :method

.annotate 'line', 698
# Body
# {
.annotate 'line', 700
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 701
getattribute $P2, self, 'handle'
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, ".annotate 'file', '"
push $P3, $P4
.annotate 'line', 703
getattribute $P5, self, 'file'
.annotate 'line', 701
push $P3, $P5
box $P4, "'\n"
push $P3, $P4
# predefined join
join $S1, "", $P3
$P2.'print'($S1)
.annotate 'line', 706
getattribute $P1, self, 'pendingf'
assign $P1, 0
# }
__label_0: # endif
.annotate 'line', 708
getattribute $P1, self, 'pendingl'
if_null $P1, __label_1
unless $P1 goto __label_1
# {
.annotate 'line', 709
getattribute $P2, self, 'handle'
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, ".annotate 'line', "
push $P3, $P4
.annotate 'line', 711
getattribute $P5, self, 'line'
.annotate 'line', 709
push $P3, $P5
box $P4, "\n"
push $P3, $P4
# predefined join
join $S1, "", $P3
$P2.'print'($S1)
.annotate 'line', 714
getattribute $P1, self, 'pendingl'
assign $P1, 0
# }
__label_1: # endif
# }
.annotate 'line', 716

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 717
# Body
# {
.annotate 'line', 719
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 720
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 721

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 722
# Body
# {
.annotate 'line', 724
self.'updateannot'()
.annotate 'line', 725
self.'vprint'(__ARG_1)
# }
.annotate 'line', 726

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 727
# Body
# {
.annotate 'line', 729
self.'updateannot'()
.annotate 'line', 730
self.'vprint'(__ARG_1)
.annotate 'line', 731
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 732

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 733
# Body
# {
.annotate 'line', 735
getattribute $P3, self, 'noan'
unless_null $P3, __label_0
# {
.annotate 'line', 737
# var file: $P1
getattribute $P1, self, 'file'
.annotate 'line', 738
# var line: $P2
getattribute $P2, self, 'line'
.annotate 'line', 739
# string tfile: $S1
getattribute $P3, __ARG_1, 'file'
null $S1
if_null $P3, __label_1
set $S1, $P3
__label_1:
.annotate 'line', 740
# int tline: $I1
getattribute $P3, __ARG_1, 'line'
set $I1, $P3
.annotate 'line', 741
set $S2, $P1
eq $S2, $S1, __label_2
# {
.annotate 'line', 742
assign $P1, $S1
.annotate 'line', 743
getattribute $P3, self, 'pendingf'
assign $P3, 1
.annotate 'line', 744
assign $P2, 0
# }
__label_2: # endif
.annotate 'line', 746
set $I2, $P2
eq $I2, $I1, __label_3
# {
.annotate 'line', 747
assign $P2, $I1
.annotate 'line', 748
getattribute $P3, self, 'pendingl'
assign $P3, 1
# }
__label_3: # endif
# }
__label_0: # endif
# }
.annotate 'line', 751

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 752
# Body
# {
.annotate 'line', 754
self.'updateannot'()
.annotate 'line', 755
getattribute $P1, self, 'handle'
concat $S1, '# ', __ARG_1
concat $S1, $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 756

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 757
# Body
# {
.annotate 'line', 759
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 760
$P1.'print'(__ARG_1)
.annotate 'line', 761
$P1.'print'(':')
.annotate 'line', 762
if_null __ARG_2, __label_0
# {
.annotate 'line', 763
concat $S1, ' # ', __ARG_2
$P1.'print'($S1)
# }
__label_0: # endif
.annotate 'line', 765
$P1.'print'("\n")
# }
.annotate 'line', 766

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 767
# Body
# {
.annotate 'line', 769
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 770
$P1.'print'('goto ')
.annotate 'line', 771
$P1.'print'(__ARG_1)
.annotate 'line', 772
if_null __ARG_2, __label_0
# {
.annotate 'line', 773
$P1.'print'(' # ')
.annotate 'line', 774
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 776
$P1.'print'("\n")
# }
.annotate 'line', 777

.end # emitgoto


.sub 'emitif' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 779
# Body
# {
.annotate 'line', 781
self.'say'('if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 782

.end # emitif


.sub 'emitunless' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 783
# Body
# {
.annotate 'line', 785
self.'say'('unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 786

.end # emitunless


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 788
# Body
# {
.annotate 'line', 790
self.'say'('if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 791

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 792
# Body
# {
.annotate 'line', 794
self.'say'("null ", __ARG_1)
# }
.annotate 'line', 795

.end # emitnull


.sub 'emitinc' :method
.param string __ARG_1

.annotate 'line', 796
# Body
# {
.annotate 'line', 798
self.'say'('inc ', __ARG_1)
# }
.annotate 'line', 799

.end # emitinc


.sub 'emitdec' :method
.param string __ARG_1

.annotate 'line', 801
# Body
# {
.annotate 'line', 803
self.'say'('dec ', __ARG_1)
# }
.annotate 'line', 804

.end # emitdec


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 805
# Body
# {
.annotate 'line', 807
self.'say'("set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 808

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 809
# Body
# {
.annotate 'line', 811
self.'say'("assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 812

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 813
# Body
# {
.annotate 'line', 815
self.'say'("box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 816

.end # emitbox


.sub 'emitunbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 817
# Body
# {
.annotate 'line', 819
self.'say'("unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 820

.end # emitunbox


.sub 'emitbinop' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 821
# Body
# {
.annotate 'line', 823
self.'say'(__ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 824

.end # emitbinop


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 825
# Body
# {
.annotate 'line', 827
self.'say'("add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 828

.end # emitaddto


.sub 'emitsubto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 829
# Body
# {
.annotate 'line', 831
self.'say'("sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 832

.end # emitsubto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 833
# Body
# {
.annotate 'line', 835
self.'say'("add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 836

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 837
# Body
# {
.annotate 'line', 839
self.'say'("mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 840

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 841
# Body
# {
.annotate 'line', 843
self.'say'("concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 844

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 845
# Body
# {
.annotate 'line', 847
self.'say'("concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 848

.end # emitconcat


.sub 'emitprint' :method
.param string __ARG_1

.annotate 'line', 849
# Body
# {
.annotate 'line', 851
self.'say'('print ', __ARG_1)
# }
.annotate 'line', 852

.end # emitprint


.sub 'emitsay' :method
.param string __ARG_1

.annotate 'line', 853
# Body
# {
.annotate 'line', 855
self.'say'('say ', __ARG_1)
# }
.annotate 'line', 856

.end # emitsay

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 675
addattribute $P0, 'handle'
.annotate 'line', 676
addattribute $P0, 'file'
.annotate 'line', 677
addattribute $P0, 'line'
.annotate 'line', 678
addattribute $P0, 'pendingf'
.annotate 'line', 679
addattribute $P0, 'pendingl'
.annotate 'line', 680
addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 863
# Body
# {
.annotate 'line', 865
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 866

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 868
# Body
# {
.annotate 'line', 870
# var t: $P1
new $P1, [ 'TokenFloat' ]
getattribute $P2, __ARG_2, 'file'
getattribute $P3, __ARG_2, 'line'
$P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 871
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 872

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 874
# Body
# {
.annotate 'line', 880
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 881
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 882
.return($I1)
# }
.annotate 'line', 883

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 904
# Body
# {
.annotate 'line', 906
# int pos: $I1
# predefined indexof
index $I1, __ARG_2, '{res}'
.annotate 'line', 907
iseq $I2, __ARG_1, 'v'
unless $I2 goto __label_1
isne $I2, $I1, -1
__label_1:
unless $I2 goto __label_0
.annotate 'line', 908
'InternalError'('void predef with {res}')
__label_0: # endif
.annotate 'line', 909
isne $I2, __ARG_1, 'v'
unless $I2 goto __label_3
iseq $I2, $I1, -1
__label_3:
unless $I2 goto __label_2
.annotate 'line', 910
'InternalError'('non void predef without {res}')
__label_2: # endif
.annotate 'line', 911
box $P1, __ARG_2
setattribute self, 'body', $P1
.annotate 'line', 912
box $P1, __ARG_1
setattribute self, 'typeresult', $P1
# }
.annotate 'line', 913

.end # Predef_frombody


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 914
# Body
# {
.annotate 'line', 916
# string body: $S1
getattribute $P1, self, 'body'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 917
# string typeresult: $S2
getattribute $P1, self, 'typeresult'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 919
# int pos: $I1
null $I1
.annotate 'line', 920
ne $S2, 'v', __label_2
# {
.annotate 'line', 921
isnull $I5, __ARG_3
not $I5
unless $I5 goto __label_5
isne $I5, __ARG_3, ''
__label_5:
unless $I5 goto __label_4
.annotate 'line', 922
'SyntaxError'('using return value from void predef')
__label_4: # endif
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 925
isnull $I5, __ARG_3
if $I5 goto __label_7
iseq $I5, __ARG_3, ''
__label_7:
unless $I5 goto __label_6
.annotate 'line', 926
'InternalError'('Bad result in non void predef')
__label_6: # endif
__label_9: # while
.annotate 'line', 927
# predefined indexof
index $I1, $S1, '{res}'
eq $I1, -1, __label_8
.annotate 'line', 928
# predefined replace
replace $S1, $S1, $I1, 5, __ARG_3
goto __label_9
__label_8: # endwhile
# }
__label_3: # endif
.annotate 'line', 931
# int n: $I2
set $P1, __ARG_4
set $I2, $P1
# for loop
.annotate 'line', 932
# int i: $I3
null $I3
__label_12: # for condition
ge $I3, $I2, __label_11
# {
.annotate 'line', 933
# string argmark: $S3
set $S6, $I3
concat $S5, '{arg', $S6
concat $S3, $S5, '}'
.annotate 'line', 934
# int l: $I4
# predefined length
length $I4, $S3
.annotate 'line', 935
# string arg: $S4
$S4 = __ARG_4[$I3]
__label_14: # while
.annotate 'line', 936
# predefined indexof
index $I1, $S1, $S3
eq $I1, -1, __label_13
.annotate 'line', 937
# predefined replace
replace $S1, $S1, $I1, $I4, $S4
goto __label_14
__label_13: # endwhile
# }
__label_10: # for iteration
.annotate 'line', 932
inc $I3
goto __label_12
__label_11: # for end
.annotate 'line', 939
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 940
__ARG_1.'say'($S1)
# }
.annotate 'line', 941

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 902
addattribute $P0, 'body'
.annotate 'line', 903
addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 956
# Body
# {
.annotate 'line', 958
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 959
.return($S1)
# }
.annotate 'line', 960

.end # name


.sub 'result' :method

.annotate 'line', 961
# Body
# {
.annotate 'line', 963
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 964

.end # result


.sub 'params' :method

.annotate 'line', 965
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 966
# Body
# {
.annotate 'line', 968
# string type: $S1
null $S1
.annotate 'line', 969
set $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
set $I2, 3
if $I1 == $I2 goto __label_5
goto __label_1
# switch
__label_2: # case
.annotate 'line', 970
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 971
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 972
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_5: # case
.annotate 'line', 973
getattribute $P4, self, 'type3'
set $S1, $P4
goto __label_0 # break
__label_1: # default
.annotate 'line', 975
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 977
.return($S1)
# }
.annotate 'line', 978

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 979
# Body
# {
.annotate 'line', 986
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 987
isa $I2, __ARG_2, 'String'
unless $I2 goto __label_0
.annotate 'line', 988
new $P3, [ 'Predef_frombody' ]
$P3.'Predef_frombody'(__ARG_3, __ARG_2)
set $P2, $P3
setattribute self, 'body', $P2
goto __label_1
__label_0: # else
.annotate 'line', 990
setattribute self, 'body', __ARG_2
__label_1: # endif
.annotate 'line', 991
box $P1, __ARG_3
setattribute self, 'typeresult', $P1
.annotate 'line', 992
# int n: $I1
null $I1
.annotate 'line', 993
if_null __ARG_4, __label_2
# {
.annotate 'line', 994
box $P1, __ARG_4
setattribute self, 'type0', $P1
.annotate 'line', 995
set $S1, __ARG_4
set $S2, '*'
if $S1 == $S2 goto __label_5
set $S2, '!'
if $S1 == $S2 goto __label_6
goto __label_4
# switch
__label_5: # case
.annotate 'line', 997
set $I1, -1
goto __label_3 # break
__label_6: # case
.annotate 'line', 1000
set $I1, -2
.annotate 'line', 1001
if_null __ARG_5, __label_7
.annotate 'line', 1002
concat $S3, "Invalid predef '", __ARG_1
concat $S3, $S3, '"'
'InternalError'($S3)
__label_7: # endif
goto __label_3 # break
__label_4: # default
.annotate 'line', 1005
set $I1, 1
.annotate 'line', 1006
if_null __ARG_5, __label_8
# {
.annotate 'line', 1007
box $P1, __ARG_5
setattribute self, 'type1', $P1
.annotate 'line', 1008
inc $I1
# }
__label_8: # endif
.annotate 'line', 1010
if_null __ARG_6, __label_9
# {
.annotate 'line', 1011
box $P1, __ARG_6
setattribute self, 'type2', $P1
.annotate 'line', 1012
inc $I1
# }
__label_9: # endif
.annotate 'line', 1014
if_null __ARG_7, __label_10
# {
.annotate 'line', 1015
box $P1, __ARG_7
setattribute self, 'type3', $P1
.annotate 'line', 1016
inc $I1
# }
__label_10: # endif
__label_3: # switch end
# }
__label_2: # endif
.annotate 'line', 1020
box $P1, $I1
setattribute self, 'nparams', $P1
.annotate 'line', 1021
.return(self)
# }
.annotate 'line', 1022

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional
.param string __ARG_8 :optional

.annotate 'line', 1023
# Body
# {
.annotate 'line', 1032
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1033
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1034
.return(self)
# }
.annotate 'line', 1035

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 1036
# Body
# {
.annotate 'line', 1038
# predefined string
getattribute $P2, self, 'name'
set $S2, $P2
concat $S3, 'predefined ', $S2
__ARG_1.'comment'($S3)
.annotate 'line', 1039
# string typeresult: $S1
getattribute $P2, self, 'typeresult'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1040
isne $I1, $S1, 'v'
unless $I1 goto __label_2
iseq $I1, __ARG_4, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1041
$P2 = __ARG_2.'tempreg'($S1)
set __ARG_4, $P2
__label_1: # endif
.annotate 'line', 1042
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 1043
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1044

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 946
addattribute $P0, 'name'
.annotate 'line', 947
addattribute $P0, 'body'
.annotate 'line', 948
addattribute $P0, 'evalfun'
.annotate 'line', 949
addattribute $P0, 'typeresult'
.annotate 'line', 950
addattribute $P0, 'type0'
.annotate 'line', 951
addattribute $P0, 'type1'
.annotate 'line', 952
addattribute $P0, 'type2'
.annotate 'line', 953
addattribute $P0, 'type3'
.annotate 'line', 954
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 1050
# Body
# {
.annotate 'line', 1052
box $P1, __ARG_1
setattribute self, 'type', $P1
# }
.annotate 'line', 1053

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1054
# Body
# {
.annotate 'line', 1056
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1057
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1058
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1059
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1060
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1061
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1062
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1064
# string arg: $S3
$P2 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 1065
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1067
ne $S3, 'null', __label_7
.annotate 'line', 1068
__ARG_1.'emitnull'(__ARG_3)
goto __label_8
__label_7: # else
.annotate 'line', 1070
__ARG_1.'emitset'(__ARG_3, $S3)
__label_8: # endif
# }
__label_4: # endif
# }
.annotate 'line', 1072

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1049
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1077
# Body
# {
.annotate 'line', 1079
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1080
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1081
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1082
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
.annotate 'line', 1083
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_2: # for iteration
.annotate 'line', 1082
inc $I2
goto __label_4
__label_3: # for end
.annotate 'line', 1084
$P1 = __ARG_4[$I1]
__ARG_1.'emitsay'($P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1087
__ARG_1.'emitsay'("''")
__label_1: # endif
# }
.annotate 'line', 1088

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

.annotate 'line', 1093
# Body
# {
.annotate 'line', 1095
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1096
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1097
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1098
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1099
$P1 = __ARG_4[$I2]
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1098
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1100
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1101

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

.annotate 'line', 1106
# Body
# {
.annotate 'line', 1108
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1109
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1110
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1111
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_0: # for iteration
.annotate 'line', 1110
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1112

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length' :subid('WSubId_1')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1115
# Body
# {
.annotate 'line', 1117
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1118
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1119
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1120

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1122
# Body
# {
.annotate 'line', 1124
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1125
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1126
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1127

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1129
# Body
# {
.annotate 'line', 1131
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1132
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1133
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1134

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1136
# Body
# {
.annotate 'line', 1138
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1139
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1140
# var argn: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1141
# int n: $I1
getattribute $P3, $P2, 'numval'
set $I1, $P3
.annotate 'line', 1142
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1143

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1145
# Body
# {
.annotate 'line', 1147
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1149
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1150
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1152
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1153
new $P4, [ 'StringLiteral' ]
$P4.'StringLiteral'(__ARG_1, $P2)
set $P3, $P4
.return($P3)
# }
.annotate 'line', 1154

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1156
# Body
# {
.annotate 'line', 1158
# var argstr: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1159
# var argpos: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1160
# string str: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1161
# int pos: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1163
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1
$P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1164
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1165

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1167
# Body
# {
.annotate 'line', 1169
# var argstr: $P1
$P5 = __ARG_3[0]
getattribute $P1, $P5, 'arg'
.annotate 'line', 1170
# var argpos: $P2
$P5 = __ARG_3[1]
getattribute $P2, $P5, 'arg'
.annotate 'line', 1171
# var arglen: $P3
$P5 = __ARG_3[2]
getattribute $P3, $P5, 'arg'
.annotate 'line', 1172
# string str: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1173
# int pos: $I1
getattribute $P5, $P2, 'numval'
set $I1, $P5
.annotate 'line', 1174
# int len: $I2
getattribute $P5, $P3, 'numval'
set $I2, $P5
.annotate 'line', 1176
# var t: $P4
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1177
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_1, $P4)
set $P5, $P6
.return($P5)
# }
.annotate 'line', 1178

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1180
# Body
# {
.annotate 'line', 1182
# var argstrfrom: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1183
# var argstrsearch: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1184
# string strfrom: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1185
# string strsearch: $S2
$P3 = $P2.'get_value'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 1186
# predefined indexof
index $I1, $S1, $S2
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1187

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1189
# Body
# {
.annotate 'line', 1191
# var argstrfrom: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1192
# var argstrsearch: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1193
# var argpos: $P3
$P4 = __ARG_3[2]
getattribute $P3, $P4, 'arg'
.annotate 'line', 1194
# string strfrom: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1195
# string strsearch: $S2
$P4 = $P2.'get_value'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 1196
# int pos: $I1
getattribute $P4, $P3, 'numval'
set $I1, $P4
.annotate 'line', 1197
# predefined indexof
index $I2, $S1, $S2, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1198

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1200
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
.annotate 'line', 1212
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1213
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1214
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('I')
set $P14, $P15
.annotate 'line', 1213
$P12 = $P13.'set'('int', $P14, 'I', '!')
.annotate 'line', 1212
push $P1, $P12
.annotate 'line', 1217
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1218
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('N')
set $P18, $P19
.annotate 'line', 1217
$P16 = $P17.'set'('float', $P18, 'N', '!')
.annotate 'line', 1212
push $P1, $P16
.annotate 'line', 1221
new $P21, [ 'PredefFunction' ]
.annotate 'line', 1222
new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('S')
set $P22, $P23
.annotate 'line', 1221
$P20 = $P21.'set'('string', $P22, 'S', '!')
.annotate 'line', 1212
push $P1, $P20
.annotate 'line', 1225
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1212
push $P1, $P24
.annotate 'line', 1229
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1212
push $P1, $P26
.annotate 'line', 1233
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('time', 'time {res}', 'I')
.annotate 'line', 1212
push $P1, $P28
.annotate 'line', 1237
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1212
push $P1, $P30
.annotate 'line', 1241
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1212
push $P1, $P32
.annotate 'line', 1245
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('getstdin', 'getstdin {res}', 'P')
.annotate 'line', 1212
push $P1, $P34
.annotate 'line', 1249
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('getstdout', 'getstdout {res}', 'P')
.annotate 'line', 1212
push $P1, $P36
.annotate 'line', 1253
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('getstderr', 'getstderr {res}', 'P')
.annotate 'line', 1212
push $P1, $P38
.annotate 'line', 1257
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1212
push $P1, $P40
.annotate 'line', 1262
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1212
push $P1, $P42
.annotate 'line', 1267
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1212
push $P1, $P44
.annotate 'line', 1272
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1212
push $P1, $P46
.annotate 'line', 1278
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1212
push $P1, $P48
.annotate 'line', 1285
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1212
push $P1, $P50
.annotate 'line', 1289
new $P53, [ 'PredefFunction' ]
.annotate 'line', 1289
$P52 = $P53.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1212
push $P1, $P52
.annotate 'line', 1294
new $P55, [ 'PredefFunction' ]
.annotate 'line', 1294
$P54 = $P55.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1212
push $P1, $P54
.annotate 'line', 1299
new $P57, [ 'PredefFunction' ]
.annotate 'line', 1299
$P56 = $P57.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1212
push $P1, $P56
.annotate 'line', 1306
new $P59, [ 'PredefFunction' ]
.annotate 'line', 1306
$P58 = $P59.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1212
push $P1, $P58
.annotate 'line', 1311
new $P61, [ 'PredefFunction' ]
.annotate 'line', 1311
$P60 = $P61.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1212
push $P1, $P60
.annotate 'line', 1316
new $P63, [ 'PredefFunction' ]
.annotate 'line', 1316
$P62 = $P63.'set_eval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1212
push $P1, $P62
.annotate 'line', 1321
new $P65, [ 'PredefFunction' ]
.annotate 'line', 1321
$P64 = $P65.'set_eval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1212
push $P1, $P64
.annotate 'line', 1326
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('replace', 'replace {res}, {arg0}, {arg1}, {arg2}, {arg3}', 'S', 'S', 'I', 'I', 'S')
.annotate 'line', 1212
push $P1, $P66
.annotate 'line', 1330
new $P69, [ 'PredefFunction' ]
.annotate 'line', 1330
$P68 = $P69.'set_eval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1212
push $P1, $P68
.annotate 'line', 1335
new $P71, [ 'PredefFunction' ]
.annotate 'line', 1335
$P70 = $P71.'set_eval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1212
push $P1, $P70
.annotate 'line', 1340
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1212
push $P1, $P72
.annotate 'line', 1344
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1212
push $P1, $P74
.annotate 'line', 1348
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1212
push $P1, $P76
.annotate 'line', 1352
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1212
push $P1, $P78
.annotate 'line', 1356
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1212
push $P1, $P80
.annotate 'line', 1360
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1212
push $P1, $P82
.annotate 'line', 1365
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1212
push $P1, $P84
.annotate 'line', 1370
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('push', 'push {arg0}, {arg1}', 'v', 'P', '?')
.annotate 'line', 1212
push $P1, $P86
.annotate 'line', 1374
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P88
.annotate 'line', 1378
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1212
push $P1, $P90
.annotate 'line', 1382
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P92
.annotate 'line', 1386
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P94
.annotate 'line', 1390
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P96
.annotate 'line', 1394
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P98
.annotate 'line', 1398
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P100
.annotate 'line', 1402
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P102
.annotate 'line', 1406
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P104
.annotate 'line', 1410
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1212
push $P1, $P106
.annotate 'line', 1414
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1212
push $P1, $P108
.annotate 'line', 1418
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1212
push $P1, $P110
.annotate 'line', 1422
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1212
push $P1, $P112
.annotate 'line', 1426
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('typeof', 'typeof {res}, {arg0}', 'P', 'P')
.annotate 'line', 1212
push $P1, $P114
.annotate 'line', 1430
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1212
push $P1, $P116
.annotate 'line', 1434
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1212
push $P1, $P118
.annotate 'line', 1438
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1212
push $P1, $P120
.annotate 'line', 1442
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1212
push $P1, $P122
.annotate 'line', 1446
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1212
push $P1, $P124
.annotate 'line', 1450
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1212
push $P1, $P126
.annotate 'line', 1454
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1212
push $P1, $P128
.annotate 'line', 1459
new $P131, [ 'PredefFunction' ]
$P130 = $P131.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1212
push $P1, $P130
.annotate 'line', 1464
new $P133, [ 'PredefFunction' ]
$P132 = $P133.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1212
push $P1, $P132
.annotate 'line', 1468
new $P135, [ 'PredefFunction' ]
$P134 = $P135.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1212
push $P1, $P134
.annotate 'line', 1472
new $P137, [ 'PredefFunction' ]
$P136 = $P137.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1212
push $P1, $P136
.annotate 'line', 1476
new $P139, [ 'PredefFunction' ]
$P138 = $P139.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1212
push $P1, $P138
.annotate 'line', 1480
new $P141, [ 'PredefFunction' ]
$P140 = $P141.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1212
push $P1, $P140
.annotate 'line', 1484
new $P143, [ 'PredefFunction' ]
.annotate 'line', 1485
new $P144, [ 'Predef_print' ]
.annotate 'line', 1484
$P142 = $P143.'set'('print', $P144, 'v', '*')
.annotate 'line', 1212
push $P1, $P142
.annotate 'line', 1488
new $P146, [ 'PredefFunction' ]
.annotate 'line', 1489
new $P147, [ 'Predef_say' ]
.annotate 'line', 1488
$P145 = $P146.'set'('say', $P147, 'v', '*')
.annotate 'line', 1212
push $P1, $P145
.annotate 'line', 1492
new $P149, [ 'PredefFunction' ]
.annotate 'line', 1493
new $P150, [ 'Predef_cry' ]
.annotate 'line', 1492
$P148 = $P149.'set'('cry', $P150, 'v', '*')
.annotate 'line', 1212
push $P1, $P148
__label_1: # Infinite loop
.annotate 'line', 1498
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1499

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1501
# Body
# {
.annotate 'line', 1503
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1504
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1505
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1506
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1507
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1508
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1509
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1511
.return($P2)
# }
.annotate 'line', 1512

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1518
# Body
# {
.annotate 'line', 1520
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1521
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1522
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1521
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1523

.end # optimize_array


.sub 'parseDotted'
.param pmc __ARG_1

.annotate 'line', 1525
# Body
# {
.annotate 'line', 1527
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1528
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 1529
$P3 = $P2.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 1530
# predefined push
push $P1, $P2
__label_2: # while
.annotate 'line', 1531
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 1532
$P2 = __ARG_1.'get'()
.annotate 'line', 1533
# predefined push
push $P1, $P2
# }
goto __label_2
__label_1: # endwhile
# }
__label_0: # endif
.annotate 'line', 1536
__ARG_1.'unget'($P2)
.annotate 'line', 1537
.return($P1)
# }
.annotate 'line', 1538

.end # parseDotted


.sub 'toIdentifierList'
.param pmc __ARG_1

.annotate 'line', 1540
# Body
# {
.annotate 'line', 1542
# string list: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1543
iter $P3, __ARG_1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 1544
$P4 = $P2.'getidentifier'()
# predefined push
push $P1, $P4
goto __label_0
__label_1: # endfor
.annotate 'line', 1545
.return($P1)
# }
.annotate 'line', 1546

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1557
# Body
# {
.annotate 'line', 1559
setattribute self, 'start', __ARG_1
.annotate 'line', 1560
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1561

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1562
# Body
# {
.annotate 'line', 1564
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1565

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1566
# Body
# {
.annotate 'line', 1568
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1569

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1570
# Body
# {
.annotate 'line', 1572
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1573

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1574
# Body
# {
.annotate 'line', 1576
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1577

.end # addlocalfunction


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 1578
# Body
# {
.annotate 'line', 1580
getattribute $P1, self, 'owner'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1581

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1582
# Body
# {
.annotate 'line', 1584
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1585

.end # findclasskey


.sub 'dowarnings' :method

.annotate 'line', 1586
# Body
# {
.annotate 'line', 1588
getattribute $P1, self, 'owner'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1589

.end # dowarnings

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1554
addattribute $P0, 'start'
.annotate 'line', 1555
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1602
# Body
# {
.annotate 'line', 1604
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1605

.end # init


.sub 'numargs' :method

.annotate 'line', 1607
# Body
# {
.annotate 'line', 1609
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1610

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1611
# Body
# {
.annotate 'line', 1613
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1614
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1615

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1617
# Body
# {
.annotate 'line', 1619
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1620
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1621
# {
.annotate 'line', 1622
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1623
# predefined push
push $P1, $P3
# }
__label_2: # continue
.annotate 'line', 1624
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1625
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1626

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1628
# Body
# {
.annotate 'line', 1630
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1631
if_null $P1, __label_0
.annotate 'line', 1632
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1633

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1634
# Body
# {
.annotate 'line', 1636
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1637
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1638
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1639
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1640
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1641
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1642
# predefined push
push $P2, $S1
# }
__label_0: # for iteration
.annotate 'line', 1639
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1644
.return($P2)
# }
.annotate 'line', 1645

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1646
# Body
# {
.annotate 'line', 1648
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1649
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1650

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1600
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1662
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1663
# Body
# {
.annotate 'line', 1665
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1666
.return($I1)
# }
.annotate 'line', 1667

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1668
# Body
# {
.annotate 'line', 1670
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1671
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1672
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1674
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1675

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1676
# Body
# {
.annotate 'line', 1678
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 1679
if_null __ARG_2, __label_0
.annotate 'line', 1680
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1681

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1682
# Body
# {
.annotate 'line', 1684
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1685

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1659
addattribute $P0, 'name'
.annotate 'line', 1660
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1692
# Body
# {
.annotate 'line', 1694
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1695
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1696
# {
.annotate 'line', 1697
$P2 = __ARG_1.'get'()
.annotate 'line', 1698
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1699
$P2 = __ARG_1.'get'()
.annotate 'line', 1700
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1701
$P4 = $P2.'isop'('(')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 1702
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1703
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1705
new $P5, [ 'Modifier' ]
$P5.'Modifier'($S1, $P3)
set $P4, $P5
# predefined push
push $P1, $P4
# }
__label_2: # continue
.annotate 'line', 1706
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1707
'RequireOp'(']', $P2)
.annotate 'line', 1708
setattribute self, 'list', $P1
# }
.annotate 'line', 1709

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1710
# Body
# {
.annotate 'line', 1712
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1713
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1714

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1715
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1716
# Body
# {
.annotate 'line', 1718
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1719
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1720
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1721
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1722
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1723
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1720
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1726
.return($P3)
# }
.annotate 'line', 1727

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1690
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1734
# Body
# {
.annotate 'line', 1736
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1737
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
.annotate 'line', 1738

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1740
# Body
# {
.annotate 'line', 1742
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1743
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1745
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1746
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1748

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1750
# Body
# {
.annotate 'line', 1752
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1753
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1754
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1755
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1756
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1758
__ARG_2.'unget'($P1)
.annotate 'line', 1759
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1761

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1763
# Body
# {
.annotate 'line', 1765
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1766
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1767
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1768
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1769
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1770
$P4 = $P1.'isop'('${')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 1771
new $P6, [ 'PiropStatement' ]
$P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 1773
# string key: $S1
$P4 = $P1.'checkkeyword'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1774
# var st: $P2
null $P2
.annotate 'line', 1775
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
.annotate 'line', 1777
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1779
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1782
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_9: # case
.annotate 'line', 1785
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1787
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1789
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1791
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_13: # case
.annotate 'line', 1793
new $P5, [ 'ReturnStatement' ]
$P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_14: # case
.annotate 'line', 1795
new $P7, [ 'YieldStatement' ]
$P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P6, $P7
.return($P6)
__label_15: # case
.annotate 'line', 1797
new $P9, [ 'GotoStatement' ]
$P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_16: # case
.annotate 'line', 1799
new $P11, [ 'IfStatement' ]
$P11.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_17: # case
.annotate 'line', 1801
new $P13, [ 'WhileStatement' ]
$P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_18: # case
.annotate 'line', 1803
new $P15, [ 'DoStatement' ]
$P15.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_19: # case
.annotate 'line', 1805
new $P17, [ 'ContinueStatement' ]
$P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_20: # case
.annotate 'line', 1807
new $P19, [ 'BreakStatement' ]
$P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_21: # case
.annotate 'line', 1809
new $P21, [ 'SwitchStatement' ]
$P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_22: # case
.annotate 'line', 1811
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_23: # case
.annotate 'line', 1813
new $P23, [ 'ThrowStatement' ]
$P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_24: # case
.annotate 'line', 1815
new $P25, [ 'TryStatement' ]
$P25.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_5: # default
.annotate 'line', 1817
$P26 = $P1.'isidentifier'()
if_null $P26, __label_25
unless $P26 goto __label_25
# {
.annotate 'line', 1818
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1819
$P4 = $P3.'isop'(':')
if_null $P4, __label_26
unless $P4 goto __label_26
.annotate 'line', 1820
new $P6, [ 'LabelStatement' ]
$P6.'LabelStatement'($P1, __ARG_2)
set $P5, $P6
.return($P5)
__label_26: # endif
.annotate 'line', 1821
__ARG_1.'unget'($P3)
# }
__label_25: # endif
.annotate 'line', 1823
__ARG_1.'unget'($P1)
.annotate 'line', 1824
new $P5, [ 'ExprStatement' ]
$P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_4: # switch end
.annotate 'line', 1826
unless_null $P2, __label_27
.annotate 'line', 1827
'InternalError'('parseStatement failure')
__label_27: # endif
.annotate 'line', 1828
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1829

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1837
# Body
# {
.annotate 'line', 1839
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1840

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1841
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1842
# Body
# {
.annotate 'line', 1844
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1845

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1846
# Body
# {
.annotate 'line', 1848
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1849

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1850
# Body
# {
.annotate 'line', 1852
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1853

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1854
# Body
# {
.annotate 'line', 1856
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1857

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1858
# Body
# {
.annotate 'line', 1860
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1861

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1862
# Body
# {
.annotate 'line', 1864
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1865

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1866
# Body
# {
.annotate 'line', 1868
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1869

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1870
# Body
# {
.annotate 'line', 1872
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1873

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1874
# Body
# {
.annotate 'line', 1876
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1877

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1878
# Body
# {
.annotate 'line', 1880
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1881

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1883
# Body
# {
.annotate 'line', 1888
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1889

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1890
# Body
# {
.annotate 'line', 1892
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1893

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1894
# Body
# {
.annotate 'line', 1896
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1897

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1898
# Body
# {
.annotate 'line', 1900
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1902
.return(self)
# }
.annotate 'line', 1903

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1835
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1908
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1909
# Body
# {
.annotate 'line', 1911
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1912

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1913
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1914
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1906
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method

.annotate 'line', 1924
# Body
# {
.annotate 'line', 1926
# var statements: $P1
getattribute $P1, self, 'statements'
.annotate 'line', 1927
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 1928
# int empty: $I2
set $I2, 1
# for loop
.annotate 'line', 1929
# int i: $I3
null $I3
__label_2: # for condition
ge $I3, $I1, __label_1
# {
.annotate 'line', 1930
# var st: $P2
$P3 = $P1[$I3]
$P2 = $P3.'optimize'()
.annotate 'line', 1931
set $I4, $I2
unless $I4 goto __label_4
$P3 = $P2.'isempty'()
isfalse $I4, $P3
__label_4:
unless $I4 goto __label_3
.annotate 'line', 1932
null $I2
__label_3: # endif
.annotate 'line', 1933
$P1[$I3] = $P2
# }
__label_0: # for iteration
.annotate 'line', 1929
inc $I3
goto __label_2
__label_1: # for end
.annotate 'line', 1935
unless $I2 goto __label_5
.annotate 'line', 1936
new $P3, [ 'EmptyStatement' ]
.return($P3)
goto __label_6
__label_5: # else
.annotate 'line', 1938
.return(self)
__label_6: # endif
# }
.annotate 'line', 1939

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 1922
addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1944
# Body
# {
.annotate 'line', 1946
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
push $P1, __ARG_1
push $P1, __ARG_2
.annotate 'line', 1947
setattribute self, 'statements', $P1
# }
.annotate 'line', 1948

.end # MultiStatement


.sub 'isempty' :method

.annotate 'line', 1949
# Body
# {
.return(0)
# }

.end # isempty


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1950
# Body
# {
.annotate 'line', 1952
getattribute $P1, self, 'statements'
# predefined push
push $P1, __ARG_1
.annotate 'line', 1953
.return(self)
# }
.annotate 'line', 1954

.end # push


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1955
# Body
# {
.annotate 'line', 1957
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1958
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1959

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1942
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1962
# Body
# {
.annotate 'line', 1964
unless_null __ARG_1, __label_0
.annotate 'line', 1965
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1966
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1967
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1969
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1970

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1981
# Body
# {
.annotate 'line', 1983
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1984
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1985
# int dotted: $I1
null $I1
.annotate 'line', 1986
$P4 = $P1.'isop'('.')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 1987
set $I1, 1
.annotate 'line', 1988
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1990
# string opname: $S1
$P4 = $P1.'getidentifier'()
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 1991
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S4, $S3, $S1
box $P4, $S4
setattribute self, 'opname', $P4
.annotate 'line', 1992
$P1 = __ARG_2.'get'()
.annotate 'line', 1993
$P4 = $P1.'isop'('}')
isfalse $I2, $P4
unless $I2 goto __label_4
# {
.annotate 'line', 1994
__ARG_2.'unget'($P1)
.annotate 'line', 1995
# var args: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_5: # do
.annotate 'line', 1996
# {
.annotate 'line', 1997
# var arg: $P3
null $P3
.annotate 'line', 1998
$P1 = __ARG_2.'get'()
.annotate 'line', 1999
$P4 = $P1.'isop'(':')
if_null $P4, __label_8
unless $P4 goto __label_8
# {
.annotate 'line', 2000
$P1 = __ARG_2.'get'()
.annotate 'line', 2001
# string label: $S2
$P4 = $P1.'getidentifier'()
null $S2
if_null $P4, __label_10
set $S2, $P4
__label_10:
.annotate 'line', 2002
new $P4, [ 'Reflabel' ]
$P4.'Reflabel'(__ARG_3, $S2)
set $P3, $P4
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 2005
__ARG_2.'unget'($P1)
.annotate 'line', 2006
$P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
__label_9: # endif
.annotate 'line', 2008
# predefined push
push $P2, $P3
# }
__label_7: # continue
.annotate 'line', 2009
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_6
if $P4 goto __label_5
__label_6: # enddo
.annotate 'line', 2010
'RequireOp'('}', $P1)
.annotate 'line', 2011
setattribute self, 'args', $P2
# }
__label_4: # endif
.annotate 'line', 2013
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2014

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 2015
# Body
# {
.annotate 'line', 2017
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2018
if_null $P1, __label_0
.annotate 'line', 2019
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 2020
.return(self)
# }
.annotate 'line', 2021

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2022
# Body
# {
.annotate 'line', 2024
# string opname: $S1
getattribute $P4, self, 'opname'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2025
self.'annotate'(__ARG_1)
.annotate 'line', 2026
concat $S3, 'pirop ', $S1
__ARG_1.'comment'($S3)
.annotate 'line', 2027
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2028
unless_null $P1, __label_1
.annotate 'line', 2029
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 2031
__ARG_1.'print'($S1, ' ')
.annotate 'line', 2032
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2033
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 2034
# int i: $I2
null $I2
__label_5: # for condition
ge $I2, $I1, __label_4
# {
.annotate 'line', 2035
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 2036
# string reg: $S2
$P4 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_6
set $S2, $P4
__label_6:
.annotate 'line', 2037
# predefined push
push $P2, $S2
# }
__label_3: # for iteration
.annotate 'line', 2034
inc $I2
goto __label_5
__label_4: # for end
.annotate 'line', 2039
# predefined join
join $S3, ', ', $P2
__ARG_1.'say'($S3)
# }
__label_2: # endif
# }
.annotate 'line', 2041

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1976
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1978
addattribute $P0, 'opname'
.annotate 'line', 1979
addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2051
# Body
# {
.annotate 'line', 2053
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2054
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2055
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2056
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2057
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2058
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
.annotate 'line', 2059
.return(self)
# }
.annotate 'line', 2060

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 2061
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2062
# Body
# {
.annotate 'line', 2064
self.'annotate'(__ARG_1)
.annotate 'line', 2065
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2066

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2048
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2050
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2076
# Body
# {
.annotate 'line', 2078
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2079
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2080
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2081
box $P1, $S1
setattribute self, 'symbol', $P1
# }
.annotate 'line', 2082

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 2083
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2084
# Body
# {
.annotate 'line', 2086
self.'annotate'(__ARG_1)
.annotate 'line', 2087
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2088
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2089

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2073
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2075
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2101
# Body
# {
.annotate 'line', 2103
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2104
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2105
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2106
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2107
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2108
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
# }
.annotate 'line', 2109

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 2110
# Body
# {
.annotate 'line', 2112
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2113
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2114
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2116
# var symbol: $P3
$P3 = self.'findsymbol'($P1)
.annotate 'line', 2117
if_null $P3, __label_0
# {
.annotate 'line', 2118
isa $I1, $P3, 'FunctionStatement'
unless $I1 goto __label_1
# {
.annotate 'line', 2119
# string subid: $S2
$P4 = $P3.'makesubid'()
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2120
box $P4, $S2
setattribute self, 'subid', $P4
# }
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2123
.return(self)
# }
.annotate 'line', 2124

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2125
# Body
# {
.annotate 'line', 2127
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2128
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2129
# var vdata: $P2
$P2 = self.'getvar'($S1)
.annotate 'line', 2130
getattribute $P3, self, 'subid'
if_null $P3, __label_0
# {
.annotate 'line', 2131
# string subid: $S2
getattribute $P4, self, 'subid'
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2132
$P3 = $P2.'getreg'()
__ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 2135
self.'annotate'(__ARG_1)
.annotate 'line', 2136
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 2137
$P1.'pop'()
.annotate 'line', 2138
# predefined elements
elements $I1, $P1
null $I2
if $I1 == $I2 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 2140
__ARG_1.'say'("'", $S1, "'")
goto __label_3 # break
__label_4: # default
.annotate 'line', 2143
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_3: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2146

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2096
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2098
addattribute $P0, 'path'
.annotate 'line', 2099
addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2156
# Body
# {
.annotate 'line', 2158
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2159
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 2160
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2161

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 2162
# Body
# {
.annotate 'line', 2164
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 2165
.return(self)
# }
.annotate 'line', 2166

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2167
# Body
# {
.annotate 'line', 2169
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2170

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2153
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2155
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2187
# Body
# {
.annotate 'line', 2189
setattribute self, 'type', __ARG_1
.annotate 'line', 2190
setattribute self, 'reg', __ARG_2
.annotate 'line', 2191
setattribute self, 'scope', __ARG_3
.annotate 'line', 2192
box $P1, __ARG_4
setattribute self, 'flags', $P1
.annotate 'line', 2193
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2194

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2195
# Body
# {
.annotate 'line', 2197
box $P1, __ARG_1
setattribute self, 'id', $P1
# }
.annotate 'line', 2198

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2199
# Body
# {
.annotate 'line', 2201
box $P1, __ARG_1
setattribute self, 'lexname', $P1
# }
.annotate 'line', 2202

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2203
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2204
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2205
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2206
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2207
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2208
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2209
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'getflags' :method

.annotate 'line', 2210
# Body
# {
getattribute $P1, self, 'flags'
.return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarData' ]
.annotate 'line', 2179
addattribute $P0, 'type'
.annotate 'line', 2180
addattribute $P0, 'reg'
.annotate 'line', 2181
addattribute $P0, 'scope'
.annotate 'line', 2182
addattribute $P0, 'flags'
.annotate 'line', 2183
addattribute $P0, 'value'
.annotate 'line', 2184
addattribute $P0, 'id'
.annotate 'line', 2185
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2216
# Body
# {
.annotate 'line', 2218
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2219

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2220
# Body
# {
.annotate 'line', 2222
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2223

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2215
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2230
# Body
# {
.annotate 'line', 2232
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2233

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2234
# Body
# {
.annotate 'line', 2236
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2237
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2238
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2239
if_null $P2, __label_1
.annotate 'line', 2240
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2241
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2242
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2243
$P1[$S1] = $P3
.annotate 'line', 2244
.return($P3)
# }
.annotate 'line', 2245

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2246
# Body
# {
.annotate 'line', 2248
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2249
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2250
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2251
if_null $P2, __label_1
.annotate 'line', 2252
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2253
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2254

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2255
# Body
# {
.annotate 'line', 2257
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2258
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2259
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2260
if_null $P2, __label_1
.annotate 'line', 2261
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2262
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2263
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2264
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2265
$P1[$S1] = $P3
# }
.annotate 'line', 2266

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2267
# Body
# {
.annotate 'line', 2269
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2270
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2271
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2272
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2273
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2274
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2275
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2276
.return($P2)
# }
.annotate 'line', 2277

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2278
# Body
# {
.annotate 'line', 2280
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2281
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2282
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2283
.return($P2)
# }
.annotate 'line', 2284

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2285
# Body
# {
.annotate 'line', 2287
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2288
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2289
.return($S1)
# }
.annotate 'line', 2290

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2291
# Body
# {
.annotate 'line', 2293
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2295
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2296
.return('__WLEX_self')
# }
.annotate 'line', 2297

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2229
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2306
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2316
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2317
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2318
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2319
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2320
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2321
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2322
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2323
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2324
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2325
# Body
# {
.annotate 'line', 2327
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2328

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2329
# Body
# {
.annotate 'line', 2331
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2332

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2333
# Body
# {
.annotate 'line', 2336
.return(self)
# }
.annotate 'line', 2337

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 2338
# Body
# {
.return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2339
# Body
# {
.annotate 'line', 2341
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2342
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2343
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2344
.return($S2)
# }
.annotate 'line', 2345

.end # emit_get


.sub 'emit_getint' :method
.param pmc __ARG_1

.annotate 'line', 2346
# Body
# {
.annotate 'line', 2348
# string reg: $S1
null $S1
.annotate 'line', 2349
$P1 = self.'checkresult'()
set $S2, $P1
ne $S2, 'I', __label_0
.annotate 'line', 2350
$P2 = self.'emit_get'(__ARG_1)
set $S1, $P2
goto __label_1
__label_0: # else
# {
.annotate 'line', 2352
$P3 = self.'tempreg'('I')
set $S1, $P3
.annotate 'line', 2353
self.'emit'(__ARG_1, $S1)
# }
__label_1: # endif
.annotate 'line', 2355
.return($S1)
# }
.annotate 'line', 2356

.end # emit_getint


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2357
# Body
# {
.annotate 'line', 2359
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2360

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2314
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2365
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2363
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2373
# Body
# {
.annotate 'line', 2375
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2376
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2377
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2378
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2379
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2380

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2381
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2382
# Body
# {
.annotate 'line', 2384
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2385
.return(self)
# }
.annotate 'line', 2386

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2387
# Body
# {
.annotate 'line', 2389
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2390
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2391
self.'annotate'(__ARG_1)
.annotate 'line', 2392
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2393
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2394
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2395

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2370
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2372
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2408
# Body
# {
.annotate 'line', 2410
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2411
.return(self)
# }
.annotate 'line', 2412

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2413
# Body
# {
.annotate 'line', 2415
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2416

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2417
# Body
# {
.annotate 'line', 2419
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2420
.return(self)
# }
.annotate 'line', 2421

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2422
# Body
# {
.annotate 'line', 2424
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2425
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2426
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2428
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2429
ne $I1, 0, __label_4
.annotate 'line', 2430
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2432
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2435
.return(0)
# }
.annotate 'line', 2436

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2437
# Body
# {
.annotate 'line', 2439
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2441
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2442
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2443
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2445
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2446
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2447
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
.annotate 'line', 2450
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2453
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2456
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2459

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2460
# Body
# {
.annotate 'line', 2462
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2464
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2465
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2466
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2468
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2469
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2470
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
.annotate 'line', 2473
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2476
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2479
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2482

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2407
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2489
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2490
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2487
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2498
# Body
# {
.annotate 'line', 2500
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2501
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2502

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2503
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2504
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2505
# Body
# {
.annotate 'line', 2507
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2508
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2509
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2510
# int need_unicode: $I2
null $I2
.annotate 'line', 2511
box $P2, $S1
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2512
le $I3, 127, __label_3
# {
.annotate 'line', 2513
set $I2, 1
goto __label_2 # break
.annotate 'line', 2514
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2517
unless $I2 goto __label_4
# {
.annotate 'line', 2518
unless $I1 goto __label_5
# {
.annotate 'line', 2519
null $I1
.annotate 'line', 2520
# string saux: $S2
set $S2, $S1
.annotate 'line', 2521
set $S1, ''
.annotate 'line', 2522
box $P2, $S2
iter $P4, $P2
set $P4, 0
__label_6: # for iteration
unless $P4 goto __label_7
shift $S3, $P4
# {
.annotate 'line', 2523
ne $S3, '\', __label_8
.annotate 'line', 2524
set $S3, '\\'
__label_8: # endif
.annotate 'line', 2525
concat $S1, $S1, $S3
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2528
# string result: $S4
set $S4, ''
.annotate 'line', 2529
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2530
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2531
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2532
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2533
le $I6, 127, __label_12
# {
.annotate 'line', 2534
# string h: $S6
box $P5, $I6
$P2 = $P5.'get_as_base'(16)
null $S6
if_null $P2, __label_14
set $S6, $P2
__label_14:
.annotate 'line', 2535
concat $S4, $S4, '\x{'
concat $S4, $S4, $S6
concat $S4, $S4, '}'
# }
goto __label_13
__label_12: # else
.annotate 'line', 2538
concat $S4, $S4, $S5
__label_13: # endif
# }
__label_9: # for iteration
.annotate 'line', 2530
inc $I5
goto __label_11
__label_10: # for end
.annotate 'line', 2540
set $S1, $S4
# }
__label_4: # endif
.annotate 'line', 2542
# string q: $S7
unless $I1 goto __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
.annotate 'line', 2543
concat $S0, $S7, $S1
concat $S0, $S0, $S7
set $S1, $S0
.annotate 'line', 2544
unless $I2 goto __label_17
.annotate 'line', 2545
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2546
.return($S1)
# }
.annotate 'line', 2547

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2548
# Body
# {
.annotate 'line', 2550
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2551
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2552
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2553
# var s: $P2
box $P2, $S1
.annotate 'line', 2554
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2556
.return($S1)
# }
.annotate 'line', 2557

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2558
# Body
# {
.annotate 'line', 2560
set $S1, __ARG_2
eq $S1, '', __label_0
.annotate 'line', 2561
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2562

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2563
# Body
# {
.annotate 'line', 2565
.tailcall self.'getPirString'()
# }
.annotate 'line', 2566

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2495
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2497
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2575
# Body
# {
.annotate 'line', 2578
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2579
setattribute self, 'pos', __ARG_2
.annotate 'line', 2580
# int n: $I1
null $I1
.annotate 'line', 2581
unless __ARG_4 goto __label_0
.annotate 'line', 2582
set $I1, __ARG_3
goto __label_1
__label_0: # else
# {
.annotate 'line', 2584
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 2585
set $I1, $S1
# }
__label_1: # endif
.annotate 'line', 2587
box $P1, $I1
setattribute self, 'numval', $P1
# }
.annotate 'line', 2588

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2589
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2590
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2591
# Body
# {
.annotate 'line', 2593
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2594
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2595
.return($I1)
# }
.annotate 'line', 2596

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2597
# Body
# {
.annotate 'line', 2599
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2600
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2601
ne $I1, 0, __label_1
.annotate 'line', 2602
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2604
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2606

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2607
# Body
# {
.annotate 'line', 2609
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2610

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2571
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2573
addattribute $P0, 'pos'
.annotate 'line', 2574
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2618
# Body
# {
.annotate 'line', 2620
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2621
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2622

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2623
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2624
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2625
# Body
# {
.annotate 'line', 2627
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2628
# var n: $P1
new $P1, [ 'Float' ]
.annotate 'line', 2629
assign $P1, $S1
.annotate 'line', 2630
.return($P1)
# }
.annotate 'line', 2631

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2632
# Body
# {
.annotate 'line', 2634
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2635
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2636
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2638

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2639
# Body
# {
.annotate 'line', 2643
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2644
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
.annotate 'line', 2645
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2646
.return($S1)
# }
.annotate 'line', 2647

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2615
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2617
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2655
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2656
# Body
# {
.annotate 'line', 2658
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2659
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2660

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2661
# Body
# {
.annotate 'line', 2663
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2664

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2665
# Body
# {
.annotate 'line', 2667
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2668
if_null $P1, __label_0
.annotate 'line', 2669
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2671
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
.annotate 'line', 2674
.return('P')
__label_3: # default
.annotate 'line', 2676
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2679

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2680
# Body
# {
.annotate 'line', 2682
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2683
.return($S1)
# }
.annotate 'line', 2684

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2685
# Body
# {
.annotate 'line', 2687
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2688
unless_null $P1, __label_0
.annotate 'line', 2689
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2690
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2691
# string s: $S1
null $S1
.annotate 'line', 2692
unless_null $P2, __label_1
# {
.annotate 'line', 2693
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2694
set $S3, $S2
set $S4, 'self'
if $S3 == $S4 goto __label_6
set $S4, 'null'
if $S3 == $S4 goto __label_7
goto __label_5
# switch
__label_6: # case
.annotate 'line', 2696
set $S1, 'self'
goto __label_4 # break
__label_7: # case
.annotate 'line', 2698
set $S1, 'null'
goto __label_4 # break
__label_5: # default
.annotate 'line', 2700
set $S1, ''
__label_4: # switch end
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2704
$P3 = $P2.'getid'()
if_null $P3, __label_8
.annotate 'line', 2705
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2707
$P4 = $P2.'getreg'()
set $S1, $P4
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2709
.return($S1)
# }
.annotate 'line', 2710

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2711
# Body
# {
.annotate 'line', 2713
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2714
set $S2, $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2715
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2716
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2718
.return($P1)
# }
.annotate 'line', 2719

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2720
# Body
# {
.annotate 'line', 2722
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2723
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2724
if_null $P2, __label_0
# {
.annotate 'line', 2725
$I2 = $P2.'isconst'()
unless $I2 goto __label_2
$P3 = $P2.'getid'()
isnull $I2, $P3
__label_2:
unless $I2 goto __label_1
.annotate 'line', 2726
.tailcall $P2.'getvalue'()
__label_1: # endif
.annotate 'line', 2727
# int flags: $I1
$P3 = $P2.'getflags'()
set $I1, $P3
.annotate 'line', 2728
band $I2, $I1, 1
unless $I2 goto __label_3
# {
.annotate 'line', 2729
band $I3, $I1, 2
unless $I3 goto __label_4
.annotate 'line', 2730
new $P4, [ 'LexicalVolatileExpr' ]
$P4.'LexicalVolatileExpr'(self, $P2)
set $P3, $P4
.return($P3)
__label_4: # endif
# }
__label_3: # endif
# }
__label_0: # endif
.annotate 'line', 2733
.return(self)
# }
.annotate 'line', 2734

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2735
# Body
# {
.annotate 'line', 2737
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2738
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2739
# int flags: $I1
unless_null $P1, __label_2
null $I1
goto __label_1
__label_2:
$I1 = $P1.'getflags'()
__label_1:
.annotate 'line', 2740
band $I2, $I1, 1
unless $I2 goto __label_3
# {
.annotate 'line', 2741
band $I3, $I1, 2
unless $I3 goto __label_4
# {
.annotate 'line', 2742
# string lexname: $S2
$P2 = $P1.'getlex'()
null $S2
if_null $P2, __label_5
set $S2, $P2
__label_5:
.annotate 'line', 2743
isnull $I2, $S2
not $I2
unless $I2 goto __label_7
isne $I2, $S2, ''
__label_7:
unless $I2 goto __label_6
.annotate 'line', 2744
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_6: # endif
# }
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 2747
.return($S1)
# }
.annotate 'line', 2748

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2749
# Body
# {
.annotate 'line', 2751
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 2752
self.'annotate'(__ARG_1)
.annotate 'line', 2753
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2754
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2756

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2757
# Body
# {
.annotate 'line', 2759
self.'annotate'(__ARG_1)
.annotate 'line', 2760
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2761
.return($S1)
# }
.annotate 'line', 2762

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2763
# Body
# {
.annotate 'line', 2765
self.'annotate'(__ARG_1)
.annotate 'line', 2766
$P1 = self.'isnull'()
if_null $P1, __label_0
unless $P1 goto __label_0
# predefined die
.annotate 'line', 2767
die "NO"
__label_0: # endif
.annotate 'line', 2768
# string typeleft: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2769
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_2
set $S2, $P1
__label_2:
.annotate 'line', 2770
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_3
unless $P1 goto __label_3
# {
.annotate 'line', 2771
set $S5, $S1
set $S6, 'S'
if $S5 == $S6 goto __label_7
set $S6, 'P'
if $S5 == $S6 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2774
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2777
getattribute $P2, self, 'start'
'SyntaxError'("Can't assign null to that type", $P2)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2780
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2781
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2783
# string typeright: $S3
$P1 = __ARG_2.'checkresult'()
null $S3
if_null $P1, __label_11
set $S3, $P1
__label_11:
.annotate 'line', 2784
ne $S3, 'v', __label_12
.annotate 'line', 2785
getattribute $P1, self, 'start'
'SyntaxError'("Can't assign from void expression", $P1)
__label_12: # endif
.annotate 'line', 2786
ne $S1, $S3, __label_13
# {
.annotate 'line', 2787
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 2790
# string rreg: $S4
$P1 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P1, __label_15
set $S4, $P1
__label_15:
.annotate 'line', 2791
self.'annotate'(__ARG_1)
.annotate 'line', 2792
iseq $I1, $S1, 'P'
unless $I1 goto __label_18
isne $I1, $S3, 'P'
__label_18:
unless $I1 goto __label_16
.annotate 'line', 2793
__ARG_1.'emitbox'($S2, $S4)
goto __label_17
__label_16: # else
.annotate 'line', 2795
__ARG_1.'emitset'($S2, $S4)
__label_17: # endif
# }
__label_14: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2798
.return($S2)
# }
.annotate 'line', 2799

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2652
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2654
addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2807
# Body
# {
.annotate 'line', 2809
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2810
setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2811

.end # LexicalVolatileExpr


.sub 'checkresult' :method

.annotate 'line', 2812
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2813
# Body
# {
.annotate 'line', 2815
# var desc: $P1
getattribute $P1, self, 'desc'
.annotate 'line', 2816
# string lexname: $S1
$P2 = $P1.'getlex'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2817
# string reg: $S2
getattribute $P3, self, 'owner'
$P2 = $P3.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 2818
__ARG_1.'say'("find_lex ", $S2, ", '", $S1, "'")
.annotate 'line', 2819
.return($S2)
# }
.annotate 'line', 2820

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2821
# Body
# {
.annotate 'line', 2823
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 2824
self.'annotate'(__ARG_1)
.annotate 'line', 2825
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2826
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2828

.end # emit


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2829
# Body
# {
.annotate 'line', 2831
# string lreg: $S1
getattribute $P3, self, 'owner'
$P2 = $P3.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2832
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 2833
__ARG_1.'emitnull'($S1)
goto __label_2
__label_1: # else
.annotate 'line', 2834
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_3
.annotate 'line', 2835
__ARG_2.'emit'(__ARG_1, $S1)
goto __label_4
__label_3: # else
# {
.annotate 'line', 2837
# string typeright: $S2
$P3 = __ARG_2.'checkresult'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 2838
ne 'P', $S2, __label_6
# {
.annotate 'line', 2839
__ARG_2.'emit'(__ARG_1, $S1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 2842
# string rreg: $S3
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S3
if_null $P2, __label_8
set $S3, $P2
__label_8:
.annotate 'line', 2843
self.'annotate'(__ARG_1)
.annotate 'line', 2844
__ARG_1.'emitbox'($S1, $S3)
# }
__label_7: # endif
# }
__label_4: # endif
__label_2: # endif
.annotate 'line', 2848
# var desc: $P1
getattribute $P1, self, 'desc'
.annotate 'line', 2849
# string lexname: $S4
$P2 = $P1.'getlex'()
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
.annotate 'line', 2850
__ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2851

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2804
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2806
addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2858
# Body
# {
.annotate 'line', 2860
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2861

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2856
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpClassExpr' ]

.sub 'OpClassExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2870
# Body
# {
.annotate 'line', 2872
self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2873
$P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
setattribute self, 'clspec', $P2
# }
.annotate 'line', 2874

.end # OpClassExpr


.sub 'checkresult' :method

.annotate 'line', 2875
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2876
# Body
# {
.annotate 'line', 2878
# var clspec: $P1
getattribute $P1, self, 'clspec'
.annotate 'line', 2881
set $S1, __ARG_2
ne $S1, '', __label_0
.annotate 'line', 2882
getattribute $P2, self, 'owner'
__ARG_2 = $P2.'tempreg'('P')
__label_0: # endif
.annotate 'line', 2883
__ARG_1.'print'('get_class ', __ARG_2, ', ')
.annotate 'line', 2884
getattribute $P2, self, 'owner'
$P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2885
__ARG_1.'say'()
# }
.annotate 'line', 2886

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2866
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2868
addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2894
# Body
# {
.annotate 'line', 2896
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2897
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2898

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2899
# Body
# {
.annotate 'line', 2901
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2902

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2903
# Body
# {
.annotate 'line', 2905
self.'optimizearg'()
.annotate 'line', 2906
.return(self)
# }
.annotate 'line', 2907

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2891
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2893
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2916
# Body
# {
.annotate 'line', 2918
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2919
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2920
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2921

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2922
# Body
# {
.annotate 'line', 2924
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2925
.return(self)
# }
.annotate 'line', 2926

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2927
# Body
# {
.annotate 'line', 2929
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2930

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2931
# Body
# {
.annotate 'line', 2933
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2934
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2935

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2936
# Body
# {
.annotate 'line', 2938
self.'optimizearg'()
.annotate 'line', 2939
.return(self)
# }
.annotate 'line', 2940

.end # optimize


.sub 'emit_intleft' :method
.param pmc __ARG_1

.annotate 'line', 2941
# Body
# {
.annotate 'line', 2943
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2944
.return($S1)
# }
.annotate 'line', 2945

.end # emit_intleft


.sub 'emit_intright' :method
.param pmc __ARG_1

.annotate 'line', 2946
# Body
# {
.annotate 'line', 2948
# string reg: $S1
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2949
.return($S1)
# }
.annotate 'line', 2950

.end # emit_intright

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2912
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2914
addattribute $P0, 'lexpr'
.annotate 'line', 2915
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2957
# Body
# {
.annotate 'line', 2959
.return('I')
# }
.annotate 'line', 2960

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2961
# Body
# {
.annotate 'line', 2963
self.'optimizearg'()
.annotate 'line', 2964
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2965
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2966
$I3 = $P1.'isintegerliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 2967
# int li: $I1
# predefined int
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 2968
# int ri: $I2
# predefined int
getattribute $P3, $P2, 'numval'
set $I2, $P3
.annotate 'line', 2969
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
$P5 = self.'do_op'($I1, $I2)
.tailcall 'integerValue'($P3, $P4, $P5)
# }
__label_0: # endif
.annotate 'line', 2971
.return(self)
# }
.annotate 'line', 2972

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 2955
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method

.annotate 'line', 2979
# Body
# {
.annotate 'line', 2981
.return('I')
# }
.annotate 'line', 2982

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2983
# Body
# {
.annotate 'line', 2985
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2986
.return(self)
# }
.annotate 'line', 2987

.end # set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 2977
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2993
# Body
# {
.annotate 'line', 2995
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2996
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_2
$P2 = $P1.'checkresult'()
set $S1, $P2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 2997
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 2998
self.'annotate'(__ARG_1)
.annotate 'line', 2999
__ARG_1.'print'('delete ')
.annotate 'line', 3000
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 3001
__ARG_1.'say'()
.annotate 'line', 3002
set $S1, __ARG_2
eq $S1, '', __label_3
.annotate 'line', 3003
__ARG_1.'emitset'(__ARG_2, '1')
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3006
getattribute $P2, self, 'start'
'SyntaxError'("delete with invalid operator", $P2)
__label_1: # endif
# }
.annotate 'line', 3007

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 2991
get_class $P1, [ 'OpDelExBase' ]
addparent $P0, $P1
.end
.namespace [ 'OpExistsExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3012
# Body
# {
.annotate 'line', 3014
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 3016
# string reg: $S1
set $S2, __ARG_2
eq $S2, '', __label_1
set $P2, __ARG_2
goto __label_0
__label_1:
$P2 = self.'tempreg'('I')
__label_0:
null $S1
if_null $P2, __label_2
set $S1, $P2
__label_2:
.annotate 'line', 3017
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_5
$P2 = $P1.'checkresult'()
set $S2, $P2
isne $I1, $S2, 'S'
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3018
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 3019
self.'annotate'(__ARG_1)
.annotate 'line', 3020
__ARG_1.'print'('exists ', $S1, ', ')
.annotate 'line', 3021
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 3022
set $S2, __ARG_2
eq $S2, '', __label_6
.annotate 'line', 3023
__ARG_1.'say'()
__label_6: # endif
# }
goto __label_4
__label_3: # else
.annotate 'line', 3026
getattribute $P2, self, 'start'
'SyntaxError'("exists with invalid operator", $P2)
__label_4: # endif
# }
.annotate 'line', 3027

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3028
# Body
# {
.annotate 'line', 3030
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 3031
# string reg: $S1
$P2 = self.'tempreg'('I')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3032
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_3
$P2 = $P1.'checkresult'()
set $S2, $P2
isne $I1, $S2, 'S'
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 3033
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 3034
self.'annotate'(__ARG_1)
.annotate 'line', 3035
__ARG_1.'print'('exists ', $S1, ', ')
.annotate 'line', 3036
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 3037
__ARG_1.'say'()
.annotate 'line', 3038
.return($S1)
# }
goto __label_2
__label_1: # else
.annotate 'line', 3041
getattribute $P2, self, 'start'
'SyntaxError'("exists with invalid operator", $P2)
__label_2: # endif
# }
.annotate 'line', 3042

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3010
get_class $P1, [ 'OpDelExBase' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3049
# Body
# {
.annotate 'line', 3051
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3052

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3053
# Body
# {
.annotate 'line', 3055
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3056
.return(self)
# }
.annotate 'line', 3057

.end # set


.sub 'optimize' :method

.annotate 'line', 3058
# Body
# {
.annotate 'line', 3060
self.'optimizearg'()
.annotate 'line', 3061
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3062
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3063
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3064
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 3067
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isfloatliteral'()
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 3068
# var numval: $P2
getattribute $P5, self, 'subexpr'
getattribute $P2, $P5, 'numval'
.annotate 'line', 3069
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 3070
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P3, $P5, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 3073
.return(self)
# }
.annotate 'line', 3074

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3075
# Body
# {
.annotate 'line', 3077
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3078
self.'annotate'(__ARG_1)
.annotate 'line', 3079
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 3080

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3047
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3087
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 3088
# Body
# {
.annotate 'line', 3090
.return('I')
# }
.annotate 'line', 3091

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3092
# Body
# {
.annotate 'line', 3094
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3095
.return(self)
# }
.annotate 'line', 3096

.end # set


.sub 'optimize' :method

.annotate 'line', 3097
# Body
# {
.annotate 'line', 3099
self.'optimizearg'()
.annotate 'line', 3100
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 3101
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3102
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 3103
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 3104
getattribute $P3, self, 'owner'
getattribute $P4, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P4, $I2)
# }
__label_0: # endif
.annotate 'line', 3106
$P3 = $P1.'isnegable'()
if_null $P3, __label_1
unless $P3 goto __label_1
.annotate 'line', 3107
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 3108
.return(self)
# }
.annotate 'line', 3109

.end # optimize


.sub 'negated' :method

.annotate 'line', 3110
# Body
# {
.annotate 'line', 3112
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 3113

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3114
# Body
# {
.annotate 'line', 3116
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3117
self.'annotate'(__ARG_1)
.annotate 'line', 3118
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3119
set $S3, $S2
set $S4, 'I'
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 3121
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 3124
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 3127
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 3129

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3085
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3136
# Body
# {
.annotate 'line', 3138
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3139

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3140
# Body
# {
.annotate 'line', 3142
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3143
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3144
.return(self)
# }
.annotate 'line', 3145

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3146
# Body
# {
.annotate 'line', 3148
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3149
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3150
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3151

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3152
# Body
# {
.annotate 'line', 3154
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3155
self.'annotate'(__ARG_1)
.annotate 'line', 3156
__ARG_1.'emitinc'($S1)
.annotate 'line', 3157
.return($S1)
# }
.annotate 'line', 3158

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3134
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3165
# Body
# {
.annotate 'line', 3167
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3168
.return(self)
# }
.annotate 'line', 3169

.end # set


.sub 'checkresult' :method

.annotate 'line', 3170
# Body
# {
.annotate 'line', 3172
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3173

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3174
# Body
# {
.annotate 'line', 3176
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3177
self.'annotate'(__ARG_1)
.annotate 'line', 3178
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3179
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3180
__ARG_1.'emitinc'($S1)
.annotate 'line', 3181
.return($S1)
# }
.annotate 'line', 3182

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3163
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3189
# Body
# {
.annotate 'line', 3191
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3192

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3193
# Body
# {
.annotate 'line', 3195
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3196
.return(self)
# }
.annotate 'line', 3197

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3198
# Body
# {
.annotate 'line', 3200
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3201
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3202
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3203

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3204
# Body
# {
.annotate 'line', 3206
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3207
self.'annotate'(__ARG_1)
.annotate 'line', 3208
__ARG_1.'emitdec'($S1)
.annotate 'line', 3209
.return($S1)
# }
.annotate 'line', 3210

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3187
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3217
# Body
# {
.annotate 'line', 3219
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3220
.return(self)
# }
.annotate 'line', 3221

.end # set


.sub 'checkresult' :method

.annotate 'line', 3222
# Body
# {
.annotate 'line', 3224
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3225

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3226
# Body
# {
.annotate 'line', 3228
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3229
self.'annotate'(__ARG_1)
.annotate 'line', 3230
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3231
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3232
__ARG_1.'emitdec'($S1)
.annotate 'line', 3233
.return($S1)
# }
.annotate 'line', 3234

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3215
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3243
# Body
# {
.annotate 'line', 3245
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3246
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3247
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3248
.return(self)
# }
.annotate 'line', 3249

.end # set


.sub 'checkresult' :method

.annotate 'line', 3250
# Body
# {
.annotate 'line', 3252
getattribute $P1, self, 'lexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3253

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 3254
# Body
# {
.annotate 'line', 3256
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 3257
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 3258
.return(self)
# }
.annotate 'line', 3259

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 3260
# Body
# {
.annotate 'line', 3262
.tailcall self.'optimize_base'()
# }
.annotate 'line', 3263

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3264
# Body
# {
.annotate 'line', 3266
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3267
set $S2, __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 3268
self.'annotate'(__ARG_1)
.annotate 'line', 3269
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 3271

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3239
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3241
addattribute $P0, 'lexpr'
.annotate 'line', 3242
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3278
# Body
# {
.annotate 'line', 3280
self.'annotate'(__ARG_1)
.annotate 'line', 3281
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3282
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3283

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3276
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3290
# Body
# {
.annotate 'line', 3292
self.'annotate'(__ARG_1)
.annotate 'line', 3293
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3294
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 3295
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3296

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3297
# Body
# {
.annotate 'line', 3299
self.'annotate'(__ARG_1)
.annotate 'line', 3300
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3301
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3302
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3303
.return($S1)
# }
.annotate 'line', 3304

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3288
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3311
# Body
# {
.annotate 'line', 3313
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3314
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3315
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3316
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3317
# string reg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3318
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
isa $I1, $P2, 'ConcatString'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 3319
$P2.'emit_concat_to'(__ARG_1, $S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3321
# string reg2: $S4
$P3 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_6
set $S4, $P3
__label_6:
.annotate 'line', 3322
# string aux: $S5
null $S5
.annotate 'line', 3323
self.'annotate'(__ARG_1)
.annotate 'line', 3324
set $S6, $S1
set $S7, 'S'
if $S6 == $S7 goto __label_9
set $S7, 'I'
if $S6 == $S7 goto __label_10
set $S7, 'N'
if $S6 == $S7 goto __label_11
goto __label_8
# switch
__label_9: # case
.annotate 'line', 3326
eq $S2, 'S', __label_12
# {
.annotate 'line', 3327
$P3 = self.'tempreg'('S')
set $S5, $P3
.annotate 'line', 3328
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3329
set $S4, $S5
# }
__label_12: # endif
.annotate 'line', 3331
__ARG_1.'emitconcat1'($S3, $S4)
goto __label_7 # break
__label_10: # case
__label_11: # case
.annotate 'line', 3335
eq $S1, $S2, __label_13
# {
.annotate 'line', 3336
$P3 = self.'tempreg'($S1)
set $S5, $P3
.annotate 'line', 3337
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3338
set $S4, $S5
# }
__label_13: # endif
.annotate 'line', 3340
__ARG_1.'emitaddto'($S3, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 3343
__ARG_1.'emitaddto'($S3, $S4)
__label_7: # switch end
# }
__label_4: # endif
.annotate 'line', 3346
.return($S3)
# }
.annotate 'line', 3347

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3309
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3354
# Body
# {
.annotate 'line', 3356
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3357
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3358
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3359
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3360
# string reg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3361
# string reg2: $S4
$P3 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3362
# string aux: $S5
null $S5
.annotate 'line', 3363
self.'annotate'(__ARG_1)
.annotate 'line', 3364
set $S6, $S1
set $S7, 'S'
if $S6 == $S7 goto __label_6
set $S7, 'I'
if $S6 == $S7 goto __label_7
set $S7, 'N'
if $S6 == $S7 goto __label_8
goto __label_5
# switch
__label_6: # case
.annotate 'line', 3366
getattribute $P3, self, 'start'
'InternalError'('-= to string must not happen', $P3)
__label_7: # case
__label_8: # case
.annotate 'line', 3369
eq $S1, $S2, __label_9
# {
.annotate 'line', 3370
$P4 = self.'tempreg'($S1)
set $S5, $P4
.annotate 'line', 3371
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3372
set $S4, $S5
# }
__label_9: # endif
.annotate 'line', 3374
__ARG_1.'emitsubto'($S3, $S4)
goto __label_4 # break
__label_5: # default
.annotate 'line', 3377
__ARG_1.'emitsubto'($S3, $S4)
__label_4: # switch end
.annotate 'line', 3379
.return($S3)
# }
.annotate 'line', 3380

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3352
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3387
# Body
# {
.annotate 'line', 3389
# string ltype: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3390
# string rtype: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3391
# string lreg: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3392
# string rreg: $S4
null $S4
.annotate 'line', 3393
set $S5, $S1
set $S6, 'S'
if $S5 == $S6 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 3395
ne $S2, 'I', __label_6
.annotate 'line', 3396
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
set $S4, $P1
goto __label_7
__label_6: # else
# {
.annotate 'line', 3398
$P3 = self.'tempreg'('I')
set $S4, $P3
.annotate 'line', 3399
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S4)
# }
__label_7: # endif
.annotate 'line', 3401
self.'annotate'(__ARG_1)
.annotate 'line', 3402
__ARG_1.'say'('repeat ', $S3, ', ', $S3, ', ', $S4)
goto __label_3 # break
__label_4: # default
.annotate 'line', 3405
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
set $S4, $P1
.annotate 'line', 3406
self.'annotate'(__ARG_1)
.annotate 'line', 3407
__ARG_1.'say'('mul ', $S3, ', ', $S4)
__label_3: # switch end
.annotate 'line', 3409
.return($S3)
# }
.annotate 'line', 3410

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3385
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3417
# Body
# {
.annotate 'line', 3419
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3420
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3421
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3422
self.'annotate'(__ARG_1)
.annotate 'line', 3423
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3424
.return($S2)
# }
.annotate 'line', 3425

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3415
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3432
# Body
# {
.annotate 'line', 3434
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3435
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3436
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3437
self.'annotate'(__ARG_1)
.annotate 'line', 3438
__ARG_1.'say'('mod ', $S2, ', ', $S3)
.annotate 'line', 3439
.return($S2)
# }
.annotate 'line', 3440

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3430
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3447
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3448
# Body
# {
.annotate 'line', 3450
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3451
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3452
# string regl: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3453
# string regr: $S4
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P1, __label_3
set $S4, $P1
__label_3:
.annotate 'line', 3454
self.'annotate'(__ARG_1)
.annotate 'line', 3455
# string aux: $S5
null $S5
.annotate 'line', 3456
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3458
ne $S1, 'I', __label_7
# {
.annotate 'line', 3459
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3460
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3461
set $S3, $S5
# }
__label_7: # endif
.annotate 'line', 3463
ne $S2, 'I', __label_8
# {
.annotate 'line', 3464
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3465
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3466
set $S4, $S5
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3469
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3470
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3471
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3472
set $S3, $S5
# }
goto __label_10
__label_9: # else
.annotate 'line', 3474
iseq $I1, $S2, 'P'
unless $I1 goto __label_14
iseq $I1, $S1, 'I'
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3475
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3476
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3477
set $S4, $S5
# }
goto __label_13
__label_12: # else
.annotate 'line', 3479
iseq $I1, $S2, 'S'
unless $I1 goto __label_17
iseq $I1, $S1, 'P'
__label_17:
unless $I1 goto __label_15
# {
.annotate 'line', 3480
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3481
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3482
set $S3, $S5
# }
goto __label_16
__label_15: # else
.annotate 'line', 3484
iseq $I1, $S2, 'P'
unless $I1 goto __label_19
iseq $I1, $S1, 'S'
__label_19:
unless $I1 goto __label_18
# {
.annotate 'line', 3485
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3486
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3487
set $S4, $S5
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 3490
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
.annotate 'line', 3492
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3495
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3498
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3499
# }
.annotate 'line', 3501

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3502
# Body
# {
.annotate 'line', 3504
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3505

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3506
# Body
# {
.annotate 'line', 3508
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3509

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3510
# Body
# {
.annotate 'line', 3512
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3513

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3445
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3526
# Body
# {
.annotate 'line', 3528
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3529
setattribute self, 'expr', __ARG_2
.annotate 'line', 3530
box $P1, __ARG_3
setattribute self, 'checknull', $P1
# }
.annotate 'line', 3531

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3532
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3533
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3534
# Body
# {
.annotate 'line', 3536
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
.annotate 'line', 3537
box $P1, $I1
setattribute self, 'checknull', $P1
.annotate 'line', 3538
.return(self)
# }
.annotate 'line', 3539

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3540
# Body
# {
.annotate 'line', 3542
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3543
self.'annotate'(__ARG_1)
.annotate 'line', 3544
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3545
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3546
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3547

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3548
# Body
# {
.annotate 'line', 3550
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3551
self.'annotate'(__ARG_1)
.annotate 'line', 3552
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
.annotate 'line', 3553

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3521
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3523
addattribute $P0, 'expr'
.annotate 'line', 3524
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3560
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3561
# Body
# {
.annotate 'line', 3563
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3564

.end # negated


.sub 'optimize' :method

.annotate 'line', 3565
# Body
# {
.annotate 'line', 3567
self.'optimizearg'()
.annotate 'line', 3568
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3569
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3570
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3571
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3572
unless $I1 goto __label_0
# {
.annotate 'line', 3573
unless $I2 goto __label_1
.annotate 'line', 3574
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3576
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 1)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3578
unless $I2 goto __label_3
.annotate 'line', 3579
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 1)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3580
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3581
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3582
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3583
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3584
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3585
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3586
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
iseq $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3589
.return(self)
# }
.annotate 'line', 3590

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3591
# Body
# {
.annotate 'line', 3593
__ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3594

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3595
# Body
# {
.annotate 'line', 3597
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3598

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3599
# Body
# {
.annotate 'line', 3601
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3602

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3603
# Body
# {
.annotate 'line', 3605
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3606

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3558
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3613
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3614
# Body
# {
.annotate 'line', 3616
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3617

.end # negated


.sub 'optimize' :method

.annotate 'line', 3618
# Body
# {
.annotate 'line', 3620
self.'optimizearg'()
.annotate 'line', 3621
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3622
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3623
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3624
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3625
unless $I1 goto __label_0
# {
.annotate 'line', 3626
unless $I2 goto __label_1
.annotate 'line', 3627
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3629
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 0)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3631
unless $I2 goto __label_3
.annotate 'line', 3632
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 0)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3633
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3634
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3635
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3636
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3637
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3638
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3639
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
isne $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3642
.return(self)
# }
.annotate 'line', 3643

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3644
# Body
# {
.annotate 'line', 3646
__ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3647

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3648
# Body
# {
.annotate 'line', 3650
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3651

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3652
# Body
# {
.annotate 'line', 3654
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3655

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3656
# Body
# {
.annotate 'line', 3658
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3659

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3611
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

.annotate 'line', 3667
# Body
# {
.annotate 'line', 3669
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3670
box $P1, __ARG_1
setattribute self, 'positive', $P1
# }
.annotate 'line', 3671

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3672
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3673
# Body
# {
.annotate 'line', 3675
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3676
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
.annotate 'line', 3677

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3678
# Body
# {
.annotate 'line', 3680
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3681
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3682
__ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3683

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3684
# Body
# {
.annotate 'line', 3686
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3687

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3688
# Body
# {
.annotate 'line', 3690
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3691
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3692
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3693

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3694
# Body
# {
.annotate 'line', 3696
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3697
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3698
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3699

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3664
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3666
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3706
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3707
# Body
# {
.annotate 'line', 3709
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3710

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3711
# Body
# {
.annotate 'line', 3713
__ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3714

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3715
# Body
# {
.annotate 'line', 3717
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3718

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3719
# Body
# {
.annotate 'line', 3721
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3722

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3704
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3729
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3730
# Body
# {
.annotate 'line', 3732
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3733

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3734
# Body
# {
.annotate 'line', 3736
__ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3737

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3738
# Body
# {
.annotate 'line', 3740
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3741

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3742
# Body
# {
.annotate 'line', 3744
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3745

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3727
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3752
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3753
# Body
# {
.annotate 'line', 3755
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3756

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3757
# Body
# {
.annotate 'line', 3759
__ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3760

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3761
# Body
# {
.annotate 'line', 3763
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3764

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3765
# Body
# {
.annotate 'line', 3767
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3768

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3750
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3775
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3776
# Body
# {
.annotate 'line', 3778
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3779

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3780
# Body
# {
.annotate 'line', 3782
__ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3783

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3784
# Body
# {
.annotate 'line', 3786
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3787

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3788
# Body
# {
.annotate 'line', 3790
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3791

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3773
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3798
# Body
# {
.annotate 'line', 3800
.return('I')
# }
.annotate 'line', 3801

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3796
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3808
# Body
# {
.annotate 'line', 3810
self.'optimizearg'()
.annotate 'line', 3811
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3812
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3813
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3814
eq $I1, 0, __label_1
.annotate 'line', 3815
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3817
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3819
.return(self)
# }
.annotate 'line', 3820

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3821
# Body
# {
.annotate 'line', 3823
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
.annotate 'line', 3824
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3825
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3826
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 3827
__ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3830
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_8
set $S4, $P1
__label_8:
.annotate 'line', 3831
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3832
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3833
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3834
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3836

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3806
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3843
# Body
# {
.annotate 'line', 3845
self.'optimizearg'()
.annotate 'line', 3846
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3847
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3848
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3849
ne $I1, 0, __label_1
.annotate 'line', 3850
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3852
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3854
.return(self)
# }
.annotate 'line', 3855

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3856
# Body
# {
.annotate 'line', 3858
# string res: $S1
null $S1
.annotate 'line', 3859
if_null __ARG_2, __label_0
.annotate 'line', 3860
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3862
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3863
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3864
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3865
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_6
set $S3, $P1
__label_6:
.annotate 'line', 3866
__ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3869
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_7
set $S4, $P1
__label_7:
.annotate 'line', 3870
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3871
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3872
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3873
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3875

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3841
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3880
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3888
# Body
# {
.annotate 'line', 3890
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
.annotate 'line', 3891
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3892
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3893
self.'annotate'(__ARG_1)
.annotate 'line', 3894
__ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3895

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3896
# Body
# {
.annotate 'line', 3898
band $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3899

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3886
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3906
# Body
# {
.annotate 'line', 3908
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
.annotate 'line', 3909
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3910
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3911
self.'annotate'(__ARG_1)
.annotate 'line', 3912
__ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 3913

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3914
# Body
# {
.annotate 'line', 3916
bor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3917

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3904
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3924
# Body
# {
.annotate 'line', 3926
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
.annotate 'line', 3927
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3928
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3929
self.'annotate'(__ARG_1)
.annotate 'line', 3930
__ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 3931

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3932
# Body
# {
.annotate 'line', 3934
bxor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3935

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 3922
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3943
# Body
# {
.annotate 'line', 3945
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3946
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3947
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3948
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3949
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3951
getattribute $P3, self, 'values'
# predefined push
push $P3, __ARG_4
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3953
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_4
# {
.annotate 'line', 3954
getattribute $P2, __ARG_4, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3955
getattribute $P1, self, 'values'
$P1.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3958
root_new $P2, ['parrot';'ResizablePMCArray']
push $P2, __ARG_3
push $P2, __ARG_4
setattribute self, 'values', $P2
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3959

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3960
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3961
# Body
# {
.annotate 'line', 3963
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3964
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3965
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3966
# int i: $I2
null $I2
# for loop
.annotate 'line', 3967
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3968
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3967
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3969
.return($P2)
# }
.annotate 'line', 3970

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3971
# Body
# {
.annotate 'line', 3973
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3974
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3975
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3976
self.'annotate'(__ARG_1)
.annotate 'line', 3977
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3978
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3979
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3978
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3980
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3981

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3982
# Body
# {
.annotate 'line', 3984
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3985
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3986
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3987
self.'annotate'(__ARG_1)
.annotate 'line', 3988
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3989
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 3990
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_1: # for iteration
.annotate 'line', 3989
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3991
.return($S1)
# }
.annotate 'line', 3992

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3993
# Body
# {
.annotate 'line', 3995
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3996
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3997
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3998
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3999
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3998
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4000

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4001
# Body
# {
.annotate 'line', 4003
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4004
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 4005
self.'annotate'(__ARG_1)
.annotate 'line', 4006
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4007
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 4008
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 4007
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4009

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3940
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3942
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 4016
# Body
# {
.annotate 'line', 4018
self.'optimizearg'()
.annotate 'line', 4019
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4020
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4021
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 4022
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 4023
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 4024
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 4025
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 4026
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 4027
# var t: $P5
null $P5
.annotate 'line', 4028
# string es: $S3
getattribute $P10, $P3, 'str'
null $S3
if_null $P10, __label_6
set $S3, $P10
__label_6:
.annotate 'line', 4029
# string rs: $S4
getattribute $P10, $P4, 'str'
null $S4
if_null $P10, __label_7
set $S4, $P10
__label_7:
.annotate 'line', 4030
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 4031
new $P10, [ 'TokenSingleQuoted' ]
getattribute $P11, $P3, 'file'
getattribute $P12, $P3, 'line'
concat $S5, $S3, $S4
$P10.'TokenSingleQuoted'($P11, $P12, $S5)
set $P5, $P10
goto __label_9
__label_8: # else
.annotate 'line', 4033
new $P13, [ 'TokenQuoted' ]
getattribute $P14, $P3, 'file'
getattribute $P15, $P3, 'line'
concat $S6, $S3, $S4
$P13.'TokenQuoted'($P14, $P15, $S6)
set $P5, $P13
__label_9: # endif
.annotate 'line', 4034
new $P11, [ 'StringLiteral' ]
getattribute $P12, self, 'owner'
$P11.'StringLiteral'($P12, $P5)
set $P10, $P11
.return($P10)
# }
__label_4: # endif
.annotate 'line', 4036
iseq $I3, $S1, 'I'
unless $I3 goto __label_12
iseq $I3, $S2, 'I'
__label_12:
unless $I3 goto __label_11
# {
.annotate 'line', 4037
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 4038
# int ln: $I1
set $P10, $P6
set $I1, $P10
.annotate 'line', 4039
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 4040
# int rn: $I2
set $P10, $P7
set $I2, $P10
.annotate 'line', 4041
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $I3, $I1, $I2
.tailcall 'integerValue'($P10, $P11, $I3)
# }
__label_11: # endif
# {
.annotate 'line', 4044
$P10 = 'floatresult'($S1, $S2)
if_null $P10, __label_13
unless $P10 goto __label_13
# {
.annotate 'line', 4045
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 4046
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 4047
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 4048
# float rf: $N2
# predefined string
set $S5, $P9
set $N2, $S5
.annotate 'line', 4049
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 4053
iseq $I3, $S1, 'S'
unless $I3 goto __label_15
iseq $I3, $S2, 'S'
__label_15:
unless $I3 goto __label_14
# {
.annotate 'line', 4054
new $P11, [ 'ConcatString' ]
getattribute $P12, self, 'owner'
getattribute $P13, self, 'start'
$P11.'ConcatString'($P12, $P13, $P1, $P2)
set $P10, $P11
.return($P10)
# }
__label_14: # endif
.annotate 'line', 4056
.return(self)
# }
.annotate 'line', 4057

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4058
# Body
# {
.annotate 'line', 4060
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4061
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4062
ne $S1, $S2, __label_2
.annotate 'line', 4063
.return($S1)
__label_2: # endif
.annotate 'line', 4064
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 4065
.return('S')
__label_3: # endif
.annotate 'line', 4066
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 4067
.return('S')
__label_5: # endif
.annotate 'line', 4068
$P1 = 'floatresult'($S1, $S2)
if_null $P1, __label_7
unless $P1 goto __label_7
.annotate 'line', 4069
.return('N')
__label_7: # endif
.annotate 'line', 4070
.return('I')
# }
.annotate 'line', 4071

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4072
# Body
# {
.annotate 'line', 4074
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4075
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4076
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4077
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 4078
# string rtype: $S3
$P3 = $P2.'checkresult'()
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4080
# string rleft: $S4
$P3 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 4081
# string rright: $S5
$P3 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_4
set $S5, $P3
__label_4:
.annotate 'line', 4082
ne $S1, 'S', __label_5
# {
.annotate 'line', 4083
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 4084
# string aux: $S6
$P3 = self.'tempreg'('S')
null $S6
if_null $P3, __label_9
set $S6, $P3
__label_9:
.annotate 'line', 4085
eq $S2, 'S', __label_10
# {
.annotate 'line', 4086
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4087
set $S4, $S6
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 4090
__ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4091
set $S5, $S6
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 4094
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4097
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 4098
# string l: $S7
null $S7
.annotate 'line', 4099
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 4101
$P3 = self.'tempreg'('I')
set $S7, $P3
.annotate 'line', 4102
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 4104
# string r: $S8
null $S8
.annotate 'line', 4105
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 4107
$P3 = self.'tempreg'('I')
set $S8, $P3
.annotate 'line', 4108
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 4110
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 4113
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 4115

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4014
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 4122
# Body
# {
.annotate 'line', 4124
self.'optimizearg'()
.annotate 'line', 4125
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4126
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4127
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4128
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4129
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4130
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4131
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 4132
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4133
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 4134
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4135
getattribute $P5, self, 'owner'
getattribute $P6, self, 'start'
sub $I3, $I1, $I2
.tailcall 'integerValue'($P5, $P6, $I3)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4138
.return(self)
# }
.annotate 'line', 4139

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4140
# Body
# {
.annotate 'line', 4142
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4143
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4144
ne $S1, $S2, __label_2
.annotate 'line', 4145
.return($S1)
__label_2: # endif
.annotate 'line', 4146
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 4147
.return('N')
__label_3: # endif
.annotate 'line', 4148
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 4149
.return('N')
__label_5: # endif
.annotate 'line', 4150
.return('I')
# }
.annotate 'line', 4151

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4152
# Body
# {
.annotate 'line', 4154
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4155
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4156
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 4157

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4120
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 4164
# Body
# {
.annotate 'line', 4166
self.'optimizearg'()
.annotate 'line', 4167
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4168
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4169
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4170
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 4171
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 4172
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4173
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 4174
# int ln: $I1
set $P7, $P3
set $I1, $P7
.annotate 'line', 4175
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 4176
# int rn: $I2
set $P7, $P4
set $I2, $P7
.annotate 'line', 4177
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $I3, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I3)
# }
__label_4: # endif
# {
.annotate 'line', 4180
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4181
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 4182
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 4183
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 4184
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 4185
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P7, $P8, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 4189
.return(self)
# }
.annotate 'line', 4190

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4191
# Body
# {
.annotate 'line', 4193
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4194
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4195
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4196
ne $S1, $S2, __label_2
.annotate 'line', 4197
.return($S1)
__label_2: # endif
.annotate 'line', 4198
ne $S1, 'S', __label_3
.annotate 'line', 4199
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 4201
.return('N')
__label_4: # endif
# }
.annotate 'line', 4202

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4203
# Body
# {
.annotate 'line', 4205
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4206
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4207
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4208
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 4209
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 4210
ne $S1, 'S', __label_2
# {
.annotate 'line', 4211
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4212
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4213
# string rval: $S5
null $S5
.annotate 'line', 4214
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 4216
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 4219
$P3 = self.'tempreg'('I')
set $S5, $P3
.annotate 'line', 4220
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 4222
self.'annotate'(__ARG_1)
.annotate 'line', 4223
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 4224
.return()
# }
__label_2: # endif
.annotate 'line', 4226
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
.annotate 'line', 4227
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4228
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4229
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4230
.return()
# }
__label_6: # endif
.annotate 'line', 4235
ne $S1, 'N', __label_10
# {
.annotate 'line', 4236
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4237
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4238
# string rval: $S6
null $S6
.annotate 'line', 4239
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 4241
$P3 = self.'tempreg'('N')
set $S6, $P3
.annotate 'line', 4242
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4243
set $S6, $S4
goto __label_11 # break
__label_14: # case
.annotate 'line', 4246
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 4249
$P4 = self.'tempreg'('N')
set $S6, $P4
.annotate 'line', 4250
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 4252
set $S7, __ARG_2
eq $S7, '', __label_15
# {
.annotate 'line', 4253
self.'annotate'(__ARG_1)
.annotate 'line', 4254
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
__label_15: # endif
.annotate 'line', 4256
.return()
# }
__label_10: # endif
.annotate 'line', 4259
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 4260
$P3 = $P1.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_18
$I3 = $P1.'isidentifier'()
__label_18:
unless $I3 goto __label_16
# {
.annotate 'line', 4261
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S3, $P4
.annotate 'line', 4262
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 4265
$P3 = $P1.'getIntegerValue'()
set $I1, $P3
.annotate 'line', 4266
set $S3, $I1
# }
__label_17: # endif
.annotate 'line', 4268
$P3 = $P2.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_21
$I3 = $P2.'isidentifier'()
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 4269
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S4, $P4
.annotate 'line', 4270
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 4273
set $S7, $S2
set $S8, 'S'
if $S7 == $S8 goto __label_24
set $S8, 'N'
if $S7 == $S8 goto __label_25
set $S8, 'I'
if $S7 == $S8 goto __label_26
goto __label_23
# switch
__label_24: # case
.annotate 'line', 4275
$P4 = self.'checkresult'()
$P3 = self.'tempreg'($P4)
set $S4, $P3
.annotate 'line', 4276
$P2.'emit'(__ARG_1, $S4)
goto __label_22 # break
__label_25: # case
.annotate 'line', 4279
$P5 = $P2.'emit_get'(__ARG_1)
set $S4, $P5
goto __label_22 # break
__label_26: # case
__label_23: # default
.annotate 'line', 4283
$P6 = $P2.'getIntegerValue'()
set $I2, $P6
.annotate 'line', 4284
set $S4, $I2
goto __label_22 # break
__label_22: # switch end
.annotate 'line', 4285
# }
__label_20: # endif
.annotate 'line', 4288
self.'annotate'(__ARG_1)
.annotate 'line', 4289
set $S7, __ARG_2
ne $S7, '', __label_27
.annotate 'line', 4290
$P3 = self.'checkresult'()
__ARG_2 = self.'tempreg'($P3)
__label_27: # endif
.annotate 'line', 4291
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4292

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4162
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 4299
# Body
# {
.annotate 'line', 4301
self.'optimizearg'()
.annotate 'line', 4302
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4303
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4304
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4305
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4306
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4307
# var lval: $P3
null $P3
.annotate 'line', 4308
# var rval: $P4
null $P4
.annotate 'line', 4309
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4310
getattribute $P3, $P1, 'numval'
.annotate 'line', 4311
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4312
getattribute $P4, $P2, 'numval'
.annotate 'line', 4313
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4314
eq $I2, 0, __label_6
.annotate 'line', 4315
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
.annotate 'line', 4318
$P5 = 'floatresult'($S1, $S2)
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 4319
getattribute $P3, $P1, 'numval'
.annotate 'line', 4320
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 4321
getattribute $P4, $P2, 'numval'
.annotate 'line', 4322
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
.annotate 'line', 4323
set $N3, 0
eq $N2, $N3, __label_8
.annotate 'line', 4324
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
.annotate 'line', 4328
.return(self)
# }
.annotate 'line', 4329

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4330
# Body
# {
.annotate 'line', 4332
.return('N')
# }
.annotate 'line', 4333

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4334
# Body
# {
.annotate 'line', 4336
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4337
# var aux: $P2
null $P2
.annotate 'line', 4338
# var lreg: $P3
$P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4339
$P6 = $P1.'checkresult'()
set $S1, $P6
eq $S1, 'N', __label_0
# {
.annotate 'line', 4340
$P2 = self.'tempreg'('N')
.annotate 'line', 4341
__ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4342
set $P3, $P2
# }
__label_0: # endif
.annotate 'line', 4344
# var rexpr: $P4
getattribute $P4, self, 'rexpr'
.annotate 'line', 4345
# var rreg: $P5
$P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4346
$P6 = $P4.'checkresult'()
set $S1, $P6
eq $S1, 'N', __label_1
# {
.annotate 'line', 4347
$P2 = self.'tempreg'('N')
.annotate 'line', 4348
__ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4349
set $P5, $P2
# }
__label_1: # endif
.annotate 'line', 4351
self.'annotate'(__ARG_1)
.annotate 'line', 4352
__ARG_1.'say'('div ', __ARG_2, ', ', $P3, ', ', $P5)
# }
.annotate 'line', 4353

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4297
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4360
# Body
# {
.annotate 'line', 4362
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4363
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4364
self.'annotate'(__ARG_1)
.annotate 'line', 4365
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4366

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4367
# Body
# {
.annotate 'line', 4369
mod $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4370

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4358
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4377
# Body
# {
.annotate 'line', 4379
.return('I')
# }
.annotate 'line', 4380

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4381
# Body
# {
.annotate 'line', 4383
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4384
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4385
self.'annotate'(__ARG_1)
.annotate 'line', 4390
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4391

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4375
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4398
# Body
# {
.annotate 'line', 4400
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
.annotate 'line', 4401
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4402
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4403
self.'annotate'(__ARG_1)
.annotate 'line', 4404
__ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4405

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4406
# Body
# {
.annotate 'line', 4408
shl $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4409

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4396
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4416
# Body
# {
.annotate 'line', 4418
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
.annotate 'line', 4419
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4420
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4421
self.'annotate'(__ARG_1)
.annotate 'line', 4422
__ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4423

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4424
# Body
# {
.annotate 'line', 4426
shr $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4427

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4414
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4436
# Body
# {
.annotate 'line', 4438
setattribute self, 'arg', __ARG_1
.annotate 'line', 4439
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4440

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4441
# Body
# {
.annotate 'line', 4443
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 4444
.return(self)
# }
.annotate 'line', 4445

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4446
# Body
# {
.annotate 'line', 4448
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4449

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 4434
addattribute $P0, 'arg'
.annotate 'line', 4435
addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 4459
# Body
# {
.annotate 'line', 4461
setattribute self, 'owner', __ARG_1
.annotate 'line', 4462
setattribute self, 'start', __ARG_2
.annotate 'line', 4463
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4464
# var t: $P2
$P2 = __ARG_3.'get'()
.annotate 'line', 4465
$P5 = $P2.'isop'(__ARG_4)
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4466
__ARG_3.'unget'($P2)
__label_1: # do
.annotate 'line', 4467
# {
.annotate 'line', 4468
# var modifier: $P3
null $P3
.annotate 'line', 4469
# var expr: $P4
$P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4470
$P2 = __ARG_3.'get'()
.annotate 'line', 4471
$P5 = $P2.'isop'(':')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4472
$P2 = __ARG_3.'get'()
.annotate 'line', 4473
$P5 = $P2.'isop'('[')
if_null $P5, __label_5
unless $P5 goto __label_5
# {
.annotate 'line', 4474
new $P6, [ 'ModifierList' ]
$P6.'ModifierList'(__ARG_3, __ARG_1)
set $P3, $P6
.annotate 'line', 4475
$P2 = __ARG_3.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4478
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4481
new $P6, [ 'Argument' ]
$P6.'Argument'($P4, $P3)
set $P5, $P6
# predefined push
push $P1, $P5
# }
__label_3: # continue
.annotate 'line', 4482
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4483
$P5 = $P2.'isop'(__ARG_4)
isfalse $I1, $P5
unless $I1 goto __label_7
.annotate 'line', 4484
'SyntaxError'("Unfinished argument list", $P2)
__label_7: # endif
.annotate 'line', 4485
# predefined elements
elements $I1, $P1
le $I1, 0, __label_8
.annotate 'line', 4486
setattribute self, 'args', $P1
__label_8: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4488

.end # ArgumentList


.sub 'numargs' :method

.annotate 'line', 4489
# Body
# {
.annotate 'line', 4491
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4492
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.return($I1)
# }
.annotate 'line', 4493

.end # numargs


.sub 'getrawargs' :method

.annotate 'line', 4494
# Body
# {
.annotate 'line', 4496
getattribute $P1, self, 'args'
.return($P1)
# }
.annotate 'line', 4497

.end # getrawargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 4498
# Body
# {
.annotate 'line', 4500
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4501
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 4502

.end # getarg


.sub 'getfreearg' :method
.param int __ARG_1

.annotate 'line', 4503
# Body
# {
.annotate 'line', 4505
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4506
$P2 = $P1[__ARG_1]
getattribute $P3, $P2, 'arg'
.return($P3)
# }
.annotate 'line', 4507

.end # getfreearg


.sub 'optimize' :method

.annotate 'line', 4508
# Body
# {
.annotate 'line', 4510
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4511
if_null $P1, __label_0
.annotate 'line', 4512
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 4513
.return(self)
# }
.annotate 'line', 4514

.end # optimize


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 4515
# Body
# {
.annotate 'line', 4517
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 4518
unless_null $P1, __label_0
# {
.annotate 'line', 4519
# string regs: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4520
# string pnull: $S1
set $S1, ''
.annotate 'line', 4521
set $P1, $P2
.annotate 'line', 4522
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4523
# int nargs: $I1
# predefined elements
elements $I1, $P3
# for loop
.annotate 'line', 4524
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4525
# var a: $P4
$P5 = $P3[$I2]
getattribute $P4, $P5, 'arg'
.annotate 'line', 4526
# string reg: $S2
null $S2
.annotate 'line', 4527
$P5 = $P4.'isnull'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4529
ne $S1, '', __label_6
# {
.annotate 'line', 4530
getattribute $P7, self, 'owner'
$P6 = $P7.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4531
__ARG_1.'emitnull'($S1)
.annotate 'line', 4532
set $S2, $S1
# }
__label_6: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 4536
$P5 = $P4.'emit_get'(__ARG_1)
set $S2, $P5
__label_5: # endif
.annotate 'line', 4537
# predefined push
push $P1, $S2
# }
__label_1: # for iteration
.annotate 'line', 4524
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 4539
setattribute self, 'argregs', $P1
# }
__label_0: # endif
.annotate 'line', 4541
.return($P1)
# }
.annotate 'line', 4542

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 4543
# Body
# {
.annotate 'line', 4545
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4546
# var argreg: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4548
# string sep: $S1
set $S1, ''
.annotate 'line', 4549
# int n: $I1
$P6 = self.'numargs'()
set $I1, $P6
# for loop
.annotate 'line', 4550
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4551
# string a: $S2
$S2 = $P2[$I2]
.annotate 'line', 4552
__ARG_1.'print'($S1, $S2)
.annotate 'line', 4553
# int isflat: $I3
null $I3
# int isnamed: $I4
null $I4
.annotate 'line', 4554
# string setname: $S3
set $S3, ''
.annotate 'line', 4555
# var modifiers: $P3
$P6 = $P1[$I2]
getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4556
if_null $P3, __label_3
# {
.annotate 'line', 4557
$P6 = $P3.'getlist'()
iter $P7, $P6
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4558
# string name: $S4
$P8 = $P4.'getname'()
null $S4
if_null $P8, __label_6
set $S4, $P8
__label_6:
.annotate 'line', 4559
ne $S4, 'flat', __label_7
.annotate 'line', 4560
set $I3, 1
__label_7: # endif
.annotate 'line', 4561
ne $S4, 'named', __label_8
# {
.annotate 'line', 4562
set $I4, 1
.annotate 'line', 4563
$P6 = $P4.'numargs'()
set $I5, $P6
null $I6
if $I5 == $I6 goto __label_11
set $I6, 1
if $I5 == $I6 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4567
# var argmod: $P5
$P5 = $P4.'getarg'(0)
.annotate 'line', 4568
$P8 = $P5.'isstringliteral'()
isfalse $I7, $P8
unless $I7 goto __label_13
.annotate 'line', 4569
getattribute $P9, self, 'start'
'SyntaxError'('Invalid modifier', $P9)
__label_13: # endif
.annotate 'line', 4570
$P10 = $P5.'getPirString'()
set $S3, $P10
goto __label_9 # break
__label_10: # default
.annotate 'line', 4573
getattribute $P11, self, 'start'
'SyntaxError'('Invalid modifier', $P11)
__label_9: # switch end
# }
__label_8: # endif
# }
goto __label_4
__label_5: # endfor
# }
__label_3: # endif
.annotate 'line', 4578
and $I5, $I3, $I4
unless $I5 goto __label_14
.annotate 'line', 4579
__ARG_1.'print'(' :flat :named')
goto __label_15
__label_14: # else
.annotate 'line', 4580
unless $I3 goto __label_16
.annotate 'line', 4581
__ARG_1.'print'(' :flat')
goto __label_17
__label_16: # else
.annotate 'line', 4582
unless $I4 goto __label_18
# {
.annotate 'line', 4583
__ARG_1.'print'(' :named')
.annotate 'line', 4584
eq $S3, '', __label_19
.annotate 'line', 4585
__ARG_1.'print'("(", $S3, ")")
__label_19: # endif
# }
__label_18: # endif
__label_17: # endif
__label_15: # endif
.annotate 'line', 4587
set $S1, ', '
# }
__label_0: # for iteration
.annotate 'line', 4550
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4589

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4454
addattribute $P0, 'owner'
.annotate 'line', 4455
addattribute $P0, 'start'
.annotate 'line', 4456
addattribute $P0, 'args'
.annotate 'line', 4457
addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4592
# Body
# {
.annotate 'line', 4594
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4595
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4596
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4597
.return(1)
# }
.annotate 'line', 4598

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4607
# Body
# {
.annotate 'line', 4609
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4610
setattribute self, 'predef', __ARG_3
.annotate 'line', 4611
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4612

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4613
# Body
# {
.annotate 'line', 4615
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4616

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4617
# Body
# {
.annotate 'line', 4619
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4620
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4621
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4622
# var arg: $P4
null $P4
.annotate 'line', 4623
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
.annotate 'line', 4624
# string pnull: $S1
set $S1, ''
.annotate 'line', 4625
set $I4, $I1
set $I5, -1
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4627
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4628
# string reg: $S2
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4630
ne $S2, 'null', __label_7
# {
.annotate 'line', 4631
ne $S1, '', __label_8
# {
.annotate 'line', 4632
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4633
__ARG_1.'emitnull'($S1)
# }
__label_8: # endif
.annotate 'line', 4635
set $S2, $S1
# }
__label_7: # endif
.annotate 'line', 4637
# predefined push
push $P3, $S2
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4641
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4642
iter $P9, $P2
set $P9, 0
__label_9: # for iteration
unless $P9 goto __label_10
shift $P4, $P9
.annotate 'line', 4643
getattribute $P8, $P4, 'arg'
# predefined push
push $P5, $P8
goto __label_9
__label_10: # endfor
.annotate 'line', 4644
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4645
.return()
__label_1: # default
.annotate 'line', 4647
# int n: $I2
getattribute $P12, self, 'args'
set $I2, $P12
# for loop
.annotate 'line', 4648
# int i: $I3
null $I3
__label_13: # for condition
ge $I3, $I2, __label_12
# {
.annotate 'line', 4649
$P13 = $P2[$I3]
getattribute $P4, $P13, 'arg'
.annotate 'line', 4650
# string argtype: $S3
$P6 = $P4.'checkresult'()
null $S3
if_null $P6, __label_14
set $S3, $P6
__label_14:
.annotate 'line', 4651
# string paramtype: $S4
$P6 = $P1.'paramtype'($I3)
null $S4
if_null $P6, __label_15
set $S4, $P6
__label_15:
.annotate 'line', 4652
# string argr: $S5
null $S5
.annotate 'line', 4653
$P6 = $P4.'isnull'()
if_null $P6, __label_16
unless $P6 goto __label_16
# {
.annotate 'line', 4654
set $S7, $S4
set $S8, 'I'
if $S7 == $S8 goto __label_20
set $S8, 'N'
if $S7 == $S8 goto __label_21
set $S8, 'S'
if $S7 == $S8 goto __label_22
goto __label_19
# switch
__label_20: # case
__label_21: # case
__label_22: # case
.annotate 'line', 4658
$P8 = self.'tempreg'($S4)
set $S5, $P8
.annotate 'line', 4659
__ARG_1.'emitnull'($S5)
__label_19: # default
.annotate 'line', 4661
ne $S1, '', __label_23
# {
.annotate 'line', 4662
$P10 = self.'tempreg'('P')
set $S1, $P10
.annotate 'line', 4663
__ARG_1.'emitnull'($S1)
# }
__label_23: # endif
.annotate 'line', 4665
set $S5, $S1
__label_18: # switch end
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 4669
iseq $I4, $S3, $S4
if $I4 goto __label_26
iseq $I4, $S4, '?'
__label_26:
unless $I4 goto __label_24
.annotate 'line', 4670
$P6 = $P4.'emit_get'(__ARG_1)
set $S5, $P6
goto __label_25
__label_24: # else
# {
.annotate 'line', 4672
# string aux: $S6
null $S6
.annotate 'line', 4673
$P6 = self.'tempreg'($S4)
set $S5, $P6
.annotate 'line', 4674
set $S7, $S4
set $S8, 'P'
if $S7 == $S8 goto __label_29
set $S8, 'I'
if $S7 == $S8 goto __label_30
set $S8, 'N'
if $S7 == $S8 goto __label_31
set $S8, 'S'
if $S7 == $S8 goto __label_32
goto __label_28
# switch
__label_29: # case
.annotate 'line', 4676
set $S9, $S3
set $S10, 'I'
if $S9 == $S10 goto __label_35
set $S10, 'N'
if $S9 == $S10 goto __label_36
set $S10, 'S'
if $S9 == $S10 goto __label_37
goto __label_34
# switch
__label_35: # case
__label_36: # case
__label_37: # case
.annotate 'line', 4680
$P6 = $P4.'emit_get'(__ARG_1)
set $S6, $P6
.annotate 'line', 4681
__ARG_1.'emitbox'($S5, $S6)
goto __label_33 # break
__label_34: # default
.annotate 'line', 4684
$P4.'emit'(__ARG_1, $S5)
__label_33: # switch end
goto __label_27 # break
__label_30: # case
__label_31: # case
__label_32: # case
.annotate 'line', 4690
$P8 = $P4.'emit_get'(__ARG_1)
set $S6, $P8
.annotate 'line', 4691
__ARG_1.'emitset'($S5, $S6)
goto __label_27 # break
__label_28: # default
.annotate 'line', 4694
$P4.'emit'(__ARG_1, $S5)
__label_27: # switch end
# }
__label_25: # endif
# }
__label_17: # endif
.annotate 'line', 4698
# predefined push
push $P3, $S5
# }
__label_11: # for iteration
.annotate 'line', 4648
inc $I3
goto __label_13
__label_12: # for end
__label_0: # switch end
.annotate 'line', 4701
getattribute $P6, self, 'predef'
getattribute $P8, self, 'start'
$P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4702

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4602
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4604
addattribute $P0, 'predef'
.annotate 'line', 4605
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4712
# Body
# {
.annotate 'line', 4714
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4715
setattribute self, 'funref', __ARG_4
.annotate 'line', 4716
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4717
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 4718
__ARG_1.'unget'($P1)
.annotate 'line', 4719
new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
set $P3, $P4
setattribute self, 'args', $P3
# }
__label_0: # endif
# }
.annotate 'line', 4721

.end # CallExpr


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
# var funref: $P1
getattribute $P6, self, 'funref'
$P1 = $P6.'optimize'()
.annotate 'line', 4726
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4727
# int nargs: $I1
null $I1
.annotate 'line', 4728
if_null $P2, __label_0
# {
.annotate 'line', 4729
$P2 = $P2.'optimize'()
.annotate 'line', 4730
$P6 = $P2.'numargs'()
set $I1, $P6
# }
__label_0: # endif
.annotate 'line', 4733
isa $I2, $P1, 'MemberExpr'
unless $I2 goto __label_1
.annotate 'line', 4734
new $P7, [ 'CallMemberExpr' ]
$P7.'CallMemberExpr'(self, $P1, $P2)
set $P6, $P7
.return($P6)
__label_1: # endif
.annotate 'line', 4735
isa $I2, $P1, 'MemberRefExpr'
unless $I2 goto __label_2
.annotate 'line', 4736
new $P7, [ 'CallMemberRefExpr' ]
$P7.'CallMemberRefExpr'(self, $P1, $P2)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4739
$P6 = $P1.'isidentifier'()
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 4740
# string call: $S1
$P7 = $P1.'getName'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 4741
# var predef: $P3
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4742
if_null $P3, __label_5
# {
.annotate 'line', 4743
self.'use_predef'($S1)
.annotate 'line', 4744
# var rawargs: $P4
ne $I1, 0, __label_7
root_new $P6, ['parrot';'ResizablePMCArray']
set $P4, $P6
goto __label_6
__label_7:
$P4 = $P2.'getrawargs'()
__label_6:
.annotate 'line', 4747
# var evalfun: $P5
getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4748
if_null $P5, __label_8
# {
.annotate 'line', 4749
$P6 = 'arglist_hascompilevalue'($P4)
if_null $P6, __label_9
unless $P6 goto __label_9
.annotate 'line', 4750
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
.tailcall $P5($P7, $P8, $P4)
__label_9: # endif
# }
__label_8: # endif
.annotate 'line', 4753
new $P7, [ 'CallPredefExpr' ]
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
$P7.'CallPredefExpr'($P8, $P9, $P3, $P4)
set $P6, $P7
.return($P6)
# }
__label_5: # endif
# }
__label_3: # endif
.annotate 'line', 4757
setattribute self, 'funref', $P1
.annotate 'line', 4758
setattribute self, 'args', $P2
.annotate 'line', 4759
.return(self)
# }
.annotate 'line', 4760

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 4761
# Body
# {
.annotate 'line', 4763
.return(1)
# }
.annotate 'line', 4764

.end # cantailcall


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4765
# Body
# {
.annotate 'line', 4767
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4768
# string call: $S1
null $S1
.annotate 'line', 4769
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4770
$P3 = $P1.'checkIdentifier'()
set $S1, $P3
.annotate 'line', 4771
ne $S1, '', __label_2
.annotate 'line', 4772
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "'"
push $P2, $P3
$P4 = $P1.'getName'()
push $P2, $P4
box $P3, "'"
push $P2, $P3
# predefined join
join $S1, "", $P2
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 4775
$P2 = $P1.'emit_get'(__ARG_1)
set $S1, $P2
__label_1: # endif
.annotate 'line', 4776
.return($S1)
# }
.annotate 'line', 4777

.end # emitcall


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4778
# Body
# {
.annotate 'line', 4780
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4781
# string call: $S1
$P3 = self.'emitcall'(__ARG_1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4782
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4783
if_null $P2, __label_1
.annotate 'line', 4784
$P2.'getargvalues'(__ARG_1)
__label_1: # endif
.annotate 'line', 4786
self.'annotate'(__ARG_1)
.annotate 'line', 4788
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_3
set $S2, __ARG_2
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4789
set $S3, __ARG_2
ne $S3, '.tailcall', __label_4
.annotate 'line', 4790
__ARG_1.'print'('.tailcall ')
goto __label_5
__label_4: # else
.annotate 'line', 4792
__ARG_1.'print'(__ARG_2, ' = ')
__label_5: # endif
# }
__label_2: # endif
.annotate 'line', 4795
__ARG_1.'print'($S1)
.annotate 'line', 4796
__ARG_1.'print'('(')
.annotate 'line', 4797
if_null $P2, __label_6
.annotate 'line', 4798
$P2.'emitargs'(__ARG_1)
__label_6: # endif
.annotate 'line', 4799
__ARG_1.'say'(')')
# }
.annotate 'line', 4800

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4707
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4709
addattribute $P0, 'funref'
.annotate 'line', 4710
addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4810
# Body
# {
.annotate 'line', 4812
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 4813
setattribute self, 'funref', __ARG_2
.annotate 'line', 4814
setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4815

.end # CallMemberExpr


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4816
# Body
# {
.annotate 'line', 4818
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4819
root_new $P2, ['parrot';'ResizablePMCArray']
$P4 = $P1.'emit_left_get'(__ARG_1)
push $P2, $P4
box $P3, ".'"
push $P2, $P3
.annotate 'line', 4820
$P5 = $P1.'get_member'()
.annotate 'line', 4819
push $P2, $P5
box $P3, "'"
push $P2, $P3
# predefined join
join $S1, "", $P2
.return($S1)
# }
.annotate 'line', 4821

.end # emitcall

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 4808
get_class $P1, [ 'CallExpr' ]
addparent $P0, $P1
.end
.namespace [ 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4829
# Body
# {
.annotate 'line', 4831
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 4832
setattribute self, 'funref', __ARG_2
.annotate 'line', 4833
setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4834

.end # CallMemberRefExpr


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4835
# Body
# {
.annotate 'line', 4837
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4838
# var right: $P2
getattribute $P2, $P1, 'right'
.annotate 'line', 4839
# var type: $P3
$P3 = $P2.'checkresult'()
.annotate 'line', 4840
set $S3, $P3
isne $I1, $S3, 'P'
unless $I1 goto __label_1
set $S4, $P3
isne $I1, $S4, 'S'
__label_1:
unless $I1 goto __label_0
.annotate 'line', 4841
getattribute $P4, $P1, 'start'
'SyntaxError'("Invalid expression type in '.*'", $P4)
__label_0: # endif
.annotate 'line', 4844
# string lreg: $S1
$P4 = $P1.'emit_left_get'(__ARG_1)
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4845
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_3
set $S2, $P4
__label_3:
.annotate 'line', 4846
concat $S3, $S1, '.'
concat $S3, $S3, $S2
.return($S3)
# }
.annotate 'line', 4847

.end # emitcall

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 4827
get_class $P1, [ 'CallExpr' ]
addparent $P0, $P1
.end
.namespace [ 'MemberExprBase' ]

.sub 'MemberExprBase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4855
# Body
# {
.annotate 'line', 4857
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4858
setattribute self, 'left', __ARG_3
# }
.annotate 'line', 4859

.end # MemberExprBase


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4860
# Body
# {
.annotate 'line', 4862
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4863
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4864
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4865
eq $S1, 'P', __label_2
# {
.annotate 'line', 4866
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4867
$P2 = self.'tempreg'('P')
set $S2, $P2
.annotate 'line', 4868
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4870
.return($S2)
# }
.annotate 'line', 4871

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 4852
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4854
addattribute $P0, 'left'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4878
# Body
# {
.annotate 'line', 4880
self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4881
setattribute self, 'right', __ARG_4
# }
.annotate 'line', 4882

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4883
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4884
# Body
# {
.annotate 'line', 4886
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4887
.return(self)
# }
.annotate 'line', 4888

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4889
# Body
# {
.annotate 'line', 4891
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4892

.end # get_member


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4893
# Body
# {
.annotate 'line', 4895
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4896
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4897
# string result: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4898
self.'annotate'(__ARG_1)
.annotate 'line', 4899
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4900
.return($S3)
# }
.annotate 'line', 4901

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4902
# Body
# {
.annotate 'line', 4904
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4905
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4906
self.'annotate'(__ARG_1)
.annotate 'line', 4907
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4908

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4909
# Body
# {
.annotate 'line', 4911
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4912

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4913
# Body
# {
.annotate 'line', 4915
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4916
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4917
# string value: $S3
null $S3
.annotate 'line', 4918
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4920
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4921
$P1 = self.'tempreg'('P')
set __ARG_3, $P1
.annotate 'line', 4922
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
.annotate 'line', 4924
set $S3, __ARG_3
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4927
$P1 = self.'tempreg'('P')
set $S3, $P1
.annotate 'line', 4928
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4930
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4931

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4932
# Body
# {
.annotate 'line', 4934
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4935
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4936
# string value: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4937
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_3
unless $P1 goto __label_3
.annotate 'line', 4938
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4940
# string rreg: $S4
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_5
set $S4, $P2
__label_5:
.annotate 'line', 4941
$P1 = __ARG_2.'checkresult'()
set $S5, $P1
eq $S5, 'P', __label_6
.annotate 'line', 4942
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
.annotate 'line', 4944
set $S3, $S4
__label_7: # endif
# }
__label_4: # endif
.annotate 'line', 4946
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4947
.return($S3)
# }
.annotate 'line', 4948

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4874
get_class $P1, [ 'MemberExprBase' ]
addparent $P0, $P1
.annotate 'line', 4876
addattribute $P0, 'right'
.end
.namespace [ 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4956
# Body
# {
.annotate 'line', 4958
self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4959
setattribute self, 'right', __ARG_4
# }
.annotate 'line', 4960

.end # MemberRefExpr


.sub 'checkresult' :method

.annotate 'line', 4961
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4962
# Body
# {
.annotate 'line', 4964
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4965
getattribute $P3, self, 'right'
$P2 = $P3.'optimize'()
setattribute self, 'right', $P2
.annotate 'line', 4966
.return(self)
# }
.annotate 'line', 4967

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4968
# Body
# {
.annotate 'line', 4971
getattribute $P1, self, 'start'
.annotate 'line', 4970
'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 4972

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 4953
get_class $P1, [ 'MemberExprBase' ]
addparent $P0, $P1
.annotate 'line', 4955
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4983
# Body
# {
.annotate 'line', 4985
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4986
setattribute self, 'left', __ARG_4
.annotate 'line', 4987
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4988

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4989
# Body
# {
.annotate 'line', 4991
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4992
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4994
.return('P')
__label_1: # endif
# }
.annotate 'line', 4995

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4996
# Body
# {
.annotate 'line', 4998
# var left: $P1
getattribute $P4, self, 'left'
$P1 = $P4.'optimize'()
.annotate 'line', 4999
setattribute self, 'left', $P1
.annotate 'line', 5000
self.'optimizeargs'()
.annotate 'line', 5004
$I2 = $P1.'isstringliteral'()
unless $I2 goto __label_1
$P4 = self.'numargs'()
set $I3, $P4
iseq $I2, $I3, 1
__label_1:
unless $I2 goto __label_0
# {
.annotate 'line', 5005
# var arg: $P2
$P2 = self.'getarg'(0)
.annotate 'line', 5006
$P4 = $P2.'isintegerliteral'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 5007
# int ival: $I1
$P5 = $P2.'getIntegerValue'()
set $I1, $P5
.annotate 'line', 5008
# string sval: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 5009
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, self, 'start'
getattribute $P5, $P4, 'file'
getattribute $P6, self, 'start'
getattribute $P7, $P6, 'line'
.annotate 'line', 5010
# predefined substr
substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5011
new $P5, [ 'StringLiteral' ]
getattribute $P6, self, 'owner'
$P5.'StringLiteral'($P6, $P3)
set $P4, $P5
.return($P4)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 5014
.return(self)
# }
.annotate 'line', 5015

.end # optimize


.sub 'emit_prep' :method
.param pmc __ARG_1

.annotate 'line', 5016
# Body
# {
.annotate 'line', 5018
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 5019
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 5020
isnull $I1, $P1
not $I1
if $I1 goto __label_1
isnull $I1, $P2
not $I1
__label_1:
unless $I1 goto __label_0
.annotate 'line', 5021
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_args', $P3)
__label_0: # endif
.annotate 'line', 5022
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 5023
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_3
__label_2: # else
.annotate 'line', 5025
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_3: # endif
.annotate 'line', 5026
setattribute self, 'regleft', $P1
.annotate 'line', 5027
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5028
setattribute self, 'argregs', $P2
# }
.annotate 'line', 5029

.end # emit_prep


.sub 'emit_aux' :method
.param pmc __ARG_1

.annotate 'line', 5030
# Body
# {
.annotate 'line', 5032
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 5033
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 5034
isnull $I1, $P1
if $I1 goto __label_1
isnull $I1, $P2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 5035
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
__label_0: # endif
.annotate 'line', 5036
getattribute $P3, self, 'regleft'
__ARG_1.'print'($P3, '[')
.annotate 'line', 5037
getattribute $P3, self, 'argregs'
# predefined join
join $S1, '; ', $P3
__ARG_1.'print'($S1)
.annotate 'line', 5038
__ARG_1.'print'(']')
# }
.annotate 'line', 5039

.end # emit_aux


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5040
# Body
# {
.annotate 'line', 5042
self.'emit_prep'(__ARG_1)
.annotate 'line', 5043
# string type: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 5044
ne $S1, 'S', __label_1
# {
.annotate 'line', 5045
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 5046
# int nargs: $I1
getattribute $P2, self, 'argregs'
# predefined elements
elements $I1, $P2
.annotate 'line', 5047
eq $I1, 1, __label_3
.annotate 'line', 5048
getattribute $P2, self, 'start'
'SyntaxError'('Bad string index', $P2)
__label_3: # endif
.annotate 'line', 5049
set $S2, __ARG_2
ne $S2, '', __label_4
.annotate 'line', 5050
__ARG_2 = self.'tempreg'('S')
__label_4: # endif
.annotate 'line', 5051
getattribute $P2, self, 'regleft'
$P3 = $P1[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 5054
self.'annotate'(__ARG_1)
.annotate 'line', 5055
__ARG_1.'print'(__ARG_2, ' = ')
.annotate 'line', 5056
self.'emit_aux'(__ARG_1)
.annotate 'line', 5057
__ARG_1.'say'('')
# }
__label_2: # endif
# }
.annotate 'line', 5059

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 5060
# Body
# {
.annotate 'line', 5062
self.'emit_prep'(__ARG_1)
.annotate 'line', 5063
self.'annotate'(__ARG_1)
.annotate 'line', 5064
self.'emit_aux'(__ARG_1)
.annotate 'line', 5065
__ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5066

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5067
# Body
# {
.annotate 'line', 5069
self.'emit_prep'(__ARG_1)
.annotate 'line', 5070
# string rreg: $S1
null $S1
.annotate 'line', 5071
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 5072
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5073
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5076
$P1 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P1
__label_1: # endif
.annotate 'line', 5077
self.'annotate'(__ARG_1)
.annotate 'line', 5078
self.'emit_aux'(__ARG_1)
.annotate 'line', 5079
__ARG_1.'say'(' = ', $S1)
.annotate 'line', 5080
.return($S1)
# }
.annotate 'line', 5081

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4977
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4979
addattribute $P0, 'left'
.annotate 'line', 4980
addattribute $P0, 'regleft'
.annotate 'line', 4981
addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5090
# Body
# {
.annotate 'line', 5092
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5093
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 5094
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5095
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 5096
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 5097
# {
.annotate 'line', 5098
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5099
getattribute $P3, self, 'values'
# predefined push
push $P3, $P2
# }
__label_3: # continue
.annotate 'line', 5100
$P1 = __ARG_1.'get'()
$P3 = $P1.'isop'(',')
if_null $P3, __label_2
if $P3 goto __label_1
__label_2: # enddo
.annotate 'line', 5101
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_4
.annotate 'line', 5102
'Expected'("']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 5104

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 5105
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5106
# Body
# {
.annotate 'line', 5108
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5109
.return(self)
# }
.annotate 'line', 5110

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5111
# Body
# {
.annotate 'line', 5113
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 5114
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 5115
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5121
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 5123

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5124
# Body
# {
.annotate 'line', 5126
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5127
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5128
.return($S1)
# }
.annotate 'line', 5129

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 5130
# Body
# {
.annotate 'line', 5132
self.'annotate'(__ARG_1)
.annotate 'line', 5133
# string itemreg: $S1
null $S1
.annotate 'line', 5134
# string it_p: $S2
null $S2
.annotate 'line', 5135
eq __ARG_2, '', __label_0
# {
.annotate 'line', 5136
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5137
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 5139
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 5140
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
.annotate 'line', 5141
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
.annotate 'line', 5143
# string aux: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
.annotate 'line', 5144
eq __ARG_2, '', __label_10
# {
.annotate 'line', 5145
__ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5146
set $S1, $S2
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 5150
$P2 = $P1.'isnull'()
if_null $P2, __label_11
unless $P2 goto __label_11
# {
.annotate 'line', 5151
eq __ARG_2, '', __label_13
# {
.annotate 'line', 5152
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 5153
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 5157
$P2 = $P1.'emit_get'(__ARG_1)
set $S1, $P2
__label_12: # endif
__label_4: # switch end
.annotate 'line', 5159
eq __ARG_2, '', __label_14
# {
.annotate 'line', 5160
self.'annotate'(__ARG_1)
.annotate 'line', 5161
__ARG_1.'say'('push ', __ARG_2, ", ", $S1)
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 5164

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5086
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5088
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5174
# Body
# {
.annotate 'line', 5176
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5177
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5178
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5179
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5180
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_0
# {
.annotate 'line', 5181
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 5182
# {
.annotate 'line', 5183
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5184
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5185
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5186
# predefined push
push $P2, $P4
.annotate 'line', 5187
# predefined push
push $P3, $P5
# }
__label_3: # continue
.annotate 'line', 5189
$P1 = __ARG_1.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 5190
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 5191
'Expected'("',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 5193
setattribute self, 'keys', $P2
.annotate 'line', 5194
setattribute self, 'values', $P3
# }
.annotate 'line', 5195

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 5196
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5197
# Body
# {
.annotate 'line', 5199
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 5200
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5201
.return(self)
# }
.annotate 'line', 5202

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5203
# Body
# {
.annotate 'line', 5205
self.'annotate'(__ARG_1)
.annotate 'line', 5210
set $S6, __ARG_2
eq $S6, '', __label_0
.annotate 'line', 5211
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 5213
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 5214
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5215
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 5216
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 5217
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 5218
# string item: $S1
null $S1
.annotate 'line', 5219
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 5220
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 5221
$P5 = self.'tempreg'('P')
set $S1, $P5
.annotate 'line', 5222
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 5225
$P5 = $P3.'emit_get'(__ARG_1)
set $S1, $P5
__label_5: # endif
.annotate 'line', 5227
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 5228
# string itemreg: $S3
null $S3
.annotate 'line', 5229
$P5 = $P4.'isnull'()
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 5230
set $S6, __ARG_2
eq $S6, '', __label_9
# {
.annotate 'line', 5231
$P6 = self.'tempreg'('P')
set $S3, $P6
.annotate 'line', 5232
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 5235
$P5 = $P4.'isidentifier'()
if_null $P5, __label_10
unless $P5 goto __label_10
# {
.annotate 'line', 5236
# string s: $S4
$P6 = $P4.'checkIdentifier'()
null $S4
if_null $P6, __label_12
set $S4, $P6
__label_12:
.annotate 'line', 5237
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
.annotate 'line', 5238
set $S3, $S4
goto __label_14
__label_13: # else
# {
.annotate 'line', 5240
# string id: $S5
$P5 = $P4.'getName'()
null $S5
if_null $P5, __label_16
set $S5, $P5
__label_16:
.annotate 'line', 5241
getattribute $P6, self, 'owner'
$P5 = $P6.'getvar'($S5)
unless_null $P5, __label_17
# {
.annotate 'line', 5242
$P7 = self.'tempreg'('P')
set $S3, $P7
.annotate 'line', 5243
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 5246
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 5250
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_11: # endif
__label_8: # endif
.annotate 'line', 5251
set $S6, __ARG_2
eq $S6, '', __label_19
.annotate 'line', 5252
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 5216
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 5254

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5255
# Body
# {
.annotate 'line', 5257
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5258
self.'emit'(__ARG_1, $S1)
.annotate 'line', 5259
.return($S1)
# }
.annotate 'line', 5260

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5169
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5171
addattribute $P0, 'keys'
.annotate 'line', 5172
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 5269
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 5270
# Body
# {
.annotate 'line', 5274
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 5275
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5276
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 5277
__ARG_1.'unget'($P2)
.annotate 'line', 5278
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 5279
# {
.annotate 'line', 5280
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5281
# predefined push
push $P3, $P4
# }
__label_3: # continue
.annotate 'line', 5282
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 5283
setattribute self, 'initializer', $P3
.annotate 'line', 5284
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 5286

.end # parseinitializer


.sub 'optimize' :method

.annotate 'line', 5287
# Body
# {
.annotate 'line', 5289
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5290
if_null $P1, __label_0
.annotate 'line', 5291
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 5292
.return(self)
# }
.annotate 'line', 5293

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5265
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5267
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5302
# Body
# {
.annotate 'line', 5304
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5306
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 5307
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 5308
setattribute self, 'value', __ARG_4
.annotate 'line', 5309
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5311
$P2 = $P1.'isop'('(')
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 5312
self.'parseinitializer'(__ARG_1)
goto __label_3
__label_2: # else
.annotate 'line', 5314
__ARG_1.'unget'($P1)
__label_3: # endif
# }
.annotate 'line', 5315

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 5316
# Body
# {
.annotate 'line', 5318
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5319
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5322
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 5323
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 5324
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3.'isconst'()
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 5325
$P5 = $P3.'getid'()
unless_null $P5, __label_4
# {
.annotate 'line', 5326
$P1 = $P3.'getvalue'()
.annotate 'line', 5327
isa $I2, $P1, 'StringLiteral'
not $I1, $I2
unless $I1 goto __label_6
.annotate 'line', 5328
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 5329
getattribute $P6, $P1, 'strval'
setattribute self, 'value', $P6
# }
goto __label_5
__label_4: # else
.annotate 'line', 5332
'SyntaxError'('*Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 5336
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 5337
if_null $P4, __label_7
.annotate 'line', 5338
getattribute $P5, self, 'initializer'
'optimize_array'($P5)
__label_7: # endif
.annotate 'line', 5339
.return(self)
# }
.annotate 'line', 5340

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 5341
# Body
# {
.annotate 'line', 5343
self.'annotate'(__ARG_1)
.annotate 'line', 5345
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5346
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
.annotate 'line', 5349
# int type: $I2
getattribute $P9, self, 'value'
$P8 = $P9.'isstring'()
if_null $P8, __label_3
unless $P8 goto __label_3
null $I2
goto __label_2
__label_3:
.annotate 'line', 5350
getattribute $P11, self, 'value'
$P10 = $P11.'isidentifier'()
if_null $P10, __label_5
unless $P10 goto __label_5
set $I2, 1
goto __label_4
__label_5:
set $I2, -1
__label_4:
__label_2:
.annotate 'line', 5352
# string reginit: $S1
set $S1, ''
.annotate 'line', 5353
# string regnew: $S2
set $P8, __ARG_2
null $S2
if_null $P8, __label_6
set $S2, $P8
__label_6:
.annotate 'line', 5354
# string constructor: $S3
null $S3
.annotate 'line', 5355
set $I3, $I1
null $I4
if $I3 == $I4 goto __label_9
set $I4, 1
if $I3 == $I4 goto __label_10
goto __label_8
# switch
__label_9: # case
goto __label_7 # break
__label_10: # case
.annotate 'line', 5359
ne $I2, 1, __label_11
# {
.annotate 'line', 5360
not $I5, __ARG_3
unless $I5 goto __label_13
.annotate 'line', 5361
$P8 = self.'tempreg'('P')
set $S2, $P8
__label_13: # endif
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 5364
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5365
$P8 = $P2.'emit_get'(__ARG_1)
set $S1, $P8
.annotate 'line', 5366
concat $S0, ', ', $S1
set $S1, $S0
# }
__label_12: # endif
goto __label_7 # break
__label_8: # default
.annotate 'line', 5370
eq $I2, 1, __label_14
.annotate 'line', 5371
getattribute $P8, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P8)
__label_14: # endif
.annotate 'line', 5372
not $I3, __ARG_3
unless $I3 goto __label_15
.annotate 'line', 5373
$P9 = self.'tempreg'('P')
set $S2, $P9
__label_15: # endif
__label_7: # switch end
.annotate 'line', 5376
set $I3, $I2
null $I4
if $I3 == $I4 goto __label_18
set $I4, 1
if $I3 == $I4 goto __label_19
goto __label_17
# switch
__label_18: # case
.annotate 'line', 5379
# string name: $S4
getattribute $P9, self, 'value'
$P8 = $P9.'rawstring'()
null $S4
if_null $P8, __label_20
set $S4, $P8
__label_20:
.annotate 'line', 5380
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 5381
isnull $I5, $P3
unless $I5 goto __label_22
$I5 = self.'dowarnings'()
__label_22:
unless $I5 goto __label_21
.annotate 'line', 5382
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
getattribute $P10, self, 'value'
'Warn'($S6, $P10)
__label_21: # endif
.annotate 'line', 5386
getattribute $P11, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P11, " ]", $S1)
.annotate 'line', 5387
le $I1, 1, __label_23
# {
.annotate 'line', 5388
getattribute $P12, self, 'value'
__ARG_1.'say'($S2, ".'", $P12, "'()")
# }
__label_23: # endif
goto __label_16 # break
__label_19: # case
.annotate 'line', 5392
# var id: $P4
getattribute $P8, self, 'owner'
getattribute $P9, self, 'value'
$P4 = $P8.'getvar'($P9)
.annotate 'line', 5393
unless_null $P4, __label_24
# {
.annotate 'line', 5395
# var cl: $P5
getattribute $P10, self, 'owner'
getattribute $P11, self, 'value'
$P5 = $P10.'checkclass'($P11)
.annotate 'line', 5396
if_null $P5, __label_26
# {
.annotate 'line', 5397
$P8 = $P5.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P8, $S1)
# }
goto __label_27
__label_26: # else
# {
.annotate 'line', 5400
$P8 = self.'dowarnings'()
if_null $P8, __label_28
unless $P8 goto __label_28
.annotate 'line', 5401
'Warn'('Checking: new unknown type')
__label_28: # endif
.annotate 'line', 5402
getattribute $P8, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P8, "']", $S1)
# }
__label_27: # endif
.annotate 'line', 5404
getattribute $P8, self, 'value'
set $S3, $P8
# }
goto __label_25
__label_24: # else
# {
.annotate 'line', 5408
$P8 = $P4.'getreg'()
__ARG_1.'say'('new ', $S2, ", ", $P8, "", $S1)
# }
__label_25: # endif
goto __label_16 # break
__label_17: # default
.annotate 'line', 5412
'InternalError'('Unexpected type in new')
__label_16: # switch end
.annotate 'line', 5414
isgt $I3, $I1, 1
if $I3 goto __label_30
isgt $I3, $I1, 0
unless $I3 goto __label_31
iseq $I3, $I2, 1
__label_31:
__label_30:
unless $I3 goto __label_29
# {
.annotate 'line', 5415
# string argregs: $P6
root_new $P6, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5416
iter $P13, $P1
set $P13, 0
__label_32: # for iteration
unless $P13 goto __label_33
shift $P7, $P13
# {
.annotate 'line', 5417
# string reg: $S5
$P8 = $P7.'emit_get'(__ARG_1)
null $S5
if_null $P8, __label_34
set $S5, $P8
__label_34:
.annotate 'line', 5418
# predefined push
push $P6, $S5
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 5420
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 5421
# predefined join
join $S6, ", ", $P6
__ARG_1.'print'($S6)
.annotate 'line', 5422
__ARG_1.'say'(")")
.annotate 'line', 5423
not $I3, __ARG_3
unless $I3 goto __label_35
.annotate 'line', 5424
__ARG_1.'emitset'(__ARG_2, $S2)
__label_35: # endif
# }
__label_29: # endif
# }
.annotate 'line', 5426

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5427
# Body
# {
.annotate 'line', 5429
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5430

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5298
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5300
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5439
# Body
# {
.annotate 'line', 5441
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5442
setattribute self, 'owner', __ARG_2
.annotate 'line', 5443
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5444
setattribute self, 'nskey', $P1
.annotate 'line', 5445
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5446
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5447
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5449
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5450

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5451
# Body
# {
.annotate 'line', 5453
# string reginit: $S1
null $S1
.annotate 'line', 5454
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5455
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5456
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
.annotate 'line', 5460
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5461
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 5464
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 5466
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 5467
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 5468
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 5469
__ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5470
null $P4
$P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5471
if_null $S1, __label_7
.annotate 'line', 5472
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 5473
__ARG_1.'say'()
# }
.annotate 'line', 5474

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5435
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5437
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5483
# Body
# {
.annotate 'line', 5485
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5486
setattribute self, 'owner', __ARG_2
.annotate 'line', 5487
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5488
setattribute self, 'nskey', $P1
.annotate 'line', 5489
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5490
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5491
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5493
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5494

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5495
# Body
# {
.annotate 'line', 5497
# string reginit: $S1
null $S1
.annotate 'line', 5498
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5500
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5501
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 5502
le $I1, 0, __label_3
.annotate 'line', 5503
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 5504
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 5505
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 5506
getattribute $P5, self, 'owner'
$P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5507
__ARG_1.'say'()
.annotate 'line', 5509
le $I1, 0, __label_4
# {
.annotate 'line', 5510
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5511
iter $P6, $P1
set $P6, 0
__label_5: # for iteration
unless $P6 goto __label_6
shift $P4, $P6
# {
.annotate 'line', 5512
# string reg: $S3
$P5 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 5513
# predefined push
push $P3, $S3
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 5515
# string constructor: $S4
$P5 = $P2.'last'()
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
.annotate 'line', 5516
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 5517
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 5518
__ARG_1.'say'(")")
.annotate 'line', 5519
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 5521

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5479
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5481
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5526
# Body
# {
.annotate 'line', 5528
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5530
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 5532
new $P5, [ 'CallExpr' ]
.annotate 'line', 5533
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 5532
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5535
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 5537
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 5539
$P3 = $P1.'isidentifier'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 5542
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5543
__ARG_1.'unget'($P2)
.annotate 'line', 5544
$P3 = $P2.'isop'('.')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 5546
new $P5, [ 'NewQualifiedExpr' ]
$P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P4, $P5
.return($P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5550
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
.annotate 'line', 5555
new $P4, [ 'NewExpr' ]
$P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P3, $P4
.return($P3)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5557

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5566
# Body
# {
.annotate 'line', 5568
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5569
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5570
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 5571

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 5572
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5573
# Body
# {
.annotate 'line', 5575
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 5576
# string checkedval: $S1
null $S1
.annotate 'line', 5577
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5578
$P3 = $P1.'getidentifier'()
set $S1, $P3
.annotate 'line', 5579
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
# }
goto __label_1
__label_0: # else
.annotate 'line', 5582
set $S1, $P1
__label_1: # endif
.annotate 'line', 5583
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 5584
self.'annotate'(__ARG_1)
.annotate 'line', 5585
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 5586

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5561
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5563
addattribute $P0, 'lexpr'
.annotate 'line', 5564
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5601
# Body
# {
.annotate 'line', 5603
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5604
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 5605
setattribute self, 'etrue', __ARG_4
.annotate 'line', 5606
setattribute self, 'efalse', __ARG_5
.annotate 'line', 5607
.return(self)
# }
.annotate 'line', 5608

.end # set


.sub 'optimize' :method

.annotate 'line', 5609
# Body
# {
.annotate 'line', 5611
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 5612
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
.annotate 'line', 5614
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 5616
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 5618
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 5619
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 5620
.return(self)
__label_0: # switch end
# }
.annotate 'line', 5622

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5623
# Body
# {
.annotate 'line', 5625
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 5626

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5627
# Body
# {
.annotate 'line', 5629
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5630
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5631
getattribute $P1, self, 'condition'
$P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5632
getattribute $P1, self, 'etrue'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5633
__ARG_1.'emitgoto'($S1)
.annotate 'line', 5634
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5635
getattribute $P1, self, 'efalse'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5636
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5637

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5591
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5597
addattribute $P0, 'condition'
.annotate 'line', 5598
addattribute $P0, 'etrue'
.annotate 'line', 5599
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
# Constant Code_exists evaluated at compile time

.sub 'getOpCode_2'
.param pmc __ARG_1

.annotate 'line', 5679
# Body
# {
.annotate 'line', 5681
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
.annotate 'line', 5682
.return(1)
__label_3: # case
.annotate 'line', 5683
.return(2)
__label_4: # case
.annotate 'line', 5684
.return(3)
__label_1: # default
.annotate 'line', 5685
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5687

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5689
# Body
# {
.annotate 'line', 5691
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
.annotate 'line', 5692
.return(8)
__label_3: # case
.annotate 'line', 5693
.return(11)
__label_4: # case
.annotate 'line', 5694
.return(9)
__label_5: # case
.annotate 'line', 5695
.return(10)
__label_1: # default
.annotate 'line', 5697
$P2 = __ARG_1.'iskeyword'('delete')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(31)
goto __label_7
__label_6: # else
.annotate 'line', 5698
$P3 = __ARG_1.'iskeyword'('exists')
if_null $P3, __label_8
unless $P3 goto __label_8
.return(32)
goto __label_9
__label_8: # else
.annotate 'line', 5699
.return(0)
__label_9: # endif
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5701

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5703
# Body
# {
.annotate 'line', 5705
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
.annotate 'line', 5706
.return(19)
__label_3: # case
.annotate 'line', 5707
.return(20)
__label_4: # case
.annotate 'line', 5708
.return(21)
__label_5: # case
.annotate 'line', 5709
.return(22)
__label_1: # default
.annotate 'line', 5710
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5712

.end # getOpCode_5


.sub 'getOpCode_7'
.param pmc __ARG_1

.annotate 'line', 5714
# Body
# {
.annotate 'line', 5716
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '<<'
if $S1 == $S2 goto __label_2
set $S2, '>>'
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5717
.return(28)
__label_3: # case
.annotate 'line', 5718
.return(29)
__label_1: # default
.annotate 'line', 5719
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5721

.end # getOpCode_7


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5723
# Body
# {
.annotate 'line', 5725
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
.annotate 'line', 5726
.return(14)
__label_3: # case
.annotate 'line', 5727
.return(16)
__label_4: # case
.annotate 'line', 5728
.return(15)
__label_5: # case
.annotate 'line', 5729
.return(17)
__label_1: # default
.annotate 'line', 5731
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5732
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5734

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5736
# Body
# {
.annotate 'line', 5738
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
.annotate 'line', 5739
.return(12)
__label_3: # case
.annotate 'line', 5740
.return(13)
__label_4: # case
.annotate 'line', 5741
.return(25)
__label_5: # case
.annotate 'line', 5742
.return(26)
__label_1: # default
.annotate 'line', 5743
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5745

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5747
# Body
# {
.annotate 'line', 5749
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
.annotate 'line', 5750
.return(4)
__label_3: # case
.annotate 'line', 5751
.return(5)
__label_4: # case
.annotate 'line', 5752
.return(6)
__label_5: # case
.annotate 'line', 5753
.return(18)
__label_6: # case
.annotate 'line', 5754
.return(23)
__label_7: # case
.annotate 'line', 5755
.return(24)
__label_8: # case
.annotate 'line', 5756
.return(30)
__label_1: # default
.annotate 'line', 5757
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5759

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5761
# Body
# {
.annotate 'line', 5763
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5765
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5766
# var expr: $P2
null $P2
.annotate 'line', 5767
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5768
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5769
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5770
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5772
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5773
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5774
$P4 = $P1.'isop'('{')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 5775
new $P6, [ 'HashExpr' ]
$P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 5776
$P4 = $P1.'isstring'()
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5777
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_3: # endif
.annotate 'line', 5778
$P4 = $P1.'isint'()
if_null $P4, __label_4
unless $P4 goto __label_4
.annotate 'line', 5779
new $P6, [ 'IntegerLiteral' ]
$P6.'IntegerLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_4: # endif
.annotate 'line', 5780
$P4 = $P1.'isfloat'()
if_null $P4, __label_5
unless $P4 goto __label_5
.annotate 'line', 5781
new $P6, [ 'FloatLiteral' ]
$P6.'FloatLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_5: # endif
.annotate 'line', 5782
$P4 = $P1.'checkkeyword'()
set $S1, $P4
set $S2, 'new'
if $S1 == $S2 goto __label_8
set $S2, 'function'
if $S1 == $S2 goto __label_9
set $S2, 'class'
if $S1 == $S2 goto __label_10
goto __label_7
# switch
__label_8: # case
.annotate 'line', 5784
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_9: # case
.annotate 'line', 5786
new $P6, [ 'FunctionExpr' ]
$P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_10: # case
.annotate 'line', 5788
new $P8, [ 'OpClassExpr' ]
$P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
set $P7, $P8
.return($P7)
__label_7: # default
__label_6: # switch end
.annotate 'line', 5790
$P4 = $P1.'isidentifier'()
if_null $P4, __label_11
unless $P4 goto __label_11
.annotate 'line', 5791
new $P6, [ 'IdentifierExpr' ]
$P6.'IdentifierExpr'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_11: # endif
.annotate 'line', 5792
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5793

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5795
# Body
# {
.annotate 'line', 5797
.const 'Sub' $P5 = 'parseExpr_0'
.annotate 'line', 5798
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 5800
# var subexp: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5801
# var t: $P2
null $P2
.annotate 'line', 5802
# var start: $P3
null $P3
.annotate 'line', 5803
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5804
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5805
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
.annotate 'line', 5807
new $P8, [ 'CallExpr' ]
$P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_5: # case
.annotate 'line', 5810
new $P9, [ 'IndexExpr' ]
$P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P9
goto __label_2 # break
__label_6: # case
.annotate 'line', 5813
set $P3, $P2
.annotate 'line', 5814
$P2 = __ARG_1.'get'()
.annotate 'line', 5815
$P10 = $P2.'isop'('*')
if_null $P10, __label_7
unless $P10 goto __label_7
# {
.annotate 'line', 5816
# var right: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5817
new $P7, [ 'MemberRefExpr' ]
$P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
set $P1, $P7
# }
goto __label_8
__label_7: # else
.annotate 'line', 5820
new $P7, [ 'MemberExpr' ]
$P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
set $P1, $P7
__label_8: # endif
goto __label_2 # break
__label_3: # default
.annotate 'line', 5823
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5826
__ARG_1.'unget'($P2)
.annotate 'line', 5827
.return($P1)
# }
.annotate 'line', 5828

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5830
# Body
# {
.annotate 'line', 5832
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5834
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5835
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5836
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5837
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5838
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5839
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5842
__ARG_1.'unget'($P2)
.annotate 'line', 5843
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5845

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5847
# Body
# {
.annotate 'line', 5849
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5850
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5851
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5853
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5854
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5855
# var subexpr: $P2
null $P2
.annotate 'line', 5856
eq $I1, 0, __label_0
# {
.annotate 'line', 5857
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5858
# var oper: $P3
null $P3
.annotate 'line', 5859
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
set $I3, 32
if $I2 == $I3 goto __label_9
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5861
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5864
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5867
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5870
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5873
new $P3, [ 'OpDeleteExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5876
new $P3, [ 'OpExistsExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5879
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5881
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5884
__ARG_1.'unget'($P1)
.annotate 'line', 5885
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5887
.return($P2)
# }
.annotate 'line', 5888

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5890
# Body
# {
.annotate 'line', 5892
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5893
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5895
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5896
# var t: $P2
null $P2
.annotate 'line', 5897
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5898
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5899
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5900
# var aux: $P4
null $P4
.annotate 'line', 5901
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
.annotate 'line', 5903
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5906
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5909
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5912
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5915
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5917
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5918
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5920
__ARG_1.'unget'($P2)
.annotate 'line', 5921
.return($P1)
# }
.annotate 'line', 5922

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5924
# Body
# {
.annotate 'line', 5926
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5928
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5929
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5930
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5931
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5932
# var expr: $P4
null $P4
.annotate 'line', 5933
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5934
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5936
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
.annotate 'line', 5937
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5939
__ARG_1.'unget'($P2)
.annotate 'line', 5940
.return($P1)
# }
.annotate 'line', 5941

.end # parseExpr_6


.sub 'parseExpr_7'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5943
# Body
# {
.annotate 'line', 5945
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5947
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5948
# var rexpr: $P2
null $P2
.annotate 'line', 5949
# var t: $P3
null $P3
.annotate 'line', 5950
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5951
$P3 = __ARG_1.'get'()
$P5 = 'getOpCode_7'($P3)
set $I1, $P5
eq $I1, 0, __label_0
# {
.annotate 'line', 5952
set $I2, $I1
set $I3, 28
if $I2 == $I3 goto __label_4
set $I3, 29
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5954
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5955
new $P6, [ 'OpShiftleftExpr' ]
$P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5958
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5959
new $P7, [ 'OpShiftrightExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5962
'InternalError'('Invalid code in parseExpr_7', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5965
__ARG_1.'unget'($P3)
.annotate 'line', 5966
.return($P1)
# }
.annotate 'line', 5967

.end # parseExpr_7


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5969
# Body
# {
.annotate 'line', 5971
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 5972
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5974
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5975
# var rexpr: $P2
null $P2
.annotate 'line', 5976
# var t: $P3
null $P3
.annotate 'line', 5977
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5978
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5979
set $I2, $I1
set $I3, 14
if $I2 == $I3 goto __label_4
set $I3, 16
if $I2 == $I3 goto __label_5
set $I3, 15
if $I2 == $I3 goto __label_6
set $I3, 17
if $I2 == $I3 goto __label_7
set $I3, 27
if $I2 == $I3 goto __label_8
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5981
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5982
new $P7, [ 'OpLessExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5985
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5986
new $P8, [ 'OpGreaterExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5989
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5990
new $P9, [ 'OpLessEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5993
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5994
new $P10, [ 'OpGreaterEqualExpr' ]
$P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_8: # case
.annotate 'line', 5997
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 6000
'InternalError'('Invalid code in parseExpr_9', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6003
__ARG_1.'unget'($P3)
.annotate 'line', 6004
.return($P1)
# }
.annotate 'line', 6005

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6007
# Body
# {
.annotate 'line', 6009
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 6010
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6012
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6013
# var rexpr: $P2
null $P2
.annotate 'line', 6014
# var t: $P3
null $P3
.annotate 'line', 6015
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 6016
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 6017
set $I2, $I1
set $I3, 12
if $I2 == $I3 goto __label_4
set $I3, 13
if $I2 == $I3 goto __label_5
set $I3, 25
if $I2 == $I3 goto __label_6
set $I3, 26
if $I2 == $I3 goto __label_7
goto __label_3
# switch
__label_4: # case
.annotate 'line', 6019
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6020
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 6023
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6024
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 6027
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6028
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 6031
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6032
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_3: # default
.annotate 'line', 6035
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6038
__ARG_1.'unget'($P3)
.annotate 'line', 6039
.return($P1)
# }
.annotate 'line', 6040

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6042
# Body
# {
.annotate 'line', 6044
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6046
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6047
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6048
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6049
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6050
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6052
__ARG_1.'unget'($P2)
.annotate 'line', 6053
.return($P1)
# }
.annotate 'line', 6054

.end # parseExpr_10


.sub 'parseExpr_11'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6056
# Body
# {
.annotate 'line', 6058
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6060
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6061
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6062
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('^')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6063
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6064
new $P5, [ 'OpBinXorExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6066
__ARG_1.'unget'($P2)
.annotate 'line', 6067
.return($P1)
# }
.annotate 'line', 6068

.end # parseExpr_11


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6070
# Body
# {
.annotate 'line', 6072
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6074
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6075
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6076
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6077
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6078
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6080
__ARG_1.'unget'($P2)
.annotate 'line', 6081
.return($P1)
# }
.annotate 'line', 6082

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6084
# Body
# {
.annotate 'line', 6086
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6088
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6089
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6090
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6091
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6092
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6094
__ARG_1.'unget'($P2)
.annotate 'line', 6095
.return($P1)
# }
.annotate 'line', 6096

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6098
# Body
# {
.annotate 'line', 6100
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6102
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6103
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6104
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6105
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6106
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6108
__ARG_1.'unget'($P2)
.annotate 'line', 6109
.return($P1)
# }
.annotate 'line', 6110

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6112
# Body
# {
.annotate 'line', 6114
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6115
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6117
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6118
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 6119
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 6120
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6121
'ExpectOp'(':', __ARG_1)
.annotate 'line', 6122
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6123
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 6126
__ARG_1.'unget'($P2)
.annotate 'line', 6127
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 6129

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6131
# Body
# {
.annotate 'line', 6133
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6134
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 6135
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6137
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6138
# var t: $P2
null $P2
.annotate 'line', 6139
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 6140
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 6141
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6142
# var expr: $P4
null $P4
.annotate 'line', 6143
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
.annotate 'line', 6145
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 6148
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 6151
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 6154
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 6157
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 6160
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_10: # case
.annotate 'line', 6163
new $P4, [ 'OpModToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 6166
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 6168
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6169
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6171
__ARG_1.'unget'($P2)
.annotate 'line', 6172
.return($P1)
# }
.annotate 'line', 6173

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6175
# Body
# {
.annotate 'line', 6177
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6179
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6180

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 6193
# Body
# {
.annotate 'line', 6195
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 6196
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 6197
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 6198
box $P1, $S1
setattribute self, 'brlabel', $P1
.annotate 'line', 6199
.return($S1)
# }
.annotate 'line', 6200

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6201
# Body
# {
.annotate 'line', 6203
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 6204
unless_null $P1, __label_0
.annotate 'line', 6205
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 6206
.return($P1)
# }
.annotate 'line', 6207

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 6191
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 6214
# Body
# {
.annotate 'line', 6216
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 6217
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 6218
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 6219
box $P1, $S1
setattribute self, 'cntlabel', $P1
.annotate 'line', 6220
.return($S1)
# }
.annotate 'line', 6221

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6222
# Body
# {
.annotate 'line', 6224
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 6225
unless_null $P1, __label_0
.annotate 'line', 6226
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 6227
.return($P1)
# }
.annotate 'line', 6228

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 6210
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 6212
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6242
# Body
# {
.annotate 'line', 6244
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6245
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6246
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6247
__ARG_2.'unget'($P1)
.annotate 'line', 6248
new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
set $P3, $P4
setattribute self, 'values', $P3
# }
__label_0: # endif
# }
.annotate 'line', 6250

.end # parse


.sub 'optimize' :method

.annotate 'line', 6251
# Body
# {
.annotate 'line', 6253
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 6254
if_null $P1, __label_0
.annotate 'line', 6255
$P1 = $P1.'optimize'()
__label_0: # endif
.annotate 'line', 6256
.return(self)
# }
.annotate 'line', 6257

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6258
# Body
# {
.annotate 'line', 6261
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 6262
# int n: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined int
$P3 = $P1.'numargs'()
set $I1, $P3
__label_0:
.annotate 'line', 6265
iseq $I2, $I1, 1
unless $I2 goto __label_3
isa $I2, self, 'ReturnStatement'
__label_3:
unless $I2 goto __label_2
# {
.annotate 'line', 6266
# var func: $P2
$P2 = $P1.'getfreearg'(0)
.annotate 'line', 6267
$P3 = $P2.'cantailcall'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 6268
self.'annotate'(__ARG_1)
.annotate 'line', 6269
.tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
__label_4: # endif
# }
__label_2: # endif
.annotate 'line', 6273
le $I1, 0, __label_5
.annotate 'line', 6274
$P1.'getargvalues'(__ARG_1)
__label_5: # endif
.annotate 'line', 6276
self.'annotate'(__ARG_1)
.annotate 'line', 6277
self.'emitret'(__ARG_1)
.annotate 'line', 6278
le $I1, 0, __label_6
.annotate 'line', 6279
$P1.'emitargs'(__ARG_1)
__label_6: # endif
.annotate 'line', 6280
__ARG_1.'say'(')')
# }
.annotate 'line', 6281

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6238
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6240
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6286
# Body
# {
.annotate 'line', 6288
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6289

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6290
# Body
# {
.annotate 'line', 6292
__ARG_1.'print'('.return(')
# }
.annotate 'line', 6293

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6284
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6298
# Body
# {
.annotate 'line', 6300
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6301

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6302
# Body
# {
.annotate 'line', 6304
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 6305

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6296
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6316
# Body
# {
.annotate 'line', 6318
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6319
setattribute self, 'name', __ARG_1
.annotate 'line', 6320
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6321
box $P1, $S1
setattribute self, 'value', $P1
# }
.annotate 'line', 6322

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 6323
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6324
# Body
# {
.annotate 'line', 6326
self.'annotate'(__ARG_1)
.annotate 'line', 6327
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6328
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 6329
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6330

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6312
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6314
addattribute $P0, 'name'
.annotate 'line', 6315
addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 6342
# Body
# {
.annotate 'line', 6344
setattribute self, 'owner', __ARG_1
.annotate 'line', 6345
box $P1, __ARG_2
setattribute self, 'label', $P1
# }
.annotate 'line', 6346

.end # Reflabel


.sub 'optimize' :method

.annotate 'line', 6347
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 6348
# Body
# {
.annotate 'line', 6350
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6351
# string value: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6352
.return($S2)
# }
.annotate 'line', 6353

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6339
addattribute $P0, 'owner'
.annotate 'line', 6340
addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6364
# Body
# {
.annotate 'line', 6366
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6367
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6368
'RequireIdentifier'($P1)
.annotate 'line', 6369
setattribute self, 'label', $P1
.annotate 'line', 6370
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6371

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 6372
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6373
# Body
# {
.annotate 'line', 6375
self.'annotate'(__ARG_1)
.annotate 'line', 6376
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6377
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6378
concat $S3, 'goto ', $S1
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6379

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6360
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6362
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 6388
# Body
# {
.annotate 'line', 6390
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 6391

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 6392
# Body
# {
.annotate 'line', 6394
'ExpectOp'('(', __ARG_1)
.annotate 'line', 6395
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 6396
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6397

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6386
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

.annotate 'line', 6408
# Body
# {
.annotate 'line', 6410
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6411
self.'parsecondition'(__ARG_2)
.annotate 'line', 6412
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 6413
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6414
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6415
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 6417
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 6418
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 6420

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 6421
# Body
# {
.annotate 'line', 6423
self.'optimize_condition'()
.annotate 'line', 6424
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 6425
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 6426
getattribute $P3, self, 'falsebranch'
$P2 = $P3.'optimize'()
setattribute self, 'falsebranch', $P2
.annotate 'line', 6427
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6429
getattribute $P1, self, 'truebranch'
.return($P1)
__label_3: # case
.annotate 'line', 6431
getattribute $P2, self, 'falsebranch'
.return($P2)
__label_1: # default
__label_0: # switch end
.annotate 'line', 6433
.return(self)
# }
.annotate 'line', 6434

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6435
# Body
# {
.annotate 'line', 6437
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 6438
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 6439
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 6440
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 6441
# string elselabel: $S1
set $S1, ''
.annotate 'line', 6442
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 6443
$P3 = self.'genlabel'()
set $S1, $P3
__label_0: # endif
.annotate 'line', 6444
# string endlabel: $S2
$P3 = self.'genlabel'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6445
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 6446
self.'annotate'(__ARG_1)
.annotate 'line', 6447
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6448
$P1.'emit'(__ARG_1)
.annotate 'line', 6450
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 6451
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6452
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6453
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 6455
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6456

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6404
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 6406
addattribute $P0, 'truebranch'
.annotate 'line', 6407
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 6466
# Body
# {
.annotate 'line', 6468
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 6469

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 6470
# Body
# {
.annotate 'line', 6472
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6473
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6475
self.'annotate'(__ARG_1)
.annotate 'line', 6476
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6477
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6478
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6479
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6480

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6463
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 6465
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6489
# Body
# {
.annotate 'line', 6491
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6492
self.'parsecondition'(__ARG_2)
.annotate 'line', 6493
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6494

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 6495
# Body
# {
.annotate 'line', 6497
self.'optimize_condition'()
.annotate 'line', 6498
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6499
.return(self)
# }
.annotate 'line', 6500

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6501
# Body
# {
.annotate 'line', 6503
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6505
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 6508
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 6511
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 6512
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 6514
self.'annotate'(__ARG_1)
.annotate 'line', 6515
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6516
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6517
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 6518
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6519
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 6521

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6487
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

.annotate 'line', 6530
# Body
# {
.annotate 'line', 6532
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6533
self.'parsebody'(__ARG_2)
.annotate 'line', 6534
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6535
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6536

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 6537
# Body
# {
.annotate 'line', 6539
self.'optimize_condition'()
.annotate 'line', 6540
# var body: $P1
getattribute $P2, self, 'body'
$P1 = $P2.'optimize'()
.annotate 'line', 6541
$I1 = $P1.'isempty'()
unless $I1 goto __label_1
$P2 = self.'getvalue'()
set $I2, $P2
iseq $I1, $I2, 2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 6542
new $P3, [ 'EmptyStatement' ]
.return($P3)
__label_0: # endif
.annotate 'line', 6543
setattribute self, 'body', $P1
.annotate 'line', 6544
.return(self)
# }
.annotate 'line', 6545

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6546
# Body
# {
.annotate 'line', 6548
# var body: $P1
getattribute $P1, self, 'body'
.annotate 'line', 6549
# int condvalue: $I1
$P2 = self.'getvalue'()
set $I1, $P2
.annotate 'line', 6550
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6552
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 6555
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 6556
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 6557
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 6559
self.'annotate'(__ARG_1)
.annotate 'line', 6560
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6562
$P1.'emit'(__ARG_1)
.annotate 'line', 6563
__ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6564
eq $I1, 2, __label_6
.annotate 'line', 6565
self.'emit_if'(__ARG_1, $S1, $S2)
__label_6: # endif
.annotate 'line', 6566
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 6568

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6528
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

.annotate 'line', 6577
# Body
# {
.annotate 'line', 6579
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6580
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6581

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 6582
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6583
# Body
# {
.annotate 'line', 6585
self.'annotate'(__ARG_1)
.annotate 'line', 6586
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6587
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6588

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6575
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6597
# Body
# {
.annotate 'line', 6599
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6600
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6601

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 6602
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6603
# Body
# {
.annotate 'line', 6605
self.'annotate'(__ARG_1)
.annotate 'line', 6606
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6607
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6608

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6595
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6622
# Body
# {
.annotate 'line', 6624
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6625
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6626
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6627
'Expected'("'(' in switch", $P1)
__label_0: # endif
.annotate 'line', 6628
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 6629
$P1 = __ARG_2.'get'()
.annotate 'line', 6630
$P3 = $P1.'isop'(')')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6631
'Expected'("')' in switch", $P1)
__label_1: # endif
.annotate 'line', 6632
$P1 = __ARG_2.'get'()
.annotate 'line', 6633
$P3 = $P1.'isop'('{')
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 6634
'Expected'("'{' in switch", $P1)
__label_2: # endif
.annotate 'line', 6635
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P4
.annotate 'line', 6636
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P4
.annotate 'line', 6637
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P4
__label_4: # while
.annotate 'line', 6638
$P1 = __ARG_2.'get'()
$I1 = $P1.'iskeyword'('case')
if $I1 goto __label_5
$I1 = $P1.'iskeyword'('default')
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 6639
$P3 = $P1.'iskeyword'('case')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 6640
getattribute $P4, self, 'case_value'
$P5 = 'parseExpr'(__ARG_2, self)
# predefined push
push $P4, $P5
.annotate 'line', 6641
$P1 = __ARG_2.'get'()
.annotate 'line', 6642
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_8
.annotate 'line', 6643
'Expected'("':' in case", $P1)
__label_8: # endif
.annotate 'line', 6644
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 6645
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
.annotate 'line', 6646
__ARG_2.'unget'($P1)
.annotate 'line', 6647
$P3 = 'parseStatement'(__ARG_2, self)
# predefined push
push $P2, $P3
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 6649
getattribute $P3, self, 'case_st'
# predefined push
push $P3, $P2
.annotate 'line', 6650
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 6653
$P1 = __ARG_2.'get'()
.annotate 'line', 6654
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_13
.annotate 'line', 6655
'Expected'("':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 6656
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
.annotate 'line', 6657
__ARG_2.'unget'($P1)
.annotate 'line', 6658
getattribute $P3, self, 'default_st'
$P4 = 'parseStatement'(__ARG_2, self)
# predefined push
push $P3, $P4
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 6660
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 6663

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 6664
# Body
# {
.annotate 'line', 6666
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 6667
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 6668
getattribute $P2, self, 'case_st'
iter $P5, $P2
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 6669
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6670
getattribute $P2, self, 'default_st'
'optimize_array'($P2)
.annotate 'line', 6671
.return(self)
# }
.annotate 'line', 6672

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6673
# Body
# {
.annotate 'line', 6676
# string type: $S1
set $S1, ''
.annotate 'line', 6677
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 6678
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 6679
ne $S2, 'N', __label_3
.annotate 'line', 6680
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 6681
ne $S1, '', __label_4
.annotate 'line', 6682
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 6683
eq $S1, $S2, __label_6
.annotate 'line', 6684
set $S1, 'P'
__label_6: # endif
__label_5: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6687
# string reg: $S3
$P8 = self.'tempreg'($S1)
null $S3
if_null $P8, __label_7
set $S3, $P8
__label_7:
.annotate 'line', 6688
getattribute $P10, self, 'condition'
$P8 = $P10.'checkresult'()
set $S9, $P8
ne $S9, $S1, __label_8
.annotate 'line', 6689
getattribute $P11, self, 'condition'
$P11.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 6691
# string regcond: $S4
getattribute $P13, self, 'condition'
$P12 = $P13.'emit_get'(__ARG_1)
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
.annotate 'line', 6692
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 6696
self.'genbreaklabel'()
.annotate 'line', 6697
# string defaultlabel: $S5
$P8 = self.'genlabel'()
null $S5
if_null $P8, __label_11
set $S5, $P8
__label_11:
.annotate 'line', 6698
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6699
# string regval: $S6
$P8 = self.'tempreg'($S1)
null $S6
if_null $P8, __label_12
set $S6, $P8
__label_12:
.annotate 'line', 6700
getattribute $P8, self, 'case_value'
iter $P14, $P8
set $P14, 0
__label_13: # for iteration
unless $P14 goto __label_14
shift $P3, $P14
# {
.annotate 'line', 6701
# string label: $S7
$P10 = self.'genlabel'()
null $S7
if_null $P10, __label_15
set $S7, $P10
__label_15:
.annotate 'line', 6702
# predefined push
push $P2, $S7
.annotate 'line', 6703
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6704
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 6706
__ARG_1.'emitgoto'($S5)
.annotate 'line', 6709
__ARG_1.'comment'('switch')
.annotate 'line', 6710
self.'annotate'(__ARG_1)
.annotate 'line', 6711
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 6712
# int n: $I1
set $P8, $P4
set $I1, $P8
# for loop
.annotate 'line', 6713
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6714
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 6715
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6716
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 6717
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $P6, $P15
.annotate 'line', 6718
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 6713
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6721
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6722
getattribute $P8, self, 'default_st'
iter $P16, $P8
set $P16, 0
__label_21: # for iteration
unless $P16 goto __label_22
shift $P7, $P16
.annotate 'line', 6723
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 6725
getattribute $P10, self, 'start'
$P8 = self.'getbreaklabel'($P10)
__ARG_1.'emitlabel'($P8, 'switch end')
# }
.annotate 'line', 6726

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6615
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 6617
addattribute $P0, 'condition'
.annotate 'line', 6618
addattribute $P0, 'case_value'
.annotate 'line', 6619
addattribute $P0, 'case_st'
.annotate 'line', 6620
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6738
# Body
# {
.annotate 'line', 6740
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6741
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6742
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6743
__ARG_2.'unget'($P1)
.annotate 'line', 6744
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 6746
$P1 = __ARG_2.'get'()
.annotate 'line', 6747
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 6748
__ARG_2.'unget'($P1)
.annotate 'line', 6749
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6750
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 6752
$P1 = __ARG_2.'get'()
.annotate 'line', 6753
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_2
# {
.annotate 'line', 6754
__ARG_2.'unget'($P1)
.annotate 'line', 6755
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P3
.annotate 'line', 6756
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 6758
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6759

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6760
# Body
# {
.annotate 'line', 6762
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 6763
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 6764
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 6765
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 6766
getattribute $P1, self, 'iteration'
if_null $P1, __label_2
.annotate 'line', 6767
getattribute $P4, self, 'iteration'
$P3 = $P4.'optimize'()
setattribute self, 'iteration', $P3
__label_2: # endif
.annotate 'line', 6768
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6769
.return(self)
# }
.annotate 'line', 6770

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6771
# Body
# {
.annotate 'line', 6773
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6774
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6775
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6776
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6777
.return()
# }
__label_0: # endif
.annotate 'line', 6779
__ARG_1.'comment'('for loop')
.annotate 'line', 6780
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6781
# string breaklabel: $S2
$P1 = self.'genbreaklabel'()
null $S2
if_null $P1, __label_4
set $S2, $P1
__label_4:
.annotate 'line', 6782
# string condlabel: $S3
$P1 = self.'genlabel'()
null $S3
if_null $P1, __label_5
set $S3, $P1
__label_5:
.annotate 'line', 6783
getattribute $P1, self, 'initializer'
if_null $P1, __label_6
.annotate 'line', 6784
getattribute $P2, self, 'initializer'
$P2.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6786
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6787
getattribute $P1, self, 'condexpr'
if_null $P1, __label_7
.annotate 'line', 6788
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6790
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6791
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6792
getattribute $P1, self, 'iteration'
if_null $P1, __label_8
.annotate 'line', 6793
# string unused: $S4
getattribute $P3, self, 'iteration'
$P2 = $P3.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
__label_8: # endif
.annotate 'line', 6794
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6796
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6797

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6733
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 6735
addattribute $P0, 'initializer'
.annotate 'line', 6736
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param string __ARG_5

.annotate 'line', 6810
# Body
# {
.annotate 'line', 6812
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6813
# string sname: $S1
set $P1, __ARG_4
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6814
eq __ARG_5, '', __label_1
# {
.annotate 'line', 6815
# string deftype: $S2
$P1 = 'typetoregcheck'(__ARG_5)
null $S2
if_null $P1, __label_2
set $S2, $P1
__label_2:
.annotate 'line', 6816
self.'createvar'($S1, $S2)
.annotate 'line', 6817
box $P1, $S2
setattribute self, 'deftype', $P1
# }
__label_1: # endif
.annotate 'line', 6819
setattribute self, 'varname', __ARG_4
.annotate 'line', 6820
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P2
.annotate 'line', 6821
'ExpectOp'(')', __ARG_2)
.annotate 'line', 6822
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6823

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6824
# Body
# {
.annotate 'line', 6826
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6827
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6828
.return(self)
# }
.annotate 'line', 6829

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6830
# Body
# {
.annotate 'line', 6832
self.'annotate'(__ARG_1)
.annotate 'line', 6833
# string regcont: $S1
null $S1
.annotate 'line', 6834
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6835
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6836
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6837
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6840
getattribute $P3, self, 'container'
$P2 = $P3.'emit_get'(__ARG_1)
set $S1, $P2
__label_1: # endif
.annotate 'line', 6841
# var itvar: $P1
getattribute $P2, self, 'varname'
$P1 = self.'getvar'($P2)
.annotate 'line', 6842
# string iterator: $S3
$P2 = self.'createreg'('P')
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6843
# string continuelabel: $S4
$P2 = self.'gencontinuelabel'()
null $S4
if_null $P2, __label_4
set $S4, $P2
__label_4:
.annotate 'line', 6844
# string breaklabel: $S5
$P2 = self.'genbreaklabel'()
null $S5
if_null $P2, __label_5
set $S5, $P2
__label_5:
.annotate 'line', 6845
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6846
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6847
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6848
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6849
$P2 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P2, ', ', $S3)
.annotate 'line', 6850
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 6851
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6852
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6853

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6804
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6806
addattribute $P0, 'deftype'
.annotate 'line', 6807
addattribute $P0, 'varname'
.annotate 'line', 6808
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6858
# Body
# {
.annotate 'line', 6860
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6861
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6862
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6863
$P4 = $P2.'iskeyword'('in')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 6864
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
set $P5, $P6
.return($P5)
goto __label_1
__label_0: # else
# {
.annotate 'line', 6866
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6867
$P4 = $P3.'iskeyword'('in')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 6868
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 6869
__ARG_2.'unget'($P3)
.annotate 'line', 6870
__ARG_2.'unget'($P2)
.annotate 'line', 6871
__ARG_2.'unget'($P1)
# }
__label_1: # endif
.annotate 'line', 6873
new $P5, [ 'ForStatement' ]
$P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 6874

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6884
# Body
# {
.annotate 'line', 6886
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6887
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6888

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6889
# Body
# {
.annotate 'line', 6891
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6892
.return(self)
# }
.annotate 'line', 6893

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6894
# Body
# {
.annotate 'line', 6896
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6897
self.'annotate'(__ARG_1)
.annotate 'line', 6898
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6899

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6880
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6882
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6913
# Body
# {
.annotate 'line', 6915
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6916
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6917
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6918
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6921
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6923
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6924
$P1 = __ARG_2.'get'()
.annotate 'line', 6925
$P2 = $P1.'iskeyword'('catch')
isfalse $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6926
'ExpectedOp'('catch', $P1)
__label_2: # endif
.annotate 'line', 6927
$P1 = __ARG_2.'get'()
.annotate 'line', 6928
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_3
.annotate 'line', 6929
'Expected'("'(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6930
$P1 = __ARG_2.'get'()
.annotate 'line', 6931
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_4
# {
.annotate 'line', 6932
# string exname: $S1
$P3 = $P1.'getidentifier'()
null $S1
if_null $P3, __label_5
set $S1, $P3
__label_5:
.annotate 'line', 6933
setattribute self, 'exname', $P1
.annotate 'line', 6934
self.'createvar'($S1, 'P')
.annotate 'line', 6935
$P1 = __ARG_2.'get'()
.annotate 'line', 6936
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_6
.annotate 'line', 6937
'Expected'("')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6939
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P3
# }
.annotate 'line', 6940

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6941
# Body
# {
.annotate 'line', 6943
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6944
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6945
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6946
getattribute $P3, self, 'scatch'
$P2 = $P3.'optimize'()
setattribute self, 'scatch', $P2
.annotate 'line', 6947
.return(self)
# }
.annotate 'line', 6948

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6949
# Body
# {
.annotate 'line', 6951
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6952
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6953
# string labelpasthandler: $S3
$P7 = self.'genlabel'()
null $S3
if_null $P7, __label_2
set $S3, $P7
__label_2:
.annotate 'line', 6954
# string exreg: $S4
null $S4
.annotate 'line', 6955
getattribute $P7, self, 'exname'
if_null $P7, __label_3
# {
.annotate 'line', 6956
# var exname: $P1
getattribute $P8, self, 'exname'
$P1 = self.'getvar'($P8)
.annotate 'line', 6957
$P7 = $P1.'getreg'()
set $S4, $P7
# }
goto __label_4
__label_3: # else
.annotate 'line', 6960
$P7 = self.'tempreg'('P')
set $S4, $P7
__label_4: # endif
.annotate 'line', 6962
self.'annotate'(__ARG_1)
.annotate 'line', 6963
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6965
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6966
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6968
getattribute $P7, self, 'modifiers'
if_null $P7, __label_5
# {
.annotate 'line', 6969
# var modiflist: $P2
getattribute $P8, self, 'modifiers'
$P2 = $P8.'getlist'()
.annotate 'line', 6970
iter $P9, $P2
set $P9, 0
__label_6: # for iteration
unless $P9 goto __label_7
shift $P3, $P9
# {
.annotate 'line', 6971
# string modifname: $S5
$P7 = $P3.'getname'()
null $S5
if_null $P7, __label_8
set $S5, $P7
__label_8:
.annotate 'line', 6972
# int nargs: $I1
$P7 = $P3.'numargs'()
set $I1, $P7
.annotate 'line', 6973
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
.annotate 'line', 6976
eq $I1, 1, __label_15
.annotate 'line', 6977
getattribute $P7, self, 'start'
'SyntaxError'('Wrong modifier args', $P7)
__label_15: # endif
.annotate 'line', 6978
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6979
# string argreg: $S6
$P8 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P8, __label_16
set $S6, $P8
__label_16:
.annotate 'line', 6980
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
__label_14: # case
.annotate 'line', 6984
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6985
# int i: $I2
null $I2
__label_19: # for condition
ge $I2, $I1, __label_18
# {
.annotate 'line', 6986
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6987
$P7 = $P6.'emit_get'(__ARG_1)
# predefined push
push $P5, $P7
# }
__label_17: # for iteration
.annotate 'line', 6985
inc $I2
goto __label_19
__label_18: # for end
.annotate 'line', 6989
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6990
# string sep: $S7
set $S7, ''
.annotate 'line', 6991
iter $P10, $P5
set $P10, 0
__label_20: # for iteration
unless $P10 goto __label_21
shift $S8, $P10
# {
.annotate 'line', 6992
__ARG_1.'print'($S7, $S8)
.annotate 'line', 6993
set $S7, ', '
# }
goto __label_20
__label_21: # endfor
.annotate 'line', 6995
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6998
getattribute $P7, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P7)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 7003
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 7004
__ARG_1.'comment'('try: begin')
.annotate 'line', 7005
getattribute $P7, self, 'stry'
$P7.'emit'(__ARG_1)
.annotate 'line', 7006
__ARG_1.'comment'('try: end')
.annotate 'line', 7007
__ARG_1.'say'('pop_eh')
.annotate 'line', 7009
self.'annotate'(__ARG_1)
.annotate 'line', 7010
__ARG_1.'emitgoto'($S3)
.annotate 'line', 7012
__ARG_1.'comment'('catch')
.annotate 'line', 7013
__ARG_1.'emitlabel'($S2)
.annotate 'line', 7014
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 7015
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 7016
__ARG_1.'say'('pop_eh')
.annotate 'line', 7017
getattribute $P7, self, 'scatch'
$P7.'emit'(__ARG_1)
.annotate 'line', 7019
__ARG_1.'comment'('catch end')
.annotate 'line', 7020
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7021

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6906
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6908
addattribute $P0, 'stry'
.annotate 'line', 6909
addattribute $P0, 'modifiers'
.annotate 'line', 6910
addattribute $P0, 'exname'
.annotate 'line', 6911
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 7032
# Body
# {
.annotate 'line', 7034
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7035
setattribute self, 'name', __ARG_3
.annotate 'line', 7036
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7037
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 7038

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7028
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 7030
addattribute $P0, 'name'
.annotate 'line', 7031
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7055
# Body
# {
.annotate 'line', 7057
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 7058
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7059
'RequireIdentifier'($P1)
.annotate 'line', 7060
setattribute self, 'name', $P1
.annotate 'line', 7061
# var vdata: $P2
null $P2
.annotate 'line', 7062
# string reg: $S1
null $S1
.annotate 'line', 7064
$P1 = __ARG_2.'get'()
.annotate 'line', 7065
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 7067
box $P5, 1
setattribute self, 'typearray', $P5
.annotate 'line', 7068
getattribute $P4, self, 'name'
$P2 = self.'createvar'($P4, 'P')
.annotate 'line', 7069
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 7070
$P1 = __ARG_2.'get'()
.annotate 'line', 7071
$P4 = $P1.'isop'(']')
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 7073
$P1 = __ARG_2.'get'()
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 7076
__ARG_2.'unget'($P1)
.annotate 'line', 7077
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P5
.annotate 'line', 7078
'ExpectOp'(']', __ARG_2)
.annotate 'line', 7079
$P1 = __ARG_2.'get'()
# }
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 7084
box $P4, 0
setattribute self, 'typearray', $P4
.annotate 'line', 7085
getattribute $P4, self, 'name'
getattribute $P5, self, 't_reg'
$P2 = self.'createvar'($P4, $P5)
.annotate 'line', 7086
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 7087
$P4 = $P1.'isop'('=')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 7089
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P6
.annotate 'line', 7090
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 7094
box $P4, $S1
setattribute self, 'reg', $P4
.annotate 'line', 7095
$P4 = $P1.'isop'('=')
if_null $P4, __label_5
unless $P4 goto __label_5
# {
.annotate 'line', 7096
$P1 = __ARG_2.'get'()
.annotate 'line', 7097
$P4 = $P1.'isop'('[')
isfalse $I1, $P4
unless $I1 goto __label_6
.annotate 'line', 7098
'Expected'("array initializer", $P1)
__label_6: # endif
.annotate 'line', 7099
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P5
.annotate 'line', 7100
$P1 = __ARG_2.'get'()
.annotate 'line', 7101
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_7
# {
.annotate 'line', 7102
__ARG_2.'unget'($P1)
__label_8: # do
.annotate 'line', 7103
# {
.annotate 'line', 7104
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 7105
getattribute $P4, self, 'init'
# predefined push
push $P4, $P3
# }
__label_10: # continue
.annotate 'line', 7106
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_9
if $P4 goto __label_8
__label_9: # enddo
.annotate 'line', 7107
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_11
.annotate 'line', 7108
'Expected'("',' or ']'", $P1)
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 7110
$P1 = __ARG_2.'get'()
# }
__label_5: # endif
.annotate 'line', 7112
__ARG_2.'unget'($P1)
# }
.annotate 'line', 7113

.end # parse


.sub 'optimize' :method

.annotate 'line', 7114
# Body
# {
.annotate 'line', 7116
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 7117
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 7118
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 7119
if_null $P1, __label_1
# {
.annotate 'line', 7120
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 7121
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 7123
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 7125
.return(self)
# }
.annotate 'line', 7126

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7127
# Body
# {
.annotate 'line', 7129
self.'annotate'(__ARG_1)
.annotate 'line', 7130
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 7131
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 7132
# string reg: $S3
getattribute $P4, self, 'reg'
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 7133
# string t_reg: $S4
getattribute $P4, self, 't_reg'
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 7134
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 7135
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
__ARG_1.'comment'($S10)
.annotate 'line', 7137
getattribute $P4, self, 'typearray'
set $I3, $P4
ne $I3, 0, __label_4
# {
.annotate 'line', 7138
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 7139
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 7141
# string itype: $S5
$P5 = $P1.'checkresult'()
null $S5
if_null $P5, __label_9
set $S5, $P5
__label_9:
.annotate 'line', 7142
ne $S5, $S4, __label_10
# {
.annotate 'line', 7143
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7144
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 7146
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 7149
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_15
# {
.annotate 'line', 7151
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 7154
# string ireg: $S6
null $S6
.annotate 'line', 7155
ne $S5, '', __label_17
.annotate 'line', 7156
$P4 = $P1.'emit_get'(__ARG_1)
set $S6, $P4
goto __label_18
__label_17: # else
# {
.annotate 'line', 7158
$P5 = self.'tempreg'($S5)
set $S6, $P5
.annotate 'line', 7159
$P1.'emit'(__ARG_1, $S6)
# }
__label_18: # endif
.annotate 'line', 7161
iseq $I3, $S4, 'S'
unless $I3 goto __label_21
iseq $I3, $S5, 'P'
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 7162
# string auxlabel: $S7
$P4 = self.'genlabel'()
null $S7
if_null $P4, __label_22
set $S7, $P4
__label_22:
.annotate 'line', 7163
__ARG_1.'emitnull'($S3)
.annotate 'line', 7164
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 7165
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 7166
__ARG_1.'emitlabel'($S7)
# }
goto __label_20
__label_19: # else
.annotate 'line', 7169
__ARG_1.'emitset'($S3, $S6)
__label_20: # endif
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
.annotate 'line', 7175
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 7176
if_null $P2, __label_23
# {
.annotate 'line', 7178
# string regsize: $S8
$P4 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P4, __label_25
set $S8, $P4
__label_25:
.annotate 'line', 7179
getattribute $P4, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P4, "Array'], ", $S8)
# }
goto __label_24
__label_23: # else
# {
.annotate 'line', 7183
getattribute $P4, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P4, "Array']")
# }
__label_24: # endif
.annotate 'line', 7185
if_null $P1, __label_26
# {
.annotate 'line', 7186
# string itemreg: $S9
$P4 = self.'tempreg'($S4)
null $S9
if_null $P4, __label_27
set $S9, $P4
__label_27:
.annotate 'line', 7187
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 7188
unless_null $P2, __label_28
# {
.annotate 'line', 7189
le $I1, 0, __label_29
# {
.annotate 'line', 7191
__ARG_1.'emitset'($S3, $I1)
# }
__label_29: # endif
# }
__label_28: # endif
.annotate 'line', 7194
# int i: $I2
null $I2
.annotate 'line', 7195
iter $P6, $P1
set $P6, 0
__label_30: # for iteration
unless $P6 goto __label_31
shift $P3, $P6
# {
.annotate 'line', 7196
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 7197
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 7198
inc $I2
# }
goto __label_30
__label_31: # endfor
# }
__label_26: # endif
# }
__label_5: # endif
# }
.annotate 'line', 7202

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7203
# Body
# {
.annotate 'line', 7205
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 7206

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 7045
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 7047
addattribute $P0, 'name'
.annotate 'line', 7048
addattribute $P0, 't_reg'
.annotate 'line', 7049
addattribute $P0, 't_name'
.annotate 'line', 7050
addattribute $P0, 't_array'
.annotate 'line', 7051
addattribute $P0, 'reg'
.annotate 'line', 7052
addattribute $P0, 'typearray'
.annotate 'line', 7053
addattribute $P0, 'size'
.annotate 'line', 7054
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7209
# Body
# {
.annotate 'line', 7211
# var next: $P1
null $P1
.annotate 'line', 7212
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 7213
# {
.annotate 'line', 7214
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7215
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 7216
$P1 = __ARG_3.'get'()
# }
__label_2: # continue
.annotate 'line', 7217
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 7218
'RequireOp'(';', $P1)
.annotate 'line', 7219
.return($P2)
# }
.annotate 'line', 7220

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 7232
# Body
# {
.annotate 'line', 7235
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7236
box $P1, __ARG_3
setattribute self, 'type', $P1
.annotate 'line', 7237
setattribute self, 'name', __ARG_4
.annotate 'line', 7238
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7239

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 7240
# Body
# {
.annotate 'line', 7242
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 7243
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 7244
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7245
$P1 = $P1.'optimize'()
.annotate 'line', 7246
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 7248
getattribute $P4, self, 'start'
.annotate 'line', 7247
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 7250
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7251
setattribute self, 'value', $P1
.annotate 'line', 7252
.return(self)
# }
.annotate 'line', 7253

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 7254
# Body
# {
.annotate 'line', 7256
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7257

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7258
# Body
# {
.annotate 'line', 7260
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7261
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
__ARG_1.'comment'($S2)
# }
.annotate 'line', 7262

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7226
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 7228
addattribute $P0, 'type'
.annotate 'line', 7229
addattribute $P0, 'name'
.annotate 'line', 7230
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7265
# Body
# {
.annotate 'line', 7267
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7268
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 7269
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7270
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 7272
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 7273
# {
.annotate 'line', 7274
$P1 = __ARG_2.'get'()
.annotate 'line', 7275
# var name: $P3
set $P3, $P1
.annotate 'line', 7276
'ExpectOp'('=', __ARG_2)
.annotate 'line', 7277
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7279
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 7278
$P2 = 'addtomulti'($P2, $P5)
# }
__label_6: # continue
.annotate 'line', 7280
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_5
if $P5 goto __label_4
__label_5: # enddo
.annotate 'line', 7281
.return($P2)
# }
.annotate 'line', 7282

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 7291
# Body
# {
.annotate 'line', 7293
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7294
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7295
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 7296
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 7297
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 7299
'RequireOp'(';', $P1)
# }
.annotate 'line', 7300

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 7301
# Body
# {
.annotate 'line', 7303
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 7304
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 7305
.return(self)
# }
.annotate 'line', 7306

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 7307
# Body
# {
.annotate 'line', 7309
.tailcall self.'optimize_init'()
# }
.annotate 'line', 7310

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7311
# Body
# {
.annotate 'line', 7313
self.'annotate'(__ARG_1)
.annotate 'line', 7314
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7315
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 7316
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 7317
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
__ARG_1.'comment'($S5)
.annotate 'line', 7318
if_null $P1, __label_2
.annotate 'line', 7319
$P2 = $P1.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
.annotate 'line', 7320
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 7321
if_null $P1, __label_4
# {
.annotate 'line', 7322
# string type: $S3
$P2 = $P1.'checkresult'()
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 7323
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
.annotate 'line', 7325
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_17
isa $I1, $P1, 'ArrayExpr'
__label_17:
if $I1 goto __label_16
isa $I1, $P1, 'NewExpr'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 7326
$P1.'emit_init'(__ARG_1, $S2)
goto __label_15
__label_14: # else
.annotate 'line', 7328
$P1.'emit'(__ARG_1, $S2)
__label_15: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 7333
# string value: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_18
set $S4, $P2
__label_18:
.annotate 'line', 7334
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_13: # case
.annotate 'line', 7337
getattribute $P3, self, 'name'
'SyntaxError'("Can't use void function as initializer", $P3)
__label_8: # default
.annotate 'line', 7339
getattribute $P4, self, 'name'
'SyntaxError'("Invalid var initializer", $P4)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 7343
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 7344

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7288
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 7290
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7349
# Body
# {
.annotate 'line', 7351
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7352
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7353

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7354
# Body
# {
.annotate 'line', 7356
self.'annotate'(__ARG_1)
.annotate 'line', 7357
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7358
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 7359
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
__ARG_1.'comment'($S3)
.annotate 'line', 7360
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7361

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7347
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7368
# Body
# {
.annotate 'line', 7370
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7371
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P2
.annotate 'line', 7372
'ExpectOp'(']', __ARG_2)
.annotate 'line', 7373
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7374

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 7375
# Body
# {
.annotate 'line', 7377
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 7378
.tailcall self.'optimize_init'()
# }
.annotate 'line', 7379

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7380
# Body
# {
.annotate 'line', 7382
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7383
self.'annotate'(__ARG_1)
.annotate 'line', 7384
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 7385
# string reg: $S3
getattribute $P1, self, 'reg'
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 7386
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
__ARG_1.'comment'($S4)
.annotate 'line', 7387
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7388

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7364
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 7366
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 7391
# Body
# {
.annotate 'line', 7393
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7394
'RequireIdentifier'($P1)
.annotate 'line', 7395
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7396
$P3 = $P2.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7397
$P2 = __ARG_2.'get'()
.annotate 'line', 7398
$P3 = $P2.'isop'(']')
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 7399
new $P5, [ 'ResizableVarStatement' ]
$P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
goto __label_3
__label_2: # else
# {
.annotate 'line', 7401
__ARG_2.'unget'($P2)
.annotate 'line', 7402
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
.annotate 'line', 7406
__ARG_2.'unget'($P2)
.annotate 'line', 7407
new $P4, [ 'VarStatement' ]
$P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P3, $P4
.return($P3)
# }
__label_1: # endif
# }
.annotate 'line', 7409

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7411
# Body
# {
.annotate 'line', 7413
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7414
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 7415
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 7416
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7417

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7425
# Body
# {
.annotate 'line', 7427
box $P1, 'S'
setattribute self, 't_reg', $P1
.annotate 'line', 7428
box $P1, 'string'
setattribute self, 't_name', $P1
.annotate 'line', 7429
box $P1, 'String'
setattribute self, 't_array', $P1
.annotate 'line', 7430
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7431

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7432
# Body
# {
.annotate 'line', 7434
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7435

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7423
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7438
# Body
# {
.annotate 'line', 7440
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7441

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7443
# Body
# {
.annotate 'line', 7445
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 7446
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7447

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7455
# Body
# {
.annotate 'line', 7457
box $P1, 'I'
setattribute self, 't_reg', $P1
.annotate 'line', 7458
box $P1, 'int'
setattribute self, 't_name', $P1
.annotate 'line', 7459
box $P1, 'Integer'
setattribute self, 't_array', $P1
.annotate 'line', 7460
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7461

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7462
# Body
# {
.annotate 'line', 7464
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7465

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7453
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7468
# Body
# {
.annotate 'line', 7470
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7471

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7473
# Body
# {
.annotate 'line', 7475
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 7476
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7477

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7485
# Body
# {
.annotate 'line', 7487
box $P1, 'N'
setattribute self, 't_reg', $P1
.annotate 'line', 7489
box $P1, 'float'
setattribute self, 't_name', $P1
.annotate 'line', 7490
box $P1, 'Float'
setattribute self, 't_array', $P1
.annotate 'line', 7491
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7492

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7493
# Body
# {
.annotate 'line', 7495
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7496

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7483
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7499
# Body
# {
.annotate 'line', 7501
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7502

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7504
# Body
# {
.annotate 'line', 7506
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 7507
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7508

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7519
# Body
# {
.annotate 'line', 7521
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 7522
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 7523
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 7524
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7525
$P1 = __ARG_2.'get'()
$P3 = $P1.'isop'('}')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 7526
__ARG_2.'unget'($P1)
.annotate 'line', 7527
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7528
unless_null $P2, __label_2
.annotate 'line', 7529
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 7530
getattribute $P3, self, 'statements'
# predefined push
push $P3, $P2
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7532
setattribute self, 'end', $P1
# }
.annotate 'line', 7533

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 7534
# Body
# {
.annotate 'line', 7536
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7537
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7538
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7539
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7540
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 7541
.return($S2)
# }
.annotate 'line', 7542

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 7543
# Body
# {
.annotate 'line', 7545
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7546
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7547
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7548
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7549
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 7550
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 7551
$P1[$S1] = $S3
.annotate 'line', 7552
.return($S3)
# }
.annotate 'line', 7553

.end # createlabel


.sub 'getend' :method

.annotate 'line', 7554
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7555
# Body
# {
.annotate 'line', 7557
__ARG_1.'comment'('{')
.annotate 'line', 7558
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 7559
$P1.'emit'(__ARG_1)
.annotate 'line', 7560
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 7562
__ARG_1.'comment'('}')
# }
.annotate 'line', 7563

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7514
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 7516
addattribute $P0, 'end'
.annotate 'line', 7517
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 7576
# Body
# {
.annotate 'line', 7579
box $P3, 1
setattribute self, 'nreg', $P3
.annotate 'line', 7580
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7581
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7582
setattribute self, 'tempreg', $P1
.annotate 'line', 7583
setattribute self, 'freereg', $P2
# }
.annotate 'line', 7584

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 7585
# Body
# {
.annotate 'line', 7587
box $P1, __ARG_1
setattribute self, 'type', $P1
.annotate 'line', 7588
.return(self)
# }
.annotate 'line', 7589

.end # settype


.sub 'createreg' :method

.annotate 'line', 7590
# Body
# {
.annotate 'line', 7592
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 7593
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7594
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
.annotate 'line', 7595
assign $P1, $I1
.annotate 'line', 7596
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
.annotate 'line', 7597
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 7598
.return($S1)
# }
.annotate 'line', 7599

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 7600
# Body
# {
.annotate 'line', 7602
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7603
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7604
# string reg: $S1
null $S1
.annotate 'line', 7605
# predefined elements
elements $I1, $P1
le $I1, 0, __label_0
.annotate 'line', 7606
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
.annotate 'line', 7608
$P4 = self.'createreg'()
set $S1, $P4
__label_1: # endif
.annotate 'line', 7609
# predefined push
push $P2, $S1
.annotate 'line', 7610
.return($S1)
# }
.annotate 'line', 7611

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7612
# Body
# {
.annotate 'line', 7614
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7615
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7616
# int n: $I1
# predefined elements
elements $I1, $P2
# for loop
.annotate 'line', 7617
# int i: $I2
sub $I2, $I1, 1
__label_2: # for condition
lt $I2, 0, __label_1
# {
.annotate 'line', 7618
# string s: $S1
$S1 = $P2[$I2]
.annotate 'line', 7619
# predefined push
push $P1, $S1
# }
__label_0: # for iteration
.annotate 'line', 7617
dec $I2
goto __label_2
__label_1: # for end
.annotate 'line', 7621
assign $P2, 0
# }
.annotate 'line', 7622

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7572
addattribute $P0, 'type'
.annotate 'line', 7573
addattribute $P0, 'nreg'
.annotate 'line', 7574
addattribute $P0, 'tempreg'
.annotate 'line', 7575
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7646
# Body
# {
.annotate 'line', 7648
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7649
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
.annotate 'line', 7650
box $P1, 0
setattribute self, 'nlabel', $P1
.annotate 'line', 7651
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 7652
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 7653
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('S')
setattribute self, 'regstS', $P2
.annotate 'line', 7654
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('P')
setattribute self, 'regstP', $P2
# }
.annotate 'line', 7655

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 7657
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 7658
# Body
# {
.annotate 'line', 7661
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 7662
unless_null $P1, __label_0
# {
.annotate 'line', 7663
$P1 = self.'generatesubid'()
.annotate 'line', 7664
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 7666
.return($P1)
# }
.annotate 'line', 7667

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 7669
# Body
# {
.annotate 'line', 7671
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 7672
.return($I1)
# }
.annotate 'line', 7673

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 7674
# Body
# {
.annotate 'line', 7676
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 7677
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7678
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 7679
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 7680
# {
.annotate 'line', 7681
$P2 = __ARG_1.'get'()
.annotate 'line', 7682
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 7683
eq $S1, '', __label_5
.annotate 'line', 7684
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
.annotate 'line', 7686
set $S1, 'P'
__label_6: # endif
.annotate 'line', 7687
# string argname: $S2
# predefined string
$P5 = self.'getparamnum'()
set $S4, $P5
concat $S2, '__ARG_', $S4
.annotate 'line', 7688
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7690
# string varname: $S3
set $P5, $P2
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 7691
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 7692
$P3['name'] = $S3
.annotate 'line', 7693
$P2 = __ARG_1.'get'()
.annotate 'line', 7694
$P5 = $P2.'isop'('[')
if_null $P5, __label_8
unless $P5 goto __label_8
# {
.annotate 'line', 7695
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7696
$P3['modifiers'] = $P4
.annotate 'line', 7697
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 7699
# predefined push
push $P1, $P3
# }
__label_3: # continue
.annotate 'line', 7700
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 7701
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_9
.annotate 'line', 7702
'Expected'("')' or ','", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7704

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7706
# Body
# {
.annotate 'line', 7708
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 7709
unless_null $P1, __label_0
.annotate 'line', 7710
root_new $P3, ['parrot';'ResizablePMCArray']
push $P3, __ARG_1
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 7712
# predefined push
push $P1, __ARG_1
__label_1: # endif
# }
.annotate 'line', 7713

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7715
# Body
# {
.annotate 'line', 7717
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 7718
.return(self)
# }
.annotate 'line', 7719

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7721
# Body
# {
.annotate 'line', 7723
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7724
unless_null $P1, __label_0
# {
.annotate 'line', 7725
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7726
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7728
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7729

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7730
# Body
# {
.annotate 'line', 7732
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 7733
unless_null $P1, __label_0
# {
.annotate 'line', 7734
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7735
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7737
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7738

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7739
# Body
# {
.annotate 'line', 7743
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 7744
# string lexname: $S1
null $S1
.annotate 'line', 7745
if_null $P1, __label_0
.annotate 'line', 7746
set $S1, $P1
goto __label_1
__label_0: # else
# {
.annotate 'line', 7748
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 7749
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 7750
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 7751
self.'setlex'($S1, $S2)
.annotate 'line', 7752
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 7754
.return($S1)
# }
.annotate 'line', 7755

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7757
# Body
# {
.annotate 'line', 7759
# var store: $P1
null $P1
.annotate 'line', 7760
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
.annotate 'line', 7762
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7764
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7766
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7768
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7770
concat $S4, 'Invalid type in createreg: ', __ARG_1
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7772
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7773
.return($S1)
# }
.annotate 'line', 7774

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7775
# Body
# {
.annotate 'line', 7777
# var store: $P1
null $P1
.annotate 'line', 7778
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
.annotate 'line', 7780
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7782
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7784
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7786
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7788
concat $S4, "Invalid type '", __ARG_1
concat $S4, $S4, "' in tempreg"
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7790
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7791
.return($S1)
# }
.annotate 'line', 7792

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7793
# Body
# {
.annotate 'line', 7795
root_new $P2, ['parrot';'ResizablePMCArray']
getattribute $P4, self, 'regstI'
push $P2, $P4
getattribute $P5, self, 'regstN'
push $P2, $P5
getattribute $P6, self, 'regstS'
push $P2, $P6
getattribute $P7, self, 'regstP'
push $P2, $P7
iter $P8, $P2
set $P8, 0
__label_0: # for iteration
unless $P8 goto __label_1
shift $P1, $P8
.annotate 'line', 7796
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7797

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7798
# Body
# {
.annotate 'line', 7800
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7801
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7802
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
.annotate 'line', 7803
assign $P1, $I1
.annotate 'line', 7804
.return($S1)
# }
.annotate 'line', 7805

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7806
# Body
# {
.annotate 'line', 7808
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7809

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7810
# Body
# {
.annotate 'line', 7812
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7813

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7815
# Body
# {
.annotate 'line', 7817
# string name: $S1
getattribute $P20, self, 'name'
null $S1
if_null $P20, __label_0
set $S1, $P20
__label_0:
.annotate 'line', 7818
__ARG_1.'say'()
.annotate 'line', 7819
__ARG_1.'print'(".sub ")
.annotate 'line', 7820
$P20 = self.'isanonymous'()
if_null $P20, __label_1
unless $P20 goto __label_1
.annotate 'line', 7821
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7823
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7824
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7825
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7826
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7827
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7828
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7829
if_null $P2, __label_5
.annotate 'line', 7830
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7834
$P20 = self.'ismethod'()
if_null $P20, __label_6
unless $P20 goto __label_6
.annotate 'line', 7835
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7836
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7837
if_null $P3, __label_7
# {
.annotate 'line', 7838
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7839
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7840
# int nargmods: $I1
$P20 = $P5.'numargs'()
set $I1, $P20
.annotate 'line', 7841
$P20 = $P5.'getname'()
__ARG_1.'print'(' :', $P20)
.annotate 'line', 7842
le $I1, 0, __label_11
# {
.annotate 'line', 7843
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7844
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7845
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7846
$P20 = $P6.'isstringliteral'()
isfalse $I5, $P20
unless $I5 goto __label_15
.annotate 'line', 7847
getattribute $P21, $P6, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_15: # endif
.annotate 'line', 7848
$P20 = $P6.'getPirString'()
__ARG_1.'print'($P20)
# }
__label_12: # for iteration
.annotate 'line', 7844
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7850
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
.annotate 'line', 7855
ne $S1, 'main', __label_16
.annotate 'line', 7856
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7858
__ARG_1.'say'()
.annotate 'line', 7860
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7861
# var param: $P8
null $P8
.annotate 'line', 7862
# string paramname: $S2
null $S2
.annotate 'line', 7863
# var a: $P9
null $P9
.annotate 'line', 7865
iter $P23, $P7
set $P23, 0
__label_17: # for iteration
unless $P23 goto __label_18
shift $P8, $P23
# {
.annotate 'line', 7866
$S2 = $P8['name']
.annotate 'line', 7867
$P9 = self.'getvar'($S2)
.annotate 'line', 7868
# string ptype: $S3
$P21 = $P9.'gettype'()
$P20 = 'typetopirname'($P21)
null $S3
if_null $P20, __label_19
set $S3, $P20
__label_19:
.annotate 'line', 7869
$P20 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P20)
.annotate 'line', 7870
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7871
if_null $P10, __label_20
# {
.annotate 'line', 7872
# var named: $P11
null $P11
.annotate 'line', 7873
# var slurpy: $P12
null $P12
.annotate 'line', 7874
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7875
iter $P24, $P13
set $P24, 0
__label_21: # for iteration
unless $P24 goto __label_22
shift $P14, $P24
# {
.annotate 'line', 7876
# string modname: $S4
$P20 = $P14.'getname'()
null $S4
if_null $P20, __label_23
set $S4, $P20
__label_23:
.annotate 'line', 7877
set $S8, $S4
set $S9, 'named'
if $S8 == $S9 goto __label_26
set $S9, 'slurpy'
if $S8 == $S9 goto __label_27
goto __label_25
# switch
__label_26: # case
.annotate 'line', 7879
set $P11, $P14
goto __label_24 # break
__label_27: # case
.annotate 'line', 7882
set $P12, $P14
goto __label_24 # break
__label_25: # default
.annotate 'line', 7885
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7888
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7893
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7896
if_null $P11, __label_31
# {
.annotate 'line', 7897
# string setname: $S5
null $S5
.annotate 'line', 7898
# int nargs: $I3
$P20 = $P11.'numargs'()
set $I3, $P20
.annotate 'line', 7899
set $I5, $I3
null $I6
if $I5 == $I6 goto __label_35
set $I6, 1
if $I5 == $I6 goto __label_36
goto __label_34
# switch
__label_35: # case
.annotate 'line', 7901
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S5, $S0
goto __label_33 # break
__label_36: # case
.annotate 'line', 7904
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7905
$P20 = $P15.'isstringliteral'()
isfalse $I7, $P20
unless $I7 goto __label_37
.annotate 'line', 7906
getattribute $P21, self, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_37: # endif
.annotate 'line', 7907
$P25 = $P15.'getPirString'()
set $S5, $P25
goto __label_33 # break
__label_34: # default
.annotate 'line', 7910
getattribute $P26, self, 'start'
'SyntaxError'('Invalid modifier', $P26)
__label_33: # switch end
.annotate 'line', 7912
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7914
if_null $P12, __label_38
# {
.annotate 'line', 7915
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7919
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7921
__ARG_1.'say'()
.annotate 'line', 7922
getattribute $P20, self, 'start'
__ARG_1.'annotate'($P20)
.annotate 'line', 7925
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7926
if_null $P16, __label_39
# {
.annotate 'line', 7928
iter $P27, $P16
set $P27, 0
__label_40: # for iteration
unless $P27 goto __label_41
shift $S6, $P27
.annotate 'line', 7929
$P20 = $P16[$S6]
__ARG_1.'say'(".lex '", $P20, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7932
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7933
if_null $P16, __label_42
# {
.annotate 'line', 7935
iter $P28, $P16
set $P28, 0
__label_43: # for iteration
unless $P28 goto __label_44
shift $S7, $P28
.annotate 'line', 7936
$P20 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P20, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7939
# var body: $P17
getattribute $P17, self, 'body'
.annotate 'line', 7940
$P20 = $P17.'isempty'()
if_null $P20, __label_45
unless $P20 goto __label_45
.annotate 'line', 7941
__ARG_1.'comment'('Empty body')
goto __label_46
__label_45: # else
# {
.annotate 'line', 7943
__ARG_1.'comment'('Body')
.annotate 'line', 7944
$P17.'emit'(__ARG_1)
.annotate 'line', 7945
$P20 = $P17.'getend'()
__ARG_1.'annotate'($P20)
# }
__label_46: # endif
.annotate 'line', 7947
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7950
# var localfun: $P18
getattribute $P18, self, 'localfun'
.annotate 'line', 7951
if_null $P18, __label_47
# {
# for loop
.annotate 'line', 7952
# int ifn: $I4
null $I4
__label_50: # for condition
# predefined elements
elements $I5, $P18
ge $I4, $I5, __label_49
# {
.annotate 'line', 7953
# var fn: $P19
$P19 = $P18[$I4]
.annotate 'line', 7954
$P19.'emit'(__ARG_1)
# }
__label_48: # for iteration
.annotate 'line', 7952
inc $I4
goto __label_50
__label_49: # for end
# }
__label_47: # endif
# }
.annotate 'line', 7957

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7629
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 7631
addattribute $P0, 'name'
.annotate 'line', 7632
addattribute $P0, 'subid'
.annotate 'line', 7633
addattribute $P0, 'modifiers'
.annotate 'line', 7634
addattribute $P0, 'params'
.annotate 'line', 7635
addattribute $P0, 'body'
.annotate 'line', 7636
addattribute $P0, 'regstI'
.annotate 'line', 7637
addattribute $P0, 'regstN'
.annotate 'line', 7638
addattribute $P0, 'regstS'
.annotate 'line', 7639
addattribute $P0, 'regstP'
.annotate 'line', 7640
addattribute $P0, 'nlabel'
.annotate 'line', 7641
addattribute $P0, 'localfun'
.annotate 'line', 7642
addattribute $P0, 'lexicals'
.annotate 'line', 7643
addattribute $P0, 'usedlexicals'
.annotate 'line', 7644
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7969
# Body
# {
.annotate 'line', 7971
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7972
box $P1, 0
setattribute self, 'paramnum', $P1
.annotate 'line', 7973
box $P1, 0
setattribute self, 'lexnum', $P1
.annotate 'line', 7974
self.'parse'(__ARG_2)
# }
.annotate 'line', 7975

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7977
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7978
# Body
# {
.annotate 'line', 7981
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7982
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 7983
assign $P1, $I1
.annotate 'line', 7984
.return($I1)
# }
.annotate 'line', 7985

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7986
# Body
# {
.annotate 'line', 7989
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7990
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 7991
assign $P1, $I1
.annotate 'line', 7992
.return($I1)
# }
.annotate 'line', 7993

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7994
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7996
# Body
# {
.annotate 'line', 7998
# var name: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7999
setattribute self, 'name', $P1
.annotate 'line', 8000
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 8001
$P5 = $P2.'isop'('[')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 8002
# var modifiers: $P3
new $P3, [ 'ModifierList' ]
$P3.'ModifierList'(__ARG_1, self)
.annotate 'line', 8003
setattribute self, 'modifiers', $P3
.annotate 'line', 8004
$P2 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 8006
'RequireOp'('(', $P2)
.annotate 'line', 8007
self.'parse_parameters'(__ARG_1)
.annotate 'line', 8009
# var fullname: $P4
getattribute $P6, self, 'owner'
$P5 = $P6.'getpath'()
# predefined clone
clone $P4, $P5
.annotate 'line', 8010
$P5 = $P1.'getidentifier'()
# predefined push
push $P4, $P5
.annotate 'line', 8012
new $P6, [ 'StringLiteral' ]
.annotate 'line', 8013
new $P8, [ 'TokenQuoted' ]
getattribute $P9, $P1, 'file'
getattribute $P10, $P1, 'line'
# predefined join
join $S1, '.', $P4
$P8.'TokenQuoted'($P9, $P10, $S1)
set $P7, $P8
$P6.'StringLiteral'(self, $P7)
set $P5, $P6
.annotate 'line', 8011
self.'createconst'('__FUNCTION__', 'S', $P5, '')
.annotate 'line', 8016
$P2 = __ARG_1.'get'()
.annotate 'line', 8017
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 8018
'ExpectedOp'('{', $P2)
__label_1: # endif
.annotate 'line', 8019
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 8020
.return(self)
# }
.annotate 'line', 8021

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7964
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7966
addattribute $P0, 'paramnum'
.annotate 'line', 7967
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8030
# Body
# {
.annotate 'line', 8032
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8033
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 8034
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 8035
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 8036
setattribute self, 'name', $P1
.annotate 'line', 8037
self.'parse_parameters'(__ARG_2)
.annotate 'line', 8038
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 8039
'RequireOp'('{', $P2)
.annotate 'line', 8040
new $P5, [ 'CompoundStatement' ]
$P5.'CompoundStatement'($P2, __ARG_2, self)
set $P4, $P5
setattribute self, 'body', $P4
.annotate 'line', 8041
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8042

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 8043
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 8044
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 8045
# Body
# {
.annotate 'line', 8047
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 8048

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 8049
# Body
# {
.annotate 'line', 8052
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8053

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 8054
# Body
# {
.annotate 'line', 8057
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8058

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 8059
# Body
# {
.annotate 'line', 8061
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8062
unless_null $P1, __label_0
# {
.annotate 'line', 8065
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8066
unless_null $P1, __label_1
# {
.annotate 'line', 8068
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8069
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 8070
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 8071
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 8072
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8073
# string reg: $S2
$P6 = $P1.'getreg'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 8074
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 8078
$P6 = $P1.'gettype'()
set $S5, $P6
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P7 = $P1.'isconst'()
isfalse $I2, $P7
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 8079
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 8080
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 8081
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 8082
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 8083
$P6 = $P4.'same_scope_as'($P5)
if_null $P6, __label_10
unless $P6 goto __label_10
# {
.annotate 'line', 8084
# string lexname: $S3
$P7 = $P3.'makelexical'($P1)
null $S3
if_null $P7, __label_11
set $S3, $P7
__label_11:
.annotate 'line', 8085
# int flags: $I1
$I2 = $P1.'getflags'()
bor $I1, $I2, 2
.annotate 'line', 8086
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8087
box $P6, $S3
setattribute $P1, 'lexname', $P6
.annotate 'line', 8088
# string reg: $S4
$P6 = $P1.'getreg'()
null $S4
if_null $P6, __label_12
set $S4, $P6
__label_12:
.annotate 'line', 8089
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
.annotate 'line', 8094
isnull $I2, $P1
not $I2
unless $I2 goto __label_14
isa $I3, $P1, 'VarData'
not $I2, $I3
__label_14:
unless $I2 goto __label_13
.annotate 'line', 8095
'InternalError'('Incorrect data for variable in LocalFunction')
__label_13: # endif
.annotate 'line', 8096
.return($P1)
# }
.annotate 'line', 8097

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8028
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8106
# Body
# {
.annotate 'line', 8108
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8109

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 8110
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8104
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

.annotate 'line', 8125
# Body
# {
.annotate 'line', 8127
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8128

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 8129
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 8131
# Body
# {
.annotate 'line', 8133
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 8134

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8123
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8140
# Body
# {
.annotate 'line', 8142
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8143
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8144

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 8145
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8147
# Body
# {
.annotate 'line', 8149
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 8150
__ARG_1.'print'($S1)
# }
.annotate 'line', 8151

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8137
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 8139
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8158
# Body
# {
.annotate 'line', 8160
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8161
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8162
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 8163
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 8164
'Expected'('literal string', $P2)
__label_0: # endif
.annotate 'line', 8165
$P3 = $P2.'rawstring'()
# predefined push
push $P1, $P3
.annotate 'line', 8166
$P2 = __ARG_1.'get'()
.annotate 'line', 8167
$P3 = $P2.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 8168
$P4 = $P2.'checkop'()
set $S1, $P4
set $S2, ':'
if $S1 == $S2 goto __label_4
set $S2, ','
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 8170
box $P5, 1
setattribute self, 'hll', $P5
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 8174
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 8176
# {
.annotate 'line', 8177
$P2 = __ARG_1.'get'()
.annotate 'line', 8178
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_9
.annotate 'line', 8179
'Expected'('literal string', $P2)
__label_9: # endif
.annotate 'line', 8180
$P3 = $P2.'rawstring'()
# predefined push
push $P1, $P3
# }
__label_8: # continue
.annotate 'line', 8181
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'(',')
if_null $P3, __label_7
if $P3 goto __label_6
__label_7: # enddo
.annotate 'line', 8182
'RequireOp'(']', $P2)
# }
__label_1: # endif
.annotate 'line', 8184
setattribute self, 'key', $P1
# }
.annotate 'line', 8185

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 8186
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 8187
# Body
# {
# predefined int
.annotate 'line', 8189
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 8190

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8192
# Body
# {
.annotate 'line', 8194
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 8195

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8154
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 8156
addattribute $P0, 'key'
.annotate 'line', 8157
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8201
# Body
# {
.annotate 'line', 8203
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8204
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
push $P1, $P3
.annotate 'line', 8205
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 8206
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 8207
$P2 = __ARG_1.'get'()
.annotate 'line', 8208
# predefined string
set $S1, $P2
# predefined push
push $P1, $S1
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 8210
__ARG_1.'unget'($P2)
.annotate 'line', 8211
setattribute self, 'key', $P1
# }
.annotate 'line', 8212

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 8213
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 8215
# Body
# {
.annotate 'line', 8217
# var key: $P1
getattribute $P1, self, 'key'
.annotate 'line', 8218
$P2 = $P1[-1]
.return($P2)
# }
.annotate 'line', 8219

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8221
# Body
# {
.annotate 'line', 8223
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8224
unless_null $P1, __label_0
# {
.annotate 'line', 8225
$P2 = self.'dowarnings'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 8226
getattribute $P3, self, 'key'
# predefined join
join $S1, ".", $P3
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
__label_2: # endif
.annotate 'line', 8227
getattribute $P3, self, 'key'
$P2 = 'getparrotkey'($P3)
__ARG_1.'print'($P2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 8229
$P2 = $P1.'getclasskey'()
__ARG_1.'print'($P2)
__label_1: # endif
# }
.annotate 'line', 8230

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8198
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 8200
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8233
# Body
# {
.annotate 'line', 8235
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 8236
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 8237
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 8238
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 8239
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 8240
$P2 = $P1.'isidentifier'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 8241
new $P4, [ 'ClassSpecifierId' ]
$P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_2: # endif
.annotate 'line', 8242
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8243

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8259
# Body
# {
.annotate 'line', 8261
self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8262
setattribute self, 'parent', __ARG_3
.annotate 'line', 8263
# var functions: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8264
setattribute self, 'functions', $P1
.annotate 'line', 8265
# var members: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8266
setattribute self, 'members', $P2
.annotate 'line', 8267
root_new $P13, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P13
.annotate 'line', 8268
# var constants: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8269
setattribute self, 'constants', $P3
.annotate 'line', 8271
# var name: $P4
$P4 = __ARG_2.'get'()
.annotate 'line', 8272
setattribute self, 'name', $P4
.annotate 'line', 8273
# var classns: $P5
$P12 = __ARG_3.'getpath'()
# predefined clone
clone $P5, $P12
.annotate 'line', 8274
getattribute $P12, self, 'name'
# predefined push
push $P5, $P12
.annotate 'line', 8275
setattribute self, 'classns', $P5
.annotate 'line', 8277
# var t: $P6
$P6 = __ARG_2.'get'()
.annotate 'line', 8278
$P12 = $P6.'isop'(':')
if_null $P12, __label_0
unless $P12 goto __label_0
# {
.annotate 'line', 8279
# var bases: $P7
getattribute $P7, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 8280
# {
.annotate 'line', 8281
# var base: $P8
$P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8282
# predefined push
push $P7, $P8
.annotate 'line', 8283
$P6 = __ARG_2.'get'()
.annotate 'line', 8284
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
.annotate 'line', 8287
'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8288
$P6 = __ARG_2.'get'()
__label_6: # for condition
$P12 = $P6.'isop'('}')
isfalse $I1, $P12
unless $I1 goto __label_5
# {
.annotate 'line', 8289
# string key: $S1
$P13 = $P6.'checkkeyword'()
null $S1
if_null $P13, __label_7
set $S1, $P13
__label_7:
.annotate 'line', 8290
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
.annotate 'line', 8292
# var f: $P9
new $P9, [ 'MethodStatement' ]
$P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8293
# predefined push
push $P1, $P9
goto __label_8 # break
__label_11: # case
.annotate 'line', 8296
# var name: $P10
$P10 = __ARG_2.'get'()
.annotate 'line', 8297
$P12 = $P10.'isidentifier'()
isfalse $I1, $P12
unless $I1 goto __label_13
.annotate 'line', 8298
'Expected'("member identifier", $P10)
__label_13: # endif
.annotate 'line', 8299
# predefined push
push $P2, $P10
.annotate 'line', 8300
$P6 = __ARG_2.'get'()
.annotate 'line', 8301
$P13 = $P6.'isop'(';')
isfalse $I2, $P13
unless $I2 goto __label_14
.annotate 'line', 8302
'Expected'("';' in member declaration", $P6)
__label_14: # endif
goto __label_8 # break
__label_12: # case
.annotate 'line', 8305
# var cst: $P11
$P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8306
# predefined push
push $P3, $P11
goto __label_8 # break
__label_9: # default
.annotate 'line', 8309
'SyntaxError'("Unexpected item in class", $P6)
__label_8: # switch end
# }
__label_4: # for iteration
.annotate 'line', 8288
$P6 = __ARG_2.'get'()
goto __label_6
__label_5: # for end
# }
.annotate 'line', 8312

.end # ClassStatement


.sub 'getpath' :method

.annotate 'line', 8313
# Body
# {
.annotate 'line', 8315
getattribute $P1, self, 'classns'
.return($P1)
# }
.annotate 'line', 8316

.end # getpath


.sub 'generatesubid' :method

.annotate 'line', 8317
# Body
# {
.annotate 'line', 8319
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8320

.end # generatesubid


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8321
# Body
# {
.annotate 'line', 8323
getattribute $P1, self, 'parent'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8324

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8325
# Body
# {
.annotate 'line', 8327
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8328

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8329
# Body
# {
.annotate 'line', 8331
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8332

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8333
# Body
# {
.annotate 'line', 8335
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8336

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 8337
# Body
# {
.annotate 'line', 8339
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 8340
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 8341
.return(self)
# }
.annotate 'line', 8342

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 8343
# Body
# {
.annotate 'line', 8345
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8346

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8347
# Body
# {
.annotate 'line', 8349
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 8350
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 8351
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 8352
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 8354
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8356
$P5 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P5)
.annotate 'line', 8357
# int n: $I1
set $I1, 1
.annotate 'line', 8358
getattribute $P5, self, 'bases'
iter $P7, $P5
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8359
$P3.'annotate'(__ARG_1)
.annotate 'line', 8360
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 8361
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 8362
getattribute $P5, self, 'parent'
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8363
__ARG_1.'say'()
.annotate 'line', 8364
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 8366
getattribute $P5, self, 'members'
iter $P8, $P5
set $P8, 0
__label_4: # for iteration
unless $P8 goto __label_5
shift $P4, $P8
# {
.annotate 'line', 8367
__ARG_1.'annotate'($P4)
.annotate 'line', 8368
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 8371
__ARG_1.'say'('.end')
# }
.annotate 'line', 8372

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8249
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
get_class $P2, [ 'VarContainer' ]
addparent $P0, $P2
.annotate 'line', 8251
addattribute $P0, 'parent'
.annotate 'line', 8252
addattribute $P0, 'name'
.annotate 'line', 8253
addattribute $P0, 'bases'
.annotate 'line', 8254
addattribute $P0, 'constants'
.annotate 'line', 8255
addattribute $P0, 'functions'
.annotate 'line', 8256
addattribute $P0, 'members'
.annotate 'line', 8257
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8379
# Body
# {
.annotate 'line', 8381
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8382
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 8383
'Expected'('literal string', $P1)
__label_0: # endif
.annotate 'line', 8384
'ExpectOp'(';', __ARG_2)
.annotate 'line', 8385
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 8386
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8391
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 8392
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 8393
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 8394
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 8395
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 8396
# try: create handler
new $P9, 'ExceptionHandler'
set_label $P9, __label_4
push_eh $P9
# try: begin
# {
.annotate 'line', 8397
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 8398
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 8396
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
.annotate 'line', 8403
$P9 = $P5.'is_closed'()
if_null $P9, __label_6
unless $P9 goto __label_6
.annotate 'line', 8404
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 8409
load_bytecode 'PGE.pbc'
.annotate 'line', 8410
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 8411
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 8413
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
.annotate 'line', 8414
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8415
$P8 = $P7($S4)
.annotate 'line', 8416
# predefined elements
elements $I2, $P8
le $I2, 0, __label_11
# {
.annotate 'line', 8417
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 8418
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 8419
# int ivalue: $I1
null $I1
.annotate 'line', 8420
# predefined substr
substr $S7, $S6, 0, 2
iseq $I2, $S7, '0x'
if $I2 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I2, $S8, '0X'
__label_14:
unless $I2 goto __label_12
.annotate 'line', 8421
# predefined substr
substr $S9, $S6, 2
box $P11, $S9
$P9 = $P11.'to_int'(16)
set $I1, $P9
goto __label_13
__label_12: # else
.annotate 'line', 8423
set $I1, $S6
__label_13: # endif
.annotate 'line', 8426
new $P12, [ 'TokenInteger' ]
getattribute $P13, __ARG_1, 'file'
getattribute $P14, __ARG_1, 'line'
$P12.'TokenInteger'($P13, $P14, $S5)
set $P11, $P12
.annotate 'line', 8425
$P9 = 'integerValue'(__ARG_3, $P11, $I1)
.annotate 'line', 8424
__ARG_3.'createconst'($S5, 'I', $P9, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 8413
$P9 = $P5.'readline'()
set $S4, $P9
goto __label_9
__label_8: # for end
.annotate 'line', 8430
$P5.'close'()
# }
.annotate 'line', 8431

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 8444
# Body
# {
.annotate 'line', 8446
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 8447
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 8448
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P2
.annotate 'line', 8449
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P2
# }
.annotate 'line', 8450

.end # init


.sub 'getpath' :method

.annotate 'line', 8451
# Body
# {
.annotate 'line', 8453
getattribute $P1, self, 'nspath'
.return($P1)
# }
.annotate 'line', 8454

.end # getpath


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 8455
# Body
# {
.annotate 'line', 8457
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 8458
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 8459
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 8460
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 8461
.return($P4)
# }
.annotate 'line', 8462

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 8463
# Body
# {
.annotate 'line', 8467
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
.annotate 'line', 8469
.return($P5)
__label_3: # case
.annotate 'line', 8472
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 8477
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 8478
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 8479
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 8480
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 8481
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 8482
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8483
if_null $P4, __label_8
.annotate 'line', 8484
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 8488
.return($P5)
# }
.annotate 'line', 8489

.end # findclasskey_base


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8490
# Body
# {
.annotate 'line', 8494
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
.annotate 'line', 8496
.return($P7)
__label_3: # case
.annotate 'line', 8498
# string name: $S1
$S1 = __ARG_1[0]
.annotate 'line', 8500
# var sym: $P1
$P1 = self.'checkclass_base'($S1)
.annotate 'line', 8501
if_null $P1, __label_4
.annotate 'line', 8502
.return($P1)
__label_4: # endif
.annotate 'line', 8503
getattribute $P8, self, 'functions'
iter $P9, $P8
set $P9, 0
__label_5: # for iteration
unless $P9 goto __label_6
shift $P2, $P9
.annotate 'line', 8504
getattribute $P10, $P2, 'name'
set $S3, $P10
ne $S3, $S1, __label_7
.annotate 'line', 8505
.return($P2)
__label_7: # endif
goto __label_5
__label_6: # endfor
null $P11
.annotate 'line', 8506
.return($P11)
__label_1: # default
.annotate 'line', 8511
# var namespaces: $P3
getattribute $P3, self, 'namespaces'
.annotate 'line', 8512
# var childkey: $P4
# predefined clone
clone $P4, __ARG_1
.annotate 'line', 8513
# string basename: $S2
$P12 = $P4.'shift'()
null $S2
if_null $P12, __label_8
set $S2, $P12
__label_8:
.annotate 'line', 8514
iter $P13, $P3
set $P13, 0
__label_9: # for iteration
unless $P13 goto __label_10
shift $P5, $P13
# {
.annotate 'line', 8515
getattribute $P14, $P5, 'name'
set $S4, $P14
ne $S4, $S2, __label_11
# {
.annotate 'line', 8516
# var found: $P6
$P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8517
if_null $P6, __label_12
.annotate 'line', 8518
.return($P6)
__label_12: # endif
# }
__label_11: # endif
# }
goto __label_9
__label_10: # endfor
__label_0: # switch end
null $P7
.annotate 'line', 8522
.return($P7)
# }
.annotate 'line', 8523

.end # findsymbol


.sub 'parsenamespace' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8524
# Body
# {
.annotate 'line', 8526
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8527
# string name: $S1
set $P4, $P1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 8528
$P1 = __ARG_2.'get'()
.annotate 'line', 8530
# var modifier: $P2
null $P2
.annotate 'line', 8531
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 8532
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 8533
$P1 = __ARG_2.'get'()
# }
__label_1: # endif
.annotate 'line', 8536
'RequireOp'('{', $P1)
.annotate 'line', 8537
# var child: $P3
new $P3, [ 'NamespaceStatement' ]
$P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8538
getattribute $P4, self, 'namespaces'
# predefined push
push $P4, $P3
.annotate 'line', 8539
getattribute $P4, self, 'items'
# predefined push
push $P4, $P3
.annotate 'line', 8540
$P3.'parse'(__ARG_2)
# }
.annotate 'line', 8541

.end # parsenamespace


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8542
# Body
# {
.annotate 'line', 8544
# var items: $P1
getattribute $P1, self, 'items'
.annotate 'line', 8545
# var functions: $P2
getattribute $P2, self, 'functions'
.annotate 'line', 8546
# var classes: $P3
getattribute $P3, self, 'classes'
.annotate 'line', 8547
# var t: $P4
null $P4
# for loop
.annotate 'line', 8548
$P4 = __ARG_1.'get'()
__label_2: # for condition
set $I1, $P4
unless $I1 goto __label_3
$P8 = $P4.'isop'('}')
isfalse $I1, $P8
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 8550
# string key: $S1
$P9 = $P4.'checkkeyword'()
null $S1
if_null $P9, __label_4
set $S1, $P9
__label_4:
.annotate 'line', 8551
set $S3, $S1
set $S4, 'namespace'
if $S3 == $S4 goto __label_7
set $S4, 'const'
if $S3 == $S4 goto __label_8
set $S4, 'function'
if $S3 == $S4 goto __label_9
set $S4, 'class'
if $S3 == $S4 goto __label_10
set $S4, 'using'
if $S3 == $S4 goto __label_11
set $S4, '$include_const'
if $S3 == $S4 goto __label_12
set $S4, '$load'
if $S3 == $S4 goto __label_13
set $S4, '$loadlib'
if $S3 == $S4 goto __label_14
goto __label_6
# switch
__label_7: # case
.annotate 'line', 8553
self.'parsenamespace'($P4, __ARG_1)
goto __label_5 # break
__label_8: # case
.annotate 'line', 8556
# var cst: $P5
$P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8557
# predefined push
push $P1, $P5
goto __label_5 # break
__label_9: # case
.annotate 'line', 8560
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8561
# predefined push
push $P2, $P6
.annotate 'line', 8562
# predefined push
push $P1, $P6
goto __label_5 # break
__label_10: # case
.annotate 'line', 8565
# var c: $P7
new $P7, [ 'ClassStatement' ]
$P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8566
# predefined push
push $P3, $P7
.annotate 'line', 8567
# predefined push
push $P1, $P7
goto __label_5 # break
__label_11: # case
.annotate 'line', 8570
$P4 = __ARG_1.'get'()
.annotate 'line', 8571
$P8 = $P4.'iskeyword'('extern')
isfalse $I1, $P8
unless $I1 goto __label_15
.annotate 'line', 8572
'SyntaxError'('Unsupported at namespace level', $P4)
__label_15: # endif
.annotate 'line', 8573
$P4 = __ARG_1.'get'()
.annotate 'line', 8574
$P9 = $P4.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_16
.annotate 'line', 8575
'Expected'('string literal', $P4)
__label_16: # endif
.annotate 'line', 8576
# string reqlib: $S2
set $P10, $P4
null $S2
if_null $P10, __label_17
set $S2, $P10
__label_17:
.annotate 'line', 8577
self.'addlib'($S2)
.annotate 'line', 8578
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_12: # case
.annotate 'line', 8581
'include_parrot'($P4, __ARG_1, self)
goto __label_5 # break
__label_13: # case
.annotate 'line', 8584
$P4 = __ARG_1.'get'()
.annotate 'line', 8585
$P11 = $P4.'isstring'()
isfalse $I3, $P11
unless $I3 goto __label_18
.annotate 'line', 8586
'Expected'('string literal', $P4)
__label_18: # endif
.annotate 'line', 8587
'ExpectOp'(';', __ARG_1)
.annotate 'line', 8588
new $P14, [ 'StringLiteral' ]
$P14.'StringLiteral'(self, $P4)
set $P13, $P14
$P12 = $P13.'getPirString'()
self.'addload'($P12)
goto __label_5 # break
__label_14: # case
.annotate 'line', 8591
$P4 = __ARG_1.'get'()
.annotate 'line', 8592
$P15 = $P4.'isstring'()
isfalse $I4, $P15
unless $I4 goto __label_19
.annotate 'line', 8593
'Expected'('string literal', $P4)
__label_19: # endif
.annotate 'line', 8594
'ExpectOp'(';', __ARG_1)
.annotate 'line', 8595
new $P18, [ 'StringLiteral' ]
$P18.'StringLiteral'(self, $P4)
set $P17, $P18
$P16 = $P17.'getPirString'()
self.'addlib'($P16)
goto __label_5 # break
__label_6: # default
.annotate 'line', 8598
'SyntaxError'("Unexpected token", $P4)
__label_5: # switch end
# }
__label_0: # for iteration
.annotate 'line', 8548
$P4 = __ARG_1.'get'()
goto __label_2
__label_1: # for end
.annotate 'line', 8601
if_null $P4, __label_20
unless $P4 goto __label_20
.annotate 'line', 8602
self.'close_ns'($P4)
goto __label_21
__label_20: # else
.annotate 'line', 8604
self.'unclosed_ns'()
__label_21: # endif
# }
.annotate 'line', 8605

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 8606
# Body
# {
.annotate 'line', 8608
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 8609

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 8610
# Body
# {
.annotate 'line', 8612
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 8613
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 8615
# int activate: $I1
set $I1, 1
.annotate 'line', 8616
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 8617
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 8618
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
.annotate 'line', 8619
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 8621
unless $I1 goto __label_6
# {
.annotate 'line', 8622
__ARG_1.'say'($S1)
.annotate 'line', 8623
null $I1
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 8625
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 8627

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8435
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 8437
addattribute $P0, 'nspath'
.annotate 'line', 8438
addattribute $P0, 'namespaces'
.annotate 'line', 8439
addattribute $P0, 'classes'
.annotate 'line', 8440
addattribute $P0, 'functions'
.annotate 'line', 8441
addattribute $P0, 'items'
.annotate 'line', 8442
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 8642
# Body
# {
.annotate 'line', 8645
# var nspath: $P1
$P2 = __ARG_1.'getpath'()
# predefined clone
clone $P1, $P2
.annotate 'line', 8646
# predefined push
push $P1, __ARG_3
.annotate 'line', 8647
setattribute self, 'nspath', $P1
.annotate 'line', 8649
setattribute self, 'parent', __ARG_1
.annotate 'line', 8650
setattribute self, 'start', __ARG_2
.annotate 'line', 8651
setattribute self, 'owner', __ARG_1
.annotate 'line', 8652
box $P2, __ARG_3
setattribute self, 'name', $P2
.annotate 'line', 8653
setattribute self, 'modifier', __ARG_4
.annotate 'line', 8654
if_null __ARG_4, __label_0
# {
.annotate 'line', 8655
$P2 = __ARG_4.'pick'('HLL')
if_null $P2, __label_1
.annotate 'line', 8656
getattribute $P4, self, 'name'
setattribute self, 'hll', $P4
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 8658

.end # NamespaceStatement


.sub 'dowarnings' :method

.annotate 'line', 8659
# Body
# {
.annotate 'line', 8661
getattribute $P1, self, 'parent'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8662

.end # dowarnings


.sub 'generatesubid' :method

.annotate 'line', 8663
# Body
# {
.annotate 'line', 8665
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8666

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8667
# Body
# {
.annotate 'line', 8669
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8670

.end # use_predef


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8671
# Body
# {
.annotate 'line', 8673
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8674

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8675
# Body
# {
.annotate 'line', 8677
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 8678

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8679
# Body
# {
.annotate 'line', 8681
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8682
unless_null $P1, __label_0
.annotate 'line', 8683
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 8685
.return($P1)
__label_1: # endif
# }
.annotate 'line', 8686

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8687
# Body
# {
.annotate 'line', 8691
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8692
unless_null $P1, __label_0
.annotate 'line', 8693
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 8694
.return($P1)
# }
.annotate 'line', 8695

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8696
# Body
# {
.annotate 'line', 8698
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8699

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8700
# Empty body

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8704
# Body
# {
.annotate 'line', 8706
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 8707
if_null $P1, __label_0
# {
.annotate 'line', 8708
$P1 = $P1.'optimize'()
.annotate 'line', 8709
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 8711
self.'optimize_base'()
.annotate 'line', 8712
.return(self)
# }
.annotate 'line', 8713

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8714
# Body
# {
.annotate 'line', 8716
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 8717
if_null $P1, __label_0
.annotate 'line', 8718
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 8720
self.'emit_base'(__ARG_1)
.annotate 'line', 8722
if_null $P1, __label_1
.annotate 'line', 8723
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 8724

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8634
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8636
addattribute $P0, 'parent'
.annotate 'line', 8637
addattribute $P0, 'start'
.annotate 'line', 8638
addattribute $P0, 'name'
.annotate 'line', 8639
addattribute $P0, 'modifier'
.annotate 'line', 8640
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
.param pmc __ARG_1

.annotate 'line', 8739
# Body
# {
.annotate 'line', 8741
# string nspath: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8742
setattribute self, 'nspath', $P1
.annotate 'line', 8743
setattribute self, 'unit', __ARG_1
.annotate 'line', 8744
root_new $P3, ['parrot';'Hash']
setattribute self, 'predefs_used', $P3
.annotate 'line', 8745
box $P2, 0
setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8746

.end # RootNamespace


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8747
# Body
# {
.annotate 'line', 8749
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8750
$P1[__ARG_1] = 1
# }
.annotate 'line', 8751

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 8752
# Body
# {
.annotate 'line', 8754
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8755
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 8756

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 8758
# Body
# {
.annotate 'line', 8760
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 8761
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 8762
inc $I1
.annotate 'line', 8763
assign $P1, $I1
.annotate 'line', 8764
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 8765
.return($S1)
# }
.annotate 'line', 8766

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8768
# Body
# {
.annotate 'line', 8770
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 8771
unless_null $P1, __label_0
# {
.annotate 'line', 8772
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8773
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 8775
$P1[__ARG_1] = 1
# }
.annotate 'line', 8776

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8777
# Body
# {
.annotate 'line', 8779
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 8780
unless_null $P1, __label_0
# {
.annotate 'line', 8781
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8782
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 8784
$P1[__ARG_1] = 1
# }
.annotate 'line', 8785

.end # addload


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8786
# Body
# {
.annotate 'line', 8788
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8789

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8790
# Body
# {
.annotate 'line', 8793
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8794

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8795
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8799
# Body
# {
.annotate 'line', 8801
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8802

.end # close_ns


.sub 'dowarnings' :method

.annotate 'line', 8803
# Body
# {
.annotate 'line', 8805
getattribute $P1, self, 'unit'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8806

.end # dowarnings


.sub 'optimize' :method

.annotate 'line', 8807
# Body
# {
.annotate 'line', 8809
self.'optimize_base'()
.annotate 'line', 8810
.return(self)
# }
.annotate 'line', 8811

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8812
# Body
# {
.annotate 'line', 8814
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8817
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 8818
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 8821
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
.annotate 'line', 8824
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8825
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8826
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8827
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8830
# int somelib: $I1
null $I1
.annotate 'line', 8831
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8832
if_null $P3, __label_4
# {
.annotate 'line', 8833
set $I1, 1
.annotate 'line', 8834
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8835
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8838
# int someload: $I2
null $I2
.annotate 'line', 8839
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8840
if_null $P4, __label_7
# {
.annotate 'line', 8841
set $I2, 1
.annotate 'line', 8842
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8843
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8844
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8845
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
.annotate 'line', 8847
or $I3, $I1, $I2
unless $I3 goto __label_10
.annotate 'line', 8848
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8850
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8851

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8731
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8733
addattribute $P0, 'unit'
.annotate 'line', 8734
addattribute $P0, 'predefs_used'
.annotate 'line', 8735
addattribute $P0, 'libs'
.annotate 'line', 8736
addattribute $P0, 'loads'
.annotate 'line', 8737
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable

.annotate 'line', 8865
# Body
# {
.annotate 'line', 8867
box $P3, 1
setattribute self, 'warnings', $P3
.annotate 'line', 8868
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
$P1.'RootNamespace'(self)
.annotate 'line', 8871
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8875
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8874
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8873
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8879
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8878
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8877
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8885
new $P4, [ 'StringLiteral' ]
.annotate 'line', 8886
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
.annotate 'line', 8884
$P1.'createconst'('__STAGE__', 'S', $P3, '')
.annotate 'line', 8889
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8890

.end # init


.sub 'setwarnmode' :method
.param int __ARG_1

.annotate 'line', 8891
# Body
# {
.annotate 'line', 8893
getattribute $P1, self, 'warnings'
assign $P1, __ARG_1
# }
.annotate 'line', 8894

.end # setwarnmode


.sub 'dowarnings' :method

.annotate 'line', 8895
# Body
# {
# predefined int
.annotate 'line', 8897
getattribute $P1, self, 'warnings'
set $I1, $P1
.return($I1)
# }
.annotate 'line', 8898

.end # dowarnings


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8899
# Body
# {
.annotate 'line', 8901
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8902

.end # parse


.sub 'optimize' :method

.annotate 'line', 8903
# Body
# {
.annotate 'line', 8905
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8906

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8907
# Body
# {
.annotate 'line', 8909
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8910
__ARG_1.'say'('')
.annotate 'line', 8912
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8914
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8915

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 8862
addattribute $P0, 'rootns'
.annotate 'line', 8863
addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8922
# Body
# {
.annotate 'line', 8924
set $S2, __ARG_2
ne $S2, 'parse', __label_0
.annotate 'line', 8925
.return(__ARG_1)
__label_0: # endif
.annotate 'line', 8926
# var handleout: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8927
$P1.'open'('__eval__', 'w')
.annotate 'line', 8928
# var emit: $P2
new $P2, [ 'Emit' ]
.annotate 'line', 8929
if_null __ARG_3, __label_1
unless __ARG_3 goto __label_1
.annotate 'line', 8930
$P2.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8931
$P2.'initialize'($P1)
.annotate 'line', 8932
__ARG_1.'emit'($P2)
.annotate 'line', 8933
$P2.'close'()
.annotate 'line', 8934
$P1.'close'()
.annotate 'line', 8935
# string pircode: $S1
$P5 = $P1.'read'(0)
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 8936
# var object: $P3
null $P3
.annotate 'line', 8937
set $S2, __ARG_2
set $S3, 'pir'
if $S2 == $S3 goto __label_5
set $S3, 'pbc'
if $S2 == $S3 goto __label_6
set $S3, ''
if $S2 == $S3 goto __label_7
goto __label_4
# switch
__label_5: # case
.annotate 'line', 8939
new $P3, [ 'String' ]
.annotate 'line', 8940
assign $P3, $S1
goto __label_3 # break
__label_6: # case
__label_7: # case
.annotate 'line', 8944
# var pircomp: $P4
# predefined compreg
compreg $P4, 'PIR'
.annotate 'line', 8945
$P3 = $P4($S1)
goto __label_3 # break
__label_4: # default
.annotate 'line', 8946
# predefined die
.annotate 'line', 8948
die 'Invalid target'
__label_3: # switch end
.annotate 'line', 8950
.return($P3)
# }
.annotate 'line', 8951

.end # __private_compile_tail


.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8952
# Body
# {
.annotate 'line', 8957
unless_null __ARG_2, __label_0
.annotate 'line', 8958
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8959
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8960
$P1.'open'('__eval__', 'w')
.annotate 'line', 8961
$P1.'puts'(__ARG_1)
.annotate 'line', 8962
$P1.'close'()
.annotate 'line', 8963
$P1.'open'('__eval__', 'r')
.annotate 'line', 8964
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8965
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8966
unless __ARG_4 goto __label_1
.annotate 'line', 8967
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 8968
$P3.'parse'($P2)
.annotate 'line', 8969
$P1.'close'()
.annotate 'line', 8970
$P3.'optimize'()
.annotate 'line', 8971
.tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 8972

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8973
# Body
# {
.annotate 'line', 8977
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8978
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8979
$P1.'encoding'('utf8')
.annotate 'line', 8980
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8981
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8982
unless __ARG_4 goto __label_0
.annotate 'line', 8983
$P3.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8984
$P3.'parse'($P2)
.annotate 'line', 8985
$P1.'close'()
.annotate 'line', 8986
$P3.'optimize'()
.annotate 'line', 8987
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8988
unless __ARG_3 goto __label_1
.annotate 'line', 8989
$P4.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8990
$P4.'initialize'(__ARG_2)
.annotate 'line', 8991
$P3.'emit'($P4)
.annotate 'line', 8992
$P4.'close'()
# }
.annotate 'line', 8993

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8994
# Body
# {
.annotate 'line', 8999
unless_null __ARG_2, __label_0
.annotate 'line', 9000
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 9001
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 9002
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 9003
$P1.'encoding'('utf8')
.annotate 'line', 9004
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9005
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9006
unless __ARG_4 goto __label_1
.annotate 'line', 9007
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 9008
$P3.'parse'($P2)
.annotate 'line', 9009
$P1.'close'()
.annotate 'line', 9010
$P3.'optimize'()
.annotate 'line', 9011
.tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9012

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

.annotate 'line', 9017
# Body
# {
.annotate 'line', 9019
# var winxed: $P1
new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9020
not $I1, __ARG_3
unless $I1 goto __label_0
.annotate 'line', 9021
$P1.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 9022
$P1.'parse'(__ARG_1)
.annotate 'line', 9024
$P1.'optimize'()
.annotate 'line', 9026
# var handle: $P2
null $P2
.annotate 'line', 9027
ne __ARG_2, '-', __label_1
.annotate 'line', 9028
# predefined getstdout
getstdout $P2
goto __label_2
__label_1: # else
.annotate 'line', 9030
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_2: # endif
.annotate 'line', 9031
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 9032
unless __ARG_4 goto __label_3
.annotate 'line', 9033
$P3.'disable_annotations'()
__label_3: # endif
.annotate 'line', 9034
$P3.'initialize'($P2)
.annotate 'line', 9035
$P1.'emit'($P3)
.annotate 'line', 9036
$P3.'close'()
.annotate 'line', 9037
$P2.'close'()
# }
.annotate 'line', 9038

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 9044
# Body
# {
.annotate 'line', 9046
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9047
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 9048

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
.param pmc __ARG_1

.annotate 'line', 9055
# Body
# {
.annotate 'line', 9057
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9058
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9059
$P1.'notOptStop'(1)
.annotate 'line', 9060
$P1.'push_string'('o=s')
.annotate 'line', 9061
$P1.'push_string'('e=s')
.annotate 'line', 9062
$P1.'push_string'('noan')
.annotate 'line', 9063
$P1.'push_string'('nowarn')
.annotate 'line', 9064
$P1.'notOptStop'(1)
.annotate 'line', 9065
__ARG_1.'shift'()
.annotate 'line', 9066
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9067
setattribute self, 'getopts', $P1
.annotate 'line', 9068
setattribute self, 'opts', $P2
# }
.annotate 'line', 9069

.end # Options


.sub 'getbool' :method
.param string __ARG_1

.annotate 'line', 9070
# Body
# {
.annotate 'line', 9072
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 9073
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 9074
isnull $I1, $P2
not $I1
.return($I1)
# }
.annotate 'line', 9075

.end # getbool


.sub 'getstring' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 9076
# Body
# {
.annotate 'line', 9078
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 9079
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 9080
if_null $P2, __label_1
# predefined string
set $S1, $P2
goto __label_0
__label_1:
set $S1, __ARG_2
__label_0:
.return($S1)
# }
.annotate 'line', 9081

.end # getstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Options' ]
.annotate 'line', 9052
addattribute $P0, 'getopts'
.annotate 'line', 9053
addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 9084
# Body
# {
.annotate 'line', 9086
# var options: $P1
new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1)
.annotate 'line', 9087
# string outputfile: $S1
$P4 = $P1.'getstring'('o', '')
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 9088
# string expr: $S2
$P4 = $P1.'getstring'('e')
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 9089
# int noan: $I1
$P4 = $P1.'getbool'('noan')
set $I1, $P4
.annotate 'line', 9090
# int warn: $I2
$P4 = $P1.'getbool'('nowarn')
isfalse $I2, $P4
.annotate 'line', 9092
# int argc: $I3
set $P4, __ARG_1
set $I3, $P4
.annotate 'line', 9093
# string filename: $S3
null $S3
.annotate 'line', 9094
# var file: $P2
null $P2
.annotate 'line', 9095
unless_null $S2, __label_2
# {
.annotate 'line', 9096
ne $I3, 0, __label_4
# predefined Error
.annotate 'line', 9097
root_new $P4, ['parrot';'Exception']
$P4['message'] = 'No file'
throw $P4
__label_4: # endif
.annotate 'line', 9099
$S3 = __ARG_1[0]
.annotate 'line', 9100
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'($S3)
.annotate 'line', 9101
$P2.'encoding'('utf8')
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 9104
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 9105
new $P2, [ 'StringHandle' ]
.annotate 'line', 9106
$P2.'open'('__eval__', 'w')
.annotate 'line', 9107
$P2.'puts'($S2)
.annotate 'line', 9108
$P2.'close'()
.annotate 'line', 9109
$P2.'open'('__eval__')
.annotate 'line', 9110
set $S3, '__eval__'
# }
__label_3: # endif
.annotate 'line', 9113
# var t: $P3
new $P3, [ 'Tokenizer' ]
$P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9115
'winxed_parser'($P3, $S1, $I2, $I1)
.annotate 'line', 9117
$P2.'close'()
# }
.annotate 'line', 9118

.end # stage1


.sub 'show_backtrace'
.param pmc __ARG_1

.annotate 'line', 9120
# Body
# {
.annotate 'line', 9122
# int i: $I1
set $I1, 1
.annotate 'line', 9123
iter $P4, __ARG_1
set $P4, 0
__label_0: # for iteration
unless $P4 goto __label_1
shift $P1, $P4
# {
.annotate 'line', 9124
# var sub: $P2
$P2 = $P1['sub']
.annotate 'line', 9125
# string subname: $S1
null $S1
.annotate 'line', 9126
if_null $P2, __label_2
# {
.annotate 'line', 9127
set $S1, $P2
.annotate 'line', 9128
# string ns: $S2
$P5 = $P2.'get_namespace'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 9129
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
.annotate 'line', 9131
# var ann: $P3
$P3 = $P1['annotations']
.annotate 'line', 9132
# string file: $S3
$S3 = $P3['file']
.annotate 'line', 9133
eq $S3, '', __label_6
# {
.annotate 'line', 9134
# int line: $I2
$I2 = $P3['line']
.annotate 'line', 9135
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
.annotate 'line', 9138

.end # show_backtrace


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 9140
# Body
# {
.annotate 'line', 9142
# int retval: $I1
null $I1
.annotate 'line', 9143
# try: create handler
new $P2, 'ExceptionHandler'
set_label $P2, __label_0
$P2.'min_severity'(2)
$P2.'max_severity'(2)
$P2.'handle_types'(555, 556, 557)
push_eh $P2
# try: begin
.annotate 'line', 9149
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 9143
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 9152
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 9153
# int type: $I2
$I2 = $P1['type']
.annotate 'line', 9154
set $I3, $I2
set $I4, 556
if $I3 == $I4 goto __label_4
set $I4, 557
if $I3 == $I4 goto __label_5
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 9157
# predefined cry
getstderr $P0
print $P0, 'Error: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 9158
set $I1, 1
goto __label_2 # break
__label_3: # default
.annotate 'line', 9161
# predefined cry
getstderr $P0
print $P0, 'INTERNAL ERROR: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 9162
$P2 = $P1.'backtrace'()
'show_backtrace'($P2)
.annotate 'line', 9163
set $I1, 2
__label_2: # switch end
# }
# catch end
__label_1:
.annotate 'line', 9166
# predefined exit
exit $I1
# }
.annotate 'line', 9167

.end # main

# End generated code
